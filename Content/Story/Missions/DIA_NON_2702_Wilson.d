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
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_02"); //Co tutaj robisz?
    AI_Output (other, self ,"DIA_SZEFU_HELLO_15_03"); //Przypadkiem dosta³em siê do waszego obozu.
    AI_Output (self, other ,"DIA_SZEFU_HELLO_03_04"); //Jakim cudem tu zaszed³eœ? Nasz obóz otaczaj¹ orkowie.
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_SZEFU_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_02"); //Nazywam siê Wilson. Dowodzê t¹ przeklêt¹ zgraj¹. 
    AI_Output (other, self ,"DIA_SZEFU_HELLO2_15_03"); //Wygl¹daj¹ raczej na doœwiadczonych i powa¿nych wojowników.
    AI_Output (self, other ,"DIA_SZEFU_HELLO2_03_04"); //S¹ zbyt porywczy. Kiedyœ œci¹gn¹ na nas oddzia³ orków.
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
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_02"); //Racja, to prototyp. Rakus chcia³ trochê siê pobawiæ wiêc da³em mu zajêcie.
    AI_Output (other, self ,"DIA_SZEFU_G_Armor_15_03"); //Czy to s¹ czaszki orków?
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_04"); //Zgad³eœ ch³opcze, reszta to ró¿ne skóry i ³uski. Nie myœl jednak ¿e Rakus zrobi ci taki pancerz za jakieœ marne bry³ki.
    AI_Output (self, other ,"DIA_SZEFU_G_Armor_03_05"); //Musisz sobie na niego zas³u¿yæ.
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_SZEFU_LEARN_Condition()
{
    return TRUE;
};

FUNC VOID DIA_SZEFU_LEARN_Info()
{
    AI_Output (other, self ,"DIA_SZEFU_LEARN_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_SZEFU_LEARN_03_02"); //Poka¿ê ci, jak zwiêkszyæ krzepê.
	if (firstinfo_wilson_teach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TeacherOW,"£owca orków Wilson pomo¿e mi zwiêkszyæ si³ê.");
	firstinfo_wilson_teach = true;
	};
	Info_ClearChoices	(DIA_SZEFU_LEARN);
	Info_AddChoice		(DIA_SZEFU_LEARN,DIALOG_BACK									,DIA_SZEFU_LEARN_BACK);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_5);
	Info_AddChoice		(DIA_SZEFU_LEARN,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_SZEFU_LEARN_STR_1);
};

