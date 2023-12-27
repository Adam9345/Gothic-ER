//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_VLK_40012_Kopacz_Exit (C_INFO)
{
	npc			= VLK_40012_Kopacz;
	nr			= 999;
	condition	= DIA_VLK_40012_Kopacz_Exit_Condition;
	information	= DIA_VLK_40012_Kopacz_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_40012_Kopacz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_VLK_40012_Kopacz_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_VLK_40012_Kopacz_LeaveMe (C_INFO)
{
	npc				= VLK_40012_Kopacz;
	nr				= 1;
	condition		= DIA_VLK_40012_Kopacz_LeaveMe_Condition;
	information		= DIA_VLK_40012_Kopacz_LeaveMe_Info;
	permanent		= 0;
	important       = TRUE;
};

FUNC int DIA_VLK_40012_Kopacz_LeaveMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GRD_40011_Cesar_LeaveMe))
	
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_40012_Kopacz_LeaveMe_Info()
{
	
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_LeaveMe_01_00"); //A wiêc walczmy!
	self.npctype = npctype_FRIEND;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    Kopacz1_Charged = TRUE;
};


// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_VLK_40012_Kopacz_Straz (C_INFO)
{
	npc				= VLK_40012_Kopacz;
	nr				= 1;
	condition		= DIA_VLK_40012_Kopacz_Straz_Condition;
	information		= DIA_VLK_40012_Kopacz_Straz_Info;
	permanent		= 0;
	important       = TRUE;
};

FUNC int DIA_VLK_40012_Kopacz_Straz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GRD_40011_Cesar_Mistrz))
	
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_40012_Kopacz_Straz_Info()
{
	
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_Straz_01_00"); //O nasz nowy mistrz...
	AI_Output (other, self,"DIA_VLK_40012_Kopacz_Straz_15_01"); //Liczy³em, ¿e czegoœ siê dowiem co pozwoli mi go pogr¹¿yæ. I tylko po to wci¹gn¹³em siê w te walki.
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_Straz_01_02"); //Ja na niego nie doniosê póki mi ¿ycie mi³e. I ty te¿ nic nie znajdziesz. Musia³byœ chyba go pobiæ i przeszukaæ.
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_Straz_01_03"); //Jest coœ co mog³oby mu zaszkodziæ.
	
	Info_ClearChoices (DIA_VLK_40012_Kopacz_Straz);
	Info_AddChoice    (DIA_VLK_40012_Kopacz_Straz,"Co takiego?",DIA_VLK_40012_Kopacz_StrazOpcja);
	
    
};

FUNC VOID DIA_VLK_40012_Kopacz_StrazOpcja()
{
  
  
    AI_Output (other, self,"DIA_VLK_40012_Kopacz_StrazOpcja_15_01"); //Co takiego?
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_StrazOpcja_01_02"); //Jego zapiski. Gdzie notuje ró¿ne rzeczy odnoœnie swojego ciemnego procederu. 
	AI_Output (other, self,"DIA_VLK_40012_Kopacz_StrazOpcja_15_03"); //Muszê je zdobyæ.
	AI_Output (self, other,"DIA_VLK_40012_Kopacz_StrazOpcja_01_04"); //Lepiej sobie odpuœæ. Cesar to silny bydlak a ma jeszcze paru osi³ków przy sobie.
	AI_Output (other, self,"DIA_VLK_40012_Kopacz_StrazOpcja_15_05"); //Musze siê ich st¹d pozbyæ. A Cesara wzi¹æ na siebie.
	
	
	
	    B_LogEntry               (ObitePyski,"Jeden z Kopaczy powiedzia³ mi, ¿e Cesar ma przy sobie jakieœ zapiski. Jeœli chcê rozwik³aæ te sprawê to powinny one trafiæ w moje rêce. To nie bêdzie ³atwe.");

	Npc_ExchangeRoutine            (VLK_40015_Kopacz,"Walka");
    AI_StopProcessInfos	           (self);
  
};










