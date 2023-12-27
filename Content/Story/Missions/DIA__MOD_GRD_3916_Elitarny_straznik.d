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

instance dia_grd_3916_pickpocket(c_info) {
    npc = grd_3916_elitarny_straznik;
    nr = 900;
    condition = dia_grd_3916_pickpocket_condition;
    information = dia_grd_3916_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3916_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3916_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3916_pickpocket);
	info_addchoice(dia_grd_3916_pickpocket, dialog_back, dia_grd_3916_pickpocket_back);
	info_addchoice(dia_grd_3916_pickpocket, dialog_pickpocket, dia_grd_3916_pickpocket_doit);
};

func void dia_grd_3916_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_3916_pickpocket);
};

func void dia_grd_3916_pickpocket_back() {
    info_clearchoices(dia_grd_3916_pickpocket);
};