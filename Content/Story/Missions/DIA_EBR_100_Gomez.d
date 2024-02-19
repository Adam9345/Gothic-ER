//poprawione i sprawdzone -  

// **************************************
//					EXIT 
// **************************************
//skrypt sprawdzony g1210
instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Przychodz� zaoferowa� swoje us�ugi.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //�miesz tak po prostu tutaj wmaszerowa� i zawraca� mi g�ow�? Ty gnido! STRA�!
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************
	

instance DIA_Gomez_Hello (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Hello_Condition;
	information	= DIA_Gomez_Hello_Info;
	permanent	= 1;
	description	= "Przychodz� zaoferowa� swoje us�ugi.";
};                       

FUNC int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4) )
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Hello_Info()
{
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	if (Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //A dlaczego my�lisz, �e potrzebuj� twoich us�ug?
	
	Info_ClearChoices	(DIA_Gomez_Hello);	
	//opcje podstawowe
	Info_AddChoice		(DIA_Gomez_Hello,"Mam nadziej�, �e nie b�d� musia� udowodni�, �e potrafi� pos�ugiwa� si� broni�." 	,DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Bo wi�kszo�� z twoich ludzi to leniwe ba�wany."									,DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Przemierzy�em spor� cz�� Kolonii i mam kontakty we wszystkich obozach."			,DIA_Gomez_Hello_Kontakte);
	//test zaufania
	if (Diego_BringList == LOG_SUCCESS)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"Przeszed�em test zaufania."							,DIA_Gomez_Hello_ThorusSays);
	};
	//�cie�ka do kopalni
	if (CanTellToGomezAboutSecretPath == TRUE)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"Pomog�em odnale�� ukryt� �cie�k� do Wolnej Kopalni!"	,DIA_Gomez_Hello_MineENter);
	};
	//kopacz
	if (MIS_Kopacz == LOG_SUCCESS) && (MIS_TestOc == LOG_SUCCESS)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"By�em Kopaczem. Przeszed�em d�ug� drog�."				,DIA_Gomez_Hello_Buddler);
	};
	
	}
	else
	{
	AI_Output (self, other,"DIA_Gomez_Hello_MOD_02"); //Nie jeste� kim�, kto powinien si� tu znale��. 
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
	};
	
};

//NIEAKTUALNE
func void DIA_Gomez_Hello_Firenovize () 
{
	AI_Output (other, self,"DIA_Gomez_Hello_Firenovize_15_00"); //Mam aprobat� Mag�w Ognia. Chc� by� Nowicjuszem Ognia.
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_01"); //Aprobat� Mag�w Ognia... Ha!
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_02"); //Magowie staj� si� coraz bardziej bezczelni i samowolni. Wsp�praca z Nowym Obozem. Te� mi co�.
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_03"); //Marnujesz czas na Mag�w, ale to tw�j wyb�r. No dobrze. Przyjm� ci� w szeregi moich ludzi. 
	gomez_kontakte = gomez_kontakte + 10;
	hero_join_fn = true;
	B_LogEntry                     (CH1_FireNovize,"Gomez chyba nie przepada za Magami Ognia, ale przyj�� mnie bez wi�kszych problem�w. Czas porozmawia� z Torrezem.");
	Info_ClearChoices	(DIA_Gomez_Hello);
};

func void DIA_Gomez_Hello_MineENter ()
{
	AI_Output (other, self,"DIA_Gomez_Hello_MineENter_15_00"); //Pomog�em odnale�� ukryt� �cie�k� do Wolnej Kopalni!
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_01"); //To si� mo�e przyda�! S�ysza�em ju� wst�pne wie�ci od moich ludzi.
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_03"); //A wi�c to o tobie wszyscy m�wi�.
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_04"); //Pos�uchaj: gdybym ci� teraz nie przyj��, by�bym g�upcem. Witaj w�r�d nas!
	MIS_FlintsOffer = LOG_SUCCESS;
	gomez_kontakte = gomez_kontakte + 10;
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_SUCCESS);
	hero_join_fn = false;
    B_LogEntry                     (CH1_FlintsOffer,"Gomez by� bardzo uradowany z moich dokona�.");
	Info_ClearChoices	(DIA_Gomez_Hello);
};


