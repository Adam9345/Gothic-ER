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
	description	= "Przychodzê zaoferowaæ swoje us³ugi.";
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
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Przychodzê zaoferowaæ swoje us³ugi.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //Œmiesz tak po prostu tutaj wmaszerowaæ i zawracaæ mi g³owê? Ty gnido! STRA¯!
	
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
	description	= "Przychodzê zaoferowaæ swoje us³ugi.";
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
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Przychodzê zaoferowaæ swoje us³ugi.
	if (Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //A dlaczego myœlisz, ¿e potrzebujê twoich us³ug?
	
	Info_ClearChoices	(DIA_Gomez_Hello);	
	//opcje podstawowe
	Info_AddChoice		(DIA_Gomez_Hello,"Mam nadziejê, ¿e nie bêdê musia³ udowodniæ, ¿e potrafiê pos³ugiwaæ siê broni¹." 	,DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Bo wiêkszoœæ z twoich ludzi to leniwe ba³wany."									,DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Przemierzy³em spor¹ czêœæ Kolonii i mam kontakty we wszystkich obozach."			,DIA_Gomez_Hello_Kontakte);
	//test zaufania
	if (Diego_BringList == LOG_SUCCESS)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"Przeszed³em test zaufania."							,DIA_Gomez_Hello_ThorusSays);
	};
	//œcie¿ka do kopalni
	if (CanTellToGomezAboutSecretPath == TRUE)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"Pomog³em odnaleŸæ ukryt¹ œcie¿kê do Wolnej Kopalni!"	,DIA_Gomez_Hello_MineENter);
	};
	//kopacz
	if (MIS_Kopacz == LOG_SUCCESS) && (MIS_TestOc == LOG_SUCCESS)
    {
	Info_AddChoice		(DIA_Gomez_Hello,"By³em Kopaczem. Przeszed³em d³ug¹ drogê."				,DIA_Gomez_Hello_Buddler);
	};
	
	}
	else
	{
	AI_Output (self, other,"DIA_Gomez_Hello_MOD_02"); //Nie jesteœ kimœ, kto powinien siê tu znaleŸæ. 
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
	};
	
};

//NIEAKTUALNE
func void DIA_Gomez_Hello_Firenovize () 
{
	AI_Output (other, self,"DIA_Gomez_Hello_Firenovize_15_00"); //Mam aprobatê Magów Ognia. Chcê byæ Nowicjuszem Ognia.
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_01"); //Aprobatê Magów Ognia... Ha!
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_02"); //Magowie staj¹ siê coraz bardziej bezczelni i samowolni. Wspó³praca z Nowym Obozem. Te¿ mi coœ.
	AI_Output (self, other,"DIA_Gomez_Hello_Firenovize_11_03"); //Marnujesz czas na Magów, ale to twój wybór. No dobrze. Przyjmê ciê w szeregi moich ludzi. 
	gomez_kontakte = gomez_kontakte + 10;
	hero_join_fn = true;
	B_LogEntry                     (CH1_FireNovize,"Gomez chyba nie przepada za Magami Ognia, ale przyj¹³ mnie bez wiêkszych problemów. Czas porozmawiaæ z Torrezem.");
	Info_ClearChoices	(DIA_Gomez_Hello);
};

func void DIA_Gomez_Hello_MineENter ()
{
	AI_Output (other, self,"DIA_Gomez_Hello_MineENter_15_00"); //Pomog³em odnaleŸæ ukryt¹ œcie¿kê do Wolnej Kopalni!
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_01"); //To siê mo¿e przydaæ! S³ysza³em ju¿ wstêpne wieœci od moich ludzi.
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_03"); //A wiêc to o tobie wszyscy mówi¹.
	AI_Output (self, other,"DIA_Gomez_Hello_MineENter_11_04"); //Pos³uchaj: gdybym ciê teraz nie przyj¹³, by³bym g³upcem. Witaj wœród nas!
	MIS_FlintsOffer = LOG_SUCCESS;
	gomez_kontakte = gomez_kontakte + 10;
    Log_SetTopicStatus       (CH1_FlintsOffer, LOG_SUCCESS);
	hero_join_fn = false;
    B_LogEntry                     (CH1_FlintsOffer,"Gomez by³ bardzo uradowany z moich dokonañ.");
	Info_ClearChoices	(DIA_Gomez_Hello);
};


