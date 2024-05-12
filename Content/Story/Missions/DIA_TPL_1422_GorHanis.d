//poprawione i sprawdzone - Reflide

// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
if (kapitel < 4) {
	return 1; };
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walczê ku chwale wielkiego Œni¹cego!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Walczysz na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Walczysz na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta³em wybrany przez moich mistrzów, by broniæ na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przyœwieca mi wiêc wy¿szy cel. Walczê, by pokazaæ niewiernym jak wielka jest potêga Œni¹cego!
};

// **************************************************
//					Schläfer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Kim jest Œni¹cy?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //W naszym Obozie znajdziesz œwiêtych mê¿ów, którzy odpowiedz¹ ci na to pytanie znacznie lepiej ni¿ ja.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Powiem ci tylko tyle: Œni¹cy bêdzie naszym zbawicielem. Przyprowadzi³ nas tutaj i z jego pomoc¹ uda siê nam st¹d wydostaæ.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Chcesz przez to powiedzieæ, ¿e czekacie a¿ wasz bóg zwróci wam wolnoœæ?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Tak! Nasze oczekiwanie wkrótce dobiegnie koñca. W tej chwili przygotowujemy siê do rytua³u wielkiego przyzwania.
};

// **************************************************
//					Große Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Na czym polega rytua³, który planujecie?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Na czym polega rytua³, który planujecie?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Nasi prorocy przewidzieli, ¿e wspólne przywo³anie Œni¹cego jest jedyn¹ drog¹ do odzyskania wolnoœci!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Jeœli chcesz siê jeszcze czegoœ dowiedzieæ, powinieneœ udaæ siê do naszego obozu.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "Móg³byœ opisaæ mi drogê do waszego Obozu?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if (( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //Móg³byœ opisaæ mi drogê do waszego Obozu?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, którzy chêtnie wska¿¹ ci drogê do obozu na bagnie. ZnajdŸ któregoœ z nich i porozmawiaj z nim!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Wyzywam ciê na pojedynek na arenie!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Wyzywam ciê na pojedynek na arenie!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Zabicie kogoœ takiego jak ty raczej nie przysporzy chwa³y Œni¹cemu.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Stanê z tob¹ w szranki dopiero w tedy, gdy oka¿esz siê godnym rywalem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Ale jestem pewien, ¿e wojownicy z Nowego Obozu nie bêd¹ mieli takich skrupu³ów...
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge)) && (kapitel < 4)
	&& (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Czy jestem ju¿ doœæ silny, ¿eby siê z tob¹ zmierzyæ?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Nie! Jesteœ jeszcze zbyt s³aby. Nie sprostasz mi w walce!
};

//========================================
//-----------------> Guaz
//========================================

INSTANCE DIA_GorHanis_Guaz (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_Guaz_Condition;
   information  = DIA_GorHanis_Guaz_Info;
   permanent	= FALSE;
   description	= "Mam ten kamieñ.";
};

