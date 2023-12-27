//poprawione i sprawdzone - Reflide

// *********************** ERPRESSER ***********************
var int ERPRESSER_Hostile;
var int ERPRESSER_TALK;
INSTANCE Info_Erpresser (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_Erpresser_Condition;
	information	= Info_Erpresser_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Erpresser_Condition()
{
	if ((self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)	
	&&  (SLD_704_Blade.aivar[AIV_PARTYMEMBER] != TRUE)
	&&  (SLD_709_Cord.aivar[AIV_PARTYMEMBER] != TRUE))
	&& (ERPRESSER_TALK != TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Erpresser_Info()
{
	AI_Output (self, other,"Info_Erpresser_Info_13_01"); //Hej, ch³opcze! Jeœli chcesz przejœæ, bêdziesz musia³ zap³aciæ 10 bry³ek, kapujesz?
	ERPRESSER_TALK = true;
	Info_ClearChoices( Info_Erpresser );
	Info_AddChoice	 ( Info_Erpresser, "To dlaczego nie przyjdziesz tutaj i ich sobie nie weŸmiesz!"	, Info_Erpresser_Choice_AufsMaul );
	Info_AddChoice	 ( Info_Erpresser, "Proszê, oto 10 bry³ek."	, Info_Erpresser_Choice_Zahlen );
};

FUNC VOID Info_Erpresser_Choice_AufsMaul()
{
	AI_Output (other, self,"Info_Erpresser_Choice_AufsMaul_15_01"); //To dlaczego nie przyjdziesz tutaj i ich sobie nie weŸmiesz!
	AI_Output (self, other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Dziêki, stary. W³aœnie zaczyna³em siê nudziæ.
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
	
	ERPRESSER_Hostile = TRUE;
    Info_ClearChoices( Info_Erpresser );

};

FUNC VOID Info_Erpresser_Choice_Zahlen()
{
	if (Npc_HasItems (other,ITMINUGGET) >= 10)
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_01"); //Proszê, oto 10 bry³ek.
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_02"); //Jaka szkoda.
		B_GiveInvItems      (hero, self, ITMINUGGET, 10);
	
		self.aivar[AIV_HAS_ERPRESSED] = 1;
		Info_ClearChoices( Info_Erpresser );
		AI_StopProcessInfos	(self);
	}
	else // SC hat keine 3 Erz
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_03"); //Ummm... Nie mam przy sobie 10 bry³ek.
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_04"); //Wielka szkoda...
		//AI_StopProcessInfos	(self);
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		Info_ClearChoices( Info_Erpresser );
	    ERPRESSER_Hostile = TRUE;
	};
	
	
};

// ****************** für HAS_ERPRESSED == 1 (gezahlt) *********************

INSTANCE Info_BereitsErpresst (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_BereitsErpresst_Condition;
	information	= Info_BereitsErpresst_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_BereitsErpresst_Condition()
{
	if ( (self.aivar[AIV_HAS_ERPRESSED]==1) && (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsErpresst_Info()
{
	AI_Output (self, other,"Info_BereitsErpresst_Info_13_02"); //Zap³aci³eœ - mo¿esz przejœæ. Prze³aŸ, zanim siê rozmyœlê.
};

// ****************** für HAS_ERPRESSED == 2 (Aufs Maul) *********************

INSTANCE Info_BereitsAufsMaul (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_BereitsAufsMaul_Condition;
	information	= Info_BereitsAufsMaul_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_BereitsAufsMaul_Condition()
{
	if ((self.aivar[AIV_HAS_ERPRESSED]==2)
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) 
	&&  (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsAufsMaul_Info()
{
	AI_Output (self, other,"Info_BereitsAufsMaul_Info_13_02"); //Spadaj, zanim zetrê ten g³upi uœmiech z twojej gêby!
};

// ************************ EXIT **************************

INSTANCE Info_Exit (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 999;
	condition	= Info_Exit_Condition;
	information	= Info_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Exit_Info()
{
	AI_StopProcessInfos	(self);
	
	
	if (ERPRESSER_Hostile == TRUE)
	{
	Npc_SetTarget (ORG_889_CoErpresser,hero);
	AI_StartState (ORG_889_CoErpresser, ZS_Attack, 1,"");
	Npc_SetTarget (self,hero);
	AI_StartState (self, ZS_Attack, 1,"");
	ERPRESSER_Hostile = FALSE;
	};
	
};

instance dia_org_888_pickpocket(c_info) {
    npc = org_888_erpresser;
    nr = 900;
    condition = dia_org_888_pickpocket_condition;
    information = dia_org_888_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_888_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_888_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_888_pickpocket);
	info_addchoice(dia_org_888_pickpocket, dialog_back, dia_org_888_pickpocket_back);
	info_addchoice(dia_org_888_pickpocket, dialog_pickpocket, dia_org_888_pickpocket_doit);
};

func void dia_org_888_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_888_pickpocket);
};

func void dia_org_888_pickpocket_back() {
    info_clearchoices(dia_org_888_pickpocket);
};