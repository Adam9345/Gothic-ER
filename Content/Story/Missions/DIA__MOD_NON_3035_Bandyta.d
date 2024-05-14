// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Luis_EXIT(C_INFO)
{
	npc             = BAN_1615_Luis;
	nr              = 999;
	condition		= DIA_Luis_EXIT_Condition;
	information		= DIA_Luis_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Luis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Luis_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};