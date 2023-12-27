//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Elitarny_straznik317_EXIT(C_INFO)
{
	npc             = GRD_3917_Elitarny_straznik;
	nr              = 999;
	condition	= DIA_Elitarny_straznik317_EXIT_Condition;
	information	= DIA_Elitarny_straznik317_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Elitarny_straznik317_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elitarny_straznik317_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Elitarny_straznik_HELLO (C_INFO)
{
   npc          		= GRD_3917_Elitarny_straznik;
   nr           		= 1;
   condition    	= DIA_Elitarny_straznik_HELLO_Condition;
   information  	= DIA_Elitarny_straznik_HELLO_Info;
   permanent	= FALSE;
   description		= "Co s³ychaæ?";
};

FUNC INT DIA_Elitarny_straznik_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Elitarny_straznik_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Elitarny_straznik_HELLO_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Elitarny_straznik_HELLO_03_02"); //Nie prowokuj mnie, ch³opcze, albo bêdziesz w¹chaæ swoje onuce od spodu.
    AI_StopProcessInfos	(self);
};