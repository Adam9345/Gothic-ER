//poprawione i sprawdzone -  

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ARTO_EXIT(C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 999;
	condition	= DIA_ARTO_EXIT_Condition;
	information	= DIA_ARTO_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ARTO_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_ARTO_Hello (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_Hello_Condition;
	information	= DIA_ARTO_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_ARTO_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_Hello_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_ARTO_Hello_13_01"); //Jestem Arto.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_ARTO_What (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_What_Condition;
	information	= DIA_ARTO_What_Info;
	permanent	= 0;
	description = "Czym si� tutaj zajmujesz?";
};                       

FUNC INT DIA_ARTO_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_What_Info()
{	
	AI_Output (other, self,"DIA_ARTO_What_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_ARTO_What_13_01"); //Jestem stra�nikiem Gomeza.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_ARTO_PERM (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_PERM_Condition;
	information	= DIA_ARTO_PERM_Info;
	permanent	= 1;
	description = "Nie lubisz du�o gada�, co?";
};                       

FUNC INT DIA_ARTO_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_What))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_PERM_Info()
{	
	AI_Output (other, self,"DIA_ARTO_PERM_15_00"); //Nie lubisz du�o gada�, co?
	AI_Output (self, other,"DIA_ARTO_PERM_13_01"); //Nie.
};

/*
//========================================
//-----------------> Succes_Ian_Arto_Quest
//========================================

INSTANCE DIA_Arto_Succes_Ian_Arto_Quest (C_INFO)
{
   npc          = EBR_102_Arto;
   nr           = 1;
   condition    = DIA_Arto_Succes_Ian_Arto_Quest_Condition;
   information  = DIA_Arto_Succes_Ian_Arto_Quest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arto_Succes_Ian_Arto_Quest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_QuestIan_Succes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arto_Succes_Ian_Arto_Quest_Info()
{
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_01"); //Hej ty! To ty bada�e� spraw� dostaw �ywno�ci do kopalni?
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_02"); //Tak, to ja.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_03"); //Rozmawia�em ze Snafem. Twierdzi, �e dostawy by�y niezgodne z zam�wieniami.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_04"); //Osobi�cie pokaza� mi swoje notatki, kt�re by�y jak najbardziej prawid�owe.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_05"); //Uzna�em, �e stoi za tym kto� z tego obozu i zdecydowa�em si� przyby� tu jak najszybciej.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_06"); //Dowiedzia�e� si� czego� istotnego?
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_07"); //Tak, stoi za tym Mirzo.
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_08"); //Wymyka� si� potajemnie noc� i ubija� interesy z kilkoma Szkodnikami.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_09"); //Ach tak, Mirzo... Kojarz� go.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_10"); //W takim razie spotka go zas�u�ona kara.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_11"); //Moi ludzie od razu zaprowadz� go do zamku w Starym Obozie, �eby odpowiedzia� przed Gomezem.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_12"); //�wietnie si� spisa�e�, ch�opcze. 
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_13"); //Porozmawiaj z Ianem, z pewno�ci� ci� wynagrodzi.
    AI_Output (self, other ,"DIA_Arto_Succes_Ian_Arto_Quest_03_14"); //Ja tymczasem wracam do zamku. Mo�e kiedy� si� tam spotkamy.
    AI_Output (other, self ,"DIA_Arto_Succes_Ian_Arto_Quest_15_15"); //Oczywi�cie.
    B_LogEntry                     (CH1_FoodForOldMine,"Pozna�em Arto - przyw�dc� obozu przed kopalni�, kt�ry na co dzie� zamieszkuje zamek Starego Obozu. Powiedzia�, �e zaprowadzi Mirzo przed oblicze Gomeza. Ja tymczasem powinienem wraca� do Iana. ");

    B_GiveXP (100);
    Npc_ExchangeRoutine (self, "START");
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "lochy");
    AI_StopProcessInfos	(self);
};
*/

instance dia_arto_pickpocket(c_info) {
    npc = ebr_102_arto;
    nr = 900;
    condition = dia_arto_pickpocket_condition;
    information = dia_arto_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_arto_pickpocket_condition() {
	e_beklauen(baseThfChanceEBR, 45);
};

func void dia_arto_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_arto_pickpocket);
	info_addchoice(dia_arto_pickpocket, dialog_back, dia_arto_pickpocket_back);
	info_addchoice(dia_arto_pickpocket, dialog_pickpocket, dia_arto_pickpocket_doit);
};

func void dia_arto_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_arto_pickpocket);
};

func void dia_arto_pickpocket_back() {
    info_clearchoices(dia_arto_pickpocket);
};
