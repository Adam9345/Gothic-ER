
func void Mod_Menu_HSkills ()
{
if (MEM_KeyPressed(MEM_GetKey("menuHunterSkills"))) && (InfoManager_HasFinished ())
{
  UseFunc1Skills ();
//MEM_Game.singleStep = true;
    
};
//print ("pause");
};

func void Mod_FixAivarHero ()
{
if (MEM_KeyState (KEY_P) == KEY_PRESSED) && (InfoManager_HasFinished ()) && (hero.aivar[AIV_INVINCIBLE]== TRUE)
{
hero.aivar[AIV_INVINCIBLE]=FALSE;
print ("aivar INVINCIBLE fixed!");


};
};
//func void INIT_GLOBAL()
//{

func void Mod_SetGothicIni() {
	if(!MEM_GothOptExists("KEYS", "menuHunterSkills")) {
        MEM_SetKey("menuHunterSkills", KEY_SEMICOLON);
    };

	if (!Mem_GothOptExists("EdycjaRozszerzona", "newLearnPointsWithoutBonuses")) {
		MEM_SetGothOpt("EdycjaRozszerzona", "newLearnPointsWithoutBonuses", "1");
	};

	// if (!Mem_GothOptExists("EdycjaRozszerzona", "scaleWeaponsWithDex")) {
	// 	MEM_SetGothOpt("EdycjaRozszerzona", "scaleWeaponsWithDex", "1");
	// };

	if (!Mem_GothOptExists("EdycjaRozszerzona", "disableGuildsGreeting")) {
		MEM_SetGothOpt("EdycjaRozszerzona", "disableGuildsGreeting", "0");
	};

	if (!Mem_GothOptExists("EdycjaRozszerzona", "enableBloodSplats")) {
		MEM_SetGothOpt("EdycjaRozszerzona", "enableBloodSplats", "0");
	};

	if (!Mem_GothOptExists("EdycjaRozszerzona", "threatRedDialog")) {
		MEM_SetGothOpt("EdycjaRozszerzona", "threatRedDialog", "0");
	};

	if (!Mem_GothOptExists("EdycjaRozszerzona", "randomizePicklockStr")) {
		MEM_SetGothOpt("EdycjaRozszerzona", "randomizePicklockStr", "1");
	};
};

func void Mod_DisableGuildsGreeting() {
	if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "disableGuildsGreeting"))) {
		disableGuildsGreeting = 1;
	};
};

func void Mod_SetNewLearnPoints() {
	if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "newLearnPointsWithoutBonuses"))) {
		newLearnPointsWithoutBonuses = 1;

		if (!newStrength) {
			newStrength = 10;
		};

		if (!newDexterity) {
			newDexterity = 10;
		};

		if (!newManaMax) {
			newManaMax = 10;
		};
	};
};

func void Mod_NewDamageSystem() {
	//if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "scaleWeaponsWithDex"))) {
	InitDamage();
	//};
};

func void Mod_RandomizePicklockStr() {
	if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "randomizePicklockStr"))) {
		Init_RandomizePicklocks();
	};
};

const int _mod_init = 0;

func VOID INIT_GLOBAL() {
	MEM_InitAll();

	if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "enableBloodSplats"))) {
		LeGo_Init ((LeGo_All | LeGo_Buffs | LeGo_Render | LeGo_Draw3D));
	} else {
		LeGo_Init ((LeGo_All | LeGo_Buffs | LeGo_Render | LeGo_Draw3D) & ~(LeGo_Bloodsplats));
	}; 

	//G12_OnDmg_Event_Init ();
	if (!_mod_init) {
		Mod_SetGothicIni();
		// Init_FastTravelMap_HK();
		// AF_ItemPreview_Init();
		// Init_CraftingSystem();
		// TorchHotKey_Init();
		// G1_EnhancedPickLocking_Init();

		// Install_Character_Menu_Hook();

		// Mod_SetNewLearnPoints();
		// Mod_DisableGuildsGreeting();

		_mod_init = 1;
	};

	AF_ItemPreview_Init();
	Init_CraftingSystem();
	Init_FastTravelMap_HK();
	TorchHotKey_Init();
	G1_EnhancedPickLocking_Init();
	G1_EnhancedTrading_Init();
	G12_EnhancedInfoManager_Init();

	Install_Character_Menu_Hook();

	Mod_SetNewLearnPoints();
	Mod_DisableGuildsGreeting();

	Mod_NewDamageSystem();

	GFA_Init(GFA_ALL);

	G1_PatchFireDamageMultiplication ();

	// G12_PatchFightCombos ();
	// G12_GetDefaultDialogueDistance ();
	// G12_SetRainThroughVobs (false);
	// G12_SetDisplayDialogueTime (1500, 30000);
	// G12_SetPlayerTurnSpeed(castToIntF (0.1));

	Init_XPForPicklocking ();
	Mod_RandomizePicklockStr();
};


//};
func VOID STARTUP_SUB_PSICAMP ()
{	
	bohater_upity = 0;//do przeniesienia
	
	//-----------OLD MINE-----------------------------------------
	Wld_InsertNpc				(Tpl_1400_GorNaBar,"PSI_START");	
	Wld_InsertNpc				(Tpl_1401_GorNaKosh,"PSI_START");	
	//-----------EDYCJA ROZSZERZONA----------------------------
	Wld_InsertNpc				(NOV_1377_Starkad,"PSI_START");
	//Wld_InsertNpc				(NON_2234_Medrzec,"PSI_START"); nope, nope, scalone with Uturiel
	Wld_InsertNpc				(TPL_3928_GorNaLin,"PSI_START");
	Wld_InsertNpc				(NOV_1375_Hakan,"PSI_START");
	Wld_InsertNpc				(NOV_1378_Hanson,"PSI_START");
	Wld_InsertNpc				(TPL_1490_GorNaTokas,"PSI_START");
	//Lukor quest
	Wld_InsertNpc				(NON_3926_Hersztgrupy,"CAVE_BANDIT_2");
	//B_SetPermAttitude	(NON_3926_Hersztgrupy,	ATT_HOSTILE);
	Wld_InsertNpc				(NON_3924_Rabus,"CAVE_BANDIT_2");
	//B_SetPermAttitude	(NON_3924_Rabus,	ATT_HOSTILE);
	Wld_InsertNpc				(NON_3925_Rabus,"CAVE_BANDIT_2");
	//B_SetPermAttitude	(NON_3925_Rabus,	ATT_HOSTILE);
	//----------------GURUS---------------------------------------------------
	Wld_InsertNpc				(Gur_1200_YBerion,"PSI_START");			
	Wld_InsertNpc				(Gur_1201_CorKalom,"PSI_START");		//Drogenlabor
	Wld_InsertNpc				(Gur_1202_CorAngar,"PSI_START");		//Hut 17, Trainingsplatz
	Wld_InsertNpc				(Gur_1203_BaalTondral,"PSI_START");		//Hut 28, Teacher 3
	Wld_InsertNpc				(Gur_1204_BaalNamib,"PSI_START");		//Hauptorplatz, Smalltalk mit Lester
	Wld_InsertNpc				(Gur_1205_Chani,"PSI_START");			
	Wld_InsertNpc				(Gur_1207_Natalia,"PSI_START");			
	Wld_InsertNpc				(Gur_1208_BaalCadar,"PSI_START");	//Lehrer 2, Hut 23
	Wld_InsertNpc				(Gur_1209_BaalOrun,"PSI_START");	//Kraut-Supervisor, Hut PSI_TREE_IN
	Wld_InsertNpc				(Gur_1210_BaalTyon,"PSI_START");	
	Wld_InsertNpc				(GUR_1213_BaalLukor_world,"PSI_START"); //er
	Wld_InsertNpc				(TPL_3927_GorBoba, "PSI_START" );
	//-----------------WINNICA-------------------------------------
	Wld_InsertNpc				(NOV_1379_Ghoran,"PSI_START");
	Wld_InsertNpc				(NOV_5077_Nowicjusz,"PSI_START");
	Wld_InsertNpc				(NOV_5078_Nowicjusz,"PSI_START");
	Wld_InsertNpc				(NOV_5080_Nowicjusz,"PSI_START");
	Wld_InsertNpc				(NOV_5081_Nowicjusz,"PSI_START");
	//-----------TEMPEL-Novizen-------------(auch f�r Gro�e Beschw�rung)------------------
	Wld_InsertNpc				(Nov_1319_Novize,"PSI_START"); //wichtiger Trigger, Beter
	Wld_InsertNpc				(Nov_1320_Novize,"PSI_START"); //wichtiger Trigger, Beter
	Wld_InsertNpc				(Nov_1337_Novize,"PSI_START"); //  Beter
	Wld_InsertNpc				(Nov_1338_Novize,"PSI_START"); //H Beter
	Wld_InsertNpc				(Nov_1339_Novize,"PSI_START"); //H Beter
	Wld_InsertNpc				(Nov_1341_Novize,"PSI_START"); //H Beter
	Wld_InsertNpc				(Nov_1343_Novize,"PSI_START"); //H Beter
	Wld_InsertNpc				(Nov_1344_Novize,"PSI_START"); //H Beter
	Wld_InsertNpc				(Nov_1346_Novize,"PSI_START"); //L Beter
	Wld_InsertNpc				(Nov_1347_Novize,"PSI_START"); //  Beter
	Wld_InsertNpc				(Nov_1348_Novize,"PSI_START"); //L Beter
	Wld_InsertNpc				(Nov_1349_Novize,"PSI_START"); //  Beter
	//-------------CAMP-Novizen--------------------------------------------
	Wld_InsertNpc				(Nov_1300_Talas,"PSI_START");	//h�ngt auf Tempelplatz rum (goobo-cave-heini)
	Wld_InsertNpc				(Nov_1301_Caine,"PSI_START");	//Hut 21, bei Labor oben / Im Labor
	Wld_InsertNpc				(NOV_1303_Nyras,"PSI_START");	//Smalltalker m.1320 vor Stampfplatz, Hut 3/
	Wld_InsertNpc				(Nov_1305_Joru,"PSI_START");	//Lehrer-Anw�rter. Lehrplatz 1
	Wld_InsertNpc				(Nov_1306_Novize,"PSI_START");	//Hut 1
	Wld_InsertNpc				(Nov_1307_Novize,"PSI_START");	//Hut 2
	Wld_InsertNpc				(Nov_1308_Novize,"PSI_START");	//Krautstampfer, Hut6 Bed1
	Wld_InsertNpc				(Nov_1309_Novize,"PSI_START");	//Krautstampfer, Hut6 Bed2
	Wld_InsertNpc				(Nov_1310_Ghorim,"PSI_START");	//Krautstampfer, Hut6 Bed3
	Wld_InsertNpc				(Nov_1311_Novize,"PSI_START");	//Hut 10 Smalltalk
	Wld_InsertNpc				(Nov_1312_Darrion,"PSI_START"); //Ober-Schmied, 24h
	Wld_InsertNpc				(Nov_1313_Novize,"PSI_START");	//Sch�ler, Joru-Platz, Hut 12
	Wld_InsertNpc				(Nov_1314_Novize,"PSI_START"); 	//Hut 13
	Wld_InsertNpc				(Nov_1315_Novize,"PSI_START"); 	//Sch�ler, Joru-Platz, Hut 12
	Wld_InsertNpc				(Nov_1316_Novize,"PSI_START");	//Schmiede 24h
	Wld_InsertNpc				(Nov_1317_Novize,"PSI_START");	//Smalltalker m.1303 vor Stampfplatz, Hut 4
	Wld_InsertNpc				(Nov_1318_Novize,"PSI_START");  //Hut 10 Smalltalk
	Wld_InsertNpc				(Nov_1321_Novize,"PSI_START");	//Hut 9
	Wld_InsertNpc				(Nov_1322_Novize,"PSI_START"); 	//Hut 7
	Wld_InsertNpc				(Nov_1323_Novize,"PSI_START");	//Hut 29
	Wld_InsertNpc				(Nov_1324_Novize,"PSI_START");	//Hut 30
	Wld_InsertNpc				(Nov_1325_Novize,"PSI_START");	//Hut 8
	Wld_InsertNpc				(Nov_1326_Novize,"PSI_START");	//Sch�ler Baal Tondral (Platz 2)
	Wld_InsertNpc				(Nov_1327_Novize,"PSI_START"); //Hut 31, Fortuno-Platz
	Wld_InsertNpc				(Nov_1336_Novize,"PSI_START"); //Sch�ler 2, Baal Cadar
	Wld_InsertNpc				(Nov_1340_Novize,"PSI_START"); //Sch�ler 2, Baal Cadar
	Wld_InsertNpc				(Nov_1342_Novize,"PSI_START"); //Sch�ler Baal Tondral (Platz 2)
	Wld_InsertNpc				(Nov_1345_Novize,"PSI_START"); //Sch�ler 2, Baal Cadar
	Wld_InsertNpc				(Nov_1350_Novize,"PSI_START"); //KALOM PRIVATHAUS-WACHE
	Wld_InsertNpc				(Nov_1351_Novize,"PSI_START"); //Schmiede 24h
	Wld_InsertNpc				(Nov_1353_Novize,"PSI_START"); //Sch�ler Baal Tondral (Platz 2)
	Wld_InsertNpc				(Nov_1354_Novize,"PSI_START"); //Hut 19, oben vor Templern **
	Wld_InsertNpc				(Nov_1355_Novize,"PSI_START"); //Hut 19, oben vor Templern **
	Wld_InsertNpc				(Nov_1357_Fortuno,"PSI_START");	//Hut 32, Fortuno-Platz
	Wld_InsertNpc 				(Nov_1358_Harlok,"PSI_START");	//Hut 31, Fortuno-Platz
	//-----------Sammler-Novizen---------------------------------------------
	Wld_InsertNpc				(Nov_1302_Viran,"PSI_START"); //Krautsammler
	Wld_InsertNpc				(Nov_1328_Novize,"PSI_START"); //Krautsammler
	Wld_InsertNpc				(Nov_1329_Novize,"PSI_START"); //Krautsammler
	Wld_InsertNpc				(Nov_1304_Balor,"PSI_START"); //Krautsammler
	Wld_InsertNpc				(Nov_1334_Novize,"PSI_START"); //Krautsammler
	Wld_InsertNpc				(Nov_1335_Novize,"PSI_START"); //Krautsammler
	
	Wld_InsertNpc				(Nov_1371_BaalNetbek,"PSI_START"); //Sumpfpromi

	//--------------Sumpfh�tte----------------------------------------------
	Wld_InsertNpc				(Nov_1356_Shrat,"PSI_START"); //ST-Verpisser
	//---------------Templer-------------------------------------------------
	Wld_InsertNpc				(Tpl_1402_GorNaToth,"PSI_START");	//Hut 33, hinter Trainingsplatz
	Wld_InsertNpc				(Tpl_1403_Templer,"PSI_START");		//Stegwache 2 Baumstamm
	Wld_InsertNpc				(Tpl_1404_Templer,"PSI_START");		//Stegwache 1
	Wld_InsertNpc				(Tpl_1405_GorNaRan,"PSI_START");	//Stegwache 3, wahnsinner Sumpfhai-J�ger, 
	Wld_InsertNpc				(Tpl_1406_Templer,"PSI_START");	//Kaloms Wache (Labor)
	Wld_InsertNpc				(Tpl_1408_Templer,"PSI_START"); //24h auf Klotz bei Tempelplatz
	Wld_InsertNpc				(Tpl_1409_Templer,"PSI_START");	//Schmiede-Smalltalker, 24h
	Wld_InsertNpc				(Tpl_1410_Templer,"PSI_START"); //Schmiede-Smalltalker, 24h
	Wld_InsertNpc				(Tpl_1411_Templer,"PSI_START");	//**TRAINEE, Hut 16
	Wld_InsertNpc				(Tpl_1412_Templer,"PSI_START"); //**TRAINEE, Hut 15
	Wld_InsertNpc				(Tpl_1413_Templer,"PSI_START"); //TEMPELTOR unten
	Wld_InsertNpc				(Tpl_1414_Templer,"PSI_START");	//**TRAINEE, Hut 18
	Wld_InsertNpc				(Tpl_1415_Templer,"PSI_START");		//Haupttorwache
	Wld_InsertNpc				(Tpl_1416_Templer,"PSI_START");		//Haupttorwache
	Wld_InsertNpc				(Tpl_1417_Templer,"PSI_START"); //Hut (Trainee-Area) ** Wache zu Angar
	Wld_InsertNpc				(Tpl_1418_Templer,"PSI_START");	//**TRAINEE, Hut 33
	Wld_InsertNpc				(Tpl_1419_Templer,"PSI_START");	//**TRAINEE, Hut 34
	Wld_InsertNpc				(Tpl_1420_Templer,"PSI_START");	//Hut (Trainee-Area) ** Wache zu Angar
	Wld_InsertNpc				(Tpl_1430_Templer,"PSI_START");		//TEMPELTOR unten
	Wld_InsertNpc				(Tpl_1431_Templer,"PSI_START");		//TEMPELTOR unten
	Wld_InsertNpc				(Tpl_1432_Templer,"PSI_START");		//TEMPELTOR unten
	Wld_InsertNpc				(Tpl_1439_GorNaDrak,"PSI_START");	//MC-J�ger, Fortuno-Platz
	Wld_InsertNpc				(Tpl_1440_Templer,"PSI_START");		//MC-J�ger, Fortuno-Platz
	Wld_InsertNpc				(Tpl_1441_Templer,"PSI_START");		//TEMPELTOR
	Wld_InsertNpc				(Tpl_1442_Templer,"PSI_START");		//TEMPELTOR
	//---------------Patrol----------------------------------------------------------------
	Wld_InsertNpc				(Tpl_1423_Templer,"PSI_START");		//Patrol
	Wld_InsertNpc				(Tpl_1424_Templer,"PSI_START");		//Patrol
	Wld_InsertNpc				(Tpl_1425_Templer,"PSI_START");		//Patrol
	Wld_InsertNpc				(Tpl_1407_Templer,"PSI_START"); 	//Horst Patrol
	//---------------Elite////////////////////////
	Wld_InsertNpc				(Tpl_5000_Elite,"PSI_START");
	Wld_InsertNpc				(Tpl_5001_Elite,"PSI_START");
	Wld_InsertNpc				(Tpl_5002_Elite,"PSI_START");
	Wld_InsertNpc				(Tpl_5003_Elite,"PSI_START");
	//-----------------Z�odziejska wsp�praca
    Wld_InsertNpc				( NOV_40000_Brago,	"PSI_START" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_40001_Mosul,	"PSI_START" ); // Betet im Tempel
    Wld_InsertNpc				( Wolf,	    "WP_GOLEMIK1" );
		
	//--------------------Admin------------------------------------------------------------
	Wld_InsertNpc				(TPL_5004_Shan,"PSI_START");
	//-------------------Bagno-------------------------------------------------
	Wld_InsertNpc				(NOV_1376_Steh,"PSI_START");
	Wld_InsertNpc				(NOV_1380_ArtfiactsThief,"PSI_START");
	//---------------Lester---------------------------------------------------------------
	Wld_InsertNpc				(PC_Psionic,"PSI_START");			//Am Start: Haupttorplatz, Smalltalk mit BaalNamib.
	//-------------Lagerfremde-----------------------------------
	Wld_InsertNpc				(VLK_582_Melvin,"PSI_START");		//Joru-Sch�ler, Hut 12
	Wld_InsertNpc				(NOV_40033_Sakhar,"PSI_START");		
	Wld_InsertNpc				(NOV_40065_Cpun,"PSI_START");
	Wld_InsertNpc				(TPL_40091_TempleGuard,"PSI_START");		
	Wld_InsertNpc				(TPL_40092_TempleGuard,"PSI_START");
	
	Wld_InsertNpc				(NON_40110_Rabus,"PSI_START");
	Wld_InsertNpc				(NON_40111_Rabus,"PSI_START");
	Wld_InsertNpc				(NON_40112_Herszt,"PSI_START");
	Wld_InsertNpc				(NON_40113_Rabus,"PSI_START");
	Wld_InsertNpc				(NON_40114_Rabus,"PSI_START");
	
	Wld_InsertNpc				(TPL_40115_GorNaPol,"PSI_START");
	Wld_InsertNpc				(Nov_40148_Zagol,"PSI_START");
	
	Wld_InsertNpc				(Skeleton_LordJO,"WP_JO_SKE_03");
	
};
func VOID INIT_SUB_PSICAMP ()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN PSICAMP                  **
	**************************************************************/
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_01",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_02",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_03",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_04",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_05",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_06",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_07",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_08",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_09",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_10",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_11",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_12",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_13",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_14",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_15",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_16",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_17",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_18",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_19",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_20",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_21",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_22",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_23",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_24",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_25",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_26",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_27",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_28",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_29",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_30",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_31",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_32",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_33",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_34",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_35",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_36",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_37",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_38",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_39",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_40",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_41",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_42",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_43",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_44",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_45",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_46",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_47",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_48",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_49",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_50",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_51",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_52",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_53",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_54",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_55",0);
	
	/**************************************************************
	**        PORTALRAUMZUWEISUNG IM PSICAMP			         **
	**************************************************************/
	Wld_AssignRoomToGuild("PSIH01",GIL_NOV); //OK				nlhu01 - nlhu32                
	Wld_AssignRoomToGuild("PSIH02",GIL_NOV); //defekt       
	Wld_AssignRoomToGuild("PSIH03",GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH04",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH05",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH06",GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH07",GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH08",GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH09",GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH10",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH11",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH12",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH13",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH14",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH15",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH16",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH17",GIL_NOV);//defekt
	Wld_AssignRoomToGuild("PSIH18",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH19",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH20",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH21",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH22",GIL_NOV);
	//Wld_AssignRoomToGuild("PSIH23",GIL_NOV); //Harloks H�tte, Hut 31
	Wld_AssignRoomToGuild("PSIH24",GIL_NOV);
	//Wld_AssignRoomToGuild("PSIH25",GIL_NOV); Alchemielabor soll frei zug�nglich sein!
	Wld_AssignRoomToGuild("PSIH26",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH27",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH28",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH29",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH30",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH31",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH32",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH33",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH34",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH35",GIL_NOV);
	Wld_AssignRoomToGuild("PSIH36",GIL_NOV);
};

