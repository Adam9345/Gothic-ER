// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikA_EXIT(C_INFO)
{
	npc             = ORG_40023_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikA_EXIT_Condition;
	information	= DIA_SzkodnikA_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikA_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikA_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikB_EXIT(C_INFO)
{
	npc             = ORG_40022_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikB_EXIT_Condition;
	information	= DIA_SzkodnikB_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikB_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikB_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikC_EXIT(C_INFO)
{
	npc             = ORG_40021_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikC_EXIT_Condition;
	information	= DIA_SzkodnikC_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikC_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikC_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

instance dia_org_40023_pickpocket(c_info) {
    npc = org_40023_szkodnik;
    nr = 900;
    condition = dia_org_40023_pickpocket_condition;
    information = dia_org_40023_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40023_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40023_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40023_pickpocket);
	info_addchoice(dia_org_40023_pickpocket, dialog_back, dia_org_40023_pickpocket_back);
	info_addchoice(dia_org_40023_pickpocket, dialog_pickpocket, dia_org_40023_pickpocket_doit);
};

func void dia_org_40023_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_40023_pickpocket);
};

func void dia_org_40023_pickpocket_back() {
    info_clearchoices(dia_org_40023_pickpocket);
};




instance dia_org_40021_pickpocket(c_info) {
    npc = org_40021_szkodnik;
    nr = 900;
    condition = dia_org_40021_pickpocket_condition;
    information = dia_org_40021_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40021_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40021_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40021_pickpocket);
	info_addchoice(dia_org_40021_pickpocket, dialog_back, dia_org_40021_pickpocket_back);
	info_addchoice(dia_org_40021_pickpocket, dialog_pickpocket, dia_org_40021_pickpocket_doit);
};

func void dia_org_40021_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_40021_pickpocket);
};

func void dia_org_40021_pickpocket_back() {
    info_clearchoices(dia_org_40021_pickpocket);
};