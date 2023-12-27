//*******************************************************************************
//*********** GOTHIC EDYCJA ROZSZERZONA 1.4
//*********** PRZEDMIOTY ZADAÑƒ - ROZDZIA³ 3
//*******************************************************************************
//---------------------------------------------------------------------
//	Lista z kopalni dla Diego
//---------------------------------------------------------------------
INSTANCE OldMineList2 (C_Item)
{	
	name 				=	"Lista zamówieñ -";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_OMList2;
	scemeName			=	"MAP";
	//description			= 	"";
	
	TEXT[4]             = "Lista rzeczy potrzebnych do Starej Kopalni";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Use_OMList2 ()
{   
OldMineList2.name =	"Lista zamówieñ +";
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Tylko macie siê pospieszyæ!"					);
					Doc_PrintLine	( nDocID,  0, "- 30 bochenków chleba"								);
					Doc_PrintLine	( nDocID,  0, "- 40 butelek piwa"	);
					Doc_PrintLine	( nDocID,  0, "- 20 butelek wina"	);
					Doc_PrintLine	( nDocID,  0, "- 13 kilofów"	);
					Doc_PrintLine	( nDocID,  0, "- 10 ch³opskich mieczy"	);
					Doc_PrintLine	( nDocID,  0, "- 2 dêbowe skrzynie (stare nam popêka³y)"	);
					Doc_PrintLine	( nDocID,  0, "- 3 skrzynie miêsa "	);
					Doc_PrintLine	( nDocID,  0, "- 5 drewnianych ³y¿ek i kilka m³otków"	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "				Wasz kochany Ian"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/******************************************************************************************/
INSTANCE Hugo_Map(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOrcsMapEr;

	description				= name;
	TEXT[0]					= "Mapa do orkowego skarbu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOrcsMapEr()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_HUGO.tga", 	1	);  //  1 -> DO NOT SCALE 

					Doc_Show		( nDocID 	);
	};
	
//---------------------------------------------------------------------
//	Zadanie od Aidana
//---------------------------------------------------------------------	
/******************************************************************************************/
INSTANCE ItMis_AidanBow (C_Item)
{
	name 				=	"£uk Aidana";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	300;//140;

	damageTotal			=	45;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	20;
	visual 				=	"ItRw_Bow_Long_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItMis_AidanDagger (C_Item) 
{	
	name 				=	"¯elazny sztylet Aidana" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	200;
	
	damageTotal			= 	22;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE CavalornWood (C_Item)
{
	name 				=	"Chrust dla Cavalorna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	80;

	visual 				=	"OC_FIREWOOD_V1.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]				= 	"Dostawa dla Cavalorna.";
	TEXT[3]				= 	"Dobrze wysuszony.";
};
/******************************************************************************************/
INSTANCE ItMi_Focus_Corristo(C_Item)
{	
	name 				=	"J¹dro ognia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	


  //  effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";
	visual 				=	"ITMI_JADRO.3DS";
	material 			=	MAT_STONE;
	description			=	name;
	TEXT[1]				=	"Czuæ jak pusluje";
    TEXT[2]				= 	"energi¹.";
};
/******************************************************************************************/
INSTANCE ItMi_Buster_Pack(C_Item)
{
	name 				=	"Paczka Bustera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "£adnie pachnie";
	TEXT[2]				= "zio³ami.";
};
//******************************************************************************************/
INSTANCE ItMi_HargosWood(C_Item)
{
	name 				=	"Pociête drewno";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"oc_firewood_v1.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Hargos poci¹³ je";
	TEXT[2]				= "w krótkie kawa³ki.";
};
/******************************************************************************************/
INSTANCE  Amulett_Stone(C_Item)
{
	name 			=	"Dziwny amulet";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1300;

	visual 			=	"ITMWAM_STONE.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Stone;
	on_unequip		=	UnEquip_Amulett_Stone;

	description		= "";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= NAME_Bonus_Dex;
	//COUNT[2]		= 4;
	
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	//TEXT[5]			= NAME_Value;
	//COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Stone()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,4 );
	
	};


	FUNC VOID UnEquip_Amulett_Stone ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-4 );
	
	};
/******************************************************************************************/
INSTANCE ItWr_GRU_List (C_Item)
{	
	name 				=	"Lista sk³adników";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   Use_ItWr_GRU_List;
	scemeName			=	"MAP";
	//description		= 	name;
	TEXT[3]             = "Sk³adniki do leku Fritza.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Use_ItWr_GRU_List ()
{   
     //  ItWr_GRU_List.name =	"Lista sk³adników";
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 ); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki do leku na gruŸlicê."					);
					Doc_PrintLine	( nDocID,  0, "1 - Wê¿owiec"								);
					Doc_PrintLine	( nDocID,  0, "1 - Garstka nasion b³otnika"	);
					Doc_PrintLine	( nDocID,  0, "1 - Mgie³ka"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