func VOID STARTUP_SUB_NEWCAMP ()
{
	//----------Vorplatz (Surface)---------------------------			*******************ToDo!!!!!!!*****************************+
	Wld_InsertNpc				(ORG_829_Organisator,"NC_DAM"); //Vortor
	Wld_InsertNpc				(ORG_830_Organisator,"NC_DAM"); //Vortor
	Wld_InsertNpc				(ORG_831_Organisator,"NC_DAM"); //Vortor
	Wld_InsertNpc				(ORG_832_Organisator,"NC_DAM"); //Vortor
	Wld_InsertNpc				(ORG_834_Organisator,"NC_DAM"); //Wheel-Wache
	//Wld_InsertNpc				(BAU_925_Bauer,"NC_DAM"); 		//Nach Vortor
	//Wld_InsertNpc				(BAU_926_Bauer,"NC_DAM"); 		//Nach Vortor
	//----------------Bauern---------------------------------
	Wld_InsertNpc				(BAU_900_Ricelord,"NC_DAM"); //Im Ricebunker
	Wld_InsertNpc				(BAU_901_Horatio,"NC_DAM"); //CF3
	Wld_InsertNpc				(BAU_902_Pock,"NC_DAM");  //CF2
	Wld_InsertNpc				(BAU_903_Rufus,"NC_DAM"); //CF1
	Wld_InsertNpc				(BAU_904_Bauer,"NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc				(BAU_905_Bauer,"NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc				(BAU_907_Bauer,"NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc				(BAU_908_Bauer,"NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc				(BAU_912_Jeremiah,"NC_DAM"); //GEHILFE von Silas, pennt in Kneipe
	
	//er 1.4
	Wld_InsertNpc				(ORG_952_Riv,"NC_DAM");
	Wld_InsertNpc				(ORG_951_Organisator,"NC_DAM");
	Wld_InsertNpc				(ORG_950_Organisator,"NC_DAM");
	//Wld_InsertNpc				(ORG_954_Kil,"KIL");
	//Wld_InsertNpc				(ORG_955_Fil,"FIL");
	Wld_InsertNpc				(ORG_956_Vincent,"NC_Dam");
	Wld_InsertNpc				(ORG_9550_Huan,"NO_WODA");
	
	Wld_InsertNpc				(BAU_914_Bauer,"NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc				(BAU_915_Bauer,"NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc				(BAU_916_Bauer,"NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc				(BAU_917_Bauer,"NC_DAM"); //Hut, Peasant_Sleep
	Wld_InsertNpc				(BAU_919_Bauer,"NC_DAM"); //Hut, Peasant 
	Wld_InsertNpc				(BAU_920_Bauer,"NC_DAM"); //Hut, Peasant 
	Wld_InsertNpc				(BAU_921_Bauer,"NC_DAM"); //Hut, Peasant4 
	Wld_InsertNpc				(BAU_922_Bauer,"NC_DAM"); //CF1 bei Rufus
	Wld_InsertNpc				(BAU_923_Bauer,"NC_DAM"); //CF1 bei Rufus
	Wld_InsertNpc				(BAU_924_Foster,"NC_DAM"); //CF1 bei Rufus
	Wld_InsertNpc				(BAU_927_Bauer,"NC_DAM"); //CF2 bei Pock
	Wld_InsertNpc				(BAU_928_Bauer,"NC_DAM"); //CF2 bei Pock
	Wld_InsertNpc				(BAU_929_Bauer,"NC_DAM"); //CF3 bei Horatio
	Wld_InsertNpc				(BAU_930_Bauer,"NC_DAM"); //CF3 bei Horatio
	Wld_InsertNpc				(BAU_935_Homer,"NC_DAM"); //ARCHITEKT - auf Damm ?????????????????????????Hut???
	//----------------Magier---------------------------------
	Wld_InsertNpc				(KDW_600_Saturas,"NC_DAM");		//KDW04
	Wld_InsertNpc				(KDW_601_Myxir,"NC_DAM");		//KDW03
	Wld_InsertNpc				(KDW_602_Merdarion,"NC_DAM"); 	//KDW01
	Wld_InsertNpc				(KDW_603_Nefarius,"NC_DAM");	//KDW05
	Wld_InsertNpc				(KDW_604_Cronos,"NC_DAM");		//KDW02 (z.Zt immer am Gitter)
	Wld_InsertNpc				(KDW_605_Riordian,"NC_DAM");	//KDW06
	//------------Organisatoren---------------------------------
	Wld_InsertNpc				(ORG_800_Organisator,"NC_DAM"); //Hut 26
	Wld_InsertNpc				(ORG_801_Lares,"NC_DAM");		//Hut 22
	Wld_InsertNpc				(ORG_804_Organisator,"NC_DAM"); //Durchgangs-Wache zu Lares, 24h
	Wld_InsertNpc				(ORG_806_Rene,"NC_DAM"); //Hut 20
	Wld_InsertNpc				(ORG_807_Organisator,"NC_DAM"); //Hut 14
	Wld_InsertNpc				(ORG_810_Organisator,"NC_DAM"); //Hut 12
	Wld_InsertNpc				(ORG_811_Organisator,"NC_DAM"); //Hut 17
	Wld_InsertNpc				(ORG_815_Organisator,"NC_DAM"); //Hut 29
	Wld_InsertNpc				(ORG_816_Organisator,"NC_DAM"); //Hut 28
	Wld_InsertNpc				(ORG_817_Organisator,"NC_DAM"); //Hut 13
	Wld_InsertNpc				(ORG_820_Organisator,"NC_DAM"); //Hut 12
	Wld_InsertNpc				(ORG_821_Organisator,"NC_DAM"); //Hut 25, Tavern Top
	Wld_InsertNpc				(ORG_822_Organisator,"NC_DAM"); //Hut 16
	Wld_InsertNpc				(ORG_823_Zick,"NC_DAM"); //Hut 21
	Wld_InsertNpc				(ORG_824_Organisator,"NC_DAM"); //Hut 24, Tavern Top
	Wld_InsertNpc				(ORG_825_Organisator,"NC_DAM"); //Durchgangs-Wache zu Lares, 24h
	Wld_InsertNpc				(ORG_828_Bruce,"NC_DAM");		//Hut 27
	Wld_InsertNpc				(ORG_833_Buster,"NC_DAM");		//Hut 30
	Wld_InsertNpc				(ORG_836_Organisator,"NC_DAM"); //Hut 26
	Wld_InsertNpc				(ORG_837_Organisator,"NC_DAM"); //Hut 31, Kneipe
	Wld_InsertNpc				(ORG_838_Organisator,"NC_DAM"); //Hut 31, Kneipe
	Wld_InsertNpc				(ORG_840_Roscoe,"NC_DAM");		//Durchgangs-Wache: 24h vor Hut 22 (Lares)
	Wld_InsertNpc				(ORG_841_Silas,"NC_DAM");		//Wirt, 24h in Kneipe
	Wld_InsertNpc				(ORG_842_Shrike,"NC_DAM");		//Hut 01, dann Hut 18
	Wld_InsertNpc				(ORG_843_Sharky,"NC_DAM");		//Hut 25
	Wld_InsertNpc				(ORG_844_Lefty,"NC_DAM");	  	//Ricelords Schl�ger, CF
	Wld_InsertNpc				(ORG_845_Schlaeger,"NC_DAM"); 	//Ricelords Schl�ger, CF
	Wld_InsertNpc				(ORG_846_Schlaeger,"NC_DAM"); 	//Ricelords Schl�ger, CF
	Wld_InsertNpc				(ORG_850_Wedge,"NC_DAM");		//Hut 17
	Wld_InsertNpc				(ORG_851_Butch,"NC_DAM");		//Hut 15
	Wld_InsertNpc				(ORG_855_Wolf,"NC_DAM");		//Hut 11
	Wld_InsertNpc				(ORG_873_Cipher,"NC_DAM");		//Hut 24
	Wld_InsertNpc				(ORG_875_Tuersteher,"NC_DAM"); 	//Kneipen-Tuersteher
	Wld_InsertNpc				(ORG_876_Tuersteher,"NC_DAM"); 	//Kneipen-Tuersteher
	//==================SUBMOD==================================================================
	
	Wld_InsertNpc				(ORG_40017_Pomocnik,"NC_DAM");
	Wld_InsertNpc				(SFB_40046_Douglas,"NC_DAM");
	Wld_InsertNpc				(ORG_40021_Szkodnik,"NC_DAM"); //Trainee (Cord)
	Wld_InsertNpc				(ORG_40022_Szkodnik,"NC_DAM");	 //Hut 04
	Wld_InsertNpc				(ORG_40023_Szkodnik,"NC_DAM"); //Drehradwach
	Wld_InsertNpc				(SLD_40070_Florian,"NC_DAM"); //Drehradwach
	//----------------S�ldner---------------------------------
	Wld_InsertNpc				(SLD_700_Lee,"NC_DAM");		 //NC_Small_Cave_Center
	Wld_InsertNpc				(SLD_701_Orik,"NC_DAM");	 //Hut 05
	Wld_InsertNpc				(SLD_702_Soeldner,"NC_DAM");	 //24h Wache vor Lee (Ex-Grunt)
	Wld_InsertNpc				(SLD_703_Soeldner,"NC_DAM"); //Hut 02
	Wld_InsertNpc				(SLD_704_Blade,"NC_DAM");	 //Hut 10
	Wld_InsertNpc				(SLD_705_Soeldner,"NC_DAM"); //Hut 03
	Wld_InsertNpc				(SLD_706_Soeldner,"NC_DAM"); //Hut 02
	Wld_InsertNpc				(SLD_707_Soeldner,"NC_DAM"); //Haupttor oben, bei Drehradwache
	Wld_InsertNpc				(SLD_708_Soeldner,"NC_DAM"); //Hut 07, Gorn-Platz (Ex-Marvin)
	Wld_InsertNpc				(SLD_709_Cord,"NC_DAM");	 //Hut 09, Trainer am Wassefall
	Wld_InsertNpc				(SLD_710_Soeldner,"NC_DAM"); //Hut 10
	Wld_InsertNpc				(SLD_720_Soeldner,"NC_DAM"); //Hut 07, Gorn-Platz
	Wld_InsertNpc				(SLD_723_Soeldner,"NC_DAM"); //Durchgangs-Wache Magier
	Wld_InsertNpc				(SLD_725_Soeldner,"NC_DAM"); //24h vor Erzhaufen
	Wld_InsertNpc				(SLD_726_Soeldner,"NC_DAM"); //24h vor Erzhaufen
	Wld_InsertNpc				(SLD_727_Soeldner,"NC_DAM"); //Haupttorwache bei Jarvis
	Wld_InsertNpc				(SLD_728_Jarvis,"NC_DAM");	 //bewacht Haupttor, 24h 
	Wld_InsertNpc				(SLD_730_Soeldner,"NC_DAM"); //Hut 03
	Wld_InsertNpc				(SLD_731_Soeldner,"NC_DAM"); //24h Wache vor Lee
	Wld_InsertNpc				(SLD_732_Soeldner,"NC_DAM"); //Durchgangs-Wache Magier
	Wld_InsertNpc				(SLD_733_Soeldner,"NC_DAM"); //Haupttor, Ausguck auf Reisfelder
	Wld_InsertNpc				(SLD_735_Soeldner,"NC_DAM"); //Trainee (Cord)
	Wld_InsertNpc				(SLD_736_Soeldner,"NC_DAM"); //Trainee (Cord)
	Wld_InsertNpc				(SLD_737_Torlof,"NC_DAM");	 //Hut 04
	Wld_InsertNpc				(SLD_738_Soeldner,"NC_DAM"); //Drehradwache Haupttor 
	Wld_InsertNpc				(PC_Fighter,"NC_DAM");		 //Hut 6
	
	Wld_InsertNpc				(SLD_40064_Fritz,"NC_DAM");
	Wld_InsertNpc				(NON_40073_Rabus,"NC_DAM");
	Wld_InsertNpc				(NON_40072_Rabus,"NC_DAM");
	Wld_InsertNpc				(SLD_40129_Pascal,"NC_DAM");
	Wld_InsertNpc				(SLD_40130_Zerron,"NC_DAM");
	//-----------Sch�rfer in Bar--------------------------------
	Wld_InsertNpc				(SFB_1000_Senyan,"NC_DAM");	
	Wld_InsertNpc				(SFB_1001_Schuerfer,"NC_DAM");	
	Wld_InsertNpc				(ORG_2704_Mazin,"NC_DAM");	
	Wld_InsertNpc				(NON_5635_Will,"NC_DAM");	
	
	Wld_InsertNpc				(SLD_5575_Alvaro,"NC_DAM");	
	//-------------Lagerfremde---------------------------------
	Wld_InsertNpc				(NOV_1332_BaalKagan,"NC_DAM");  //vor Hut 21, Abends bei Bauern am CF3
	Wld_InsertNpc				(NOV_1333_BaalIsidro,"NC_DAM"); //24 in Kneipe an Ecktisch
	// Mordrag: Hut 19

	Wld_InsertNpc				(DamLurker, "NC_SPAWN_DAM_LURKER2");
	
	
	Wld_InsertNpc				(SkeletonKH, "WP_KH3");
	Wld_InsertNpc				(SkeletonKH, "WP_KH4");
	Wld_InsertNpc				(SkeletonKH, "WP_KH5");
	Wld_InsertNpc				(SkeletonKH, "WP_KH6");
	Wld_InsertNpc				(SkeletonKH, "WP_KH7");
	Wld_InsertNpc				(SkeletonKH, "WP_KH8");
	Wld_InsertNpc				(SkeletonKH, "WP_KH9");
	Wld_InsertNpc				(SkeletonKH, "WP_KH10");
	Wld_InsertNpc				(Skeleton_LordKH, "WP_KH12");
	
};

func VOID INIT_SUB_NEWCAMP ()
{
	//**************************************************************
	
	// Objekt-TAs
	//Wld_SetObjectRoutine (20,00,"EVT_NC_MAINGATE01_TRIGGER",1);		// SN 09.01.01: auskommentiert, damit Tore rund um die Uhr offen sind
	//Wld_SetObjectRoutine (08,00,"EVT_NC_MAINGATE01_TRIGGER",0);
	
	/**************************************************************
	**                 PORTALRAUMZUWEISUNG                       **
	**************************************************************/
	Wld_AssignRoomToGuild("RICEB01",GIL_ORG); 
	Wld_AssignRoomToGuild("RICEB02",GIL_ORG);
	
	/**************************************************************
	**        PORTALRAUMZUWEISUNG IM NEUEN LAGER			   	**
	**************************************************************/
	Wld_AssignRoomToGuild("NLHU25",GIL_ORG);	// Waypoint NC_HUT01 (SC-H�tte)
	//Wld_AssignRoomToGuild("NLOBERM",GIL_BAU);	// Lee's H�hle

	Wld_AssignRoomToGuild("NLHU26",GIL_SLD);	// Waypoint NC_HUT02
	Wld_AssignRoomToGuild("NLHU27",GIL_SLD);	// Waypoint NC_HUT03
	Wld_AssignRoomToGuild("NLHU31",GIL_SLD);	// Waypoint NC_HUT04
	Wld_AssignRoomToGuild("NLHU32",GIL_SLD);	// Waypoint NC_HUT05
	Wld_AssignRoomToGuild("NLHU23",GIL_SLD);	// Waypoint NC_HUT06
	Wld_AssignRoomToGuild("NLHU24",GIL_SLD);	// Waypoint NC_HUT07
	Wld_AssignRoomToGuild("NLHU30",GIL_SLD);	// Waypoint NC_HUT08
	Wld_AssignRoomToGuild("NLHU29",GIL_SLD);	// Waypoint NC_HUT09
	Wld_AssignRoomToGuild("NLHU28",GIL_SLD);	// Waypoint NC_HUT10

	Wld_AssignRoomToGuild("NLHU22",GIL_ORG);	// Waypoint NC_HUT11
	Wld_AssignRoomToGuild("NLHU03",GIL_ORG);	// Waypoint NC_HUT12
	Wld_AssignRoomToGuild("NLHU05",GIL_ORG);	// Waypoint NC_HUT13
	Wld_AssignRoomToGuild("NLHU06",GIL_ORG);	// Waypoint NC_HUT14
	Wld_AssignRoomToGuild("NLHU21",GIL_ORG);	// Waypoint NC_HUT15
	Wld_AssignRoomToGuild("NLHU20",GIL_ORG);	// Waypoint NC_HUT16
	Wld_AssignRoomToGuild("NLHU19",GIL_ORG);	// Waypoint NC_HUT17
	Wld_AssignRoomToGuild("NLHU18",GIL_ORG);	// Waypoint NC_HUT18
	Wld_AssignRoomToGuild("NLHU17",GIL_ORG);	// Waypoint NC_HUT19
	Wld_AssignRoomToGuild("NLHU16",GIL_ORG);	// Waypoint NC_HUT20
	Wld_AssignRoomToGuild("NLHU15",GIL_ORG);	// Waypoint NC_HUT21
	//Wld_AssignRoomToGuild("NLHU14",GIL_BAU);	// Waypoint NC_HUT22 (Lares' H�tte)
	Wld_AssignRoomToGuild("NLHU13",GIL_ORG);	// Waypoint NC_HUT23
	Wld_AssignRoomToGuild("NLHU12",GIL_ORG);	// Waypoint NC_HUT24
	Wld_AssignRoomToGuild("NLHU11",GIL_ORG);	// Waypoint NC_HUT25
	Wld_AssignRoomToGuild("NLHU10",GIL_ORG);	// Waypoint NC_HUT26
	Wld_AssignRoomToGuild("NLHU09",GIL_ORG);	// Waypoint NC_HUT27
	Wld_AssignRoomToGuild("NLHU08",GIL_ORG);	// Waypoint NC_HUT28
	Wld_AssignRoomToGuild("NLHU07",GIL_ORG);	// Waypoint NC_HUT29
	Wld_AssignRoomToGuild("NLHU04",GIL_ORG);	// Waypoint NC_HUT30
	Wld_AssignRoomToGuild("NLHU02",GIL_ORG);	// Waypoint NC_HUT31
	Wld_AssignRoomToGuild("NLHU01",GIL_ORG);	// Waypoint NC_HUT32

	Wld_AssignRoomToGuild("MAGE01",GIL_KDW);	//NC_KDW01_IN
	//Wld_AssignRoomToGuild("MAGE02",GIL_KDW);	//Alchemielabor frei zug�nglich!
	Wld_AssignRoomToGuild("MAGE03",GIL_KDW);	//NC_KDW05_IN
	//Wld_AssignRoomToGuild("MAGE04",GIL_KDW);	//Bibliothek frei zug�nglich!
	Wld_AssignRoomToGuild("MAGE05",GIL_KDW);	//NC_KDW03_IN
	Wld_AssignRoomToGuild("MAGE06",GIL_KDW);	//NC_KDW02_IN
	//Wld_AssignRoomToGuild("MAGHO4",GIL_KDW);	//Pentagrammh�hle frei zug�nglich
		
};

FUNC VOID STARTUP_SUB_OLDCAMP ()
{
	Wld_InsertNpc				(NON_5677_Stary,"OC1");//
	Wld_InsertNpc				(NON_5636_Thompson,"OC1"); //1.25
	
	//informacja: npc nie jest ju� spawnowany w Old_camp, pojawia si� tylko w startup Abadoned_mine
	
	
	Wld_InsertNpc				(VLK_501_Buddler,"OC1"); //Hut 79, oben neben S�dtor
	Wld_InsertNpc				(VLK_502_Buddler,"OC1"); //Hut 10, MarusPlatz (Ex-Marus)
	Wld_InsertNpc				(VLK_503_Buddler,"OC1"); //Hut 53, oberer Platz am Markt
	Wld_InsertNpc				(VLK_504_Buddler,"OC1");	 //Hut 12 (Burgtor unten) (Ex-Ryan)
	Wld_InsertNpc				(VLK_505_Buddler,"OC1"); //Hut 7, zu Marus
	Wld_InsertNpc				(VLK_506_Buddler,"OC1"); //Hut 15, SnafPlatz
	Wld_InsertNpc				(VLK_507_Buddler,"OC1"); //Hut 54, oberer Platz am Markt
	Wld_InsertNpc				(VLK_508_Buddler,"OC1"); //Hut 37, Fox Platz
	Wld_InsertNpc				(VLK_509_Buddler,"OC1"); //Hut 56. MPlatz OBEN
	Wld_InsertNpc				(VLK_510_Buddler,"OC1"); //Hut 28, Huno Platz
	Wld_InsertNpc				(VLK_511_Herek,"OC1");	 //Hut 62, Bloodwyn-Platz
	Wld_InsertNpc				(VLK_512_Buddler,"OC1"); //Hut 64, Durchgangsh�tte Bloodwyn/Markt 
	Wld_InsertNpc				(VLK_513_Buddler,"OC1"); //Hut 24, Arenaplatz
	Wld_InsertNpc				(VLK_514_Buddler,"OC1"); //Hut 25, Arenaplatz
	Wld_InsertNpc				(VLK_515_Buddler,"OC1"); //Hut 23, ArenaPlatz
	Wld_InsertNpc				(VLK_516_Buddler,"OC1"); //Hut 48, Marktplatz
	Wld_InsertNpc				(VLK_517_Buddler,"OC1"); //Hut 46, Marktplatz (Ex-Canthar)
	Wld_InsertNpc				(VLK_519_Buddler,"OC1"); //Hut 43, S�dturm-Tor
	Wld_InsertNpc				(VLK_521_Buddler,"OC1"); //Hut 45, Marktplatz
	Wld_InsertNpc				(VLK_522_Buddler,"OC1"); //Hut 55, Roaster Marktplatz
	Wld_InsertNpc				(VLK_523_Buddler,"OC1"); //Hut 57, MPlatz OBEN
	Wld_InsertNpc				(VLK_524_Dusty,"OC1");	 //Hut 58, MPlatz OBEN
	Wld_InsertNpc				(VLK_594_Bonie,"OC1");
	Wld_InsertNpc				(VLK_595_Clayde,"OC1");
	Wld_InsertNpc				(VLK_526_Buddler,"OC1"); //Hut 67, Bloodwyn-Platz
	Wld_InsertNpc				(VLK_527_Buddler,"OC1"); //Hut 77, GrahamPlatz
	Wld_InsertNpc				(VLK_528_Buddler,"OC1"); //Neben Sly, Hut 74
	Wld_InsertNpc				(VLK_529_Buddler,"OC1"); //Kyle-Platz, Hut 69
	Wld_InsertNpc				(VLK_530_Guy,"OC1");	 //Hut 17
	Wld_InsertNpc				(VLK_531_Buddler,"OC1"); //Hut 42, Neben S�dTurm-Ausgang
	Wld_InsertNpc				(VLK_532_Buddler,"OC1"); //Hut 39, Fox Platz
	Wld_InsertNpc				(VLK_533_Buddler,"OC1"); //Hut 61, Marktplatz oben (zu Bloodwyn)
	Wld_InsertNpc				(VLK_535_Buddler,"OC1"); //Kyle UNTEN, Hut 71
	Wld_InsertNpc				(VLK_536_Kyle,"OC1");	 //Hut 70. Kyle-Platz
	Wld_InsertNpc				(VLK_538_Huno,"OC1");	 //Hut 35
	Wld_InsertNpc				(VLK_553_Buddler,"OC1"); //Hut 51, Neben S�dTurm-Ausgang
	Wld_InsertNpc				(VLK_554_Buddler,"OC1"); //Kyle UNTEN, Hut 72
	Wld_InsertNpc				(VLK_555_Buddler,"OC1"); //Hut 29, Huno Platz
	Wld_InsertNpc				(VLK_556_Buddler,"OC1"); //Hut 78, oben neben S�dtor
	Wld_InsertNpc				(VLK_557_Buddler,"OC1"); //Hut 75, Graham Platz
	Wld_InsertNpc				(VLK_560_Buddler,"OC1"); //Hut 16, SnafPlatz
	Wld_InsertNpc				(VLK_561_Buddler,"OC1"); //Hut 33, Huno Platz
	Wld_InsertNpc				(VLK_564_Jesse,"OC1");	 //Hut ??, Bloodwyn-Platz
	Wld_InsertNpc				(VLK_565_Buddler,"OC1"); //Hut 52, oberer Platz am Markt
	Wld_InsertNpc				(VLK_572_Gravo,"OC1");	 //Hut 4, Waschplatz
	Wld_InsertNpc				(VLK_573_Graham,"OC1");  //Hut 76, Graham Platz
	Wld_InsertNpc				(VLK_574_Mud,"OC1");	 //Hut 13, Snaf Platz
	Wld_InsertNpc				(VLK_575_Buddler,"OC1"); //Bloodwyn-Platz, Hut 66
	Wld_InsertNpc				(VLK_576_Buddler,"OC1"); //Hunos Gehilfe, Hut 30
	Wld_InsertNpc				(VLK_577_Buddler,"OC1"); //Hut 11, MarusPlatz
	Wld_InsertNpc				(VLK_578_Buddler,"OC1"); //Kyle-Platz, Hut 68 (2 T�ren)
	Wld_InsertNpc				(VLK_580_Grim,"OC1");	 //Torplatz bei Diego, Hut2
	Wld_InsertNpc				(Vlk_581_Snaf,"OC1");	 //Hut 14,SnafPlatz
	Wld_InsertNpc				(VLK_3999_Tippler,"OC1"); //swiadek zab�jstwa Neka
	Wld_InsertNpc				(GRD_5099_Kwatermistrz,"OC1"); 
	Wld_InsertNpc				(VLK_40069_Fallon,"OC1"); 
	Wld_InsertNpc				(VLK_40068_Calum,"OC1");
	
	//--------------Siepacze-----------------------------
	Wld_InsertNpc				(GRD_2014_Siepacz,"OC1");
	Wld_InsertNpc				(GRD_2013_Siepacz,"OC1");
	//--------------Stara Kopalnia - ob�z----------------
	Wld_InsertNpc				(GRD_7001_Artegor,"OC1"); //wejscie do kopalni, na 4CH magnat
	Wld_InsertNpc				(GRD_7002_KUCHARZ,"OC1"); //kucharz obozowy
	Wld_InsertNpc				(VLK_7003_Abel,"OC1"); // robotnik, ucieka na 4CH
	Wld_InsertNpc				(GRD_7004_Gamal,"OC1"); //prowadzi nas do kopalni
	Wld_InsertNpc				(GRD_7005_Spike,"OC1"); //straznik
	Wld_InsertNpc				(GRD_7006_Joel,"OC1"); //straznik na pierwszej wiezy, lucznik
	Wld_InsertNpc				(GRD_7007_Mirzo,"OC1"); //straznik skrzy� z rud�
	Wld_InsertNpc				(GRD_7008_Tukash,"OC1"); //handlarz, ucieka na 4Ch do bandyt�w
	Wld_InsertNpc				(VLK_7009_kopacz,"OC1"); //ambient
	Wld_InsertNpc				(VLK_7010_kopacz,"OC1"); //ambient
	Wld_InsertNpc				(VLK_7011_kopacz,"OC1"); //ambient
	Wld_InsertNpc				(VLK_7012_kopacz,"OC1"); //ambient
	Wld_InsertNpc				(VLK_7013_kopacz,"OC1"); //ambient
	Wld_InsertNpc				(GRD_2017_Artch,"OC1"); //gl�wne wejscie
	Wld_InsertNpc				(NON_2056_Patrick,"OC1");
	Wld_InsertNpc				(NON_2022_Oczekujacy,"OC1");
	Wld_InsertNpc				(NON_2016_Oczekujacy,"OC1");
	Wld_InsertNpc				(BAN_1606_Josh,"OC1");
	Wld_InsertNpc				(NON_3077_Peratur,"OC1");//wykorzystanie starego skryptu, obecnie Stra�nik
	Wld_InsertNpc				(GRD_7015_PalissadeGuard,"OC1");//stra�nik na palisadzie 
	
	//---------------------------------1.6.1---------------------------------
	
	Wld_InsertNpc				(Shadowbeast,"WP_ADD_SHA1");
	Wld_InsertNpc				(Shadowbeast,"WP_ADD_SHA2");
	Wld_InsertNpc				(Shadowbeast,"WP_ADD_SHA3");
	Wld_InsertNpc				(Shadowbeast,"WP_ADD_SHA4");
	
	Wld_InsertNpc				(Bear,"WP_ADD_BEAR_01");
	
	
	Wld_InsertNpc				(Grd_40054_Fergus,"OC1");
	Wld_InsertNpc				(BAU_40140_Dillon,"OC1");
	Wld_InsertNpc				(STT_40143_Hargos,"OC1");
	
	
	Wld_InsertNpc				(BlackWolf,"PATH_AROUND_HILL01");
	Wld_InsertNpc				(DarkGolem,"WP_ER_NP_07");
	
	
	Wld_InsertNpc				(Razor,"WP_ER_NP_08");
	Wld_InsertNpc				(Razor,"WP_ER_NP_08");
	Wld_InsertNpc				(Razor,"WP_ER_NP_01");
	Wld_InsertNpc				(Razor,"WP_ER_NP_02");
	
	
	
	Wld_InsertNpc				(BlackTroll,"WP_ER_NP_09");
	//----------------Pokoje-------------------------------
	
	Wld_AssignRoomToGuild("EROMCAMP01",GIL_STT);
	Wld_AssignRoomToGuild("EROMCAMP01",GIL_VLK); 
	Wld_AssignRoomToGuild("EROMCAMP01",GIL_GRD); 
	
	Wld_AssignRoomToGuild("EROMCAMP02",GIL_STT);
	Wld_AssignRoomToGuild("EROMCAMP02",GIL_VLK); 
	Wld_AssignRoomToGuild("EROMCAMP02",GIL_GRD); 
	
	Wld_AssignRoomToGuild("EROMCAMP03",GIL_STT);
	Wld_AssignRoomToGuild("EROMCAMP03",GIL_VLK); 
	Wld_AssignRoomToGuild("EROMCAMP03",GIL_GRD); 
	
	Wld_AssignRoomToGuild("EROMCAMP04",GIL_STT);
	Wld_AssignRoomToGuild("EROMCAMP04",GIL_VLK); 
	Wld_AssignRoomToGuild("EROMCAMP04",GIL_GRD); 
	//--------------Erzbarone-------------------------
	Wld_InsertNpc				(Ebr_100_Gomez,"OC1");		//
	Wld_InsertNpc				(Ebr_101_Scar,"OC1");		
	Wld_InsertNpc				(Ebr_102_Arto,"OC1");
	Wld_InsertNpc				(Ebr_105_Raven,"OC1");		
	Wld_InsertNpc				(Ebr_106_Bartholo,"OC1");	
	Wld_InsertNpc				(Ebr_108_Velaya,"OC1"); 	//Gomez Zimmer 24h
	Wld_InsertNpc				(Ebr_109_Syra,"OC1");		
	Wld_InsertNpc				(Ebr_110_Seraphia,"OC1");	
	
	
	
	
	//er
	
	
	Wld_InsertNpc				(GRD_3935_Hector,"OC1");
	
	
	
	Wld_InsertNpc				(GRD_8800_Gardist,"OC1");		
	Wld_InsertNpc				(GRD_8801_Gardist,"OC1");	

	Wld_InsertNpc				(STT_3919_Polykacz,"OC1");		
	Wld_InsertNpc				(STT_3918_Polykacz,"OC1");	
	Wld_InsertNpc				(GRD_3916_Elitarny_straznik,"OC1");	
	Wld_InsertNpc				(GRD_3917_Elitarny_straznik,"OC1");	
	
	//-------------- wiezniowie -----------------------------
	//Wld_InsertNpc				(NON_3921_Wiezien,"OC1");	zbugowany
	Wld_InsertNpc				(NON_3922_Wiezien,"OC1");	
	Wld_InsertNpc				(NON_3923_Wiezien,"OC1");
	Wld_InsertNpc				(NON_3931_Dorian,"OC1");
	//------------Freie Betten-------------------------
	Wld_InsertNpc				(Tomdog,"WP_TOMDOG");	
	
	Wld_InsertNpc				(Alligator,"WP_ADD-51");
	Wld_InsertNpc				(Alligator,"WP_ADD_49");
	Wld_InsertNpc				(Alligator,"WP_ADD_68");
	
	
	
	Wld_InsertNpc				(Skeleton_Lord,"WP_UNDEADPALADIN_01");
	
	//OCC_MERCS_LEFT_ROOM_BED5
	//OCC_MERCS_LEFT_ROOM_BED6
	
	//kusznicy
	//Wld_InsertNpc				(GRD_2738_Kusznik,"OC1");		//nie ma obiektu o takiej instacji !!!! g1210
	/*Wld_InsertNpc				(GRD_2737_Kusznik,"OC1");	
	Wld_InsertNpc				(GRD_2736_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_2735_Kusznik,"OC1");	
	Wld_InsertNpc				(GRD_2734_Kusznik,"OC1");	
	Wld_InsertNpc				(GRD_2733_Kusznik,"OC1");	*/	
	Wld_InsertNpc				(GRD_3912_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3911_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3910_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3909_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3907_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3906_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3905_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3904_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3908_Kusznik,"OC1");
	Wld_InsertNpc				(GRD_3913_Kusznik,"OC1");
	
	//Wld_InsertNpc				(GRD_3903_Zwiadowca,"OC1");
	Wld_InsertNpc				(GRD_3902_Zwiadowca,"OC1");
	//---------------Garde-------------------------
	Wld_InsertNpc				(Grd_200_Thorus,"OC1");	 //OCC_BARONS_UPPER_RIGHT_ROOM_BED1
	Wld_InsertNpc				(Grd_201_Jackal,"OC1");	 //MarktplatzPatrouille , 24h
	Wld_InsertNpc				(Grd_203_Bullit,"OC1");  //24h sitzt in Gardistenhaus
	
	
	//Wld_InsertNpc               (VLK_40044_Inzynier, "OCC_MERCS_RIGHT_ROOM_BACK");
	
	Wld_InsertNpc				(Grd_204_Gardist,"OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED1
	Wld_InsertNpc				(Grd_205_Scorpio,"OC1"); //TRAINER, OCC_MERCS_UPPER_RIGHT_ROOM_BED4
	Wld_InsertNpc				(Grd_206_Gardist,"OC1"); //vorm Grd-Haus, OCC_MERCS_UPPER_RIGHT_ROOM_BED5
	Wld_InsertNpc				(Grd_208_Cutter,"OC1");	 //vorm Grd-Haus, OCC_MERCS_UPPER_RIGHT_ROOM_BED6
	Wld_InsertNpc				(Grd_209_Gardist,"OC1"); //OCC_MERCS_UPPER_LEFT_ROOM_BED1, Smalltalk vorne
	Wld_InsertNpc				(Grd_210_Scatty,"OC1");	 //Hut 19, Arena
	Wld_InsertNpc				(Grd_211_Skip,"OC1");    //H�ndler, Scheune, OCC_MERCS_UPPER_LEFT_ROOM_BED4
	Wld_InsertNpc				(Grd_212_Torwache,"OC1");//Burgtor			
	Wld_InsertNpc				(Grd_213_Torwache,"OC1");//Burgtor			
	Wld_InsertNpc				(Grd_214_Torwache,"OC1");//Nordtor			
	Wld_InsertNpc				(Grd_215_Torwache,"OC1");//Nordtor			
	Wld_InsertNpc				(Grd_216_Torwache,"OC1");//S�dtor			
	Wld_InsertNpc				(Grd_217_Torwache,"OC1");//S�dtor 			
	Wld_InsertNpc				(Grd_218_Gardist,"OC1"); //EBR-Haust�r, 24h
	Wld_InsertNpc				(Grd_219_Stone,"OC1");	 //Burg Schmied, OCC_MERCS_LEFT_ROOM_BED3
	Wld_InsertNpc				(Grd_220_Gardist,"OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED2
	Wld_InsertNpc				(Grd_221_Gardist,"OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED3
	Wld_InsertNpc				(Grd_222_Gardist,"OC1"); //Ebr oben
	Wld_InsertNpc				(Grd_223_Gardist,"OC1"); //Ebr oben
	Wld_InsertNpc				(Grd_225_Gardist,"OC1"); //BurgWehrgang L 
	Wld_InsertNpc				(Grd_226_Gardist,"OC1"); //OCC_MERCS_UPPER_LEFT_ROOM_BED2, Smalltalk vorne
	Wld_InsertNpc				(Grd_227_Gardist,"OC1"); //Smalltalk ganz hinten, OCC_MERCS_UPPER_LEFT_ROOM_BED5
	Wld_InsertNpc				(Grd_228_Gardist,"OC1"); //S�dtor DrehKreuz  
	Wld_InsertNpc				(Grd_229_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_230_Gardist,"OC1"); //Nordtor Drehkreuz 
	Wld_InsertNpc				(Grd_231_Gardist,"OC1"); //Smalltalk ganz hinten, OCC_MERCS_UPPER_LEFT_ROOM_BED7
	Wld_InsertNpc				(Grd_232_Gardist,"OC1"); //Torplatz, OCC_MERCS_LEFT_ROOM_BED1
	Wld_InsertNpc				(Grd_233_Bloodwyn,"OC1");//WaschplatzPatrouille
	Wld_InsertNpc				(GRD_239_Gardist,"OC1");	 //Kerker (Ex-Mort)
	Wld_InsertNpc				(Grd_240_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_241_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_242_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_243_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_244_Gardist,"OC1"); //Ballustradenwache 
	Wld_InsertNpc				(Grd_245_Gardist,"OC1"); //EBR-Haust�r, 24h
	Wld_InsertNpc				(GRD_251_Kirgo,"OC1");	 //Hut 21,Arena
	Wld_InsertNpc				(Grd_252_Gardist,"OC1"); //Torplatz, OCC_MERCS_LEFT_ROOM_BED2
	Wld_InsertNpc				(Grd_253_Gardist,"OC1"); //Torplatz, Wachhaus OCC_MERCS_TO_GANGWAY
	Wld_InsertNpc				(Grd_255_Fletcher,"OC1");//ArenaplatzPatrouille
	Wld_InsertNpc				(GRD_279_Gardist, "OC1"); //ItemWache im EBr-Haus
	Wld_InsertNpc				(GRD_280_Gardist,"OC1"); //Drehkreuz Burgtor
	
	Wld_InsertNpc				(GRD_4060_Trip,"OC1"); 
	Wld_InsertNpc				(KDF_400_Rodriguez,"OC1");
	Wld_InsertNpc				(KDF_401_Damarok,"OC1");
	Wld_InsertNpc				(KdF_402_Corristo,"OC1");
	Wld_InsertNpc				(KDF_403_Drago,"OC1");
	Wld_InsertNpc				(KdF_405_Torrez,"OC1");
	Wld_InsertNpc				(PC_Mage,"OC1");
	
	Wld_InsertNpc				(GRD_2036_Karczmarz,"OC1");
	Wld_InsertNpc				(GRD_3934_berg,"OC1");
	Wld_InsertNpc				(NON_2037_Samuel,"OC1");
	Wld_InsertNpc				(BAN_1612_Skaza,"OC1");
	
	
//	Wld_InsertNpc				(Grd_210_Scatty,"OC1"); lol? 2 razy?
	Wld_InsertNpc				(STT_2046_Flint,"OC1");
	// Konw�j
	Wld_InsertNpc				(GRD_5054_Gardist,"OC1");
	Wld_InsertNpc				(GRD_5053_Gardist,"OC1");
	Wld_InsertNpc				(GRD_5055_Eskorta,"OC1");
	Wld_InsertNpc				(VLK_5089_Tragaz,"OC1");
	Wld_InsertNpc				(VLK_5090_Tragaz,"OC1");
	Wld_InsertNpc				(VLK_5088_Tragaz,"OC1");
	
	Wld_InsertNpc				(GRD_3932_DungeonGuard,"OC1");	
	Wld_InsertNpc				(PC_Thief,"OC1");		  //Hut 1
	Wld_InsertNpc				(STT_5013_Lorenzo,"OC1");	 //OCR_HUT_2
	Wld_InsertNpc				(Stt_304_Schatten,"OC1"); //Hut 6, Torplatz
	Wld_InsertNpc				(Stt_306_Schatten,"OC1"); //Hut 27, Arenaplatz
	Wld_InsertNpc				(Stt_309_Whistler,"OC1"); //Hut 65, vor Marktplatz unten
	Wld_InsertNpc				(Stt_310_Schatten,"OC1"); //Hut 8
	Wld_InsertNpc				(Stt_311_Fisk,"OC1");	  //Hut 49 und 50, Marktplatz H�ndler
	Wld_InsertNpc				(BAN_1600_Miguel,"OC1");
	Wld_InsertNpc				(Stt_313_Schatten,"OC1"); //Hut 36
	Wld_InsertNpc				(Stt_314_Schatten,"OC1"); //Hut 38, Fox Platz
	Wld_InsertNpc				(Stt_315_Sly,"OC1");	  //hut 73
	Wld_InsertNpc				(Stt_316_Schatten,"OC1"); //hut 18, neben Guy (Arena)
	Wld_InsertNpc				(Stt_318_Schatten,"OC1"); //Hut 60 
	Wld_InsertNpc				(Stt_319_Schatten,"OC1"); //Hut 9, MarusPlatz
	Wld_InsertNpc				(Stt_322_Schatten,"OC1"); //Torplatz, Hut3, bei Diego
	Wld_InsertNpc				(Stt_324_Balam,"OC1");	  //Burg Koch
	Wld_InsertNpc				(Stt_325_Omid,"OC1");	  //Burg Koch
	Wld_InsertNpc				(Stt_328_Schatten,"OC1"); //Hut 22, Arenaplatz
	Wld_InsertNpc				(STT_329_Dexter,"OC1");	  //Marktplatz, Hut 47
	Wld_InsertNpc				(STT_330_Schatten,"OC1"); //Hut 44, S�dturm-Tor
	Wld_InsertNpc				(STT_331_Fingers,"OC1");  //Hut ??. bei Arena
	Wld_InsertNpc				(STT_2077_Jim,"OC1"); 
	Wld_InsertNpc				(STT_2078_KDF_NOV,"OC1"); 
	Wld_InsertNpc				(STT_2079_KDF_NOV,"OC1"); 
	Wld_InsertNpc				(STT_2080_KDF_NOV,"OC1"); 
	Wld_InsertNpc				(NOV_1330_BaalParvez,"OC1");
	Wld_InsertNpc				(NOV_1331_BaalTaran,"OC1");
	Wld_InsertNpc				(ORG_826_Mordrag,"OC1");
	Wld_InsertNpc				(Grd_265_Gardist,"OC1");//OC S�dtor (Ex-Fox)
	Wld_InsertNpc				(SLD_729_Kharim,"OC1");		//Hut 31, Arena
	Wld_InsertNpc				(TPL_1422_GorHanis,"OC1");	//Hut 32, Arena
	
	Wld_InsertNpc				(VLK_7050_Robol,"OC1");
	Wld_InsertNpc				(VLK_7051_Robol,"OC1");
	
	Wld_InsertNpc		(Meatbug,"FP_MEATBUG_SPAWN_1");
	Wld_InsertNpc		(Meatbug,"FP_MEATBUG_SPAWN_1");
	Wld_InsertNpc		(Meatbug,"FP_MEATBUG_SPAWN_1");
	
//------------------------------------------------------------------------1.6.1------------------------------------------------------------------------------
    	
	Wld_InsertNpc				(VLK_40057_Brennus,"OC1");	
	Wld_InsertNpc				(STT_40052_Perrick,"OC1");	
	Wld_InsertNpc				(Grd_40062_John,"OC1");	
	Wld_InsertNpc				(NON_40139_Glest,"OC1");
	Wld_InsertNpc				(VLK_40162_Buddler,"OC1");
};

FUNC VOID INIT_SUB_OLDCAMP ()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN OLDCAMP                  **
	**************************************************************/

	Wld_SetObjectRoutine (00,00,"OCR_ARENA_MAINGATE_TRIGGER",1);
	Wld_SetObjectRoutine (20,00,"OCR_ARENA_MAINGATE_TRIGGER",1);
	Wld_SetObjectRoutine (08,00,"OCR_ARENA_MAINGATE_TRIGGER",0);
	
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	//------------------------------------------
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_04",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_05",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_06",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_07",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_08",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_09",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_04",0);
	
	
	
	/**************************************************************
	**        PORTALRAUMZUWEISUNG IN OLDCAMP-AUSSENRING          **
	**   CS: Bei den Buddlerh�tten Kleinbuchstaben lassen,       **
	**                  sonst gehts nicht                        **
	**************************************************************/

	Wld_AssignRoomToGuild("KI1",GIL_GRD); 	// Portalraum KDF
	Wld_AssignRoomToGuild("HH8",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH5",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH4",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH7",GIL_GRD);	// Portalraum EBR-Bedroom
	
	Wld_AssignRoomToGuild("ocgateb",GIL_GRD);	//Wachraum am Haupteingang
	// Wld_AssignRoomToGuild("h�tte1",GIL_VLK); //Diegos H�tte
	//Wld_AssignRoomToGuild("h�tte2",GIL_VLK); ?? Lorenzo
	Wld_AssignRoomToGuild("h�tte3",GIL_VLK); 
	Wld_AssignRoomToGuild("h�tte4",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte5",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte6",GIL_VLK); 
	Wld_AssignRoomToGuild("h�tte7",GIL_VLK); 
	Wld_AssignRoomToGuild("h�tte8",GIL_VLK); 
	Wld_AssignRoomToGuild("h�tte9",GIL_VLK); 
	Wld_AssignRoomToGuild("h�tte10",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte11",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte12",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte13",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte14",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte15",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte16",GIL_VLK);
	//Wld_AssignRoomToGuild("h�tte17",GIL_VLK); Durchgangsh�tte, wird nicht auf jedes Betreten �berwacht
	Wld_AssignRoomToGuild("h�tte18",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte19",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte20",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte21",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte22",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte23",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte24",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte25",GIL_VLK);
	//Wld_AssignRoomToGuild("h�tte26",GIL_VLK); //PLAYER H�tte
	Wld_AssignRoomToGuild("h�tte27",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte28",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte29",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte30",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte31",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte32",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte33",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte34",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte35",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte36",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte37",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte38",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte39",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte40",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte41",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte42",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte43",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte44",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte45",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte46",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte47",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte48",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte49",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte50",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte51",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte52",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte53",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte54",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte55",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte56",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte57",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte58",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte59",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte60",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte61",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte62",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte63",GIL_VLK);
	//Wld_AssignRoomToGuild("h�tte64",GIL_VLK); Durchgangsh�tte, wird nicht auf jedes Betreten �berwacht
	Wld_AssignRoomToGuild("h�tte65",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte66",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte67",GIL_VLK);
	//Wld_AssignRoomToGuild("h�tte68",GIL_VLK); Durchgangsh�tte, wird nicht auf jedes Betreten �berwacht
	Wld_AssignRoomToGuild("h�tte69",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte70",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte71",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte72",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte73",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte74",GIL_VLK);
	Wld_AssignRoomToGuild("h�tte75",GIL_VLK);
//	Wld_AssignRoomToGuild("h�tte76",GIL_VLK);	Grahams H�tte, abgesprochen mit Mike
	Wld_AssignRoomToGuild("h�tte77",GIL_VLK);

};

func VOID STARTUP_SUB_DEMONTOWER ()
{
	//**************************************************************************************
	//*                               D�monenbeschw�rer                                    *
	//**************************************************************************************
	
	Wld_InsertNpc				(KdF_404_Xardas,"LOCATION_03_IN");
};

func VOID INIT_SUB_DEMONTOWER ()
{
};


//**************************************************************************************
//*								FreemineCamp										   *
//**************************************************************************************																		


FUNC VOID STARTUP_SUB_FREEMINECAMP ()
{
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);

	//skeletons - cmentarz
	Wld_InsertNpc		(SkeletonSH,"CMT1");
	Wld_InsertNpc		(SkeletonSH,"CMT2");
	Wld_InsertNpc		(SkeletonSH,"CMT3");
	Wld_InsertNpc		(SkeletonSH,"CMT4");
	Wld_InsertNpc		(SkeletonSH,"CMT5");
	//----------------------Soeldner-------------------------------
	Wld_InsertNpc				( SLD_750_Soeldner,                          "FMC_ENTRANCE" );//FMC-Palisadenwache
	Wld_InsertNpc				( SLD_751_Soeldner,                          "FMC_ENTRANCE" );//FMC-Guard (am Eingang)	
	Wld_InsertNpc				( SLD_752_Okyl,                              "FMC_ENTRANCE" );//FMC-PalisadenWache
	Wld_InsertNpc				( SLD_753_Baloro,                            "FMC_ENTRANCE" );//FMC-PalisadenWache
	Wld_InsertNpc               ( ORG_40045_Grabarz,                            "WP_GRABARZ");
    Wld_InsertNpc               ( SFB_40011_Casper,                            "FMC_ENTRANCE");
	Wld_InsertNpc               ( SFB_40063_Ziggy,                            "FMC_ENTRANCE");
	
	//----------------------ER:Murderer Snake----------------------
	Wld_InsertNpc				( NON_7852_Snake, "FMC_ENTRANCE" );
	
	Wld_InsertNpc				( SLD_755_Soeldner, "FMC_ENTRANCE" );//FMC-GuardPalisade
	Wld_InsertNpc				( SLD_756_Soeldner, "FMC_ENTRANCE" );//FMC-Guard
	Wld_InsertNpc				( SLD_757_Soeldner, "FMC_ENTRANCE" );//FMC-GuardPalisade
	Wld_InsertNpc				( SLD_758_Soeldner, "FMC_ENTRANCE" );//FMC-GuardPalisade
	Wld_InsertNpc				( SLD_759_Soeldner, "FMC_ENTRANCE" );//FMC-Guard(T�r zum Drehradhaus)		
	
	Wld_InsertNpc				( SLD_760_Soeldner, "FMC_ENTRANCE" );//FMC-Guard(T�r zum Drehradhaus)		
	Wld_InsertNpc				( SLD_761_Soeldner, "FMC_ENTRANCE" );//FMC-Guard(Mineneingang)			
	Wld_InsertNpc				( SLD_762_Soeldner, "FMC_ENTRANCE" );//FMC-Guard(Mineneingang				
	Wld_InsertNpc				( SLD_763_Soeldner, "FMC_ENTRANCE" );//FMC-Guard
	Wld_InsertNpc				( SLD_764_Soeldner, "FMC_ENTRANCE" );//FMC-Guard
	
	Wld_InsertNpc				( SLD_765_Soeldner, "FMC_ENTRANCE" );//FMC-Guard
	
	//-----------------------Schuerfer-------------------------------
	Wld_InsertNpc				( SFB_1030_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	Wld_InsertNpc				( SFB_1031_Schuerfer, "FMC_ENTRANCE" );//FMC-PickOre
	Wld_InsertNpc				( SFB_1032_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	Wld_InsertNpc				( SFB_1033_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	Wld_InsertNpc				( SFB_1034_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	
	Wld_InsertNpc				( SFB_1035_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	Wld_InsertNpc				( SFB_1036_Schuerfer, "FMC_ENTRANCE" );//FMC-Pickore
	Wld_InsertNpc				( SFB_1037_Swiney,	  "FMC_ENTRANCE" );//				OBER_SCH�RFER
	Wld_InsertNpc				( SFB_1038_Schuerfer, "FMC_ENTRANCE" );//FMC-PickOre
	Wld_InsertNpc				( SFB_1039_Schuerfer, "FMC_ENTRANCE" );//FMC-PickOre
	
	Wld_InsertNpc				( SFB_1040_Schuerfer, "FMC_ENTRANCE" );//FMC-SitAround
	Wld_InsertNpc				( SFB_1041_Schuerfer, "FMC_ENTRANCE" );//FMC-SitAround
	Wld_InsertNpc				( SFB_1042_Schuerfer, "FMC_ENTRANCE" );//FMC-StandAround
	Wld_InsertNpc				( SFB_1043_Schuerfer, "FMC_ENTRANCE" );//FMC-StandAround
	Wld_InsertNpc				( SFB_1044_Schuerfer, "FMC_ENTRANCE" );//StandAround
	
	
	
	//--------------------------Organisatoren--------------------------
	
	Wld_InsertNpc				( ORG_890_Organisator, "FMC_ENTRANCE" );//FMC-SitAround
	Wld_InsertNpc				( ORG_891_Organisator, "FMC_ENTRANCE" );//FMC-SitAround
	Wld_InsertNpc				( ORG_892_Organisator, "FMC_ENTRANCE" );//FMC-StandAround
	
	//--------------------------Mysliwi-najemnicy--------------------------
	Wld_InsertNpc				( SLD_2801_Soldier , "FMC_ENTRANCE" );
	Wld_InsertNpc				( SLD_2803_Outlam , "FMC_ENTRANCE" );
	Wld_InsertNpc				( SLD_2802_Soldier , "FMC_ENTRANCE" );
	Wld_InsertNpc				( SLD_2806_Cyrus , "FMC_ENTRANCE" );
	Wld_InsertNpc				(SLD_2805_Najemnik , "FMC_ENTRANCE" );
	Wld_InsertNpc				(SLD_3915_Gestath, "FMC_ENTRANCE" );
	Wld_InsertNpc				(SLD_40047_Stuart, "FMC_ENTRANCE" );
	Wld_InsertNpc				(ORG_40138_Gavilan, "FMC_ENTRANCE" );
};

FUNC VOID INIT_SUB_FREEMINECAMP ()
{
	Wld_AssignRoomToGuild("FMC01",GIL_SFB);     
	Wld_AssignRoomToGuild("FMC03",GIL_SFB); 
	Wld_AssignRoomToGuild("FMC04",GIL_SFB);
	Wld_AssignRoomToGuild("FMC05",GIL_SFB);
	Wld_AssignRoomToGuild("FMC06",GIL_SFB); 
	Wld_AssignRoomToGuild("FMC07",GIL_SFB);
	Wld_AssignRoomToGuild("FMC08",GIL_SFB);
	Wld_AssignRoomToGuild("FMC09",GIL_SFB);
	Wld_AssignRoomToGuild("FMC10",GIL_SFB);
	Wld_AssignRoomToGuild("FMC11",GIL_SFB);
	Wld_AssignRoomToGuild("FMC12",GIL_SFB);
	Wld_AssignRoomToGuild("FMC13",GIL_SFB);
	Wld_AssignRoomToGuild("FMC14",GIL_SFB);
	Wld_AssignRoomToGuild("FMC15",GIL_SFB);
};

//*******************************************************************************
//*								Surface											*
//*******************************************************************************
FUNC VOID STARTUP_SUB_SURFACE ()
{
	Wld_InsertNpc				(Outlander,"WP_INTRO_WI16");
	Wld_InsertNpc				(Radex,"WP_INTRO_WI16");
	
	//nowe potwory ER 1.4.5
	Wld_InsertNpc				(DarkGolem,"OW_PATH_07_06");
	Wld_InsertNpc				(youngtroll,"ER_YOUNGTROLL1");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(Scavenger,"ER_SCA_SPAWN_55");
	Wld_InsertNpc				(BlackWolf,"ER_wOLF_SINGLE1");
	
	//BOSSOWIE
	Wld_InsertNpc				(BigSnapper,"LOCATION_28_01");
	//Wld_InsertNpc				(MadHarpie,"LOCATION_19_03_PATH_RUIN7");
	
	Wld_SetObjectRoutine (20,00,"EVT_OW_STARTLOCKOUT_MOVER",1);
	Wld_SetObjectRoutine (10,00,"EVT_OW_STARTLOCKOUT_MOVER",0);
	
	Wld_InsertNpc				(GRD_254_Orry,"OC1");
	Wld_InsertNpc				(GRD_281_Gardist,"OC1");//Orry-Wache
	Wld_InsertNpc				(SkeletonSH,"LOCATION_16_IN");
   
	//--------Br�ckenwachen vorm OC--------------------------------------
	Wld_InsertNpc				(GRD_275_Brueckenwache,"OC1");
	Wld_InsertNpc				(GRD_276_Brueckenwache,"OC1");

	//----------Bandyci z zelazem------------------------------------------
	Wld_InsertNpc				(NON_5051_Raeuber,"OC1");
	Wld_InsertNpc				(NON_5050_Raeuber,"OC1");
	Wld_InsertNpc				(NON_5052_Raeuber,"OC1");
	
	//----------Szantazysci------------------------------------------
	Wld_InsertNpc				(ORG_888_Erpresser,"OC1");
	Wld_InsertNpc				(ORG_889_CoErpresser,"OC1");
	//--------Zugangswachen zum Orkgebiet--------------------------------------
	Wld_InsertNpc				(GRD_224_Pacho,"OC1");
	Wld_InsertNpc				(GRD_237_Gardist,"OC1");
	Wld_InsertNpc				(GRD_238_Gardist,"OC1");

	//--------J�ger zum Austauschplatz------------------------------------------
	Wld_InsertNpc				(ORG_818_Ratford,"OC1");
	Wld_InsertNpc				(BAN_1614_Drax,"OC1");
	//----------J�ger auf Weg zu NC---------------------------------------------
	Wld_InsertNpc				(STT_336_Cavalorn,"OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc				(NON_3071_Vart,"OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc				(NON_7851_Nordmarczyk,"OW_SAWHUT_GREENGOBBO_SPAWN");
	// ob�z Moroka
	Wld_InsertNpc				(GRD_7894_Morok,"MOROK");
	Wld_InsertNpc				(GRD_7895_Patter,"MOROK");
	Wld_InsertNpc				(GRD_7896_Gardist,"MOROK");
	Wld_InsertNpc				(GRD_7897_Gardist,"MOROK");
	Wld_InsertNpc				(GRD_7898_Gardist,"MOROK");
	//-----------Ob�z mysliwych ---------------------------------------------------
	Wld_InsertNpc				(NON_5602_Stanley,"MOVEMENT_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(NON_5601_Firn,"MOVEMENT_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(NON_5600_Alex,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5675_Magnus,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5603_Claw,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5610_Hunter,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5606_Hunter,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5605_Hunter,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5611_Jonas ,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5612_Mil ,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5613_Olivier ,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_5614_Josep ,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	Wld_InsertNpc				(NON_40034_Arnold ,"MOVEMENT_TALL_PATH_BANDITOS2"); 
	//-----------Plac wymianian --------------------------------------------------- //edit by Nocturn
	Wld_InsertNpc				(GRD_2005_Stra�nik,"OC1");
	Wld_InsertNpc				(VLK_2004_Robotnik,"OC1");
	Wld_InsertNpc				(GRD_2003_Stra�nik,"OC1"); // ten co cwiczy bron 1h 
	Wld_InsertNpc				(NON_3900_Gerard,"SKAZANIEC_CAMP");

	//----------1.6.1-----------------------------------------------------------------
	//{
	Wld_InsertNpc				(NON_40083_Bandyta,"WP_BANDYTA_WIEZA_ER1");
	Wld_InsertNpc				(NON_40084_Bandyta,"WP_BANDYTA_WIEZA_ER2");
	Wld_InsertNpc				(NON_40085_Bandyta,"WP_BANDYTA_WIEZA_ER3");
	Wld_InsertNpc				(NON_40085_Bandyta,"WP_BANDYTA_WIEZA_ER4");
	Wld_InsertNpc				(GRD_40093_Gardist,"OC1");
	Wld_InsertNpc				(Grd_40107_Norton,"OC1");

	
	Wld_InsertNpc				(Snapper_ER,"WP_ADD_SNA_16");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_17");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_18");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_19");
	
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_01");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_02");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_03");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_04");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_05");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_06");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_07");
	Wld_InsertNpc				(Giant_Bug,"WP_ADD_GB_08");
	
	
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_01");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_02");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_03");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_04");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_13");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_14");
	Wld_InsertNpc				(Warg,"WP_ADD_WARG_15");
	
	
	//}
	//-----------Opuszczona kopalnia-------------------------------------------
	Wld_InsertNpc				(GRD_2001_Stra�nik,"OC1");
    Wld_InsertNpc				(GRD_2002_Stra�nik,"OC1");
	//-----------Lowcy ork�w -------------------------------------------
	Wld_InsertNpc				(NON_2702_SZEFU,"OC1");
	Wld_InsertNpc				(NON_2703_MYSLIWY ,"OC1");
	Wld_InsertNpc				(NON_2701_Straznik ,"OC1"); 
	Wld_InsertNpc				(NON_2706_osko ,"OC1"); 
	Wld_InsertNpc				(NON_2705_Rakus ,"OC1"); 
	Wld_InsertNpc				(NON_3930_Hugo ,"OC1"); 
	Wld_InsertNpc				(NON_3929_Davor,"OC1");
	Wld_InsertNpc				(NON_3933_Uturiel,"OC1");
	Wld_InsertNpc				(NON_40009_Kastagir,"OC1");
	Wld_InsertNpc				(NON_40154_Torbeld,"OC1");
	//------------Toter Gardist---------------------------------------------
	Wld_InsertNpc				(GRD_3085_Nek,"OC1");// zywy nek
	Wld_InsertNpc				(GRD_282_Nek,"OC1");// martwy straznik
	//Wld_InsertNpc				(GRD_286_Gardist,"SZUKAJCIE_TERAZ_KURWY"); ***FIX***
	//B_KillNPC (GRD_286_Gardist);
	var C_NPC nek; nek = Hlp_GetNpc(GRD_282_Nek);
	Npc_ChangeAttribute	(nek, ATR_HITPOINTS, -nek.attribute[ATR_HITPOINTS_MAX]);

	//-----------Trupy wok� Starego Obozu-----------------------------
	Wld_InsertNpc				(WD_7040_Trup,"ER_WD_TRUP_01");
	Wld_InsertNpc				(WD_7041_Trup,"ER_WD_TRUP_02");
	Wld_InsertNpc				(WD_7042_Topielec,"ER_WD_TOPIELEC_01");
	Wld_InsertNpc				(WD_7043_Topielec,"ER_WD_TOPIELEC_02");
	Wld_InsertNpc				(WD_7044_Bandit,"ER_WD_BANDIT_01");
	//var C_NPC wd_7044;	wd_7044 = Hlp_GetNpc(WD_7044_Bandit); 
	//Npc_SetTempAttitude	(wd_7044,ATT_HOSTILE); 
	//Npc_SetAttitude			(wd_7044,ATT_HOSTILE);
	Wld_InsertNpc				(WD_7045_DeadHunter,"SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc				(WD_7046_GhostKinggardist,"ER_WD_GHOST_01");
	//SetGhost(WD_7049_BanditGhost, 60);
	
	
	//-----------Buddler vorm OC---------------------------------------------
	Wld_InsertNpc				(Vlk_520_Buddler,"OC_ROUND_22");
	Wld_InsertNpc				(Vlk_534_Buddler,"OC_ROUND_22");

	//---------geheimes Drogenlabor-------------------------------
	Wld_InsertNpc				(ORG_860_Renyu,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_861_Killian,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_862_Jacko,"LOCATION_11_08");

	//--------------NC-J�ger---------------------------------------
	Wld_InsertNpc				(ORG_859_Aidan,"OW_PATH_02");
	
	
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_01");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_01");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_02");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_02");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_03");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_04");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_04");
	Wld_InsertNpc				(Giant_Rat,"WP_GIANTRAT_04");
	Wld_InsertNpc				(Giant_Rat,"BOFUR");
	Wld_InsertNpc				(Giant_Rat,"BOFUR");
	
	
	Wld_InsertNpc				(Alligator,"OW_PATH_158");
	Wld_InsertNpc				(Alligator,"OW_PATH_158");
	Wld_InsertNpc				(Alligator,"NC_PACZ1");
	Wld_InsertNpc				(Alligator,"WODOSPAD");
	Wld_InsertNpc				(Alligator,"NC_WATERFALL_BOTTOM");
	
	Wld_InsertNpc				(Giant_Bug,"PATH_OC_NC_9");
	Wld_InsertNpc				(Giant_Bug,"PATH_OC_NC_7");
	

	//////////////////////////////////////////////////////////////////
	// OB�Z BANDYT�W
	// STARTUP ER 1.50
	//////////////////////////////////////////////////////////////////
	
	//------------Banditenlager-----------------------------------
	
	
	Wld_InsertNpc				(ORG_863_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_864_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_865_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1613_Doyle,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_868_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_869_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1611_Pun,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_871_Raeuber,"LOCATION_11_08");
	Wld_InsertNpc				(ORG_874_Raeuber,"LOCATION_11_08");
	
	//---------------Pokoje----------------------------------------
	Wld_AssignRoomToGuild	("ERBANDIT01",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT02",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT03",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT04",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT05",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT06",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT07",GIL_BAU); 
	Wld_AssignRoomToGuild	("ERBANDIT08",GIL_BAU); 
	
	//Wld_InsertNpc				(tarcza_strzelecka_01,"TARCZA1");
	//Wld_InsertNpc				(tarcza_strzelecka_02,"TARCZA2");
	//---------------Nowi----------------------------------------
	Wld_InsertNpc				(BAN_1601_Briam,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1602_Emanuel,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1603_Martin,"LOCATION_11_08");	 
	Wld_InsertNpc				(BAN_1604_Jens,"LOCATION_11_08");	
	Wld_InsertNpc				(BAN_1605_Rocky,"LOCATION_11_08");	
	Wld_InsertNpc				(BAN_1608_Kereth,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1607_Chris,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_1609_Smith,"LOCATION_11_08"); 
	Wld_InsertNpc				(BAN_1610_Quentin,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_40028_Connor,"LOCATION_11_08");
	Wld_InsertNpc				(BAN_40067_Victor,"LOCATION_11_08");
	//-------------Einsiedler--------------------------------------
	Wld_InsertNpc				(Non_1500_Gilbert,"LOCATION_01_07");	//SN: hat eh keinen Dialog
	Wld_InsertNpc				(NON_7508_Angela,"BURDEL");	//1.24
	//------------Jaskinia----------------------------------
	Wld_InsertNpc				(GreenGobboSword,"WP_CAVEBQ_01");
	Wld_InsertNpc				(BlackGobboMace,"WP_CAVEBQ_01");
	Wld_InsertNpc				(BlackGobboMace,"WP_CAVEBQ_01");
	Wld_InsertNpc				(BlackGobboMace,"WP_CAVEBQ_01");
	//-------------vor alter Mine--------------------------------------
	//Wld_InsertNpc				(Grd_250_Gardist,"OW_OM_ENTRANCE02_WHEEL_USE");
	//Wld_SetObjectRoutine		(0,00,"EVT_AM_LOB_GATE_BIG",1);
	
	
	// --------ITEMS in den vergessenen H�hlen/Locations -----------------
	Wld_InsertItem			(ItArScrollIcecube,"FP_SLEEP_OW_SNAPPER_HERD1_02"); // Snapperh�hle richtung Orkarena
	Wld_InsertItem			(ItFo_Potion_Health_02,"FP_SLEEP_OW_SNAPPER_HERD1_02");
	
	Wld_InsertItem			(ItFo_Potion_Mana_02,"FP_ROAM_OW_SNAPPER_WOOD05_02");// Snapper H�hle im Wald
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02,"FP_SLEEP_OW_MOLERAT_CAVE4");// N�he bei Cavalorn
	
	
	
	
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02,"LOCATION_23_CAVE_1_02");// DRUGMONOPOL
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_03,"OW_PATH_07_15_CAVE3"); // BLOODHOUNDLOCATIOn N�HE NC
	Wld_InsertItem			(Ring_des_Lebens,"FP_ROAM_OW_BLOODHOUND_CANYONCAVE3");
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02,"FP_ROAM_OW_LURKER_BEACH_01");//LURKERLOCATION RICHTUNG ORKS
	Wld_InsertItem			(ItFo_POTION_HEALTH_03,"FP_ROAM_OW_LURKER_BEACH_04");
	
	//biale wilki
	Wld_InsertNpc		(WhiteWolf,"WHITEWOLF1");
	Wld_InsertNpc		(WhiteWolf,"WHITEWOLF2");
	Wld_InsertNpc		(WhiteWolf,"WHITEWOLF3");
	Wld_InsertNpc		(WhiteWolf,"WHITEWOLF4");
	
	
	
	Wld_InsertNpc		(Alligator,"ALIGATOR_DEADTOWER_01");
	Wld_InsertNpc		(Alligator,"ALIGATOR_DEADTOWER_02");
	Wld_InsertNpc		(Alligator,"MT09");
	Wld_InsertNpc		(Alligator,"MT08");
	
	Wld_InsertNpc		(BlackTroll,"OW_PATH_134");
	
	
	//aligatory Xardas tower
	/*
	Wld_InsertNpc		(Alligator,"ALIGATOR_XARDASTOWER_01");
	Wld_InsertNpc		(Alligator,"ALIGATOR_XARDASTOWER_02");
	Wld_InsertNpc		(Alligator,"ALIGATOR_XARDASTOWER_01");
	Wld_InsertNpc		(Alligator,"ALIGATOR_XARDASTOWER_02");
	//zakatek przy plazy
	Wld_InsertNpc		(Alligator,"OW_ABYSS_ENTRANCE");
	Wld_InsertNpc		(Alligator,"OW_ABYSS_ENTRANCE");
	//zatopiona wieza
	
	//bagna
	Wld_InsertNpc		(Alligator,"ALIGATOR_SWAMP_01");
	Wld_InsertNpc		(Alligator,"ALIGATOR_SWAMP_02");
	Wld_InsertNpc		(Alligator,"ALIGATOR_SWAMP_03"); */
	//----------------------- MH: Monster werden neu verteilt ----------------------
	//Wld_InsertNpc		(Bloodhound, "OW_PATH_012");
	//Wld_InsertNpc		(Bloodhound, "PATH_CASTLE_TO_WATERFALL");

	Wld_InsertNpc		(Molerat,"OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc		(Molerat,"OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc		(GreenGobboSword,"PATH_OC_NC_6");
	Wld_InsertNpc		(GreenGobboSword,"PATH_OC_NC_4");
	Wld_InsertNpc		(Meatbug,"OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc		(Meatbug,"OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc		(Wolf,"OW_PATH_02_SPAWN_HOGEWOLF");
	Wld_InsertNpc		(GreenGobboSword,"OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc		(GreenGobboSword,"OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc		(Molerat,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Molerat,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Molerat,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(WARAN,"OW_WARAN_G_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc		(Bloodfly,"OW_BLOODFLY_NEW_COAST_SPAWN");

	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc		(Molerat,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Wolf,"OW_WOODRUIN_FOR_WOLF_SPAWN");
	Wld_InsertNpc		(Snapper,"OW_CAVE2_SNAPPER_SPAWN");
	Wld_InsertNpc		(Snapper,"OW_CAVE2_SNAPPER_SPAWN");
	Wld_InsertNpc		(Snapper,"OW_CAVE2_SNAPPER_SPAWN");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_SCAVENGER_SPAWN_TREE");
	//--------------------------------------------------------
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCA_05_01");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCA_05_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_C3");


	//Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_12");
//	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_12"); **fix 1.24 mysliwi **

	Wld_InsertNpc		(Molerat,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc		(Wolf,"PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc		(Wolf,"PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc		(Wolf,"PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_OC_PSI");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc		(Wolf,"FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc		(Wolf,"FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc		(Wolf,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(Wolf,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(Wolf,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(Wolf,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Lurker,"OW_LAKE_NC_LURKER_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc		(Waran,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc		(Waran,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Scavenger,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc		(Scavenger,"SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc		(Scavenger,"SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc		(Scavenger,"SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc		(Scavenger,"SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGERPATH_OC_PSI_14");

	Wld_InsertNpc		(OrcDog,"OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc		(OrcDog,"OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc		(OrcDog,"OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc		(OrcDog,"OW_PATH_WOLF04_SPAWN01");
	
	//----------------------Mission Bloodflies im Sumpf----------------------
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc		(Bloodfly,"PATH_TAKE_BLOODFLY_SPAWN");
		
	//----------------------------------SHIPWRECK----------------------------------//
	Wld_InsertNpc		(Firewaran,"OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc		(Firewaran,"OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc		(Firewaran,"OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc		(Firewaran,"OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc		(Firewaran,"OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc		(Firewaran,"SPAWN_FIREWARAN_BEACH");
	Wld_InsertNpc		(Firewaran,"SPAWN_FIREWARAN_BEACH");
	//-------------------------------------------------------------------------------//
	
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_06_01");
	//--------Rausgenommen--------HORST-----FINGER WEG-----------//

	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc		(Molerat,"PATH_WALD_OC_MOLERATSPAWN");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_WOODOLDMINE2");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SNAPPER_WOOD05_05");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SNAPPER_WOOD05_05");
	
	Wld_InsertNpc		(Razor,"SPAWN_OW_SNAPPER_CAVE_DM");
	Wld_InsertNpc		(Razor,"SPAWN_OW_SNAPPER_CAVE_DM");
	Wld_InsertNpc		(Razor,"SPAWN_OW_SNAPPER_CAVE_DM");
	
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_INWALD_OC2");
	
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OCWOODEND2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT");
	Wld_InsertNpc		(GreenGobboSword,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc		(GreenGobboSword,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc		(GreenGobboSword,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc		(Molerat,"FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc		(Molerat,"FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_NEARSHADOW_PSIWOOD_01");
	//Wld_InsertNpc       (Shadowbeast,"SPAWN_OW_SHADOWBEAST1_PSIWOOD_02");		//wird erst sp�ter in B_Story_LeftFM() gespawnt (Ulu-Mulu-Jagd)
	Wld_InsertNpc       (Shadowbeast,"SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");
	//Wld_InsertNpc       (Shadowbeast,"OW_PATH_033_TO_CAVE5");					//wird erst sp�ter in B_Story_LeftFM() gespawnt (Ulu-Mulu-Jagd)
	Wld_InsertNpc       (Shadowbeast,"SPAWN_OW_SHADOWBEAST_10_03");
	Wld_InsertNpc		(Razor,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc		(Razor,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc		(Razor,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc		(Razor,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc		(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc		(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc		(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_LONE_WALD_OC3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_ENTRANCE_SCAVENGER_OC1_02");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERATT_04_PSI1");

	////////////////////////////////////////////////////////////////////////////
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");

	//######################################################################
	//	Gobboh�hle
	//######################################################################
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");

	// hinter der Br�cke
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_GOBBO_LOCATION_29_03");

	// in den H�hlen //er.1.4 edited gothic1210
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(Gobbo_Warrior,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(BlackGobboMace,"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE5");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE5");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE7");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE7");
	Wld_InsertNpc		(Gobbo_Warrior,"GOBBO_MASTERCAVE8"); //boss er 1.4.5
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE8");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE8");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE8");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE9");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE9");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE9");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE10");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE10");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE10");
	Wld_InsertNpc		(BlackGobboMace,"GOBBO_MASTERCAVE10");
	////////////////////////////////////////////////////////////////////////////


	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_04_02_1");

	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_BANDIT_02");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_OC_PSI3");
	Wld_InsertNpc		(Waran,"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc		(Waran,"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc		(Waran,"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE_02_05");
	
	Wld_InsertNpc		(Snapper,"SPAWN_OW_WARAN_01_BADITS6"); // WEG ZUR TROLLSCHLUCHT,DA M�SSEN ST�RKERE MONSTER HIN
	Wld_InsertNpc		(Snapper,"SPAWN_OW_WARAN_01_BADITS6");
	
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_BEACH_02");
	
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_01_BADITS7");// WEG ZUR TROLLSCHLUCHT,DA M�SSEN ST�RKERE MONSTER HIN
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_01_BADITS7");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_01_BADITS2");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_01_BADITS2");
	
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_SCAVENGEROW_PATH_280");
	
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLYPATH_OC_PSI_14");
	Wld_InsertNpc		(Bloodfly,"SPAWN_BLOODFLYPATH_OC_PSI_14");

	
    Wld_InsertNpc		(SkeletonBranTowerR,"WP_ER_SKEL_02");
	Wld_InsertNpc		(SkeletonBranTower,"WP_ER_SKEL_01");
	Wld_InsertNpc		(SkeletonBranTower,"SWP_ER_SKEL_03");
	
	Wld_InsertNpc		(Snapper,"OW_PATH_174");
	////////////////////////////////////////////////////////////////////////////
	//-----------------------Spielstart---------------------------------------//
	////////////////////////////////////////////////////////////////////////////

	Wld_InsertNpc       (Meatbug,"SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc       (Meatbug,"SPAWN_OW_MEATBUG_01_01");

	// hinter der Br�cke gegen�ber der verlassenen Mine
	Wld_InsertNpc		(YMolerat,"SPAWN_MOLERAT02_SPAWN01");	

	// Plateau �ber der verlassenen Mine
	Wld_InsertNpc		(YScavenger,"SPAWN_SCAVENGER_TOTU_LEFT_PLAT");
	Wld_InsertNpc		(YScavenger,"SPAWN_SCAVENGER2_TOTU_LEFT_PLAT2");

	Wld_InsertNpc		(YMolerat,"SPAWN_MOLELRAT_TOTU_LEFT_PLAT4");
	Wld_InsertNpc		(YMolerat,"SPAWN_MOLELRAT_TOTU_LEFT_PLAT4");
	Wld_InsertNpc		(YGobbo,"SPAWN_OW_GOBBO_01_01");
		 Wld_InsertNpc				(YGobbo,"THORUS_NK");
	// G�ry _mod
	Wld_InsertNpc		(YGobbo,"SPAWN_OW_MOD_STARTMOLERAT_01"); 
	Wld_InsertNpc		(YGobbo,"SPAWN_OW_MOD_STARTMOLERAT_01"); 
	
	// Skrzynia _mod
	Wld_InsertNpc		(YGobbo,"SPAWN_OW_MOD_STARTGOBBO_CHEST1"); 
	
	// Rzeka _mod
	Wld_InsertNpc		(YMolerat,"FP_ROAM_SZUKAJCIE_TERAZ_KURWY_1");
	Wld_InsertNpc		(YMolerat,"FP_ROAM_SZUKAJCIE_TERAZ_KURWY_2");
	Wld_InsertNpc		(YMolerat,"FP_ROAM_SZUKAJCIE_TERAZ_KURWY_3");
	
	// Rzeka 2 _mod
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_MOD_STARTSCAV_BEACH");
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_MOD_STARTSCAV_BEACH");
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_MOD_STARTSCAV_BEACH");
	// Zej��ie do Cavalorna _mod
	Wld_InsertNpc		(YScavenger,"OW_PATH_268");
	
	// Pfad zum OC
	Wld_InsertNpc		(YScavenger,"SPAWN_TOTURIAL_CHICKEN_2_2");
	Wld_InsertNpc		(YScavenger, "OW_PATH_1_5_4");

	// Sandbank im Flu�
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_BLOODFLY_E_3");

	// bei Ratford und Drax am Zaun
	Wld_InsertNpc		(YScavenger,"ER_NEWSPAWN_YSCA");
	Wld_InsertNpc		(YScavenger,"ER_NEWSPAWN_YSCA");
	Wld_InsertNpc		(YScavenger,"ER_NEWSPAWN_YSCA");

	// zwischen J�gern und Br�cke zum OC
	Wld_InsertNpc		(YScavenger,"SPAWN_OW_STARTSCAVNGERBO_01_02");
	Wld_InsertNpc		(YScavenger,"SPAWN_GRD1");


	//------------Mordrags Weg vom Al ins NL-------------------------------//
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_06_04");
		
	Wld_InsertNpc		(Scavenger,"SPAWN_OW_SCAVENGER_AL_ORC");
	Wld_InsertNpc		(Scavenger,"HELPPOINT");

	// ...


	//------------vom NL zum FMC-------------------------------//
	Wld_InsertNpc		(Scavenger,"OW_PATH_075_GUARD2");
	Wld_InsertNpc		(Scavenger,"OW_PATH_075_GUARD3");
	Wld_InsertNpc		(Scavenger,"OW_PATH_075_GUARD4");
	Wld_InsertNpc		(Molerat,"OW_PATH_084");
	Wld_InsertNpc		(Molerat,"OW_PATH_086");
	Wld_InsertNpc		(Molerat,"OW_PATH_3001");
	Wld_InsertNpc		(Wolf,"OW_PATH_3001_MOVE");
	Wld_InsertNpc		(Molerat,"OW_PATH_3001_MOVE5");


	//-------------Camp im Lager �ber Cavalorns H�tte---------------------------
// Alex: NSCs sollten Hostile sein und bei Sichtung angreifen. Das funzt aber nicht, deshalb wieder rausgenommen
    Wld_InsertNpc				(NON_1501_WEGELAGERER,"SPAWN_TALL_PATH_BANDITOS2_03");
  	Wld_InsertNpc				(NON_1502_WEGELAGERER,"SPAWN_TALL_PATH_BANDITOS2_03");
//	Wld_InsertNpc				(Wolf,"SPAWN_TALL_PATH_BANDITOS2_03");

	//-------------Camp zw. AL und NL ---------------------------
  //	Wld_InsertNpc				(NON_1503_WEGELAGERER,"OW_PATH_BANDITOS01");
 // 	Wld_InsertNpc				(NON_1504_WEGELAGERER,"OW_PATH_BANDITOS01");
//	Wld_InsertNpc				(Waran,"OW_PATH_BANDITOS01");


	//-----------------------KLOSTERRUINE---------------------------------//
	// Am Strand
    Wld_InsertNpc		(Waran,"SPAWN_ROAM_OW_WARAN_RUIN");
    Wld_InsertNpc		(Waran,"SPAWN_ROAM_OW_WARAN_RUIN");
    Wld_InsertNpc		(Waran,"SPAWN_ROAM_OW_WARAN_RUIN");

	// vor Baumstamm 
	Wld_InsertNpc		(Snapper,"OW_PATH_ABYSS_4");
	Wld_InsertNpc		(Snapper,"OW_PATH_ABYSS_4");

	// hinter Baumstamm 
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE");
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE");
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE");
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE");
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE02");
	Wld_InsertNpc		(Snapper,"OW_MONSTER_NAVIGATE02");
	Wld_InsertNpc		(Snapper,"OW_PATH_179");
	Wld_InsertNpc		(Snapper,"OW_PATH_179");

	// in der Grabenh�hle unter dem Baumstamm
    Wld_InsertNpc		(Snapper,"OW_ABYSS_SPAWN_WARAN");
    Wld_InsertNpc		(Snapper,"OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc		(Snapper,"SPAWN_ABYSS_TO_CAVE_MOVE");
	Wld_InsertNpc		(Snapper,"SPAWN_ABYSS_TO_CAVE_MOVE");

	// Vor der Mauer
	Wld_InsertNpc       (Meatbug,"OW_PATH_175_MEATBUG");
	Wld_InsertNpc       (Meatbug,"OW_PATH_175_MEATBUG");
    Wld_InsertNpc       (Meatbug,"OW_PATH_175_MEATBUG");
    
	// im Hof
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN01");
	
	// H�hle vor dem Bonusraum
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc		(Snapper,"OW_PATH_SNAPPER04_SPAWN02");

	Wld_InsertNpc		(Shadowbeast,"OW_PATH_TEMPELRUIN06");

	// Auf hinterer Plattform
 Wld_InsertNpc		(Troll,"OW_RUIN_TROLL");	//wird erst sp�ter in B_Story_LeftFM() gespawnt!
    

	//-----------------------STEINKREIS---------------------------------//
	// H�hle auf Bergweg vor Milten
	Wld_InsertNpc		(Bloodhound,"OW_PATH_07_15_CAVE3");
	Wld_InsertNpc		(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc		(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc		(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc		(Snapper,	"OW_PATH_07_15");

	// Bloodhound bei Milten 
	Wld_InsertNpc		(Bloodhound,"OW_PATH_274");

	// Untote in der Gruft unter dem Steinkreis 
	Wld_InsertNpc		(ZombieTheKeeper,		"LOCATION_05_02_STONEHENGE4");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE2");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE2");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE3");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE3");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE5");
	Wld_InsertNpc		(SkeletonSH,			"LOCATION_05_02_STONEHENGE5");


    Wld_InsertNpc		(GreenGobboClub,			        "FP_ROAM_OW_GOBBO_KRYPTA01");
	Wld_InsertNpc		(GreenGobboClub,			        "FP_ROAM_OW_GOBBO_KRYPTA02");
	Wld_InsertNpc		(GreenGobboClub,			        "FP_ROAM_OW_GOBBO_KRYPTA03");
	Wld_InsertNpc		(BlackGobboMace,			"FP_ROAM_OW_GOBBO_KRYPTA04");
	Wld_InsertNpc		(BlackGobboMace,			"FP_ROAM_OW_GOBBO_KRYPTA05");
    //------------------TROLLSCHLUCHT-------------------------------
    // 1. Gruppe
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_01");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_01");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_01");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_01");
    
    // 2. Gruppe
	Wld_InsertNpc		(BlackGobboWarrior,"SPAWN_BLACKGOBBO_SHRINKSCROLL");
    Wld_InsertNpc		(BlackGobboWarrior,"SPAWN_BLACKGOBBO_SHRINKSCROLL");
    Wld_InsertNpc		(BlackGobboWarrior,"SPAWN_BLACKGOBBO_SHRINKSCROLL");
    Wld_InsertNpc		(BlackGobboWarrior,"SPAWN_BLACKGOBBO_SHRINKSCROLL");
    
    // 3. Gruppe
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
    Wld_InsertNpc		(BlackGobboWarrior,"LOCATION_12_14");
    
	// bei der Winde
    Wld_InsertNpc		(MadTroll,"LOCATION_12_14");
    
	// Fokusplatform
    Wld_InsertNpc		(Harpie,"LOCATION_12_09");
    Wld_InsertNpc		(Harpie,"LOCATION_12_09");
    Wld_InsertNpc		(Harpie,"LOCATION_12_09");
    Wld_InsertNpc		(Harpie,"LOCATION_12_09");
     

    //-------------------------FELSENFESTUNG------------------------
 	// Berggebiet vor Br�cke
    Wld_InsertNpc		(Bloodhound,"PLATEAU_ROUND01");
    Wld_InsertNpc		(Bloodhound,"PLATEAU_ROUND02");
    Wld_InsertNpc		(Bloodhound,"PLATEAU_ROUND02_CAVE");
    Wld_InsertNpc		(Bloodhound,"PLATEAU_ROUND02_CAVE_MOVE");
    Wld_InsertNpc		(Bloodhound,"LOCATION_18_OUT");
    Wld_InsertNpc		(Bloodhound,"PATH_TO_PLATEAU04");
    Wld_InsertNpc		(Bloodhound,"PATH_TO_PLATEAU04_RIGHT");
    Wld_InsertNpc		(Bloodhound,"PATH_TO_PLATEAU04_SMALLPATH");

    //Br�cke
    Wld_InsertNpc		(Bridgegolem,"PATH_TO_PLATEAU04_BRIDGE2");
    
	//Platz vor Fokusplattform & Eingang
	Wld_InsertNpc		(MadHarpie,"LOCATION_19_03_PATH_RUIN7");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN8");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN9");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN10");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN11");    

	//EG: Leiterraum
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PEMTAGRAM_MOVEMENT");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PEMTAGRAM2");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PEMTAGRAM_MOVEMENT");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PENTAGRAMM");    

	//EG: Biblothek
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ROOM6");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ROOM6_BARRELCHAMBER");    

	//EG: Geheimkammer
	Wld_InsertNpc		(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	Wld_InsertNpc		(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	Wld_InsertNpc		(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	
	//EG: Linker Raum
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ROOM3");

	//1.OG: Raum links vorne
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_HARPYE1");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_ETAGE6");
	
	//1.OG: Raum links hinten
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_HARPYE3");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_HARPYE4");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_SECOND_ETAGE7");

	//2.OG
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_BALCONY2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_BALCONY3");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_BALCONY4");
	
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT2");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT2");
	Wld_InsertNpc		(Molerat,"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT2");
    //----------------------------SUMPF-------------------------------------
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI10");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI11");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI13");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI15");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI18");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI19");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI20");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI20");
	Wld_InsertNpc		(Swampshark,"PATH_AROUND_PSI21");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY10_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY10_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY13_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY13_SPAWN01");

	//-----------------------1.6.1--------------------------------------//
	Wld_InsertNpc		(Swampshark,"FP_ROAM_OW_SWAMPSHARK_ER_01");
	Wld_InsertNpc		(Swampshark,"WP_SWAMPGOLEM_ER_04");
	Wld_InsertNpc		(Swampshark,"WP_SWAMPGOLEM_ER_05");
	
	Wld_InsertNpc		(SwampGolem,"WP_SWAMPGOLEM_ER_01");
	Wld_InsertNpc		(SwampGolem,"WP_SWAMPGOLEM_ER_02");
	Wld_InsertNpc		(SwampGolem,"WP_SWAMPGOLEM_ER_03");
	Wld_InsertNpc		(SwampGolem,"PATH_AROUND_PSI06");
	Wld_InsertNpc		(SwampGolem,"WP_SWAMPGOLEM_ER_06");
	
	Wld_InsertNpc		(Alligator,"WP_ADD_SWASHA_01");
	Wld_InsertNpc		(Alligator,"ALIGATOR_SWAMP_02");
	Wld_InsertNpc		(Alligator,"WP_ALLIGATOR_01");
	Wld_InsertNpc		(Alligator,"WP_ALLIGATOR_02");
	Wld_InsertNpc		(Alligator,"WP_ALLIGATOR_03");
	
	//-----------------------ORK-GEBIET---------------------------------//
	
	Wld_InsertNpc	(Razor,"OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc	(Razor,"OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc	(Razor,"OW_PATH_SNAPPER02_SPAWN01");
	
	Wld_InsertNpc	(Razor,"SPAWN_OW_SNAPPER_INCAVE_DM2");
	Wld_InsertNpc	(Razor,"SPAWN_OW_SNAPPER_INCAVE_DM2");
	
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	
	Wld_InsertNpc	(FireWaran,"OW_PATH_SCAVENGER15_SPAWN01");

	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_SCAVENGER_ORC_03");
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_SCAVENGER_ORC_03");
	
		
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_RUIN_7");
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_RUIN_7");
	
	
	
	// �stlicher Zugang vom AL
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc	(OrcDog,"FP_ROAM_OW_SNAPPER_OW_ORC");

	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_104");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_104");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_104");
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_104");
	
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc	(OrcDog,"OW_PATH_BLACKWOLF07_SPAWN01");

	Wld_InsertNpc	(OrcScout,"CASTLE_2");

	Wld_InsertNpc	(OrcWarrior1,"CASTLE_3");
	Wld_InsertNpc	(OrcWarrior1,"CASTLE_3");
	Wld_InsertNpc	(OrcWarrior1,"CASTLE_4");
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_109");
	
	
	//--------------------------------------------------------------------------1.6.1----------------------------------
	
    Wld_InsertNpc	(CrystalGolem,"WP_CRYSTALGOLEM1");
	Wld_InsertNpc	(CrystalGolem,"BEAST1");
	Wld_InsertNpc	(CrystalGolem_Misson1,"OW_PATH_033_TO_CAVE5");
	
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_LOOKOUT_02");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_LOOKOUT_03");
	Wld_InsertNpc	(OrcElite_rest,"WP_ADD_ORC");
	
	Wld_InsertNpc	(LordAmorth,"MAG");
	Wld_InsertNpc	(SkeletonWarrior,"BM_SKE2");
	Wld_InsertNpc	(SkeletonWarrior,"BM_SKE1");
	Wld_InsertNpc	(SkeletonWarrior,"BM_SKE1");
	Wld_InsertNpc	(SkeletonWarrior,"BUC3");
	
	// westlicher Zugang vom AL

	// ALEX: zu dicht am Ausgang. Kommt rausgerannt und killt alles... 
	//	Wld_InsertNpc	(OrcScout,"OW_ORC_ORCDOG_MOVEMENT_02");

	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc	(OrcDog,"SPAWN_OW_BLACKWOLF_02_01");

	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_195");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_195");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_195");
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_195");

	Wld_InsertNpc	(Orcdog,"OW_ORC_ORCDOG_SPAWN01");
	Wld_InsertNpc	(Orcdog,"OW_ORC_ORCDOG_SPAWN01");
	Wld_InsertNpc	(Orcdog,"OW_ORC_ORCDOG_SPAWN01");

	Wld_InsertNpc	(OrcWarrior1,"OW_ORC_ORCDOG_SPAWN01_MOVEMENT");
	Wld_InsertNpc	(OrcWarrior1,"OW_ORC_ORCDOG_SPAWN01_MOVEMENT");

	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_MOLERAT_ORC_04");

	Wld_InsertNpc	(OrcBiter,"OW_PATH_103");
	Wld_InsertNpc	(OrcBiter,"OW_PATH_103");

	// Zugang von NL
	Wld_InsertNpc	(OrcBiter,"SPAWN_OW_WOLF_NEAR_SHADOW3");

	Wld_InsertNpc	(OrcBiter,"OW_PATH_3_07");
	Wld_InsertNpc	(OrcBiter,"OW_PATH_3_07");
	Wld_InsertNpc	(OrcBiter,"OW_PATH_3_07");
	Wld_InsertNpc	(OrcBiter,"OW_PATH_3_07");

	Wld_InsertNpc	(OrcScout,"OW_PATH_3_06");

	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_3_05");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_3_05");
	Wld_InsertNpc	(OrcWarrior1,"OW_PATH_3_05");
	Wld_InsertNpc	(OrcWarrior2,"OW_PATH_3_05");

	// Ork-Stadt: Br�cke
	Wld_InsertNpc	(OrcWarrior2,"OW_ORCBRIDGE_END");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORCBRIDGE_END");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORCBRIDGE_END");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_BRIDGE_GUARD");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_BRIDGE_GUARD");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_BRIDGE_GUARD");

	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_02_MOVEMENT");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_02_MOVEMENT");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_PATH_02_MOVEMENT");
	
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_02_MOVE");
	Wld_InsertNpc	(OrcWarrior3,"OW_ORC_PATH_02_MOVE");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_PATH_02_MOVE");

	// Ork-Stadt: vorderes Lagerfeuer
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_PLACE_01_MOVEMENT");
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_PLACE_01_MOVEMENT2");
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_PLACE_01_MOVEMENT3");
	Wld_InsertNpc	(OrcPeasantDrum,		"OW_ORC_HUT_01");
	Wld_InsertNpc	(OrcPeasantDrum,		"OW_ORC_HUT_02");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_HUT_01");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01_MOVEMENT");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_HUT_02");
	
	// Ork-Stadt: Arena (Miasto Ork�w)
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"ORK_CYWIL1");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"ORK_CYWIL2");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"ORK_CYWIL3");
	Wld_InsertNpc	(OrcPeasantDance,		"ORK_CYWIL4");
	Wld_InsertNpc	(Ur_Na_Kurvok,			"ORC_ARENA_BOSS");
	Wld_InsertNpc	(Orcelite_ArenaGuardian,"ORC_ARENA_GUARD1");
	Wld_InsertNpc	(Orcelite_Rest,"ORK_ELITA1");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_TOWER_GURADIAN");
	
	// Ork-Stadt: inneres Tor
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_02_GUARD_SPAWN");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_02_GUARD_SPAWN");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_04");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_04_MOVEMENT");
	Wld_InsertNpc	(OrcWarrior2,"OW_ORC_PATH_04_MOVEMENT");
	Wld_InsertNpc	(OrcWarrior3,"OW_ORC_PATH_WALL");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_PATH_06");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_PATH_06_1");
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_PATH_06_8");
	
	// Ork-Stadt: Podziemia (Miasto Ork�w)
	Wld_InsertNpc	(Orcelite_Rest,"OW_ORC_BOSS2");
	Wld_InsertNpc	(OrcWarrior3,"OW_ORC_BOSS4");
	Wld_InsertNpc	(Ur_Gran,"ORC_LORD");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_WACHE2");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_WACHE1");
	Wld_InsertNpc	(Orcelite_EnterGuardian,"ORC_WACHE1");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_PATROL1");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_PATROL2");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_PATROL3");
	Wld_InsertNpc	(Orcelite_Rest,"ORC_PATROL4");
	Wld_InsertNpc	(Orcelite_EnterGuardian,"ORC_DUNEGON_GUARD");
	Wld_InsertNpc	(Orcelite_TreasureGuardian,"ORC_TREASURE_GUARDIAN");
	//ORKOWY_SKARB /ORKOWY_NIEWOLNIK
	
	// Ork-Stadt: inneres Lagerfeuer
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_HUT_03");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_HUT_03");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_HUT_04");
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_HUT_03_MOVEMENT");
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_HUT_03_MOVEMENT");
	Wld_InsertNpc	(OrcPeasantDance,		"OW_ORC_PATH_06_1");
	Wld_InsertNpc	(OrcPeasantDrum,		"OW_ORC_HUT_03");
	Wld_InsertNpc	(OrcPeasantDrum,		"OW_ORC_HUT_04");

	// Ork-Stadt: Durchgang zum Grubenplatz
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_PATH_06_2");
	Wld_InsertNpc	(OrcPeasantEatAndDrink,	"OW_ORC_PATH_06_2");
	Wld_InsertNpc	(OrcWarrior2,			"OW_ORC_PATH_06_4");
	Wld_InsertNpc	(OrcWarrior2,			"OW_ORC_PATH_06_4");

	// Ork-Stadt: Schamanenh�hle
	Wld_InsertNpc	(OrcWarrior4,"OW_ORC_SHAMAN_PATH1");
	Wld_InsertNpc	(OrcWarrior4,"OW_ORC_SHAMAN_PATH1");
	
	// Ork-Stadt: Zugang zum S�ulenplatz
	Wld_InsertNpc	(OrcWarrior3,"OW_PATH_06_13_GUARD");
	Wld_InsertNpc	(OrcWarrior4,"OW_PATH_06_13_GUARD1");
	Wld_InsertNpc	(OrcWarrior4,"OW_PATH_06_13_GUARD1");
	Wld_InsertNpc	(OrcWarrior4,"OW_PATH_06_13_GUARD2");

	// Ork-Stadt: Zugang zum S�ulenplatz
	Wld_InsertNpc	(OrcShaman,"OW_PATH_06_14_HEILIGTUM");
	Wld_InsertNpc	(OrcShaman,"OW_PATH_06_14_HEILIGTUM2");
	Wld_InsertNpc	(OrcShaman,"OW_PATH_06_14_HEILIGTUM3");
	Wld_InsertNpc	(OrcShaman,"OW_PATH_06_14_HEILIGTUM4");
    // Tajemniczy Kastagir

	Wld_InsertNpc	(Orcelite_Rest,"FP_GUARD_ORCELITE_NEW_00");
	//-----------------------D�monenbeschw�rer---------------------------------//
	Wld_InsertNpc	(StoneGolem,	"OW_PATH_123");
	Wld_InsertNpc	(IceGolem,		"OW_PATH_125");
	Wld_InsertNpc	(FireGolem,		"OW_PATH_127");


	//-----------------------Kastell---------------------------------//
	Wld_InsertNpc	(OrcScout,	"BRIDGE_CASTLE_TO_PLATEAU");
	Wld_InsertNpc	(OrcScout,	"CASTLE_16");
	
	//--------------NEBELTURM---------------------------------------//
	//1. Raum
	Wld_InsertNpc	(Skeleton, 			"OW_FOGDUNGEON_06"); 

	//2. Raum	
	Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_SKELETT_SPAWN");
	Wld_InsertNpc	(Skeleton, 			"OW_FOGDUNGEON_09"); 

	//3. Raum (mit 2. Wendeltreppe nach unten)
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_SKELETT_SPAWN");

	//Stollensystem nach 2. Wendeltreppe
	Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_16");
	Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_28");
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_28");
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_23");
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_24");
	Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_19");
	Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_20");

	//Gro�e H�hle nach Stollensystem
	Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36"); 
	Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT"); 
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_36_MOVEMENT"); 
	Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT2"); 
	Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_36_MOVEMENT2");
	Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_37"); 
	Wld_InsertNpc	(SkeletonMage_fogtower,		"OW_FOGDUNGEON_37");

	//2. Stollensystem hinter gro�er H�hle
	Wld_InsertNpc	(Skeleton, 			"OW_FOGDUNGEON_40"); 
	Wld_InsertNpc	(SkeletonScout, 	"OW_FOGDUNGEON_40");
	Wld_InsertNpc	(Skeleton, 			"OW_FOGDUNGEON_43"); 
	Wld_InsertNpc	(SkeletonWarrior, 	"OW_FOGDUNGEON_43"); 
	
	//---------------------ALTERMAGIERTURM----------------------------//
	
	Wld_InsertNpc	(SkeletonWarrior,	"MAGICTOWER_01"); 
	Wld_InsertNpc	(SkeletonScout,		"MAGICTOWER_01"); 
	
	Wld_InsertNpc	(SkeletonWarrior,	"MAGICTOWER_STAIRS"); 
	Wld_InsertNpc	(SkeletonScout,		"MAGICTOWER_STAIRS"); 

	Wld_InsertNpc	(SkeletonMage,		"MAGICTOWER_02"); 

	Wld_InsertNpc	(Zombie, 			"MAGICTOWER_COR"); 
	Wld_InsertNpc	(Zombie2,			"MAGICTOWER_COR"); 

	Wld_InsertNpc	(Zombie3,			"MAGICTOWER_SAT"); 
	Wld_InsertNpc	(Zombie4,			"MAGICTOWER_SAT"); 

	Wld_InsertNpc	(Zombie,			"MAGICTOWER_03_MOVEMENT"); 
	Wld_InsertNpc	(Zombie2,			"MAGICTOWER_03_MOVEMENT"); 
	
	Wld_InsertNpc	(Zombie3,			"MAGICTOWER_03_MOVEMENT_2"); 
	Wld_InsertNpc	(Zombie4,			"MAGICTOWER_03_MOVEMENT_2"); 
	
	Wld_InsertNpc	(Zombie,			"MAGICTOWER_04"); 
	Wld_InsertNpc	(Zombie2,			"MAGICTOWER_04"); 
	Wld_InsertNpc	(Zombie3,			"MAGICTOWER_04"); 
	Wld_InsertNpc	(Zombie4,			"MAGICTOWER_04"); 

	Wld_InsertNpc	(Zombie,			"MAGICTOWER_06"); 
	Wld_InsertNpc	(Zombie2,			"MAGICTOWER_06"); 
	Wld_InsertNpc	(Zombie3,			"MAGICTOWER_06"); 
	Wld_InsertNpc	(Zombie4,			"MAGICTOWER_06"); 
	
	
	
	Wld_InsertNpc	(Troll,			"WP_ADD_TROLL_01"); 
	Wld_InsertNpc	(Troll,			"WP_ADD_TROLL_02"); 
	Wld_InsertNpc	(Troll,			"WP_ADD_TROLL_03"); 
    
	//-------------------WARGI S......
	//yyy co?
	
	Wld_InsertNpc	(Warg,			"WP_ADD_56"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_57"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_58"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_59"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_60"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_61"); 
	Wld_InsertNpc	(Warg,			"WP_ADD_62"); 
	
	Wld_InsertNpc	(Giant_Bug,			"WP_ADD_GB_09"); 
	Wld_InsertNpc	(Giant_Bug,			"WP_ADD_GB_10"); 
	Wld_InsertNpc	(Giant_Bug,			"WP_ADD_GB_11"); 
	
	Wld_InsertNpc		(Warg,"WP_ADD_WARG_08");
	Wld_InsertNpc		(Warg,"WP_ADD_WARG_09");
	
	
	
	
	
	
	Wld_InsertNpc		(Bear,"WP_SHADOWBEAST1");
	Wld_InsertNpc		(Bear,"PIRAT4");
	Wld_InsertNpc		(Bear,"WP_ADD_BEAR1");
	//Wld_InsertNpc		(Warg,"WP_ADD_WARG_09");
	
	
	
	
	//***********************************
	// EDYCJA ROZSZERZONA
	// Potwory v.0.89 // v1.0
	// 28 lipiec
	//************************************
	
	// Skarb1
	Wld_InsertNpc		(Snapper,	"ZEB1"); 
	// Trole ziemne
	//Wld_InsertNpc				(TrollGround,"WD_TROLL1");
	Wld_InsertNpc				(TrollGround,"OW_PATH_220");
	Wld_InsertNpc				(TrollGround,"PLATEAU_ROUND02_CAVE_MOVE");
	Wld_InsertNpc				(TrollGround,"OW_PATH_006");
	//Wld_InsertNpc				(TrollGround,"WD_TROLL2");
	//Orkowie elitarni  //by gothic 1210 22 wrzesien 
	Wld_InsertNpc				(Orcelite_Rest,"ORC_ELITA1");
	Wld_InsertNpc				(Orcelite_Rest,"ORC_ELITA2");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_02");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_03");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_02_MOVEMENT");
	Wld_InsertNpc				(Orcelite_Rest,"FP_ORC_GUARD_INNERWALL_4");
	Wld_InsertNpc				(Orcelite_Rest,"FP_ORC_GUARD_INNERWALL_2");
	Wld_InsertNpc				(Orcelite_Rest,"FP_ORC_GUARD_INNERWALL_1");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_06_2");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_06_4");
	Wld_InsertNpc				(Orcelite_Rest,"OW_ORC_PATH_06_10");
	//Dziki
	Wld_InsertNpc				(dzik,"POLANA_DZIK1");
	Wld_InsertNpc				(dzik,"POLANA_DZIK2");
	Wld_InsertNpc				(dzik,"POLANA_DZIK3");
	
	Wld_InsertNpc				(dzik,"NO_DZIK1");
	Wld_InsertNpc				(dzik,"NO_DZIK2");
	Wld_InsertNpc				(dzik,"NO_DZIK3");
	
	Wld_InsertNpc				(dzik,"WM_DZIK1");
	Wld_InsertNpc				(dzik,"WM_DZIK2");
	Wld_InsertNpc				(dzik,"WM_DZIK3");
	Wld_InsertNpc				(dzik,"WM_DZIK4");
	Wld_InsertNpc				(dzik,"WM_DZIK5");
	Wld_InsertNpc				(dzik,"WM_DZIK6");	
	
	Wld_InsertNpc				(dzik,"OW_PSIWOOD_MOVEMENT10");	
	Wld_InsertNpc				(dzik,"OW_PSIWOOD_MOVEMENT3");
	Wld_InsertNpc				(dzik,"OW_PSI_MOVEMENT2");
	//wieza mgiel
	Wld_InsertNpc				(dzik,"OW_PATH_172");
	Wld_InsertNpc				(dzik,"OW_PATH_172");	
	Wld_InsertNpc				(dzik,"OW_PATH_172");	
	Wld_InsertNpc				(dzik,"OW_PATH_172");	
	
	Wld_InsertNpc				(dzik,"OW_PATH_223");
	Wld_InsertNpc				(dzik,"OW_PATH_223");
	Wld_InsertNpc				(dzik,"OW_PATH_223");
	
	Wld_InsertNpc				(SkeletonWarrior,"WP_JO_SKE_02");
	Wld_InsertNpc				(SkeletonWarrior,"WP_JO_SKE_01");
    Wld_InsertNpc				(SkeletonWarrior,"WP_JO_SKE_04");
	
	Wld_InsertNpc				(MinecrawlerWarrior,"WP_ADD_28");
	Wld_InsertNpc				(Minecrawler,"WP_ADD_28");
    Wld_InsertNpc				(Minecrawler,"WP_ADD_27");
	//////////////////////////////////////////////////////////////////////////////////////////////////
};

