// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************
//jajo 
CONST STRING MOBNAME_CHEST_BLACH	= "Skrzynia mag�w";
CONST STRING MOBNAME_CHEST_STONE	= "Skrzynia Stone'a";
CONST STRING MOBNAME_CHEST_SKARB	= "Skrzynia ze skarbami";
CONST STRING MOBNAME_CHEST_PARVEZ	= "Skrzynia Baal Parveza";
CONST STRING MOBNAME_MOD_USCANCHEST	= "Skrzynia Eskela";
CONST STRING MOBNAME_FOSTERCHEST    = "Skrzynia Fostera";
CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_BELIAR_STATUE	= "Kapliczka Beliara";
CONST STRING MOBNAME_INNOS_STATUE	= "Kapliczka Innosa";
CONST STRING MOBNAME_INNOS_STATUE_OC= "Kapliczka Innosa";
CONST STRING MOBNAME_CIECIEDREWNA	= "Wielki pie�";
CONST STRING MOBNAME_WOOD35			= "Wielki pie�";
CONST STRING MOBNAME_CHEST_ROCKY    = "Skrzynia Rocky'ego";
CONST STRING MOBNAME_CRATE			= "Skrzynia";
CONST STRING MOBNAME_CHEST			= "Skrzynia";
CONST STRING MOBNAME_CHEST_MS1		= "Skrzynia";
CONST STRING MOBNAME_BED			= "��ko";
CONST STRING MOBNAME_DOOR			= "Drzwi";
CONST STRING MOBNAME_CAMP			= "Ognisko";
CONST STRING MOBNAME_TORCH			= "Pochodnia";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "Ro�en";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "�awka";
CONST STRING MOBNAME_ANVIL			= "Kowad�o";
CONST STRING MOBNAME_BUCKET			= "Wiadro wody";
CONST STRING MOBNAME_FORGE			= "Palenisko";
CONST STRING MOBNAME_GRINDSTONE		= "Kamie� szlifierski";
CONST STRING MOBNAME_WHEEL			= "Ko�owr�t";
CONST STRING MOBNAME_LAB_PSI		= "St� alchemiczny";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "Krzes�o";
CONST STRING MOBNAME_CAULDRON		= "Kocio�";
CONST STRING MOBNAME_THRONE			= "Tron";
CONST STRING MOBNAME_PAN			= "Patelnia";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Fajka wodna";
CONST STRING MOBNAME_LADDER			= "Drabina";
CONST STRING MOBNAME_SWITCH			= "Prze��cznik";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Bry�ka rudy";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Miech";
CONST STRING MOBNAME_STONEMILL		= "Ose�ka";
CONST STRING MOBNAME_ORC_MUMMY		= "Mumia";
CONST STRING MOBNAME_PILLAR			= "Kolumna";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "B�ben";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Rozdrabniacz";
CONST STRING MOBNAME_IDOL			= "Figurka";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "Orkowy b�ben";
CONST STRING MOBNAME_TARGETSTONE	= "Cel";
CONST STRING MOBNAME_SHRINE			= "Kaplica Serc";
CONST STRING MOBNAME_SWORDSTONE		= "Tajemnicza kapliczka";
CONST STRING MOBNAME_PALISADA		= "Palisada";
CONST STRING MOBNAME_NC_CHESTBAL	= "Skrzynia Baal Kagana";
CONST STRING MOBNAME_SKARB1			= "Skrzynia ze skarbem";
CONST STRING MOBNAME_BAUM			= "Pi�a do drewna";
CONST STRING MOBNAME_GOLD			= "Samorodek z�ota";
CONST STRING MOBNAME_WORKTABLE		= "Warsztat";
CONST STRING MOBNAME_OREVEIN		= "�y�a magicznej rudy";
CONST STRING MOBNAME_SENYANCHEST	= "Solidna skrzynia";
CONST STRING MOBNAME_IRONORE        = "Ruda �elaza";
CONST STRING MOBNAME_SCHLEAGERS_CHEST	= "Skrzynia bandzior�w";
CONST STRING MOBNAME_CIALO              = "Zw�oki";
CONST STRING MOBNAME_REPAIR_PALISADE	= "Napraw";
// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
"Skazaniec",
"Magnat",
"Stra�nik",
"Cie�",
"Mag Ognia",
"Kopacz",
"Mag Wody",
"Najemnik",
"Szkodnik",
"Bandyta",
"Kret",	 // 10
"Guru",
"Nowicjusz",
"Stra�nik �wi.",
"Nekromanta",
"Agresor",
"",
"Jaszczur",	 // 17
"�ni�cy",
"Goblin",
"Troll",
"Z�bacz",
"Pe�zacz",
"Chrz�szcz",
"�cierwojad",
"Demon",
"Wilk",
"Cieniostw�r",
"Krwiopijca",
"W�� b�otny",	 // 30
"Zombi",
"Ork-Zombi",
"Szkielet",
"Orkowy pies",
"Kretoszczur",
"Golem",
"Topielec",
"",	 // 38
"Ork-Szaman",
"Ork-Wojownik",
"Ork-Zwiadowca",
"Ork-Niewolnik"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
const string TXT_ATTRIBUTE_DESC	[ATR_INDEX_MAX]	= {

	"HitpointDesc",
	"",
	"ManaDesc",
	"",
	"StrengthDesc",
	"DexterityDesc",
	"",
	""
};

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute f�r CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente f�r CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente f�r CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	f�r	CharScreen

