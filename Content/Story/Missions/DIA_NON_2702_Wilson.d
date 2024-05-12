//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SZEFU_EXIT(C_INFO)
{
	npc             = NON_2702_SZEFU;
	nr              = 999;
	condition		= DIA_SZEFU_EXIT_Condition;
	information		= DIA_SZEFU_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_SZEFU_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SZEFU_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_SZEFU_HELLO (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_HELLO_Condition;
   information  = DIA_SZEFU_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO_Info()
{
    if (Kapitel < 4)
    {
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_02"); //Co tutaj robisz?
    AI_Output (other, self ,"DIA_SZEFU_HELLO_15_03"); //Przypadkiem dosta�em si� do waszego obozu.
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_04"); //Jakim cudem tu zaszed�e�? Nasz ob�z otaczaj� orkowie.
	B_GiveXP (125);
	};
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_SZEFU_HELLO2 (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_HELLO2_Condition;
   information  = DIA_SZEFU_HELLO2_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_SZEFU_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_02"); //Nazywam si� Wilson. Dowodz� t� przekl�t� zgraj�. 
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_03"); //Wygl�daj� raczej na do�wiadczonych i powa�nych wojownik�w.
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_04"); //S� zbyt porywczy. Kiedy� �ci�gn� na nas oddzia� ork�w.
};
//========================================
//-----------------> G_Armor
//========================================

INSTANCE DIA_SZEFU_G_Armor (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_G_Armor_Condition;
   information  = DIA_SZEFU_G_Armor_Info;
   permanent	= FALSE;
   description	= "Masz na sobie ciekawy pancerz.";
};

FUNC INT DIA_SZEFU_G_Armor_Condition()
{
if (Npc_KnowsInfo(hero,DIA_SZEFU_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_SZEFU_G_Armor_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_G_Armor_15_01"); //Masz na sobie ciekawy pancerz.
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_02"); //Racja, to prototyp. Rakus chcia� troch� si� pobawi� wi�c da�em mu zaj�cie.
    AI_Output (other, self ,"DIA_SZEFU_G_Armor_15_03"); //Czy to s� czaszki ork�w?
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_04"); //Zgad�e� ch�opcze, reszta to r�ne sk�ry i �uski. Nie my�l jednak �e Rakus zrobi ci taki pancerz za jakie� marne bry�ki.
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_05"); //Musisz sobie na niego zas�u�y�.
    AI_Output (other, self ,"DIA_SZEFU_G_Armor_15_06"); //Rozumiem.
};


//========================================
//-----------------> LEARN
//========================================

INSTANCE DIA_SZEFU_LEARN (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 4;
   condition    = DIA_SZEFU_LEARN_Condition;
   information  = DIA_SZEFU_LEARN_Info;
   permanent	= TRUE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_SZEFU_LEARN_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_LEARN_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_LEARN_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_SZEFU_LEARN_03_02"); //Poka�� ci, jak zwi�kszy� krzep�.
	if (firstinfo_wilson_teach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TeacherOW,"�owca ork�w Wilson pomo�e mi zwi�kszy� si��.");
	firstinfo_wilson_teach = true;
	};
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_BACK()
{
	AI_Output(self,hero,"DIA_SZEFU_LEARN_BACK_BACK_11_02"); //Mam nadziej�, �e jeszcze si� pojawisz na treningu. Wci�� masz nad czym pracowa�!
	Info_ClearChoices	(DIA_SZEFU_LEARN);
};

func void DIA_SZEFU_LEARN_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

//========================================
//-----------------> Quest12
//========================================

INSTANCE DIA_SZEFU_Quest12 (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_Quest12_Condition;
   information  = DIA_SZEFU_Quest12_Info;
   permanent	= FALSE;
   description	= "Znasz mo�e Quentina?";
};

FUNC INT DIA_SZEFU_Quest12_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Idea))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_Quest12_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_01"); //Znasz mo�e Quentina?
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_02"); //Tak, znam. A co?
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_03"); //Potrzebujemy wsparcia kilku twoich ludzi. 
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_04"); //Gomez zwariowa� i atakuje wszystko, co si� rusza. Stra�nicy od dawna maj� zatargi z Bandytami, a obecna sytuacja to tylko pretekst do ataku.
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_05"); //Przyda�aby nam si� pomoc w pozbyciu si� Stra�nik�w patroluj�cych okolic�.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_06"); //S�ysza�em o wydarzeniach w Starej Kopalni, ale nie s�dzi�em, �e b�d� mia�y tak olbrzymie skutki. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju� bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wy�l� wam moich dw�ch najlepszych ludzi. Tyle musi wam wystarczy�.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //P�jd� Rakus i Osko. 
    B_LogEntry                     (CH4_SupportFromOrcHunters,"Rozmawia�em z Wilsonem. �owca ork�w dobrze pami�ta Quetnina. Zgodzi� si� wys�a� dw�ch swoich ludzi do naszego Obozu.");

    B_GiveXP (200);
   // B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi�za�em problem Cavalorna z �owcami ork�w.");
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (self,"wait");
	Npc_ExchangeRoutine (NON_2706_Osko,"wait");
	Npc_ExchangeRoutine (NON_2705_Rakus,"wait");
	//Npc_ExchangeRoutine (NON_2703_MYSLIWY,"wait"); 
};


//========================================
//-----------------> SectTeam
//========================================

INSTANCE DIA_SZEFU_SectTeam (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_SectTeam_Condition;
   information  = DIA_SZEFU_SectTeam_Info;
   permanent	= FALSE;
   description	= "Widzia�e� gdzie� mo�e jakiego� �wira z Sekty?";
};

FUNC INT DIA_SZEFU_SectTeam_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stary_WhereIsKalom))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_SectTeam_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_SectTeam_15_01"); //Widzia�e� gdzie� mo�e jakiego� �wira z Sekty?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_02"); //Chodzi ci o tych go�ci z tatua�ami?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_03"); //Widzia�em jakiego� �ysola otoczonego grupk� Stra�nik�w. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_04"); //Szli w kierunku orkowego miasta.
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_05"); //Zatrzymali si� na kilka dni przy bagnie i rozbili tam ma�y ob�z. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_06"); //Jednak pewnej nocy wszystko znikn�o. 
	
    B_LogEntry                     (CH3_SearchKalom,"Wilson widzia� kilku Stra�nik�w �wi�tynnych id�cych w kierunku orkowego miasta. Ma�o prawdopodobne, �ebym ich znalaz�. ");
    B_GiveXP (150);
};


