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
// Rozdzia� -
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
	description		= "Mo�esz mnie nauczy� czego� o my�listwie?"; 
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
		B_LogEntry		(GE_TeacherBAN,"Smith jest my�liwym. Mo�e mnie nauczy� skradania si�, strzelania z �uku, a tak�e mo�e mi pom�c sta� si� zr�czniejszym. Mieszka w Obozie Bandyt�w.");
		log_Smithtrain = TRUE;
	};
	AI_Output (other, self,"DIA_Smith_Lehrer_15_00"); //Mo�esz mnie nauczy� czego� o my�listwie?
	AI_Output (self, other,"DIA_Smith_Lehrer_12_01"); //To zale�y tylko od tego, co chcia�by� wiedzie�.
	
    Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,DIALOG_BACK,DIA_Wolf_Bow_BACK);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);

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
		AI_Output (other, self,"DIA_Smith_Lehrer_Schleichen_15_00"); //Chcia�bym porusza� si� bezszelestnie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_01"); //I s�usznie. Skradanie pozwoli ci dosta� si� niepostrze�enie do cudzych dom�w, albo po cichu zaj�� od ty�u przeciwnika.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_02"); //Chodz�c na lekko ugi�tych nogach b�dziesz m�g� uwa�niej obserwowa� grunt, po kt�rym st�pasz, no i �atwiej b�dzie ci balansowa� cia�em.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_03"); //Oczywi�cie kto� obserwuj�cy ci� z boku natychmiast nabierze podejrze�, wi�c skradaj si� zawsze nie b�d�c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_Smith_Lehrer_Schleichen_12_04"); //Zapami�taj sobie dobrze co ci powiedzia�em, i przede wszystkim nie daj si� z�apa�!
		B_GiveInvItems (other,self, itminugget, 200);
	};
	};	
};

func void Dia_Smith_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,Dialog_Back,DIA_Smith_Bow_BACK);
	
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);
};

func void Dia_Smith_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Smith_Lehrer);
	Info_AddChoice(DIA_Smith_Lehrer,Dialog_Back,DIA_Smith_Bow_BACK);
	
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Smith_Teach_Bow_1);
	Info_AddChoice(DIA_Smith_Lehrer,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Smith_Teach_Bow_5);
};
func void DIA_Smith_Bow_BACK()
{
	Info_ClearChoices(DIA_Smith_Lehrer);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia� -
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
	description		= "Chc� kupi� �uk."; 
	trade 			= 1;
};

FUNC int  BAN_1609_Smith_TRADE_Condition()
{	
		return TRUE;
};
FUNC void  BAN_1609_Smith_TRADE_Info()
{
	AI_Output (other, self,"BAN_1609_Smith_TRADE_Info_15_01"); //Chc� kupi� �uk.
	B_ClearTreaderAmmo(self);
	var int wpis_Smithtrader;
	if wpis_Smithtrader == false
	{
	wpis_Smithtrader = true;
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Smith handluje �ukami w Obozie Bandyt�w.");
	};
	
};  

///////////////////////////////////////////////////////////////////////////////////////////
// Smith
// Rozdzia� 1
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
   description	= "Podobno Jens chcia�, aby� pom�g� mu odnale�� miecz.";
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
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_01"); //Podobno Jens chcia�, aby� pom�g� mu odnale�� miecz.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_02"); //Tak, tak by�o. Czy to jaki� problem?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_03"); //Nie, ale Jens ma do ciebie pewn� pro�b�. Chce, aby� powiedzia� to samo Quentinowi.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_04"); //Nie ma sprawy. M�g�bym wiedzie� tylko po co?
    AI_Output (other, self ,"DIA_Smith_FindSwordAlibi_15_05"); //Kereth chce wrobi� Jensa w zab�jstwo Rayana.
    AI_Output (self, other ,"DIA_Smith_FindSwordAlibi_03_06"); //Ten sukinsyn wiecznie co� kombinuje. Ju� kt�ry� raz pr�buje pozby� si� Jensa. Ja na jego miejscu ju� dawno spu�ci�bym mu �omot.
	
	B_LogEntry                     (CH1_DestroyedGrave,"Smith po�wiadczy za Jensa. Powiedzia� mi nawet, �e to nie pierwszy raz kiedy Kereth pr�buje si� pozby� rymarza z Obozu. Dobrze, �e nie da�em si� nabra�.");
};

