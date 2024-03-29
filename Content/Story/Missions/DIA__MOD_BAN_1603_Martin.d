//poprawione i sprawdzone -  

//sprawdzone przez gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================


INSTANCE DIA_Martin_EXIT(C_INFO)
{
	npc             = BAN_1603_Martin;
	nr              = 999;
	condition	= DIA_Martin_EXIT_Condition;
	information	= DIA_Martin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Martin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTO
//========================================

INSTANCE DIA_Martin_KTOTO (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_KTOTO_Condition;
   information  = DIA_Martin_KTOTO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Martin_KTOTO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Martin_KTOTO_Info()
{
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_02"); //Nazywam si� Martin. Zajmuj� si� zaopatrzeniem Obozu.
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_03"); //Mo�esz mi co� sprzeda�?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_04"); //Sprzedaj� towary tylko Bandytom.
		Log_CreateTopic	(GE_Bandit,	LOG_NOTE);
		B_LogEntry		(GE_Bandit,	"Martin sprzedaje ekwipunek tylko Bandytom.");
};
//var int ArrowTreaderAmount;
//ArrowTreaderAmount = Npc_hasitems (self, ItAmArrow);
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Martin_TRADE (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 2;
   condition    = DIA_Martin_TRADE_Condition;
   information  = DIA_Martin_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Co masz na sprzeda�?";
};

FUNC INT DIA_Martin_TRADE_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU) || (przyjaciel_Bandytow == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Martin_TRADE_15_01"); //Co masz na sprzeda�?
    AI_Output (self, other ,"DIA_Martin_TRADE_03_02"); //Wybierz co�.
	
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> Trueasd
//========================================

INSTANCE DIA_Martin_Trueasd (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_Trueasd_Condition;
   information  = DIA_Martin_Trueasd_Info;
   permanent	= FALSE;
   description	= "Pono� chcecie sk��ci� Artegora z Gomezem.";
};

FUNC INT DIA_Martin_Trueasd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_Brothers))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_Trueasd_Info()
{
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_01"); //Pono� chcecie sk��ci� Artegora z Gomezem.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_02"); //Mo�liwe. Czemu ci tak na tym zale�y?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_03"); //Chc� uwolni� moich braci ze Starej Kopalni.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_04"); //Jakich braci? Aaa... tych �wir�w podobnych tobie?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_05"); //Miarkuj si� albo dostaniesz w �eb!
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_06"); //Spokojnie. Chcesz nam pom�c?
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_07"); //Chyba nie mam innego wyj�cia.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_08"); //Dobra, a wi�c plan jest taki...
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_09"); //Quentin szuka kogo�, kto zaniesie do Starego Obozu informacje o tym, co si� wydarzy�o w obozie przed kopalni�.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_10"); //Mo�e to by� jaki� by�y Stra�nik albo co� w tym stylu.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_11"); //Pom� nam odszuka� kogo� takiego, a reszta potoczy si� ju� sama.
    AI_Output (other, self ,"DIA_Martin_Trueasd_15_12"); //Spr�buj� co� zorganizowa�.
    AI_Output (self, other ,"DIA_Martin_Trueasd_03_13"); //Powodzenia.
    B_LogEntry                     (CH1_HelpBrothersBra,"Bandyci chc� doprowadzi� do starcia Gomeza z Artegorem. Je�eli wszystko dobrze si� u�o�y, powybijaj� si� nawzajem. Musz� znale�� kogo�, kto zaniesie informacje o wyczynach Artegora do Starego Obozu.");

    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Camik
//========================================

INSTANCE DIA_Martin_Camik (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 2;
   condition    = DIA_Martin_Camik_Condition;
   information  = DIA_Martin_Camik_Info;
   permanent	= FALSE;
   description	= "Gdzie znajduje si� wasz Ob�z?";
};

FUNC INT DIA_Martin_Camik_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_Camik_Info()
{
    AI_Output (other, self ,"DIA_Martin_Camik_15_01"); //Gdzie znajduje si� wasz Ob�z?
    AI_Output (self, other ,"DIA_Martin_Camik_03_02"); //W g�rach. Wst�p do niego maj� tylko zaufane osoby.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Martin_HELLO3 (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 3;
   condition    = DIA_Martin_HELLO3_Condition;
   information  = DIA_Martin_HELLO3_Info;
   permanent	= FALSE;
   description	= "Kto wami dowodzi?";
};

FUNC INT DIA_Martin_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Martin_HELLO3_15_01"); //Kto wami dowodzi?
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_02"); //Oczywi�cie Quentin. To twardy go��.
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_03"); //Chcesz si� do nas przy��czy�?
    AI_Output (self, other ,"DIA_Martin_HELLO3_03_04"); //Teraz ju� na to za p�no.
};

//========================================
//-----------------> ScorpioTalk
//========================================

INSTANCE DIA_Martin_ScorpioTalk (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_ScorpioTalk_Condition;
   information  = DIA_Martin_ScorpioTalk_Info;
   permanent	= FALSE;
   description	= "Nam�wi�em Skorpiona.";
};

FUNC INT DIA_Martin_ScorpioTalk_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    && (przekupionyGRD == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_ScorpioTalk_Info()
{
    AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_01"); //Nam�wi�em Skorpiona.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_02"); //Powiedzia� ju� Stra�nikom, co si� tutaj dzieje.
 // AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_03"); //Powiedzia�, �e zrobi to wkr�tce.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_04"); //Szybko si� uwin��. Zanim tu przyszed�e� widzia�em oddzia� Stra�nik�w zmierzaj�cy w stron� kopalni.
    //PlayVideo ("Ataknakopalnie.BIK");
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_05"); //Cholera, co tam si� sta�o?
    AI_Output (other, self ,"DIA_Martin_ScorpioTalk_15_06"); //Co teraz mam zrobi�?
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_07"); //Zakradnij si� tam i zobacz, jak wygl�da sytuacja.
    AI_Output (self, other ,"DIA_Martin_ScorpioTalk_03_08"); //Tylko ostro�nie!
    B_LogEntry                     (CH1_HelpBrothersBra,"Przed chwil� Martin ujrza� oddzia� Stra�nik�w id�cy w kierunku Starej Kopalni. Nie mam poj�cia, co wydarzy�o si� w obozie przed kopalni�. Musz� jak najszybciej uda� si� do obozu przed kopalni� i zobaczy�, co tam si� sta�o.");
	B_Story_BattleInOldMineCamp ();
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

instance dia_martin_pickpocket(c_info) {
    npc = ban_1603_martin;
    nr = 900;
    condition = dia_martin_pickpocket_condition;
    information = dia_martin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_martin_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_martin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_martin_pickpocket);
	info_addchoice(dia_martin_pickpocket, dialog_back, dia_martin_pickpocket_back);
	info_addchoice(dia_martin_pickpocket, dialog_pickpocket, dia_martin_pickpocket_doit);
};

func void dia_martin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_martin_pickpocket);
};

func void dia_martin_pickpocket_back() {
    info_clearchoices(dia_martin_pickpocket);
};