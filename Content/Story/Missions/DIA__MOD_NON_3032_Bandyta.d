//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bandyta32_EXIT(C_INFO)
{
	npc             = NON_3032_Bandyta;
	nr              = 999;
	condition		= DIA_Bandyta32_EXIT_Condition;
	information		= DIA_Bandyta32_EXIT_Info;
	permanent		= TRUE;
	description 	= DIALOG_ENDE;
};

FUNC INT DIA_Bandyta32_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bandyta32_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ENEMY
//========================================

INSTANCE DIA_Bandyta_ENEMY (C_INFO)
{
   npc          = NON_3032_Bandyta;
   nr           = 1;
   condition    = DIA_Bandyta_ENEMY_Condition;
   information  = DIA_Bandyta_ENEMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_ENEMY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_MineIsClean))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_ENEMY_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_ENEMY_03_01"); //Ty sukinsynu! Przez ciebie harowaæ przy jakieœ gówno wartej rudzie.
    AI_Output (other, self ,"DIA_Bandyta_ENEMY_15_02"); //Nikt ciê tu nie trzyma.

    AI_Output (self, other ,"DIA_Bandyta_ENEMY_03_04"); //Taki jesteœ m¹dry? Zaraz zobaczysz.
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

instance dia_non_3032_pickpocket(c_info) {
    npc = non_3032_bandyta;
    nr = 900;
    condition = dia_non_3032_pickpocket_condition;
    information = dia_non_3032_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3032_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 25);
};

func void dia_non_3032_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3032_pickpocket);
	info_addchoice(dia_non_3032_pickpocket, dialog_back, dia_non_3032_pickpocket_back);
	info_addchoice(dia_non_3032_pickpocket, dialog_pickpocket, dia_non_3032_pickpocket_doit);
};

func void dia_non_3032_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_3032_pickpocket);
};

func void dia_non_3032_pickpocket_back() {
    info_clearchoices(dia_non_3032_pickpocket);
};