//========================================
//-----------------> ROBOTA
//========================================

INSTANCE DIA_SZEFU_ROBOTA (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_ROBOTA_Condition;
   information  = DIA_SZEFU_ROBOTA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_ROBOTA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_HELLO))
    && (kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_ROBOTA_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_01"); //Widz� ci� ju� tu kt�ry� raz. �miem za�o�y�, �e jeszcze troch� po�yjesz. Mam wi�c dla ciebie zadanie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_02"); //Jakie?
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_03"); //�azisz to tu, to tam. Rozejrzyj si� za jakimi� dodatkowymi lud�mi. Ostatnio jeden z naszych sko�czy� z orkowym toporem w dupie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_04"); //Rozumiem. Popytam.
    MIS_NewBloodForOrcHunters = LOG_RUNNING;

    Log_CreateTopic         (CH3_NewBloodForOrcHunters, LOG_MISSION);
    Log_SetTopicStatus      (CH3_NewBloodForOrcHunters, LOG_RUNNING);
    B_LogEntry              (CH3_NewBloodForOrcHunters,"Wilson poleci� mi znale�� jakich� rekrut�w do ich obozu. C�, musz� rozmawia� z lud�mi.");
    AI_StopProcessInfos	(self);
};
/*
* Gestah
* Davor
* Gerard
*/ 
//========================================
//-----------------> WERB_GESTAH
//========================================

