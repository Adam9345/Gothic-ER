// ************************************************************************************************
// Wert von Tiertroph�en
// ************************************************************************************************

// FIXME: welche Troph�e wann freigeschaltet? Wert tunen!
const int	Value_Z�hne				=	4;
const int	Value_Krallen			=	4;

const int	Value_Wolfsfell			=	6;
const int	Value_Orkhundfell		=	10;

const int	Value_Panzerplatte		=	30;
const int	Value_Crawlerzangen		=	5;

const int	Value_Shadowbeastfell	=	75;

const int	Value_Lurkerklaue		=	9;
const int	Value_Lurkerhaut		=	13;

const int	Value_Sumpfhaihaut		=	140;

const int	Value_Trollfell			=	150;

// Bloodfly
const int	Value_Fl�gel			=	5;
const int	Value_Stachel			=	10;

// Durch Ulu-Mulu freigeschaltet
// bei Auftragsvergabe werden je 3 neue Monster gespawnt
const int	Value_Feuerzunge		=	500;
const int	Value_Sumpfhaiz�hne		=	500;
const int	Value_Shadowbeasthorn	=	500;
const int	Value_Trollhauer		=	500;

// Golems beim D�monenbeschw�rer
const int	Value_Steinherz			=	1000;
const int	Value_Feuerherz			=	1000;
const int	Value_Eisherz			=	1000;
const int	Value_Eistueck			=	100;




/******************************************************************************************/
INSTANCE ItAt_Teeth_01 (C_Item)
{
	name 				=	"K�y";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Z�hne;

	visual 				=	"ItAt_Teeth_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Z�hne;
};

/******************************************************************************************/
INSTANCE ItAt_Wolf_01 (C_Item)
{
	name 				=	"Sk�ra wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wolfsfell;

	visual 				=	"ItAt_Wolf_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Wolfsfell;
};
/******************************************************************************************/
INSTANCE ItAt_Wolf_02 (C_Item)
{
	name 				=	"Sk�ra orkowego psa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Orkhundfell;

	visual 				=	"ItAt_Wolf_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Orkhundfell;
};
/******************************************************************************************/
INSTANCE ItAt_Dzik_01 (C_Item)
{
	name 				=	"Sk�ra dzika";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	12;

	visual 				=	"ITAT_WARGFUR.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 12;
};
/******************************************************************************************/
INSTANCE ItAt_Waran_01 (C_Item)
{
	name 				=	"J�zyk Ognia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Feuerzunge;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Feuerzunge;
};
/******************************************************************************************/
INSTANCE ItAt_Claws_01 (C_Item)
{
	name 				=	"Pazury";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krallen;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Krallen;
};
/******************************************************************************************/
INSTANCE ItAt_Crawler_02 (C_Item)
{
	name 				=	"P�ytka z pancerza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Panzerplatte;

	visual 				=	"ItAt_Crawler_02.3DS";
	material 			=	MAT_WOOD;

	description			= "Fragment pancerza pe�zacza.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Panzerplatte;
};

/******************************************************************************************/
INSTANCE ItAt_Crawler_01 (C_Item)
{
	name 				=	"Wn�trzno�ci pe�zacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Crawlerzangen;

	visual 				=	"ItAt_Crawler_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Crawlerzangen;
};

/******************************************************************************************/
INSTANCE ItAt_Shadow_01 (C_Item)
{
	name 				=	"Sk�ra cieniostwora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeastfell;

	visual 				=	"ItAt_Shadowbeast_01.3DS";
	material 			=	MAT_LEATHER;

	description			= "Sk�ra cieniostwora";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Shadowbeastfell;
};

/******************************************************************************************/
INSTANCE ItAt_Shadow_02 (C_Item)
{
	name 				=	"R�g cieniostwora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeasthorn;

	visual 				=	"ItAt_Shadowbeast_02.3DS";
	material 			=	MAT_LEATHER;

	description			= "R�g cieniostwora";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Shadowbeasthorn;
};

/******************************************************************************************/
INSTANCE ItAt_Lurker_01 (C_Item)
{
	name 				=	"Pazury topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerklaue;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerklaue;
};

/******************************************************************************************/
INSTANCE ItAt_Lurker_02 (C_Item)
{
	name 				=	"Sk�ra topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerhaut;

	visual 				=	"ItAt_Lurker_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerhaut;
};

/******************************************************************************************/
INSTANCE ItAt_Troll_02 (C_Item)
{
	name 				=	"Kie� trolla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollhauer;

	visual 				=	"ItAt_Troll_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollhauer;
};

/******************************************************************************************/
INSTANCE ItAt_Troll_01 (C_Item)
{
	name 				=	"Sk�ra trolla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollfell;

	visual 				=	"ItAt_Troll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollfell;
};
/******************************************************************************************/
INSTANCE ItAt_Swampshark_01 (C_Item)
{
	name 				=	"Sk�ra b�otnego w�a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaihaut;

	visual 				=	"ItAt_Swampshark_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Sumpfhaihaut;
};
/******************************************************************************************/
INSTANCE ItAt_Swampshark_02 (C_Item)
{
	name 				=	"K�y b�otnego w�a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaiz�hne;

	visual 				=	"ItAt_Swampshark_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Sumpfhaiz�hne;
};
/******************************************************************************************/
INSTANCE ItAt_Bloodfly_01 (C_Item)
{
	name 				=	"Skrzyd�a krwiopijcy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Fl�gel;

	visual 				=	"ItAt_Bloodfly_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Fl�gel;
};
/******************************************************************************************/
INSTANCE ItAt_Bloodfly_02 (C_Item)
{
	name 				=	"��d�o krwiopijcy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stachel;

	visual 				=	"ItAt_Bloodfly_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Stachel;
};

