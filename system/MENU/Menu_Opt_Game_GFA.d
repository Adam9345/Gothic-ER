// *********************************************************************
// GFA options menu
// *********************************************************************

INSTANCE MENU_OPT_GFA(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_GFA_HEADLINE";
				
	items[1]		= "MENUITEM_OPT_GFA_GFA";
	items[2]		= "MENUITEM_OPT_GFA_GFA_CHOICE";

    items[3]		= "MENUITEM_OPT_GFA_TRUEHITCHANCE";
	items[4]		= "MENUITEM_OPT_GFA_TRUEHITCHANCE_CHOICE";

    items[5]		= "MENUITEM_OPT_GFA_REUSEPROJECTILES";
	items[6]		= "MENUITEM_OPT_GFA_REUSEPROJECTILES_CHOICE";

	items[7]		= "MENUITEM_GFA_BACK";
	
	items[8]       = "MENUITEM_GFA_NOTE";
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_GFA_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"Wolne celowanie";
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

// const string GFA_MENU_LABEL           = "Wolne celowanie";            // "Free aiming"
// const string GFA_MENU_CHOICES         = "wy³|w³";                   // "off|on"
// const string GFA_MENU_DESCR           = "Celowanie mysz¹"; // "Requires mouse controls"

// // Positioning and textures
// const int    GFA_MENU_ID              = 7;                          // Next available Y-spot in GFA menu = entry number
// const int    GFA_MENU_START_Y         = 2400;                       // Match MENU_START_Y: height of first menu entry
// const int    GFA_MENU_DY              = 550;                        // Match MENU_SOUND_DY: space between entries
// const int    GFA_MENU_CHC_H           = 120;                        // Match MENU_CHOICE_YPLUS: height of choice entry
// const string GFA_MENU_ITEM_BACK_PIC   = "";                         // Match MENU_ITEM_BACK_PIC
// const string GFA_MENU_CHOICE_BACK_PIC = "MENU_CHOICE_BACK.TGA";     // Match MENU_CHOICE_BACK_PIC
// const string GFA_MENU_FONT_DEFAULT    = "FONT_OLD_20_WHITE.TGA";    // Match MENU_FONT_DEFAULT
// const string GFA_MENU_FONT_SMALL      = "FONT_OLD_10_WHITE.TGA";    // Match MENU_FONT_SMALL

// // Redefinition of fixed menu constants to ensure their existence (do not change)
// const int    GFA_MENU_ITEM_TEXT      = 1;                           // MENU_ITEM_TEXT
// const int    GFA_MENU_ITEM_CHOICEBOX = 5;                           // MENU_ITEM_CHOICEBOX
// const int    GFA_IT_CHROMAKEYED      = 1;                           // IT_CHROMAKEYED
// const int    GFA_IT_TRANSPARENT      = 2;                           // IT_TRANSPARENT
// const int    GFA_IT_SELECTABLE       = 4;                           // IT_SELECTABLE
// const int    GFA_IT_TXT_CENTER       = 16;                          // IT_TXT_CENTER
// const int    GFA_IT_EFFECTS_NEXT     = 128;                         // IT_EFFECTS_NEXT


Instance MENUITEM_OPT_GFA_GFA (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_ITEM_BACK_PIC;
    type                  = GFA_MENU_ITEM_TEXT;
    fontName              = GFA_MENU_FONT_DEFAULT;
    text[0]               = GFA_MENU_LABEL;
    text[1]               = GFA_MENU_DESCR;
    posx                  = 1000;
    posy                  = MENU_START_Y + MENU_DY*0;
    dimx                  = 4000;
    dimy                  = 750;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_SELECTABLE | GFA_IT_EFFECTS_NEXT;
};


Instance MENUITEM_OPT_GFA_GFA_CHOICE (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_CHOICE_BACK_PIC;
    type                  = GFA_MENU_ITEM_CHOICEBOX;
    fontName              = GFA_MENU_FONT_SMALL;
    text[0]               = GFA_MENU_CHOICES;
    posx                  = 5000;
    posy                  = MENU_START_Y + MENU_DY*0 + MENU_CHOICE_YPLUS;
    dimx                  = MENU_SLIDER_DX;
    dimy                  = MENU_CHOICE_DY;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_TXT_CENTER;
    onChgSetOption        = "freeAimingEnabled";
    onChgSetOptionSection = "GFA";
};

Instance MENUITEM_OPT_GFA_TRUEHITCHANCE (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_ITEM_BACK_PIC;
    type                  = GFA_MENU_ITEM_TEXT;
    fontName              = GFA_MENU_FONT_DEFAULT;
    text[0]               = "Realne trafienia";
    text[1]               = "W³¹cza szansê trafieñ";
    posx                  = 1000;
    posy                  = MENU_START_Y + MENU_DY*1;
    dimx                  = 4000;
    dimy                  = 750;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_SELECTABLE | GFA_IT_EFFECTS_NEXT;
};


Instance MENUITEM_OPT_GFA_TRUEHITCHANCE_CHOICE (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_CHOICE_BACK_PIC;
    type                  = GFA_MENU_ITEM_CHOICEBOX;
    fontName              = GFA_MENU_FONT_SMALL;
    text[0]               = "wy³|w³";
    posx                  = 5000;
    posy                  = MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
    dimx                  = MENU_SLIDER_DX;
    dimy                  = MENU_CHOICE_DY;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_TXT_CENTER;
    onChgSetOption        = "trueHitChance";
    onChgSetOptionSection = "GFA";
};

Instance MENUITEM_OPT_GFA_REUSEPROJECTILES (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_ITEM_BACK_PIC;
    type                  = GFA_MENU_ITEM_TEXT;
    fontName              = GFA_MENU_FONT_DEFAULT;
    text[0]               = "Odzyskiwanie strza³";
    text[1]               = "Odzyskiwanie strza³ z cia³ zabitych przeciwników";
    posx                  = 1000;
    posy                  = MENU_START_Y + MENU_DY*2;
    dimx                  = 4000;
    dimy                  = 750;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_SELECTABLE | GFA_IT_EFFECTS_NEXT;
};


Instance MENUITEM_OPT_GFA_REUSEPROJECTILES_CHOICE (GFA_C_Menu_Item) {
    backPic               = GFA_MENU_CHOICE_BACK_PIC;
    type                  = GFA_MENU_ITEM_CHOICEBOX;
    fontName              = GFA_MENU_FONT_SMALL;
    text[0]               = "wy³|w³";
    posx                  = 5000;
    posy                  = MENU_START_Y + MENU_DY*2 + MENU_CHOICE_YPLUS;
    dimx                  = MENU_SLIDER_DX;
    dimy                  = MENU_CHOICE_DY;
    flags                 = GFA_IT_CHROMAKEYED | GFA_IT_TRANSPARENT | GFA_IT_TXT_CENTER;
    onChgSetOption        = "reuseProjectiles";
    onChgSetOptionSection = "GFA";
};

INSTANCE MENUITEM_GFA_NOTE(C_MENU_ITEM_DEF) 
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


INSTANCE MENUITEM_GFA_BACK(C_MENU_ITEM_DEF)
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
