//poprawione i sprawdzone -  

//poprawione 1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra¿nik_EXIT(C_INFO)
{
	npc             = GRD_2003_Stra¿nik;
	nr              = 999;
	condition	= DIA_Stra¿nik_EXIT_Condition;
	information	= DIA_Stra¿nik_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra¿nik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra¿nik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Stra¿nik_WORK (C_INFO)
{
   npc          = GRD_2003_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_WORK_Condition;
   information  = DIA_Stra¿nik_WORK_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Stra¿nik_WORK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_WORK_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_WORK_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Stra¿nik_WORK_03_02"); //Naprawdê nie widaæ? Po co zadajesz takie g³upie pytania?
    AI_Output (other, self ,"DIA_Stra¿nik_WORK_15_03"); //Pomyœla³em, ¿e mo¿e w czymœ pomogê, albo czegoœ siê od was dowiem.
    AI_Output (self, other ,"DIA_Stra¿nik_WORK_03_04"); //Dam ci radê.
    AI_Output (self, other ,"DIA_Stra¿nik_WORK_03_05"); //IdŸ lepiej do Obozu, bo tutaj nic ciekawego nie us³yszysz.
};

//========================================
//-----------------> COTAM
//========================================

INSTANCE DIA_Stra¿nik_COTAM (C_INFO)
{
   npc          = GRD_2003_Stra¿nik;
   nr           = 2;
   condition    = DIA_Stra¿nik_COTAM_Condition;
   information  = DIA_Stra¿nik_COTAM_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Stra¿nik_COTAM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_COTAM_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_COTAM_15_01"); //Co tam?

 if (Npc_GetTrueGuild (hero) == GIL_GRD)
{
    AI_Output (self, other ,"DIA_Stra¿nik_COTAM_03_02"); //Och, widzê, ¿e do³¹czy³eœ do Stra¿ników. Dobry wybór.
}
else
{
    AI_Output (self, other ,"DIA_Stra¿nik_COTAM_03_03"); //Daj mi spokój!
};

    AI_StopProcessInfos	(self);
};

instance dia_grd_2003_pickpocket(c_info) {
    npc = grd_2003_stra¿nik;
    nr = 900;
    condition = dia_grd_2003_pickpocket_condition;
    information = dia_grd_2003_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2003_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2003_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2003_pickpocket);
	info_addchoice(dia_grd_2003_pickpocket, dialog_back, dia_grd_2003_pickpocket_back);
	info_addchoice(dia_grd_2003_pickpocket, dialog_pickpocket, dia_grd_2003_pickpocket_doit);
};

func void dia_grd_2003_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_2003_pickpocket);
};

func void dia_grd_2003_pickpocket_back() {
    info_clearchoices(dia_grd_2003_pickpocket);
};