FUNC VOID INIT_SUB_SURFACE ()
{

	/*----------------------------------------------------------*/
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_GROUND2_01",0);
	
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_23",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_24",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_25",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_26",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_27",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_28",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_29",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_30",0);
		
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_06",0);
	
	// aus Orc-City
	Wld_SetMobRoutine	(00,00, "FIREPLACE", 1);
	
	
	/*************************************************************/
// PlayVideo		("intro25fr.bik");
};

func VOID STARTUP_DEMONTOWER ()
{
	STARTUP_SUB_DEMONTOWER ();
	
};

func VOID INIT_DEMONTOWER ()
{
	INIT_SUB_DEMONTOWER ();
	//INIT_GLOBAL();
};



func VOID STARTUP_FREEMINCAMP ()
{
	STARTUP_SUB_FREEMINECAMP ();
	
};

func VOID INIT_FREEMINCAMP ()
{
	INIT_SUB_FREEMINECAMP ();
	//INIT_GLOBAL();
};




func VOID STARTUP_PSICAMP ()
{
    STARTUP_SUB_PSICAMP ();
	
};

func VOID INIT_PSICAMP ()
{
	INIT_SUB_PSICAMP ();
	//INIT_GLOBAL();
};



func VOID STARTUP_NEWCAMP ()
{
    STARTUP_SUB_NEWCAMP ();
	
};

