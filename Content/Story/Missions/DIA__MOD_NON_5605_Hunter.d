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


