//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////


#include "definitions.h"

#include <string>
#include <sstream>
#include <algorithm>

#include "game.h"
#include "creature.h"
#include "npc.h"
#include "player.h"
#include "monster.h"
#include "tile.h"
#include "otsystem.h"

using namespace std;

OTSYS_THREAD_LOCKVAR AutoID::autoIDLock;
unsigned long AutoID::count = 1000;
AutoID::list_type AutoID::list;

extern Game g_game;

//Creature::Creature(const std::string& name) :
Creature::Creature() :
access(0)
{
	direction  = NORTH;
	master = NULL;
	
	lookhead   = 0;
	lookbody   = 0;
	looklegs   = 0;
	lookfeet   = 0;
	lookmaster = 0;
	looktype   = PLAYER_MALE_1;
	pzLocked = false;
	
	lookcorpse = 3128;
	
	health     = 1000;//150;
	healthmax  = 1000;//150;
	level = 0;
	mana = 0;
	manamax = 0;
	lastmove = 0;
	
	inFightTicks = 0;
	inFightTicks = 0;
	manaShieldTicks = 0;
	hasteTicks = 0;
	paralyzeTicks = 0;
	exhaustedTicks  = 0;
	pzLocked = false;
	immunities = 0;
	eventCheck = 0;
	eventCheckAttacking = 0;
	
	attackedCreature = NULL;
	speed = 220;
}

Creature::~Creature()
{
	std::list<Creature*>::iterator cit;
	for(cit = summons.begin(); cit != summons.end(); ++cit) {
		(*cit)->setAttackedCreature(NULL);
		(*cit)->setMaster(NULL);
		(*cit)->releaseThing2();
	}

	if(attackedCreature){
		attackedCreature->releaseThing2();
		attackedCreature = NULL;
	}

	//std::cout << "Creature destructor " << this->getID() << std::endl;
	summons.clear();
}

void Creature::drainHealth(int damage)
{
	health -= min(health, damage);
}

void Creature::drainMana(int damage)
{
	mana -= min(mana, damage);
}

Creature* Creature::getAttackedCreature()
{
	if(attackedCreature && !attackedCreature->isRemoved())
		return attackedCreature;
	else
		return NULL;
}

void Creature::setAttackedCreature(const Creature* creature)
{
	std::list<Creature*>::iterator cit;
	for(cit = summons.begin(); cit != summons.end(); ++cit) {
		(*cit)->setAttackedCreature(creature);
	}
	
	if(creature){
		if(attackedCreature != creature){
			if(attackedCreature)
				attackedCreature->releaseThing2();

			attackedCreature = const_cast<Creature*>(creature);
			attackedCreature->useThing2();
		}
	}
	else{
		if(attackedCreature){
			attackedCreature->releaseThing2();
			attackedCreature = NULL;
		}
	}
}

void Creature::setMaster(Creature* creature)
{
	//std::cout << "setMaster: " << this << " master=" << creature << std::endl;
	master = creature;
}

void Creature::addSummon(Creature *creature)
{
	//std::cout << "addSummon: " << this << " summon=" << creature << std::endl;
	creature->setMaster(this);
	creature->useThing2();
	summons.push_back(creature);
	
}

void Creature::removeSummon(Creature *creature)
{
	//std::cout << "removeSummon: " << this << " summon=" << creature << std::endl;
	std::list<Creature*>::iterator cit = std::find(summons.begin(), summons.end(), creature);
	if(cit != summons.end()) {
		(*cit)->setMaster(NULL);
		(*cit)->releaseThing2();
		summons.erase(cit);
	}
}

void Creature::addCondition(const CreatureCondition& condition, bool refresh)
{
	if(condition.getCondition()->attackType == ATTACK_NONE)
		return;
	
	ConditionVec &condVec = conditions[condition.getCondition()->attackType];
	
	if(refresh) {
		condVec.clear();
	}
	
	condVec.push_back(condition);
}

void Creature::addInflictedDamage(Creature* attacker, int damage)
{
	if(damage <= 0)
		return;
	
	unsigned long id = 0;
	if(attacker) {
		id = attacker->getID();
	}
	
	totaldamagelist[id].push_back(make_pair(OTSYS_TIME(), damage));
}

int Creature::getLostExperience() {
	//return (int)std::floor(((double)experience * 0.1));
	return 0;
}

int Creature::getInflicatedDamage(unsigned long id)
{
	int ret = 0;
	std::map<long, DamageList >::const_iterator tdIt = totaldamagelist.find(id);
	if(tdIt != totaldamagelist.end()) {
		for(DamageList::const_iterator dlIt = tdIt->second.begin(); dlIt != tdIt->second.end(); ++dlIt) {
			ret += dlIt->second;
		}
	}
	
	return ret;
}

int Creature::getInflicatedDamage(Creature* attacker)
{
	unsigned long id = 0;
	if(attacker) {
		id = attacker->getID();
	}
	
	return getInflicatedDamage(id);
}

int Creature::getTotalInflictedDamage()
{
	int ret = 0;
	std::map<long, DamageList >::const_iterator tdIt;
	for(tdIt = totaldamagelist.begin(); tdIt != totaldamagelist.end(); ++tdIt) {
		ret += getInflicatedDamage(tdIt->first);
	}
	
	return ret;
}

int Creature::getGainedExperience(Creature* attacker)
{
	int totaldamage = getTotalInflictedDamage();
	int attackerdamage = getInflicatedDamage(attacker);
	int lostexperience = getLostExperience();
	int gainexperience = 0;
	
	if(attackerdamage > 0 && totaldamage > 0) {
		gainexperience = (int)std::floor(((double)attackerdamage / totaldamage) * lostexperience);
	}
	
	return gainexperience;
}

std::vector<long> Creature::getInflicatedDamageCreatureList()
{
	std::vector<long> damagelist;	
	std::map<long, DamageList >::const_iterator tdIt;
	for(tdIt = totaldamagelist.begin(); tdIt != totaldamagelist.end(); ++tdIt) {
		damagelist.push_back(tdIt->first);
	}
	
	return damagelist;
}

std::string Creature::getDescription(int32_t lookDistance) const
{
	std::string str = "a creature";
	return str;
}

int Creature::getStepDuration() const
{
	int duration = 500;
	Tile* tile = g_game.getTile(getPosition().x, getPosition().y, getPosition().z);
	if(tile && tile->ground){
		int groundid = tile->ground->getID();
		uint16_t stepspeed = Item::items[groundid].speed;
		if(stepspeed != 0) {
			duration =  (1000 * stepspeed) / (getSpeed() != 0 ? getSpeed() : 220);
		}
	}
	return duration;
};

long long Creature::getSleepTicks() const
{
	long long delay = 0;
	int stepDuration = getStepDuration();
	
	if(lastmove != 0) {
		delay = (((long long)(lastmove)) + ((long long)(stepDuration))) - ((long long)(OTSYS_TIME()));
	}
	
	return delay;
}
