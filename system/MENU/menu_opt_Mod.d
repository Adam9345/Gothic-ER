// *********************************************************************
// game options menu
// *********************************************************************

INSTANCE MENU_OPT_MOD(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_MOD_HEADLINE";
				
	items[1]		= "MENUITEM_MOD_NEW_LEARN_POINTS_WITHOUT_BONUSES";
	items[2]		= "MENUITEM_MOD_NEW_LEARN_POINTS_WITHOUT_BONUSES_CHOICE";
	
	// items[3]		= "MENUITEM_MOD_SCALE_WEAPONS_WITH_DEX";
	// items[4]		= "MENUITEM_MOD_SCALE_WEAPONS_WITH_DEX_CHOICE";
	
	items[3]		= "MENUITEM_MOD_DISABLE_GUILD_GREETING";
	items[4]		= "MENUITEM_MOD_DISABLE_GUILD_GREETING_CHOICE";
	
	items[5]		= "MENUITEM_MOD_THREAT_RED_DIALOGS";
	items[6]		= "MENUITEM_MOD_THREAT_RED_DIALOGS_CHOICE";
	
	items[7]		= "MENUITEM_MOD_ENABLE_BLOODSPLATS";
	items[8]		= "MENUITEM_MOD_ENABLE_BLOODSPLATS_CHOICE";

	items[9]		= "MENUITEM_MOD_ENABLE_RANDOMIZE_PICKLOCK";
	items[10]		= "MENUITEM_MOD_ENABLE_RANDOMIZE_PICKLOCK_CHOICE";

	items[11]		= "MENUITEM_MOD_BACK";
	
	items[12]       = "MENUITEM_MOD_NOTE";
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_MOD_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"Edycja Rozszerzona";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


//
// Lookaround
//

INSTANCE MENUITEM_MOD_NEW_LEARN_POINTS_WITHOUT_BONUSES(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Nowy system nauki";
	text[1]		= 	"Bonusy  nie licz¹ siê do progów nauki u nauczycieli."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MOD_NEW_LEARN_POINTS_WITHOUT_BONUSES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"wy³|w³";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*0 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "newLearnPointsWithoutBonuses";
	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


//
// Fenster faden
//

// INSTANCE MENUITEM_MOD_SCALE_WEAPONS_WITH_DEX(C_MENU_ITEM_DEF)
// {
// 	backpic		=	MENU_ITEM_BACK_PIC;
// 	text[0]		=	"Nowy system obra¿eñ";
// 	text[1]		= 	"Nowy system obra¿eñ pod zrêcznoœæ."; // Kommentar
// 	// Position und Dimension	
// 	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
// 	dimx		=	4000;	dimy		=	750;
// 	// Aktionen
// 	onSelAction[0]	= SEL_ACTION_UNDEF;
// 	// Weitere Eigenschaften
// 	flags			= flags | IT_EFFECTS_NEXT;
// };

// instance MENUITEM_MOD_SCALE_WEAPONS_WITH_DEX_CHOICE(C_MENU_ITEM_DEF)
// {
// 	backPic		=	MENU_CHOICE_BACK_PIC;
// 	type		=	MENU_ITEM_CHOICEBOX;	
// 	text[0]		= 	"wy³|w³";
// 	fontName	=   MENU_FONT_SMALL;
// 	// Position und Dimension	
// 	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
// 	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
// 	// Aktionen
// 	onChgSetOption													= "scaleWeaponsWithDex";
// 	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
// 	// Weitere Eigenschaften	
// 	flags		= flags & ~IT_SELECTABLE;	
// 	flags		= flags  | IT_TXT_CENTER;
// };


//
// M.
//

INSTANCE MENUITEM_MOD_DISABLE_GUILD_GREETING(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Gildyjne przywitanie";
	text[1]		= 	"Wy³¹cza przywitanie tych samych gildi."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MOD_DISABLE_GUILD_GREETING_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"wy³|w³";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "disableGuildsGreeting";
	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// M-Sensibility
//

INSTANCE MENUITEM_MOD_THREAT_RED_DIALOGS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Czerwone dialogi";
	text[1]		= 	"Podœwietlenie na czerwono ryzykownych dialogów."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*2;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MOD_THREAT_RED_DIALOGS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;	
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"wy³|w³";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*2 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "threatRedDialog";
	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
	// Weitere Eigenschaften	
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// Bluteffekte
//

INSTANCE MENUITEM_MOD_ENABLE_BLOODSPLATS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Krew na ekranie";
	text[1]		= 	"W³¹cza krew na ekranie podczas otrzymywania obra¿eñ."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT | IT_EXTENDED_MENU;
};

instance MENUITEM_MOD_ENABLE_BLOODSPLATS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"wy³|w³";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*3 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "enableBloodSplats";
	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_EXTENDED_MENU;
};

INSTANCE MENUITEM_MOD_ENABLE_RANDOMIZE_PICKLOCK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Losowanie szyfru";
	text[1]		= 	"Ustawia losowy szyfr w skrzynkach po ponownym wczytaniu."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT | IT_EXTENDED_MENU;
};

instance MENUITEM_MOD_ENABLE_RANDOMIZE_PICKLOCK_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"wy³|w³";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*4 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "randomizePicklockStr";
	onChgSetOptionSection 											= "EDYCJAROZSZERZONA";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_EXTENDED_MENU;
};

INSTANCE MENUITEM_MOD_NOTE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"Ustawienia wymagaj¹ ponownego wczytania gry.";
	type		=	MENU_ITEM_TEXT;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_BACK_Y - 150;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


INSTANCE MENUITEM_MOD_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Wstecz";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y + 300;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};