func void DIA_SZEFU_LEARN_BACK()
{
	AI_Output(self,hero,"DIA_SZEFU_LEARN_BACK_BACK_11_02"); //Mam nadziejê, ¿e jeszcze siê pojawisz na treningu. Wci¹¿ masz nad czym pracowaæ!
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
   description	= "Znasz mo¿e Quentina?";
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
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_01"); //Znasz mo¿e Quentina?
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_02"); //Tak, znam. A co?
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_03"); //Potrzebujemy wsparcia kilku twoich ludzi. 
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_04"); //Gomez zwariowa³ i atakuje wszystko, co siê rusza. Stra¿nicy od dawna maj¹ zatargi z Bandytami, a obecna sytuacja to tylko pretekst do ataku.
    AI_Output (other, self ,"DIA_SZEFU_Quest12_15_05"); //Przyda³aby nam siê pomoc w pozbyciu siê Stra¿ników patroluj¹cych okolicê.
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_06"); //S³ysza³em o wydarzeniach w Starej Kopalni, ale nie s¹dzi³em, ¿e bêd¹ mia³y tak olbrzymie skutki. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_07"); //Nigdzie nie jest ju¿ bezpiecznie. 
    AI_Output (self, other ,"DIA_SZEFU_Quest12_03_08"); //Dobra, wyœlê wam moich dwóch najlepszych ludzi. Tyle musi wam wystarczyæ.
	AI_Output (self, other ,"DIA_SZEFU_Quest12_03_09"); //Pójd¹ Rakus i Osko. 
    B_LogEntry                     (CH4_SupportFromOrcHunters,"Rozmawia³em z Wilsonem. £owca orków dobrze pamiêta Quetnina. Zgodzi³ siê wys³aæ dwóch swoich ludzi do naszego Obozu.");

    B_GiveXP (200);
   // B_LogEntry                     (CH1_CavalornFuck,"Przez przypadek rozwi¹za³em problem Cavalorna z ³owcami orków.");
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
   description	= "Widzia³eœ gdzieœ mo¿e jakiegoœ œwira z Sekty?";
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
    AI_Output (other, self ,"DIA_SZEFU_SectTeam_15_01"); //Widzia³eœ gdzieœ mo¿e jakiegoœ œwira z Sekty?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_02"); //Chodzi ci o tych goœci z tatua¿ami?
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_03"); //Widzia³em jakiegoœ ³ysola otoczonego grupk¹ Stra¿ników. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_04"); //Szli w kierunku orkowego miasta.
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_05"); //Zatrzymali siê na kilka dni przy bagnie i rozbili tam ma³y obóz. 
    AI_Output (self, other ,"DIA_SZEFU_SectTeam_03_06"); //Jednak pewnej nocy wszystko zniknê³o. 
	
    B_LogEntry                     (CH3_SearchKalom,"Wilson widzia³ kilku Stra¿ników Œwi¹tynnych id¹cych w kierunku orkowego miasta. Ma³o prawdopodobne, ¿ebym ich znalaz³. ");
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
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_01"); //Widzê ciê ju¿ tu któryœ raz. Œmiem za³o¿yæ, ¿e jeszcze trochê po¿yjesz. Mam wiêc dla ciebie zadanie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_02"); //Jakie?
    AI_Output (self, other ,"DIA_SZEFU_ROBOTA_03_03"); //£azisz to tu, to tam. Rozejrzyj siê za jakimiœ dodatkowymi ludŸmi. Ostatnio jeden z naszych skoñczy³ z orkowym toporem w dupie.
    AI_Output (other, self ,"DIA_SZEFU_ROBOTA_15_04"); //Rozumiem. Popytam.
    MIS_NewBloodForOrcHunters = LOG_RUNNING;

    Log_CreateTopic         (CH3_NewBloodForOrcHunters, LOG_MISSION);
    Log_SetTopicStatus      (CH3_NewBloodForOrcHunters, LOG_RUNNING);
    B_LogEntry              (CH3_NewBloodForOrcHunters,"Wilson poleci³ mi znaleŸæ jakichœ rekrutów do ich obozu. Có¿, muszê rozmawiaæ z ludŸmi.");
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
   description	= "Zwerbowa³em Gestatha.";
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
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_01"); //Zwerbowa³em Gestatha.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GESTAH_15_02"); //To doœwiadczony myœliwy. Przyda nam siê ktoœ taki.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GESTAH_03_03"); //Dobra robota. P³acê 100 bry³ek za ka¿dego nowego cz³owieka.
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
   description	= "Zwerbowa³em Gerarda.";
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
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_01"); //Zwerbowa³em Gerarda.
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_02"); //Goœæ zabi³ dwóch stra¿ników królewskich i prze¿y³ sam kilka dni na szczycie góry. 
    AI_Output (other, self ,"DIA_SZEFU_WERB_GERARD_15_03"); //Zna siê na przetrwaniu jak ma³o kto.
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_04"); //Dobra robota. Tacy jak on na pewno potrafi¹ daæ w koœæ orkom!
    AI_Output (self, other ,"DIA_SZEFU_WERB_GERARD_03_05"); //P³acê 100 bry³ek rudy za ka¿dego dobrego cz³owieka.
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
   description	= "Zwerbowa³em Davora.";
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
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_01"); //Zwerbowa³em Davora.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_02"); //Bardzo dobrze. Od kilku dni mia³em go na oku. 
    AI_Output (other, self ,"DIA_SZEFU_DAVOR_15_03"); //Goœæ umie nieŸle strzelaæ z ³uku i kuszy.
    AI_Output (self, other ,"DIA_SZEFU_DAVOR_03_04"); //P³acê 100 bry³ek rudy za dobrego cz³owieka.
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
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_01"); //Ostatnio przyprowadzi³eœ tu trzech dobrych ludzi. Myœlê, ¿e wystarczy.
    AI_Output (self, other ,"DIA_SZEFU_SUCCESS_QUEST_REKRUT_03_02"); //Spisa³eœ siê rewelacyjnie. Bêd¹ z ciebie ludzie.
    //CreateInvItems (self, ItMiNugget, 100);
    //B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Zrekrutowa³em do obozu trzech œwietnych ludzi. Wilson jest mi bardzo wdziêczny. ");
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
   description	= "Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.";
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
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_01"); //Odnalaz³em Hugo, pomog³em mu w pewnej sprawie. Powinien wkrótce wróciæ.
    AI_Output (self, other ,"DIA_SZEFU_HUGO_BACK_03_02"); //Dobra robota. Hugo to porz¹dny goœæ. WeŸ to w nagrodê. 
    AI_Output (other, self ,"DIA_SZEFU_HUGO_BACK_15_03"); //Dziêki.
	CreateInvItems (self, ItFo_Potion_Haste_02, 3);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_02, 3);
    B_LogEntry                     (CH1_HunterHugo,"Wilson by³ bardzo zadowolony, gdy wspomnia³em o powrocie Hugo. Wynagrodzi³ mnie miksturami szybkoœci.");
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
    AI_Output (self, other ,"DIA_SZEFU_Garret_03_01");  //Hej ty! Garret czegoœ od ciebie chce.
    AI_Output (other, self ,"DIA_SZEFU_Garret_15_02");  //W takim razie z nim pomówiê.
  
};

