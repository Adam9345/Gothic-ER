//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  Tpl_1436_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1436_Templer;
	nr			=  999;
	condition	=  Tpl_1436_Templer_Exit_Condition;
	information	=  Tpl_1436_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Tpl_1436_Templer_CRAWLER (C_INFO)
{
	npc				= Tpl_1436_Templer;
	condition		= Tpl_1436_Templer_CRAWLER_Condition;
	information		= Tpl_1436_Templer_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co s�ycha�?"; 
};

FUNC int  Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

FUNC void  Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output (other, self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //Co s�ycha�?
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Polujemy na pe�zacze. Przy okazji bronimy Kopaczy przed atakami tych bestii.
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //Jednak tak naprawd� interesuje nas wydzielina pe�zaczy. Nasz Guru, Cor Kalom, przygotuje z niej magiczny wywar.
};  

instance dia_tpl_1436_pickpocket(c_info) {
    npc = tpl_1436_templer;
    nr = 900;
    condition = dia_tpl_1436_pickpocket_condition;
    information = dia_tpl_1436_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1436_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1436_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1436_pickpocket);
	info_addchoice(dia_tpl_1436_pickpocket, dialog_back, dia_tpl_1436_pickpocket_back);
	info_addchoice(dia_tpl_1436_pickpocket, dialog_pickpocket, dia_tpl_1436_pickpocket_doit);
};

func void dia_tpl_1436_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_tpl_1436_pickpocket);
};

func void dia_tpl_1436_pickpocket_back() {
    info_clearchoices(dia_tpl_1436_pickpocket);
};