FUNC INT DIA_GorHanis_Guaz_Condition()
{
    if (MIS_PsiAbadonedMine == LOG_RUNNING)
    && (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Guaz_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_01"); //Mam ten kamieñ.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_02"); //Czyli kopalnia jest ju¿ czysta?
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_03"); //Tak.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_04"); //WeŸ go ze sob¹. Nam siê nie przyda.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_05"); //Zostaniemy tu na stra¿y kopalni, a ty idŸ do Angara.
    B_LogEntry                     (CH4_PsiAbadonedMine,"Zdobywaj¹c artefakt, oczyœci³em kopalniê z o¿ywieñców. Cor Angar bêdzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
   B_GiveXP (500);  
  AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO2212e
//========================================

INSTANCE DIA_GorHanis_HELLO2212e (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLO2212e_Condition;
   information  = DIA_GorHanis_HELLO2212e_Info;
   permanent	= FALSE;
   description	= "Uciek³eœ ze Starego Obozu?";
};

FUNC INT DIA_GorHanis_HELLO2212e_Condition()
{
    if (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLO2212e_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212e_15_01"); //Uciek³eœ ze Starego Obozu?
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_02"); //W ostatniej chwili! Co to by³a za ucieczka.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_03"); //W nocy us³ysza³em ha³asy. Pomyœla³em, ¿e Œni¹cy chce mi siê objawiæ!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_04"); //Jednak okaza³o siê, ¿e to Stra¿nicy podrzynali gard³o temu barbarzyñcy, Kharimowi.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_05"); //Czym prêdzej zebra³em swoje rzeczy i uciek³em zanim weszli do mojej chaty.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_06"); //Stary Obóz to bardzo niebezpieczne miejsce dla obcych.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_07"); //Lepiej tam nie idŸ.
   
};
//-------------------------------------------------------------------------1.6.1-------------------------------------------------------------------------------
//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLO2212eS (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLO2212eS_Condition;
   information  = DIA_GorHanis_HELLO2212eS_Info;
   permanent	= FALSE;
   description	= "Masz ze mn¹ walczyæ na arenie.";
};

FUNC INT DIA_GorHanis_HELLO2212eS_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Scatty_Dlug2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLO2212eS_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212eS_15_01"); //Masz ze mn¹ walczyæ na arenie.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212eS_03_02"); //S³ysza³em. Zatem czas skrzy¿owaæ miecze w imiê Œni¹cego!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212eS_03_03"); //ChodŸmy.
   	AI_StopProcessInfos	( self );
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
	Hanis_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GuideS");
   
};

//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLOBRON (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLOBRON_Condition;
   information  = DIA_GorHanis_HELLOBRON_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_HELLOBRON_Condition()
{
    if Npc_KnowsInfo (hero,DIA_GorHanis_HELLO2212eS)
	&&(Npc_GetDistToWP(TPL_1422_GorHanis,"OCR_ARENABATTLE_TRAIN")<300) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLOBRON_Info()
{
    AI_Output (self,other,"DIA_GorHanis_HELLOBRON_15_01"); //Wyci¹gnij broñ!  
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	walczyl_HanisG = true;
};




//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLODLUG (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLODLUG_Condition;
   information  = DIA_GorHanis_HELLODLUG_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_HELLODLUG_Condition()
{
    if (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_GorHanis_HELLOBRON))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLODLUG_Info()
{
    AI_Output (self,other,"DIA_GorHanis_HELLODLUG_15_01"); //A wiêc przegra³em ale to doœwiadczenie nie pójdzie na marne!
    TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
	HanisPokonany = TRUE;
	Npc_ExchangeRoutine( self,"start");
};

//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_PRZEGRANA (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_PRZEGRANADLUG_Condition;
   information  = DIA_GorHanis_PRZEGRANADLUG_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_PRZEGRANADLUG_Condition()
{
    if (TPL_1422_GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_GorHanis_HELLOBRON))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_PRZEGRANADLUG_Info()
{
    AI_Output (self,other,"DIA_GorHanis_PRZEGRANADLUG_15_01"); //To by³a dobra walka, ale musisz jeszcze trochê nad sob¹ popracowaæ.
	Npc_ExchangeRoutine( self,"start");
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
};

instance dia_hanis_pickpocket(c_info) {
    npc = tpl_1422_gorhanis;
    nr = 900;
    condition = dia_hanis_pickpocket_condition;
    information = dia_hanis_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanis_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_hanis_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanis_pickpocket);
	info_addchoice(dia_hanis_pickpocket, dialog_back, dia_hanis_pickpocket_back);
	info_addchoice(dia_hanis_pickpocket, dialog_pickpocket, dia_hanis_pickpocket_doit);
};

func void dia_hanis_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hanis_pickpocket);
};

func void dia_hanis_pickpocket_back() {
    info_clearchoices(dia_hanis_pickpocket);
};
