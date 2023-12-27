//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_VLK_40013_Kopacz_Exit (C_INFO)
{
	npc			= VLK_40013_Kopacz;
	nr			= 999;
	condition	= DIA_VLK_40013_Kopacz_Exit_Condition;
	information	= DIA_VLK_40013_Kopacz_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_40013_Kopacz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_VLK_40013_Kopacz_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_VLK_40013_Kopacz_LeaveMe (C_INFO)
{
	npc				= VLK_40013_Kopacz;
	nr				= 1;
	condition		= DIA_VLK_40013_Kopacz_LeaveMe_Condition;
	information		= DIA_VLK_40013_Kopacz_LeaveMe_Info;
	permanent		= 0;
	important       = TRUE;
};

FUNC int DIA_VLK_40013_Kopacz_LeaveMe_Condition()
{
    if  (PokonanyKopacz1 == TRUE)
	//&&(Npc_KnowsInfo (hero, DIA_Cesar_Kopacz1Success))
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_40013_Kopacz_LeaveMe_Info()
{
	
	AI_Output (self, other,"DIA_VLK_40013_Kopacz_LeaveMe_01_00"); //Wyci¹gaj broñ!
	self.npctype = npctype_FRIEND;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    Kopacz2_Charged = TRUE;
};









