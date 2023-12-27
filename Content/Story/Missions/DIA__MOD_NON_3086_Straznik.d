//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Straznik98_EXIT(C_INFO)
{
	npc             = NON_3086_Straznik;
	nr              = 999;
	condition	= DIA_Straznik98_EXIT_Condition;
	information	= DIA_Straznik98_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Straznik98_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Straznik98_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Straznik_HELLO1 (C_INFO)
{
   npc          = NON_3086_Straznik;
   nr           = 1;
   condition    = DIA_Straznik_HELLO1_Condition;
   information  = DIA_Straznik_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Straznik_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_HELLO1_Info()
{
	//edit by  
    AI_Output (self, other ,"DIA_Straznik_HELLO1_03_01"); //Pokona³eœ wszystkich na swojej drodze, jednak nie myœl, ¿e dalej pójdzie ci tak ³atwo.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");

};