func VOID INIT_NEWCAMP ()
{
    INIT_SUB_NEWCAMP ();
	//INIT_GLOBAL();
};



func VOID STARTUP_OLDCAMP ()
{
    STARTUP_SUB_OLDCAMP ();
};

func VOID INIT_OLDCAMP ()
{
    INIT_SUB_OLDCAMP ();
	//INIT_GLOBAL();
};



func VOID STARTUP_SURFACE ()
{
    STARTUP_SUB_SURFACE ();
};

func VOID INIT_SURFACE ()
{
    INIT_SUB_SURFACE ();
	//INIT_GLOBAL();
};



var int brama_pw;
func void Brama_Plac_Wymian () 
{
	if (Wld_IsTime(06,05,20,00))
	{
		if (brama_pw  == 1)
		{ 
			Wld_SendTrigger ("EVT_OW_STARTLOCKOUT_MOVER"); 
			brama_pw  = 0; 
		}; 
	}; 

	if (Wld_IsTime(20,00,06,05)) 
	{ 
		if (brama_pw  == 0)
		{ 
			Wld_SendTrigger ("EVT_OW_STARTLOCKOUT_MOVER"); 
			brama_pw  = 1; 
		}; 
	};
};



//-------- eigentliche Startup des Spiels --------
FUNC VOID INIT_WORLD ()
{
	INIT_Sub_Newcamp		();
	INIT_Sub_Oldcamp		();
	INIT_Sub_Psicamp		();
	INIT_Sub_Demontower 	();
	INIT_Sub_Freeminecamp	();
	INIT_Sub_Surface 		();

    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
   
	
	//LeGo_Init ((LeGo_All ) | LeGo_HookEngine | LeGo_View | LeGo_FrameFunctions | LeGo_Gamestate | LeGo_Render | LeGo_Buffs); 

	INIT_GLOBAL();
	FF_ApplyOnce(Mod_Menu_HSkills);
	FF_ApplyOnce(Mod_FixAivarHero);
	FF_ApplyOnceExtGT(WYZWALACZ, 2000, -1);
	
 
	//---------------------------------------------------------G�owa i tatua�e
	if (Shave_Head == TRUE) && (Shave_and_Tatto == TRUE)
	{
	  Mdl_SetVisualBody (hero,"hum_body_Naked0", 1,        1 ,          "Hum_Head_Bald",	152, 			0,			-1);
	};
	//else
	//{
	//Mdl_SetVisualBody (hero,"hum_body_Naked0",	5,			1,			"Hum_Head_Pony",	9, 		    	0,			-1);
	//};
	//------------------------------------------------------------G�owa
	if (ShaveOnlyHead == TRUE)  && (Shave_and_Tatto != TRUE)//&& (Shave_and_Tatto != TRUE)
	{
	Mdl_SetVisualBody (hero,"hum_body_Naked0",	5,			1,			"Hum_Head_Bald",	152, 			0,			-1);   
	};
	
	
	
	//FF_Apply (Mod_Splash_CoontainerLocker);
};
FUNC VOID STARTUP_WORLD ()
{
	Startup_Sub_Newcamp			();
	Startup_Sub_Oldcamp			();
	Startup_Sub_Psicamp			();
	Startup_Sub_Demontower		();
	Startup_Sub_Freeminecamp	();
	Startup_Sub_Surface			();
    //Wld_SendTrigger("WYZWALACZ"); //wyzwalacz co 2 sekundy
	//die folgende Zeile gilt nur, bis die INIT_...-Funktionen von Ulf unterst�tzt werden.
	INIT_WORLD					();
	//PlayVideo ("er_warns.bik");
	PlayVideo ("intro.bik");
};