INSTANCE DIA_SZEFU_WERB_GESTAH (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_WERB_GESTAH_Condition;
   information  = DIA_SZEFU_WERB_GESTAH_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Gestatha.";
};

FUNC INT DIA_SZEFU_WERB_GESTAH_Condition()
{
    if (gestah_lowca == true)
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_WERB_GESTAH_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_01"); //Zwerbowa�em Gestatha.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_02"); //To do�wiadczony my�liwy. Przyda nam si� kto� taki.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GESTAH_03_03"); //Dobra robota. P�ac� 100 bry�ek za ka�dego nowego cz�owieka.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    b_givexp (200);
};

//========================================
//-----------------> WERB_GERARD
//========================================

INSTANCE DIA_SZEFU_WERB_GERARD (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_WERB_GERARD_Condition;
   information  = DIA_SZEFU_WERB_GERARD_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Gerarda.";
};

FUNC INT DIA_SZEFU_WERB_GERARD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_LOWCA_ORKOW))
    && (gerard_lowca == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_WERB_GERARD_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_01"); //Zwerbowa�em Gerarda.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_02"); //Go�� zabi� dw�ch stra�nik�w kr�lewskich i prze�y� sam kilka dni na szczycie g�ry. 
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_03"); //Zna si� na przetrwaniu jak ma�o kto.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_04"); //Dobra robota. Tacy jak on na pewno potrafi� da� w ko�� orkom!
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_05"); //P�ac� 100 bry�ek rudy za ka�dego dobrego cz�owieka.
	CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    b_givexp (200);
};

//========================================
//-----------------> DAVOR
//========================================

INSTANCE DIA_SZEFU_DAVOR (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 3;
   condition    = DIA_SZEFU_DAVOR_Condition;
   information  = DIA_SZEFU_DAVOR_Info;
   permanent	= FALSE;
   description	= "Zwerbowa�em Davora.";
};

FUNC INT DIA_SZEFU_DAVOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_FIND_BOW))
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_DAVOR_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_01"); //Zwerbowa�em Davora.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_02"); //Bardzo dobrze. Od kilku dni mia�em go na oku. 
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_03"); //Go�� umie nie�le strzela� z �uku i kuszy.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_04"); //P�ac� 100 bry�ek rudy za dobrego cz�owieka.
    b_givexp (200);
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
};

//========================================
//-----------------> SUCCESS_QUEST_REKRUT
//========================================

INSTANCE DIA_SZEFU_SUCCESS_QUEST_REKRUT (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 4;
   condition    = DIA_SZEFU_SUCCESS_QUEST_REKRUT_Condition;
   information  = DIA_SZEFU_SUCCESS_QUEST_REKRUT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_SUCCESS_QUEST_REKRUT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_DAVOR))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GERARD))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GESTAH))
    && (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_SUCCESS_QUEST_REKRUT_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_01"); //Ostatnio przyprowadzi�e� tu trzech dobrych ludzi. My�l�, �e wystarczy.
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_02"); //Spisa�e� si� rewelacyjnie. B�d� z ciebie ludzie.
    //CreateInvItems (self, ItMiNugget, 100);
    //B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Zrekrutowa�em do obozu trzech �wietnych ludzi. Wilson jest mi bardzo wdzi�czny. ");
    Log_SetTopicStatus       (CH3_NewBloodForOrcHunters, LOG_SUCCESS);
    MIS_NewBloodForOrcHunters = LOG_SUCCESS;

    B_GiveXP (400);
};

//========================================
//-----------------> HUGO_BACK
//========================================

INSTANCE DIA_SZEFU_HUGO_BACK (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_HUGO_BACK_Condition;
   information  = DIA_SZEFU_HUGO_BACK_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.";
};