Die	Reihenfolge	der	jeweiligen Texte k�nnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen ben�tigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"�wiat�o",					// SPL_LIGHT		=	0;
	"Kula ognia",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Strach",					// SPL_FEAR			=	3;
	"Uzdrowienie",				// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Przyzwanie demona",		// SPL_SUMMONDEMON	=	6;
	"Przyzwanie szkielet�w",	// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Uderzenie wiatru",			// SPL_WINDFIST		=	9;
	"Telekineza",				// SPL_TELEKINESIS	=	10;
	"Urok",						// SPL_CHARM		=	11;
	"Sen",						// SPL_SLEEP		=	12;
	"Pirokineza",				// SPL_PYROKINESIS	=	13;
	"Pier�cie� �mierci",		// SPL_MASSDEATH	=	14;
	"Kontrola",					// SPL_CONTROL		=	15;
	"�mier� o�ywie�com",		// SPL_DESTROYUNDEAD=	16;
	"Ognisty pocisk",			// SPL_FIREBOLT		=	17;
	"Ognista burza",			// SPL_FIRESTORM	=	18;
	"Deszcz ognia",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport, Magowie Ognia",	// SPL_TELEPORT1	=	21;
	"Teleport, Magowie Wody",	// SPL_TELEPORT2	=	22;
	"Teleport, Nekromanta",		// SPL_TELEPORT3	=	23;
	"Teleport, Orkowie",		// SPL_TELEPORT4	=	24;
	"Teleport, Bractwo",		// SPL_TELEPORT5	=	25;
	"Przemiana w krwiopijc�",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Przemiana w pe�zacza",		// SPL_TRF_CRAWLER	=	28;
	"Przemiana w topielca",		// SPL_TRF_LURKER	=	29;
	"Przemiana w chrz�szcza",	// SPL_TRF_MEATBUG	=	30;
	"Przemiana w kretoszczura",	// SPL_TRF_MOLERAT	=	31;
	"Przemiana w orkowego psa",	// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Przemiana w �cierwojada",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Przemiana w cieniostwora",	// SPL_TRF_SHADOWBEAST=	36;
	"Przemiana w z�bacza",		// SPL_TRF_SNAPPER	=	37;
	"Przemiana w jaszczura",	// SPL_TRF_WARAN	=	38;
	"Przemiana w wilka",		// SPL_TRF_WOLF		=	39;
	"Grom",						// SPL_CHAINLIGHTNING=	40;
	"Sopel lodu",				// SPL_THUNDERBOLT	=	41;
	"Piorun kulisty",			// SPL_THUNDERBALL	=	42;
	"Bry�a lodu",				// SPL_ICECUBE		=	43;
	"Lodowa fala",				// SPL_ICEWAVE		=	44;
	"Przyzwanie golema",		// SPL_SUMMONGOLEM	=	45;
	"Armia Ciemno�ci",			// SPL_ARMYOFDARKNESS=	46;
	"Uderzenie burzy",			// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Tchnienie �mierci",		// SPL_BREATHOFDEATH=	49;
	"Zmniejszenie potwora",		// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Sza�",						// SPL_BERZERK		=	53;
	"Gniew Uriziela",			// SPL_NEW1			=	17;
	"Teleport do domu Maga",						// SPL_NEW2			=	18;
	"Przyzwanie orkowych szkielet�w",				// SPL_NEW3			=	19;
	"Teleport do �owc�w ork�w",						// SPL_NEW4			=	20;
	"Teleport do Obozu Bandyt�w",					// SPL_NEW5		=	21;
	"Fala powietrza"                               // SPL_WINDWAVE   =   59;
 };

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"D�mon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
	"Skelette beschw.Descr",			// SPL_SUMMONSKELETON=	7;
	"VergessenDescr",					// SPL_FORGET		=	8;
	"WindfaustDescr",					// SPL_WINDFIST		=	9;
	"TelekineseDescr",					// SPL_TELEKINESIS	=	10;
	"CharmDescr",						// SPL_CHARM		=	11;
	"SleepDescr",						// SPL_SLEEP		=	12;
	"PyrokinesisDescr",					// SPL_PYROKINESIS	=	13;
	"MassdeathDescr",					// SPL_MASSDEATH	=	14;
	"KontrolleDescr",					// SPL_CONTROL		=	15;
	"Untote	bannenDescr",				// SPL_DESTROYUNDEAD=	16;
	"FireboltDescr",					// SPL_FIREBOLT		=	17;
	"FireStormDescr",				// SPL_FIRESTORM	=	18;
	"FireRainDescr",					// SPL_FIRERAIN		=	19;
	"SpeedDescr",					// SPL_SPEED		=	20;
	"Teleport1Descr",				// SPL_TELEPORT1	=	21;
	"Teleport2Descr",				// SPL_TELEPORT2	=	22;
	"Teleport3Descr",				// SPL_TELEPORT3	=	23;
	"Teleport4Descr",				// SPL_TELEPORT4	=	24;
	"Teleport5Descr",				// SPL_TELEPORT5	=	25;
	"Transform BloodflyDescr",		// SPL_TRF_BLOODFLY	=	26;
	"Transform BloodhoundDescr",		// SPL_TRF_BLOODHOUND=	27;
	"Transform CrawlerDescr",		// SPL_TRF_CRAWLER	=	28;
	"Transform LurkerDescr",			// SPL_TRF_LURKER	=	29;
	"Transform MeatbugDescr",		// SPL_TRF_MEATBUG	=	30;
	"Transform MoleratDescr",		// SPL_TRF_MOLERAT	=	31;
	"Transform OrcDogDescr",			// SPL_TRF_ORCDOG	=	32;
	"Transform RazorDescr",			// SPL_TRF_RAZOR	=	33;
	"Transform ScavengerDescr",		// SPL_TRF_SCAVENGER=	34;
	"Transform Scavenger2Descr",		// SPL_TRF_SCAVENGER2=	35;
	"Transform ShadowbeastDescr",		// SPL_TRF_SHADOWBEAST=	36;
	"Transform SnapperDescr",		// SPL_TRF_SNAPPER	=	37;
	"Transform WaranDescr",			// SPL_TRF_WARAN	=	38;
	"Transform WolfDescr",			// SPL_TRF_WOLF		=	39;
	"ChainlightningDescr",			// SPL_CHAINLIGHTNING=	40;
	"TunderboltDescr",				// SPL_THUNDERBOLT	=	41;
	"ThunderballDescr",				// SPL_THUNDERBALL	=	42;
	"Ice CubeDescr",					// SPL_ICECUBE		=	43;
	"Ice WaveDescr",					// SPL_ICEWAVE		=	44;
	"Summon	GolemDescr",				// SPL_SUMMONGOLEM	=	45;
	"Army of DarknessDescr",			// SPL_ARMYOFDARKNESS=	46;
	"StormFistDescr",					// SPL_STORMFIST	=	47;
	"n/a",								// SPL_TELEKINESIS2	=	48;
	"Breath	of DeathDescr",				// SPL_BREATHOFDEATH=	49;
	"ShrinkDescr",						// SPL_SHRINK		=	50;
	"n/a",								// SPL_UNDRESS		=	51;
	"n/a",								// SPL_DANCE		=	52;
	"BerzerkDescr",						// SPL_BERZERK		=	53;
	"New1Descr",						// SPL_NEW1			=	17;
	"New2Descr",						// SPL_NEW2			=	18;
	"New3Descr",						// SPL_NEW3			=	19;
	"New4Descr",						// SPL_NEW4			=	20;
	"New5Descr"	,		            	// SPL_NEW5			=	21;
	"New6Descr"                         // SPL_WINDWAVE     =   59;
};
*/

								
// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************

