//poprawione i sprawdzone -  

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GuyMine_EXIT(C_INFO)
{
	npc             = VLK_599_GuyMine;
	nr              = 999;
	condition	= DIA_GuyMine_EXIT_Condition;
	information	= DIA_GuyMine_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GuyMine_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GuyMine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



