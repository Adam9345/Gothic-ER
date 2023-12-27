
/********************************************************************************/	
	INSTANCE TestMap(C_Item)
{	
	name 					=	"Test mapy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapTEST;

	description				= name;
	TEXT[0]					= "----------------------";
	TEXT[1]					= "----------------------";
	TEXT[2]					= "----------------------";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapTEST()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_Evilc.tga", 	1	);  //  1 -> DO NOT SCALE 

  				Doc_SetFont 	( nDocID, 0, "font_15_book.TGA"		); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);
 					Doc_SetFont 	( nDocID, 0, "font_10_book.TGA"			); 
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Dämonenbeschwörer");
					
					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");


					Doc_Show		( nDocID 	);
	};
	

//---------------------------------------------------------------------
//lekarstwo dla Avallacha	
//---------------------------------------------------------------------
INSTANCE LekAva(C_ITEM)
{
	name 				= "Lekarstwo na zatrucia";

	mainflag 			= ITEM_KAT_POTIONS;
	flags 				= ITEM_MISSION;

	value 				= 0;	


	visual 				= "ITFO_POTION_STRENGTH_01.3DS";
	material 			= MAT_GLAS;
	on_state[0]			= UseLekAv;
	scemeName			= "POTION";
	description			= name;

	TEXT[0]				= "Efekt: Nieznany";
};
func void UseLekAv ()
{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	300);
};




//*************************************************************************/
INSTANCE NON_HunterArmor_01(C_Item) //chuj wie co to
{
	name 					=	"Lekki strój myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	300;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_PIR_L_ADDON.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE NON_HunterArmor_02(C_Item)
{
	name 					=	"Skórzany strój";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	23;
	protection [PROT_BLUNT] = 	23;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	2;
	protection [PROT_MAGIC] = 	2;

	value 					=	350;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_PIR_L_ADDON.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	STARY OBÓZ                                  
**  STRA¯NICY MAGNACI
*******************************************************************************************/

/******************************************************************************************/
INSTANCE EBR_ARMOR_L(C_Item) //tego te¿ nie
{
	name 					=	"Lekki pancerz Magnata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	72;
	protection [PROT_BLUNT] = 	72;
	protection [PROT_POINT] = 	12;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItMw_HolzAxt (C_Item) //nieu¿yty
{	
	name 				=	"Topór drwala";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	20;
	
	visual 				=	"itmw_holzaxt.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};
/******************************************************************************************/
INSTANCE ItMw_HolzAxt_h (C_Item)
{	
	name 				=	"Ciê¿ki topór drwala";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	35;
	
	visual 				=	"ItMw_HolzAxt_H.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};