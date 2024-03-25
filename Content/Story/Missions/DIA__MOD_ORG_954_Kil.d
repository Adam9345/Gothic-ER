//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Kil_EXIT(C_INFO)
{
	npc             = ORG_954_Kil;
	nr              = 999;
	condition	= DIA_Kil_EXIT_Condition;
	information	= DIA_Kil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Kil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEF
//========================================

INSTANCE DIA_Kil_THIEF (C_INFO)
{
   npc          = ORG_954_Kil;
   nr           = 1;
   condition    = DIA_Kil_THIEF_Condition;
   information  = DIA_Kil_THIEF_Info;
   permanent	= FALSE;
   description	= "hs@FF0000 Oddawajcie co nie wasze, parszywi z³odzieje!";
};

FUNC INT DIA_Kil_THIEF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_KRADZIEZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kil_THIEF_Info()
{
    AI_Output (other, self ,"DIA_Kil_THIEF_15_01"); //Oddawajcie co nie wasze, parszywi z³odzieje!
    AI_Output (self, other ,"DIA_Kil_THIEF_03_02"); //Z³odzieje? Widzê, ¿e Cronos stêskni³ siê za swoimi magicznymi zabawkami. Dawaj, Fil! Wypróbujemy Kulê Ognia na tym œmieciu!
    AI_StopProcessInfos	(ORG_954_Kil);
    Npc_SetPermAttitude (ORG_954_Kil, ATT_HOSTILE);
    Npc_SetTarget (ORG_954_Kil, other);
    AI_StartState (ORG_954_Kil, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (ORG_955_Fil, ATT_HOSTILE);
    Npc_SetTarget (ORG_955_Fil, other);
    AI_StartState (ORG_955_Fil, ZS_ATTACK, 1, "");
};

instance dia_kil_pickpocket(c_info) {
    npc = org_954_kil;
    nr = 900;
    condition = dia_kil_pickpocket_condition;
    information = dia_kil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kil_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_kil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kil_pickpocket);
	info_addchoice(dia_kil_pickpocket, dialog_back, dia_kil_pickpocket_back);
	info_addchoice(dia_kil_pickpocket, dialog_pickpocket, dia_kil_pickpocket_doit);
};

func void dia_kil_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_kil_pickpocket);
};

func void dia_kil_pickpocket_back() {
    info_clearchoices(dia_kil_pickpocket);
};