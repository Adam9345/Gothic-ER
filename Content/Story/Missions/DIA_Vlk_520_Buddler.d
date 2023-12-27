//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_520_Exit (C_INFO)
{
	npc			= Vlk_520_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_520_Exit_Condition;
	information	= DIA_Vlk_520_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_520_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_520_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_520_LeaveMe (C_INFO)
{
	npc				= Vlk_520_Buddler;
	nr				= 2;
	condition		= DIA_Vlk_520_LeaveMe_Condition;
	information		= DIA_Vlk_520_LeaveMe_Info;
	permanent		= 1;
	description		= "Co tu robisz?";
};

FUNC int DIA_Vlk_520_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_520_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_520_LeaveMe_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Vlk_520_LeaveMe_01_01"); //Szukam ciszy i spokoju, wiêc spadaj st¹d!

	AI_StopProcessInfos	(self);
};

instance dia_vlk_520_pickpocket(c_info) {
    npc = vlk_520_buddler;
    nr = 900;
    condition = dia_vlk_520_pickpocket_condition;
    information = dia_vlk_520_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_520_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_520_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_520_pickpocket);
	info_addchoice(dia_vlk_520_pickpocket, dialog_back, dia_vlk_520_pickpocket_back);
	info_addchoice(dia_vlk_520_pickpocket, dialog_pickpocket, dia_vlk_520_pickpocket_doit);
};

func void dia_vlk_520_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_vlk_520_pickpocket);
};

func void dia_vlk_520_pickpocket_back() {
    info_clearchoices(dia_vlk_520_pickpocket);
};