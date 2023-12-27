//#####################################################################
//##
//##							BY GOTHIC1210
//##							KAPITEL 1	EDYCJA ROZSZERZONA
//##							WERSJA 1.1
//##
//#####################################################################
//schläferschwert



	





	


	
	
	
	/*************************************************************************************/
	/************************ SPECIAL SWORDS ***********************************************/
	/************************ER 1.24 **********************************************************/
	
	INSTANCE SpecialSword1 (C_Item)
{
	name 				=	"Mistyczne ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4000;

	damageTotal			= 	80;
	damagetype			=	DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	70;
	range    				=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;


	visual 				=	"DB_ItMw_1H_Sword_Short_Smith_02.3DS";

	description			= name;
	TEXT[0]				= "Magiczne runy daj¹ ostrzu moc.";
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2]				= NAME_Dam_Magic;					COUNT[2]	= damage[DAM_INDEX_MAGIC];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	INSTANCE SpecialSword2 (C_Item)
{
	name 				=	"Miecz spopielenia";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4000;

	damageTotal			= 	75;
	damagetype			=	DAM_FIRE;
	damage[DAM_INDEX_FIRE]	=	65;
	range    				=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;

	visual 				=	"sword_2h_g3dsv.3DS";

	description			= name;
	TEXT[0]				= "P³omieñ tego ostrza jest wci¹¿ ¿ywy.";
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2]				= NAME_Dam_Fire;					COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	INSTANCE SpecialSword3 (C_Item)
{
	name 				=	"Miecz zmieszczenia";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	6600;

	damageTotal			= 	70;
	damagetype			=	DAM_FIRE|DAM_MAGIC;
	damage[DAM_INDEX_MAGIC]	=	70;
	damage[DAM_INDEX_FIRE]	=	70;
	range    				=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"ItroX_2hd_berserk01.3DS";

	description			= name;
	TEXT[0]				= "P³omieñ tego ostrza jest wci¹¿ ¿ywy.";
	TEXT[1]				= NAME_Dam_MAGIC;					COUNT[2]	= damage[DAM_INDEX_MAGIC];
	TEXT[2]				= NAME_Dam_Fire;					COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};









	

