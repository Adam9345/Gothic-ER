//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Elitarny_straznik916_EXIT(C_INFO)
{
	npc             		= GRD_3916_Elitarny_straznik;
	nr              		= 999;
	condition			= DIA_Elitarny_straznik916_EXIT_Condition;
	information		= DIA_Elitarny_straznik916_EXIT_Info;
	permanent		= TRUE;
	description    	= DIALOG_ENDE;
};

FUNC INT DIA_Elitarny_straznik916_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elitarny_straznik916_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WITAJ
//========================================

INSTANCE DIA_Elitarny_straznik_WITAJ (C_INFO)
{
   npc          		= GRD_3916_Elitarny_straznik;
   nr           		= 1;
   condition    	= DIA_Elitarny_straznik_WITAJ_Condition;
   information  	= DIA_Elitarny_straznik_WITAJ_Info;
   permanent	= FALSE;
   description		= "Witaj.";
};

FUNC INT DIA_Elitarny_straznik_WITAJ_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Elitarny_straznik_WITAJ_Info()
{
    AI_Output (other, self ,"DIA_Elitarny_straznik_WITAJ_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Elitarny_straznik_WITAJ_03_02"); //Je¿eli tkniesz Gomeza lub spróbujesz siê do niego odezwaæ, wyprujê ci flaki i zjem je z cebulk¹, jasne?
	AI_Output (other, self ,"DIA_Elitarny_straznik_WITAJ_15_03"); //Lojalni a¿ do œmierci?
	AI_Output (self, other ,"DIA_Elitarny_straznik_WITAJ_03_04"); //Po sam grób!
    AI_StopProcessInfos	(self);
};