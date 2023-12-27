// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikA_EXIT(C_INFO)
{
	npc             = ORG_40023_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikA_EXIT_Condition;
	information	= DIA_SzkodnikA_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikA_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikA_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikB_EXIT(C_INFO)
{
	npc             = ORG_40022_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikB_EXIT_Condition;
	information	= DIA_SzkodnikB_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikB_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikB_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_SzkodnikC_EXIT(C_INFO)
{
	npc             = ORG_40021_Szkodnik;
	nr              = 999;
	condition	= DIA_SzkodnikC_EXIT_Condition;
	information	= DIA_SzkodnikC_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_SzkodnikC_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SzkodnikC_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