//////KASTAGIR IS DEAD


INSTANCE DIA_SZEFU_KASTAGIR_IS_DEAD (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_KASTAGIR_IS_DEAD_Condition;
   information  = DIA_SZEFU_KASTAGIR_IS_DEAD_Info;
   permanent	= FALSE;
   description    = "Kastagir nie ¿yje.";
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
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_01");  //Kastagir nie ¿yje.
    AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_02");  //Co?! Jak to siê sta³o? Poleg³ w walce z orkami?
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_03");  //Nie zupe³nie. Pozwól mi wyjaœniæ wszystko po kolei.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_04");  //Garret wspomina³, ¿e Kastagir by³ zainteresowany jakimœ magicznym kryszta³em.
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_05");  //I w³aœnie ten kryszta³ go opêta³. Kastagir chcia³ posi¹œæ jego moc i zaw³adn¹æ ca³ym œwiatem.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_06");  //Oszala³?
    AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_07");  //Tak. Mówi³, ¿e nie interesuje go ile osób zginie, wa¿ny jest jego cel.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_08");  //Co siê sta³o z tym kryszta³em?
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_09");  //Mam go tutaj.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_10");  //Musisz go czym prêdzej zniszczyæ.
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_11");  //Udam siê do Maga Uturiela. On pomo¿e mi zniszczyæ ten kryszta³ mocy.
	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_12");  //Zrób to czym prêdzej. Taki artefakt mo¿e byæ niezwykle zgubny gdy wpadnie w niepowo³ane rêcê.
	AI_Output (other, self ,"DIA_SZEFU_KASTAGIR_IS_DEAD_15_13");  //Godziny tego kryszta³u zosta³y policzone. Czas siê go pozbyæ, na zawsze.
  	AI_Output (self, other ,"DIA_SZEFU_KASTAGIR_IS_DEAD_03_14");  //Mimo wszystko, szkoda Kastagira by³ bardzo sprawnym wojownikiem.
	
	    B_LogEntry                     (Kastragir,"Wilson przyj¹³ ze zdziwieniem i smutkiem wieœæ o œmierci jednego ze swoich ludzi. Po poinformowaniu go, ¿e Kastagir poleg³, Wilson poleci³ mi bym niezw³ocznie uda³ siê do Maga Uturiela i zniszczy³ magiczny kryszta³.");

	
};

//////UTURIEL_BROKEN_CRYSTAL


