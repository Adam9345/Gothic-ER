//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fil_EXIT(C_INFO)
{
	npc             = ORG_955_Fil;
	nr              = 999;
	condition	= DIA_Fil_EXIT_Condition;
	information	= DIA_Fil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Fil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZLODZIEJE
//========================================

INSTANCE DIA_Fil_ZLODZIEJE (C_INFO)
{
   npc          = ORG_955_Fil;
   nr           = 1;
   condition    = DIA_Fil_ZLODZIEJE_Condition;
   information  = DIA_Fil_ZLODZIEJE_Info;
   permanent	= FALSE;
   description	= "Cronos ucieszy siê na wieœæ, ¿e was znalaz³em.";
};

FUNC INT DIA_Fil_ZLODZIEJE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fil_ZLODZIEJE_Info()
{
    AI_Output (other, self ,"DIA_Fil_ZLODZIEJE_15_01"); //Cronos ucieszy siê na wieœæ, ¿e was znalaz³em.
    AI_Output (self, other ,"DIA_Fil_ZLODZIEJE_03_02"); //Mam to w dupie, koleœ! Jak coœ chcesz, gadaj z Kilem!
    AI_StopProcessInfos	(self);
};

instance dia_fil_pickpocket(c_info) {
    npc = org_955_fil;
    nr = 900;
    condition = dia_fil_pickpocket_condition;
    information = dia_fil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fil_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_fil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fil_pickpocket);
	info_addchoice(dia_fil_pickpocket, dialog_back, dia_fil_pickpocket_back);
	info_addchoice(dia_fil_pickpocket, dialog_pickpocket, dia_fil_pickpocket_doit);
};

func void dia_fil_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_fil_pickpocket);
};

func void dia_fil_pickpocket_back() {
    info_clearchoices(dia_fil_pickpocket);
};