//poprawione i sprawdzone -  

//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Templer14_EXIT(C_INFO)
{
	npc             = TPL_1414_Templer;
	nr              = 999;
	condition	= DIA_Templer14_EXIT_Condition;
	information	= DIA_Templer14_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Templer14_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Templer14_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
/*
//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Templer_Fight (C_INFO)
{
   npc          = TPL_1414_Templer;
   nr           = 1;
   condition    = DIA_Templer_Fight_Condition;
   information  = DIA_Templer_Fight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_Fight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_SecondFight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_Fight_Info()
{
    AI_Output (self, other ,"DIA_Templer_Fight_03_01"); //Za Œni¹cego!
	TPL_1419_Templer.npctype = npctype_FRIEND;
	TPL_1414_Templer.npctype = npctype_FRIEND;
	TPL_1411_Templer.npctype = npctype_FRIEND;
	TPL_1412_Templer.npctype = npctype_FRIEND;
	var C_NPC Templer_1414;
	Templer_1414 = Hlp_GetNpc(TPL_1414_Templer);
	self.npctype = npctype_FRIEND;
	Templer_1414.guild = GIL_NONE;
	Npc_SetTrueGuild (Templer_1414,GIL_NONE);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> 2Win
//========================================

INSTANCE DIA_Templer_2Win (C_INFO)
{
   npc          = TPL_1414_Templer;
   nr           = 2;
   condition    = DIA_Templer_2Win_Condition;
   information  = DIA_Templer_2Win_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_2Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_Fight))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_2Win_Info()
{
    AI_Output (other, self ,"DIA_Templer_2Win_15_01"); //Wygra³em!
	var C_NPC Templer_1414;
	Templer_1414 = Hlp_GetNpc(TPL_1414_Templer);
	Templer_1414.guild = GIL_TPL;
	Npc_SetTrueGuild (Templer_1414,GIL_TPL);
    AI_StopProcessInfos	(self);
	   Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
};

//========================================
//-----------------> 2Fail
//========================================

INSTANCE DIA_Templer_2Fail (C_INFO)
{
   npc          = TPL_1414_Templer;
   nr           = 3;
   condition    = DIA_Templer_2Fail_Condition;
   information  = DIA_Templer_2Fail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_2Fail_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer_Fight))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_2Fail_Info()
{
    AI_Output (self, other ,"DIA_Templer_2Fail_03_01"); //Ku chwale Œni¹cego, przegra³eœ!
	var C_NPC Templer_1414;
	Templer_1414 = Hlp_GetNpc(TPL_1414_Templer);
	Templer_1414.guild = GIL_TPL;
	Npc_SetTrueGuild (Templer_1414,GIL_TPL);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (TPL_1419_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
};*/