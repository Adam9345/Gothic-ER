/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* PRZEDMIOTY ZADAÑ - ROZDZIA£ 2
******* Opis: Ró¿norodne przedmioty zwi¹zane z zadaniami.
*****************************************************/

////////////////////////////////////////////////
// Precjoza Cronosa
////////////////////////////////////////////////
INSTANCE ItMi_CronosPrecious (C_Item)
{
	name 				=	"Precjoza Cronosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Wewn¹trz znajduj¹ siê fragmenty";
	TEXT[3]				= "magicznych artefaktów.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};



/****************************************************
******* ZADANIE: NOWE NIESAMOWITE ZIELE
******* WIADOMOŒÆ: PROPOZYCJA OD UCZNIA JORU
******* KLUCZ: OTRZYMANY OD UCZNIA JORU
*****************************************************/

INSTANCE ItMis_LetterFromStudent (C_ITEM)
{
	name 					=	"Liœcik od ucznia Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Nowicjusz da³ mi tê kartkê";
	TEXT[3] 				=	"bez s³owa wyjaœnieñ";
	on_state[0]				=	Use_LetterFromStudent;
};

FUNC VOID Use_LetterFromStudent()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  1);
	Doc_SetPage 	( nDocID,  0, "letters.TGA", 0);
	Doc_SetMargins	( nDocID,  -1,  50, 50, 50, 50, 1);
	Doc_SetFont 	( nDocID,  -1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Spotkajmy siê przy stoisku Fortuno.");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_Show		( nDocID );
	
	if (ItemUsed_LetterFromStudent == false)
	{
	ItemUsed_LetterFromStudent = TRUE;
	};
};


INSTANCE ItMis_JoruSecretBook(C_Item)
{	
	name 					=	"Notatnik Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	Use_JoruSecretBook;
	description				=	name;
	TEXT[0]					=	"Lista przepisów jakie";
	TEXT[1]					=	"Joru przechwyci³ od ";
	TEXT[2]					=	"Guru...";
};
	FUNC VOID Use_JoruSecretBook()
	{   
					
					var int			nDocID;	
					nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Lista przepisów"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "1. Miodowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "2. Grzybowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "3. Zio³owy Nowicjusz");
					Doc_PrintLines	( nDocID,  0, "--- bardzo udany przepis --- sprzedany Jacko z Nowego Obozu");
					Doc_PrintLine	( nDocID,  0,  "4. Mrok Pó³nocy");
					Doc_PrintLines	( nDocID,  0,  "--- przepis sprzedany gdzie siê tylko da³o");
					Doc_PrintLine	( nDocID,  0,  "-----");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "170 bry³ek rudy + 90... 260 ----");
					Doc_PrintLine	( nDocID,  1,  "-----------");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "5. Oddech Œni¹cego - nie sprzedany" );
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "-- rzeczy do zrobienia:");
					Doc_PrintLines	( nDocID,  1,  "- u³o¿yæ przypowieœæ o Œni¹cym");
					Doc_PrintLines	( nDocID,  1,  "- spotkanie z Baal Lukorem");
					Doc_PrintLines	( nDocID,  1,  "- poprosiæ Balora o kontakt do kupca");
					
					Doc_Show		( nDocID );
};

INSTANCE ItMis_RecipeSlepperBreath (C_Item)
{	
	name 				=	"Receptura: Oddech Œni¹cego";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseNovizeRecepte;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= 	"Receptura na mocniejsze ziele";	
	TEXT[5]				= 	NAME_Value;		COUNT[5]			= 	value;
	
};
func void UseNovizeRecepte ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Oddech Œni¹cego"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Sprawa wygl¹da dosyæ prosto. PóŸnym wieczorem próbowaliœmy opracowaæ coœ nowego. Doszliœmy do wniosku, ¿eby dodaæ drug¹ najpospolitsz¹ roœlinê na bagnie. Mianowicie - s³abe ziele lecznicze. Da³o to œwietny efekt, jednak dla aromatu dodaliœmy jeszcze nasiona czerwonego buka."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};	



