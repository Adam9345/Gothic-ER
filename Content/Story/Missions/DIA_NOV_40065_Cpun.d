// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Cpun_EXIT(C_INFO)
{
	npc             = NOV_40065_Cpun;
	nr              = 999;
	condition	= DIA_Cpun_EXIT_Condition;
	information	= DIA_Cpun_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Cpun_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cpun_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Gruzlik
//========================================

INSTANCE DIA_Cpun_Gruzlik (C_INFO)
{
   npc          = NOV_40065_Cpun;
   nr           = 1;
   condition    = DIA_Cpun_Gruzlik_Condition;
   information  = DIA_Cpun_Gruzlik_Info;
   permanent	= FALSE;
   description	= "Zostaw Fortuno w spokoju.";
};

FUNC INT DIA_Cpun_Gruzlik_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fortuno_Gruzlik))
{
    return TRUE;
};
};
FUNC VOID DIA_Cpun_Gruzlik_Info()
{
    AI_Output (other, self ,"DIA_Cpun_Gruzlik_15_01"); //Zostaw Fortuno w spokoju.
    AI_Output (self, other ,"DIA_Cpun_Gruzlik_03_02"); //Ale ta zielona krowa ma wielkie wymiona! Stary!
    AI_Output (other, self ,"DIA_Cpun_Gruzlik_15_03"); //Ca³kiem naæpany.
    AI_Output (self, other ,"DIA_Cpun_Gruzlik_03_04"); //Bêdê robi co bêdê chcia³. Sam jesteœ naæpany palancie.
    AI_Output (other, self ,"DIA_Cpun_Gruzlik_15_05"); //Dobra dostaniesz trochê po g³ówce i ci przejdzie.
    AI_Output (self, other ,"DIA_Cpun_Gruzlik_03_06"); //Dawaaaaj! Ty pomiocie Beliara z trzema g³owami!
	B_LogEntry               (Gruzlik,"Rozmawia³em z naæpanym Nowicjuszem. Rzeczywiœcie jest w ,,innym œwiecie”. Jak dostanie po gêbie to mo¿e zrozumie co do niego powiedzia³em.");
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    
};

//========================================
//-----------------> Gruzlik_2
//========================================

INSTANCE DIA_Cpun_Gruzlik_2 (C_INFO)
{
   npc          = NOV_40065_Cpun;
   nr           = 2;
   condition    = DIA_Cpun_Gruzlik_2_Condition;
   information  = DIA_Cpun_Gruzlik_2_Info;
   permanent	= FALSE;
   description	= "No i jak? Mo¿e masz jeszcze coœ do powiedzenia?";
};

FUNC INT DIA_Cpun_Gruzlik_2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Cpun_Gruzlik))
&& (NOV_40065_Cpun.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Cpun_Gruzlik_2_Info()
{
    AI_Output (other, self ,"DIA_Cpun_Gruzlik_2_15_01"); //No i jak? Mo¿e masz jeszcze coœ do powiedzenia?
    AI_Output (self, other ,"DIA_Cpun_Gruzlik_2_03_02"); //Ahhh... Moje gnaty!
    AI_Output (other, self ,"DIA_Cpun_Gruzlik_2_15_03"); //Odwal siê od Fortuno albo powtórzymy zabawê.
    AI_Output (self, other ,"DIA_Cpun_Gruzlik_2_03_04"); //Tak tak.. Zje¿d¿aj palancie...
	
    AI_StopProcessInfos	(self);
};

instance dia_cpun_pickpocket(c_info) {
    npc = nov_40065_cpun;
    nr = 900;
    condition = dia_cpun_pickpocket_condition;
    information = dia_cpun_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cpun_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 10);
};

func void dia_cpun_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cpun_pickpocket);
	info_addchoice(dia_cpun_pickpocket, dialog_back, dia_cpun_pickpocket_back);
	info_addchoice(dia_cpun_pickpocket, dialog_pickpocket, dia_cpun_pickpocket_doit);
};

func void dia_cpun_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_cpun_pickpocket);
};

func void dia_cpun_pickpocket_back() {
    info_clearchoices(dia_cpun_pickpocket);
};