CONST STRING TXT_TALENTS [NPC_TALENT_MAX] =	
{
	"",	
	"Bro� jednor�czna",
	"Bro� dwur�czna",
	"�uk",
	"Kusza",
	"W�amywanie si�",
	"Kradzie�",
	"Magia",
	"Skradanie si�",
	"",
	"Alchemia",
	"Akrobatyka"

};

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_TALENTS_DESC [NPC_TALENT_MAX] = 
// FIXME: wo werden die benutzt?
{
	"",	
	"NPC_TALENT_1H",
	"NPC_TALENT_2H",
	"NPC_TALENT_BOW",
	"NPC_TALENT_CROSSBOW",
	"NPC_TALENT_PICKLOCK",
	"NPC_TALENT_PICKPOCKET",
	"NPC_TALENT_MAGE",
	"NPC_TALENT_SNEAK",
	"NPC_TALENT_REGENERATE",                 G�rnictwo
	"NPC_TALENT_FIREMASTER",
	"NPC_TALENT_ACROBAT"
};
*/

CONST STRING TXT_TALENTS_SKILLS [NPC_TALENT_MAX] = 
{
	"",	                                                        // 
	"Zielony|Wojownik|Mistrz",                                  //NPC_TALENT_1H    
	"Zielony|Wojownik|Mistrz",                                  //NPC_TALENT_2H
	"Zielony|�ucznik|Mistrz",                                   //NPC_TALENT_BOW    
	"Zielony|Kusznik|Mistrz",                     				//NPC_TALENT_CROSSBOW    
	"-|poz. 1/2|poz. 2/2",								        //NPC_TALENT_PICKLOCK   
	"-|Uczony|Mistrz",			//poz. 1/2|poz. 2/2					        //NPC_TALENT_PICKPOCKET
	"-|kr�g 1 |kr�g 2 |kr�g 3 |kr�g 4 |kr�g 5 |kr�g 6 ",	    //NPC_TALENT_MAGE         
	"-|poz. 1/1|",                                              //NPC_TALENT_SNEAK       
	" |",                                      		    //NPC_TALENT_REGENERATE 
	"-|poz. 1/2|poz. 2/2",                                      //NPC_TALENT_FIREMASTER   
	"-|poz. 1/1"                                                //NPC_TALENT_ACROBAT 
          	                                                    //NPC_TALENT_SMITHWEAPON
};
//"-|kr�g 1 |kr�g 2 |kr�g 3 (reg. +1)|kr�g 4 (reg. +1)|kr�g 5 (reg. +2)|kr�g 6 (reg. +2)",	//NPC_TALENT_MAGE         
// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Bronie",
	"Pancerze",
	"Magia",
	"Artefakty",
	"�ywno��",
	"Napoje",
	"Pisma",
	"Pozosta�e"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= 	"Kopacz";