INSTANCE DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL (C_INFO)
{
   npc          = NON_2702_SZEFU;
   nr           = 2;
   condition    = DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Condition;
   information  = DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_Info;
   permanent	= FALSE;
   description    = "Moc magicznego kryszta³u zosta³a zniszczona.";
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
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_01");  //Moc magicznego kryszta³u zosta³a zniszczona.
    AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_02");  //To dobra wiadomoœæ. Teraz nikogo ju¿ nie zgubi...
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_03");  //Szkoda Kastagira ale niestety widocznie jego osobowoœæ by³a podatna na energiê tego typu.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_04");  //To by³ porywczy i jak siê wydawa³o twardy cz³owiek. Ale mia³ te¿ swoje s³abe strony jak widaæ.
    AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_05");  //Powstrzymuj¹c go i zdejmuj¹c moc z kryszta³u wykona³eœ wielk¹ pracê.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_06");  //WeŸ tê rudê w ramach nagrody.
    B_GiveInvItems (self,other, itminugget, 190);
    AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_07");  //Dziêki.
	AI_Output (self, other ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_03_08");  //IdŸ i niech ci los sprzyja, m³odzieñcze.
	AI_Output (other, self ,"DIA_SZEFU_UTURIEL_BROKEN_CRYSTAL_15_09");  //Do zobaczenia.
    B_LogEntry                     (Kastragir,"Zda³em raport Wilsonowi. Przyj¹³ on z ulg¹ wiadomoœæ o zniszczeniu kryszta³u mocy. Wyp³aci³ mi te¿ nagrodê za ca³¹ fatygê. By³a to krwawa misja ale najwyraŸniej skoñczy³a siê ona dobrze dla wszystkich oprócz Kastagira.");
	
	   Log_SetTopicStatus      (Kastragir, LOG_SUCCESS);
	   B_GiveXP (500);
};



