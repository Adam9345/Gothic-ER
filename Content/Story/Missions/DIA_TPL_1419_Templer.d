//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Templer19_EXIT(C_INFO)
{
	npc             = TPL_1419_Templer;
	nr              = 999;
	condition	= DIA_Templer19_EXIT_Condition;
	information	= DIA_Templer19_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Templer19_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Templer19_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
/*
//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Templer19_Fight (C_INFO)
{
   npc          = TPL_1419_Templer;
   nr           = 1;
   condition    = DIA_Templer19_Fight_Condition;
   information  = DIA_Templer19_Fight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer19_Fight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaToth_FirstFight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer19_Fight_Info()
{
    AI_Output (self, other ,"DIA_Templer19_Fight_03_01"); //Walczmy!
	print ("nju skripts initjalizejszyn");
	TPL_1419_Templer.npctype = npctype_FRIEND;
	TPL_1414_Templer.npctype = npctype_FRIEND;
	TPL_1411_Templer.npctype = npctype_FRIEND;
	TPL_1412_Templer.npctype = npctype_FRIEND;
	var C_NPC Templer_1419;
	Templer_1419 = Hlp_GetNpc(TPL_1419_Templer);
	Templer_1419.guild = GIL_NONE;
	Npc_SetTrueGuild (Templer_1419,GIL_NONE);
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> Win
//========================================

INSTANCE DIA_Templer_Win (C_INFO)
{
   npc          = TPL_1419_Templer;
   nr           = 2;
   condition    = DIA_Templer_Win_Condition;
   information  = DIA_Templer_Win_Info;
   permanent	= FALSE;  
   Important    = TRUE;
};

FUNC INT DIA_Templer_Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer19_Fight))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_Win_Info()
{
    AI_Output (self, other ,"DIA_Templer_Win_03_01"); //Nieźle!
	var C_NPC Templer_1419;
	Templer_1419 = Hlp_GetNpc(TPL_1419_Templer);
	Templer_1419.guild = GIL_TPL;
	Npc_SetTrueGuild (Templer_1419,GIL_TPL);
    AI_StopProcessInfos	(self);
	   Npc_ExchangeRoutine (TPL_1414_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
};

//========================================
//-----------------> Fail
//========================================

INSTANCE DIA_Templer_Fail (C_INFO)
{
   npc          = TPL_1419_Templer;
   nr           = 3;
   condition    = DIA_Templer_Fail_Condition;
   information  = DIA_Templer_Fail_Info;
   permanent	= FALSE;  
   Important    = TRUE;

};

FUNC INT DIA_Templer_Fail_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Templer19_Fight))
    && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_Fail_Info()
{
    AI_Output (self, other ,"DIA_Templer_Fail_03_01"); //Przegrałeś!
		var C_NPC Templer_1419;
	Templer_1419 = Hlp_GetNpc(TPL_1419_Templer);
	Templer_1419.guild = GIL_TPL;
	Npc_SetTrueGuild (Templer_1419,GIL_TPL);
    AI_StopProcessInfos	(self);
	   Npc_ExchangeRoutine (TPL_1414_Templer, "start");
    Npc_ExchangeRoutine (TPL_1411_Templer, "start");
    Npc_ExchangeRoutine (TPL_1412_Templer, "start");
};
*/
