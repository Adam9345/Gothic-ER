//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Theodrik_EXIT(C_INFO)
{
	npc             = NONE_DarkLord_Tower;
	nr              = 999;
	condition		= DIA_Theodrik_EXIT_Condition;
	information		= DIA_Theodrik_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Theodrik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Theodrik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Theodrik_HELLO1 (C_INFO)
{
   npc          = NONE_DarkLord_Tower;
   nr           = 1;
   condition    = DIA_Theodrik_HELLO1_Condition;
   information  = DIA_Theodrik_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Theodrik_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Theodrik_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Theodrik_HELLO1_03_01"); //Czego tu szukasz, nêdzna istoto?
    AI_Output (other, self ,"DIA_Theodrik_HELLO1_15_02"); //Przyby³em tu, by siê z tob¹ zmierzyæ! 
    AI_Output (self, other ,"DIA_Theodrik_HELLO1_03_04"); //Twoja odwaga jest wielka, jednak czy mo¿esz j¹ poprzeæ umiejêtnoœciami? Wkrótce siê przekonasz. 
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};