CONST STRING NAME_Schatten		= 	"Cie�";
CONST STRING NAME_ConvoiTraeger	= 	"Tragarz";
CONST STRING NAME_ConvoiWache	= 	"Stra�nik konwoju";
CONST STRING NAME_Torwache		= 	"Stra�nik bramy";
CONST STRING NAME_Brueckenwache	= 	"Stra�nik mostu";
CONST STRING NAME_EnterGuard	= 	"Stra�nik wej�cia";
CONST STRING NAME_MagazinGardist = 	"Stra�nik magazynu";
CONST STRING NAME_Gardist		= 	"Stra�nik";
CONST STRING NAME_Bauer			= 	"Zbieracz";
CONST STRING NAME_Schlaeger		= 	"Bandzior";
CONST STRING NAME_Schuerfer		= 	"Kret";
CONST STRING NAME_Organisator	= 	"Szkodnik";
CONST STRING NAME_Soeldner		= 	"Najemnik";
CONST STRING NAME_Novize		= 	"Nowicjusz";
CONST STRING NAME_Templer		= 	"Stra�nik �wi�tynny";
CONST STRING NAME_Raeuber		= 	"Bandyta";
CONST STRING NAME_Tuersteher	= 	"Wykidaj�o";
const string NAME_EliteTPL      = 	"Elitarny Stra�nik �wi�tynny";
const string NAME_Poszukiwacz   = 	"Poszukiwacz";
const string NAME_MadNovice		=	"Op�tany Nowicjusz";
const string NAME_MadTemplar	=	"Fanatyczny Stra�nik";
const string NAME_MadTemplar2	=	"Apokaliptyczny Stra�nik";
const string NAME_Tragarz       =   "Tragarz";
const string NAME_Robotnik      =   "Robotnik";
const string NAME_Mysliwy1      =   "Zm�czony my�liwy";
const string NAME_Mysliwy2      =   "My�liwy";
const string NAME_Mysliwy3      =   "Marudny my�liwy";
const string NAME_Kusznik       =   "Kusznik";
const string NAME_Rebeliant     =   "Buntownik";
const string NAME_LeftysFriend  =   "Stronnik Lewusa";
const String NAME_Robuer        =   "Rabu�";
const string NAME_GrdBoss       =   "Dow�dca - Stra�nik";
const string NAME_Inzynier      =   "In�ynier";
const string NAME_TomDog        =   "Przyb��da";
// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "(Koniec)";
CONST STRING DIALOG_BACK		= "(Wstecz)";
const string DIALOG_TRADE		= "(Handel)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Pier�cie�";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Nap�j";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Zw�j";


