// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GardistPW_EXIT(C_INFO)
{
	npc             = GRD_40093_Gardist;
	nr              = 999;
	condition	= DIA_GardistPW_EXIT_Condition;
	information	= DIA_GardistPW_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_GardistPW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GardistPW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gardist_HELLO1 (C_INFO)
{
   npc          = GRD_40093_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_HELLO1_Condition;
   information  = DIA_Gardist_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak tam punkt obserwacyjny?";
};

FUNC INT DIA_Gardist_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gardist_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_01"); //Jak tam punkt obserwacyjny?
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_02"); // A jak ci si� wydaje? Chyba dobrze skoro tu jestem co?
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_03"); //P�ki co jest spokojnie?
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_04"); //Je�li chodzi o Szkodnik�w i Bandyt�w z g�r to tak.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_05"); //Ale po choler� zawracasz mi zad? 
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_06"); // Tylko pr�buje si� czego� dowiedzie�.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_07"); //To szukaj tej swojej wiedzy gdzie inadziej. 
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_08"); //Jeden moment niuewagi i pozmiatane przez takiego barana jak ty....
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_09"); //W takim razie p�jd� sobie.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_10"); //No i bardzo dobrze.
};

