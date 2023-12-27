// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_TempleGuard_40081_EXIT(C_INFO)
{
	npc             = TPL_40081_TempleGuard;
	nr              = 999;
	condition	= DIA_TempleGuard_40081_EXIT_Condition;
	information	= DIA_TempleGuard_40081_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_TempleGuard_40081_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TempleGuard_40081_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_TempleGuard_40081_HELLO1 (C_INFO)
{
   npc          = TPL_40081_TempleGuard;
   nr           = 1;
   condition    = DIA_TempleGuard_40081_HELLO1_Condition;
   information  = DIA_TempleGuard_40081_HELLO1_Info;
   permanent	= FALSE;
   description	= "Zabiore cie z t¹d.";
};

FUNC INT DIA_TempleGuard_40081_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaDrak)) || (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaICo))
{
    return TRUE;
};
};
FUNC VOID DIA_TempleGuard_40081_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_TempleGuard_40081_HELLO1_15_01"); //Zabiore cie z t¹d.
    AI_Output (self, other ,"DIA_TempleGuard_40081_HELLO1_03_02"); //Niech bêdzie, i tak nie mam za wiele do roboty.
	Npc_ExchangeRoutine(self,"Blokada");
	TPL_40081_TempleGuard.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Blo_End
//========================================

INSTANCE DIA_TempleGuard_Blo_End (C_INFO)
{
   npc          = TPL_40081_TempleGuard;
   nr           = 1;
   condition    = DIA_TempleGuard_Blo_End_Condition;
   information  = DIA_TempleGuard_Blo_End_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_TempleGuard_Blo_End_Condition()
{
if (Npc_IsDead (GRD_40101_Szef))
&& (Npc_HasItems (hero, ItWr_Blokada) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_TempleGuard_Blo_End_Info()
{
    AI_Output (self, other ,"DIA_TempleGuard_Blo_End_03_01"); //To by by³o na tyle.
    AI_Output (self, other ,"DIA_TempleGuard_Blo_End_03_02"); //Wróæ do Totha, i powiedz mu ¿e posprz¹tane.
    AI_Output (other, self ,"DIA_TempleGuard_Blo_End_15_03"); //Tak zrobiê.
    Npc_ExchangeRoutine(TPL_40079_TempleGuard,"Start");
    Npc_ExchangeRoutine(TPL_40080_TempleGuard,"Start");
	Npc_ExchangeRoutine(TPL_40081_TempleGuard,"Start");
	Npc_ExchangeRoutine(TPL_40082_TempleGuard,"Start");
	TPL_40079_TempleGuard.aivar[AIV_PARTYMEMBER] = FALSE;
	TPL_40080_TempleGuard.aivar[AIV_PARTYMEMBER] = FALSE;
	TPL_40081_TempleGuard.aivar[AIV_PARTYMEMBER] = FALSE;
	TPL_40082_TempleGuard.aivar[AIV_PARTYMEMBER] = FALSE;
	
};