// *************************************************************
// TEXTE F�R ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Warto��:";

const string NAME_Mag_Circle	= "Kr�g:";
const string NAME_Manakosten	= "Koszt mana:";
const string NAME_ManakostenMax	= "Koszt mana (maks.):";
const string NAME_ManaPerSec	= "Mana/sek.";
const string NAME_Duration		= "Czas trwania (min.):";

const string NAME_Mana_needed	= "Wymagana mana:";
const string NAME_Str_needed	= "Wymagana si�a:";
const string NAME_Dex_needed	= "Wymagana zr�czno��:";

const string NAME_Spell_Load	= "Zakl�cie odnawialne";
const string NAME_Spell_Invest	= "Zakl�cie inwestycyjne";

const string NAME_Dam_Edge		= "Obr. Bro�";
const string NAME_Dam_Point		= "Obr. Pociski";
const string NAME_Dam_Fire		= "Obr. Ogie�";
const string NAME_Dam_Magic		= "Obr. Magia";
const string NAME_Dam_Fly		= "Obr. Burza";

const string NAME_Damage		= "Obra�enia:";
const string NAME_PerMana		= "/mana:";
const string NAME_DamagePerSec	= "Obra�enia/sek.:";

const string NAME_Prot_Edge		= "Ochrona przed broni�:";
const string NAME_Prot_Point	= "Ochrona przed pociskami:";
const string NAME_Prot_Fire		= "Ochrona przed ogniem:";
const string NAME_Prot_Magic	= "Ochrona przed magi�:";

const string NAME_Bonus_HP		= "Bonus P�:";
const string NAME_Bonus_Mana	= "Bonus mana:";

const string NAME_Bonus_HPProc		= "Bonus P� - % :";
const string NAME_Bonus_ManaProc	= "Bonus mana - % :";

const string NAME_Bonus_HpMax	= "Bonus do maks. P�:";
const string NAME_Bonus_ManaMax	= "Bonus do maks. mana:";

