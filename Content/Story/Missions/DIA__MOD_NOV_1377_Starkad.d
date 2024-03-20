//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patros_EXIT(C_INFO)
{
	npc         = NOV_1377_Starkad;
	nr          = 999;
	condition	= DIA_Patros_EXIT_Condition;
	information	= DIA_Patros_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Patros_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patros_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Patros_HELLO (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 1;
   condition    = DIA_Patros_HELLO_Condition;
   information  = DIA_Patros_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patros_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Patros_HELLO_03_01"); //Ej, nowy! Jestem Starkad. Handluj� �ywno�ci�. U mnie wszystko po niskich cenach.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"Starkad z Obozu Bractwa handluje �ywno�ci�. Znajd� go pod chat� Kaloma.");
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Patros_TRADE (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 2;
   condition    = DIA_Patros_TRADE_Condition;
   information  = DIA_Patros_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy.";
};

FUNC INT DIA_Patros_TRADE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patros_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patros_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Patros_TRADE_15_01"); //Pohandlujmy.
    AI_Output (self, other ,"DIA_Patros_TRADE_03_02"); //Zobacz tylko.
	B_ClearTreaderAmmo(self);
 
};

var int prize_Starkad_loans;
//========================================
//-----------------> QUEST1_POMOC
//========================================

INSTANCE DIA_Patros_QUEST1_POMOC (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 3;
   condition    = DIA_Patros_QUEST1_POMOC_Condition;
   information  = DIA_Patros_QUEST1_POMOC_Info;
   permanent	= FALSE;
   description	= "Szukam pracy. Handlarze cz�sto czego� potrzebuj�.";
};

FUNC INT DIA_Patros_QUEST1_POMOC_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_QUEST1_POMOC_Info()
{
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_01"); //Szukam pracy. Handlarze cz�sto czego� potrzebuj�.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_02"); //Mam pewne zlecenie dla kogo� takiego jak ty. Podejmiesz si�?
    AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_03"); //Chc� pozna� szczeg�y.
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_04"); //Ostatnio kilka os�b zalega mi z zap�at�. Chc�, aby� �ci�gn�� d�ugi. Nic trudnego. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_05"); //D�ugi maj�: Joru, Darrion i Gor Na Idon. Tutaj masz list� z informacj� ile kto jest d�u�ny.
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC_15_06"); //Porozmawiajmy o zap�acie.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC_03_07"); //Ile chcesz?
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
    Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "25 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_25);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "50 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_50);
	Info_AddChoice		(DIA_Patros_QUEST1_POMOC, "100 bry�ek rudy.", DIA_Patros_QUEST1_POMOC_100);

};

func void RunQuest_OszukanyHandlarz ()
{
    MIS_CheatedMerchant = LOG_RUNNING;
	CreateInvItems (self, ItCH1_ListaDlugowPatrosa, 1);
    B_GiveInvItems (self, other, ItCH1_ListaDlugowPatrosa, 1);
    Log_CreateTopic          (CH1_CheatedMerchant, LOG_MISSION);
    Log_SetTopicStatus       (CH1_CheatedMerchant, LOG_RUNNING);
    B_LogEntry               (CH1_CheatedMerchant,"Starkad kaza� mi zebra� rud� od zalegaj�cych mu j� mieszka�c�w obozu: Gor Na Idona, Joru i Darriona.");
};

func void DIA_Patros_QUEST1_POMOC_25 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC25_15_01"); //25 bry�ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC25_03_02"); //Co? Za zebranie d�ug�w?! A zreszt�... niech b�dzie.
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 25;
};

func void DIA_Patros_QUEST1_POMOC_50 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_01"); //50 bry�ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_02"); //Przecie� to rozb�j!
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC50_15_03"); //Wiem, �e handlarze maj� przy sobie wi�ksze sumy... Nikt inny tego dla ciebie nie zrobi.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC50_03_04"); //No dobra. Tylko si� po�piesz!
	RunQuest_OszukanyHandlarz ();
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	prize_Starkad_loans = prize_Starkad_loans + 50;
};

