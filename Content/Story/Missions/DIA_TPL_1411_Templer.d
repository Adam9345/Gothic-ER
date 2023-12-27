//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Templer11_EXIT(C_INFO)
{
	npc             = TPL_1411_Templer;
	nr              = 999;
	condition	= DIA_Templer11_EXIT_Condition;
	information	= DIA_Templer11_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Templer11_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Templer11_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
/*
//========================================
//-----------------> FightWithThird
//========================================

INSTANCE DIA_Templer_FightWithThird (C_INFO)
{
   npc          = TPL_1411_Templer;
   nr           = 1;
   condition    = DIA_Templer_FightWithThird_Condition;
   information  = DIA_Templer_FightWithThird_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_FightWithThird_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_ThirdFight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_FightWithThird_Info()
{
    AI_Output (self, other ,"DIA_Templer_FightWithThird_03_01"); //Do boju!
	TPL_1419_Templer.npctype = npctype_FRIEND;
	TPL_1414_Templer.npctype = npctype_FRIEND;
	TPL_1411_Templer.npctype = npctype_FRIEND;
	TPL_1412_Templer.npctype = npctype_FRIEND;
	var c_npc przedostatni; 
	przedostatni = Hlp_GetNpc(TPL_1412_Templer);
	przedostatni.guild = GIL_NONE;
	Npc_SetTrueGuild (przedostatni,GIL_NONE);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> 3Win
//========================================

INSTANCE DIA_Templer_3Win (C_INFO)
{
   npc          = TPL_1411_Templer;
   nr           = 2;
   condition    = DIA_Templer_3Win_Condition;
   information  = DIA_Templer_3Win_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_3Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_FightWithThird))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_3Win_Info()
{
    AI_Output (other, self ,"DIA_Templer_3Win_15_01"); //Wygra³em walkê.
    AI_Output (self, other ,"DIA_Templer_3Win_03_02"); //Dobry z ciebie wojownik.
    AI_StopProcessInfos	(self);
	 Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
    Npc_ExchangeRoutine (TPL_1414_Templer, "start");
};

//========================================
//-----------------> 3Fail
//========================================

INSTANCE DIA_Templer_3Fail (C_INFO)
{
   npc          = TPL_1411_Templer;
   nr           = 3;
   condition    = DIA_Templer_3Fail_Condition;
   information  = DIA_Templer_3Fail_Info;
   permanent	= FALSE;
  Important    = TRUE;
};

FUNC INT DIA_Templer_3Fail_Condition()
{
    if (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
    && (Npc_KnowsInfo (hero, DIA_Templer_FightWithThird))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_3Fail_Info()
{
    AI_Output (self, other ,"DIA_Templer_3Fail_03_01"); //Przegra³eœ. Zgodnie z zasadami, musisz opuœciæ arenê.
        AI_StopProcessInfos	(self);
	 Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
    Npc_ExchangeRoutine (TPL_1414_Templer, "start");
};
*/
