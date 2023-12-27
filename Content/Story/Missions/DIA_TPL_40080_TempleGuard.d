// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_TempleGuard_40080_EXIT(C_INFO)
{
	npc             = TPL_40080_TempleGuard;
	nr              = 999;
	condition	= DIA_TempleGuard_40080_EXIT_Condition;
	information	= DIA_TempleGuard_40080_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_TempleGuard_40080_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TempleGuard_40080_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_TempleGuard_40080_HELLO1 (C_INFO)
{
   npc          = TPL_40080_TempleGuard;
   nr           = 1;
   condition    = DIA_TempleGuard_40080_HELLO1_Condition;
   information  = DIA_TempleGuard_40080_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mamy robote, chodü ze mnπ.";
};

FUNC INT DIA_TempleGuard_40080_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaDrak)) || (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaICo))
{
    return TRUE;
};
};
FUNC VOID DIA_TempleGuard_40080_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_TempleGuard_40080_HELLO1_15_01"); //Mamy robote, chodü ze mnπ.
    AI_Output (self, other ,"DIA_TempleGuard_40080_HELLO1_03_02"); //Jasne.
	Npc_ExchangeRoutine(self,"Blokada");
	TPL_40080_TempleGuard.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