const string NAME_Bonus_Dex		= "Bonus do zr�czno�ci:";
const string NAME_Bonus_Str		= "Bonus do si�y:";

const string NAME_OneHanded		= "Bro� jednor�czna";
const string NAME_TwoHanded		= "Bro� dwur�czna";

//----------------- MH: zus�tzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdrowienie/mana:"; 

const string NAME_BuyAttributeSTR = "Si�a + ";
const string NAME_BuyAttributeDEX = "Zr�czno�� + ";
const string NAME_BuyAttributeMAN = "Mana + ";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Do�wiadczenie + ";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Wy�szy poziom!";		// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nowy zapis w dzienniku: ";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Nieznane)-"									;

const string _STR_ATTRIBUTE_HITPOINTS		= "P�"											;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maks. P�"								;
const string _STR_ATTRIBUTE_MANA			= "pkt. Many"											;
const string _STR_ATTRIBUTE_MANA_MAX		= "pkt. Maks. Many"									;
const string _STR_ATTRIBUTE_STRENGTH		= "pkt. Si�y"											;
const string _STR_ATTRIBUTE_DEXTERITY		= "pkt. Zr�czno�ci"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "kr�gu"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, f�r die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Brakuje ci "										;
const string _STR_CANNOTUSE_POINTS			= "punkt�w"											;
const string _STR_CANNOTUSE_LEVELS		    = "poziom"											;
const string _STR_CANNOTUSE_POST			= ", by u�y� tego przedmiotu."				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, f�r das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") brakuje "										;

// Bidschrimausgabe zum Thema Schlo� �ffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Brak klucza lub wytrycha.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Brzmi nie�le.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Zamek zosta� otwarty.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Cholera... Trzeba zacz�� od pocz�tku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Wytrych p�k�.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "D�wignia ani drgnie!"			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Statuetka przesuwa d�wigni�."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Ko�owr�t si� zaci��!"					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " Przedmiot oddany."								;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " przedmioty oddane."							;
const string _STR_MESSAGE_ORE_GIVEN			= " bry�ek straty."									;
const string _STR_MESSAGE_ITEM_TAKEN		= " Przedmiot otrzymany."							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " przedmioty otrzymane."							;
const string _STR_MESSAGE_ORE_TAKEN			= " bry�ek zysku."									;
//B_functions (line590) 
// Bidschrimausgabe f�rs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Twoje dobra nie s� tyle warte."	;

// GILDENAUFNAHMEBEDINGUNG (f�r die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Warunek przyj�cia: Poziom "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Nie mo�e zosta� okradziony.";

const string HAVENT_LP						=	"Nie masz tyle do�wiadczenia!";
const string HAVENT_ORE						=	"Nie masz rudy!";
// ***************************************************************************************
// Relative Y-Koordinaten f�r die Bildschirmausgabe (in % der aktuellen Bildh�he)
// ***************************************************************************************
const int	_YPOS_MESSAGE_GIVEN				=	37;
const int	_YPOS_MESSAGE_TAKEN				=	40;
const int	_YPOS_MESSAGE_LOGENTRY			=	45;
const int	_YPOS_MESSAGE_XPGAINED			=	50;
const int	_YPOS_MESSAGE_LEVELUP			=	55;
const int 	_YPOS_MESSAGE_Joincamp			=	50;
const int	_YPOS_MESSAGE_PICKLOCK_SUCCESS	=	6;
const int	_YPOS_MESSAGE_PICKLOCK_UNLOCK	=	9;
const int	_YPOS_MESSAGE_PICKLOCK_FAILURE	=	12;
const int 	_YPOS_MESSAGE_PICKLOCK_BROKEN	=	15;
const int	_YPOS_MESSAGE_CANNOTSTEAL		=	6;


// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
const int	_TIME_MESSAGE_GIVEN				=	4;
const int	_TIME_MESSAGE_TAKEN				=	4;
const int	_TIME_MESSAGE_LOGENTRY			=	4;
const int	_TIME_MESSAGE_XPGAINED			=	3;
const int	_TIME_MESSAGE_LEVELUP			=	5;
const int	_TIME_MESSAGE_RAISEATTRIBUTE	=	4;
const int	_TIME_MESSAGE_Joincamp			=	5;
const int	_TIME_MESSAGE_PICKLOCK			=	3;
const int	_TIME_MESSAGE_CANNOTSTEAL		=	2;


// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
const string NAME_BuyArmorPrefix	=	" (";	
const string NAME_BuyArmorPostfix	=	" bry�ek rudy)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" bry�ek rudy, ";
const string NAME_LearnPostfixS		=	" pkt. umiej�tno�ci)";	
const string NAME_LearnPostfixP		=	" pkt. umiej�tno�ci)";	


const string NAME_LearnStrength_1	=	"Si�a +1";
const string NAME_LearnStrength_5	=	"Si�a +5";
const string NAME_LearnStrength_10	=	"Si�a +10 (100 bry�ek)";
const string NAME_LearnStrength_20	=	"Si�a +20 (200 bry�ek)";

const string NAME_LearnDexterity_1	=	"Zr�czno�� +1";
const string NAME_LearnDexterity_5	=	"Zr�czno�� +5";
const string NAME_LearnDexterity_10	=	"Zr�czno�� +10 (100 bry�ek)";
const string NAME_LearnDexterity_20	=	"Zr�czno�� +20 (200 bry�ek)";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10 (100 bry�ek) ";
const string NAME_LearnMana_20		=	"Mana +20 (200 bry�ek) ";

const string NAME_Learn1h_1			=	"Bro� jednor�czna +1";
const string NAME_Learn1h_2			=	"Bro� jednor�czna +5";
const string NAME_Learn2h_1			=	"Bro� dwur�czna +1";
const string NAME_Learn2h_2			=	"Bro� dwur�czna +5";

const string NAME_LearnBow_1		=	"�uki +1";
const string NAME_LearnBow_2		=	"�uki +5";
const string NAME_LearnCrossbow_1	=	"Kusza +1";
const string NAME_LearnCrossbow_2	=	"Kusza +5";

const string NAME_LearnMage_1		=	"Pierwszy kr�g magii";
const string NAME_LearnMage_2		=	"Drugi kr�g magii";
const string NAME_LearnMage_3		=	"Trzeci kr�g magii";
const string NAME_LearnMage_4		=	"Czwarty kr�g magii";
const string NAME_LearnMage_5		=	"Pi�ty kr�g magii";
const string NAME_LearnMage_6		=	"Sz�sty kr�g magii";

const string NAME_LearnPickpocket_1	=	"Kradzie�, poziom 1";
const string NAME_LearnPickpocket_2	=	"Kradzie�, poziom 2";
const string NAME_LearnPicklock_1	=	"Otwieranie zamk�w, poziom 1";
const string NAME_LearnPicklock_2	=	"Otwieranie zamk�w, poziom 2";

const string NAME_LearnAcrobat		=	"Akrobatyka";
const string NAME_LearnSneak		=	"Skradanie si�";
//edycja rozszerzona 1.4
const string NAME_LearnAlchemy_1	=	"Alchemia, poziom 1";
const string NAME_LearnAlchemy_2	=	"Alchemia, poziom 2";

const string NAME_LearnSmith_1		=	"Kowalstwo, poziom 1";
const string NAME_LearnSmith_2		=	"Kowalstwo, poziom 2";

const string NAME_RaiseStrength		=	"Si�a + ";
const string NAME_RaiseDexterity	=	"Zr�czno�� + ";
const string NAME_RaiseStrDex		=	"Si�a i Zr�czno�� + ";
const string NAME_RaiseManaMax		=	"Maksymalna mana + ";
const string NAME_RaiseHealthMax	=	"Maksymalne P� + ";