FUNC INT DIA_SZEFU_HUGO_BACK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_HUGO_BACK_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_01"); //Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.
    AI_Output (self, other ,"DIA_SZEFU_HUGO_BACK_03_02"); //Dobra robota. Hugo to porz�dny go��. We� to w nagrod�. 
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_03"); //Dzi�ki.
	CreateInvItems (self, ItFo_Potion_Haste_02, 3);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_02, 3);
    B_LogEntry                     (CH1_HunterHugo,"Wilson by� bardzo zadowolony, gdy wspomnia�em o powrocie Hugo. Wynagrodzi� mnie miksturami szybko�ci.");
    //Log_SetTopicStatus       (CH1_HunterHugo, LOG_SUCCESS);
    //MIS_HunterHugo = LOG_SUCCESS;
    //B_GiveXP (50);
};
//=--=-=-=-=--=-=============================================---1.6.1=================------------=========--------============--------==========----

INSTANCE DIA_SZEFU_Garret (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_Garret_Condition;
   information  = DIA_SZEFU_Garret_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_SZEFU_Garret_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_Kastagir_Ksiega))

    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_Garret_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_Garret_03_01");  //Hej ty! Garret czego� od ciebie chce.
    AI_Output (other, self ,"DIA_SZEFU_Garret_15_02");  //W takim razie z nim pom�wi�.
  
};

//////KASTAGIR IS DEAD


INSTANCE DIA_SZEFU_KASTAGIR_IS_DEAD (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_KASTAGIR_IS_DEAD_Condition;
   information  = DIA_SZEFU_KASTAGIR_IS_DEAD_Info;
   permanent	= FALSE;
   description    = "Kastagir nie �yje.";
};

FUNC INT DIA_SZEFU_KASTAGIR_IS_DEAD_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_Kastagir_WALKA_CRYSTAL))
    && (Npc_IsDead(NON_40009_Kastagir))
    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_KASTAGIR_IS_DEAD_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_01");  //Kastagir nie �yje.
    AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_02");  //Co?! Jak to si� sta�o? Poleg� w walce z orkami?
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_03");  //Nie zupe�nie. Pozw�l mi wyja�ni� wszystko po kolei.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_04");  //Garret wspomina�, �e Kastagir by� zainteresowany jakim� magicznym kryszta�em.
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_05");  //I w�a�nie ten kryszta� go op�ta�. Kastagir chcia� posi��� jego moc i zaw�adn�� ca�ym �wiatem.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_06");  //Oszala�?
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_07");  //Tak. M�wi�, �e nie interesuje go ile os�b zginie, wa�ny jest jego cel.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_08");  //Co si� sta�o z tym kryszta�em?
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_09");  //Mam go tutaj.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_10");  //Musisz go czym pr�dzej zniszczy�.
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_11");  //Udam si� do Maga Uturiela. On pomo�e mi zniszczy� ten kryszta� mocy.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_12");  //Zr�b to czym pr�dzej. Taki artefakt mo�e by� niezwykle zgubny gdy wpadnie w niepowo�ane r�c�.
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_13");  //Godziny tego kryszta�u zosta�y policzone. Czas si� go pozby�, na zawsze.
  	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_14");  //Mimo wszystko, szkoda Kastagira by� bardzo sprawnym wojownikiem.
	
	    B_LogEntry                     (Kastragir,"Wilson przyj�� ze zdziwieniem i smutkiem wie�� o �mierci jednego ze swoich ludzi. Po poinformowaniu go, �e Kastagir poleg�, Wilson poleci� mi bym niezw�ocznie uda� si� do Maga Uturiela i zniszczy� magiczny kryszta�.");

	
};

//////UTURIEL_BROKEN_CRYSTAL


INSTANCE DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Condition;
   information  = DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Info;
   permanent	= FALSE;
   description    = "Moc magicznego kryszta�u zosta�a zniszczona.";
};