func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Przeszed�em test zaufania, a Thorus twierdzi, �e si� nadaj�.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Gdyby tak nie by�o, nie dosta�by� si� tutaj �ywy. Mam nadziej�, �e sta� ci� jeszcze na wi�cej.
	hero_join_fn = false;
};

func void DIA_Gomez_Hello_Buddler()
{
    AI_Output (other, self,"DIA_Gomez_Hello_Buddler_15_00"); //By�em Kopaczem. Przeszed�em d�ug� drog�.
	AI_Output (self, other,"DIA_Gomez_Hello_Buddler_11_01"); //Masz sporo do�wiadczenia. To si� bardzo chwali.
	AI_Output (self, other,"DIA_Gomez_Hello_Buddler_11_02"); //Szanuj� lojalnych ludzi. Zazwyczaj tego nie robi�, ale dostaniesz swoj� szans�.
	B_GiveXP (200);
	hero_join_fn = false;
	gomez_kontakte = gomez_kontakte + 10;
	Log_SetTopicStatus	(CH1_AwansCien,	LOG_SUCCESS);
	B_LogEntry			(CH1_AwansCien,	"Stary Ob�z b�dzie od dzi� moim domem. Uda�o mi si� awansowa� na Cienia. Nie musz� ju� harowa� w kopalni i us�ugiwa� Stra�nikom.");
	MIS_AwansCien = LOG_SUCCESS;
	Info_ClearChoices	(DIA_Gomez_Hello);
};



func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Przemierzy�em spor� cz�� Kolonii i mam kontakty we wszystkich obozach.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //No! To si� mo�e przyda�. Z kim konkretnie utrzymujesz kontakty?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"To ju� wszyscy, z tych wa�niejszych." ,DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma �obuzami z Nowego Obozu."	,DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"Z Laresem."	,DIA_Gomez_Hello_Kontakte_Lares);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma Baalami w Obozie Bractwa."	,DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Z Cor Kalomem"	,DIA_Gomez_Hello_Kontakte_Kalom);
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Z Y'Berionem."	,DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Bo wi�kszo�� z twoich ludzi to leniwe ba�wany czyhaj�ce na jakiego� ��todzioba, kt�ry odwali za nich czarn� robot�.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //Tak jest, poza pewnymi chlubnymi wyj�tkami. Ale to jeszcze nie pow�d, �eby zatrudni� kolejnego leniwego ba�wana.
	hero_join_fn = false;
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Mam nadziej�, �e nie b�d� musia� odr�ba� ci g�owy, �eby udowodni�, �e potrafi� pos�ugiwa� si� broni�.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Pomi�dzy odwag� a g�upot� jest tylko cienka linia...
	hero_join_fn = false;
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Z Y'Berionem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion nie traci czasu na rozmowy z lud�mi twojego pokroju.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Z twoich k�amstw wnosz�, �e masz mnie za idiot�!
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Przykro mi, �e masz mnie za takiego g�upca.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nie lubi�, kiedy kto� sprawia mi przykro��.
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Z Cor Kalomem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Z kilkoma Baalami w Obozie Bractwa.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};



func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Z Laresem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Z kilkoma �obuzami z Nowego Obozu.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To ju� wszyscy, z tych wa�niejszych.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Nie�le - jak na ��todzioba.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Dostaniesz swoj� szans�.
		Info_ClearChoices	(DIA_Gomez_Hello);
		hero_join_fn = false;
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //I co? Mam by� pod wra�eniem?! Znam Kopaczy, kt�rzy maj� lepsze kontakty od ciebie!
		hero_join_fn = false;
		Info_ClearChoices	(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Dabei_Condition;
	information	= DIA_Gomez_Dabei_Info;
	permanent	= 0;
	description	= "To znaczy, �e jestem jednym z was?";
};                       

