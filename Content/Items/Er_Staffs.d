//////////////////////////////////////////////////////////
// STAFFS												//
// TYPE: ITEMS SRIPTS									//
// GOTHIC EDYCJA ROZSZERZONA 1.4.5						//
// 07.06.2015											//
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// ***FIREMAGES***										//
//////////////////////////////////////////////////////////

INSTANCE ItMw_2H_Staff_FireMage_01 (C_Item)
{	
	name 				=	"Podstawowy kostur Maga Ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal			= 	40;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	25;
	visual 				=	"CA_STAFF_01L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_FireMage_02 (C_Item)
{	
	name 				=	"Konsekrowany podstawowy kostur Maga Ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	750;

	damageTotal			= 	45;
	damagetype			=	DAM_BLUNT|DAM_FIRE;
	damage[DAM_INDEX_FIRE]	=	 3;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	35;
	visual 				=	"CA_STAFF_01L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_FireMage_03 (C_Item)
{	
	name 				=	"Kostur Maga Ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal			= 	50;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	30;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	40;
	visual 				=	"CA_STAFF_01.3DS";

	description			= name;
	TEXT[1]				= "Poziom 1/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_FireMage_04 (C_Item)
{	
	name 				=	"Wzmocniony kostur Maga Ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1500;

	damageTotal			= 	55;
	damagetype			=	DAM_BLUNT|DAM_FIRE;
	damage[DAM_INDEX_FIRE]	=	 5;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	35;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	50;
	visual 				=	"CA_STAFF_01.3DS";

	description			= name;
	TEXT[1]				= "Poziom 2/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_FireMage_05 (C_Item)
{	
	name 				=	"Konsekrowany kostur Maga Ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2000;

	damageTotal			= 	60;
	damagetype			=	DAM_BLUNT|DAM_FIRE;
	damage[DAM_INDEX_FIRE]	=	 8;
	range    			=  	170;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	45;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	60;
	visual 				=	"CA_STAFF_01.3DS";

	description			= name;
	TEXT[1]				= "Poziom 3/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////
// ***WATERMAGES***										//
//////////////////////////////////////////////////////////

INSTANCE ItMw_2H_Staff_WaterMage_01 (C_Item)
{	
	name 				=	"Podstawowy kostur Maga Wody";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal			= 	40;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	25;
	visual 				=	"CA_STAFF_02L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_WaterMage_02 (C_Item)
{	
	name 				=	"Konsekrowany podstawowy kostur Maga Wody";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	750;

	damageTotal			= 	45;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 3;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	35;
	visual 				=	"CA_STAFF_02L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_WaterMage_03 (C_Item)
{	
	name 				=	"Kostur Maga Wody";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal			= 	50;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	30;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	40;
	visual 				=	"CA_STAFF_02.3DS";

	description			= name;
	TEXT[1]				= "Poziom 1/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_WaterMage_04 (C_Item)
{	
	name 				=	"Wzmocniony kostur Maga Wody";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1500;

	damageTotal			= 	55;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 5;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	35;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	50;
	visual 				=	"CA_STAFF_02.3DS";

	description			= name;
	TEXT[1]				= "Poziom 2/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_WaterMage_05 (C_Item)
{	
	name 				=	"Konsekrowany kostur Maga Wody";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2000;

	damageTotal			= 	60;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 8;
	range    			=  	170;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	45;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	60;
	visual 				=	"CA_STAFF_02.3DS";

	description			= name;
	TEXT[1]				= "Poziom 3/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////
// ***GURUMAGES***										//
//////////////////////////////////////////////////////////

INSTANCE ItMw_2H_Staff_GuruMage_01 (C_Item)
{	
	name 				=	"Podstawowy kostur Guru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal			= 	40;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	25;
	visual 				=	"CA_STAFF_03L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_GuruMage_02 (C_Item)
{	
	name 				=	"Konsekrowany podstawowy kostur Guru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	750;

	damageTotal			= 	45;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 3;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	35;
	visual 				=	"CA_STAFF_03L.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_GuruMage_03 (C_Item)
{	
	name 				=	"Kostur Guru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal			= 	50;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	30;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	40;
	visual 				=	"CA_STAFF_03.3DS";

	description			= name;
	TEXT[1]				= "Poziom 1/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_GuruMage_04 (C_Item)
{	
	name 				=	"Wzmocniony kostur Guru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1500;

	damageTotal			= 	55;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 5;
	range    			=  	160;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	35;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	50;
	visual 				=	"CA_STAFF_03.3DS";

	description			= name;
	TEXT[1]				= "Poziom 2/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Staff_GuruMage_05 (C_Item)
{	
	name 				=	"Konsekrowany kostur Guru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2000;

	damageTotal			= 	60;
	damagetype			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	 8;
	range    			=  	170;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	45;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	60;
	visual 				=	"CA_STAFF_03.3DS";

	description			= name;
	TEXT[1]				= "Poziom 3/3";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_Mana_needed;				COUNT[4]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};