func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Przeszed³em test zaufania, a Thorus twierdzi, ¿e siê nadajê.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Gdyby tak nie by³o, nie dosta³byœ siê tutaj ¿ywy. Mam nadziejê, ¿e staæ ciê jeszcze na wiêcej.
	hero_join_fn = false;
};

func void DIA_Gomez_Hello_Buddler()
{
    AI_Output (other, self,"DIA_Gomez_Hello_Buddler_15_00"); //By³em Kopaczem. Przeszed³em d³ug¹ drogê.
	AI_Output (self, other,"DIA_Gomez_Hello_Buddler_11_01"); //Masz sporo doœwiadczenia. To siê bardzo chwali.
	AI_Output (self, other,"DIA_Gomez_Hello_Buddler_11_02"); //Szanujê lojalnych ludzi. Zazwyczaj tego nie robiê, ale dostaniesz swoj¹ szansê.
	B_GiveXP (200);
	hero_join_fn = false;
	gomez_kontakte = gomez_kontakte + 10;
	Log_SetTopicStatus	(CH1_AwansCien,	LOG_SUCCESS);
	B_LogEntry			(CH1_AwansCien,	"Stary Obóz bêdzie od dziœ moim domem. Uda³o mi siê awansowaæ na Cienia. Nie muszê ju¿ harowaæ w kopalni i us³ugiwaæ Stra¿nikom.");
	MIS_AwansCien = LOG_SUCCESS;
	Info_ClearChoices	(DIA_Gomez_Hello);
};



