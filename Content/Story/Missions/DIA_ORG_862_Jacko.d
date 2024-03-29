//poprawione i sprawdzone -  

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Jacko_EXIT(C_INFO)
{
	npc			= ORG_862_Jacko;
	nr			= 999;
	condition		= Info_Jacko_EXIT_Condition;
	information	= Info_Jacko_EXIT_Info;
	permanent	= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Jacko_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jacko_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//******************************************************************
//							Raus hier!				
//******************************************************************

instance  ORG_862_Jacko_GoAway (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_GoAway_Condition;
	information		= ORG_862_Jacko_GoAway_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  ORG_862_Jacko_GoAway_Condition()
{	
	if	(Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN")<500)
	&&	(Kalom_DrugMonopol != LOG_RUNNING)
	&&	(Kalom_DrugMonopol != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_GoAway_Info()
{
	AI_Output			(self, other,"ORG_862_Jacko_GoAway_Info_06_00"); //Czego tu do cholery szukasz?
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
}; 

//******************************************************************
//							Weg mit den Jungs				
//******************************************************************

instance  ORG_862_Jacko_GUARD (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_GUARD_Condition;
	information		= ORG_862_Jacko_GUARD_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  ORG_862_Jacko_GUARD_Condition()
{	
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_GUARD_Info()
{
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_00"); //Czy�by�my pob��dzili, h�?
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom wie o waszym ma�ym przedsi�wzi�ciu.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_02"); //Co? Dlaczego tu jeste�?
	Stooges_Fled = TRUE;
	B_LogEntry			(CH1_DrugMonopol,	"Uda�o mi si� znale�� sekretn� jaskini� w kt�rej Jacko i jego koledzy wyrabiaj� ziele. ");

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Jestem tu, �eby was ostrzec."	,ORG_862_Jacko_GUARD_Templer);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Chc� wiedzie� ile ta informacja jest dla ciebie warta."	,ORG_862_Jacko_GUARD_InfoWert);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"hs@FF0000 Aby po�o�y� kres ca�ej tej sprawie!"	,ORG_862_Jacko_GUARD_Angriff);
};  

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //Jestem tu, �eby was ostrzec. Cor Kalom wys�a� pi�ciu Stra�nik�w �wi�tynnych, kt�rzy maj� was wyko�czy�.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //�e jak? Chyba �artujesz!
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //Mog� tu by� w ka�dej chwili!
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Niech to szlag! Musimy st�d wia�!

	Info_Clearchoices	(ORG_862_Jacko_GUARD);

	B_LogEntry			(CH1_DrugMonopol,	"Uda�o mi si� podst�pem wyp�dzi� bandzior�w z jaskini. Przestraszyli si� na wie�� o Stra�nikach �wi�tynnych chc�cych ich zabi�.");
	B_GiveXP			(XP_JackoRetired);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;

	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //Chc� wiedzie� ile ta informacja jest dla ciebie warta.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Ach, wi�c o to ci chodzi... No dobrze. Ty zrobisz co� dla mnie - ja zrobi� co� dla ciebie. Prosz�, to ca�a ruda jak� mam przy sobie.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //Musimy ju� i��! Tobie zreszt� te� to radz�!

	B_GiveInvItems		(self, other,itminugget,95);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;
	B_LogEntry			(CH1_DrugMonopol,	"Uda�o mi si� rozwi�za� ten problem pokojowo. Jacko wyczu�, �e zrobi�o si� gor�co i uciek�.");
	B_GiveXP			(XP_JackoRetired);

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	AI_Output (other, self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //Aby po�o�y� kres ca�ej tej sprawie!
	AI_Output (self, other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Ch�opaki! Chod�cie no tu na chwil�!
    Jacko_KS_Dead = TRUE;
	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos	(self);
	Stooges_Fled = TRUE;
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
	Npc_SetPermAttitude (self,ATT_HOSTILE);
	Npc_SetTempAttitude (self,ATT_HOSTILE);
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Npc_SetTarget		(Killian,	hero);
	AI_StartState		(Killian,	ZS_Attack,	0,	"");	//0 ist richtig!
	Npc_SetPermAttitude (Killian,ATT_HOSTILE);
	Npc_SetTempAttitude (Killian,ATT_HOSTILE);
	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Npc_SetTarget		(Renyu,	hero);
	AI_StartState		(Renyu,	ZS_Attack,	0,	"");		//0 ist richtig!
	Npc_SetPermAttitude (Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude (Renyu,ATT_HOSTILE);
};

//******************************************************************
//							Im Banditencamp				
//******************************************************************

instance  ORG_862_Jacko_Banditencamp (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_Banditencamp_Condition;
	information		= ORG_862_Jacko_Banditencamp_Info;
	permanent		= 1;
	description		= "A wi�c to tutaj si� zaszyli�cie.";
};

FUNC int  ORG_862_Jacko_Banditencamp_Condition()
{	
	if  (Kalom_DrugMonopol == LOG_SUCCESS) && ((Hlp_StrCmp(Npc_GetNearestWP(self),"BC_JACKO_WALL") ) || (Hlp_StrCmp(Npc_GetNearestWP(self),"BC_JACKO_WALL") ))
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_Banditencamp_15_00"); //A wi�c to tutaj si� zaszyli�cie.
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_01"); //By�o blisko. Stra�nicy z Sekty posiekaliby nas na dzwona.
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_02"); //Killian poszed� w�asn� �cie�k�. Chyba szuka pracy w obozie my�liwych, ale mog� si� myli�. 
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_03"); //Do Renyu lepiej si� nie zbli�aj. Jest nie�le wkurzony po tym co si� sta�o. 
	AI_Output (other, self,"ORG_862_Jacko_Banditencamp_15_04"); //Zawsze mo�na spr�bowa�. 
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_05"); //I tak nic ciekawego ci nie powie.
			
	AI_StopProcessInfos	(self);
}; 


//******************************************************************
//				NORMAL									
//******************************************************************

instance  ORG_862_Jacko_Rosliny (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_Rosliny_Condition;
	information		= ORG_862_Jacko_Rosliny_Info;
	important		= 0;
	permanent		= 0;
	description		= "hs@FF0000 Przyszed�em po ro�liny, kt�re ukradli�cie pewnemu Szkodnikowi. "; 
};

FUNC int  ORG_862_Jacko_Rosliny_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Buster_Klucz_Stone))
	{
		return TRUE;
	};

};
FUNC void  ORG_862_Jacko_Rosliny_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_Rosliny_Info_15_01"); //Przyszed�em po ro�liny, kt�re ukradli�cie pewnemu Szkodnikowi. 
	AI_Output (self, other,"ORG_862_Jacko_Rosliny_Info_06_02"); //Go� si�.  
	AI_Output (other, self,"ORG_862_Jacko_Rosliny_Info_15_03"); //Wiem, �e je macie.  
	AI_Output (self, other,"ORG_862_Jacko_Rosliny_Info_06_04"); //Id� st�d bo dostaniesz po buzi ch�optasiu!
	AI_Output (other, self,"ORG_862_Jacko_Rosliny_Info_15_05"); //W takim razie troch� przeszukam t� wasz� melin�.  
	AI_Output (self, other,"ORG_862_Jacko_Rosliny_Info_06_06"); //Ch�opcy w takim razie bierzcie tego z�amasa!
	ORG_862_Jacko.attribute[ATR_HITPOINTS] = 250;
	ORG_862_Jacko.attribute[ATR_HITPOINTS_MAX] = 250;
	CreateInvItems  (self,ItMw_1H_Mace_03,1);
	EquipItem		(self, ItMw_1H_Mace_03);
	
	   B_LogEntry                     (KuzniaStone,"Jacko odm�wi� wsp�pracy. Musia�em wi�c spr�bowa� nauczy� bimbrownik�w dobrych manier.");
	CreateInvItem	(ORG_862_Jacko, ItKe_Jacko_Kuznia);
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  	
    Npc_SetTarget (ORG_861_Killian, other);
    AI_StartState (ORG_861_Killian, ZS_ATTACK, 1, "");  
    Npc_SetTarget (ORG_860_Renyu, other);
    AI_StartState (ORG_860_Renyu, ZS_ATTACK, 1, "");  
	

};

/*
//******************************************************************
//					SPELER SOLL ABHAUEN						
//******************************************************************

instance  ORG_862_Jacko_DRUGGUARD (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_DRUGGUARD_Condition;
	information		= ORG_862_Jacko_DRUGGUARD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was machst du hier?"; 
};

FUNC int  ORG_862_Jacko_DRUGGUARD_Condition()
{	
	return TRUE;
};
FUNC void  ORG_862_Jacko_DRUGGUARD_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_DRUGGUARD_Info_15_01"); //Was machst du hier?
	AI_Output (self, other,"ORG_862_Jacko_DRUGGUARD_Info_06_02"); //Gar nichts. Geh weg!
	AI_StopProcessInfos	(self);
};  


//******************************************************************
//						NORMAL									
//******************************************************************

instance  ORG_862_Jacko_KALOM (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_KALOM_Condition;
	information		= ORG_862_Jacko_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin im Auftrag der Bruderschaft hier."; 
};

FUNC int  ORG_862_Jacko_KALOM_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_DRUGGUARD))
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_862_Jacko_KALOM_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_KALOM_Info_15_01"); //Ich bin im Auftrag der Bruderschaft hier. 
	AI_Output (self, other,"ORG_862_Jacko_KALOM_Info_06_02"); //Oh scheisse! Und da schicken die so einen wie dich? 
};  

//******************************************************************
//				NORMAL									
//******************************************************************

instance  ORG_862_Jacko_ANGEBOT (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_ANGEBOT_Condition;
	information		= ORG_862_Jacko_ANGEBOT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich will euch ein Angebot machen!"; 
};

FUNC int  ORG_862_Jacko_ANGEBOT_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_KALOM))
	{
		return TRUE;
	};

};
FUNC void  ORG_862_Jacko_ANGEBOT_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_ANGEBOT_Info_15_01"); //Ich will euch ein Angebot machen!
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_02"); //Was f�r ein Angebot? 
	AI_Output (other, self,"ORG_862_Jacko_ANGEBOT_Info_15_03"); //Das werde ich mit demjenigen bereden,der hier das Sagen hat.  
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_04"); //Na sch�n,dann rede mit Renyu. Aber keine faulen Tricks, sonst zerschlage ich jeden deiner Knochen einzeln!
	AI_StopProcessInfos	(self);
};  

*/

instance dia_jacko_pickpocket(c_info) {
    npc = org_862_jacko;
    nr = 900;
    condition = dia_jacko_pickpocket_condition;
    information = dia_jacko_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jacko_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_jacko_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jacko_pickpocket);
	info_addchoice(dia_jacko_pickpocket, dialog_back, dia_jacko_pickpocket_back);
	info_addchoice(dia_jacko_pickpocket, dialog_pickpocket, dia_jacko_pickpocket_doit);
};

func void dia_jacko_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_jacko_pickpocket);
};

func void dia_jacko_pickpocket_back() {
    info_clearchoices(dia_jacko_pickpocket);
};