//----- Edycja --- rozszerzona --------------------------------
const string NAME_LearnAlchemia		=	"Alchemia (10 punkt�w nauki)";
//---------------- MH: f�r B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mistrzu, chcia�bym nosi� szat� Arcymaga Ognia.";
const string NAME_SaturasHighRobe	= 	"Szata Arcymaga";
const string NAME_DiegoHeavyShadows	=	"Ci�ka Zbroja Cienia. Bro� 30, Pociski 5, Ogie� 17";
const string NAME_StoneHeavyGuards	= 	"Ci�ka Zbroja Stra�nika. Bro� 45, Pociski 15, Ogie� 20";
const string NAME_StoneGuards		= 	"Zbroja Stra�nika. Bro� 40, Pociski 10, Ogie� 20";
const string NAME_WolfBandits		= 	"Pancerz Szkodnika. Bro� 25, Pociski 5, Ogie� 10"; 
const string NAME_WolfHeavyBandits	= 	"Ci�ki Pancerz Szkodnika. Bro� 30, Pociski 5, Ogie� 17";
const string NAME_LeeMercs			= 	"Pancerz Najemnika. Bro� 40, Pociski 10, Ogie� 20";
const string NAME_LeeHeavyMercs		= 	"Ci�ki Pancerz Najemnika. Bro� 45, Pociski 10, Ogie� 30";
const string NAME_FiskLightDiggers	= 	"Lekkie Spodnie Kopacza. Bro� 8";
const string NAME_FiskDiggers		= 	"Spodnie Kopacza. Bro� 16, Ogie� 1";
const string NAME_GorNaTothHeavyTpl = 	"Ci�ka Zbroja �wi�tynna. Bro� 45, Pociski 10, Ogie� 30";
const string NAME_GorNaTothTpl 		=	"Zbroja �wi�tynna. Bro� 40, Pociski 10, Ogie� 20";
const string NAME_TorwachenPsiRock	=	"Przepaska. Bro� 5, Ogie� 1";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Cz�� zmian wejdzie w �ycie po zrestartowaniu komputera.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Przyjmij"			;
const string STR_INFO_TRADE_RESET						= "Odrzu�"			;
const string STR_INFO_TRADE_EXIT						= "WSTECZ"				;	

const string NAME_Addon_Belt			= "Pas";
const string NAME_Addon_BeltMage		= "Szarfa";

const string NAME_Addon_BeArSLD			= "Ze zbroj� najemnika + ";
const string NAME_Addon_BeArMIL			= "Ze zbroj� stra�nika + ";
const string NAME_Addon_BeArKDF			= "Ze zbroj� maga + ";
const string NAME_Addon_BeArNOV			= "Ze zbroj� nowicjusza + ";
const string NAME_Addon_BeArMC			= "Ze zbroj� pe�zacza + ";
const string NAME_Addon_BeArLeather		= "Ze sk�rzan� zbroj� + ";


const string PRINT_Eat1							= "Czujesz si� znacznie bardziej �wie�o.";
const string PRINT_Eat2							= "Smakuje �wie�o i soczy�cie.";
const string PRINT_Eat3							= "Czujesz si��, czujesz moc!";

const string PRINT_NOTHINGTOGET				= "St�d nie ma co zabra�...";
const string PRINT_NOTHINGTOGET02			= "Nic tu nie ma...";
const string PRINT_NOTHINGTOGET03			= "Nie ma czego rabowa�...";

const string PRINT_Addon_erhalten			= " - otrzyma�e�";
const string PRINT_GoldErhalten				= " szt. z�ota - otrzyma�e�";
const string PRINT_ItemErhalten				= " przedmiot - otrzyma�e�";
const string PRINT_ItemsErhalten			= " przedm. - otrzyma�e�";

const string PRINT_TirrutKey                = "Prawdopodobnie nale�a� do Tirruta.";
const string NAME_UpadlyPaladyn             = "Upad�y paladyn";
const string NAME_BrokenScoop               = "Z�amana �y�ka";
const string NAME_Cpunisko                  = "Na�pany Nowicjusz";
const int YPOS_ItemGiven		= 37;
const string MissingIntergients                    = "Brakuj�ce sk�adniki";

const string PRINT_ADDON_HACKCHANCE = "Zwi�kszy�a si� umiej�tno�� wydobywania! (+";

const string Name_Zarlokiel           = "�ar�okie�";

const string Name_Test              = "Test";

const string PRINT_NOLEARNOVERPERSONALMAX = "Maksimum dla tego nauczyciela wynosi ";