FUNC INT DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_Uturiel_KASTAGIR_DEAD1))

    {
    return TRUE;
    };
};


FUNC VOID DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_01");  //Moc magicznego kryszta�u zosta�a zniszczona.
    AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_02");  //To dobra wiadomo��. Teraz nikogo ju� nie zgubi...
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_03");  //Szkoda Kastagira ale niestety widocznie jego osobowo�� by�a podatna na energi� tego typu.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_04");  //To by� porywczy i jak si� wydawa�o twardy cz�owiek. Ale mia� te� swoje s�abe strony jak wida�.
    AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_05");  //Powstrzymuj�c go i zdejmuj�c moc z kryszta�u wykona�e� wielk� prac�.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_06");  //We� t� rud� w ramach nagrody.
    B_GiveInvItems (self,other, itminugget, 190);
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_07");  //Dzi�ki.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_08");  //Id� i niech ci los sprzyja, m�odzie�cze.
	AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_09");  //Do zobaczenia.
    B_LogEntry                     (Kastragir,"Zda�em raport Wilsonowi. Przyj�� on z ulg� wiadomo�� o zniszczeniu kryszta�u mocy. Wyp�aci� mi te� nagrod� za ca�� fatyg�. By�a to krwawa misja ale najwyra�niej sko�czy�a si� ona dobrze dla wszystkich opr�cz Kastagira.");
	
	   Log_SetTopicStatus      (Kastragir, LOG_SUCCESS);
	   B_GiveXP (500);
};



//------------------------------------------------------------------------Przegrupowania Ork�w-----------------------------------------------------------------------



