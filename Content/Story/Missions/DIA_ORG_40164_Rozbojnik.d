// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RozbojnikPW_EXIT(C_INFO)
{
	npc             = ORG_40164_Rozbojnik;
	nr              = 999;
	condition	= DIA_RozbojnikPW_EXIT_Condition;
	information	= DIA_RozbojnikPW_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RozbojnikPW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RozbojnikPW_EXIT_Info()
{

    B_ChangeGuild   		 (ORG_40164_Rozbojnik,GIL_GOBBO);  
	B_ChangeGuild   		 (ORG_40165_Rozbojnik,GIL_GOBBO);  
	B_ChangeGuild   		 (ORG_40166_Rozbojnik,GIL_GOBBO);  
	B_ChangeGuild   		 (ORG_40163_Rozbojnik,GIL_GOBBO);  

	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_RozbojnikPW_HELLO1 (C_INFO)
{
   npc          = ORG_40164_Rozbojnik;
   nr           = 1;
   condition    = DIA_RozbojnikPW_HELLO1_Condition;
   information  = DIA_RozbojnikPW_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_RozbojnikPW_HELLO1_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Cord_GO_SHADOW))
{
    return TRUE;
};
};
FUNC VOID DIA_RozbojnikPW_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_RozbojnikPW_HELLO1_03_01"); //Ej parchy! Czego tu?
    AI_Output (other, self ,"DIA_RozbojnikPW_HELLO1_15_02"); //Idziemy na polowanie.
    AI_Output (self, other ,"DIA_RozbojnikPW_HELLO1_03_03"); //My upolowaliœmy waszego kolegê.
    AI_Output (self, other ,"DIA_RozbojnikPW_HELLO1_03_04"); //W³aœnie mieliœmy dokoñczyæ robotê i wbiæ mu miecz w brzuch a tu wy przyleŸliœcie!
    AI_Output (other, self ,"DIA_RozbojnikPW_HELLO1_15_05"); //Wasze niedoczekanie chamy. On nie zginie.
    AI_Output (self, other ,"DIA_RozbojnikPW_HELLO1_03_06"); //S³yszeliœcie? Bêdzie nam grozi³!
    AI_Output (self, other ,"DIA_RozbojnikPW_HELLO1_03_07"); //No trudno. Wiêcej trupów, wiêcej ³upów!
    AI_Output (other, self ,"DIA_RozbojnikPW_HELLO1_15_08"); //Ud³aw siê kanalio!
	
	
	B_LogEntry(PrawdziwyWojownik,"Id¹c na polowanie natknêliœmy siê na bandziorów, którzy napadli jakiegoœ Najemnika. Trzeba mu pomóc!");
};

instance dia_org_40164_pickpocket(c_info) {
    npc = org_40164_rozbojnik;
    nr = 900;
    condition = dia_org_40164_pickpocket_condition;
    information = dia_org_40164_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40164_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40164_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40164_pickpocket);
	info_addchoice(dia_org_40164_pickpocket, dialog_back, dia_org_40164_pickpocket_back);
	info_addchoice(dia_org_40164_pickpocket, dialog_pickpocket, dia_org_40164_pickpocket_doit);
};

func void dia_org_40164_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_40164_pickpocket);
};

func void dia_org_40164_pickpocket_back() {
    info_clearchoices(dia_org_40164_pickpocket);
};