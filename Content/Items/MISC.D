// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************
//EX_BAUMSTAMM_03.3DS
// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochöffel, Laborflasche, Roheisen (Schmiede)
const int	Value_MobsiItem			=	3;

// mit 80% kann bei einem kompletten Durchgang ca. 10 Erz verdient werden
const int	Value_SwordBlade		= 	(Value_1H_Sword_01	*8)/10;	// 80% des Fertigen Schwerts
const int	Value_SwordBladeHot		= 	(Value_SwordBlade	*8)/10;	// 80% der geschliffenen Klinge
const int	Value_SwordRawHot		= 	(Value_SwordBladeHot*8)/10; // 80% der geschmiedeten Klinge
const int	Value_SwordRaw			= 	(Value_SwordRawHot	*8)/10; // 80% des erhitzen Rohstahls

const int	Value_Schüssel			=	4;
const int	Value_Schlüssel			=	3;

const int	Value_Joint1			=	8;
const int	Value_Joint2			=	15;
const int	Value_Joint3			=	20;
const int	Value_Laute				=	10;

const int	Value_Erzbrocken		=	1;// UNBEDINGT SO LASSEN!!! M.F.
const int	Value_Fackel			=	2;

const int	Value_Sumpfkraut		=	8;
const int	Value_Pfeife			=	10;
const int	Value_Rasiermesser		=	5;// EX 25 NIEDRIGER WERT WEIL ES VIEL DAVON GIBT!!! 
const int	Value_Münze				=	0;// BITTE AUF 0 LASSEN, DAFÜR IST SIE DA, FÜR SONST NIX!!!!! M.F.

const int	Value_Kerzenständer		=	10;
const int	Value_Becher			=	 4;
const int	Value_Pokal				=	50;
const int	Value_Besteck			=	15;
const int	Value_Pfanne			=	10;
const int	Value_Krug				=	10; //35
const int	Value_Amphore			=	15; //EX 45
const int	Value_Statue			=	15;

// Alchemie-Ingredienzien
// FIXME: noch benutzen? // NEin, aber liegen überall ind er Welt, von daher als Ambient Items drinlassen!M.F.
const int	Value_Schwefel			=	20;
const int	Value_Quecksilber		=	50;
const int	Value_Salz				=	5;
const int	Value_Öl				=	80;
const int	Value_Moleratfett		=	20;
const int	Value_Alcohol			=	35;
//ITMI_SAW


/*******************************************************************************************
**	Items für Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/

/******************************************************************************************/



