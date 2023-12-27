//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_HunterE_EXIT(C_INFO)
{
	npc             = NON_5605_Hunter;
	nr              = 999;
	condition	= DIA_HunterE_EXIT_Condition;
	information	= DIA_HunterE_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_HunterE_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_HunterE_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

instance dia_non_5605_pickpocket(c_info) {
    npc = non_5605_hunter;
    nr = 900;
    condition = dia_non_5605_pickpocket_condition;
    information = dia_non_5605_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5605_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_non_5605_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5605_pickpocket);
	info_addchoice(dia_non_5605_pickpocket, dialog_back, dia_non_5605_pickpocket_back);
	info_addchoice(dia_non_5605_pickpocket, dialog_pickpocket, dia_non_5605_pickpocket_doit);
};

func void dia_non_5605_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_5605_pickpocket);
};

func void dia_non_5605_pickpocket_back() {
    info_clearchoices(dia_non_5605_pickpocket);
};
