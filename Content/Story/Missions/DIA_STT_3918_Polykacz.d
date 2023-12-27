//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Polykacz18_EXIT(C_INFO)
{
	npc             = STT_3918_Polykacz;
	nr              = 999;
	condition	= DIA_Polykacz18_EXIT_Condition;
	information	= DIA_Polykacz18_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Polykacz18_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Polykacz18_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Polykacz18_HELLO1 (C_INFO)
{
   npc          = STT_3918_Polykacz;
   nr           = 1;
   condition    = DIA_Polykacz18_HELLO1_Condition;
   information  = DIA_Polykacz18_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Polykacz18_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Polykacz18_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Po³ykacz18_ognia_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Po³ykacz18_ognia_HELLO1_03_02"); //Jestem Cieniem, dorabiam sobie jako po³ykacz ognia. Gomez p³aci mi osobiœcie za ka¿dy pokaz.
    AI_Output (other, self ,"DIA_Po³ykacz18_ognia_HELLO1_03_03"); //To op³acalne?
    AI_Output (self, other ,"DIA_Po³ykacz18_ognia_HELLO1_03_04"); //Da siê z tego wy¿yæ, w koñcu taka szycha jak Gomez te¿ musi mieæ rozrywkê poza siedzeniem na tronie, no nie?
};

instance dia_stt_3918_pickpocket(c_info) {
    npc = stt_3918_polykacz;
    nr = 900;
    condition = dia_stt_3918_pickpocket_condition;
    information = dia_stt_3918_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_3918_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_3918_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_3918_pickpocket);
	info_addchoice(dia_stt_3918_pickpocket, dialog_back, dia_stt_3918_pickpocket_back);
	info_addchoice(dia_stt_3918_pickpocket, dialog_pickpocket, dia_stt_3918_pickpocket_doit);
};

func void dia_stt_3918_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_stt_3918_pickpocket);
};

func void dia_stt_3918_pickpocket_back() {
    info_clearchoices(dia_stt_3918_pickpocket);
};