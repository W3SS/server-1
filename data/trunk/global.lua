dofile(getDataDir() .. 'functions.lua')

-- Storages consts
STORAGE_RUM_MACHINE = 100000

-- Booleans consts
TRUE = 1
FALSE = 0

-- Error consts
LUA_ERROR = -1
LUA_NO_ERROR = 0

CONTAINER_POSITION = 65535

-- Directions consts
NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3
SOUTHWEST = 4
SOUTHEAST = 5
NORTHWEST = 6
NORTHEAST = 7

-- World Types consts
WORLD_TYPE_NO_PVP = 1
WORLD_TYPE_PVP = 2
WORLD_TYPE_PVP_ENFORCED = 3

COMBAT_FORMULA_UNDEFINED = 0
COMBAT_FORMULA_LEVELMAGIC = 1
COMBAT_FORMULA_SKILL = 2
COMBAT_FORMULA_DAMAGE = 3

CONDITION_PARAM_OWNER = 1
CONDITION_PARAM_TICKS = 2
CONDITION_PARAM_OUTFIT = 3
CONDITION_PARAM_HEALTHGAIN = 4
CONDITION_PARAM_HEALTHTICKS = 5
CONDITION_PARAM_MANAGAIN = 6
CONDITION_PARAM_MANATICKS = 7
CONDITION_PARAM_DELAYED = 8
CONDITION_PARAM_SPEED = 9
CONDITION_PARAM_LIGHT_LEVEL = 10
CONDITION_PARAM_LIGHT_COLOR = 11
CONDITION_PARAM_SOULGAIN = 12
CONDITION_PARAM_SOULTICKS = 13
CONDITION_PARAM_MINVALUE = 14
CONDITION_PARAM_MAXVALUE = 15
CONDITION_PARAM_STARTVALUE = 16
CONDITION_PARAM_TICKINTERVAL = 17
CONDITION_PARAM_FORCEUPDATE = 18
CONDITION_PARAM_SKILL_MELEE = 19
CONDITION_PARAM_SKILL_FIST = 20
CONDITION_PARAM_SKILL_CLUB = 21
CONDITION_PARAM_SKILL_SWORD = 22
CONDITION_PARAM_SKILL_AXE = 23
CONDITION_PARAM_SKILL_DISTANCE = 24
CONDITION_PARAM_SKILL_SHIELD = 25
CONDITION_PARAM_SKILL_FISHING = 26
CONDITION_PARAM_STAT_MAXHITPOINTS = 27
CONDITION_PARAM_STAT_MAXMANAPOINTS = 28
CONDITION_PARAM_STAT_SOULPOINTS = 29
CONDITION_PARAM_STAT_MAGICPOINTS = 30
CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT = 31
CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT = 32
CONDITION_PARAM_STAT_SOULPOINTSPERCENT = 33
CONDITION_PARAM_STAT_MAGICPOINTSPERCENT = 34

COMBAT_PARAM_TYPE = 1
COMBAT_PARAM_EFFECT = 2
COMBAT_PARAM_DISTANCEEFFECT = 3
COMBAT_PARAM_BLOCKSHIELD = 4
COMBAT_PARAM_BLOCKARMOR = 5
COMBAT_PARAM_TARGETCASTERORTOPMOST = 6
COMBAT_PARAM_CREATEITEM = 7
COMBAT_PARAM_AGGRESSIVE = 8
COMBAT_PARAM_DISPEL = 9

CALLBACK_PARAM_LEVELMAGICVALUE = 1
CALLBACK_PARAM_SKILLVALUE = 2
CALLBACK_PARAM_TARGETTILE = 3
CALLBACK_PARAM_TARGETCREATURE = 4

COMBAT_NONE = 0
COMBAT_PHYSICALDAMAGE = 1
COMBAT_ENERGYDAMAGE = 2
COMBAT_POISONDAMAGE = 4 --Deprecated
COMBAT_EARTHDAMAGE = 4
COMBAT_FIREDAMAGE = 8
COMBAT_UNDEFINEDDAMAGE = 16
COMBAT_LIFEDRAIN = 32
COMBAT_MANADRAIN = 64
COMBAT_HEALING = 128
COMBAT_DROWNDAMAGE = 256
COMBAT_ICEDAMAGE = 512
COMBAT_HOLYDAMAGE = 1024
COMBAT_DEATHDAMAGE = 2048