//------------------------------------------------------------------------Przegrupowania Orków-----------------------------------------------------------------------



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
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_01");  //Jest pewna powa¿na sprawa. Gwarantuje ci niez³y zarobek. O ile prze¿yjesz rzecz jasna!
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Orkow_15_02");  //Co to takiego?
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_03");  //Có¿ wœród Orków widaæ jakieœ przegrupowania. Zapewne nie wyjdzie z tego nic dobrego.
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_04");  //Wys³a³em Prina na zwiad. Mia³ dowiedzieæ siê wiêcej, znajdŸ go i wypytaj co ustali³.
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Orkow_15_05");  //Niech bêdzie, Wiadomo w któr¹ stronê siê uda³?
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Orkow_03_06");  //Bardzo dobrze. Wiem jedynie ¿e szed³ w stronê miasta orków...
    
	   Log_CreateTopic		   (PrzegrupowaniaOrkow, LOG_MISSION);
	   Log_SetTopicStatus      (PrzegrupowaniaOrkow, LOG_RUNNING);
	   B_LogEntry              (PrzegrupowaniaOrkow,"Wilson twierdzi, ¿e wœród Orków widaæ jakieœ podejrzane ruchy. Poleci³ mi spotkaæ siê z Prinem, którego uprzednio wys³a³ na zwiad.");

	   
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
   description  = "Rozmawia³em z Prinem.";
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
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_01");  //Rozmawia³em z Prinem.
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_02");  //I czego siê dowiedzia³eœ?
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_03");  //Manewry Orków nie s¹ przypadkowe. Najprawdopodobniej szykuj¹ siê do wypadu na ziemie ludzi.
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_04");  //Cholera... Wiedzia³em ¿e nie wyniknie z tego NIC DOBREGO!
    AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_05");  //Na czele tych Orków, którzy szykuj¹ siê do ataku stoi trzech wodzów. Czwarty z nich opuœci³ miasto gdy rozmawia³em z Prinem...
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_06");  //No có¿ skoro ¿yjesz to znaczy ¿e sobie poradziliœcie. Znalaz³eœ coœ przy nim? 
	AI_Output (other, self ,"DIA_Wilson_Przegrupowania_Prin_15_07");  //Tak, mia³ przy sobie pewn¹ mapê z trzema zaznaczonymi punktami. Spójrz...
	B_GiveInvItems (other,self,ItWr_Map_Przegrupowania,1);
	B_UseFakeScroll();
	AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_08");  //Hmm. Musimy rozbiæ te trzy hordy, nie tylko os³abi to morale pozosta³ych Orków ale prawdopodobnie równie¿ uniemo¿liwi ca³y atak.
    AI_Output (self, other ,"DIA_Wilson_Przegrupowania_Prin_03_09");  //Pogadaj z Rakusem i Osko. Waszym zadaniem bêdzie zabicie trójki orkowych dowódców.
	B_GiveInvItems (self,other,ItWr_Map_Przegrupowania,1);
		 
	B_LogEntry              (PrzegrupowaniaOrkow,"Wilson poleci³ mi zebraæ Osko i Rakusa. W trójkê mamy zabiæ trzech orkowych dowódców. To powinno powstrzymaæ Orków przed generalnym uderzeniem.");
	   
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
   description = "Trzej orkowi dowódcy nie ¿yj¹!";
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
    AI_Output (other, self ,"DIA_Wilson_PO_Koniec_15_01");  //Trzej orkowi dowódcy nie ¿yj¹!
    AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_02");  //Bardzo dobrze. Szkoda, ¿e wiêkszoœæ mieszkañców Kolonii nawet nie wie o istnieniu £owców Orków. 
    AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_03");  //Mimo tego ile robi¹ dla dobra wszystkich.  Ale tak czy inaczej popisa³eœ siê nie lada umiejêtnoœciami!
	AI_Output (self, other ,"DIA_Wilson_PO_Koniec_03_04");  //By³by z ciebie prawdziwy £owca Orków! Trzymaj ten pancerz, zas³u¿y³eœ na niego w zupe³noœci.
	B_GiveInvItems (self,other, Armor_och_H, 1);
    AI_Output (other, self ,"DIA_Wilson_PO_Koniec_15_05");  //Dziêki.
    B_LogEntry              (PrzegrupowaniaOrkow,"Wilson jest zadowolony z rezultatów polowania na wodzów Orków. Wyp³aci³ mi nale¿n¹ nagrodê i wygl¹da na to, ¿e póki co zielonoskórzy bêd¹ przez nas trzymani w ryzach.");
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
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_01"); //Jest coœ o czym powinieneœ wiedzieæ.
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_02"); //Tak?
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_03"); //Gdy trochê cie nie by³o w obozie moi ludzie ustrzelili biegn¹cego Orka. Mia³ przy sobie dziwn¹ tabliczkê zapisan¹ w ich jêzyku.
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_04"); //Interesuj¹ce. Skoro bieg³ to znaczy, ¿e to pilna sprawa. Co jest zapisane w tej tablicy.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_05"); //To w³aœnie powinieneœ ustaliæ. Pomów z Hugo. On œwietnie zna jêzyk Orków. Pomo¿e Ci.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_06"); //Oto ta tablica.
	CreateInvItem (self, ItMi_TWO_Tablica);
	B_GiveInvItems (self,other, ItMi_TWO_Tablica, 1);
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_07"); //Dziêki. Postaram siê dowiedzieæ o co chodzi tym zielonym gadzinom.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_08"); //Dok³adnie, ch³opcze. I sugerowa³bym byœ siê poœpieszy³. 
    AI_Output (other, self ,"DIA_SZEFU_TWO_15_09"); //W porz¹dku. Pogadam z Hugo.
    AI_Output (self, other ,"DIA_SZEFU_TWO_03_10"); //Zatem do zobaczenia!
	Log_CreateTopic		(TajemniczaWiadomoscOrkow,	LOG_MISSION);
	Log_SetTopicStatus	(TajemniczaWiadomoscOrkow,	LOG_RUNNING);
	B_LogEntry          (TajemniczaWiadomoscOrkow,"Wilson powiedzia³, ¿e jego podkomendni zabili Orka, który bieg³ z jak¹œ tabliczk¹ zapisan¹ w ich jêzyku. Chyba dobrze by³oby siê dowiedzieæ co na niej wyryto. Muszê pomówiæ z ³owc¹ Hugo, który zna jêzyk Orków.");
	
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
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_02"); //Có¿, sytuacja jest tudna. Ponieœliœmy straty w ludziach I wyposa¿eniu.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_03"); //Przyby³eœ w momencie gdy li¿emy rany po ostatnich pora¿kach.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_04"); // Oby Bogowie mi pomogli I ¿ebym nie wywiód³ swoich ludzi na zatracenie.
    AI_Output (other, self ,"DIA_SZEFU_WHO_ORC_15_05"); //Co aktualnie robi¹ g³ówne si³y Orków?
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_06"); //Znajduj¹ siê w okolicach swojego miasta. Ale oczywiœcie patrole czy pojedyncze sztuki pa³êtaj¹ siê gdzie indziej w terenie.
    AI_Output (self, other ,"DIA_SZEFU_WHO_ORC_03_07"); //Musisz mieæ oczy I uszy szeroko otwarte ch³opcze. 
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