INSTANCE DIA_Wilson_Przegrupowania_Orkow (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_Wilson_Przegrupowania_Orkow_Condition;
   information  = DIA_Wilson_Przegrupowania_Orkow_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Wilson_Przegrupowania_Orkow_Condition()
{
  //if (Npc_KnowsInfo(hero,DIA_Wilson_PO_Koniec))  //
  if (kapitel == 4)

    {
    return TRUE;
    };
};


FUNC VOID DIA_Wilson_Przegrupowania_Orkow_Info()
{
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_01");  //Jest pewna powa�na sprawa. Gwarantuje ci niez�y zarobek. O ile prze�yjesz rzecz jasna!
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Orkow_15_02");  //Co to takiego?
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_03");  //C� w�r�d Ork�w wida� jakie� przegrupowania. Zapewne nie wyjdzie z tego nic dobrego.
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_04");  //Wys�a�em Prina na zwiad. Mia� dowiedzie� si� wi�cej, znajd� go i wypytaj co ustali�.
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Orkow_15_05");  //Niech b�dzie, Wiadomo w kt�r� stron� si� uda�?
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_06");  //Bardzo dobrze. Wiem jedynie �e szed� w stron� miasta ork�w...
    
	   Log_CreateTopic		   (PrzegrupowaniaOrkow, LOG_MISSION);
	   Log_SetTopicStatus      (PrzegrupowaniaOrkow, LOG_RUNNING);
	   B_LogEntry              (PrzegrupowaniaOrkow,"Wilson twierdzi, �e w�r�d Ork�w wida� jakie� podejrzane ruchy. Poleci� mi spotka� si� z Prinem, kt�rego uprzednio wys�a� na zwiad.");

	   
};

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//========================================
//-----------------> PO
//========================================
INSTANCE DIA_Wilson_Przegrupowania_Prin (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_Wilson_Przegrupowania_Prin_Condition;
   information  = DIA_Wilson_Przegrupowania_Prin_Info;
   permanent	= FALSE;
   description  = "Rozmawia�em z Prinem.";
};

FUNC INT DIA_Wilson_Przegrupowania_Prin_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_Prin_PrzegrupowaniaOrkow))
    && (Npc_HasItems  (other, ItWr_Map_Przegrupowania) >=1)
	&& (Npc_IsDead    (OrcGeneral_Move_04_Map)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wilson_Przegrupowania_Prin_Info()
{
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_01");  //Rozmawia�em z Prinem.
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_02");  //I czego si� dowiedzia�e�?
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_03");  //Manewry Ork�w nie s� przypadkowe. Najprawdopodobniej szykuj� si� do wypadu na ziemie ludzi.
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_04");  //Cholera... Wiedzia�em �e nie wyniknie z tego NIC DOBREGO!
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_05");  //Na czele tych Ork�w, kt�rzy szykuj� si� do ataku stoi trzech wodz�w. Czwarty z nich opu�ci� miasto gdy rozmawia�em z Prinem...
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_06");  //No c� skoro �yjesz to znaczy �e sobie poradzili�cie. Znalaz�e� co� przy nim? 
	AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_07");  //Tak, mia� przy sobie pewn� map� z trzema zaznaczonymi punktami. Sp�jrz...
	B_GiveInvItems (other,self,ItWr_Map_Przegrupowania,1);
	B_UseFakeScroll();
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_08");  //Hmm. Musimy rozbi� te trzy hordy, nie tylko os�abi to morale pozosta�ych Ork�w ale prawdopodobnie r�wnie� uniemo�liwi ca�y atak.
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_09");  //Pogadaj z Rakusem i Osko. Waszym zadaniem b�dzie zabicie tr�jki orkowych dow�dc�w.
	B_GiveInvItems (self,other,ItWr_Map_Przegrupowania,1);
		 
	B_LogEntry              (PrzegrupowaniaOrkow,"Wilson poleci� mi zebra� Osko i Rakusa. W tr�jk� mamy zabi� trzech orkowych dow�dc�w. To powinno powstrzyma� Ork�w przed generalnym uderzeniem.");
	   
};
//========================================
//-----------------> PO
//========================================

INSTANCE DIA_Wilson_PO_Koniec (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_Wilson_PO_Koniec_Condition;
   information  = DIA_Wilson_PO_Koniec_Info;
   permanent	= FALSE;
   description = "Trzej orkowi dow�dcy nie �yj�!";
};

FUNC INT DIA_Wilson_PO_Koniec_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_Osko_Przegrupowania_GR3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wilson_PO_Koniec_Info()
{
    AI_Output (other, self ,"DIA_Wilson_PO_Koniec_15_01");  //Trzej orkowi dow�dcy nie �yj�!
    AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_02");  //Bardzo dobrze. Szkoda, �e wi�kszo�� mieszka�c�w Kolonii nawet nie wie o istnieniu �owc�w Ork�w. 
    AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_03");  //Mimo tego ile robi� dla dobra wszystkich.  Ale tak czy inaczej popisa�e� si� nie lada umiej�tno�ciami!
	AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_04");  //By�by z ciebie prawdziwy �owca Ork�w! Trzymaj ten pancerz, zas�u�y�e� na niego w zupe�no�ci.
	B_GiveInvItems (self,other, Armor_och_H, 1);
    AI_Output (other, self ,"DIA_Wilson_PO_Koniec_15_05");  //Dzi�ki.
    B_LogEntry              (PrzegrupowaniaOrkow,"Wilson jest zadowolony z rezultat�w polowania na wodz�w Ork�w. Wyp�aci� mi nale�n� nagrod� i wygl�da na to, �e p�ki co zielonosk�rzy b�d� przez nas trzymani w ryzach.");
	Log_SetTopicStatus      (PrzegrupowaniaOrkow, LOG_SUCCESS);
	B_GiveXP(800);
    AI_StopProcessInfos	(self);
	  
};

//========================================
//-----------------> TWO
//========================================

INSTANCE DIA_SZEFU_TWO (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_TWO_Condition;
   information  = DIA_SZEFU_TWO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SZEFU_TWO_Condition()
{
  if (Kapitel >= 4)
  && (Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
  
{
    return TRUE;
};
};
FUNC VOID DIA_SZEFU_TWO_Info()
{
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_01"); //Jest co� o czym powiniene� wiedzie�.
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_02"); //Tak?
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_03"); //Gdy troch� cie nie by�o w obozie moi ludzie ustrzelili biegn�cego Orka. Mia� przy sobie dziwn� tabliczk� zapisan� w ich j�zyku.
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_04"); //Interesuj�ce. Skoro bieg� to znaczy, �e to pilna sprawa. Co jest zapisane w tej tablicy.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_05"); //To w�a�nie powiniene� ustali�. Pom�w z Hugo. On �wietnie zna j�zyk Ork�w. Pomo�e Ci.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_06"); //Oto ta tablica.
	CreateInvItem (self, ItMi_TWO_Tablica);
	B_GiveInvItems (self,other, ItMi_TWO_Tablica, 1);
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_07"); //Dzi�ki. Postaram si� dowiedzie� o co chodzi tym zielonym gadzinom.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_08"); //Dok�adnie, ch�opcze. I sugerowa�bym by� si� po�pieszy�. 
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_09"); //W porz�dku. Pogadam z Hugo.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_10"); //Zatem do zobaczenia!
	Log_CreateTopic		(TajemniczaWiadomoscOrkow,	LOG_MISSION);
	Log_SetTopicStatus	(TajemniczaWiadomoscOrkow,	LOG_RUNNING);
	B_LogEntry          (TajemniczaWiadomoscOrkow,"Wilson powiedzia�, �e jego podkomendni zabili Orka, kt�ry bieg� z jak�� tabliczk� zapisan� w ich j�zyku. Chyba dobrze by�oby si� dowiedzie� co na niej wyryto. Musz� pom�wi� z �owc� Hugo, kt�ry zna j�zyk Ork�w.");
	
};

