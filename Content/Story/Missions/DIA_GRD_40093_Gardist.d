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
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_02"); // A jak ci siê wydaje? Chyba dobrze skoro tu jestem co?
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_03"); //Póki co jest spokojnie?
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_04"); //Jeœli chodzi o Szkodników i Bandytów z gór to tak.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_05"); //Ale po cholerê zawracasz mi zad? 
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_06"); // Tylko próbuje siê czegoœ dowiedzieæ.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_07"); //To szukaj tej swojej wiedzy gdzie indziej. 
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_08"); //Jeden moment nieuwagi i pozamiatane przez takiego barana jak ty....
    AI_Output (other, self ,"DIA_Gardist_HELLO1_15_09"); //W takim razie pójdê sobie.
    AI_Output (self, other ,"DIA_Gardist_HELLO1_03_10"); //No i bardzo dobrze.
};

instance dia_grd_40093_pickpocket(c_info) {
    npc = grd_40093_gardist;
    nr = 900;
    condition = dia_grd_40093_pickpocket_condition;
    information = dia_grd_40093_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_40093_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_40093_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_40093_pickpocket);
	info_addchoice(dia_grd_40093_pickpocket, dialog_back, dia_grd_40093_pickpocket_back);
	info_addchoice(dia_grd_40093_pickpocket, dialog_pickpocket, dia_grd_40093_pickpocket_doit);
};

func void dia_grd_40093_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_40093_pickpocket);
};

func void dia_grd_40093_pickpocket_back() {
    info_clearchoices(dia_grd_40093_pickpocket);
};