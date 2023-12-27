//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Polykacz_EXIT(C_INFO)
{
	npc             = STT_3919_Polykacz;
	nr              = 999;
	condition	= DIA_Polykacz_EXIT_Condition;
	information	= DIA_Polykacz_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Polykacz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Polykacz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Polykacz_HELLO1 (C_INFO)
{
   npc          = STT_3919_Polykacz;
   nr           = 1;
   condition    = DIA_Polykacz_HELLO1_Condition;
   information  = DIA_Polykacz_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Polykacz_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Polykacz_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Polykacz_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Polykacz_HELLO1_03_02"); //Odwal siê, ca³¹ noc pracujê. Daj mi siê w spokoju napiæ piwa.
    AI_StopProcessInfos	(self);
};

instance dia_stt_3919_pickpocket(c_info) {
    npc = stt_3919_polykacz;
    nr = 900;
    condition = dia_stt_3919_pickpocket_condition;
    information = dia_stt_3919_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_3919_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_3919_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_3919_pickpocket);
	info_addchoice(dia_stt_3919_pickpocket, dialog_back, dia_stt_3919_pickpocket_back);
	info_addchoice(dia_stt_3919_pickpocket, dialog_pickpocket, dia_stt_3919_pickpocket_doit);
};

func void dia_stt_3919_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_stt_3919_pickpocket);
};

func void dia_stt_3919_pickpocket_back() {
    info_clearchoices(dia_stt_3919_pickpocket);
};