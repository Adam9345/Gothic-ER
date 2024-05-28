// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel)
{
	Kapitel = neues_Kapitel;

	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if		(neues_Kapitel == 1)
	{
		B_GivePatrosFoodCH1 ();
		
		B_GiveMartinItemsCH1 ();
		B_GiveJimItemsCH1 ();
		B_Give_StanleyChapter1Ingredients ();
		B_Give_ZerronChapter1Books ();
		B_GiveTradeInv_Silas1();
		B_Give_HunoChapter1Ingredients();
		B_Give_BriamChapter1Ingredients ();
		
		PrintDebugNpc	(PD_MISSION, "---=== DAS ERSTES KAPITEL ===---");

		introducechapter ("Rozdzia³ 1","Witamy w Kolonii!","chapter1.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 1","Welcome to the colony","chapter1.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS ZWEITE KAPITEL ===---");

		//////////////////////////////////////////////////////////
		// ANULOWANE ZADANIA
		//////////////////////////////////////////////////////////
		  Npc_ExchangeRoutine(SLD_704_Blade,"Start");
		
		
		
		if (MIS_DraxTest == LOG_RUNNING)
		{
		B_LogEntry               (CH1_DraxTest,"Nie wykna³em testu Draxa na czas. Teraz jest ju¿ za póŸno na takie sprawy.");
		Log_SetTopicStatus       (CH1_DraxTest, LOG_FAILED);
		MIS_DraxTest = LOG_FAILED;
		};
		
		if (Diego_BringList == LOG_RUNNING)
		{
		Diego_BringList = LOG_FAILED; 
		Log_SetTopicStatus	(CH1_BringList,LOG_FAILED);
		B_LogEntry    		(CH1_BringList,"Raczej nie uda mi siê ju¿ wykonaæ tego zadania.");
		};
		
		if (Mod_Story_RunRebelInNC == FALSE) && (LeftyDead == FALSE)
		{
		B_Story_BauRebellion ();
		};
		
		
		//-------- Händler auffüllen --------
		B_Give_FiskChapter2Weapons ();
		B_Give_DarrionChapter2Weapons ();
		B_Give_SharkyChapter2Weapons ();
		B_Give_BaalCadarChapter2Runes ();
		B_Give_TorrezChapter2Runes ();
		B_Give_CronosChapter2Runes ();
		B_GiveRiordianChapter2Potions ();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons ();
		B_GivePatrosFoodCH2 ();
		B_GiveMartinItemsCH2 ();
		B_GiveJimItemsCH2 ();
		B_Give_HuanChapter2Ingredients ();
		B_Give_MilChapter2Ingredients ();
		B_Give_StanleyChapter2Ingredients ();
		B_Give_ZerronChapter2Books ();
		B_GiveManheimCH2 ();
		B_Give_TradeInv_Kagan2();
		B_GiveTradeInv_Silas2();
		B_Give_Items_GavilianCh2();
		B_Give_HunoChapter2Ingredients();
		B_Give_BriamChapter2Ingredients ();
		B_GiverivFishFoodCH2();
		//-------- Oberwelt-Monster nochmal "nachfüllen" --------	
		B_Story_RespawnOW();
		Wld_InsertNpc	(NOV_40074_DeadNovize,"WP_GRU_DEAD_NOV");
     	Wld_InsertNpc		(Wolf,"FP_ROAM_OW_WOLF_GRU1");
	    Wld_InsertNpc		(Wolf,"FP_ROAM_OW_WOLF_GRU3");
	    Wld_InsertNpc		(Wolf,"FP_ROAM_OW_WOLF_GRU2");
		
		//-------- InExtremo vorbereiten --------
		B_InsertInExtremo();

		if (Hlp_IsValidNpc (VLK_580_Grim))
		&& (!Npc_IsDead (VLK_580_Grim)) {
			Mdl_SetVisualBody (VLK_580_Grim,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  2, stt_ARMOR_M);
			Npc_RemoveInvItems (VLK_580_Grim, VLK_ARMOR_M,1);
			EquipItem (VLK_580_Grim, ItMw_1H_Sword_02);
		};
		
		introducechapter ("Rozdzia³ 2","Gniazdo pe³zaczy","chapter2.tga","levelup.wav", 6000);
		
		//introducechapter ("Chapter 2","The Minecrawler's nest","chapter2.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{
	Wld_InsertItem			(ItRi_RegenManaS,"FP_ITEM_REG_MANARING");
	
	if (Zdrajca_S = LOG_RUNNING)
	{
	Log_SetTopicStatus	(PSI_Zdrajca,	LOG_FAILED);
	B_LogEntry          (PSI_Zdrajca,"Na wykonanie tego zadania jest ju¿ za póŸno... Cor Kalom opóœci³ obóz bractwa.");
	};
	if (BobaSwordR == TRUE)
	{
	Log_SetTopicStatus	(MieczGorBoby,	LOG_FAILED);
	B_LogEntry               (MieczGorBoby,"Gor Boba opóœci³ obóz bractwa wraz z Cor Kalomem.");
	
	};
	if (PerrickGiftForCalom == LOG_RUNNING)
	{
	Log_SetTopicStatus	     (WiazankaDlaCorCaloma,	LOG_FAILED);
	B_LogEntry               (WiazankaDlaCorCaloma,"Cor Kalom opuœci³ obóz bractwa, teraz Perrick nie ma komu wywin¹æ psikusa.");
	
	};
	
	if (MIS_dlugfletchera == LOG_RUNNING)
    {
	Log_SetTopicStatus	(Dlug,	LOG_FAILED);
	B_LogEntry			(Dlug,	"Nie mam teraz czasu na takie zabawy, Fletcher musi radziæ sobie sam.");
	
	};
		PrintDebugNpc	(PD_MISSION, "---=== DAS DRITTE KAPITEL ===---");
		//myœliwi
		Npc_ExchangeRoutine (NON_5600_Alex,	"lochy");
		
		//magnaci nieœmiertelnoœæ
		var C_NPC blizna; blizna 	= Hlp_GetNpc (EBR_101_Scar);
		blizna.flags = 0;
		
		B_ExchangeRoutine	(Sld_728_Jarvis,"start"); 
		
		//znikanie ze œwiata NPC Er.14.
		B_ExchangeRoutine	(TPL_1406_Templer,"flee"); //ochroniarz kaloma
		//B_ExchangeRoutine	(TPL_1455_GorBoba,"flee"); //gor boba
		RemoveNPC (TPL_3927_GorBoba, "flee");
		//-------- InExtremo wegräumen --------
		B_InExtremoStopMusic();	
		B_KillInExtremo();

		//-------- Kapitel 2 Missionen nochmal auf Success setzen --------	
		YBerion_BringFocus 		= LOG_SUCCESS;
		CorKalom_BringMCQBalls 	= LOG_SUCCESS;
		CorKalom_BringBook 		= LOG_SUCCESS;

		
		//-------- Waffenhändler auffrischen --------
		B_Give_FiskChapter3Weapons ();
		B_Give_DarrionChapter3Weapons ();
		B_Give_SharkyChapter3Weapons ();
		B_Give_BaalCadarChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_CronosChapter3Runes ();
		B_GiveRiordianChapter3Potions ();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons ();
		B_Give_SkipChapter3Weapons ();
		B_GivePatrosFoodCH3 ();
		B_GiveMartinItemsCH3 ();
		B_GiveJimItemsCH3 ();
		B_Give_HuanChapter3Ingredients ();
		B_Give_MilChapter3Ingredients ();
		B_Give_StanleyChapter3Ingredients ();
		B_Give_ZerronChapter3Books ();
		B_GiveManheimCH3 ();
		B_Give_TradeInv_Kagan3();
		B_GiveTradeInv_Silas3();
		B_Give_Items_GavilianCh3();
		B_Give_BriamChapter3Ingredients ();
		B_GiverivFishFoodCH3();
		//-------- Oberwelt-Monster nochmal "nachfüllen" --------	
		B_Story_RespawnOW_Ch3();

		//-------- Video abspielen --------
		PlayVideo		("GREATPRAYER.BIK");

		//-------- Y'Berion ins Koma fallen lassen --------
		var C_NPC YBerion;
		YBerion = Hlp_GetNpc(Gur_1200_YBerion);
		YBerion.flags = 0;					// IMMORTAL-Flag löschen
		Npc_ChangeAttribute	(YBerion, ATR_HITPOINTS, -YBerion.attribute[ATR_HITPOINTS_MAX]+1);
		YBerion.flags = NPC_FLAG_IMMORTAL;	// IMMORTAL-Flag wieder setzen
		Npc_ExchangeRoutine (YBerion,	"DRAINED");
		AI_ContinueRoutine	(YBerion);
		// BAAL LUKOR WORLD
		Npc_ExchangeRoutine (GUR_1213_BaalLukor_world,"delte"); //przenosi siê do waypointu poza œwiatem
		// ŒWI¥TYNIA NA W SUMIE TO NIE WIEM
		Wld_InsertNpc	(OrcShaman,"POSZ1");
		Wld_InsertNpc	(OrcShaman,"TPL_2");
		Wld_InsertNpc	(OrcShaman,"TPL3");
		Wld_InsertNpc	(OrcShaman,"TPL_4");
	
		Wld_InsertNpc	(TPL_7899_Templer,"TPL_4");
	
	
		//CreateInvItem (GRD_233_Bloodwyn, GRD_ARMOR_H);
		Wld_InsertNpc	(OrcWarrior1,"OW_PATH_RUIN_9");
		Wld_InsertNpc	(OrcWarrior1,"POSZ2");
		Wld_InsertNpc	(OrcWarrior1,"OFIARA2");
		Wld_InsertNpc	(OrcWarrior1,"OFIARA1");
		
		//---GROSSE BESCHWÖRUNG TRIGGER NPCS ----------------------- M.F.
		//---HIER WERDEN DIE IN DEN TRIGGERINFOS GESETZTEN WAHRNEHMUNGEN WIEDER DEFAULT GESETZT--- M.F.
		var C_NPC Templer;		Templer	 	 = Hlp_GetNpc	(TPL_1431_Templer);
		Templer.senses =		hero.senses; 
		
		var C_NPC Templer_1;	Templer_1	 	 = Hlp_GetNpc	(TPL_1430_Templer);
		Templer_1.senses =		hero.senses;
		
		var C_NPC Novize;		Novize	     = Hlp_GetNpc	(NOV_1319_Novize);
		Novize.senses =			hero.senses;
		
		var C_NPC Novize_1;		Novize_1	 	 = Hlp_GetNpc	(NOV_1319_Novize);
		Novize_1.senses =		hero.senses;
	
	    	CreateInvItem (BAN_1605_Rocky, ItMw_2H_AxeHevay_100);
	        AI_EquipBestMeleeWeapon	(BAN_1605_Rocky);            
	
	
		if (Chapters_Spawn == true)
		{ 
		B_Story_RespawnOW();
		};
		introducechapter ("Rozdzia³ 3","Staro¿ytna magia","chapter3.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 3","Artifacts of ancient power","chapter3.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		
	 if (GRU_STRMIS == TRUE)
	 {
	  Log_SetTopicStatus(Gruzlik,Log_Failed);
	  B_LogEntry               (Gruzlik,"Zbyt d³ugo zwleka³em, Fritz jest pewnie teraz w lepszym œwiecie...");
	  Fritz_D_pas = TRUE;
	  B_KillNPC(SLD_40064_Fritz);
	 };
     if (Zachcianki == LOG_RUNNING)
	 {
	 Log_SetTopicStatus(ZachciankiDiliona,LOG_FAILED);
	 B_LogEntry(ZachciankiDiliona,"Mam wa¿niejsze sprawy na g³owie ni¿ bieganie za jedzeniem.");
	 };
		  PrintDebugNpc	(PD_MISSION, "---=== DAS VIERTE KAPITEL ===---");
		  Npc_ExchangeRoutine(NON_40139_Glest,"AM");
		  Npc_ExchangeRoutine(SFB_40063_Ziggy,"Karczma");
		  Npc_ExchangeRoutine(BAN_1612_Skaza,"BQ");
		  Npc_ExchangeRoutine(STT_40143_Hargos,"CH4");
		  Npc_ExchangeRoutine(ORG_40045_Grabarz,"camp");
	      //Wld_SendTrigger("EVT_OC_MAINGATE01_01");
		  
		//////////////////////////////////////////////////////////
		// ANULOWANE ZADANIA
		//////////////////////////////////////////////////////////
		if (MIS_EmanuelDelivery == LOG_RUNNING)
		{
		B_LogEntry               (CH1_EmanuelDelivery,"Na tê sprawê jest ju¿ po prostu za póŸno.");
		Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_FAILED);
		MIS_EmanuelDelivery = LOG_FAILED;
		};
		
		if (MIS_Food_Patter == LOG_RUNNING)
		{
		B_LogEntry               (CH1_Food_Patter,"Stra¿nicy zaatakuj¹ mnie, jeœli zbli¿ê siê do nich choæby na krok. To zadanie nie ma ju¿ szans na powodzenie.");
		Log_SetTopicStatus       (CH1_Food_Patter, LOG_FAILED);
		MIS_Food_Patter = LOG_FAILED;
		};
		
		if (MIS_ActionOM == LOG_RUNNING)
		{
		B_LogEntry               (CH1_ActionOM,"Czas na wykonanie tego zadania dobieg³ koñca. Spapra³em robotê.");
		Log_SetTopicStatus       (CH1_ActionOM, LOG_FAILED);
		MIS_ActionOM = LOG_FAILED;
		};
		/////////////////////////////////////////////////////////
		//Prin| Przegrupowania Orków
		/////////////////////////////////////////////////////////
		AI_Teleport				(NON_2703_MYSLIWY, "WP_PRIN_PRZEGRUPOWANIA");
		Npc_ExchangeRoutine(NON_2703_MYSLIWY,"Przegrupowania");
		
		////////////////////////////////////////////////////////
		
	//	AI_EquipArmor (GRD_233_Bloodwyn, GRD_ARMOR_H);
     	var C_NPC Bloodwyn; Bloodwyn = Hlp_GetNpc(GRD_233_Bloodwyn);
     	CreateInvItem     (Bloodwyn, GRD_ARMOR_H);
		Mdl_SetVisualBody (GRD_233_Bloodwyn,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 18,  1, GRD_ARMOR_H);
		
		//////////////////////////////////////////////////////////
		// ZABÓJCA-SNAKE RUTYNA
		//////////////////////////////////////////////////////////
		Npc_ExchangeRoutine (NON_7852_Snake,"hunter");
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// PRZYPRAWY SNAFA U BAAL TARANA
		//////////////////////////////////////////////////////////
		var C_NPC taran; taran = Hlp_GetNpc(NOV_1331_BaalTaran);
		CreateInvItem   (taran, ItMi_SnafBag);
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// BANDYTA PRZY LESIE
		//////////////////////////////////////////////////////////
		var C_NPC wd_7044; wd_7044 = Hlp_GetNpc(WD_7044_Bandit);
		B_ChangeGuild   		 (wd_7044,GIL_GRD);  
		B_SetPermAttitude	(wd_7044,	ATT_HOSTILE);
		//////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////
		// BANDYCI MAJ¥CY STAL
		//////////////////////////////////////////////////////////
		var C_NPC banditS1; banditS1 = Hlp_GetNpc(NON_5051_Raeuber);
		var C_NPC banditS2; banditS2 = Hlp_GetNpc(NON_5052_Raeuber);
		B_ChangeGuild   		 (banditS1,GIL_GRD);  
		B_SetPermAttitude	(banditS1,	ATT_HOSTILE);
		
		B_ChangeGuild   		 (banditS2,GIL_GRD);  
		B_SetPermAttitude	(banditS2,	ATT_HOSTILE);
		//////////////////////////////////////////////////////////
		
		if (MIS_MissedSpy == LOG_SUCCESS)
		{
		B_ExchangeRoutine (TPL_3928_GorNaLin,"gardist");
		//idzie pilnowaæ bramy do Obozu
		};
		//if (MIS_ScarMurder == LOG_RUNNING)
		//{
		//B_LogEntry                     (CH3_ScarMurder,"Nie mam dostêpu do Starego Obozu. Nie uda mi siê wykonaæ tego zadania. Poza tym, nie ma teraz na to czasu.");
		//Log_SetTopicStatus       (CH3_ScarMurder, LOG_FAILED);
	//	MIS_ScarMurder = LOG_FAILED;
		//};
		
		var C_NPC scorpio; scorpio 	= Hlp_GetNpc (GRD_205_Scorpio);
		
		B_ExchangeRoutine (scorpio,"BANNISHED");
		B_ChangeGuild    (scorpio,GIL_NONE);  
		B_SetPermAttitude	(scorpio,	ATT_NEUTRAL);
		scorpio.flags = NPC_FLAG_IMMORTAL;
		
		
		B_ChangeGuild    (STT_336_Cavalorn,GIL_NONE);
		B_ChangeGuild    (KDF_404_Xardas,GIL_DMB);
		//stra¿nicy bram
		var C_NPC wache1_elite	; wache1_elite 	= Hlp_GetNpc (GRD_218_Gardist);
		wache1_elite.Npctype = NPCTYPE_AMBIENT;
		var C_NPC wache2_elite	; wache2_elite 	= Hlp_GetNpc (GRD_245_Gardist);
		wache1_elite.Npctype = NPCTYPE_AMBIENT;
		
		//magnaci nieœmiertelnoœæ
		var C_NPC arto; arto 	= Hlp_GetNpc (EBR_102_Arto);
		arto.flags = 0;
		
		var C_NPC fergus; fergus 	= Hlp_GetNpc (Grd_40054_Fergus);
		fergus.flags = 0;
		
		//morok i patter
		var C_NPC morok	; morok 	= Hlp_GetNpc (GRD_7894_Morok	);
		morok.Npctype = NPCTYPE_main;
		morok.flags = 0;
		var C_NPC patter; patter 	= Hlp_GetNpc (GRD_7895_Patter	);
		patter.Npctype = NPCTYPE_main;
		patter.flags = 0;
		
		//to powinno dzia³aæ w opuszczonej kopalni
		B_ExchangeRoutine 			(NON_2094_Glest,"START");//fix 1.4 b
		Wld_InsertNpc		(NON_2094_Glest,"GLEST_VM");
		
		//er 1.4 fix kurwa 
		Wld_InsertNpc		(VLK_586_Grimes,"LOCATION_01_07");
		B_ExchangeRoutine 	(VLK_586_Grimes,"cave");
		B_ChangeGuild       (VLK_586_Grimes,GIL_NONE);  
		B_SetPermAttitude	(VLK_586_Grimes,ATT_NEUTRAL);
		
		Wld_InsertNpc		(STT_302_Viper,"LOCATION_01_07");
		B_ExchangeRoutine   (STT_302_Viper,"cave");
		B_ChangeGuild       (STT_302_Viper,GIL_NONE);  
		B_SetPermAttitude	(STT_302_Viper,	ATT_NEUTRAL);
		
		Wld_InsertNpc		(VLK_585_Aleph,"LOCATION_01_07");
		B_ExchangeRoutine 	(VLK_585_Aleph,"cave");
		B_ChangeGuild       (VLK_585_Aleph,GIL_NONE);  
		B_SetPermAttitude	(VLK_585_Aleph,	ATT_NEUTRAL);
		
		Wld_InsertNpc		(VLK_584_Snipes,"LOCATION_01_07");
		B_ExchangeRoutine   (VLK_584_Snipes,"cave");
		B_ChangeGuild       (VLK_584_Snipes,GIL_NONE);  
		B_SetPermAttitude	(VLK_584_Snipes,ATT_NEUTRAL);
		//NON_2094_Glest.flags = 0;	
		//Wld_InsertNpc				(NON_2094_Glest,"GLEST_VM");	
		//NOC KRUKA W KOLONII
		// GOTHIC 2 ADDON
		B_ExchangeRoutine   (NOV_1357_Fortuno,"nockruka");
		B_ChangeGuild       (NOV_1357_Fortuno,GIL_NONE);  
		B_SetPermAttitude	(NOV_1357_Fortuno,	ATT_NEUTRAL);
		

		
		B_ExchangeRoutine   (GRD_210_Scatty,"nockruka");
		B_ChangeGuild       (GRD_210_Scatty,GIL_NONE);  
		B_SetPermAttitude	(GRD_210_Scatty,	ATT_NEUTRAL);
		
	
		
		B_ExchangeRoutine   (Grd_200_Thorus,"nockruka");
		B_ChangeGuild       (Grd_200_Thorus,GIL_NONE);  
		B_SetPermAttitude	(Grd_200_Thorus,	ATT_NEUTRAL);
		
		B_ExchangeRoutine   (STT_311_Fisk,"nockruka");
		B_ChangeGuild       (STT_311_Fisk,GIL_NONE);  
		B_SetPermAttitude	(STT_311_Fisk,	ATT_NEUTRAL);
		
		B_ExchangeRoutine   (BAN_1600_Miguel,"nockruka");
		B_ChangeGuild       (BAN_1600_Miguel,GIL_NONE);  
		B_SetPermAttitude	(BAN_1600_Miguel,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (VLK_581_Snaf,"nockruka");
		B_ChangeGuild     (VLK_581_Snaf,GIL_NONE);  
		B_SetPermAttitude (VLK_581_Snaf,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (VLK_538_Huno,"nockruka");
		B_ChangeGuild     (VLK_538_Huno,GIL_NONE);  
		B_SetPermAttitude (VLK_538_Huno,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (NON_5677_Stary,"nockruka");
		B_ChangeGuild     (NON_5677_Stary,GIL_NONE);  
		B_SetPermAttitude (NON_5677_Stary,	ATT_NEUTRAL);
		
		B_ExchangeRoutine (SFB_1000_Senyan,"nockruka");
		B_ChangeGuild     (SFB_1000_Senyan,GIL_NONE);  
		B_SetPermAttitude (SFB_1000_Senyan,ATT_NEUTRAL);
		
		B_ExchangeRoutine (GRD_255_Fletcher,"nockruka");
		B_ChangeGuild     (GRD_255_Fletcher,GIL_NONE);  
		B_SetPermAttitude (GRD_255_Fletcher,ATT_NEUTRAL);
		
		B_ExchangeRoutine (STT_329_Dexter,"nockruka");
		B_ChangeGuild     (STT_329_Dexter,GIL_NONE);  
		B_SetPermAttitude (STT_329_Dexter,ATT_NEUTRAL);
		//-------- Waffenhändler auffrischen --------
		B_Give_ScorpioChapter4Weapons ();
		B_Give_DarrionChapter4Weapons ();
		B_Give_SharkyChapter4Weapons ();
		B_Give_BaalCadarChapter4Runes ();
		B_Give_XardasChapter4Runes ();
		B_Give_CronosChapter4Runes ();
		B_GiveRiordianChapter4Potions ();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();	
		B_GivePatrosFoodCH4 ();
		B_GiveMartinItemsCH4 ();
		B_GiveJimItemsCH4 ();
		B_Give_HuanChapter4Ingredients ();
		B_Give_MilChapter4Ingredients ();
		B_Give_StanleyChapter4Ingredients ();
		B_Give_ZerronChapter4Books ();
		B_Give_TradeInv_Kagan4();
		B_GiveTradeInv_Silas4();
		B_Give_Items_GavilianCh4();
		B_Give_BriamChapter4Ingredients ();
		B_GiverivFishFoodCH4();
		//-------- globale Variablen --------
		Saturas_BringFoci = 5;

		//-------- Missionsgegenstände --------
		CreateInvItem		(hero,	ItArRuneTeleport2);

		//-------- Tagebucheinträge --------
		Log_CreateTopic		(CH4_Firemages,	LOG_MISSION);
		Log_SetTopicStatus	(CH4_Firemages,	LOG_RUNNING);
		B_LogEntry			(CH4_Firemages,"Saturas, przywódca Magów Wody poprosi³ mnie o ostatni¹ przys³ugê. Aby wysadziæ w powietrze kopiec rudy, magowie z Nowego Obozu potrzebuj¹ pomocy swych braci z Krêgu Ognia. Nie wiem jeszcze, w jaki sposób uda mi siê przekonaæ magów Gomeza do wspó³pracy, ale spróbujê wymyœliæ coœ po drodze.");

		//-------- Szene am Damm --------
		B_ExchangeRoutine	(SLD_700_LEE,"DAMNPAST"); 
		B_ExchangeRoutine	(BAU_935_HOMER,"DAMNPAST"); 
		
		//-------- Spielergilde ändern --------
		oldHeroGuild = Npc_GetTrueGuild(hero);
		if	C_NpcBelongsToOldCamp(hero) || (Npc_GetTrueGuild (hero) == GIL_EBR)  //fix 1.24
		{
			Npc_SetTrueGuild(hero,	GIL_NONE);		// "Ausgestoßener" aus dem Alten Lager
			hero.guild = GIL_NONE;
			B_SetRoguesToNeutral ();
		};
		//-------- AL-Tore schließen --------
		B_ExchangeRoutine	(GRD_228_Gardist, "FMTaken");	//Hinteres Tor
		B_ExchangeRoutine	(GRD_230_Gardist, "FMTaken");	//Haupttor
		B_ExchangeRoutine	(GRD_280_Gardist, "FMTaken");	//Inneres Tor
			
		//-------- Windenwachen verwundbar machen --------
		B_ClearImmortal		(Grd_228_Gardist);				//Hinteres Tor     
		B_ClearImmortal		(Grd_230_Gardist);              //Haupttor    
		B_ClearImmortal		(Grd_280_Gardist);              //Inneres Tor 
        B_ClearImmortal		(GRD_211_Skip);
		//-------- Feuermagier töten --------
		B_KillNpc			(Kdf_400_Rodriguez);	
		B_KillNpc			(Kdf_401_Damarok);	
		B_KillNpc			(Kdf_402_Corristo);	
		//B_ExchangeRoutine (Kdf_402_Corristo,"nope");
		B_KillNpc			(Kdf_403_Drago);

		
		Npc_ExchangeRoutine (KDF_405_Torrez,"CH4");
		Wld_InsertNpc		(Kdf_40142_Torrez,"OC1");
		B_KillNpc			(Kdf_40142_Torrez);
		//1.4.5.v7
		B_KillNpc			(STT_2078_KDF_NOV);
		B_KillNpc			(STT_2079_KDF_NOV);
		B_KillNpc			(STT_2080_KDF_NOV);	
		
		
		//-------- Gäste im Alten Lager töten --------
		B_KillNpc			(Nov_1330_BaalParvez);
		B_KillNpc			(Nov_1331_BaalTaran);
		//B_KillNpc			(Tpl_1422_GorHanis);
		B_ExchangeRoutine	(Tpl_1422_GorHanis, "life");
		B_KillNpc			(Sld_729_Kharim);

		//-------- TAs von Diego und Milten ändern --------
		B_ExchangeRoutine	(PC_Thief,	"OCWait");
		B_ExchangeRoutine	(PC_Mage,	"OCWait");
		B_ChangeGuild		(PC_Thief,	GIL_KDF);		// "Ausgestoßener" aus dem Alten Lager
		B_SetPermAttitude	(PC_Thief,	ATT_FRIENDLY);
		B_SetPermAttitude	(PC_Mage,	ATT_FRIENDLY);
		
		//-------- permanente Attitüden ändern --------
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES_FMTAKEN");
		B_InitMonsterAttitudes		();

		//-------- Kampfgruppe vor Haupttor --------
		//B_ExchangeRoutine	(GRD_255_Fletcher,	"FMTaken");	// Verstärkung vor das Haupttor (Anführer)
		Wld_InsertNpc		(GRD_261_Brandick,	"OC1");
		B_ExchangeRoutine	(GRD_261_Brandick,	"FMTaken");
		B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken");	// Verstärkung vor das Haupttor
		B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken");	// Verstärkung vor das Haupttor
		B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken");	// Verstärkung vor das Haupttor (Fernkämpfer)
		B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken");	// reguläre Wache am Haupttor
		B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken");	// reguläre Wache am Haupttor

		//-------- Kampfgruppe vor Hinterem Tor --------
		//1.24 fixed
		B_ExchangeRoutine	(GRD_233_Bloodwyn,	"FMTaken");	// Verstärkung vor das Hinterem Tor (Anführer)
		//Wld_InsertNpc		(GRD_262_Aaron,"OC1");//fixed Aaron
		//B_ExchangeRoutine 	(GRD_262_Aaron,"FMTaken");
		B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken");	// Verstärkung vor das Hinterem Tor
		B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
		B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken");	// reguläre Wache am Hinteren Tor
		B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken");	// reguläre Wache am Hinteren Tor
		
		//------------ Die Templer gehen nicht mehr zur Alten Mine ---------------------
		
		B_ExchangeRoutine	(TPL_1439_GorNaDrak,	"FMTaken");
		B_ExchangeRoutine	(TPL_1440_Templer,	"FMTaken");
		

		/*
		// Gothic Edycja rozszerzona
		// Skrypt 4 rozdzia³u
		// Ostatnia modyfikacja: 26 lipca 2012
		*/
		
		//--- Talas jako handlarz --------
		B_ExchangeRoutine	(NOV_1300_Talas,	"start2");
		CreateInvItems(NOV_1300_Talas, itmijoint_1, 30);
		CreateInvItems(NOV_1300_Talas, itmijoint_2, 20);
		CreateInvItems(NOV_1300_Talas, itmijoint_3, 10);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton, 10);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_1, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_2, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_3, 5);
		CreateInvItems(NOV_1300_Talas, ItMi_Tuton_4, 5);
		
		// mod 27 sierpieñ! // 30 sierp
		// kusznicy 22 wrzesieñ
		
		CreateInvItems  (GRD_3913_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3913_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3913_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3906_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3906_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3906_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3905_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3905_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3905_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3904_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3904_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3904_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3908_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3908_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3908_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3914_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3914_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3914_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3912_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3912_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3912_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3911_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3911_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3911_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3910_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3910_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3910_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3907_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3907_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3907_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		CreateInvItems  (GRD_3909_Kusznik,ItRw_Crossbow_04,1);
		EquipItem		(GRD_3909_Kusznik, ItRw_Crossbow_04);
		
		//GRD_3909_Kusznik.attribute[ATR_DEXTERITY] = 100;
		
		//-----------------ARTO ***fix*** 1.2
		Npc_ExchangeRoutine (EBR_102_Arto,"kox");
		B_KillNpc			(EBR_102_Arto);
		
		//------ MUD --------
		var C_NPC mud; mud 	= Hlp_GetNpc (Vlk_574_Mud);
		
		B_ExchangeRoutine (mud,"away");
		B_ChangeGuild    (mud,GIL_NONE);  
		B_SetPermAttitude	(mud,	ATT_NEUTRAL);
		
		var C_NPC jim; jim 	= Hlp_GetNpc (STT_2077_Jim);
		
		B_ExchangeRoutine (jim,"CH4");
		B_ChangeGuild    (jim,GIL_NONE);  
		B_SetPermAttitude	(jim,	ATT_NEUTRAL);
		
		

		
		
		//----------------Ratford-----------------------
		B_KillNpc			(ORG_818_Ratford);
		Npc_ExchangeRoutine (ORG_864_Raeuber,"pupil");
		Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
		Npc_ExchangeRoutine (ORG_869_Raeuber,"pupil");
		
		//---------------Cavalorn-------------------------
		EquipItem			(NON_3071_Vart, VartSword);
		NPC_ExchangeRoutine (NON_3071_Vart,"ded");  
		B_KillNpc			(NON_3071_Vart);
		Wld_InsertNpc				(NON_4005_MadNovize,"POGAN1");	
		Wld_InsertNpc				(NON_4006_MadNovize,"POGAN2");	
		Wld_InsertNpc				(NON_4007_MadNovize,"POGAN3");	
		//Npc_ExchangeRoutine			(STT_336_Cavalorn, "pac");
		Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
		// Inne rutyny
		// -------------Obóz przy kopalni--------------------
		B_ExchangeRoutine (GRD_7001_Artegor,"BOSS");
		Npc_ExchangeRoutine	(GRD_7008_Tukash,	"ucieczka");
		B_ChangeGuild    (Vlk_564_Jesse,GIL_NONE);
		B_ChangeGuild    (GRD_7008_Tukash,GIL_BAU);
		Npc_ExchangeRoutine	(Vlk_564_Jesse,	"ucieczka");
		B_ChangeGuild    (VLK_530_Guy,GIL_NONE);
		Npc_ExchangeRoutine (VLK_530_Guy, "bra");
		B_SetPermAttitude	(VLK_530_Guy,	ATT_NEUTRAL); //1.24
		Npc_ExchangeRoutine (NON_2056_Patrick ,"uciek");
		B_ChangeGuild    (NON_2056_Patrick,GIL_NONE);  
		B_SetPermAttitude	(NON_2056_Patrick,	ATT_NEUTRAL);
		

		
		
		//-------------Nowicjusze - kamieñ ogniskuj¹cy---------
		B_SetPermAttitude	(NON_4001_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4002_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4003_MadNovize,	ATT_HOSTILE);
		B_SetPermAttitude	(NON_4004_MadNovize,	ATT_HOSTILE);
		
		//--------------- Kapitel 4 wird angezeigt -------------------------------
		if (Chapters_Spawn == true)
		{ 
		B_Story_RespawnOW_Ch4();
		};
		introducechapter ("Rozdzia³ 4","Wielkie zmiany","chapter4.tga","levelup.wav", 6000); 
		//---------------------------------------------------------------------------------------------ER+
		
		AI_Teleport        (ORG_842_Shrike,  "WP_KRZYKACZ_CH4");
		Npc_ExchangeRoutine(ORG_842_Shrike,  "CH4");
		Wld_InsertNpc	   (ORG_40141_Shrike,"NC_DAM");
		
		Npc_ExchangeRoutine(SFB_40011_Casper,  "CH4");
		Npc_ExchangeRoutine(ORG_40138_Gavilan,  "OH");
		
		B_SetPermAttitude	(GRD_7008_Tukash,	ATT_FRIENDLY);
		
		B_ChangeGuild( Grd_40062_John, GIL_GRD );

		var C_NPC manheim; manheim 	= Hlp_GetNpc (GRD_2036_Karczmarz);
	  	manheim.flags = 0;
		Npc_ClearInventory(manheim);

		var C_NPC perrick; perrick 	= Hlp_GetNpc (STT_40052_Perrick);
	  	perrick.flags = 0;
		//Npc_ClearInventory(manheim);
	}
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS FÜNFTE KAPITEL ===---");
		
		if (JO_END != TRUE)
		{
		 Wld_SendTrigger("GATE_JO");
		 
		 if (Npc_GetTalentSkill(hero, NPC_TALENT_2H)) > (Npc_GetTalentSkill(hero, NPC_TALENT_1H))
		 {
			Wld_InsertItem			(ItMw_2h_NightSword,"FP_ITEM_CH5_WEAPON");
		 }
		 else 
		 {
	    	Wld_InsertItem			(ItMw_1h_Sword_ElBastrado,"FP_ITEM_CH5_WEAPON"); 
		 };
		 
		};
			  //---------------------------------------------------------------------------------BALAM
		  Wld_InsertNpc 	(NONE_40157_Balam,"OCC_BARONS_HALLWAY_MIDDLE");
		  B_ChangeGuild     (STT_324_Balam,GIL_MEATBUG );
	      Npc_ExchangeRoutine(STT_324_Balam,"CH4");
		  B_ChangeGuild     (EBR_108_Velaya,GIL_MEATBUG );
          B_SetPermAttitude	(EBR_108_Velaya,ATT_FRIENDLY);	
          B_SetPermAttitude	(GRD_219_Stone,	ATT_FRIENDLY);	
          B_ChangeGuild     (GRD_219_Stone,GIL_MEATBUG );
		//zadanie tylko do 5 rozdzia³u
	
		// ³ad de fag? Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Psionic",12, 1,CRW_ARMOR_H);
		//-------- Händler auffüllen --------
		B_Give_ScorpioChapter5Weapons ();
		B_Give_DarrionChapter5Weapons ();
		B_Give_SharkyChapter5Weapons ();
		B_Give_XardasChapter5Runes ();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes ();
		B_GiveRiordianChapter5Potions ();
		
		B_Give_ScorpioChapter6Weapons ();
		B_Give_DarrionChapter6Weapons ();
		B_Give_SharkyChapter6Weapons ();
		B_Give_XardasChapter6Runes ();
		B_GiveRiordianChapter6Potions ();
		B_Give_CavalornChapter6Weapons ();
		B_Give_WolfChapter6Weapons();		
		B_GivePatrosFoodCH5 ();
		B_GiveMartinItemsCH5 ();
		B_GiveJimItemsCH5 ();
		B_Give_HuanChapter5Ingredients ();
		B_Give_MilChapter5Ingredients ();
		B_Give_StanleyChapter5Ingredients ();
		B_Give_ZerronChapter5Books ();
		B_GiveTradeInv_Silas5();
		B_Give_Items_GavilianCh5();
		B_Give_BriamChapter5Ingredients ();
		B_GiverivFishFoodCH5();
		//-------- Tagebucheinträge --------
		B_LogEntry		(CH4_EnterTemple,	"Gorn nie by³ przekonany co do skutecznoœci mojego amuletu ochronnego. Có¿... Wkrótce na w³asnej skórze przekonam siê, kto ma racjê!");
	
		//-------- Oberwelt-Monster nochmal "nachfüllen" --------	
		B_Story_RespawnOW_Ch5();
		
		introducechapter ("Rozdzia³ 5","Stra¿nicy portalu","chapter5.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 5","The custodians of the portal","chapter5.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PrintDebugNpc	(PD_MISSION, "---=== DAS SECHSTE KAPITEL ===---");

		//Magnus - Œwi¹tynia Œni¹cego (respi siê tam po rozmowie z Tokasem)
		var C_NPC magnus; magnus 	= Hlp_GetNpc (NON_5675_Magnus);
		NPC_ExchangeRoutine (magnus,"flee");
		
		//-------- Händler auffüllen --------
		B_Give_XardasChapter6Runes ();
		B_Give_HuanChapter6Ingredients ();
		//-------- URIZIEL aufladen --------
		PlayVideo		("OREHEAP.BIK");	// Schwert aufladen
		if URIZIEL1H_LOAD == false
		{
		CreateInvItem 	(hero, Mythrilklinge02);
		}
		else
		{
		CreateInvItem 	(hero, URIZIEL_Touch_Full);	
		};
		var C_NPC arushat; arushat = Hlp_GetNpc (ORC_Priest_5);
		arushat.npctype = Npctype_Main;
		
		introducechapter ("Rozdzia³ 6","Le¿e Œni¹cego","chapter6.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 6","The sleeper's halls","chapter6.tga","levelup.wav", 6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if (Kapitel == chapter)
	{
		return TRUE;
	};
};
