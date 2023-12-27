var c_item choosen_munition;

//KURZBOGEN//


INSTANCE ItRw_Bow_Small_01 (C_Item)
{
	name 				=	"Krótki ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	40;//20;

	damageTotal			=	10;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
   // on_equip            =   EquipRangedWeapon;
	//on_unequip          =   UnEquipRangedWeapon;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	7;
	visual 				=	"ItRw_Bow_Small_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_02 (C_Item)
{
	name 				=	"£uk kawaleryjski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	80;//40;

	damageTotal			=	15;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	12;
	visual 				=	"ItRw_Bow_Small_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_03 (C_Item)
{
	name 				=	"£uk polowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	120;//60;

	damageTotal			=	18;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	17;
	visual 				=	"ItRw_Bow_Small_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_04 (C_Item)
{
	name 				=	"£uk myœliwski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	160;//80;

	damageTotal			=	22;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Small_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Small_05 (C_Item)
{
	name 				=	"Koœciany ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	200;//100;

	damageTotal			=	26;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	25;
	visual 				=	"ItRw_Bow_Small_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//LANGBOGEN//
/******************************************************************************************/
// Org & SLD
INSTANCE ItRw_Bow_Long_01 (C_Item)
{
	name 				=	"D³ugi ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	300;//120;

	damageTotal			=	22;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	28;
	visual 				=	"ITRW_BOW_LONG_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_02 (C_Item)
{
	name 				=	"£uk kolczasty";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	370;//140;

	damageTotal			=	30;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	visual 				=	"ItRw_Bow_Long_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_03 (C_Item)
{
	name 				=	"£uk wierzbowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	650;//160;

	damageTotal			=	37;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	visual 				=	"ItRw_Bow_Long_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_04 (C_Item)
{
	name 				=	"£uk dêbowy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	550;//180;

	damageTotal			=	41;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	50;
	visual 				=	"ItRw_Bow_Long_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_05 (C_Item)
{
	name 				=	"Wilcze k³y";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	600;//220;

	damageTotal			=	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	54;
	visual 				=	"ItRw_Bow_Long_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_Long_05_Z (C_Item)
{
	name 				=	"Zu¿yte wilcze k³y";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//220;

	damageTotal			=	33;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	54;
	visual 				=	"ItRw_Bow_Long_05.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItRw_Bow_Long_06 (C_Item)
{
	name 				=	"Podmuch wiatru";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	700;//240;

	damageTotal			=	52;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	70;
	visual 				=	"ItRw_Bow_Long_06.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItRw_Bow_Long_07 (C_Item)
{
	name 				=	"£uk ¿o³nierski";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	740;//260;

	damageTotal			=	55;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	72;
	visual 				=	"ItRw_Bow_Long_07.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_08 (C_Item)
{
	name 				=	"£uk z poro¿a";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	630;//280;

	damageTotal			=	47;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	56;
	visual 				=	"ItRw_Bow_Long_08.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_Long_09 (C_Item)
{
	name 				=	"Nimrod";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	900;//300;

	damageTotal			=	67;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	80;
	visual 				=	"itrw_bow_long_R01.MMS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
//KRIEGSBOGEN//
/******************************************************************************************/
INSTANCE ItRw_Bow_War_01 (C_Item)
{
	name 				=	"£uk wojenny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	850;//320;

	damageTotal			=	63;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	82;
	visual 				=	"ItRw_Bow_War_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_02 (C_Item)
{
	name 				=	"Pogromca orków";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	940;//340;

	damageTotal			=	70;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	93;
	visual 				=	"ItRw_Bow_War_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_02_Z (C_Item)
{
	name 				=	"Zu¿yty pogromca orków";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//340;

	damageTotal			=	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	70;
	visual 				=	"ItRw_Bow_War_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_03 (C_Item)
{
	name 				=	"Gromow³adny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	870;//360;

	damageTotal			=	65;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	80;
	visual 				=	"ItRw_Bow_War_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_04 (C_Item)
{
	name 				=	"Piekielny ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	890;//380;

	damageTotal			=	66;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	85;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_Bow_War_05 (C_Item)
{
	name 				=	"£uk œmierci";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	930;//500;

	damageTotal			=	69;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	90;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/

/******************************************************************************************/
//ARMBRUST//
/******************************************************************************************/
 

INSTANCE ItRw_Crossbow_01(C_Item)
{
	name 				=	"Lekka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	300;

	damageTotal			= 	22;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	25;
	
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};

	INSTANCE ItRw_Crossbow_01_Old(C_Item)
{
	name 				=	"Zu¿yta lekka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	15;

	damageTotal			= 	7;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	30;
	
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};
	
/******************************************************************************************/
 

INSTANCE ItRw_Crossbow_02(C_Item)
{
	name 				=	"Kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	600;//390;

	damageTotal			= 	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	50;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Crossbow_02_Z(C_Item)
{
	name 				=	"Zu¿yta kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	10;//390;

	damageTotal			= 	30;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	50;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Crossbow_02_S(C_Item)
{
	name 				=	"Stara kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	5;//390;

	damageTotal			= 	22;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	50;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Pamiêta czasy tworzenia bariery...";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
 

INSTANCE ItRw_Crossbow_03(C_Item)
{
	name 				=	"Ciê¿ka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	850;//500;

	damageTotal			= 	63;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	70;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItRw_Crossbow_03_Z(C_Item)
{
	name 				=	"Zu¿yta ciê¿ka kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	25;//500;

	damageTotal			= 	37;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	70;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
 

INSTANCE ItRw_Crossbow_04(C_Item)
{
	name 				=	"Kusza wojenna";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1000;//650;

	damageTotal			= 	75;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	90;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	80;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Crossbow_04_Z(C_Item)
{
	name 				=	"Zu¿yta kusza wojenna";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	60;//650;

	damageTotal			= 	52;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	110;
	
	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	100;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


var c_item bron;
/******************************************************************************************/
//MUNITION//
/******************************************************************************************/
INSTANCE ItAmArrow(C_Item)
{
	name 				=	"Strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	0;
    //on_state[0]         =   UseMunition;
	visual 				=	"ItAm_Arrow_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
	//self.name = "ALAMUSYDUPACICHO";
};

/******************************************************************************************/
INSTANCE ItAmBolt(C_Item)
{
	name 				=	"Be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItAm_Bolt_01.3ds";
	material 			=	MAT_WOOD;
   // on_state[0]         =   UseMunition;
	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

INSTANCE BowBlunt1 (C_Item)
{
	name 				=	"Og³uszacz";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			=	30;
	damagetype			=	DAM_BLUNT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Small_02.mms";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= "Nie dobija przeciwnika, lecz go obala";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*func void SetMunition (var c_item munition) //nie wywo³ywaæ samemu
{
if (!munition)
 {
// ResetMunition (); 
 //}; //taki bugfix
 if (munition.flags&ITEM_CROSSBOW) { munition = ItAmBolt; } else { munition = ItAmArrow; };
choosen_munition = munition;
munition.flags = munition.flags | 1<<30;
var c_item weapon; weapon = Npc_GetEquippedRangedWeapon(self);
weapon.munition = munition;
weapon.TEXT[6] = ConcatStrins(munition.name, " - dodatkowe obra¿enia:");
weapon.COUNT[6] = munition.damageTotal;
weapon.damageTotal += munition.damageTotal;
};

func void ResetMunition (var c_item munition) //nie wywo³ywaæ samemu
{
if (choosen_munition) 
{ 
munition = ItAmBolt;
choosen_munition.flags = choosen_munition.flags &~ 1<<30; }; //zgadywane, nie pamiêtam tych operatorów, mo¿e byæ Ÿle (ma œci¹gaæ flagê)
var c_item weapon; weapon = Npc_GetEquippedRangedWeapon(self);
if (munition.flags&ITEM_CROSSBOW) 
{ 
SetMunition (ItAmBolt); 
} else 
{ 
SetMunition (ItAmArrow); 
};
weapon.TEXT[6] = "";
weapon.COUNT[6] = 0; //mo¿e byæ Ÿle, nie pamiêtam jak resetowaæ
weapon.damageTotal = weapon.TEXT[2];
choosen_munition = none; //mo¿e byæ Ÿle, nie pamiêtam jak resetowaæ
};

func void EquipRangedWeapon () //wywo³ywaæ przez on_equip broni dystansowych
{
SetMunition (choosen_munition);
};
func void UnEquipRangedWeapon ()//wywo³ywaæ przez on_unequip broni dystansowych
{
var c_item tmp; tmp = choosen_munition; //wiem ¿e na oko³o, ale dziêki temu jedna funkcja mniej :D
ResetMunition ();
choosen_munition = tmp;
};
func void UseMunition () //wywo³ywaæ przez on_state[0] amunicji
{
ResetMunition ();
SetMunition (item);
};
*/ 

//******************************************************************************
//************************ EDYCJA ROZSZERZONA 1.3 EDIT**************************
//******************************************************************************
 

INSTANCE ItRw_Fury(C_Item)
{
	name 				=	"Furia";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	1300;//1250;

	damageTotal			= 	97;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]			 	= "Niezwykle potê¿na broñ.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L01(C_Item)
{
	name 				=	"Kusza myœliwska";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	600;

	damageTotal			= 	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L02(C_Item)
{
	name 				=	"Wilcza kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	700;

	damageTotal			= 	52;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	40;
	visual 				=	"ItRwCrossbow1.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_L03(C_Item)
{
	name 				=	"Kusza bitewna";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	800;

	damageTotal			= 	60;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow2.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza lekka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	
INSTANCE ItRw_Er_Crossbow_H01(C_Item)
{
	name 				=	"Zmodyfikowana kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	850;

	damageTotal			= 	63;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_H02(C_Item)
{
	name 				=	"Dêbowa kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	870;//1250;

	damageTotal			= 	65;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItRwCrossbow3.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItRw_Er_Crossbow_H03(C_Item)
{
	name 				=	"Elitarna kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	950;//1250;

	damageTotal			= 	71;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItRwCrossbow4.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= "Kusza ciê¿ka";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE ItRw_Bow_War_01_Z (C_Item)
{
	name 				=	"Zu¿yty ³uk wojenny";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	50;//320;

	damageTotal			=	51;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	70;
	visual 				=	"ItRw_Bow_War_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//***********************KO£CZAN***********************//
 

INSTANCE ItAm_Quiver (C_Item)
{
	name 				=	"Ma³y ko³czan strza³";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItAm_ArrowPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_Quiver;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 20 strza³.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_Quiver()
{
    CreateInvItems (self, ItAmArrow, 20);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 20 strza³!", COL_WHITE);
	
	};

};
//***********************KO£CZAN***********************//
INSTANCE ItAm_Quiver_50 (C_Item)
{
	name 				=	"Œredni ko³czan strza³";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItAm_ArrowPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_Quiver_50;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 50 strza³.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_Quiver_50()
{
    CreateInvItems (self, ItAmArrow, 50);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 50 strza³!", COL_WHITE);
	
	};

};
//***********************KO£CZAN***********************//
INSTANCE ItAm_Quiver_100 (C_Item)
{
	name 				=	"Du¿y ko³czan strza³";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItAm_ArrowPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_Quiver_100;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 100 strza³.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_Quiver_100()
{
    CreateInvItems (self, ItAmArrow, 100);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 100 strza³!", COL_WHITE);
	
	};

};
//***********************KO£CZAN***********************//

INSTANCE ItAm_BQuiver (C_Item)
{
	name 				=	"Ma³y ko³czan be³tów";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItAm_BoltPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_BQuiver;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 20 be³tów.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_BQuiver()
{
    CreateInvItems (self, ItAmBolt, 20);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 20 be³tów!", COL_WHITE);
	
	};

};
//***********************KO£CZAN***********************//
INSTANCE ItAm_BQuiver_50 (C_Item)
{
	name 				=	"Œredni ko³czan be³tów";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItAm_BoltPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_BQuiver_50;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 50 be³tów.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_BQuiver_50()
{
    CreateInvItems (self, ItAmBolt, 50);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 50 be³tów!", COL_WHITE);
	
	};

};
//***********************KO£CZAN***********************//
INSTANCE ItAm_BQuiver_100 (C_Item)
{
	name 				=	"Du¿y ko³czan be³tów";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItAm_BoltPocket.3DS";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_BQuiver_100;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê 100 be³tów.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_BQuiver_100()
{
    CreateInvItems (self, ItAmBolt, 100);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 100 be³tów!", COL_WHITE);
	
	};

};

/******************************************************************************************/



INSTANCE ItRw_Bow_DoyleHostile (C_Item)
{
	name 				=	"£uk œmierci";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	930;//500;

	damageTotal			=	9000;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	90;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};