/******************************************************************************************/
// Krautstampfen
INSTANCE ItMiStomper (C_Item)
{
	name 				=	"Rozdrabniacz";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Stomper_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Reparieren
INSTANCE ItMiHammer (C_Item)
{
	name 				=	"M³otek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Hammer_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// im Topf rühren
INSTANCE ItMiScoop (C_Item)
{
	name 				=	"Drewniana ³y¿ka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Scoop_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[2]				= "Kucharz siê bez niej nie obejdzie.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Labor benutzen
// Fixme: wird dabei ein anderes Item generiert?
INSTANCE ItMiFlask(C_Item)
{
	name 				=	"Kolba";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItFo_Potion_Mana_02.3ds";
	material 			=	MAT_GLAS;

	description			= name;
	TEXT[2]				= "Niezbêdna ka¿demu alchemikowi!";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};


/******************************************************************************************/
//	Items für Schmiede	    					 								 		  **

INSTANCE ItMiSwordraw (C_Item)
{
	name 				=	"Stal";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordraw;

	visual 				=	"ItMi_SmithSword_Raw_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordrawhot (C_Item)
{
	name 				=	"Rozgrzana stal";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordrawhot;

	visual 				=	"ItMi_SmithSword_Rawhot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordbladehot (C_Item)
{
	name 				=	"Rozgrzane ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordbladehot;

	visual 				=	"ItMi_SmithSword_Bladehot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordblade	(C_Item)
{
	name 				=	"Ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordblade;

	visual 				=	"ItMi_SmithSword_Blade_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/*******************************************************************************************
**	Items für Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

// für Feuerspucker
INSTANCE ItLsTorchFirespit(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	Value_MobsiItem;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMiLute (C_Item)
{
	name 				=	"Lutnia";

	mainflag 			=	ITEM_KAT_NONE;
    flags 				=	ITEM_MULTI;
	
	value 				=	Value_Laute;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= UseLute;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseLute()
{
	if (Play_Lute == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (10);
		Play_Lute = TRUE;
	};

};


/******************************************************************************************/
// Für Babe-Luftzufächeln
INSTANCE ItMiWedel(C_Item)
{
	name 				=	"Liœæ palmowy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Wedel_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"COOLAIR";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
// Für Babe-Putzen
INSTANCE ItMiBrush(C_Item)
{
	name 				=	"Szczotka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Brush_01.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"BRUSH";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
INSTANCE ItMiJoint_1(C_Item)
{
	name 				=	"Zielony Nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_1;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_1()
{
	if (Firstjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (5);
		Firstjoint = TRUE;
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_2(C_Item)
{
	name 				=	"Mrok Pó³nocy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint2;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_2;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_2()
{
	if (Secondjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (10);
		Secondjoint = TRUE;
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_3(C_Item)
{
	name 				=	"Zew nocy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_3;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_3()
{
	if (Thirdjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,2);
		PrintS_Ext ("Mana +2",COL_Lime) ;
		Thirdjoint = TRUE;
	};
};

/******************************************************************************************/
INSTANCE ItMiNugget(C_Item)
{
	name 				=	"Bry³ka rudy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Erzbrocken;

	visual 				=	"ItMi_Nugget_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiNugget2(C_Item)
{
	name 				=	"Bry³ka czarnej rudy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;
							
	visual 				=	"It_CoalEr.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
//	Fackel			                					  **

INSTANCE ItLsTorch(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	"P³on¹ca pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	0;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};




/******************************************************************************************/
//STUFF//
/******************************************************************************************/

// Sumpfkraut (für Joints)
INSTANCE ItMi_Plants_Swampherb_01(C_Item)
{
	name 				=	"Bagienne ziele";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfkraut;

	visual 				=	"ItMi_Plants_Swampherb_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pipe_01 (C_Item)
{
	name 				=	"Fajka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfeife;

	visual 				=	"ItMi_Stuff_Pipe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Barbknife_01 (C_Item)
{
	name 				=	"Brzytwa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rasiermesser;

	visual 				=	"ItMi_Stuff_Barbknife_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_OldCoin_01 (C_Item)
{
	name 				=	"Moneta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Münze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//	Münze mit Mission Flag um tote liegenzulassen
INSTANCE ItMi_Stuff_OldCoin_02 (C_Item)
{
	name 				=	"Moneta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Münze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Plate_01 (C_Item)
{
	name 				=	"Talerz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Schüssel;

	//visual 				=	"ItMi_SilverPlate.3DS";
	visual 				=	"ItMi_Stuff_Plate_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Candel_01 (C_Item)
{
	name 				=	"Œwiecznik";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Kerzenständer;

	//visual 				=	"ITMI_GOLDCANDLEHOLDER.3DS";
	visual 				=	"ItMi_Stuff_Candel_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_01 (C_Item)
{
	name 				=	"Kubek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Becher;

	visual 			=	"ItMi_Stuff_Cup_01.3DS";
	//visual 				=	"ErG2_Mug.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_02 (C_Item)
{
	name 				=	"Puchar";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pokal;

	//visual 				=	"ItMi_GoldCup.3DS";
	visual 				=	"ItMi_Stuff_Cup_02.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Silverware_01 (C_Item)
{
	name 				=	"Sztuæce";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Besteck;

	visual 				=	"ItMi_Stuff_Silverware_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pan_01 (C_Item)
{
	name 				=	"Patelnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfanne;

	visual 				=	"ItMi_Stuff_Pan_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Mug_01 (C_Item)
{
	name 				=	"Dzban";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krug;

	visual 				=	"ItMi_Stuff_Mug_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Amphore_01 (C_Item)
{
	name 				=	"Amfora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Amphore;

	visual 				=	"ItMi_Stuff_Amphore_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Idol_Ogront_01 (C_Item)
{
	name 				=	"Pos¹¿ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
//ALCHIMIE//
/******************************************************************************************/
INSTANCE ItMi_Alchemy_Sulphur_01 (C_Item)
{
	name 				=	"Siarka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Schwefel;

	visual 				=	"ItMi_Alchemy_Sulphur_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Quicksilver_01 (C_Item)
{
	name 				=	"Rtêæ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Quecksilber;

	visual 				=	"ItMi_Alchemy_Quicksilver_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Salt_01 (C_Item)
{
	name 				=	"Sól";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Salz;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Syrianoil_01 (C_Item)
{
	name 				=	"Olej syrianiczny";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Öl;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "Dodatek alchemiczny.";
	TEXT[2]				= "Baza silnych mikstur.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Moleratlubric_01 (C_Item)
{
	name 				=	"Sad³o kretoszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Moleratfett;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Alcohol_01 (C_Item)
{
	name 				=	"Czysty alkohol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[2]				= "Dodatek alchemiczny.";
	TEXT[2]				= "Baza œrednich mikstur.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/********************************************************************************************/
/********************************** Edycja rozszerzona***************************************/
/********************************************************************************************/
INSTANCE ItMi_Worek_10 (C_Item)
{
	name 				=	"Lekka sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	8;

	visual 				=	"ItMi_Pocket.3ds";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseOWorek10;
	description			= name;
	TEXT[2]				= "Lekka sakiewka prawdopodobnie z rud¹.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorek10()
{
    CreateInvItems (self, ItMiNugget, 10);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 10 bry³ek rudy",COL_WHITE);
	};

};
/******************************************************************************************/
INSTANCE ItMi_Worek_30 (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UseOWorek30;
	description			= name;
	TEXT[2]				= "Dosyæ ciê¿ka sakiewka.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorek30()
{
  CreateInvItems (self, ItMiNugget, 30);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 30 bry³ek rudy", COL_WHITE);
	};
};
/******************************************************************************************/
INSTANCE ItMi_Worek_100 (C_Item)
{
	name 				=	"Ciê¿ka sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UseOWorek100;
	description			= name;
	TEXT[2]				= "Bardzo wypchana, ciê¿ka sakiewka.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorek100()
{
//Snd_Play 	    ("BACKPACK_APPLY" );
   CreateInvItems (self, ItMiNugget, 100);
    if (Npc_IsPlayer(self))
	
	{
	PrintS_Ext	("Znaleziono 100 bry³ek rudy", COL_WHITE);
	};
};
/******************************************************************************************/
INSTANCE ItMi_Worek_Wytrychy (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	8;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	
	scemeName			=	"MAPSEALED";	
	on_state[0]			=	UseOWorekWytrychy;
	description			= name;
	TEXT[2]				= "Przedmioty w tej sakiewce maj¹ ostre krawêdzie.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekWytrychy()
{
    CreateInvItems (self, ItKeLockpick, 15);
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 15 wytrychów", COL_WHITE);
	};
};
/******************************************************************************************/
INSTANCE ItMi_Worek_Itemy (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	
	scemeName			=	"MAPSEALED";	
	on_state[0]			=	UseOWorekItemy;
	description			= name;
	TEXT[2]				= "Sakiewka wyraŸnie jest czymœ wypchana.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekItemy()
{
    CreateInvItems (self, ItKeLockpick, 5);
	CreateInvItems (self, ItMi_Stuff_Barbknife_01, 2);
	CreateInvItems (self, ItMi_Stuff_OldCoin_01, 40);
	CreateInvItems (self, ItMi_Alchemy_Salt_01, 4);
	if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono kilkanaœcie przedmiotów", COL_WHITE);
   	};
};
/******************************************************************************************/
INSTANCE ItMi_Worek_Plants (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_CLAY;
	
	scemeName			=	"MAPSEALED";	
	on_state[0]			=	UseOWorekPlants;
	
	description			= 	name;
	TEXT[2]				= 	"Sakiewka wyraŸnie jest czymœ wypchana.";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
func void UseOWorekPlants()
{
    CreateInvItems (self, ItMi_Alchemy_Zucker_01, 5);
	CreateInvItems (self, ItFo_Plants_OrcHerb_01, 2);
	CreateInvItems (self, ItMi_Alchemy_Salt_01, 3);
	CreateInvItems (self, ItFo_Plants_RavenHerb_01, 4);
	if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono kilka sk³adników", COL_WHITE);
	};
};
INSTANCE ItMi_Bandaz40 (C_Item)
{	
	name 				=	"Zwyk³y banda¿";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	20;
	
	visual 				=	"It_Bandaz.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	UseBandaz40;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 40;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 20;

};

	FUNC VOID UseBandaz40()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	40);
	};

	INSTANCE ItMi_Bandaz60 (C_Item)
{	
	name 				=	"Du¿y banda¿";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	20;
	
	visual 				=	"It_Bandaz.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	UseBandaz60;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 60;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 20;

};

	FUNC VOID UseBandaz60()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	60);
	};
/*******************************************************************************************/
INSTANCE ItMi_MaterialSlice (C_Item)
{
	name 				=	"Kawa³ek materia³u";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"It_Bandaz.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
/*******************************************************************************************/
INSTANCE ItMi_IglaiNIC (C_Item)
{
	name 				=	"Szpule nici";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	3;

	visual 				=	"It_TailorThings.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
/*******************************************************************************************/
INSTANCE ItKe_BROKE_Lockpick (C_Item)
{
	name 				=	"Pêkniêty wytrych";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/*******************************************************************************************/
INSTANCE ItMi_Alchemy_trucizna_01 (C_Item)
{
	name 				=	"S³aba trucizna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	22;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/*******************************************************************************************/
INSTANCE ItMi_Alchemy_trucizna_02 (C_Item)
{
	name 				=	"Trucizna jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	35;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/*******************************************************************************************/
INSTANCE ItMi_Alchemy_trucizna_03 (C_Item)
{
	name 				=	"Silna trucizna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_PaczkaMiecze1 (C_Item)
{
	name 				=	"Paczka z broni¹";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	35;

	visual 				=	"NW_CITY_WEAPON_BAG_01.3ds"; 
	material 			=	MAT_CLAY;
	
	scemeName				=	"MAPSEALED";	
	on_state[0]				=	UsePaczkaMiecze1;
	
	description			= 	name;
	TEXT[2]				= "Paczka jest wype³niona broni¹.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UsePaczkaMiecze1()
{
    CreateInvItems (self, ItMw_1H_Sword_Short_02, 10);
	if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono 10 ch³opskich mieczy", COL_WHITE);
	};
};

/*******************************************************************************************/
INSTANCE ItMi_runa0 (C_Item)
{
	name 				=	"Kamieñ runiczny";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	//visual 				=	"DB_ItMi_Stone.3DS";
	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[2]				= 	"Czysty kamieñ runiczny";	
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Zucker_01 (C_Item)
{
	name 				=	"Cukier";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			= 	name;
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_Tuton (C_Item)
{
	name 				=	"Tytoñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	20;

	visual 				=	"ItMi_Pocket.3ds";
    material            =    MAT_LEATHER;

	description			= 	name;
	TEXT[2]				= 	"Zwyczajny tytoñ";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_Tuton_1 (C_Item)
{
	name 				=	"Tytoñ jab³kowy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
    material            =   MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Tytoñ o smaku jab³kowym";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_Tuton_2 (C_Item)
{
	name 				=	"Miodowy tytoñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
    material            =   MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Tytoñ o smaku miodowym";
	TEXT[4]				= 	NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_Tuton_3 (C_Item)
{
	name 				=	"Zio³owy tytoñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
    material            =    MAT_LEATHER;
	description			= name;
	TEXT[2]				= "Tytoñ o smaku zió³";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMi_Tuton_4 (C_Item)
{
	name 				=	"Grzybowy tytoñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI; 
	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
    material            =    MAT_LEATHER;
	description			= name;
	TEXT[2]				= "Tytoñ o smaku grzybów";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMiJoint_Apple(C_Item)
{
	name 				=	"Jab³kowy Nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMiJoint_Honey(C_Item)
{
	name 				=	"Miodowy Nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMiJoint_Mush(C_Item)
{
	name 				=	"Grzybowy Nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMiJoint_Plant(C_Item)
{
	name 				=	"Zio³owy Nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItMiGwozdz(C_Item)
{
	name 				=	"GwóŸdŸ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	2;

	visual 				=	"ItMi_Gwozdz.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
//	Pi³a //1.24 ms
INSTANCE ItMi_Saw (C_Item)
{
	name 				=	"Pi³a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"ItMI_Saw.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 5;
};
INSTANCE ItMi_Wood_01 (C_Item)
{
	name 				=	"Drewniane patyki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	3;

	visual 				=	"EX_BAUMSTAMM_03.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 3;
};
INSTANCE ItMi_Wood_02 (C_Item)
{
	name 				=	"Pociête drewno";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	7;

	visual 				=	"OC_FIREWOOD_V1.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 7;
};
INSTANCE ItMiHorn_01 (C_Item)
{
	name 				=	"Róg";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"HORN";

	description			= name;

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//**********************************************//
INSTANCE LightEssence (C_Item)
{
	name 				=	"Esencja Œwiat³a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= name;
	

	TEXT[2]				= "Puchar zawiera œwiat³o,";
	TEXT[3]				= "dar Innosa dla ludzkoœci.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/*******************************************************************************************
**	£owienie ryb - wa¿ne itemy   					  		  							  **
*******************************************************************************************/
INSTANCE ItMi_bait_01 (C_Item)
{	
	name 				=	"Przynêta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	5;
	
	visual 				=	"ItAt_Meatbug_01.3DS";//do zmiany
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"Ryby nieŸle na ni¹ bior¹";
	TEXT[5]             = Name_value;
	COUNT[5]          =  5;
};
/******************************************************************************************/ 
INSTANCE ItMi_bait_02 (C_Item)
{	
	name 				=	"Dobra przynêta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	10;
	
	visual 				=	"ItAt_Meatbug_01.3DS";//do zmiany
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"Pozwala z³owiæ drapie¿ne ryby";
	TEXT[5]             = Name_value;
	COUNT[5]         =   10;
};

INSTANCE  ItMi_AmbientOrcTalisman(C_Item)
{
	name 			= "Orkowy talizman";

	mainflag 		= ITEM_KAT_NONE;
	flags 			= ITEM_MULTI;

	value 			= 100;

	visual 			= "ItMi_Amulet_UluMulu_01.3ds";

	visual_skin 	= 0;
	material 		= MAT_METAL;

	description		= name;
	TEXT[2]			= "Ozdobny talizman orków";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

INSTANCE ItMi_Note_Dead_AM (C_ITEM)
{
	name 					=	"Stara notatka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[1] 				=	"Ostrze¿enie dla niesfornych";
	on_state[0]				=	UseNoteDeadAM;
};

FUNC VOID UseNoteDeadAM()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  1);
	Doc_SetPage 	( nDocID,  0, "letters.TGA", 0);
	Doc_SetMargins	( nDocID,  -1,  50, 50, 50, 50, 1);
	Doc_SetFont 	( nDocID,  -1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  0, "Stork przekona³ siê, ¿e spanie na warcie nie przystoi Stra¿nikowi. Szkoda, ¿e ju¿ siê nie obudzi³...");
	Doc_Show		( nDocID );
};

INSTANCE ItMi_Note_Dead_RC (C_ITEM)
{
	name 					=	"Stara notatka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;

	TEXT[1] 				=	"Znaleziona przy wisielcu";
	on_state[0]				=	UseNoteDeadRC;
};

FUNC VOID UseNoteDeadRC()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	( nDocID,  1);
	Doc_SetPage 	( nDocID,  0, "letters.TGA", 0);
	Doc_SetMargins	( nDocID,  -1,  50, 50, 50, 50, 1);
	Doc_SetFont 	( nDocID,  -1, "font_10_book.TGA");
	Doc_PrintLines	( nDocID,  0, "Tu wisi swo³ocz - Hengo. By³ Cieniem, lecz okaza³ siê gnid¹. Po¿yczy³ rudê od swego kompana i rudy nie odda³. W czasie potyczki z Bandytami skrytobójczo tamtego zabi³. Olbrena pochowaliœmy ze z³otem, Hengo powiesiliœmy na ga³êzi, bez z³otych zêbów - d³ug zosta³ sp³acony, ale nie w rudzie, a w z³ocie. Olbren wybaczy. Na os³odê niech Olbren ma trupa mordercy, co na ga³êzi dynda. A ty wêdrowcze patrz na bezzêbnego wisielca i pamiêtaj: tak koñcz¹ œwinie. ");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "Roku nie znamy, bo niepotrzebny, a kto wiesza³ ten wiesza³.");
	Doc_Show		( nDocID );
};



INSTANCE Parasol (C_Item)
{
	name 				=	"Parasol";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;

	value 				=	9999;

	damageTotal			= 	99999;
	damagetype			=	DAM_EDGE;
	range    			=  	1000;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"Parasol.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

var int Losowanie_SuperFish;

INSTANCE ItMi_Angel (C_Item)
{
	name 				=	"Wêdka";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"Angel.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"ANGEL";
	on_state[0]			= 	RYBACTWO_S1;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

func void RYBACTWO_S1 ()
{
			if Npc_IsPlayer (self)
				{ 
var int wedkowanieTrwa;
	//if (Npc_IsPlayer(self)) //ten warunek mo¿na wyraziæ te¿ na inne sposoby
	//{
		if (wedkowanieTrwa)
		{
			wedkowanieTrwa = false;
		}
		else
		{
	
			wedkowanieTrwa = true;
			if (Npc_GetDistToWP (hero, "POMOST" ) < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST2") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST3") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST4") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST5") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST6") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST7") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST8") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST9") < 300) || 
			   (Npc_GetDistToWP (hero, "NC_WATERFALL_BOTTOM") < 300) || 
			   (Npc_GetDistToWP (hero, "POMOST10") < 300)
			{
				if (Npc_HasItems (hero, ItMi_bait_02) >=1)
	{
	Npc_RemoveInvItems (hero, ItMi_bait_02, 1);
	Losowanie_fish2 = Hlp_Random (10);
	if (Losowanie_fish2 == 1) || (Losowanie_fish2 == 7) 
	{
	PrintS_Ext ("Z³owi³eœ p³otkê!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish2 == 2)
	{
	PrintS_Ext ("Z³owi³eœ pstr¹ga!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish2, 1);
	};
	if (Losowanie_fish2 == 4) || (Losowanie_fish2 == 10)
	{
	PrintS_Ext ("Wy³owi³eœ glona!", COL_WHITE);
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish2 == 4) 
	{
	PrintS_Ext ("Nic nie z³owi³eœ!", COL_RED);
	};
	if (Losowanie_fish2 == 5) || (Losowanie_fish2 == 9)
	{
	PrintS_Ext ("Z³owi³eœ karasia!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish4, 1);
	};
	if (Losowanie_fish2 == 6) || (Losowanie_fish2 == 8)
	{
	PrintS_Ext ("Walczysz z pstr¹giem têczowym!", COL_YELLOW);
	Losowanie_SuperFish = Hlp_Random (2);
	if Losowanie_SuperFish 
	{
	PrintS_Ext ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	PrintS_Ext ("Ryba uciek³a!", COL_RED);
	};
	};
}
else if (Npc_HasItems (hero, ItMi_bait_01) >=1)
{

Npc_RemoveInvItems (hero, ItMi_bait_01, 1);

	Losowanie_fish4 = Hlp_Random (10);	//100%
	if (Losowanie_fish4 == 1) || (Losowanie_fish4 == 3)  || (Losowanie_fish4 == 6)  || (Losowanie_fish4 == 8)  
	{
	PrintS_Ext ("Z³owi³eœ p³otkê!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish4 == 2)  || (Losowanie_fish4 == 4)  
	{
	PrintS_Ext ("Wy³owi³eœ glona!", COL_WHITE);
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish4 == 4)  || (Losowanie_fish4 == 5)  || (Losowanie_fish4 == 7)  
	{
	PrintS_Ext ("Nic nie z³owi³eœ!", COL_RED);
	};
	if (Losowanie_fish4 == 9)  
	{
	PrintS_Ext ("Walczysz z pstr¹giem têczowym!", COL_YELLOW);
	Losowanie_SuperFish = Hlp_Random (2);
	if Losowanie_SuperFish 
	{
	PrintS_Ext ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!", COL_WHITE);
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	PrintS_Ext ("Ryba uciek³a!", COL_RED);
	};
	};
}
else 
{
PrintS_Ext ("Nie masz przynêty!", COL_RED);
};
			} 
			else
			{ 
				PrintS_Ext ("Nie mo¿esz tu ³owiæ!", COL_WHITE);
			};
		};
	};
	
	};

	





//////////////////////////////////////////////////////////
//  FAST TRAVEL MAP
//////////////////////////////////////////////////////////
var int FirstTimeUseFTM;
INSTANCE FastTravelMap(C_Item)
{	
	name 					=	"Mapa szybkiej podró¿y";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_FastTravelMap;

	description				= name;
	TEXT[0]					= "Zaznaczone skróty pozwalaj¹ ";
	TEXT[1]					= "szybko podró¿owaæ.";
	//TEXT[5]					= NAME_Value;
	//COUNT[5]				= value;
};

	FUNC VOID Use_FastTravelMap()
	{
	if (FirstTimeUseFTM != TRUE)
	{
	PrintS_Ext ("Aby u¿yæ mapy, naciœnij 'U'.",COL_Lime) ;
	FirstTimeUseFTM = TRUE;
	};
 //       oCNpc__CloseInventory; //MEM_WriteInt(7058164 + 0, 233);                    = 7058164;
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_FastTravel;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);

	};
	};
	
//-------------------------------------------------------------------------------SUBMOD--------------------------------------------------------------------------------------------	
	
	
INSTANCE ItMi_Stuff_Idol_Mosul (C_Item)
{
	name 				=	"Pos¹¿ek Mosula";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
	
INSTANCE ItMi_Knife_Melvin (C_Item)
{
	name 				=	"Nó¿ Melvina";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Knife_Melvin.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
	
		
	
	
	INSTANCE ItMi_Corristo_pack (C_Item)
{
	name 				=	"Przesy³ka Corristo";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
	
	INSTANCE ItMi_UturielStone (C_Item)
{
	name 				=	"Kamieñ Uturiela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ErIt_Crystal.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
	
	
	INSTANCE ItMi_JeweleryChest (C_Item)
{
	name 				=	"Szkatu³ka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
    scemename			=	"MAPSEALED";	
	value 				=   15;
    on_state[0]			=   GoldPocket25;
	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
	
		FUNC VOID GoldPocket25 ()
{
		CreateInvItems (hero, ItMi_SilverRing,2);	
		CreateInvItems (hero, ItMi_Coal,4);
		CreateInvItems (hero, ItMi_Stuff_Silverware_01,1);
		CreateInvItems (hero, ItMi_Stuff_Cup_02,3);
};

	INSTANCE ItMi_QuartzChest (C_Item)
{
	name 				=	"Szkatu³ka z Kwarcem";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
    scemename			=	"MAPSEALED";	
	
    on_state[0]			=   QuartzChest;
	visual 				=	"ItMi_JeweleryChest.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]             =   "Ciê¿ka szkatu³ka,";
	TEXT[4]             =   "w œrodku coœ jest...";
	
};
	
		FUNC VOID QuartzChest ()
{
		CreateInvItems (hero, ItMi_Quartz,40);	
};


INSTANCE ItMi_Cadar_Crystal (C_Item)
{
	name 				=	"Kryszta³ Cadara";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	

	visual 				=	"ItMi_CrystalCadar.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;	
};


INSTANCE ItMi_Cadar_Crystal1 (C_Item)
{
	name 				=	"Kryszta³ Cadara";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	

	visual 				=	"ItMi_CrystalCadar.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;		
};







//***********************************************************************ER 1.6.1*****************************************************************************************\
INSTANCE ItMi_SilverNugget (C_Item)
{
	name 				=	"Srebrny Grom";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	7;

	visual 				=	"ITMI_SNUGGET_01.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
};
//***********************************************************************/
	INSTANCE ItMi_Quartz (C_Item)
{
	name 				=	"Kwarcyt";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Quartz.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
};

//***********************************************************************/
INSTANCE ItMi_Coal (C_Item)
{
	name 				=	"Wêgiel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	7;

	visual 				=	"ItMi_Coal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
};
//***********************************************************************/

INSTANCE ItMi_GoldCandleHolder (C_Item)
{
	name 				=	"Z³oty œwiecznik";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_GoldCandleHolder.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
//***********************************************************************/
INSTANCE ItMi_GoldPlate (C_Item)
{
	name 				=	"Z³oty talerz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"itmi_goldplate.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
//***********************************************************************/

INSTANCE ItMi_SilverCandleHolder (C_Item)
{
	name 				=	"Srebrny œwiecznik";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMi_SilverCandleHolder.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
//***********************************************************************/

INSTANCE ItMi_SilverCup (C_Item)
{
	name 				=	"Srebrny puchar";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMi_SilverCup.3ds";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
//***********************************************************************/

INSTANCE itmi_silverplate (C_Item)
{
	name 				=	"Srebrny talerz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"itmi_silverplate.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	
//***********************************************************************/

INSTANCE itmi_goldcup (C_Item)
{
	name 				=	"Z³oty puchar";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"itmi_goldcup.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};	

//***********************************************************************/
INSTANCE ItMi_SilverRing (C_Item)
{
	name 				=	"Srebrny pierœcieñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	15;

	visual 				=	"ItMi_SilverRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	
};
//***********************************************************************/
INSTANCE ItMi_GoldRing (C_Item)
{
	name 				=	"Z³oty pierœcieñ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	20;

	visual 				=	"ItMi_GoldRing.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
		
};
//***********************************************************************/

INSTANCE ItMi_RefNUGG (C_Item)
{
	name 				=	"Szkatu³ka z Rud¹";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
    scemename			=	"MAPSEALED";	
	
    on_state[0]			=   QuartzChestRef;
	visual 				=	"ItMi_JeweleryChest.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]             =   "Ciê¿ka szkatu³ka,";
	TEXT[4]             =   "w œrodku coœ jest...";
	
};
	
FUNC VOID QuartzChestRef ()
{
		CreateInvItems (hero, ItMinugget,9000);	
};
//***********************************************************************/

INSTANCE ItMi_IronNugget(C_Item)
{
	name 				=	"Bry³ka ¿elaza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	value 				=	4;

	
    
	visual 				=	"ItMi_IronNugget.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]             =   "Ciê¿ka bry³ka,";
	TEXT[4]             =   "wykorzystywana w kowalstwie.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	
//-----------------------------------------------------------------------
	INSTANCE ItMi_SilverInnosStatue (C_Item)
{
	name 				=	"Srebrny pos¹¿ek Innosa";

	mainflag 		    =	ITEM_KAT_NONE;
	flags 			    =	ITEM_MULTI;
	
    value 				=	50;
	
	visual 				=	"ItMi_SilverInnosStatue.3ds";
	material 		    =	MAT_METAL;


	description			= 	name;
	TEXT[0]				= 	"Przedstawia boga ognia.";
};
//-----------------------------------------------------------------------	

INSTANCE ItMi_Refiron (C_Item)
{
	name 				=	"Szkatu³ka z Rud¹";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
    scemename			=	"MAPSEALED";	
	
    on_state[0]			=   ChestRefIron;
	visual 				=	"ItMi_JeweleryChest.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]             =   "Ciê¿ka szkatu³ka,";
	TEXT[4]             =   "w œrodku coœ jest...";
	
};
	
FUNC VOID ChestRefIron ()
{
		CreateInvItems (hero, ItMi_IronNugget,9000);	
};

INSTANCE ItMi_RuneBlank (C_Item)
{
	name 				=	"Runa";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_Pliers (C_Item)
{
	name 				=	"¯uwaczka";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pliers.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
INSTANCE ItMiJoint_ZD(C_Item)
{
	name 				=	"Ryk d¿ungli";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	//value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	//on_state[0]			= UseItMiJoint_1;
	description			= name;
	//TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_ZDCRATE(C_Item)
{
	name 				=	"Skrzynka piwa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	128;

	visual 				=	"ER_BEERCRATE.3DS";
	material 			=	MAT_WOOD;

	//scemeName			=	"JOINT";
	//on_state[0]			= UseItMiJoint_1;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

