//*******************************************
// EDYCJA ROZSZERZONA
// 27 LIPIEC
//********************************************

//---------------------------------------------------------------------
//	ULEPSZONY ALKOHOL
//---------------------------------------------------------------------
INSTANCE ItMi_Alchemy_Alcohol_02 (C_Item)
{
	name 				=	"Ulepszony czysty alkohol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	80;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			=  name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
//---------------------------------------------------------------------
//	lista R¹czki
//---------------------------------------------------------------------

//-----------------------------------------------
// Receptura Nowicjuszy
//-----------------------------------------------

var int czytane_NotatkiAlchemika;
/* ==================================
Notatki alchemika
========================================= */
INSTANCE NotatkiAlchemika (C_Item)
{	
	name 				=	"Notatki alchemika";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseNortes2;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= "Notatki starego alchemika";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseNortes2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "17 listopada"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Zauwa¿y³em, ¿e po bagnie kr¹¿y tak¿e inny badacz. Okaza³o siê, ¿e to Steh. Jeden z naszych Nowicjuszy. Ustali³, ¿e na tych terenach mieszka³a jakaœ rasa. Byli wyj¹tkowo rozwiniêci. Posiadali w³asne pismo, oraz kult. Steh uwa¿a, ¿e byli to ludzie. Ja jednak uwa¿am, ¿e odpowiedŸ znajdê dopiero w jaskini na wzgórzu.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					if (czytane_NotatkiAlchemika == false)
					{
					czytane_NotatkiAlchemika = true;
					B_GiveXP (150);
					};
		
};	

/******************************************************************************************/
INSTANCE It_OdtrutkaNaKaca(C_Item)
{	
	name 				=	"WRONG ITEM!!! Herbatka na kaca";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual	 			=	"ItFo_Potion_Water_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseTea1;
	scemeName			=	"POTION";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseTea1()
	{
		//print ("Zaraz przestanie mnie boleæ g³owa");
	};
	
//////////////////////////////////////////////////////
// ZADANIE: PRZYWO£ANIE POS£AÑCA ŒNI¥CEGO
//////////////////////////////////////////////////////	
INSTANCE ItWr_MessengerList (C_Item)
{	
	name 				=	"Lista od Y'Beriona";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=  Use_Book_MessengerList;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[2]				= "Te rzeczy s¹ potrzebne,";
	TEXT[3]				= "aby przywo³aæ pos³añca Œni¹cego.";
	//TEXT[5]			= NAME_Value;
	//COUNT[5]		= value;
	
};
func void Use_Book_MessengerList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Widzia³em prosty o³tarz z dwoma kadzid³ami obok. Wyczuwa³em czyj¹œ obecnoœæ lecz nie widzia³em ¿adnej postaci. Czu³em dziwny spokój. Na o³tarzu le¿a³y nastêpuj¹ce przedmioty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					if (Npc_HasItems (hero, ItMi_WhiteWolfBlood) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi¹ bia³ego wilka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi¹ bia³ego wilka (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_RavenHerb_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- krucze ziele (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- krucze ziele (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_Bloodwood_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- nasiona czerwonego buka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- nasiona czerwonego buka (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_utarteJagody_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- utarte nasiona ogniociernia (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- utarte nasiona ogniociernia (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Honey) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- miód (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- miód (brak)"					);
					};
					if (Npc_HasItems (hero, ItMiJoint_3) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- skrêt Zew Nocy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- skrêt Zew Nocy (brak)"					);
					};
					if (Npc_HasItems (hero, ItMi_Alchemy_Quicksilver_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rtêci (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rtêci (brak)"					);
					};
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko by³o niezwykle uporz¹dkowane i mia³em wra¿enie, ¿e ka¿dy z tych elementów ma jakieœ znaczenie."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};	
//---------------------------------------------------------
INSTANCE ItMi_WhiteWolfBlood(C_Item)
{
	name 			=	"Krew bia³ego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 			=	25;	

	visual 			=	"ItMi_Blood.3ds";
	material 		=	MAT_GLAS;

	description		= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpEssenz;
};
//---------------------------------------------------------
INSTANCE ItMi_FakeJoints (C_Item)
{
	name 				=	"Prezent dla Ciphera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Œmierdzi gorzej ni¿ ca³a";
	TEXT[2]				= "ta przeklêta Kolonia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------



INSTANCE ItWr_JeremiachList (C_Item)
{	
	name 				=	"Lista Sk³adników";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]		=  Use_Book_JeremiachList;
	scemeName		=	"MAP";
	description		= 	name;
	TEXT[2]				= "Lista od Jeremiasza";
	TEXT[3]				= "";
	//TEXT[5]			= NAME_Value;
	//COUNT[5]		= value;
	
};
func void Use_Book_JeremiachList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "Sk³adniki");
					Doc_PrintLine	( nDocID,  0, ""					);
					if (Npc_HasItems (hero, ItFo_Plants_OrcHerb_01) >=2) 
					{
					Doc_PrintLines	( nDocID,  0, "- 2 Orkowe ziela (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- 2 Orkowe ziela (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_Velayis_01) >=2) 
					{
					Doc_PrintLines	( nDocID,  0, "- 2 Velaisy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- 2 Velaisy (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Plants_Stoneroot_01) >=3) 
					{
					Doc_PrintLines	( nDocID,  0, "- 3 Twardzienie (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- 3 Twardzienie (brak)"					);
					};
					if (Npc_HasItems (hero, ItAt_Bloodfly_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- Skrzyd³a Krwiopijcy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- Skrzyd³a Krwiopijcy (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Honey) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- miód (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- miód (brak)"					);
					};
					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};	

//---------------------------------------------------------

INSTANCE ItMi_ConnorItems (C_Item)
{
	name 				=	"Rzeczy Connora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_JeweleryChest.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "Przedmioty skradzione";
	TEXT[2]				= "Connorowi.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
//---------------------------------------------------------
INSTANCE ItMi_Tondrall_Slab(C_Item)
{
	name 				=	"Pradawne tabliczki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_TONDRALL.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[2]				= "";
	TEXT[2]				= "";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------
INSTANCE ItWr_BRANDICK_SKARB(C_Item)
{	
	name 					=	"Mapa Brandicka";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	300;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmapBrandS;

	description				= name;
	TEXT[0]					= "";
	TEXT[1]					= "";
	TEXT[2]					= "";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmapBrandS()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_BRAND_SKARB.tga", 	1	);  //  1 -> DO NOT SCALE 

					Doc_Show		( nDocID 	);
	};

//---------------------------------------------------------

INSTANCE ItMi_Plaga_Potion (C_Item)
{
	name 				=	"Mikstura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ITPO_ER02.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[1]				= "Mikstura odpêdzaj¹ca";
	TEXT[2]				= "szczury.";
	
};

//---------------------------------------------------------
INSTANCE ItMi_Zjawa_Amulet (C_Item)
{
	name 				=	"Dziwny amulet";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ITMWAM_ZJAWA_Grim.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[1]				= "Grim zabra³ go";
	TEXT[2]				= "z jakiegoœ grobu...";
	
};


//--------------------------Znikaj¹cy Ludzie
var int VictorBook;
INSTANCE ItWr_ZL_Book(C_Item)
{	
	name 					=	"Dziennik";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Dziennik Victora";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_ZL_BOOK;
};

FUNC VOID Use_ZL_BOOK ()
{
		var int nDocID;
		VictorBook = TRUE;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Dzieñ 231"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Szed³ spokojnie jak jagniê na rzeŸ. Nie podejrzewa³ co siê zaraz stanie. Noc by³a ciemna, chmury przykry³y gwiazdy. By³o z³owieszczo ale i fascynuj¹co. Gdy doszliœmy na miejsce a on ju¿ mia³ siê odwróciæ wyj¹³em sztylet i wbi³em mu go w plecy a potem dobra³em siê do szyi i wypru³em mu têtnicê. Wszêdzie bluzga³a krew. Sattik bêdzie mia³ nie lada ucztê.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "A ten dureñ Quentin niczego nie podejrzewa. I tak ma byæ dalej bo bóstwo musi mieæ regularny dop³yw krwi by jego moc wci¹¿ ros³a i ros³a. Tak!");
					Doc_Show		( nDocID );
					
};
//---------------------------------------------------------
var int SattikBook;
INSTANCE ItWr_ZL_Sattik(C_Item)
{	
	name 					=	"Mroczna ksiêga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczna ksiêga";
	
	
	on_state[0]			=	Use_ZL_Sattik;
};

FUNC VOID Use_ZL_Sattik ()
{
		var int nDocID;
		SattikBook = TRUE;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "SATTIK"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Sattik ores lepur were aguz ter maner. Oro tero magudo tieste lime. La rote wene buro bunnes citi. Sattik ras warut yarubelu tene maluto ergi wele kanto terupo cincele nanero potri warak trudlof masalti. Deute gogro finet lawat hargo zarozo pinter larpo ere Sattik nure firgo lauter zigri valdauser boret.");
					
				
                  
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
					B_LogEntry               (KsiegaDlaVictora,"Otworzy³em ksiêgê Victora wbrew jego zakazowi. Zobaczy³em tekst zapisany dziwacznym jêzykiem. Musze iœæ po radê do kogoœ kogo darze w Starym Obozie najwiêkszym zaufaniem.");
					
};
//---------------------------------------------------------
INSTANCE ItMi_ZL_Statue (C_Item)
{
	name 				=	"Pos¹¿ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ZL_STATUE.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[1]				= "Wyryto na nim";
	TEXT[2]				= ",,Sattik''";
	
};

//---------------------------------------------------------

INSTANCE ItMi_ZL_WBlood (C_Item)
{
	name 				=	"Krew czarnego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	

	visual 				=	"ItMi_Blood.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	
	
};
//---------------------------------------------------------
INSTANCE ItWr_PerrickToCalom (C_Item)
{	
	name 				=	"Liœcik";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePerrickWR;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= "Liœcik";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePerrickWR ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Ty stary capie..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Jesteœ tylko ³ysym parchem. K³êbkiem truch³a pa³êtaj¹cym siê po obozie pe³nym ³ysych æpunów. £ys¹ pierdo³¹, która umie siê wydzieraæ na innych i patrzy na wszystkich z góry a tak naprawdê jest warta tyle co ³ajno kretoszczura.  To, ¿e ktokolwiek s³ucha takiej ³ajzy jak ty œwiadczy tylko jak nisko stoi ta zatêch³a kolonia. Niestety to zielsko, które wypalacie nie szkodzi twojemu mózgowi bo coœ takiego w ogóle nie istnieje w twoim ³ysym jak dupa czerepie. Jesteœ wart tyle co pó³ kilo rzygów zdech³ego szczura. Ps. Mam nadzieje, ¿e ktoœ w twoim laboratorium kiedyœ naszcza ci do naczynia i powie, ¿e to esencja zdrowia dla mistrza Caloma.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		
};	
//---------------------------------------------------------

INSTANCE ItMi_BLA_ZWOJ (C_Item)
{
	name 				=	"Klinga Innosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ITAR_SCROLL_42.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	
	
};
//---------------------------------------------------------
INSTANCE ItWr_KHMap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseMapKH;

	description				= name;
	TEXT[1]					= "Mapa Kolonii na której";
	TEXT[2]					= "zaznaczono po³o¿enie";
	TEXT[3]					= "Korony Hrodgira.";
	
};

FUNC VOID UseMapKH()
{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_KH.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};
//---------------------------------------------------------
var int TIRR_Zapiski;
INSTANCE ItWr_TirrutKH (C_Item)
{	
	name 				=	"Zapiski Tirruta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseTirrutKH;
	scemeName			=	"MAP";
	description			= 	name;
	
	
};
func void UseTirrutKH ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Jasna cholera!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Za wczeœnie siê pochwali³em... Ju¿ powiedzia³em swoim kumplom, ¿e mam legendarn¹ koronê Hrodgira a tymczasem strzeg¹ jej o¿ywieñcy w tym sam Hrodgir w srebrnej zbroi. Na co mi ta wiedza skoro ten cenny przedmiot nie wpadnie w moje rêce? Móg³bym go odsprzedaæ Magnatom w Starym Obozie i ¿yæ dostatnio przez wiele lat. A tak? Nici z mego planu. Póki czegoœ nie wymyœlê to fakt istnienia tego artefaktu bêdzie mnie tylko dobija³.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_Show		( nDocID );
				    TIRR_Zapiski = TRUE;	
		 B_LogEntry               (KoronaHrodgira,"Odnalaz³em zapiski Tirutta i jego mapê. Okazuje siê, ¿e dopiero ona wiedzie do korony Hrodgira. Tirutt tak naprawdê nigdy jej nie mia³.");
};	
//---------------------------------------------------------
instance ItHe_Hrodgir(C_Item)
{
        name                = "Korona Hrodgira";
        mainflag            = ITEM_KAT_NONE; 
        flags 				= ITEM_MISSION;
		
        visual     = "ER_KH_CROWN.3DS";   
       
        material      = MAT_LEATHER; 
		
        description   = name;
        text[0]       = "Pokryta szczerym z³otem.";  
};
//---------------------------------------------------------
INSTANCE ItWr_CaineToFritz (C_Item)
{	
	name 				=	"List";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UseCaineToFritz;
	scemeName			=	"MAP";
	description			= 	 name;
	TEXT[1]				=  "List";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UseCaineToFritz ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 ); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " ");
					Doc_PrintLine	( nDocID,  0, "Do Fritza");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Przesy³am niniejszym miksturê lecznicz¹, któr¹ powinieneœ niezw³ocznie wypiæ. Ciê¿ki przypadek gruŸlicy jaki ci dolega wymaga byœ wypi³ tê miksturê w ca³oœci naraz i niech Œni¹cy broni ciê przed piciem alkoholu tu¿ po tym. Objawy powinny szybko ust¹piæ jeœli opisa³eœ mi wszystko jak nale¿y w swoim poprzednim liœcie.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					GRU_STRMIS = TRUE;
					Log_CreateTopic		(Gruzlik,	LOG_MISSION);
	                Log_SetTopicStatus	(Gruzlik,	LOG_RUNNING);
		            B_LogEntry               (Gruzlik,"Odnalaz³em zw³oki jakiegoœ Nowicjusza z Sekty oraz list i rozbit¹ butelkê z jak¹œ cuchn¹c¹ ciecz¹. List prowadzi do niejakiego Fritza w Nowym Obozie. To chory Najemnik. Móg³bym go uprzedziæ o tym co zasz³o.");
};	
//---------------------------------------------------------
instance ItFo_Potion_Fritz01(C_Item)
{
        name                = "Pusta fiolka";
        mainflag            = ITEM_KAT_NONE; 
        flags 				= ITEM_MISSION;
		
        visual              = "ITFO_POTION_Fritz.3ds";   
       
        material      = MAT_LEATHER; 
		
        description   = name;
        text[0]       = "Zawartoœæ w caloœci";  
		text[1]       = "siê wyla³a."; 
		
};    
  
//---------------------------------------------------------
instance ItFo_Potion_Fritz02(C_Item)
{
        name                = "Lekarstwo Fritza";
        mainflag            = ITEM_KAT_Potions; 
        flags 				= ITEM_MISSION;
		
        visual              = "ITFO_POTION_PINK_03.3ds";   
		
       material 		=	MAT_GLAS;
	   
	   scemeName		=	"POTIONFAST";
	   
		
        description   = name;
        text[0]       = "Muszê j¹ dostarczyæ"; 
		text[1]       = "Fritzowi..."; 
};      
//---------------------------------------------------------
instance ItWr_CorCToArtegor (C_Item)
{	
	name 				=	"Zapieczêtowane pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "Przepustka do starej kopalni";

	TEXT[1]				= "Pismo do stra¿y od Cor Caloma";


};
