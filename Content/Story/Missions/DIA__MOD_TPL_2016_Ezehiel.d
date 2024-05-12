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