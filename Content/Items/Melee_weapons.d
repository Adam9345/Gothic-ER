const int	Value_1H_Sword_01	=	30;		//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

/*********************************************************************************
** Kleiner Kram  										 						**
*********************************************************************************/
// VLK
INSTANCE ItMw_1H_Club_01 (C_Item)
{	
	name 				=	"Pa³ka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1;

	damageTotal  		= 	5;
	damagetype 			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"ItMw_1H_Club_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Poker_01 (C_Item)
{	
	name 				=	"Pogrzebacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2;

	damageTotal			= 	6;
	damagetype 			=	DAM_BLUNT;
	range    			=  	70;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		= 	8;
	visual 				=	"ItMw_1H_Poker_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// BAU
INSTANCE ItMw_1H_Sickle_01 (C_Item)	
{	
	name 				=	"Sierp"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5;

	damageTotal			= 	7;
	damagetype 			=	DAM_EDGE;
	range    			=  	50;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	9;
	visual 				=	"ItMw_1H_Sickle_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
// Auch für Mobsi-Benutzung (PickOre)
// VLK, SFB
INSTANCE ItMwPickaxe (C_Item)
{
	name 				=	"Kilof";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;

	value 				=	12;

	damageTotal			= 	12;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_2H_Pickaxe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Auch für Mobsi-Benutzung (Schmieden)
INSTANCE ItMw_1H_Sledgehammer_01 (C_Item)
{	
	name 				=	"M³ot Kowalski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	50;

	damageTotal			=   10;
	damagetype			=	DAM_BLUNT;
	range    			=  	50;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12;
	visual 				=	"ItMw_1H_Sledgehammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// VLK_573_Graham, VLK_581_Snaf
INSTANCE ItMw_1H_Mace_Light_01 (C_Item)
{	
	name 				=	"Pa³ka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1;

	damageTotal			=   8;
	damagetype			=	DAM_BLUNT;
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_1H_Mace_Light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// NOV
instance ItMw_1H_Hatchet_01 (C_Item) 
{	
	name 				=	"Siekierka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2;
	
	damageTotal			=   10;
	damagetype			=	DAM_EDGE;
	range    			=  	50;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12;
	visual 				=	"ItMw_1H_Hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Old_01 (C_Item)
{	
	name 				=	"Zardzewia³y miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1;

	damageTotal			= 	10;
	damagetype 			=	DAM_EDGE;
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// VLK, SFB
INSTANCE ItMw_1H_Nailmace_01 (C_Item)
{	
	name 				=	"Maczuga z GwoŸdŸmi"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	3;

	damageTotal			= 	11;
	damagetype 			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	13;
	visual 				=	"ItMw_1H_Nailmace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** KURZSCHWERTER 								**
*********************************************************************************/
// SFB
INSTANCE ItMw_1H_Sword_Short_01 (C_Item)
{	
	name 				=	"Krótki Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	35;//22;

	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	14;
	visual 				=	"ItMw_1H_Sword_Short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Du¿y topór								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_01 (C_Item) //w starym wozie za so, u fiska
{	
	name 				=	"Du¿y Topór";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	160;//900;//454
	
	damageTotal			=   20;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	visual 				=	"ItMw_2H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_02 (C_Item)
{	
	name 				=	"Ch³opski Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	64;//32;

	damageTotal			= 	13;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_1H_Sword_Short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_03 (C_Item)
{	
	name 				=	"Jêzyk Topielca";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	60;//44;

	damageTotal			= 	14;
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


/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_04 (C_Item)
{	
	name 				=	"K³uj¹cy Cierñ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	80;//60;

	damageTotal			= 	15;
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
** ER: £ysy drwal								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_02 (C_Item) //las ko³o so
{	
	name 				=	"£ysy Drwal";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	130;//900;//454
	
	damageTotal			= 	19;
	damagetype			=	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	22;
	visual 				=	"ItMw_020_2H_Axe_Lumberjack_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Short_05 (C_Item)
{	
	name 				=	"Z¹b Kopacza";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	100;//80;//40

	damageTotal			= 	22;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	24;
	visual 				=	"ItMw_1H_Sword_Short_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Stary miecz dwurêczny							**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Old_02 (C_Item) //handlarze
{	
	name 				=	"Stary miecz dwurêczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	30;//900;//454
	
	damageTotal			= 	20;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	23;
	visual 				=	"ItMw_025_2H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** Staebe und Kram 								**
*********************************************************************************/
// NOV
instance ItMw_1H_Axe_Old_01 (C_Item)
{	
	name 				=	"Zardzewia³y toporek";   

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1;

	damageTotal     	=   13;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_1H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// BAU
// FIXME: zu stark?
INSTANCE ItMw_1H_Scythe_01 (C_Item)	
{	
	name 				=	"Ma³a Kosa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	10;

	damageTotal			= 	15;
	damagetype 			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	17;
	visual 				=	"ItMw_1H_Scythe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs 
INSTANCE ItMw_2H_Staff_01 (C_Item)
{	
	name 				=	"Kostur";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	150;//31;

	damageTotal			= 	16;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	visual 				=	"ItMw_2H_Staff_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Staff_02 (C_Item)
{	
	name 				=	"Laska Sêdziowska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	150;//36;

	damageTotal			= 	19;
	damagetype 			=	DAM_EDGE;
	range    			=  	160;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	22;
	visual 				=	"ItMw_2H_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Staff_03 (C_Item)
{	
	name 				=	"Laska Kap³añska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	300;//45;

	damageTotal			= 	21;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** ER: Zemsta rêbacza								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_03 (C_Item) //las - most
{	
	name 				=	"Zemsta Rêbacza";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	200;//900;//454
	
	damageTotal			= 	23;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;
	visual 				=	"ItMw_025_2H_Misc_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



/*********************************************************************************
** Leichtes Gardeschwert						 								**
*********************************************************************************/

INSTANCE ItMw_1H_LightGuardsSword_03 (C_Item)
{	
	name 				=	"Lekki Miecz Stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	60;

	damageTotal			= 	22;
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

/*********************************************************************************
** Streitkolben 								**
*********************************************************************************/
// NOV + ORG
INSTANCE ItMw_1H_Mace_01 (C_Item)
{	
	name 				=	"Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	15;

	damageTotal			=   23;
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

/********************************************************************************/
// ORG
INSTANCE ItMw_1H_Mace_02 (C_Item)
{	
	name 				=	"Æwiekowana maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	32;

	damageTotal			=   25;
	damagetype			=	DAM_BLUNT;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** ER: Lekki miecz dwurêczny					**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_01 (C_Item) //handlarze
{	
	name 				=	"Lekki miecz dwurêczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	200;//900;//454
	
	damageTotal			= 	29;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	32;
	visual 				=	"ItMw_032_2H_Sword_Light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG
INSTANCE ItMw_1H_Mace_03 (C_Item)
{	
	name 				=	"¯¹d³o Krwiopijcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	35;

	damageTotal			=   26;
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



/********************************************************************************/
// NOV_1303_NYRAS , NOV_1330_BAALPARVEZ
INSTANCE ItMw_1H_Mace_04 (C_Item)
{	
	name 				=	"Stalowy Jêzyk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	55;

	damageTotal			=   30;
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



/*********************************************************************************
** Schwerter 									**
*********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_01 (C_Item)
{	
	name 				=	"Niewykoñczony miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	60; 	//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

	damageTotal			= 	20; //30 weil Schmieden und verkaufen runtergesetzt
	damagetype 			= 	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20; //12 
	visual 				=	"ItMw_1H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMwZ_1H_Sword_01 (C_Item)
{	
	name 				=	"Wykoñczony miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	120; 	//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

	damageTotal			= 	30; //30 weil Schmieden und verkaufen runtergesetzt
	damagetype 			= 	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30; //12 
	visual 				=	"ItMw_1H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_02 (C_Item)
{	
	name 				=	"Miecz Sêdziego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	90;

	damageTotal			= 	30;
	damagetype 			= 	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	32;
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Dobry dwurêczny topór					**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_04 (C_Item) //handlarze, stara kopalnia
{	
	name 				=	"Dobry dwurêczny topór";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	200;//900;//454
	
	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	35;
	visual 				=	"ItMw_035_2H_Axe_Light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_03 (C_Item)
{	
	name 				=	"Miecz Stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	100;

	damageTotal			= 	32;
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

/********************************************************************************/
// GRD //miêso armatnie


/****************************************************
******* MIECZ BOJOWY
******* Opis: Podstawowy miecz z gry. Dodano plan 
******* kowalski. Mo¿na go kupiæ u Huno.
******* Zmienione: G_ER_1.4.5
*****************************************************/
// GRD, STT (einer)
 
INSTANCE ItMw_1H_Sword_04 (C_Item)
{	
	name 				=	"Miecz Bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	160;

	damageTotal			= 	33;
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


/*********************************************************************************
** ER: Topór Najemnika	(SLD)				**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_05 (C_Item) //huan r2
{	
	name 				=	"Topór Najemnika";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	350;//900;//454
	
	damageTotal			= 	38;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_035_2H_SLD_Axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPC
INSTANCE ItMw_1H_Sword_05 (C_Item)
{	
	name 				=	"Miecz Wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	118;//236;//118

	damageTotal			= 	34;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	36;
	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//ER: Si³a drwala
INSTANCE ItMw_2h_Axe_Lumber_01 (C_Item) //jaskinia goblinów
{	
	name 				=	"Si³a Drwala";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	400;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_035_2H_Axe_Light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Morgensterne									**
*********************************************************************************/
// ORG

INSTANCE ItMw_1H_Mace_War_01 (C_Item)
{	
	name 				=	"Morgensztern";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	70;

	damageTotal			=   35;
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

/********************************************************************************/
// ORG, SLD
INSTANCE ItMw_1H_Mace_War_02 (C_Item)
{	
	name 				=	"¯elazna Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	80;

	damageTotal			=   36;
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

/********************************************************************************/
// SLD
INSTANCE ItMw_1H_Mace_War_03 (C_Item)
{	
	name 				=	"£omotacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	90;

	damageTotal			=   37;
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

/********************************************************************************/
// GUR_1211_BaalLukor
INSTANCE ItMw_1H_Mace_War_04 (C_Item)
{	
	name 				=	"£amacz Serc";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	390;//300;//153

	damageTotal			=   39;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	44;
	visual 				=	"ItMw_1H_Mace_War_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** 								**
*********************************************************************************/
/****************************************************
******* D£UGI MIECZ (Langschwerter)
******* Opis: Podstawowy miecz z gry. Dodano plan 
******* kowalski.
******* Zmienione: G_ER_1.4.5
*****************************************************/
INSTANCE ItMw_1H_Sword_Long_01 (C_Item)
{	
	name 				=	"D³ugi miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	440;

	damageTotal			= 	34;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	36;
	visual 				=	"ItMw_1H_Sword_Long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** ER: Miecz marynarza				**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_02 (C_Item) //cmentarzysko orków
{	
	name 				=	"Kiepski miecz dwurêczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	400;//900;//454
	
	damageTotal			= 	42;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	47;
	visual 				=	"ItMw_035_2H_SLD_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//ER: M³ot wojenny
INSTANCE ItMw_2h_Hammer_War_01 (C_Item)  //kamieñ ogniskuj¹cy diego
{	
	 
	name 				=	"M³ot Wojenny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	1050;
	
	damageTotal			= 	43;
	damagetype			=	DAM_BLUNT;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	53;
	visual 				=	"warhamerek.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD_203_BULLIT
INSTANCE ItMw_1H_Sword_Long_02 (C_Item)
{	
	name 				=	"Miecz Strachu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	420;//340;//178

	damageTotal			= 	42;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	44;
	visual 				=	"ItMw_1H_Sword_Long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_03 (C_Item)
{	
	name 				=	"Miecz Nienawiœci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	800;//400;//196

	damageTotal			= 	44;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	46;
	visual 				=	"ItMw_1H_Sword_Long_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_04 (C_Item)
{	
	name 				=	"Miecz Zwyciêstwa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	860;//430;//214

	damageTotal			= 	46;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	48;
	visual 				=	"ItMw_1H_Sword_Long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Miecz ³owcy				**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_03 (C_Item) //handlarze
{	
	name 				=	"Miecz £owcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1450;//900;//454
	
	damageTotal			= 	45;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_040_2H_PAL_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_05 (C_Item)
{	
	name 				=	"Miecz Œmierci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	920;//460;//232

	damageTotal			= 	48;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMwZ_1H_Sword_Long_05 (C_Item)
{	
	name 				=	"Zaostrzony Miecz Œmierci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	920;//460;//232

	damageTotal			= 	52;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_01 (C_Item)
{	
	name 				=	"M³ot Orków";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	500;//500;//250

	damageTotal			=   50;
	damagetype			=	DAM_BLUNT;
	range    			=  	70;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"ItMw_1H_Warhammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_02 (C_Item)
{	
	name 				=	"M³ot Wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1400;//520;//261

	damageTotal			=   55;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_1H_Warhammer_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//ER: Solidny miecz dwurêczny
INSTANCE ItMw_2h_Sword_Solid_01 (C_Item) //handlarze, r 3
{	
	 
	name 				=	"Solidny miecz dwurêczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1050;
	
	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"DB_ItMw_2H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_03 (C_Item)
{	
	name 				=	"Boski M³ot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1650;//540;//272

	damageTotal			=   60;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_1H_Warhammer_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** Äxte										**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_01 (C_Item)
{	
	name 				=	"Toporek"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	40;//160;//85

	damageTotal			=   25;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;
	visual 				=	"ItMw_1H_Axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_02 (C_Item)
{	
	name 				=	"Gruchotacz"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	530;//560;//283

	damageTotal			=   53;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	56;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_1H_Axe_02 (C_Item)
{	
	name 				=	"Zaostrzony Gruchotacz"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1020;//560;//283

	damageTotal			=   63;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_03 (C_Item)
{	
	name 				=	"£amacz Koœci"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1160;//580;//294

	damageTotal			=   54;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	57;
	visual 				=	"ItMw_1H_Axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Breitschwerter								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_01 (C_Item) 
{	
	name 				=	"Szeroki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1240;//610;//305

	damageTotal			= 	55;
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



/*********************************************************************************
** ER: Sêdzia sprawiedliwy				**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_04 (C_Item) //twierdza, najwy¿sza wie¿a
{	
	name 				=	"Sêdzia Sprawiedliwy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1250;//900;//454
	
	damageTotal			= 	53;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	57;
	visual 				=	"ItMw_040_2H_PAL_Sword_Heavy_Raw_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_02 (C_Item) 
{	
	name 				=	"Wyrok Wojownika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	570;//650;//327

	damageTotal			= 	57;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	59;
	visual 				=	"ItMw_1H_Sword_Broad_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_1H_Sword_Broad_02 (C_Item) 
{	
	name 				=	"Zaostrzony Wyrok Wojownika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1300;//650;//327

	damageTotal			= 	63;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_1H_Sword_Broad_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_03 (C_Item) 
{	
	name 				=	"Szept Burzy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1360;//680;//338

	damageTotal			= 	58;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_1H_Sword_Broad_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Pupilek króla			**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_05 (C_Item) //handlarze
{	
	name 				=	"Pupilek Króla";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	360;//180;//90
	
	damageTotal			= 	63;
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








/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_04 (C_Item) 
{	
	name 				=	"Rêka Stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1400;//700;//349

	damageTotal			= 	59;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	62;
	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Alte Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Old_01 (C_Item) 
{	
	name 				=	"Zardzewia³y miecz dwurêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	30;//740;//372

	damageTotal			= 	38;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	42;
	visual 				=	"ItMw_2H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** Bastardschwerter								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_01 (C_Item) 
{	
	name 				=	"Zardzewia³y miecz pó³torarêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	200;//810;//406

	damageTotal			= 	45;// weil es im OGY rumliegt und der Spieler Anfang des dritten Kapitels dort hinkommt!
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_1H_Sword_Bastard_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_02 (C_Item) 
{	
	name 				=	"RzeŸnik";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2450;//830;//418

	damageTotal			= 	64;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	66;
	visual 				=	"ItMw_1H_Sword_Bastard_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Milcz¹cy rzeŸnik			**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_New_06 (C_Item)
{	
	name 				=	"Milcz¹cy RzeŸnik";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2350;//900;//454
	
	damageTotal			= 	64;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	69;
	visual 				=	"ItMw_055_2H_Sword_Light_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_03 (C_Item) 
{	
	name 				=	"Kat";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2520;//860;//430

	damageTotal			= 	65;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	67;
	visual 				=	"ItMw_1H_Sword_Bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_04 (C_Item) 
{	
	name 				=	"Wrzask Berserkera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2720;//880;//442

	damageTotal			= 	72;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	74;
	visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMwZ_1H_Sword_Bastard_04 (C_Item) 
{	
	name 				=	"Zaostrzony Wrzask Berserkera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	760;//880;//442

	damageTotal			= 	76;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** ER: Orkowy pogromca		**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Big_06 (C_Item)
{	
	name 				=	"Orkowy Pogromca";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	680;//900;//454
	
	damageTotal			= 	68;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	visual 				=	"ItMw_060_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Alte Streitäxte								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_01 (C_Item)
{	
	name 				=	"Stary topór bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	670;//900;//454
	
	damageTotal			= 	67;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	66;
	visual 				=	"ItMw_2H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_02 (C_Item)
{	
	name 				=	"Krwawy ¯niwiarz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1840;//920;//466
	
	damageTotal			= 	68;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_2H_Axe_Old_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_2H_Axe_Old_02 (C_Item)
{	
	name 				=	"Zaostrzony Krwawy ¯niwiarz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1840;//920;//466
	
	damageTotal			= 	78;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_2H_Axe_Old_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_03 (C_Item)
{	
	name 				=	"Stary Sêdzia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1880;//940;//478
	
	damageTotal			= 	69;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_2H_Axe_Old_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* LEKKI MIECZ DWURÊCZNY (Leichte Zweihänder)
******* Opis: Podstawowy miecz z gry. Dodano plan 
******* kowalski. Mo¿na go kupiæ u Darriona (r3).
******* Zmienione: G_ER_1.4.5
*****************************************************/
// TPL
INSTANCE ItMw_2H_Sword_Light_01 (C_Item) 
{	
	name 				=	"Lekki miecz dwurêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	56;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	58;
	visual 				=	"ItMw_2H_Sword_Light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// TPL
INSTANCE ItMw_2H_Sword_Light_02 (C_Item) 
{	
	name 				=	"Miecz Nadzorcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	600;

	damageTotal			= 	60;
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

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Light_03 (C_Item) 
{	
	name 				=	"Ostrze Najemnika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	700;//1000;//535

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	visual 				=	"ItMw_2H_Sword_Light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ KRÓLEWSKI
******* Opis: Podstawowy miecz z gry. Dodano plan 
******* kowalski. Plan mo¿na dostaæ za wykonanie zadania
******* z oszala³ymi cz³onkami Bractwa.
******* Zmienione: G_ER_1.4.5
*****************************************************/
// TPL_1402_GorNaToth, TPL_1439_GorNaDrak
INSTANCE ItMw_2H_Sword_Light_04 (C_Item) 
{	
	name 				=	"Miecz Królewski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	740;//1100;//550

	damageTotal			= 	74;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	79;
	visual 				=	"ItMw_2H_Sword_Light_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// keine NPCS
INSTANCE ItMw_2H_Sword_Light_05 (C_Item) 
{	
	name 				=	"Miecz Demonów";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	760;//1160;//580

	damageTotal			= 	76;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	81;
	visual 				=	"ItMw_2H_Sword_Light_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* LEKKI TOPÓR BOJOWY (Leichte Streitaxt)
******* Opis: Podstawowy miecz z gry. Dodano plan 
******* kowalski. Plan mo¿na znaleŸæ w skrzyni w Wolnej
******* Kopalni. 
******* Zmienione: G_ER_1.4.5
*****************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_01 (C_Item)
{	
	name 				=	"Lekki topór bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1770;//1200;//595
	
	damageTotal			= 	77;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_2H_Axe_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_02 (C_Item)
{	
	name 				=	"Grzmot";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2440;//1220;//610
	
	damageTotal			= 	78;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	79;
	visual 				=	"ItMw_2H_Axe_light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_2H_Axe_light_02 (C_Item)
{	
	name 				=	"Zaostrzony Grzmot";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2440;//1220;//610
	
	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	79;
	visual 				=	"ItMw_2H_Axe_light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_03 (C_Item)
{	
	name 				=	"Chrzêst";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2520;//1260;//630
	
	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	87;
	visual 				=	"ItMw_2H_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_2H_Axe_light_03 (C_Item)
{	
	name 				=	"Zaostrzony Chrzêst";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2520;//1260;//630
	
	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	78;
	visual 				=	"ItMw_2H_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Zweihänder									**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_01 (C_Item) 
{	
	name 				=	"Dwurêczniak";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2600;//1300;//650

	damageTotal			= 	81;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	86;
	visual 				=	"ItMw_2H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_02 (C_Item) 
{	
	name 				=	"Ostrze Bohatera Bractwa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	480;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	110;
	visual 				=	"ItMw_2H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_03 (C_Item) 
{	
	name 				=	"Krwawe Ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	850;//1420;//710

	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"ItMw_2H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Schwere Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_01 (C_Item) 
{	
	name 				=	"Ciê¿ki Dwurêczniak";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	860;//1460;//730

	damageTotal			= 	86;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	91;
	visual 				=	"ItMw_2H_Sword_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_02 (C_Item) 
{	
	name 				=	"Gniewna Stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3040;//1520;//770

	damageTotal			= 	88;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	93;
	visual 				=	"ItMw_2H_Sword_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_03 (C_Item) 
{	
	name 				=	"Wœciek³a Stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1220;//1630;//815

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;
	visual 				=	"ItMw_2H_Sword_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_04 (C_Item) 
{	
	name 				=	"Mœciwa Stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3440;//1720;//865

	damageTotal			= 	92;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	97;
	visual 				=	"ItMw_2H_Sword_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_2H_Sword_Heavy_04 (C_Item) 
{	
	name 				=	"Zaostrzona Mœciwa Stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3440;//1720;//865

	damageTotal			= 	102;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	125;
	visual 				=	"ItMw_2H_Sword_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Streitäxte									**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_01 (C_Item)
{	
	name 				=	"Topór Wojenny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1940;//1830;//915
	
	damageTotal			= 	94;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	101;
	visual 				=	"ItMw_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_02 (C_Item)
{	
	name 				=	"Krzyk Wojownika";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3860;//1930;//965
	
	damageTotal			= 	96;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	103;
	visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_03 (C_Item)
{	
	name 				=	"Piêœæ Barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4060;//2030;//1015
	
	damageTotal			= 	98;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	105;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMwZ_2H_Axe_Heavy_03 (C_Item)
{	
	name 				=	"Zaostrzona Piêœæ Barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4060;//2030;//1015
	
	damageTotal			= 	108;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	112;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_04 (C_Item)
{	
	name 				=	"Piêœæ Trolla";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4360;//2180;//1090
	
	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	107;
	visual 				=	"ItMw_2H_Axe_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Orkische Waffen		(entsprechen Kap. 3-4 Waffen!!!							**
*********************************************************************************/
// Orc-Scout (ab Ende Kap 3!)
INSTANCE ItMw2hOrcSword01 (C_Item)
{	
	name 				=	"Krush Varrok"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	30;//90

	damageTotal			= 	35;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	40;
	visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe01 (C_Item)
{	
	name 				=	"Krush Pach";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	35;//100;

	damageTotal			= 	45;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   50;
	visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe02 (C_Item)
{	
	name 				=	"Krush UrRok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	40;//110;

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	60;
	visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe03 (C_Item)
{	
	name 				=	"Krush Agash";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	50;//120;

	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   70;
	visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe04 (C_Item)
{	
	name 				=	"Krush BrokDar";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	65;//130;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   80;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Undead Orc-Warrior (Kap. 5)
INSTANCE ItMw2hOrcMace01 (C_Item)
{	
	name 				=	"Krush Karrok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	80;//150;

	damageTotal			= 	75;
	damagetype			=	DAM_BLUNT;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   90;
	visual 				=	"ItMw_2H_OrcMace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Schamane (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwOrcstaff (C_Item)
{
	name 				=	"Grachtnakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	5;

	damageTotal			=	1;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


/********************************************************************************/
// Untoter Orc-Priester (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwUdOrcstaff (C_Item)
{
	name 				=	"ShaBaNakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	5;

	damageTotal			=	1;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItMw_2H_OrcSword_02 (C_Item) // *** für Orcritter!!! ***
{	
	name 				=	"Krush Morrok"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	120;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	100;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Dam_Edge;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;			     	COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;				     	COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_80 (C_Item) // *** für Orcritter!!! ***
{	
	name 				=	"Postrach Orków"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=   130;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	120;
	visual 				=	"ITMW_080_2H_AXE_HEAVY_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Dam_Edge;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;			     	COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;				     	COUNT[5]	= value;
};