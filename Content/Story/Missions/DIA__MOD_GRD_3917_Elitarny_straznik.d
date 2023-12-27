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

instance dia_grd_3917_pickpocket(c_info) {
    npc = grd_3917_elitarny_straznik;
    nr = 900;
    condition = dia_grd_3917_pickpocket_condition;
    information = dia_grd_3917_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3917_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3917_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3917_pickpocket);
	info_addchoice(dia_grd_3917_pickpocket, dialog_back, dia_grd_3917_pickpocket_back);
	info_addchoice(dia_grd_3917_pickpocket, dialog_pickpocket, dia_grd_3917_pickpocket_doit);
};

func void dia_grd_3917_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_3917_pickpocket);
};

func void dia_grd_3917_pickpocket_back() {
    info_clearchoices(dia_grd_3917_pickpocket);
};