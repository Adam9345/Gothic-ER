// ************************ EXIT **************************

instance  Info_Smith_EXIT (C_INFO)
{
	npc			= BAN_1609_Smith;
	nr			= 999;
	condition	= Info_Smith_EXIT_Condition;
	information	= Info_Smith_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Smith_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Smith_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ -
// Nauka
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
// 						Lehrer
// **************************************************
var int log_Smithtrain;
INSTANCE DIA_Smith_Lehrer (C_INFO)
{
	npc				= BAN_1609_Smith;
	nr				= 2;
	condition		= DIA_Smith_Lehrer_Condition;
	information		= DIA_Smith_Lehrer_Info;
	permanent		= 1;
	description		= "Mo¿esz mnie nauczyæ czegoœ o myœlistwie?"; 
};

FUNC INT DIA_Smith_Lehrer_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU)
{	
		return 1;	
};
};
FUNC VOID DIA_Smith_Lehrer_Info()
{
	if (log_Smithtrain == FALSE)
	{
		//edit by  
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,"Smith jest myœliwym. Mo¿e mnie nauczyæ skradania siê, strzelania z ³uku, a tak¿e mo¿e mi pomóc staæ siê zrêczniejszym. Mieszka w Obozie Bandytów.");
		log_Smithtrain = TRUE;
	};
	AI_Output (other, self,"DIA_Smith_Lehrer_15_00"); //Mo¿esz mnie nauczyæ czegoœ o myœlistwie?
	AI_Output (self, other,"DIA_Smith_Lehrer_12_01"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
	
    Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,DIALOG_BACK,DIA_Wolf_Bow_BACK);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_Smith_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)	,DIA_Smith_Lehrer_Schleichen);
	};
};

func void DIA_Smith_Lehrer_Schleichen()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 200) 
	{
	if  (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{		
	    Info_AddChoice(DIA_Smith_Lehrer,Dialog_Back,DIA_Smith_Bow_BACK);
		AI_Output (other, self,"DIA_Smith_Lehrer_Schleichen_15_00"); //Chcia³bym poruszaæ siê bezszelestnie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_01"); //I s³usznie. Skradanie pozwoli ci dostaæ siê niepostrze¿enie do cudzych domów, albo po cichu zajœæ od ty³u przeciwnika.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_02"); //Chodz¹c na lekko ugiêtych nogach bêdziesz móg³ uwa¿niej obserwowaæ grunt, po którym st¹pasz, no i ³atwiej bêdzie ci balansowaæ cia³em.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_03"); //Oczywiœcie ktoœ obserwuj¹cy ciê z boku natychmiast nabierze podejrzeñ, wiêc skradaj siê zawsze nie bêd¹c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_04"); //Zapamiêtaj sobie dobrze co ci powiedzia³em, i przede wszystkim nie daj siê z³apaæ!
		B_GiveInvItems (other,self, itminugget, 200);
	};
	};	
};

func void Dia_Smith_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,Dialog_Back,DIA_Smith_Bow_BACK);
	
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);
};

func void Dia_Smith_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,Dialog_Back,DIA_Smith_Bow_BACK);
	
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);
};
func void DIA_Smith_Bow_BACK()
{
	Info_ClearChoices(DIA_Smith_Lehrer);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ -
// Handel
///////////////////////////////////////////////////////////////////////////////////////////

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  BAN_1609_Smith_TRADE (C_INFO)
{
	npc				= BAN_1609_Smith;
	condition		= BAN_1609_Smith_TRADE_Condition;
	information		= BAN_1609_Smith_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcê kupiæ ³uk."; 
	trade 			= 1;
};

FUNC int  BAN_1609_Smith_TRADE_Condition()
{	
		return TRUE;
};
FUNC void  BAN_1609_Smith_TRADE_Info()
{
	AI_Output (other, self,"BAN_1609_Smith_TRADE_Info_15_01"); //Chcê kupiæ ³uk.
	B_ClearTreaderAmmo(self);
	var int wpis_Smithtrader;
	if wpis_Smithtrader == false
	{
	wpis_Smithtrader = true;
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Smith handluje ³ukami w Obozie Bandytów.");
	};
	
};  

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia³ 1
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FindSwordAlibi
//========================================

INSTANCE DIA_Smith_FindSwordAlibi (C_INFO)
{
   npc          = BAN_1609_Smith;
   nr           = 1;
   condition    = DIA_Smith_FindSwordAlibi_Condition;
   information  = DIA_Smith_FindSwordAlibi_Info;
   permanent	= FALSE;
   description	= "Podobno Jens chcia³, abyœ pomóg³ mu odnaleŸæ miecz.";
};

FUNC INT DIA_Smith_FindSwordAlibi_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_DoyleAboutJens))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Smith_FindSwordAlibi_Info()
{
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_01"); //Podobno Jens chcia³, abyœ pomóg³ mu odnaleŸæ miecz.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_02"); //Tak, tak by³o. Czy to jakiœ problem?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_03"); //Nie, ale Jens ma do ciebie pewn¹ proœbê. Chce, abyœ powiedzia³ to samo Quentinowi.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_04"); //Nie ma sprawy. Móg³bym wiedzieæ tylko po co?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_05"); //Kereth chce wrobiæ Jensa w zabójstwo Rayana.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_06"); //Ten sukinsyn wiecznie coœ kombinuje. Ju¿ któryœ raz próbuje pozbyæ siê Jensa. Ja na jego miejscu ju¿ dawno spuœci³bym mu ³omot.
	
	B_LogEntry                     (CH1_DestroyedGrave,"Smith poœwiadczy za Jensa. Powiedzia³ mi nawet, ¿e to nie pierwszy raz kiedy Kereth próbuje siê pozbyæ rymarza z Obozu. Dobrze, ¿e nie da³em siê nabraæ.");
};

