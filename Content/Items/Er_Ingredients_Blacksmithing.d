/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* SK£ADNIKI RZEMIOS£A - KOWALSTWO
******* Opis: Kowalstwo opiera siê na zleceniach. 
******* Nie kujemy broni sami, lecz zlecamy pracê
******* kowalom, którzy otrzymuj¹ zap³atê i sk³adniki
******* od nas. Plany mo¿na kupiæ, otrzymaæ lub
******* znaleŸæ. 
*****************************************************/

/****************************************************
******* SZTABY METALI
*****************************************************/

INSTANCE Pr_SztabkaMagicznejStali (C_Item)
{
	name 				=	"Sztabka magicznej stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	120;

	visual 				=	"Er_OreStab.3ds";
    material            =    MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Sztabka wytopiona z magicznej rudy";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************/
INSTANCE Pr_SztabkaZlota (C_Item)
{
	name 				=	"Sztabka z³ota";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	80;

	visual 				=	"Er_GoldStab.3ds";
    material            =    MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Sztabka wytopiona z czystego z³ota";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************/
INSTANCE Pr_SztabkaStali (C_Item)
{
	name 				=	"Sztabka stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	40;

	visual 				=	"Er_OreStab.3ds";
    material            =    MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Sztabka wytopiona z rudy ¿elaza";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************/
INSTANCE Pr_SztabkaCiemnejStali (C_Item)
{
	name 				=	"Sztabka ciemnej stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	160;

	visual 				=	"Er_OreStab.3ds";
    material            =    MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Sztabka wytopiona z kilku metali";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

/****************************************************
******* BRY£KI
*****************************************************/

INSTANCE Gold01(C_Item)
{
	name 				=	"Bry³ka z³ota";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMi_GoldNugget_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

/******************************************************/
INSTANCE Pr_Wegiel(C_Item)
{
	name 				=	"Bry³ka wêgla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	7;

	visual 				=	"ItMi_Coal.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/****************************************************
******* KAMIENIE
*****************************************************/

/******************************************************/
INSTANCE ItMi_Alchemy_BlueStone(C_Item)
{
	name 				=	"Niebieski kamieñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	300;

	visual 				=	"ItMi_Teleportstone_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};