//========================================
//-----------------> WHO_ORC
//========================================

INSTANCE DIA_SZEFU_WHO_ORC (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 1;
   condition    = DIA_SZEFU_WHO_ORC_Condition;
   information  = DIA_SZEFU_WHO_ORC_Info;
   permanent	= FALSE;
   description	= "Jak tam sytuacja z orkami? Jak idzie wam walka?";
};

FUNC INT DIA_SZEFU_WHO_ORC_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_WHO_ORC_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_WHO_ORC_15_01"); //Jak tam sytuacja z orkami? Jak idzie wam walka?
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_02"); //C�, sytuacja jest tudna. Ponie�li�my straty w ludziach I wyposa�eniu.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_03"); //Przyby�e� w momencie gdy li�emy rany po ostatnich pora�kach.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_04"); // Oby Bogowie mi pomogli I �ebym nie wywi�d� swoich ludzi na zatracenie.
    AI_Output (other, self ,"DIA_SZEFU_WHO_ORC_15_05"); //Co aktualnie robi� g��wne si�y Ork�w?
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_06"); //Znajduj� si� w okolicach swojego miasta. Ale oczywi�cie patrole czy pojedyncze sztuki pa��taj� si� gdzie indziej w terenie.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_07"); //Musisz mie� oczy I uszy szeroko otwarte ch�opcze. 
};

instance dia_szefu_pickpocket(c_info) {
    npc = non_2702_szefu;
    nr = 900;
    condition = dia_szefu_pickpocket_condition;
    information = dia_szefu_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_szefu_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 25);
};

func void dia_szefu_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_szefu_pickpocket);
	info_addchoice(dia_szefu_pickpocket, dialog_back, dia_szefu_pickpocket_back);
	info_addchoice(dia_szefu_pickpocket, dialog_pickpocket, dia_szefu_pickpocket_doit);
};

func void dia_szefu_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_szefu_pickpocket);
};

func void dia_szefu_pickpocket_back() {
    info_clearchoices(dia_szefu_pickpocket);
};