FUNC int DIA_Gomez_Dabei_Condition()
{
	if	(gomez_kontakte >= 4)
	&&	((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK) ) //|| (CanTellToGomezAboutSecretPath == TRUE)
	&& (kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Dabei_Info()
{
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //To znaczy, �e jestem jednym z was?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //W�a�nie tak. Witaj w dru�ynie, ch�opcze.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Kruk wprowadzi ci� w szczeg�y.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	//HeroJoinToOC ();
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry				(CH1_JoinOC,	"Od dzi� pracuj� dla Gomeza w Starym Obozie. Kruk ma mi udzieli� wszystkich potrzebnych informacji!");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);


	
	//MIS_Fire_Novize = LOG_FAILED;
	//Log_SetTopicStatus       (CH1_Fire_Novize, LOG_FAILED);
	AI_StopProcessInfos	(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_NurSo_Condition;
	information	= DIA_Gomez_NurSo_Info;
	permanent	= 1;
	description	= "Pomy�la�em, �e zdam ci raport...";
};                       

FUNC int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_NurSo_Info()
{
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Pomy�la�em, �e zdam ci raport...
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Id� porozmawia� z Krukiem. I nigdy wi�cej nie odzywaj si� do mnie bez pozwolenia!
};
//*****************************************
//******
///****** KAPITEL 33333 <3
///****************************************
// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> MagnatQuest
//========================================

INSTANCE DIA_Gomez_MagnatQuest (C_INFO)
{
   npc          = Ebr_100_Gomez;
   nr           = 1;
   condition    = DIA_Gomez_MagnatQuest_Condition;
   information  = DIA_Gomez_MagnatQuest_Info;
   permanent	= FALSE;
   important =1;
//   description	= "Stra�niku, podejd� tutaj!";
};

FUNC INT DIA_Gomez_MagnatQuest_Condition()
{
    if (Kapitel == 3)
    && (Npc_GetTrueGuild(hero) == GIL_GRD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gomez_MagnatQuest_Info()
{
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_01"); //Stra�niku, podejd� tutaj! Mam dla ciebie specjalne zadanie.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_02"); //Morok, m�j zaufany cz�owiek, otrzyma� ode mnie rozkazy.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_03"); //Wraz z towarzyszami mia� zbada� ma�� �wi�tyni� w dolinie nieopodal obozu.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_04"); //Od kilku dni nie ma od nich �adnych wie�ci. Widocznie sobie nie radz�.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_05"); //Id� tam i spr�buj im pom�c.
    MIS_QuestForHeavyArmor = LOG_RUNNING;

    Log_CreateTopic          (CH3_QuestForHeavyArmor, LOG_MISSION);
    Log_SetTopicStatus       (CH3_QuestForHeavyArmor, LOG_RUNNING);
    B_LogEntry               (CH3_QuestForHeavyArmor,"Gomez kaza� mi i�� do Stra�nika Moroka i sprawdzi�, jak wygl�da sytuacja zwi�zana z ma�� �wi�tyni� w dolinie.");
};

//========================================
//-----------------> SuperQuestSuccess
//========================================

INSTANCE DIA_Gomez_SuperQuestSuccess (C_INFO)
{
   npc          = Ebr_100_Gomez;
   nr           = 1;
   condition    = DIA_Gomez_SuperQuestSuccess_Condition;
   information  = DIA_Gomez_SuperQuestSuccess_Info;
   permanent	= FALSE;
   description	= "By�em w dolinie. Orkowie z miejsca kultu zostali wyeliminowani.";
};

FUNC INT DIA_Gomez_SuperQuestSuccess_Condition()
{
    if (MIS_BattleInTemple == LOG_SUCCESS)
    && (MIS_QuestForHeavyArmor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gomez_SuperQuestSuccess_Info()
{
    AI_Output (other, self ,"DIA_Gomez_SuperQuestSuccess_15_01"); //By�em w dolinie. Orkowie ze �wi�tyni zostali wyeliminowani.
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_02"); //Doskonale. Wiem, �e mia�e� w tym sw�j udzia�. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_03"); //Widz�, �e dobrze sobie radzisz. Zas�u�y�e�  na lepszy pancerz. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_04"); //Tylko nieliczni mog� go nosi�. Id� do Stone'a i popro� go o ci�k� zbroj�. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_05"); //Oczywi�cie b�dziesz mu musia� za ni� zap�aci�, ale to ju� nie moja sprawa. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_06"); //Mo�esz odej��.
    B_LogEntry               (CH3_QuestForHeavyArmor,"Gomez by� bardzo zadowolony z moich poczyna� w orkowych ruinach. Pozowli� mi nawet na zakup ci�kiej zbroi Stra�nika. Od teraz jestem ju� chyba kim� wa�nym w obozie.");
    Log_SetTopicStatus       (CH3_QuestForHeavyArmor, LOG_SUCCESS);
    MIS_QuestForHeavyArmor = LOG_SUCCESS;
	HeroCanBuy_GRDHARMOR = true; 
    B_GiveXP (575);

    AI_StopProcessInfos	(self);
};

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance  DIA_EBR_100_Gomez_Wait4SC (C_INFO)
{
	npc				= EBR_100_Gomez;
	condition		= DIA_EBR_100_Gomez_Wait4SC_Condition;
	information		= DIA_EBR_100_Gomez_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_100_Gomez_Wait4SC_Condition()
{	
	if	ExploreSunkenTower && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak si� tu dosta�e�?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Czekaj no? Czy to nie ty walczy�e� z naszymi lud�mi w Wolnej Kopalni?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Twoi ludzie nie mieli prawa jej atakowa�. Musia�em zapobiec twoim szalonym zap�dom.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Rozmowa ze mn� takim tonem wymaga pewnej odwagi. Ale zjawianie si� tutaj tak po prostu to ju� zwyk�a g�upota.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobi�cie dopilnuj�, �eby� ju� nigdy nie wszed� mi w drog�.
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Nareszcie nadszed� dzie�, w kt�rym sko�czy si� tyrania Gomeza. Ten cz�owiek za d�ugo ju� dzier�y� w�adz�, doprowadzaj�c przy tym do �mierci setek ludzi. Sprawiedliwo�� dotknie ka�dego. Tym razem sprawiedliwo�� ma moje imi�. ");
	AI_StopProcessInfos	( self );
	//fix er 1.4 explore_sunken_tower
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

	Npc_SetPermAttitude (self, ATT_HOSTILE);
	
	GRD_3917_Elitarny_straznik.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(GRD_3917_Elitarny_straznik, GIL_EBR );	
	Npc_SetPermAttitude (GRD_3917_Elitarny_straznik, ATT_HOSTILE);
	
	GRD_3916_Elitarny_straznik.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(GRD_3916_Elitarny_straznik, GIL_EBR );	
	Npc_SetPermAttitude (GRD_3916_Elitarny_straznik, ATT_HOSTILE);
	
	GRD_8800_Gardist.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(GRD_8800_Gardist, GIL_EBR );	
	Npc_SetPermAttitude (GRD_8800_Gardist, ATT_HOSTILE);
	
	GRD_8801_Gardist.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(GRD_8801_Gardist, GIL_EBR );	
	Npc_SetPermAttitude (GRD_8801_Gardist, ATT_HOSTILE);
};
instance dia_gomez_pickpocket(c_info) {
    npc = ebr_100_gomez;
    nr = 900;
    condition = dia_gomez_pickpocket_condition;
    information = dia_gomez_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gomez_pickpocket_condition() {
	e_beklauen(baseThfChanceEBR - 5, 50);
};

func void dia_gomez_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gomez_pickpocket);
	info_addchoice(dia_gomez_pickpocket, dialog_back, dia_gomez_pickpocket_back);
	info_addchoice(dia_gomez_pickpocket, dialog_pickpocket, dia_gomez_pickpocket_doit);
};

func void dia_gomez_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gomez_pickpocket);
};

func void dia_gomez_pickpocket_back() {
    info_clearchoices(dia_gomez_pickpocket);
};