CONDITION_NONE = 0
CONDITION_POISON = 1
CONDITION_FIRE = 2
CONDITION_ENERGY = 4
CONDITION_LIFEDRAIN = 8
CONDITION_HASTE = 16
CONDITION_PARALYZE = 32
CONDITION_OUTFIT = 64
CONDITION_INVISIBLE = 128
CONDITION_LIGHT = 256
CONDITION_MANASHIELD = 512
CONDITION_INFIGHT = 1024
CONDITION_DRUNK = 2048
CONDITION_EXHAUSTED = 4096
CONDITION_FOOD = 8192
CONDITION_REGENERATION = 8192
CONDITION_SOUL = 16384
CONDITION_DROWN = 32768
CONDITION_MUTED = 65536
CONDITION_ATTRIBUTES = 131072
CONDITION_FREEZING = 262144
CONDITION_DAZZLED = 524288
CONDITION_CURSED = 1048576

PLAYERLOSS_EXPERIENCE = 0
PLAYERLOSS_MANA = 1
PLAYERLOSS_SKILL = 2

CONST_SKILL_FIST = 0
CONST_SKILL_CLUB = 1
CONST_SKILL_SWORD = 2
CONST_SKILL_AXE = 3
CONST_SKILL_DISTANCE = 4
CONST_SKILL_SHIELDING = 5
CONST_SKILL_FISHING = 6

CONST_SLOT_HEAD = 1
CONST_SLOT_NECKLACE = 2
CONST_SLOT_BACKPACK = 3
CONST_SLOT_ARMOR = 4
CONST_SLOT_RIGHT = 5
CONST_SLOT_LEFT = 6
CONST_SLOT_LEGS = 7
CONST_SLOT_FEET = 8
CONST_SLOT_RING = 9
CONST_SLOT_AMMO = 10

CONST_ME_DRAWBLOOD = 0
CONST_ME_LOSEENERGY = 1
CONST_ME_POFF = 2
CONST_ME_BLOCKHIT = 3
CONST_ME_EXPLOSIONAREA = 4
CONST_ME_EXPLOSIONHIT = 5
CONST_ME_FIREAREA = 6
CONST_ME_YELLOW_RINGS = 7
CONST_ME_GREEN_RINGS = 8
CONST_ME_HITAREA = 9
CONST_ME_TELEPORT = 10
CONST_ME_ENERGYHIT = 11
CONST_ME_MAGIC_BLUE = 12
CONST_ME_MAGIC_RED = 13
CONST_ME_MAGIC_GREEN = 14
CONST_ME_HITBYFIRE = 15
CONST_ME_HITBYPOISON = 16
CONST_ME_MORTAREA = 17
CONST_ME_SOUND_BLUE = 18
CONST_ME_SOUND_RED = 19
CONST_ME_POISONAREA = 20
CONST_ME_SOUND_YELLOW = 21
CONST_ME_SOUND_PURPLE = 22
CONST_ME_SOUND_BLUE = 23
CONST_ME_SOUND_WHITE = 24
CONST_ME_BUBBLES = 25
CONST_ME_CRAPS = 26
CONST_ME_GIFT_WRAPS = 27
CONST_ME_FIREWORK_YELLOW = 28
CONST_ME_FIREWORK_RED = 29
CONST_ME_FIREWORK_BLUE = 30
CONST_ME_STUN = 31
CONST_ME_SLEEP = 32
CONST_ME_WATERCREATURE = 33
CONST_ME_GROUNDSHAKER = 34
CONST_ME_HEARTS = 35
CONST_ME_FIREATTACK = 36
CONST_ME_ENERGYAREA = 37
CONST_ME_SMALLCLOUDS = 38
CONST_ME_HOLYDAMAGE = 39
CONST_ME_BIGCLOUDS = 40
CONST_ME_ICEATTACK = 41
CONST_ME_ICETORNADO = 42
CONST_ME_ICEAREA = 43
CONST_ME_STONES = 44
CONST_ME_SMALLPLANTS = 45
CONST_ME_CARNIPHILA = 46
CONST_ME_PURPLEENERGY = 47
CONST_ME_YELLOWENERGY = 48
CONST_ME_HOLYAREA = 49
CONST_ME_BIGPLANTS = 50
CONST_ME_CAKE = 51
CONST_ME_GIANTICE = 52
CONST_ME_WATERSPLASH = 53
CONST_ME_PLANTATTACK = 54
CONST_ME_NONE = 255

