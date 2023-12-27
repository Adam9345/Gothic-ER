// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_TempleGuard_40079_EXIT(C_INFO)
{
	npc             = TPL_40079_TempleGuard;
	nr              = 999;
	condition	= DIA_TempleGuard_40079_EXIT_Condition;
	information	= DIA_TempleGuard_40079_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_TempleGuard_40079_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TempleGuard_40079_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_TempleGuard_40079_HELLO1 (C_INFO)
{
   npc          = TPL_40079_TempleGuard;
   nr           = 1;
   condition    = DIA_TempleGuard_40079_HELLO1_Condition;
   information  = DIA_TempleGuard_40079_HELLO1_Info;
   permanent	= FALSE;
   description	= "Chodü za mnπ.";
};

FUNC INT DIA_TempleGuard_40079_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaDrak)) || (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaICo))
{
    return TRUE;
};
};
FUNC VOID DIA_TempleGuard_40079_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_TempleGuard_40079_HELLO1_15_01"); //Chodü za mnπ.
    AI_Output (self, other ,"DIA_TempleGuard_40079_HELLO1_03_02"); //Robi siÍ.
	Npc_ExchangeRoutine(self,"Blokada");
	TPL_40079_TempleGuard.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

