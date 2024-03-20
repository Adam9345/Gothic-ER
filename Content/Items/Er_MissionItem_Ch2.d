/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* PRZEDMIOTY ZADA� - ROZDZIA� 2
******* Opis: R�norodne przedmioty zwi�zane z zadaniami.
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
	TEXT[2]				= "Wewn�trz znajduj� si� fragmenty";
	TEXT[3]				= "magicznych artefakt�w.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};



/****************************************************
******* ZADANIE: NOWE NIESAMOWITE ZIELE
******* WIADOMO��: PROPOZYCJA OD UCZNIA JORU
******* KLUCZ: OTRZYMANY OD UCZNIA JORU
*****************************************************/

INSTANCE ItMis_LetterFromStudent (C_ITEM)
{
	name 					=	"Li�cik od ucznia Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[2] 				=	"Nowicjusz da� mi t� kartk�";
	TEXT[3] 				=	"bez s�owa wyja�nie�";
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
	Doc_PrintLines	( nDocID,  0, "Spotkajmy si� przy stoisku Fortuno.");
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
	TEXT[0]					=	"Lista przepis�w jakie";
	TEXT[1]					=	"Joru przechwyci� od ";
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
					Doc_PrintLine	( nDocID,  0, "Lista przepis�w"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "1. Miodowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "2. Grzybowy Nowicjusz");
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_PrintLine	( nDocID,  0, "3. Zio�owy Nowicjusz");
					Doc_PrintLines	( nDocID,  0, "--- bardzo udany przepis --- sprzedany Jacko z Nowego Obozu");
					Doc_PrintLine	( nDocID,  0,  "4. Mrok P�nocy");
					Doc_PrintLines	( nDocID,  0,  "--- przepis sprzedany gdzie si� tylko da�o");
					Doc_PrintLine	( nDocID,  0,  "-----");
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "170 bry�ek rudy + 90... 260 ----");
					Doc_PrintLine	( nDocID,  1,  "-----------");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "5. Oddech �ni�cego - nie sprzedany" );
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLine	( nDocID,  1,  "-- rzeczy do zrobienia:");
					Doc_PrintLines	( nDocID,  1,  "- u�o�y� przypowie�� o �ni�cym");
					Doc_PrintLines	( nDocID,  1,  "- spotkanie z Baal Lukorem");
					Doc_PrintLines	( nDocID,  1,  "- poprosi� Balora o kontakt do kupca");
					
					Doc_Show		( nDocID );
};

