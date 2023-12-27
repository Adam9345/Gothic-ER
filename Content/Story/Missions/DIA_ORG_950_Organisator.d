//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator50_EXIT(C_INFO)
{
	npc             = ORG_950_Organisator;
	nr              = 999;
	condition	= DIA_Organisator50_EXIT_Condition;
	information	= DIA_Organisator50_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator50_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator50_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Organisator50_HELLO1 (C_INFO)
{
   npc          = ORG_950_Organisator;
   nr           = 1;
   condition    = DIA_Organisator50_HELLO1_Condition;
   information  = DIA_Organisator50_HELLO1_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Organisator50_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator50_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Organisator50_HELLO1_15_01"); //Co tam?
    if (MIS_LurkersInHut == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Organisator50_HELLO1_03_02"); //Dobrze. Tutaj przynajmniej mam spokój.
    }
    else
    {
        AI_Output (self, other ,"DIA_Organisator50_HELLO1_03_03"); //Czekamy na kogoœ, kto pomo¿e nam oczyœciæ wybrze¿e jeziora z topielców.
    };
};

instance dia_org_950_pickpocket(c_info) {
    npc = org_950_organisator;
    nr = 900;
    condition = dia_org_950_pickpocket_condition;
    information = dia_org_950_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_950_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_950_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_950_pickpocket);
	info_addchoice(dia_org_950_pickpocket, dialog_back, dia_org_950_pickpocket_back);
	info_addchoice(dia_org_950_pickpocket, dialog_pickpocket, dia_org_950_pickpocket_doit);
};

func void dia_org_950_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_950_pickpocket);
};

func void dia_org_950_pickpocket_back() {
    info_clearchoices(dia_org_950_pickpocket);
};