func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Przemierzy³em spor¹ czêœæ Kolonii i mam kontakty we wszystkich obozach.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //No! To siê mo¿e przydaæ. Z kim konkretnie utrzymujesz kontakty?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"To ju¿ wszyscy, z tych wa¿niejszych." ,DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma ³obuzami z Nowego Obozu."	,DIA_Gomez_Hello_Kontakte_NLHehler);
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
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Bo wiêkszoœæ z twoich ludzi to leniwe ba³wany czyhaj¹ce na jakiegoœ ¿ó³todzioba, który odwali za nich czarn¹ robotê.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //Tak jest, poza pewnymi chlubnymi wyj¹tkami. Ale to jeszcze nie powód, ¿eby zatrudniæ kolejnego leniwego ba³wana.
	hero_join_fn = false;
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Mam nadziejê, ¿e nie bêdê musia³ odr¹baæ ci g³owy, ¿eby udowodniæ, ¿e potrafiê pos³ugiwaæ siê broni¹.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Pomiêdzy odwag¹ a g³upot¹ jest tylko cienka linia...
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
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion nie traci czasu na rozmowy z ludŸmi twojego pokroju.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Z twoich k³amstw wnoszê, ¿e masz mnie za idiotê!
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Przykro mi, ¿e masz mnie za takiego g³upca.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nie lubiê, kiedy ktoœ sprawia mi przykroœæ.
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
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Z kilkoma ³obuzami z Nowego Obozu.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To ju¿ wszyscy, z tych wa¿niejszych.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //NieŸle - jak na ¿ó³todzioba.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Dostaniesz swoj¹ szansê.
		Info_ClearChoices	(DIA_Gomez_Hello);
		hero_join_fn = false;
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //I co? Mam byæ pod wra¿eniem?! Znam Kopaczy, którzy maj¹ lepsze kontakty od ciebie!
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
	description	= "To znaczy, ¿e jestem jednym z was?";
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
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //To znaczy, ¿e jestem jednym z was?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //W³aœnie tak. Witaj w dru¿ynie, ch³opcze.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Kruk wprowadzi ciê w szczegó³y.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	//HeroJoinToOC ();
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry				(CH1_JoinOC,	"Od dziœ pracujê dla Gomeza w Starym Obozie. Kruk ma mi udzieliæ wszystkich potrzebnych informacji!");
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
	description	= "Pomyœla³em, ¿e zdam ci raport...";
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
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Pomyœla³em, ¿e zdam ci raport...
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //IdŸ porozmawiaæ z Krukiem. I nigdy wiêcej nie odzywaj siê do mnie bez pozwolenia!
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
//   description	= "Stra¿niku, podejdŸ tutaj!";
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
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_01"); //Stra¿niku, podejdŸ tutaj! Mam dla ciebie specjalne zadanie.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_02"); //Morok, mój zaufany cz³owiek, otrzyma³ ode mnie rozkazy.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_03"); //Wraz z towarzyszami mia³ zbadaæ ma³¹ œwi¹tyniê w dolinie nieopodal obozu.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_04"); //Od kilku dni nie ma od nich ¿adnych wieœci. Widocznie sobie nie radz¹.
    AI_Output (self, other ,"DIA_Gomez_MagnatQuest_03_05"); //IdŸ tam i spróbuj im pomóc.
    MIS_QuestForHeavyArmor = LOG_RUNNING;

    Log_CreateTopic          (CH3_QuestForHeavyArmor, LOG_MISSION);
    Log_SetTopicStatus       (CH3_QuestForHeavyArmor, LOG_RUNNING);
    B_LogEntry               (CH3_QuestForHeavyArmor,"Gomez kaza³ mi iœæ do Stra¿nika Moroka i sprawdziæ, jak wygl¹da sytuacja zwi¹zana z ma³¹ œwi¹tyni¹ w dolinie.");
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
   description	= "By³em w dolinie. Orkowie z miejsca kultu zostali wyeliminowani.";
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
    AI_Output (other, self ,"DIA_Gomez_SuperQuestSuccess_15_01"); //By³em w dolinie. Orkowie ze œwi¹tyni zostali wyeliminowani.
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_02"); //Doskonale. Wiem, ¿e mia³eœ w tym swój udzia³. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_03"); //Widzê, ¿e dobrze sobie radzisz. Zas³u¿y³eœ  na lepszy pancerz. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_04"); //Tylko nieliczni mog¹ go nosiæ. IdŸ do Stone'a i poproœ go o ciê¿k¹ zbrojê. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_05"); //Oczywiœcie bêdziesz mu musia³ za ni¹ zap³aciæ, ale to ju¿ nie moja sprawa. 
    AI_Output (self, other ,"DIA_Gomez_SuperQuestSuccess_03_06"); //Mo¿esz odejœæ.
    B_LogEntry               (CH3_QuestForHeavyArmor,"Gomez by³ bardzo zadowolony z moich poczynañ w orkowych ruinach. Pozowli³ mi nawet na zakup ciê¿kiej zbroi Stra¿nika. Od teraz jestem ju¿ chyba kimœ wa¿nym w obozie.");
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
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak siê tu dosta³eœ?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Czekaj no? Czy to nie ty walczy³eœ z naszymi ludŸmi w Wolnej Kopalni?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Twoi ludzie nie mieli prawa jej atakowaæ. Musia³em zapobiec twoim szalonym zapêdom.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Rozmowa ze mn¹ takim tonem wymaga pewnej odwagi. Ale zjawianie siê tutaj tak po prostu to ju¿ zwyk³a g³upota.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobiœcie dopilnujê, ¿ebyœ ju¿ nigdy nie wszed³ mi w drogê.
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Nareszcie nadszed³ dzieñ, w którym skoñczy siê tyrania Gomeza. Ten cz³owiek za d³ugo ju¿ dzier¿y³ w³adzê, doprowadzaj¹c przy tym do œmierci setek ludzi. Sprawiedliwoœæ dotknie ka¿dego. Tym razem sprawiedliwoœæ ma moje imiê. ");
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