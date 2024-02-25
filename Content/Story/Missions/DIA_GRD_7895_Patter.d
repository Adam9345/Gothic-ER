//poprawione i sprawdzone -  

//sprawdzone g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patter_EXIT(C_INFO)
{
	npc             = GRD_7895_Patter;
	nr              = 999;
	condition	= DIA_Patter_EXIT_Condition;
	information	= DIA_Patter_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patter_HELLO1 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 1;
   condition    = DIA_Patter_HELLO1_Condition;
   information  = DIA_Patter_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Patter_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patter_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patter_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Patter_HELLO1_03_02"); //Nazywam si� Patter. Pilnuj� naszych zasob�w.
    AI_Output (other, self ,"DIA_Patter_HELLO1_15_03"); //Chyba nie masz zbyt trudnej roboty?
    AI_Output (self, other ,"DIA_Patter_HELLO1_03_04"); //Masz racj�. Jest nas ma�o, dzi�ki czemu to zaj�cie nie jest zbyt uci��liwe.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patter_HELLO2 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 2;
   condition    = DIA_Patter_HELLO2_Condition;
   information  = DIA_Patter_HELLO2_Info;
   permanent	= FALSE;
   description	= "Potrzebujecie czego�?";
};

FUNC INT DIA_Patter_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patter_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_01"); //Potrzebujecie czego�?
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_02"); //Tak. Jest nas dosy� ma�o, a mimo wszystko brakuje nam jedzenia.
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_03"); //M�g�bym co� zorganizowa�.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_04"); //To mi�o, �e chcesz nam pom�c.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_05"); //Zdradz� ci wi�c ma�� tajemnic�.
    AI_Output (other, self ,"DIA_Patter_HELLO2_15_06"); //S�ucham ci�.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_07"); //Wprawny kucharz potrafi oporz�dzi� nawet pozornie niejadalnego zwierza.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_08"); //Mog� nauczy� ci� pozyskiwa� mi�so topielc�w. Jest troch� �ylaste, ale za to bardzo od�ywcze.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_09"); //Przyniesiesz nam... no powiedzmy 10 kawa�k�w tego mi�sa.
    AI_Output (self, other ,"DIA_Patter_HELLO2_03_10"); //Przydadz� si� te� w�troby kretoszczur�w. Pi�� powinno wystarczy�.
    
	//teach log
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Patter potrafi oporz�dzi� kretoszczura z w�troby i sad�a. Mo�e mnie te� nauczy� zbiera� trucizn� jaszczur�w, pazury trolla ziemnego, oraz wycina� mi�so topielc�w.");
	//quest log
	MIS_Food_Patter = LOG_RUNNING;
    Log_CreateTopic          (CH1_Food_Patter, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Food_Patter, LOG_RUNNING);
    B_LogEntry               (CH1_Food_Patter,"Patter nauczy mnie jak pozyska� mi�so topielca i w�trob� kretoszczura. Gdy ju� si� tego naucz�, b�d� musia� przynie�� do obozu 10 kawa�k�w mi�sa topielca i 5 w�tr�b kretoszczur�w.");
	//monster spawn
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Lurker,"OW_LAKE_NC_LURKER_SPAWN01"); 
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC"); 
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(molerat,"SPAWN_OW_MOLERAT_CAVE1_OC");
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Patter_TEACH (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 3;
   condition    = DIA_Patter_TEACH_Condition;
   information  = DIA_Patter_TEACH_Info;
   permanent	= true;
   description	= "Czego mo�esz mnie nauczy�?";
};