func void DIA_Patros_QUEST1_POMOC_100 ()
{
	AI_Output (other, self ,"DIA_Patros_QUEST1_POMOC100_15_01"); //100 bry�ek rudy.
	AI_Output (self, other ,"DIA_Patros_QUEST1_POMOC100_03_02"); //Szkoda na ciebie czasu!
	Info_ClearChoices	(DIA_Patros_QUEST1_POMOC);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> QUEST1_OK
//========================================

INSTANCE DIA_Patros_QUEST1_OK (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 4;
   condition    = DIA_Patros_QUEST1_OK_Condition;
   information  = DIA_Patros_QUEST1_OK_Info;
   permanent	= FALSE;
   description	= "Mam rud�, kt�r� zalegali mieszka�cy Obozu. ";
};

FUNC INT DIA_Patros_QUEST1_OK_Condition()
{
    if (MIS_CheatedMerchant == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=250)
	&& (Npc_KnowsInfo (hero, DIA_GorNaToth_IdonDebt))
	&& (Npc_KnowsInfo (hero, DIA_Joru_ORE))
	&& (Npc_KnowsInfo (hero, DIA_Darrion_ORE))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Patros_QUEST1_OK_Info()
{
    AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_01"); //Mam rud�, kt�r� zalegali mieszka�cy Obozu. 
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_02"); //Nawet t� od Gor Na Idona?
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_03"); //Tak, nawet j�.
    AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_04"); //�wietna robota.
	AI_Output (other, self ,"DIA_Patros_QUEST1_OK_15_05"); //Nie tak pr�dko! Dawaj nagrod�. Umawiali�my si� przecie�.
	AI_Output (self, other ,"DIA_Patros_QUEST1_OK_03_06"); //Ach tak. Prosz�.
    B_LogEntry               (CH1_CheatedMerchant,"Odda�em rud� Starkadowi, a w zamian otrzyma�em tyle bry�ek, ile wcze�niej wynegocjowa�em.");
    Log_SetTopicStatus       (CH1_CheatedMerchant, LOG_SUCCESS);
    MIS_CheatedMerchant = LOG_SUCCESS;
	
	CreateInvItems (self, itminugget, prize_Starkad_loans);
    B_GiveInvItems (self, other, itminugget, prize_Starkad_loans);
	
	B_GiveInvItems (other, self, itminugget, 250);
	B_GiveXP (200);
};



// poprawione b��dy - 30 pa�dziernik 2012
//========================================
//-----------------> PLOTY
//========================================

INSTANCE DIA_Patros_PLOTY (C_INFO)
{
   npc          = NOV_1377_Starkad;
   nr           = 1;
   condition    = DIA_Patros_PLOTY_Condition;
   information  = DIA_Patros_PLOTY_Info;
   permanent	= FALSE;
   description	= "S�ysza�e� mo�e jakie� plotki?";
};

FUNC INT DIA_Patros_PLOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Patros_PLOTY_Info()
{
    AI_Output (other, self ,"DIA_Patros_PLOTY_15_01"); //S�ysza�e� mo�e jakie� plotki?
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_02"); //Ludzie m�wi�, �e jeden z Nowicjuszy rozpocz�� badania na w�asn� r�k�.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_03"); //Podobno przesiaduje w pobli�u ma�ej palisady przy placu Baal Tondrala.
    AI_Output (self, other ,"DIA_Patros_PLOTY_03_04"); //Je�eli Shan si� o tym dowie, zacznie go szuka�.
};

instance dia_starkad_pickpocket(c_info) {
    npc = nov_1377_starkad;
    nr = 900;
    condition = dia_starkad_pickpocket_condition;
    information = dia_starkad_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_starkad_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_starkad_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_starkad_pickpocket);
	info_addchoice(dia_starkad_pickpocket, dialog_back, dia_starkad_pickpocket_back);
	info_addchoice(dia_starkad_pickpocket, dialog_pickpocket, dia_starkad_pickpocket_doit);
};

func void dia_starkad_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_starkad_pickpocket);
};

func void dia_starkad_pickpocket_back() {
    info_clearchoices(dia_starkad_pickpocket);
};