/********************************************************
*                                                       *
*												        *
*					ENDE STARTUP WORLD					*
*												        *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP KOLONIA					*
*                                                       *
*          
                                   *
********************************************************/		









FUNC VOID STARTUP_ORCGRAVEYARD ()
{
//Wld_SendTrigger("WYZWALACZ");
	//-------- 1. H�hle --------
	Wld_InsertNpc		(TrollGround,		"CM_TROL1");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_006");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_015");
	Wld_InsertNpc		(Tpl_1445_Templer,	"GRYD_016");

	//-------- 2. H�hle --------
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_019B");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_019D");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_020B");
	Wld_InsertNpc		(Tpl_1446_Templer,	"GRYD_020");
	
	//-------- 3. H�hle --------
	
	Wld_InsertNpc		(Gur_1211_BaalLukor,"GRYD_025");
	Wld_InsertNpc		(Tpl_1443_Templer,	"GRYD_025");
	Wld_InsertNpc		(Tpl_1444_Templer,	"GRYD_025");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_048");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_048");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_043");
	//Wld_InsertNpc		(OrcScoutGYD,		"GRYD_043");

	//-------- 1. Nebenstollen --------
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_031");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_032");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_037");
	//Wld_InsertNpc		(OrcScoutGYD,		"GRYD_039");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_040");
	//Wld_InsertNpc		(OrcScoutGYD,		"GRYD_042");

	//-------- 2. Nebenstollen --------
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_047");
	Wld_InsertNpc		(OrcScoutGYD,		"GRYD_047");

	//-------- Gro�e Halle --------

	Wld_InsertNpc		(Varrag_Harosh,		"GRYD_055");
	//Wld_InsertNpc		(Orcskeleton_Varr,	"GYD_500");
	Wld_InsertNpc		(Orcskeleton_Varr,	"GRYD_074");
	Wld_InsertNpc		(Orcskeleton_Varr,	"GRYD_076");
	
	
	
};

