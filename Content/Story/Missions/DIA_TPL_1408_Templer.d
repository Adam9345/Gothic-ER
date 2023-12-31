//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_TemplerCitadel_EXIT(C_INFO)
{
	npc             = TPL_1408_Templer;
	nr              = 999;
	condition		= DIA_TemplerCitadel_EXIT_Condition;
	information		= DIA_TemplerCitadel_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_TemplerCitadel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TemplerCitadel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Citadel
//========================================

INSTANCE DIA_Templer_Citadel (C_INFO)
{
   npc          = TPL_1408_Templer;
   nr           = 1;
   condition    = DIA_Templer_Citadel_Condition;
   information  = DIA_Templer_Citadel_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_Citadel_Condition()
{
    if (MeetTemplerInCitadel == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Templer_Citadel_Info()
{
    AI_Output (self, other ,"DIA_Templer_Citadel_03_01"); //A wi�c mistrz Baal Cadar mia� racj�. Przyszed�e�. M�wi�, �e masz wierne serce. Niesko�czona jest m�dro�� Guru.
    AI_Output (other, self ,"DIA_Templer_Citadel_15_02"); //Witaj. Wiesz po co tu jestem? Uda�o ci si� co� znale��?
    AI_Output (self, other ,"DIA_Templer_Citadel_03_03"); //My�l�, �e odpowiedzi� na nasze pytanie jest bestia. 
    AI_Output (other, self ,"DIA_Templer_Citadel_15_04"); //Faktycznie. To monstrum nie wygl�da na typow� faun� tego miejsca. 
    AI_Output (self, other ,"DIA_Templer_Citadel_03_05"); //Zapewne zosta�o tu przyzwane przez magiczne moce. 
    AI_Output (other, self ,"DIA_Templer_Citadel_15_06"); //Wszystkiego dowiemy si�, gdy ta bestia przestanie dycha�.
    AI_Output (self, other ,"DIA_Templer_Citadel_03_07"); //A wi�c b�d� kroczy� tu� za tob�.
    B_LogEntry                     (CH3_TestGuru,"Na szczycie Cytadeli spotka�em Stra�nika �wi�tynnego. W tutejszej okolicy grasuje nieznana mi bestia. Stra�nik uwa�a, �e zosta�a przyzwana magiczne. By� mo�e jej zabicie da nam jakie� wskaz�wki. I tak nie mogliby�my zacz�� poszukiwa� dop�ki to co� si� tu czai. ");
    Npc_ExchangeRoutine (self, "FOLLOW");
    AI_StopProcessInfos	(self);
};

instance dia_tpl_1408_pickpocket(c_info) {
    npc = tpl_1408_templer;
    nr = 900;
    condition = dia_tpl_1408_pickpocket_condition;
    information = dia_tpl_1408_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1408_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1408_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1408_pickpocket);
	info_addchoice(dia_tpl_1408_pickpocket, dialog_back, dia_tpl_1408_pickpocket_back);
	info_addchoice(dia_tpl_1408_pickpocket, dialog_pickpocket, dia_tpl_1408_pickpocket_doit);
};

func void dia_tpl_1408_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_tpl_1408_pickpocket);
};

func void dia_tpl_1408_pickpocket_back() {
    info_clearchoices(dia_tpl_1408_pickpocket);
};