CONST_ANI_SPEAR = 0
CONST_ANI_BOLT = 1
CONST_ANI_ARROW = 2
CONST_ANI_FIRE = 3
CONST_ANI_ENERGY = 4
CONST_ANI_POISONARROW = 5
CONST_ANI_BURSTARROW = 6
CONST_ANI_THROWINGSTAR = 7
CONST_ANI_THROWINGKNIFE = 8
CONST_ANI_SMALLSTONE = 9
CONST_ANI_SUDDENDEATH = 10
CONST_ANI_LARGEROCK = 11
CONST_ANI_SNOWBALL = 12
CONST_ANI_POWERBOLT = 13
CONST_ANI_POISON = 14
CONST_ANI_INFERNALBOLT = 15
CONST_ANI_HUNTINGSPEAR = 16
CONST_ANI_ENCHANTEDSPEAR = 17
CONST_ANI_ASSASSINSTAR = 18
CONST_ANI_GREENSTAR = 19
CONST_ANI_ROYALSPEAR = 20
CONST_ANI_SNIPERARROW = 21
CONST_ANI_ONYXARROW = 22
CONST_ANI_PIERCINGBOLT = 23
CONST_ANI_WHIRLWINDSWORD = 24
CONST_ANI_WHIRLWINDAXE = 25
CONST_ANI_WHIRLWINDCLUB = 26
CONST_ANI_ETHEREALSPEAR = 27
CONST_ANI_ICE = 28
CONST_ANI_EARTH = 29
CONST_ANI_HOLY = 30
CONST_ANI_DEATH = 31
CONST_ANI_FLASHARROW = 32
CONST_ANI_FLAMMINGARROW = 33
CONST_ANI_SHIVERARROW = 34
CONST_ANI_ENERGYBALL = 35
CONST_ANI_SMALLICE = 36
CONST_ANI_SMALLHOLY = 37
CONST_ANI_SMALLEARTH = 38
CONST_ANI_EARTHARROW = 39
CONST_ANI_EXPLOSION = 40
CONST_ANI_CAKE = 41
CONST_ANI_WEAPONTYPE = 254
CONST_ANI_NONE = 255

TALKTYPE_SAY  = 1
TALKTYPE_WHISPER = 2
TALKTYPE_YELL = 3
TALKTYPE_PRIVATE = 4
TALKTYPE_CHANNEL_Y = 5
TALKTYPE_BROADCAST = 9
TALKTYPE_CHANNEL_R1 = 10
TALKTYPE_PRIVATE_RED = 11
TALKTYPE_CHANNEL_O = 12
TALKTYPE_CHANNEL_R2 = 14
TALKTYPE_ORANGE_1 = 16
TALKTYPE_ORANGE_2 = 17

MESSAGE_STATUS_WARNING = 18
MESSAGE_EVENT_ADVANCE = 19
MESSAGE_EVENT_DEFAULT = 20
MESSAGE_STATUS_DEFAULT = 21
MESSAGE_INFO_DESCR = 22
MESSAGE_STATUS_SMALL = 23
MESSAGE_STATUS_CONSOLE_BLUE = 24
MESSAGE_STATUS_CONSOLE_RED  = 25

TEXTCOLOR_BLUE        = 5
TEXTCOLOR_LIGHTBLUE   = 35
TEXTCOLOR_LIGHTGREEN  = 30
TEXTCOLOR_PURPLE      = 83
TEXTCOLOR_LIGHTGREY   = 129
TEXTCOLOR_DARKRED     = 144
TEXTCOLOR_RED         = 180
TEXTCOLOR_ORANGE      = 198
TEXTCOLOR_YELLOW      = 210
TEXTCOLOR_WHITE_EXP   = 215
TEXTCOLOR_NONE        = 255

STACKPOS_FLOOR = 0
STACKPOS_CREATURE = 253
STACKPOS_FIELD = 254
STACKPOS_MOV_OBJECT = 255

