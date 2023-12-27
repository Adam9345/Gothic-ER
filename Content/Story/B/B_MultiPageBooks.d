//########################################################################################
//##																					##
//##	B_MultiPageBooks																##
//##	================																##
//##																					##
//##	Dieses Script ermˆglicht die Erstellung von mehrseitigen B¸chern, die			##
//##	per Tastendruck (Pfeiltasten links und rechts) durchgebl‰ttert werden kˆnnen.	##
//##	In jedem "Multibuch" m¸ss in der On_State Funktion "B_MultiPageBooks"			##
//##	aufgerufen werden. Als Parameter erwartet die Funktion einen String,			##
//##	der den Funktionsnamen der Buchseiten enth‰lt (GROﬂ GESCHRIEBEN!),				##
//##	und einen Integer f¸r die maximale Seitenzahl des Buches.						##
//##	Der eigentliche Inhalt der B¸cher wird dann in B_MultiPageBooks_BookContent.d	##
//##	festgelegt (siehe Beispiel).													##
//##																					##
//########################################################################################

// ---------------- Ein paar Variablen ----------------
var int CurrentPage;			//Aktuelle Seite
var string CurrentBook;			//Aktuelles Buch
var int CurrentBookMaxPage;		//Anzahl an Seiten des aktuellen Buches
var int UpdatePage;				//Soll eine neue Seite angezeigt werden?


// -------- Was w‰ren wir nur ohne den Buchhelfer? ----------
instance BookHelper (C_NPC)
{
	name							= "";
	id								= 43;
    attribute [ATR_HITPOINTS_MAX]	= 24;
    attribute [ATR_HITPOINTS]		= 24;
	Mdl_SetVisual	(self,"HUMANS.MDS");
};


// -------- ZS Schleife zur Tastenabfrage ----------

func void ZS_MultiPageBooks()
{
	//Damit sich der hero nicht beim umbl‰ttern dreht^^
	var oCNpc her;
	her = Hlp_GetNpc(hero);
	her._zCVob_bitfield[2] = (her._zCVob_bitfield[2] & ~ zCVob_bitfield2_sleepingMode) | 0;
};

func int ZS_MultiPageBooks_Loop()
{
	//nˆtig, da MEM_InsertKeyEvent sonst auch gleich die neue Seite mit pl‰ttet
	Ai_Wait (self, 0.1);

	if (UpdatePage == TRUE)
	{
		//Doc-Funktion f¸r die n‰chste Seite aufrufen
		var string NextPage;
		NextPage = ConcatStrings(CurrentBook, IntToString(CurrentPage));
		MEM_CallByString (NextPage);
		UpdatePage = FALSE;
	};

	var int LeftKey;
	var int RightKey;
	var int EscKey;

	LeftKey = MEM_KeyState(KEY_LEFTARROW);//edited 
	RightKey = MEM_KeyState(KEY_RIGHTARROW);
	EscKey = MEM_KeyState(KEY_ESCAPE);

	if (LeftKey == KEY_PRESSED)
	&& (CurrentPage > 1)
	{
		CurrentPage -= 1;

		//Alte Seite schlieﬂen
		MEM_InsertKeyEvent (KEY_ESCAPE);
		UpdatePage = TRUE;

		return LOOP_CONTINUE;
	};

	if (RightKey == KEY_PRESSED)
	&& (CurrentPage < CurrentBookMaxPage)
	{
		CurrentPage += 1;

		//Alte Seite schlieﬂen
		MEM_InsertKeyEvent (KEY_ESCAPE);
		UpdatePage = TRUE;

		return LOOP_CONTINUE;
	};

	if (EscKey == KEY_PRESSED)
	{
		return LOOP_END;
	};
};

func void ZS_MultiPageBooks_End()
{
	//Nicht vergessen den hero wieder aufzutauen
	var oCNpc her;
	her = Hlp_GetNpc(hero);
	her._zCVob_bitfield[2] = (her._zCVob_bitfield[2] & ~ zCVob_bitfield2_sleepingMode) | 1;

	B_RemoveNpc (self);
};


// ------- Die eigentliche Funktion, die ¸ber die On_State eines "Multibuches" aufgerufen wird --------------

func void B_MultiPageBooks(var string BookFunction, var int MaxPage)
{
	CurrentBook = ConcatStrings(BookFunction, "_");
	CurrentPage = 1;
	CurrentBookMaxPage = MaxPage;
	UpdatePage = TRUE;

	Wld_SpawnNpcRange (hero, BookHelper, 1, 500);

	var C_NPC Book;
	Book = Hlp_GetNPC (BookHelper);

	AI_StartState (Book, ZS_MultiPageBooks, 1, "");
};



// ---- Beispiel f¸r das "neue Format", was Multib¸cher (schˆnes Wort^^) haben m¸ssen ----

INSTANCE MultiTestbuch(C_Item)
{
	name			=	"Dickes Buch";
	mainflag		=	ITEM_KAT_DOCS;
	visual			=	"ItWr_Book_02_04.3ds";
	material		=	MAT_LEATHER;
	scemeName		=	"MAP";	
	description		=	"Zum Testen von mehrseitigen B¸chern";
	on_state[0]		=	UseMultiBuch2;
};

FUNC VOID UseMultiBuch2()
{
	B_MultiPageBooks("BOOK_TEST", 4);	//Doc-Funktionen siehe B_MultiPageBooks_BookContent.d
};