FUNC INT DIA_Patter_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patter_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Patter_TEACH_15_01"); //Czego mo�esz mnie nauczy�?
    if (Knows_GetLurkerMeat == false) || (Knows_GetMoleratW == false) || (Knows_GetMoleratT == false) || (Knows_GetTrollGroundClaws == false) || (Knows_GetTrutkaJaszczura == false)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_03_02"); //Wielu rzeczy. Co konkretnie chcesz wiedzie�?
	Info_ClearChoices	(DIA_Patter_TEACH);
	Info_AddChoice		(DIA_Patter_TEACH, DIALOG_BACK, DIA_Patter_TEACH_Back);
    if (Knows_GetLurkerMeat == false) {
        Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie mi�sa topielc�w (150 bry�ek rudy, 1 PN)", DIA_Patter_TEACH_LurkerMeat);
    };
    if (Knows_GetMoleratW == false) {
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie w�troby kretoszczur�w (50 bry�ek rudy, 1 PN)", DIA_Patter_TEACH_MoleratW);
    };
    if (Knows_GetMoleratT == false) {
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie sad�a zwierz�t (50 bry�ek rudy, 1 PN)", DIA_Patter_TEACH_MoleratT);
    };
    if (Knows_GetTrollGroundClaws == false) {
    Info_AddChoice		(DIA_Patter_TEACH, "Usuwanie pazur�w trolla ziemnego (150 bry�ek rudy, 1 PN)", DIA_Patter_TEACH_TrollGroundMoc);
    };
    if (Knows_GetTrutkaJaszczura == false) {
    Info_AddChoice		(DIA_Patter_TEACH, "Zbieranie trucizny jaszczur�w (30 bry�ek rudy, 1 PN)", DIA_Patter_TEACH_TruciznaJaszczurow12);
    };
    }
    else
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_03_03"); //Chyba umiesz ju� wszystko.
        DIA_Patter_TEACH.permanent = false;
    };

   
};
func void DIA_Patter_TEACH_Back ()
{
Info_ClearChoices		(DIA_Patter_TEACH);
};
FUNC VOID DIA_Patter_TEACH_LurkerMeat()
{
    AI_Output (other, self ,"DIA_Patter_TEACH_LurkerMeat_15_01"); //Chc� nauczy� si� usuwa� mi�so topielc�w.
    if (Npc_HasItems (hero, ItMiNugget)>=150) && (Knows_GetLurkerMeat == FALSE)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_02"); //Mi�so trzeba wyci�� z g�rnych cz�ci u n�g.
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_03"); //Nogi topielca s� silnie umi�nione. 
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_04"); //Nale�y powoli odcina� mi�so od ko�ci. 
        AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_05"); //To nie jest zbyt trudne. Dasz rad�.
        B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiej�tno��: Usuwanie mi�sa topielc�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetLurkerMeat = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� pozyskiwania mi�sa topielc�w.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_06"); //Brakuje ci do�wiadczenia!
	 PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_LurkerMeat_03_07"); //Nie masz do�� rudy!
    };

};

FUNC VOID DIA_Patter_TEACH_MoleratW()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50) && (Knows_GetMoleratW == FALSE)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_02"); //W�troba kretoszczura jest umieszczona do�� wysoko.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_03"); //Musisz obr�ci� zwierza na grzbiet i rozci�� jego brzuch.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_04"); //Dalej chyba sobie poradzisz.
        B_GiveInvItems (other, self, ItMiNugget, 50);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiej�tno��: Usuwanie w�troby kretoszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetMoleratW = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� usuwania w�troby kretoszczura i pozyskiwania ��ci przy stole alchemicznym.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_06"); //Brakuje ci do�wiadczenia!
	 PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_MoleratW_03_07"); //Nie masz do�� rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_MoleratT()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50) && (Knows_GetMoleratT == FALSE)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_02"); //Sad�o to cenna rzecz.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_03"); //Wytrawny kucharz potrafi przygotowa� z niego �wietn� zup�.
        AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_04"); //Najwi�cej t�uszczu znajduje si� w podbrzuszu.
        B_GiveInvItems (other, self, ItMiNugget, 50);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiej�tno��: Usuwanie sad�a kretoszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetMoleratT = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� usuwania sad�a kretoszczur�w.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_06"); //Brakuje ci do�wiadczenia!
	 PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_MoleratT_03_07"); //Nie masz do�� rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_TrollGroundMoc()
{
    if (Npc_HasItems (hero, ItMiNugget)>=150)&& (Knows_GetTrollGroundClaws == FALSE)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_02"); //Pazury ziemnego trolla to nie byle jakie trofeum.
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_03"); //Te stwory s� niebezpieczne, jednak mniej gro�ne ni� ich g�rskie odmiany.
        AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_04"); //Pazury s�u�� im do grzebania w ziemi. Wystarczy z�ama� je w odpowiednim miejscu.
        B_GiveInvItems (other, self, ItMiNugget, 150);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiej�tno��: Usuwanie pazur�w ziemnych trolli", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetTrollGroundClaws = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Potrafi� usun�� pazury ziemnych trolli..");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_06"); //Brakuje ci do�wiadczenia!
	 PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH_TrollGroundMoc_03_07"); //Nie masz do�� rudy!
    };
};

FUNC VOID DIA_Patter_TEACH_TruciznaJaszczurow12()
{
    if (Npc_HasItems (hero, ItMiNugget)>=30) && (Knows_GetTrutkaJaszczura == FALSE)
    {
    if (hero.lp >= 1)
    {
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_02"); //Jak wiesz, jaszczury posiadaj� w z�bach do�� siln� trucizn�.
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_03"); //Mo�na j� �atwo pozyska�, gdy� gruczo�y znajduj� si� tu� pod z�bami.
        AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_04"); //Wystarczy troszk� je nadgi��.
        B_GiveInvItems (other, self, ItMiNugget, 30);
    hero.lp = hero.lp - 1;
	PrintScreen	("Nowa umiej�tno��: Pozyskiwanie trucizny jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Knows_GetTrutkaJaszczura = true;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Zbieranie trucizny z martwych jaszczur�w.");
    }
    else
    {
	 AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_06"); //Brakuje ci do�wiadczenia!
	 PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_NEW_10_RED.TGA",2);
    };

    }
    else
    {
	   AI_Output (self, other ,"DIA_Patter_TEACH__TruciznaJaszczurow12_03_07"); //Nie masz do�� rudy!
    };
};
//========================================
//-----------------> HaveFood
//========================================