RETURNVALUE_NOERROR = 1
RETURNVALUE_NOTPOSSIBLE = 2
RETURNVALUE_NOTENOUGHROOM = 3
RETURNVALUE_PLAYERISPZLOCKED = 4
RETURNVALUE_PLAYERISNOTINVITED = 5
RETURNVALUE_CANNOTTHROW = 6
RETURNVALUE_THEREISNOWAY = 7
RETURNVALUE_DESTINATIONOUTOFREACH = 8
RETURNVALUE_CREATUREBLOCK = 9
RETURNVALUE_NOTMOVEABLE = 10
RETURNVALUE_DROPTWOHANDEDITEM = 11
RETURNVALUE_BOTHHANDSNEEDTOBEFREE = 12
RETURNVALUE_CANONLYUSEONEWEAPON = 13
RETURNVALUE_NEEDEXCHANGE = 14
RETURNVALUE_CANNOTBEDRESSED = 15
RETURNVALUE_PUTTHISOBJECTINYOURHAND = 16
RETURNVALUE_PUTTHISOBJECTINBOTHHANDS = 17
RETURNVALUE_TOOFARAWAY = 18
RETURNVALUE_FIRSTGODOWNSTAIRS = 19
RETURNVALUE_FIRSTGOUPSTAIRS = 20
RETURNVALUE_CONTAINERNOTENOUGHROOM = 21
RETURNVALUE_NOTENOUGHCAPACITY = 22
RETURNVALUE_CANNOTPICKUP = 23
RETURNVALUE_THISISIMPOSSIBLE = 24
RETURNVALUE_DEPOTISFULL = 25
RETURNVALUE_CREATUREDOESNOTEXIST = 26
RETURNVALUE_CANNOTUSETHISOBJECT = 27
RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE = 28
RETURNVALUE_NOTREQUIREDLEVELTOUSERUNE = 29
RETURNVALUE_YOUAREALREADYTRADING = 30
RETURNVALUE_THISPLAYERISALREADYTRADING = 31
RETURNVALUE_YOUMAYNOTLOGOUTDURINGAFIGHT = 32
RETURNVALUE_DIRECTPLAYERSHOOT = 33
RETURNVALUE_NOTENOUGHLEVEL = 34
RETURNVALUE_NOTENOUGHMAGICLEVEL = 35
RETURNVALUE_NOTENOUGHMANA = 36
RETURNVALUE_NOTENOUGHSOUL = 37
RETURNVALUE_YOUAREEXHAUSTED = 38
RETURNVALUE_PLAYERISNOTREACHABLE = 39
RETURNVALUE_CANONLYUSETHISRUNEONCREATURES = 40
RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE = 41
RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER = 42
RETURNVALUE_YOUMAYNOTATTACKAPERSONINPROTECTIONZONE = 43
RETURNVALUE_YOUMAYNOTATTACKAPERSONWHILEINPROTECTIONZONE = 44
RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE = 45
RETURNVALUE_YOUCANONLYUSEITONCREATURES = 46
RETURNVALUE_CREATUREISNOTREACHABLE = 47
RETURNVALUE_TURNSECUREMODETOATTACKUNMARKEDPLAYERS = 48

closedDoors = {1209, 1210, 1212, 1213, 1219, 1221, 1231, 1232, 1234, 1235, 1237, 1239, 1249, 1250, 1252, 1253, 1539, 1541, 3535, 3536, 3538, 3544, 3545, 3547, 4913, 4914, 4916, 4917, 5082, 5084, 5098, 5099, 5101, 5107, 5108, 5110, 5116, 5117, 5119, 5125, 5126, 5128, 5134, 5135, 5137, 5138, 5140, 5141, 5143, 5144, 5278, 5279, 5281, 5282, 5284, 5286, 5515, 5517, 5732, 5733, 5735, 5736, 6192, 6193, 6195, 6196, 6198, 6200, 6249, 6250, 6252, 6253, 6255, 6257, 6795, 6797, 6799, 6801, 6891, 6892, 6894, 6900, 6901, 6903, 7033, 7034, 7036, 7042, 7043, 7045, 7054, 7056}
openDoors = {1211, 1211, 1214, 1214, 1220, 1222, 1233, 1233, 1236, 1236, 1238, 1240, 1251, 1251, 1254, 1254, 1540, 1542, 3537, 3537, 3539, 3546, 3546, 3548, 4915, 4915, 4918, 4918, 5083, 5085, 5100, 5100, 5102, 5109, 5109, 5111, 5118, 5118, 5120, 5127, 5127, 5129, 5136, 5136, 5139, 5139, 5142, 5142, 5145, 5145, 5280, 5280, 5283, 5283, 5285, 5287, 5516, 5518, 5734, 5734, 5737, 5737, 6194, 6194, 6197, 6197, 6199, 6201, 6251, 6251, 6254, 6254, 6256, 6258, 6796, 6798, 6800, 6802, 6893, 6893, 6895, 6902, 6902, 6904, 7035, 7035, 7037, 7044, 7044, 7046, 7055, 7057}
verticalOpenDoors = {1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131, 5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044, 7046, 7048, 7050, 7055}
horizontalOpenDoors = {1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118, 5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893, 6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057}
questDoors = {1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049}
levelDoors = {1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047}
keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092}

