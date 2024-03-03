//*******************************************************************************
//*********** GOTHIC EDYCJA ROZSZERZONA 1.4
//*********** PRZEDMIOTY ZADAÑ - ROZDZIA³ 5
//*******************************************************************************


INSTANCE ItMi_NoteFromSenyan (C_Item)
{	
	name 				=	"Notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_NoteFromSenyan;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[1]				= 	"Notatki znalezione w skrzyni  ";
	TEXT[2]				= 	"z broni¹ dla buntowników.";
};

func void Use_NoteFromSenyan ()
{   

		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Dogada³em siê z Okylem i pozwoli³ mi sk³adowaæ stare kilofy i miecze. Powiedzia³em mu, ¿e chcê je póŸniej wys³aæ do kowala w celu naprawy. To naprawdê dobra przykrywka. Nic lepszego nie mog³em dla was zdobyæ. Gdybym podkrada³ rynsztunek Najemnikom, natychmiast by mnie zabili.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Senyan");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
};

INSTANCE ItMi_SpecialBooze(C_Item)
{	
	name 				=	"Specjalna ry¿ówka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItFo_Booze_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	Use_SpecialBooze;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 20;
};

	FUNC VOID Use_SpecialBooze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	5);
	};
	


instance ItMi_RicelordRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_RicelordRing;
	on_unequip				=	UnEquip_RicelordRing;

	description		= " Pierœcieñ Ry¿owego Ksiêcia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_RicelordRing()
	{
		self.protection [PROT_FIRE] 		+=  8;
	};

	FUNC VOID UnEquip_RicelordRing()
	{
	self.protection [PROT_FIRE] 		-=  8;
	};
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///
///                                                   SUBMOD 1.6.1
///
///	
INSTANCE ItMi_Black_Crystal_CH5 (C_Item)
{
	name 				=	"Czarny kryszta³";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ER_BLACK_CRYSTAL_CH5.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "Przedmiot misyjny";
};	
//-------------------------------------------------------	
INSTANCE ItMi_TWO_Tablica (C_Item)
{
	name 				=	"Tablica";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ITMI_STONEPLATE_TWO.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "Zapisano na niej";
	TEXT[3]             = "coœ w orkowym jêzyku.";
};	
//-------------------------------------------------------	
INSTANCE ItWr_OM_T(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOMTmap;

	description				= "Mapa do Obozowiska Moroka";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOMTmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_OM_T.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
//-------------------------------------------------------	
INSTANCE ItMi_StolenGoodsSLD (C_Item)
{
	name 				=	"Skradzione towary";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	80;

	visual 				=	"Vin_Carte.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Skradzione towary";
	TEXT[3]				= "z obozu Moroka.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//-------------------------------------------------------	
INSTANCE ItMi_Black_Crystal_ABM (C_Item)
{
	name 				=	"Czarny kryszta³";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ER_BLACK_CRYSTAL_CH5.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "Pulsuje mroczn¹ energi¹.";
};	