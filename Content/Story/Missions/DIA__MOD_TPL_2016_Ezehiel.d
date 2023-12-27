//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ezehiel_EXIT(C_INFO)
{
	npc             = TPL_3054_Ezehiel;
	nr              = 999;
	condition	= DIA_Ezehiel_EXIT_Condition;
	information	= DIA_Ezehiel_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ezehiel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ezehiel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> VERY_IMPORTANT
//========================================

INSTANCE DIA_Ezehiel_VERY_IMPORTANT (C_INFO)
{
   npc          = TPL_3054_Ezehiel;
   nr           = 1;
   condition    = DIA_Ezehiel_VERY_IMPORTANT_Condition;
   information  = DIA_Ezehiel_VERY_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ezehiel_VERY_IMPORTANT_Condition()
{
    if (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ezehiel_VERY_IMPORTANT_Info()
{
    AI_Output (self, other ,"DIA_Ezehiel_VERY_IMPORTANT_03_01"); //Zaczekaj. Mam wa¿n¹ wiadomoœæ z Bractwa.
    AI_Output (other, self ,"DIA_Ezehiel_VERY_IMPORTANT_15_02"); //Co jest?
    AI_Output (self, other ,"DIA_Ezehiel_VERY_IMPORTANT_03_03"); //Shan chce ciê pilnie widzieæ. Ma dla ciebie zadanie.
    MIS_BanditNeedPsionicHelp = LOG_RUNNING;

    Log_CreateTopic            (CH4_BanditNeedPsionicHelp, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditNeedPsionicHelp, LOG_RUNNING);
    B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Mam jak najszybciej udaæ siê do Shana. Mogê skorzystaæ z mojej runy teleportacji do Bractwa.");
    AI_StopProcessInfos	(self);
};

instance dia_ezehiel_pickpocket(c_info) {
    npc = tpl_3054_ezehiel;
    nr = 900;
    condition = dia_ezehiel_pickpocket_condition;
    information = dia_ezehiel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ezehiel_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 35);
};

func void dia_ezehiel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ezehiel_pickpocket);
	info_addchoice(dia_ezehiel_pickpocket, dialog_back, dia_ezehiel_pickpocket_back);
	info_addchoice(dia_ezehiel_pickpocket, dialog_pickpocket, dia_ezehiel_pickpocket_doit);
};

func void dia_ezehiel_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_ezehiel_pickpocket);
};

func void dia_ezehiel_pickpocket_back() {
    info_clearchoices(dia_ezehiel_pickpocket);
};