INSTANCE ItMis_RecipeSlepperBreath (C_Item)
{	
	name 				=	"Receptura: Oddech �ni�cego";

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
					Doc_PrintLine	( nDocID,  0, "Oddech �ni�cego"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Sprawa wygl�da dosy� prosto. P�nym wieczorem pr�bowali�my opracowa� co� nowego. Doszli�my do wniosku, �eby doda� drug� najpospolitsz� ro�lin� na bagnie. Mianowicie - s�abe ziele lecznicze. Da�o to �wietny efekt, jednak dla aromatu dodali�my jeszcze nasiona czerwonego buka."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
//	lista R�czki
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
					Doc_PrintLines	( nDocID,  0, "Zauwa�y�em, �e po bagnie kr��y tak�e inny badacz. Okaza�o si�, �e to Steh. Jeden z naszych Nowicjuszy. Ustali�, �e na tych terenach mieszka�a jaka� rasa. Byli wyj�tkowo rozwini�ci. Posiadali w�asne pismo, oraz kult. Steh uwa�a, �e byli to ludzie. Ja jednak uwa�am, �e odpowied� znajd� dopiero w jaskini na wzg�rzu.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
		//print ("Zaraz przestanie mnie bole� g�owa");
	};
	
//////////////////////////////////////////////////////
// ZADANIE: PRZYWO�ANIE POS�A�CA �NI�CEGO
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
	TEXT[2]				= "Te rzeczy s� potrzebne,";
	TEXT[3]				= "aby przywo�a� pos�a�ca �ni�cego.";
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
					Doc_PrintLines	( nDocID,  0, "Widzia�em prosty o�tarz z dwoma kadzid�ami obok. Wyczuwa�em czyj�� obecno�� lecz nie widzia�em �adnej postaci. Czu�em dziwny spok�j. Na o�tarzu le�a�y nast�puj�ce przedmioty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					if (Npc_HasItems (hero, ItMi_WhiteWolfBlood) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi� bia�ego wilka (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- fiolka z krwi� bia�ego wilka (brak)"					);
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
					Doc_PrintLines	( nDocID,  0, "- mi�d (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- mi�d (brak)"					);
					};
					if (Npc_HasItems (hero, ItMiJoint_3) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- skr�t Zew Nocy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- skr�t Zew Nocy (brak)"					);
					};
					if (Npc_HasItems (hero, ItMi_Alchemy_Quicksilver_01) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rt�ci (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- butelka rt�ci (brak)"					);
					};
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wszystko by�o niezwykle uporz�dkowane i mia�em wra�enie, �e ka�dy z tych element�w ma jakie� znaczenie."	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};	
//---------------------------------------------------------
INSTANCE ItMi_WhiteWolfBlood(C_Item)
{
	name 			=	"Krew bia�ego wilka";

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
	TEXT[2]				= "�mierdzi gorzej ni� ca�a";
	TEXT[2]				= "ta przekl�ta Kolonia";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------



INSTANCE ItWr_JeremiachList (C_Item)
{	
	name 				=	"Lista Sk�adnik�w";

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
					Doc_PrintLines	( nDocID,  0, "Sk�adniki");
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
					Doc_PrintLines	( nDocID,  0, "- Skrzyd�a Krwiopijcy (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- Skrzyd�a Krwiopijcy (brak)"					);
					};
					if (Npc_HasItems (hero, ItFo_Honey) >=1) 
					{
					Doc_PrintLines	( nDocID,  0, "- mi�d (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- mi�d (brak)"					);
					};
					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
	TEXT[1]				= "Mikstura odp�dzaj�ca";
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
	TEXT[1]				= "Grim zabra� go";
	TEXT[2]				= "z jakiego� grobu...";
	
};


//--------------------------Znikaj�cy Ludzie
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
					Doc_PrintLine	( nDocID,  0, "Dzie� 231"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Szed� spokojnie jak jagni� na rze�. Nie podejrzewa� co si� zaraz stanie. Noc by�a ciemna, chmury przykry�y gwiazdy. By�o z�owieszczo ale i fascynuj�co. Gdy doszli�my na miejsce a on ju� mia� si� odwr�ci� wyj��em sztylet i wbi�em mu go w plecy a potem dobra�em si� do szyi i wypru�em mu t�tnic�. Wsz�dzie bluzga�a krew. Sattik b�dzie mia� nie lada uczt�.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "A ten dure� Quentin niczego nie podejrzewa. I tak ma by� dalej bo b�stwo musi mie� regularny dop�yw krwi by jego moc wci�� ros�a i ros�a. Tak!");
					Doc_Show		( nDocID );
					
};
//---------------------------------------------------------
var int SattikBook;
INSTANCE ItWr_ZL_Sattik(C_Item)
{	
	name 					=	"Mroczna ksi�ga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczna ksi�ga";
	
	
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
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
					B_LogEntry               (KsiegaDlaVictora,"Otworzy�em ksi�g� Victora wbrew jego zakazowi. Zobaczy�em tekst zapisany dziwacznym j�zykiem. Musze i�� po rad� do kogo� kogo darze w Starym Obozie najwi�kszym zaufaniem.");
					
};
//---------------------------------------------------------
INSTANCE ItMi_ZL_Statue (C_Item)
{
	name 				=	"Pos��ek";

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
	name 				=	"Li�cik";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;  
	on_state[0]			=   UsePerrickWR;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1]				= "Li�cik";
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
					Doc_PrintLines	( nDocID,  0, "Jeste� tylko �ysym parchem. K��bkiem truch�a pa��taj�cym si� po obozie pe�nym �ysych �pun�w. �ys� pierdo��, kt�ra umie si� wydziera� na innych i patrzy na wszystkich z g�ry a tak naprawd� jest warta tyle co �ajno kretoszczura.  To, �e ktokolwiek s�ucha takiej �ajzy jak ty �wiadczy tylko jak nisko stoi ta zat�ch�a kolonia. Niestety to zielsko, kt�re wypalacie nie szkodzi twojemu m�zgowi bo co� takiego w og�le nie istnieje w twoim �ysym jak dupa czerepie. Jeste� wart tyle co p� kilo rzyg�w zdech�ego szczura. Ps. Mam nadzieje, �e kto� w twoim laboratorium kiedy� naszcza ci do naczynia i powie, �e to esencja zdrowia dla mistrza Caloma.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
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
	TEXT[1]					= "Mapa Kolonii na kt�rej";
	TEXT[2]					= "zaznaczono po�o�enie";
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
					Doc_PrintLines	( nDocID,  0, "Za wcze�nie si� pochwali�em... Ju� powiedzia�em swoim kumplom, �e mam legendarn� koron� Hrodgira a tymczasem strzeg� jej o�ywie�cy w tym sam Hrodgir w srebrnej zbroi. Na co mi ta wiedza skoro ten cenny przedmiot nie wpadnie w moje r�ce? M�g�bym go odsprzeda� Magnatom w Starym Obozie i �y� dostatnio przez wiele lat. A tak? Nici z mego planu. P�ki czego� nie wymy�l� to fakt istnienia tego artefaktu b�dzie mnie tylko dobija�.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					Doc_Show		( nDocID );
				    TIRR_Zapiski = TRUE;	
		 B_LogEntry               (KoronaHrodgira,"Odnalaz�em zapiski Tirutta i jego map�. Okazuje si�, �e dopiero ona wiedzie do korony Hrodgira. Tirutt tak naprawd� nigdy jej nie mia�.");
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
        text[0]       = "Pokryta szczerym z�otem.";  
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
					Doc_PrintLines	( nDocID,  0, "Przesy�am niniejszym mikstur� lecznicz�, kt�r� powiniene� niezw�ocznie wypi�. Ci�ki przypadek gru�licy jaki ci dolega wymaga by� wypi� t� mikstur� w ca�o�ci naraz i niech �ni�cy broni ci� przed piciem alkoholu tu� po tym. Objawy powinny szybko ust�pi� je�li opisa�e� mi wszystko jak nale�y w swoim poprzednim li�cie.");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
					GRU_STRMIS = TRUE;
					Log_CreateTopic		(Gruzlik,	LOG_MISSION);
	                Log_SetTopicStatus	(Gruzlik,	LOG_RUNNING);
		            B_LogEntry               (Gruzlik,"Odnalaz�em zw�oki jakiego� Nowicjusza z Sekty oraz list i rozbit� butelk� z jak�� cuchn�c� ciecz�. List prowadzi do niejakiego Fritza w Nowym Obozie. To chory Najemnik. M�g�bym go uprzedzi� o tym co zasz�o.");
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
        text[0]       = "Zawarto�� w calo�ci";  
		text[1]       = "si� wyla�a."; 
		
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
        text[0]       = "Musz� j� dostarczy�"; 
		text[1]       = "Fritzowi..."; 
};      
//---------------------------------------------------------
instance ItWr_CorCToArtegor (C_Item)
{	
	name 				=	"Zapiecz�towane pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "Przepustka do starej kopalni";

	TEXT[1]				= "Pismo do stra�y od Cor Caloma";


};
