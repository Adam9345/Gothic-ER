/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* BRONIE DLA NPC
******* Opis: Wszystkie bronie znajduj�ce si� w tym pliku
******* nie s� przeznaczone dla gracza, lecz dla NPC.
*****************************************************/


INSTANCE ItMw_1H_Sword_Short_03_Z (C_Item)
{	
	name 				=	"Zu�yty J�zyk Topielca";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	6;//44;

	damageTotal			= 	9;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	16;
	visual 				=	"ItMw_1H_Sword_Short_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Sword_Short_04_Z (C_Item)
{	
	name 				=	"Zu�yty K�uj�cy Cier�";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	8;//60;

	damageTotal			= 	10;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	17;
	visual 				=	"ItMw_1H_Sword_Short_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** MOD Zu�yty miecz						 								**
*********************************************************************************/

INSTANCE ItMw_1H_LightGuardsSword_03_Old (C_Item)
{	
	name 				=	"Zu�yty Lekki Miecz Stra�nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	6;

	damageTotal			= 	15;
	damagetype 			= 	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	22;
	visual 				=	"ItMw_1H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_01_Z (C_Item)
{	
	name 				=	"Zu�yta Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2;

	damageTotal			=   16;
	damagetype			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	26;
	visual 				=	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_02_Z (C_Item)
{	
	name 				=	"Zu�yta �wiekowana Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	3;

	damageTotal			=   21;
	damagetype			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	32;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_03_Z (C_Item)
{	
	name 				=	"Zu�yte ��d�o Krwiopijcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	3;

	damageTotal			=   18;
	damagetype			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	29;
	visual 				=	"ItMw_1H_Mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_04_Z (C_Item)
{	
	name 				=	"Zu�yty Stalowy J�zyk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5;

	damageTotal			=   21;
	damagetype			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	33;
	visual 				=	"ItMw_1H_Mace_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Sword_03_Old (C_Item)
{	
	name 				=	"Zu�yty Miecz Stra�nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	10;

	damageTotal			= 	22;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	34;
	visual 				=	"ItMw_1H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Sword_04_Z (C_Item)
{	
	name 				=	"Zu�yty Miecz Bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	16;

	damageTotal			= 	23;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	35;
	visual 				=	"ItMw_1H_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_War_01_Z (C_Item)
{	
	name 				=	"Zu�yty Morgensztern";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	7;

	damageTotal			=   24;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"ItMw_1H_Mace_War_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_War_02_Z (C_Item)
{	
	name 				=	"Zu�yta �elazna Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	8;

	damageTotal			=   25;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	41;
	visual 				=	"ItMw_1H_Mace_War_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Mace_War_03_Z (C_Item)
{	
	name 				=	"Zu�yty �omotacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	9;

	damageTotal			=   26;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	42;
	visual 				=	"ItMw_1H_Mace_War_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_1H_Sword_Broad_01_Z (C_Item) 
{	
	name 				=	"Zu�yty Szeroki Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	124;//610;//305

	damageTotal			= 	38;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	57;
	visual 				=	"ItMw_1H_Sword_Broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/

INSTANCE ItMw_2H_Sword_New_05_Z (C_Item) 
{	
	name 				=	"Zu�yty Pupilek Kr�la";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	36;//900;//454
	
	damageTotal			= 	44;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	68;
	visual 				=	"ItMw_050_2H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/
INSTANCE ItMw_2H_Sword_Light_02_Z (C_Item) 
{	
	name 				=	"Zu�yty Miecz Nadzorcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	60;

	damageTotal			= 	42;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/

INSTANCE Miecz1H1 (C_Item) //Tukash
{	
	name 				=	"Miecz Andrewa" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	270;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	owner 				= 	GRD_7008_Tukash;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	38;
	visual 				=	"DB_Itmw_1H_Sword_Bastard_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H2 (C_Item) //Alex
{	
	name 				=	"Miecz Alexa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;
	
	damageTotal			= 	46;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	owner	=				NON_5600_Alex;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	46;
	visual 				=	"DB_Itmw_1H_Sword_Bastard_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H3 (C_Item) //Quentin
{	
	name 				=	"Miecz Quentina";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;
	
	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	110;		
	owner 				= 	BAN_1610_Quentin;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE Miecz1H4 (C_Item) //Doyle
{	
	name 				=	"Miecz Doyle'a";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	110;		
	owner 				= 	BAN_1613_Doyle;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H10 (C_Item) //kaplica Beliara
{	
	name 				=	"Wi�kszy Miecz Rozpaczy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2400;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 18;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	50;
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_02.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[1]				= NAME_Dam_Magic;				COUNT[1]	= damage[DAM_INDEX_Magic];
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* DROP Z PRZECIWNIK�W
******* Opis: Te bronie zostawiaj� po sobie przeciwnicy gracza.
******* Gracz otrzymuje je po ich pokonaniu. 
*****************************************************/
INSTANCE Miecz1H12 (C_Item) //Thompson
{	
	name 				=	"Miecz Thompsona";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;
	owner 				=	NON_5636_Thompson;
	damageTotal			= 	55;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	100;		
	damage[DAM_INDEX_FIRE]	= 1;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	30;
	visual 				=	"DB_ItMw_1h_Sword_Rep_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H17 (C_Item) //Grimes
{	
	name 				=	"Miecz magicznego deszczu";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 5;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	60;
	visual 				=	"DB_ItMw_1H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz1H18 (C_Item) //kaplica innosa
{	
	name 				=	"Wi�kszy miecz magicznego deszczu";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2000;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	100;		
	damage[DAM_INDEX_MAGIC]	=	 8;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	85;
	visual 				=	"DB_ItMw_1H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz2H4 (C_Item) //Grim - 4 rozdz. 
{	

	name 				=	"Claymore";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1820;
	
	damageTotal			= 	64;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE Miecz2H6 (C_Item) //Hector -- Skelden
{	
	
	name 				=	"Rami� dow�dcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3500;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	74;
	owner 				= 	GRD_3935_Hector;
	visual 				=	"DB_ItMw_2H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/
INSTANCE ItMw_065_2h_greataxe_01 (C_Item) 
{	
	
	name 				=	"Katowski top�r";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	650;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	
	visual 				=	"ItMw_065_2h_greataxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/
INSTANCE ItMw_2h_Sword_Lee (C_Item) 
{	

	name 				=	"Zemsta Lee";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	140;
	
	visual 				=	"ItMw_2H_Sword_LEE.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;
	
};
/*********************************************************************************/
INSTANCE ItMw_Sword_Boba (C_Item)
{	
	name 				=	"Miecz Boby";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	

	damageTotal			= 	65;
	damagetype 			=	DAM_EDGE;		
	range    			=  	145;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	72;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;


};
//**********************************************************************************\

INSTANCE ItMwM_Sword_Boba (C_Item)
{	
	name 				=	"Ulepszony miecz Boby";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;


	damageTotal			= 	100;
	damagetype 			=	DAM_EDGE;		
	range    			=  	145;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;
	visual 				=	"ItMw_Sword_Boba.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
//****************************************************************************************/

INSTANCE ItMw_Sword_2h_WarriorFrenzy (C_Item)
{	
	name 				=	"Sza� wojownika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;



	damageTotal			= 	100;
	damagetype 			=	DAM_EDGE;		
	range    			=  	145;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"ItMw_Sword_Reflide.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;


};
//****************************************************************************/
INSTANCE ItMw_Sword_2h_140 (C_Item)
{	
	name 				=	"Mroczny pogrom";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	

	damageTotal			= 	149;
	damagetype 			=	DAM_EDGE|DAM_FIRE;
	
    damage[DAM_INDEX_FIRE] =  20;
    damage[DAM_INDEX_EDGE] =  129;	

	range    			=  	145;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;
	visual 				=	"ItMw_2h_Sword_140.3DS";

	description			= 	name;
	TEXT[0]             = 	"Posiada moc magicznych kryszta��w";
	TEXT[1]				=	NAME_Dam_Edge;			COUNT[1]	=	damage[DAM_INDEX_EDGE];
	TEXT[2]				=	NAME_Dam_Fire;			COUNT[2]	=	damage[DAM_INDEX_Fire];
	TEXT[3] 			= 	NAME_Str_needed;		COUNT[3]	= 	cond_value[2];
	TEXT[4] 			= 	NAME_TwoHanded;
	TEXT[5]				=	NAME_Value;
};

/*************************************************************************/
INSTANCE ITMW_1H_GRD_BASTARD (C_Item) 
{	
	
	name 				=	"Ent";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	680;

	damageTotal			= 	68;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	
	visual 				=	"ITMW_1H_GRD_BASTARD.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/
INSTANCE ITMW_CalomGuardSWD (C_Item) 
{	
	
	name 				=	"Z�oty krzyk";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	850;

	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	
	visual 				=	"ItMw_CalomGuard_SWD.3DS";

	description			= name;
	TEXT[1]             = "Miecz Ochroniarza Caloma";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*************************************************************************/
INSTANCE ITMW_2h_Slayer (C_Item) 
{	
	
	name 				=	"Szabloz�b";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1150;

	damageTotal			= 	115;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	
	visual 				=	"ItMw_2h_Sword_120.3DS";

	description			= name;
	TEXT[1]             = "Czu� od niego magiczn� aur�...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/
INSTANCE ItMw_Soul_Destroyer (C_Item) 
{	
	
	name 				=	"Rozpruwacz dusz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1250;

	damageTotal			= 	110;
	damagetype			=	DAM_EDGE;
	range    			=  	145;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	105;
	
	visual 				=	"ItMw_2h_Sword_130.3DS";

	description			= name;
	TEXT[1]             = "Mistrzowsko wykonana bro�...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*************************************************************************/
INSTANCE ItMw_1h_axe_100 (C_Item) 
{	
	
	name 				=	"Szarpacz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	73;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	
	visual 				=	"ITMW_1H_AXE.3DS";

	description			= name;
	//TEXT[1]             = "Mistrzowsko wykonana bro�...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/
INSTANCE ItMw_1h_hammer_100 (C_Item) 
{	
	
	name 				=	"Ci�ki m�ot bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_BLUNT;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;
	
	visual 				=	"ItMw_1h_Hammer_90.3DS";

	description			= name;
	//TEXT[1]             = "Mistrzowsko wykonana bro�...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/
INSTANCE ItMw_1h_Sword_ElBastrado(C_Item) 
{	
	
	name 				=	"El bastrado";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	
	visual 				=	"EL_Bastrado.3DS";

	description			= name;
	//TEXT[1]             = "Mistrzowsko wykonana bro�...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*************************************************************************/
INSTANCE ItMw_1h_Sword_Blaise(C_Item) 
{	
	
	name 				=	"Blaise";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	
	visual 				=	"ItMw_1H_Sword_Blaise.3DS";

	description			= name;
	//TEXT[1]             = "Nale�a� do Pascala...";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
