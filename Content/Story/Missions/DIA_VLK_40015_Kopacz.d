//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_VLK_40015_Kopacz_Exit (C_INFO)
{
	npc			= VLK_40015_Kopacz;
	nr			= 999;
	condition	= DIA_VLK_40015_Kopacz_Exit_Condition;
	information	= DIA_VLK_40015_Kopacz_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_40015_Kopacz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_VLK_40015_Kopacz_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_VLK_40015_Kopacz_LeaveMe (C_INFO)
{
	npc				= VLK_40015_Kopacz;
	nr				= 1;
	condition		= DIA_VLK_40015_Kopacz_LeaveMe_Condition;
	information		= DIA_VLK_40015_Kopacz_LeaveMe_Info;
	permanent		= 0;
	important       = TRUE;
};

FUNC int DIA_VLK_40015_Kopacz_LeaveMe_Condition()
{
    if  (PokonanyKopacz3 == TRUE)
	//&&(Npc_KnowsInfo (hero, DIA_Cesar_Kopacz1Success))
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_40015_Kopacz_LeaveMe_Info()
{
	
	AI_Output (self, other,"DIA_VLK_40015_Kopacz_LeaveMe_01_00"); //Przekonajmy siê kto jest lepszy ³achmyto!
    AI_StopProcessInfos	(self);
	self.npctype = npctype_FRIEND;
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    Kopacz4_Charged = TRUE;
};

instance dia_vlk_40015_pickpocket(c_info) {
    npc = vlk_40015_kopacz;
    nr = 900;
    condition = dia_vlk_40015_pickpocket_condition;
    information = dia_vlk_40015_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_40015_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_40015_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_40015_pickpocket);
	info_addchoice(dia_vlk_40015_pickpocket, dialog_back, dia_vlk_40015_pickpocket_back);
	info_addchoice(dia_vlk_40015_pickpocket, dialog_pickpocket, dia_vlk_40015_pickpocket_doit);
};

func void dia_vlk_40015_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_vlk_40015_pickpocket);
};

func void dia_vlk_40015_pickpocket_back() {
    info_clearchoices(dia_vlk_40015_pickpocket);
};