INSTANCE DIA_Patter_HaveFood (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 4;
   condition    = DIA_Patter_HaveFood_Condition;
   information  = DIA_Patter_HaveFood_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi�e�.";
};

FUNC INT DIA_Patter_HaveFood_Condition()
{
    if (MIS_Food_Patter == LOG_RUNNING)
	&& (Npc_HasItems(other,ItFo_muttonLurker)>=10)
	&& (Npc_HasItems(other,ItFo_MoleratW)>=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HaveFood_Info()
{
    AI_Output (other, self ,"DIA_Patter_HaveFood_15_01"); //Mam to, o co prosi�e�.
    AI_Output (self, other ,"DIA_Patter_HaveFood_03_02"); //Wielkie dzi�ki.
    AI_Output (self, other ,"DIA_Patter_HaveFood_03_03"); //W zamian we� t� rud�.
	//prize
    CreateInvItems (self, ItMiNugget, 25);
    B_GiveInvItems (self, other, ItMiNugget, 25);
	//items
    B_GiveInvItems (other, self, ItFo_muttonLurker, 10);
    B_GiveInvItems (other, self, ItFo_MoleratW, 5);
	//log
    B_LogEntry                     (CH1_Food_Patter,"Wykona�em zadanie i przynios�em zaopatrzenie Patterowi.");
    Log_SetTopicStatus       (CH1_Food_Patter, LOG_SUCCESS);
    MIS_Food_Patter = LOG_SUCCESS;
	//experience
    B_GiveXP (125);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Patter_HELLO5 (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 1;
   condition    = DIA_Patter_HELLO5_Condition;
   information  = DIA_Patter_HELLO5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patter_HELLO5_Condition()
{
    if (MIS_BattleInTemple == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_HELLO5_Info()
{
    AI_Output (self, other ,"DIA_Patter_HELLO5_03_01"); //Hej, ruszamy! We� te mikstury.
    CreateInvItems (self, ItFo_Potion_Mana_02, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_02, 4);
    CreateInvItems (self, ItFo_Potion_Health_02, 4);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 4);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NextWorkRTemple 
//========================================

INSTANCE DIA_Patter_Oboz  (C_INFO)
{
   npc          = GRD_7895_Patter;
   nr           = 10;
   condition    = DIA_Patter_Oboz_Condition;
   information  = DIA_Patter_Oboz_Info;
   permanent	= FALSE;
   important = 1;
};

FUNC INT DIA_Patter_Oboz_Condition()
{
   if (Npc_IsDead (GRD_7894_Morok)) 
   && (Npc_KnowsInfo(hero,DIA_Morok_HELLO1233))	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patter_Oboz_Info()
{
    AI_Output (self, other ,"DIA_Patter_Oboz_03_01"); //B�agam nie zabijajcie mnie tak jak jego! B�d� m�wi�!
    AI_Output (other, self ,"DIA_Patter_Oboz_15_02"); //W takim razie gadaj. Gdzie zrabowane towary.
    AI_Output (self, other ,"DIA_Patter_Oboz_03_03"); //Niedaleko naszego obozowiska jest pla�a z jeziorkiem a obok tego znajduje si� grota.
    AI_Output (self, other ,"DIA_Patter_Oboz_03_04"); //Tam w skrzyni znajduj� si� skradzione przez nas rzeczy.
    AI_Output (self, other ,"DIA_Patter_Oboz_03_05"); //Oto klucz do tego kufra. 
    AI_Output (other, self ,"DIA_Patter_Oboz_15_06"); //Ocali�e� �ycie. A teraz zejd� nam z oczu.
    AI_Output (self, other ,"DIA_Patter_Oboz_03_07"); //Dobra, ju� sobie id�.
	CreateInvItems (self, ItKe_Patter,1);
	B_GiveInvItems (self,other, ItKe_Patter,1);
	AI_SetWalkmode(GRD_7895_Patter,NPC_RUN);//AI_GotoWP( GRD_7895_Patter,"OC1");
    Npc_ExchangeRoutine(self,"OMEND"); 
    B_LogEntry                     (Obozowisko,"Morok nie chcia� m�wi� i sko�czy� marnie. Ale Patter by� ju� bardziej ugodowy i powiedzia� o miejscu ukrycia skradzionych towar�w. S� ukryte w grocie przy malutkiej pla�y nieopodal.");
    AI_StopProcessInfos	(self);
};
