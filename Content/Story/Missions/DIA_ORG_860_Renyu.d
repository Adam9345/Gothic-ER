//poprawione i sprawdzone -  

// ************************************************************
// 							EXIT 
// ************************************************************
instance Info_Renyu_EXIT(C_INFO)
{
	npc			= ORG_860_Renyu;
	nr			= 999;
	condition	= Info_Renyu_EXIT_Condition;
	information	= Info_Renyu_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Renyu_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Renyu_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************************************
//						Verpi� dich								
//*****************************************************************

instance ORG_860_Renyu_GetLost (C_INFO)
{
	npc			= ORG_860_Renyu;
	nr			= 1;
	condition	= ORG_860_Renyu_GetLost_Condition;
	information	= ORG_860_Renyu_GetLost_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int ORG_860_Renyu_GetLost_Condition()
{
	if (Npc_IsInState(self,ZS_Talk)) &&  (!Npc_KnowsInfo (hero,ORG_862_Jacko_Banditencamp))
	{
		return TRUE;
	};
};

FUNC VOID ORG_860_Renyu_GetLost_Info()
{
	AI_Output (self, other,"Org_860_Renyu_GetLost_Info_06_00"); //Spadaj!
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> CalmDownDude
//========================================

INSTANCE DIA_Renyu_CalmDownDude (C_INFO)
{
   npc          = ORG_860_Renyu;
   nr           = 1;
   condition    = DIA_Renyu_CalmDownDude_Condition;
   information  = DIA_Renyu_CalmDownDude_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Renyu_CalmDownDude_Condition()
{
    if (Npc_KnowsInfo (hero, ORG_862_Jacko_Banditencamp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Renyu_CalmDownDude_Info()
{
    AI_Output (other, self ,"DIA_Renyu_CalmDownDude_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Renyu_CalmDownDude_03_02"); //Cholera, dzi�ki, �e nas ostrzeg�e�. Dopiero teraz zda�em sobie spraw� co by si� sta�o, gdyby �wi�tynna Stra� nas dopad�a. 
    AI_Output (self, other ,"DIA_Renyu_CalmDownDude_03_03"); //Briam za�atwi� mi niez�e zaj�cie. Jako� sobie poradzimy. 
    AI_StopProcessInfos	(self);
};


/* 

//*******************************************************
//					DEAL					
//*******************************************************

instance  ORG_860_Renyu_DEAL (C_INFO)
{
	npc				= ORG_860_Renyu;
	condition		= ORG_860_Renyu_DEAL_Condition;
	information		= ORG_860_Renyu_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin hier, um euch ein Angebot zu unterbreiten."; 
};

FUNC int  ORG_860_Renyu_DEAL_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_ANGEBOT))
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_860_Renyu_DEAL_Info()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_Info_15_01"); //Ich bin hier, um euch ein Angebot zu unterbreiten.
	AI_Output (self, other,"ORG_860_Renyu_DEAL_Info_06_02"); //Da bin ich ja mal gespannt, um was gehts?
	AI_Output (other, self,"ORG_860_Renyu_DEAL_Info_15_03"); //Die Bruderschaft wei�, was ihr hier veranstaltet.Sie schicken mich um daf�r zu sorgen das ihr aufh�rt!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_Info_06_04"); //Komm zur Sache!
	
	Info_ClearChoices (ORG_860_Renyu_DEAL);
	Info_AddChoice  (ORG_860_Renyu_DEAL,"Gebt mir 500 Erz",ORG_860_Renyu_DEAL_500);
	Info_AddChoice  (ORG_860_Renyu_DEAL,"Gebt mir 250 Erz",ORG_860_Renyu_DEAL_250);
};  	
func void 	ORG_860_Renyu_DEAL_500()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_500_Info_15_01"); //Gebt mir 500 Erz dann sorge ich daf�r, das die Bruderschaft euch in Ruhe l�sst.!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_500_Info_06_02"); //Und wenn wir nicht zahlen? Was machst du dann?
	AI_Output (other, self,"ORG_860_Renyu_DEAL_500_Info_15_03"); //Dann schicke ich euch ein paar Templer vorbei, die bekommen alle einen dicken Sack Kraut von mir, wenn sich euch fertigmachen!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_500_Info_06_04"); //Wei�t du, ich denke wir sollten der Bruderschaft zeigen,das wir es ernst meinen. Wir schicken ihnen deine �berreste, als Warnung! 
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
	Npc_SetPermAttitude (self,ATT_HOSTILE);
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Npc_SetTarget		(Killian,	hero);
	AI_StartState		(Killian,	ZS_Attack,	1,	"");	
	Npc_SetPermAttitude (Killian,ATT_HOSTILE);
	var C_NPC jacko; 	
	jacko = Hlp_GetNpc(ORG_862_jacko);
	Npc_SetTarget		(jacko,	hero);
	AI_StartState		(jacko,	ZS_Attack,	1,	"");	
	Npc_SetPermAttitude (jacko,ATT_HOSTILE);
};
func void 	ORG_860_Renyu_DEAL_250()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_250_Info_15_01"); //Gebt mir 250 erz, dann sorge ich daf�r, das die Bruderschaft euch in ruhe l�sst.
	AI_Output (self, other,"ORG_860_Renyu_DEAL_250_Info_06_02"); //Hmmm.... nun gut. Einverstanden.Aber wenn du versuchst, mich reinzulegen, dann wirst du dri w�nschen mich nie getroffen zu haben.Habn wir eine Abmachung? 
	AI_Output (other, self,"ORG_860_Renyu_DEAL_250_Info_15_03"); //Klar, her mit dem Erz! 
	CreateInvItems (self,ItMinugget,250);
	B_GiveInvItems	(self, other, itminugget, 250);
	idiots_deal = TRUE;
};

//*******************************************************
//					Maul					
//*******************************************************

instance  ORG_860_Renyu_LOST (C_INFO)
{
	npc				= ORG_860_Renyu;
	condition		= ORG_860_Renyu_LOST_Condition;
	information		= ORG_860_Renyu_LOST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was sagst du jetzt? Du mieser Schw�chling! "; 
};

FUNC int  ORG_860_Renyu_LOST_Condition()
{	
	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] ;
	
	if  (Renyu.aivar[AIV_WASDEFEATEDBYSC] == TRUE) 
	&&  (Npc_KnowsInfo (hero,ORG_860_Renyu_DEAL))
	&&  ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_860_Renyu_LOST_Info()
{
	AI_Output (other, self,"ORG_860_Renyu_LOST_Info_15_01"); //Was sagst du jetzt? Du mieser Schw�chling! 
	AI_Output (self, other,"ORG_860_Renyu_LOST_Info_06_02"); //In Ordnung, mann du hast gewonnen! Wir werden aufh�ren! Das Kraut geh�rt dir!
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"ARBEITSLOS");
	
	var C_NPC jacko; 	
	jacko = Hlp_GetNpc(ORG_862_jacko);
	Npc_ExchangeRoutine (jacko,"ARBEITSLOS");
};  


*/

instance dia_renyu_pickpocket(c_info) {
    npc = org_860_renyu;
    nr = 900;
    condition = dia_renyu_pickpocket_condition;
    information = dia_renyu_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_renyu_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_renyu_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_renyu_pickpocket);
	info_addchoice(dia_renyu_pickpocket, dialog_back, dia_renyu_pickpocket_back);
	info_addchoice(dia_renyu_pickpocket, dialog_pickpocket, dia_renyu_pickpocket_doit);
};

func void dia_renyu_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_renyu_pickpocket);
};

func void dia_renyu_pickpocket_back() {
    info_clearchoices(dia_renyu_pickpocket);
};