/******************************************************************************************/
INSTANCE ItAt_StoneGolem_01 (C_Item)
{
	name 				=	"Serce Kamiennego Golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_WINDFIST;

	value 				=	Value_Steinherz;

	visual 				=	"ItAt_StoneGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "pokonanego kamiennego Golema.";
	TEXT[2]				= "Jego magiczna moc pozwala"; 
	TEXT[3]				= "wyrzuci� przeciwnika w powietrze.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};

/******************************************************************************************/
INSTANCE ItAt_FireGolem_01 (C_Item)
{
	name 				=	"Serce Ognistego Golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	Value_Feuerherz;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "pokonanego ognistego Golema.";
	TEXT[2]				= "Jego magiczna moc pozwala";
	TEXT[3]				= "podpali� przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolem_01 (C_Item)
{
	name 				=	"Serce Lodowego Golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_ICECUBE;

	value 				=	Value_Eisherz;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "pokonanego lodowego Golema.";
	TEXT[2]				= "Jego magiczna moc pozwala";
	TEXT[3]				= "zamrozi� przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eisherz;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolem_02 (C_Item)
{
	name 				=	"Fragment Lodowego Golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_THUNDERBOLT;

	value 				=	Value_Eistueck;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	500;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Ten fragment pochodzi ze szcz�tk�w";
	TEXT[1]				= "pokonanego lodowego Golema.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Eistueck;
};
/******************************************************************************************/
INSTANCE ItAt_WhiteWolf_01 (C_Item)
{
	name 				=	"Sk�ra bia�ego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_Wolf_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Wolfsfell;
};
/******************************************************************************************/
INSTANCE ItAt_Claws_02 (C_Item)
{
	name 				=	"Pazury trolla ziemnego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 20;
};
/******************************************************************************************/
INSTANCE ItAt_WolfWhite_01 (C_Item)
{
	name 				=	"Sk�ra bia�ego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ITAT_WWOLF_FUR.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 100;
};
//------------------------------------------------------------------------------1.6.1---------------------------------------------------------
INSTANCE ItAt_TrollFur (C_Item)
{
	name 				=	"Sk�ra trolla ziemnego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollfell;

	visual 				=	"ItAt_Troll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollfell;
};
/******************************************************************************************/
INSTANCE ItAt_Puma_Claws (C_Item)
{
	name 				=	"Pazury pantery";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Krallen;
};
/******************************************************************************************/
INSTANCE ItAt_Alligator_Skin (C_Item)
{
	name 				=	"Sk�ra aligatora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ITAT_ALLIGATOR_SKIN.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 60;
};
/****************************************************************************************/
INSTANCE ItAt_Waran_Skin (C_Item)
{
	name 				=	"Sk�ra jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ITAT_WARAN_SKIN.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 25;
};
/****************************************************************************************/
INSTANCE ItAt_FireWaran_Skin (C_Item)
{
	name 				=	"Sk�ra ognistego jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ITAT_FIREWARAN_SKIN.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 50;
};
/****************************************************************************************/
INSTANCE ItAt_Snapper_Skin (C_Item)
{
	name 				=	"Sk�ra z�bacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	40;

	visual 				=	"ItAt_Snapper_Skin.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 40;
};
/*************************************************************************************************/
INSTANCE ItAt_CrystalGolem_Heart (C_Item)
{
	name 				=	"Serce Kryszta�owego Golema";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
//	spell				= 	SPL_ICECUBE;

	value 				=	180;

	visual 				=	"ITAT_CRYSTALGOLEM_HEART.3ds";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "pokonanego kryszta�owego Golema.";
	TEXT[2]				= "Mo�e mi sie do czego� przyda...";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 180;
};
/*************************************************************************************************/
INSTANCE ItAt_SwampGolem_Heart (C_Item)
{
	name 				=	"Serce Bagiennego Golema";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	

	value 				=	Value_Steinherz;

	visual 				=	"ITAT_SWAMPGOLEM_HEART.3ds";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "bagiennego Golema.";
	TEXT[2]				= ""; 
	TEXT[3]				= "";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};
/*************************************************************************************************/
INSTANCE ItAt_Warg (C_Item)
{
	name 				=	"Sk�ra warga";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ITAT_WARGFUR.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 50;
};
/*************************************************************************************************/
INSTANCE ItAt_BearFur (C_Item)
{
	name 				=	"Sk�ra nied�wiedzia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual 				=	"ITAT_BEARFUR.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 200;
};
/*************************************************************************************************/
INSTANCE ItAt_BlackTrollFur (C_Item)
{
	name 				=	"Sk�ra czarnego trolla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ITAT_BLACKTROLLFUR.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 500;
};
/*************************************************************************************************/
INSTANCE ItAt_BearLubric (C_Item)
{
	name 				=	"Sad�o nied�wiedzia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/*************************************************************************************************/