FUNC VOID INIT_ORCGRAVEYARD ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);

	//-------- Attit�den initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	INIT_GLOBAL();
	//LeGo_Init(LeGo_All);
	//INIT_GLOBAL();
};



FUNC VOID STARTUP_ORCTEMPEL ()
{
	//-------- globale StoryVariable --------
	B_Story_EnteredTemple();
   //------------SUBMOD--------------------------------------------

	
	Wld_InsertNpc				(StonePuma,"TPL_ER_CH5_PUMA1");
	Wld_InsertNpc				(StonePuma,"TPL_ER_CH5_PUMA2");
	Wld_InsertNpc				(StonePuma,"TPL_ER_CH5_PUMA3");	 
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA4");	
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA5");	
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA6");
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA7");
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA8"); 
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA9");
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA10");
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA11");
	Wld_InsertNpc				(StonePuma,"WP_ER_CH5_PUMA12");
	
	
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_1");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_2");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_3");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_4");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_5");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_6");
	Wld_InsertItem			(ItMi_Black_Crystal_CH5,"FP_ITEM_BLACK_CRYSTAL_CH5_7");
	//-------- mod orcs sekeltons ----------
	Wld_InsertNpc				( OrcSkeleton, 		"OT_ORCSKE1" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"OT_ORCSKE2" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_014" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_010" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_016" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"DIEGO_TPL" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"OT_ORCSKE3" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"BEAST3" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"OT_ORCSKE4" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_050" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_052" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_053" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_042" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_076" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_084" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_226" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_161" ); 
	Wld_InsertNpc				( OrcSkeleton, 		"TPL_169" ); 
	// ------------------- Skeleton -------------------------------------
	Wld_InsertNpc				( Skeleton, 		"TPL_017" ); 
	Wld_InsertNpc				( SkeletonScout,	"TPL_020" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_022" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_022" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_027" );
	Wld_InsertNpc				( SkeletonScout, 	"TPL_030" );
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_030" );
	Wld_InsertNpc				( Skeleton, 		"TPL_034" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_035" );  
	Wld_InsertNpc				( SkeletonScout, 	"TPL_045" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_045" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_045" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_047" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_047" ); 
	Wld_InsertNpc				( SkeletonScout, 	"TPL_051" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_051" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_051" ); 	
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_411" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_412" ); 
	Wld_InsertNpc				( SkeletonWarrior, 	"TPL_414" ); 
	Wld_InsertNpc				( SkeletonScout, 	"TPL_412" ); 
	Wld_InsertNpc				( SkeletonScout, 	"TPL_413" ); 
	Wld_InsertNpc				( Skeleton, 		"TPL_411" ); 	
	
	Wld_InsertNpc				( SkeletonMage, 	"TPL_031" ); 	
	Wld_InsertNpc				( SkeletonMage, 	"TPL_046" ); 	

	
	// ------------------ UnDeathOrc ----------------------------------
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_044" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_090" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_092" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_114" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_117" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_121" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_132" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_140" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_142" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_145" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_148" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_151" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_161" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_258" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_263" );
	Wld_InsertNpc				( UndeadOrcWarrior, "TPL_294" );

	
	// ------------------  Minecrawler ----------------------------------
	Wld_InsertNpc				( OTMinecrawler, "TPL_066" ); 
	Wld_InsertNpc				( OTMinecrawler, "TPL_069" );  
	Wld_InsertNpc				( OTMinecrawler, "TPL_076" );  
	Wld_InsertNpc				( OTMinecrawler, "TPL_106" ); 
	Wld_InsertNpc				( OTMinecrawler, "TPL_106" );	
	Wld_InsertNpc				( OTMinecrawler, "TPL_229" );  
	Wld_InsertNpc				( OTMinecrawler, "TPL_235" );  
	Wld_InsertNpc				( OTMinecrawler, "TPL_405" );
	Wld_InsertNpc				( OTMinecrawler, "TPL_405" );
	Wld_InsertNpc				( OTMinecrawlerQueen, "TPL_406" );
	Wld_InsertNpc				( OTMinecrawler, "TPL_407" );  
	
	//------------------- Panters----------------------------------------

	
	// ------------------ Damon -----------------------------------------
	Wld_InsertNpc				( OTDemon, "TPL_216" ); 
	Wld_InsertNpc				( OTDemon, "TPL_218" ); 
	Wld_InsertNpc				( OTDemon, "TPL_186" ); 
	Wld_InsertNpc				( OTDemon, "TPL_175" ); 
	Wld_InsertNpc				( OTDemon, "TPL_174" ); 
	
	// DMB
	Wld_InsertNpc				( KDF_406_OTXardas, 	"TPL_408" ); 
	Wld_InsertNpc				( TPL_1491_GorNaTokasOT, 	"TPL_341" ); 
	
	// ---------------------------------------------------------------
	// ------------------ PSI ----------------------------------------
	// ---------------------------------------------------------------
	
	// TPL - Vorstufe (R�stung 150)
	Wld_InsertNpc				( TPL_1455_GorBoba, "TPL_408" ); // Spricht den SC an
	Wld_InsertNpc				( TPL_1447_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1448_Templer,	"TPL_408" );
	Wld_InsertNpc				( TPL_1456_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1457_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1458_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1459_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1460_Templer, "TPL_408" ); 
	
	// TPL - Endstufe (R�stung 1000)
	Wld_InsertNpc				( TPL_1449_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1450_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1451_Templer,	"TPL_408" );
	Wld_InsertNpc				( TPL_1452_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1453_Templer, "TPL_408" ); 
	Wld_InsertNpc				( TPL_1454_Templer, "TPL_408" ); 
	
	// GUR
	Wld_InsertNpc				( GUR_1212_MadCorKalom, 	"TPL_408" ); 
	
	//NOV
	Wld_InsertNpc				( NOV_1359_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	Wld_InsertNpc				( NOV_1360_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	Wld_InsertNpc				( NOV_1361_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	Wld_InsertNpc				( NOV_1362_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	Wld_InsertNpc				( NOV_1363_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	Wld_InsertNpc				( NOV_1364_Novize,	"TPL_408" ); // Betet zum Schl�fer in der Schl�ferhalle
	
	Wld_InsertNpc				( NOV_1365_Novize,	"TPL_408" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_1366_Novize,	"TPL_408" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_1367_Novize,	"TPL_408" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_1368_Novize,	"TPL_408" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_1369_Novize,	"TPL_408" ); // Betet im Tempel
	Wld_InsertNpc				( NOV_1370_Novize,	"TPL_408" ); // Betet im Tempel
	//----------------------------------------------------------------------------------------------SUBMOD-------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------------------------------------------------
	// ------------------ Priests ---------------------------------------
	// -------------------------------------------------------------------
	
	Wld_InsertNpc				( ORC_Priest_1, "TPL_058" ); 
	Wld_InsertNpc				( ORC_Priest_4, "TPL_112" ); 
	Wld_InsertNpc				( ORC_Priest_5, "TPL_300" ); 
	// ----------------- Sleeper ---------------------------------------
	Wld_InsertNpc				( SLEEPER, "TPL_395" ); // Schl�ft die ganze Zeit :)
	//Wld_SendTrigger("WYZWALACZ");
};

FUNC VOID INIT_ORCTEMPEL ()
{
	//-------- Objekt-TAs --------
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);

	//-------- Attit�den initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	INIT_GLOBAL();
	//LeGo_Init(LeGo_All);
	//INIT_GLOBAL();
};




FUNC VOID STARTUP_OLDMINE ()
{
//Wld_SendTrigger("WYZWALACZ");
    //***TROLE ZIEMNE 
	Wld_InsertNpc				(TrollGround,"OM_TROLL1");
	//trtololo 1.4
	Wld_InsertNpc				(TrollGroundFe,"OM_TROLL2");
	Wld_InsertNpc				(TrollGroundCh,"TR_GR1");
	Wld_InsertNpc				(TrollGroundCh,"TR_GR2");
	Wld_InsertNpc				(TrollGroundCh,"TR_GR3");
	Wld_InsertNpc				(TrollGround,"OM_TROLL3");
	Wld_InsertNpc				(TrollGround,"OM_TROLL4");
	Wld_InsertNpc				(TrollGround,"OM_TROLL5");
	
	Wld_InsertNpc				(Stt_300_Alberto,"OM_122");
	Wld_InsertNpc				(Stt_301_Ian,"OM_122");
	Wld_InsertNpc				(Stt_302_Viper,"OM_122");
	Wld_InsertNpc				(Stt_335_Santino,"OM_122");
	Wld_InsertNpc				(Grd_234_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_235_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_236_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_260_Drake,"OM_122");
	Wld_InsertNpc				(Grd_261_Brandick,"OM_122");
	Wld_InsertNpc				(Grd_262_Aaron,"OM_122");
	Wld_InsertNpc				(Grd_263_Asghan,"OM_122");
	Wld_InsertNpc				(Grd_264_Gardist,"OM_122");
	
	Wld_InsertNpc				(Grd_266_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_267_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_268_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_269_Gardist,"OM_122");
	
	Wld_InsertNpc				(Grd_271_Ulbert,"OM_122");
	Wld_InsertNpc				(Grd_272_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_273_Gardist,"OM_122");
	
	Wld_InsertNpc				(Grd_277_Gardist,"OM_122");
	Wld_InsertNpc				(Grd_278_Gardist,"OM_122");
	
	Wld_InsertNpc				(VLK_518_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_525_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_539_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_540_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_541_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_542_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_543_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_544_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_545_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_546_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_547_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_548_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_549_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_550_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_551_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_579_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_583_Glen,"OM_122");
	Wld_InsertNpc				(VLK_584_Snipes,"OM_122");
	Wld_InsertNpc				(VLK_585_Aleph,"OM_122");
	Wld_InsertNpc				(VLK_586_Grimes,"OM_122");
	Wld_InsertNpc				(VLK_587_Garp,"OM_122");
	Wld_InsertNpc				(VLK_588_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_589_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_590_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_591_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_592_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_593_Buddler,"OM_122");
	
	Wld_InsertNpc				(GRD_2035_Dracon,"OM_122"); //straznik magazynu
	
	Wld_InsertNpc				(VLK_558_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_559_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_562_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_563_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_566_Buddler,"OM_122");
	Wld_InsertNpc				(VLK_567_Buddler,"OM_122");
	//===SUBMOD   Obite Pyski
	Wld_InsertNpc				(VLK_40010_Elton,"OM_122");
	Wld_InsertNpc				(GRD_40011_Cesar,"OM_122");
	Wld_InsertNpc				(VLK_40012_Kopacz,"OM_122");
	Wld_InsertNpc				(VLK_40013_Kopacz,"OM_122");
	Wld_InsertNpc				(VLK_40014_Kopacz,"OM_122");
	Wld_InsertNpc				(VLK_40015_Kopacz,"OM_122");
	Wld_InsertNpc				(VLK_40055_Eliott,"OM_122");
	Wld_InsertNpc				(VLK_40053_Richard,"OM_122");
	
	
	Wld_InsertNpc				(GRD_40056_Winston,"OM_122");
	Wld_InsertNpc				(GRD_40016_Straznik,"OM_122");
	Wld_InsertNpc				(TPL_1400_GorNaBar,"OM_122");
	Wld_InsertNpc				(TPL_1401_GorNaKosh,"OM_122");
	Wld_InsertNpc				(TPL_1433_GorNaVid,"OM_122");
	Wld_InsertNpc				(TPL_1436_Templer,"OM_122");
	Wld_InsertNpc				(TPL_1437_Templer,"OM_122");
	Wld_InsertNpc				(TPL_1438_Templer,"OM_122");
	
	Wld_InsertNpc				(Org_857_Calash,"OM_122");
	Wld_InsertNpc				(Stt_40066_Robin,"OM_122");
	Wld_InsertNpc				(VLK_5070_Danny,"OM_122");
	
	Wld_InsertNpc				(Orc_2001_Sklave,"OM_122");
	Wld_InsertNpc				(Orc_2002_Sklave,"OM_122");
	
	
	Wld_InsertNpc				(Minecrawler, "OM_033"); //
	Wld_InsertNpc				(Minecrawler, "OM_035"); //
	Wld_InsertNpc				(Minecrawler, "OM_038"); //
	Wld_InsertNpc				(Minecrawler, "OM_039"); //
	Wld_InsertNpc				(Minecrawler, "OM_047"); //
	
	Wld_InsertNpc				(Minecrawler, "OM_024"); //
	Wld_InsertNpc				(Minecrawler, "OM_027"); //
	Wld_InsertNpc				(Minecrawler, "OM_030"); //
	Wld_InsertNpc				(Minecrawler, "OM_031"); //
	Wld_InsertNpc				(Minecrawler, "OM_133"); //
	Wld_InsertNpc				(Minecrawler, "OM_CAVE1_89"); //
	Wld_InsertNpc				(Minecrawler, "OM_CAVE1_90"); //
	Wld_InsertNpc				(Minecrawler, "OM_CAVE1_94"); //
	Wld_InsertNpc				(Minecrawler, "OM_CAVE1_95"); //
	Wld_InsertNpc				(Minecrawler, "OM_062"); 
	Wld_InsertNpc				(Minecrawler, "OM_062"); 
	Wld_InsertNpc				(Minecrawler, "OM_063"); 
	Wld_InsertNpc				(Minecrawler, "OM_073"); 
	Wld_InsertNpc				(Minecrawler, "OM_073"); 
	Wld_InsertNpc				(Minecrawler, "OM_065"); 
	Wld_InsertNpc				(Minecrawler, "OM_076"); 
	Wld_InsertNpc				(Minecrawler, "OM_079"); 
	Wld_InsertNpc				(Minecrawler, "OM_080"); 
	Wld_InsertNpc				(Minecrawler, "OM_084_QUEEN");
	Wld_InsertNpc				(Minecrawler, "OM_084_QUEEN");
	
	//-------- Nebenstollen mit kaputtem Stampfer (Zahnrad) --------
	Wld_InsertNpc				(Minecrawler, "OM_188"); 
	Wld_InsertNpc				(Minecrawler, "OM_189"); 
	Wld_InsertNpc				(Minecrawler, "OM_190"); 
	
	//-------- H�hle der K�ngin --------
	Wld_InsertNpc				(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc				(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc				(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc				(MinecrawlerQueen, "OM_084_QUEEN_05"); 

	//-------- globale Variable --------
	EnteredOldMine = TRUE;
};

FUNC VOID INIT_OLDMINE ()
{
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);

	//-------- Attit�den initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	INIT_GLOBAL(); 
//	INIT_GLOBAL();
	//LeGo_Init(LeGo_All);
};		


FUNC VOID STARTUP_ABANDONEDMINE ()
{
	//Wld_SendTrigger("WYZWALACZ");
	
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE2"); 
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE1"); 
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE3");
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE4");
	//Wld_InsertNpc		(Skeleton ,	"ZL8");
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE5");
	Wld_InsertNpc		(Skeleton ,	"VM_PATH1");
	
	//-------- Enter --------
	
	
	
	//wa�ny npc #VIP
	Wld_InsertNpc		(NON_2094_Glest,"GLEST_VM");
    Wld_InsertNpc		(NON_40168_UndeadGardist,"VM_MAGE"); 
	//-------- Pelzacze --------
	Wld_InsertNpc		(MinecrawlerWarrior,		"PE1");
	Wld_InsertNpc		(Minecrawler,		"PE2");
	Wld_InsertNpc		(MinecrawlerWarrior,		"PE3");
	Wld_InsertNpc		(Minecrawler,		"PE4");
	Wld_InsertNpc		(MinecrawlerWarrior,		"PE5");
	Wld_InsertNpc		(MinecrawlerWarrior,		"PE6");
	Wld_InsertNpc		(Minecrawler,		"PE7");
	Wld_InsertNpc		(Minecrawler,		"PE8");
	Wld_InsertNpc		(Minecrawler,		"PE9");
	Wld_InsertNpc		(Minecrawler,		"PE10");
	Wld_InsertNpc		(Minecrawler,		"PE11");
	Wld_InsertNpc		(Minecrawler,		"PE12");
	Wld_InsertNpc		(OldMinecrawlerQueen, "QUEN_B"); 
	Wld_InsertNpc		(OldMinecrawlerQueen, "QUEN_A"); 
	
	Wld_InsertNpc (OldMinecrawlerQueen, "VM_PATH14");
	Wld_InsertNpc (Minecrawler, "VM_PATH13");
	Wld_InsertNpc (Minecrawler, "VM_PATH12");
	Wld_InsertNpc (Minecrawler, "VM_PATH11");
	Wld_InsertNpc (MinecrawlerWarrior, "VM_PATH10");//+warrior
	Wld_InsertNpc (Minecrawler, "VM_PATH9");
	Wld_InsertNpc (TrollGround, "VM_TROLL");
	Wld_InsertNpc (Minecrawler, "VM_PATH16");
	Wld_InsertNpc (Minecrawler, "VM_PATH17");
	Wld_InsertNpc (Minecrawler, "VM_PATH18");
	Wld_InsertNpc (Minecrawler, "VM_PATH19");


	Wld_InsertNpc		(GRD_2230_DeadGardist,"ZL4");
	Wld_InsertNpc		(GRD_2231_DeadGardist,"ZL8");
	Wld_InsertNpc		(GRD_2232_DeadGardist,"VM_PATH8");
	Wld_InsertNpc		(GRD_2233_DeadGardist,"ZL6");
	Wld_InsertNpc		(GRD_2250_DeadGardist,"ZL5");
	Wld_InsertNpc		(STT_2251_Schatten,"ZL7");
	Wld_InsertNpc		(STT_2252_Schatten,"ZL10");
	Wld_InsertNpc		(STT_2253_Schatten,"VM_PATH2");
	//-------- Camp --------
	Wld_InsertNpc		(NON_2098_Stra�nik,"VM_PATH4");
	Wld_InsertNpc		(NON_2099_Kopacz,"OK_STRAZ2");
	Wld_InsertNpc		(GRD_2095_Stra�nik ,"VM_HP1");
	Wld_InsertNpc		(GRD_2096_Stra�nik ,"VM_GRD2");
	Wld_InsertNpc		(GRD_2097_Stra�nik ,"VM_GRD3"); 
	
	//-------- Dziura z kotlem --------
	Wld_InsertNpc		(Skeleton ,	"VM_SKE1");
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE6");
	Wld_InsertNpc		(Skeleton ,	"VM_SKE2");
	Wld_InsertNpc		(Skeleton ,	"VM_SKE6");
	Wld_InsertNpc		(Skeleton ,	"ZL8");
	
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE7");
	Wld_InsertNpc		(Zombie ,	"VM_ZOMBIE8");
	Wld_InsertNpc		(Skeleton ,	"ZL9");
	Wld_InsertNpc		(Skeleton ,	"ZL2");
	Wld_InsertNpc		(Skeleton ,	"VM_SKE_BOW1");
	Wld_InsertNpc		(Skeleton ,	"VM_SKE_BOW2");
	Wld_InsertNpc		(Skeleton,	"VM_PATH7");
	Wld_InsertNpc		(Skeleton ,	"VM_SKE_BOW3");
	
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_1");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_2");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_3");
	Wld_InsertNpc		(Skeleton ,	"VM_SKG_4");
	
	//-------- kamien --------
	Wld_InsertNpc		(OldMinecrawlerQueen,"VM_DEMON");
	//Wld_InsertNpc		(Skeleton ,	"VM_SKE5");
	//Wld_InsertNpc (SkeletonMage_abandonemine, "VM_DEMON");
	Wld_InsertNpc (Minecrawler ,	"VM_PATH23");
	Wld_InsertNpc (Minecrawler, "VM_HERO_SPAWN1");
	Wld_InsertNpc (Minecrawler, "VM_HERO_SPAWN2");
};

var int banditsInMine;
var int engineerInMine;

FUNC VOID INIT_DYNAMIC_ABANDONEDMINE () {
	if (MIS_BanditsInAbadonedMine == LOG_SUCCESS && !banditsInMine) {
		Wld_InsertNpc		(NON_3040_Bandyta ,	"ZL3");
		Wld_InsertNpc		(NON_3045_Bandyta ,	"ZL9");
		Wld_InsertNpc		(NON_3030_Bandyta ,	"ZL5");
		Wld_InsertNpc		(NON_3031_Bandyta ,	"ZL10");
		Wld_InsertNpc		(NON_3038_Bandyta ,	"ZL2");
		Wld_InsertNpc		(NON_3037_Bandyta ,	"ZL11");
		Wld_InsertNpc		(NON_3044_Bandyta ,	"ZL8");
		Wld_InsertNpc		(NON_3042_Bandyta ,	"ZL4");

		banditsInMine = true;
	};

	if (MIS_NewEnginer == LOG_SUCCESS && !engineerInMine) {
		Wld_InsertNpc		(VLK_599_GuyMine, "VM_PATH2");
		engineerInMine = true;
	};
};

FUNC VOID INIT_ABANDONEDMINE ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);

	//-------- Attit�den initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	INIT_GLOBAL(); 
	INIT_DYNAMIC_ABANDONEDMINE();
//	INIT_GLOBAL();
	//LeGo_Init(LeGo_All);
};



FUNC VOID STARTUP_FREEMINE ()	
{
//Wld_SendTrigger("WYZWALACZ");
	//-------- globale Story-Variable --------
	EnteredFreeMine = TRUE;

	//-------------------Schatten----------------------------
	
	Wld_InsertNpc				(Stt_336_Schatten,"FM_03");//RoastScavenger
	Wld_InsertNpc				(Stt_337_Schatten,"FM_03");//SitAround
	Wld_InsertNpc				(Stt_338_Schatten,"FM_03");//SitAround

	//------------------Gorn----------------------------
	Wld_InsertNpc				(PC_FighterFM	,"FM02"		);//


	//------------------Gardisten----------------------------
	Wld_InsertNpc				(Grd_246_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_284_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_286_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_287_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_288_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_289_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_290_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_291_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_292_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_293_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_294_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_295_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_296_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_297_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_298_Gardist,"FM03"		);//
	Wld_InsertNpc				(Grd_299_Gardist,"FM03"		);//
	
	//-------------------Buddler------------------------------
	
	Wld_InsertNpc				(Vlk_5001_Buddler,"FM_03");//PickOre
	Wld_InsertNpc				(Vlk_5002_Buddler,"FM_105");//PickOre
	Wld_InsertNpc				(Vlk_5003_Buddler,"FM_103");//PickOre
	Wld_InsertNpc				(Vlk_5004_Buddler,"FM_102");//PickOre
	Wld_InsertNpc				(Vlk_5005_Buddler,"FM_159");//MineBellows
	Wld_InsertNpc				(Vlk_5006_Buddler,"FM_89");//PickOre
	Wld_InsertNpc				(Vlk_5007_Buddler,"FM_88");//PickOre

	
	//--------------------Zielperson--------------------------
	
	
	//--------------------Minecrawler-------------------------
	
	
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_01");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_04");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_05");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_06");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_09");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_14");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_17");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_29");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_28");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_32");//
	Wld_InsertNpc				(MinecrawlerWarrior		, "FP_ROAM_CRAWLER_34");//
	
	//-----------------------Meatbug-------------------------------------------
	
	Wld_InsertNpc				(FreemineOrc,"FM_03");//WaitforRescue
};

FUNC VOID INIT_FREEMINE ()	
{
	//-------------------Fackeln-----------------------------
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
   
	//-------- Attit�den initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	
	INIT_GLOBAL(); 
	//INIT_GLOBAL();
	//LeGo_Init(LeGo_All);
};

/**********************************************************
*                                                         *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE	 					      *
*												          *
*												          *
**********************************************************/






 