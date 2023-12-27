//poprawione i sprawdzone -  

//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Sp�ter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zosta� silnym wojownikiem, wi�c szukasz mistrza, kt�ry wska�e ci drog�.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mog� ci pom�c.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Po�wi�cam m�j czas tylko cz�onkom Wielkiego Kr�gu Stra�y �wi�tynnej.
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Angar mo�e mnie nauczy� walki dwur�cznym or�em lub poka�e mi jak zwi�kszy� si�� i zr�czno��, o ile b�d� cz�onkiem Bractwa. ");
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) == GIL_NONE) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobi�, �eby zosta� �wi�tynnym Stra�nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz ods�u�y� swoje jako Nowicjusz, dop�ki nie przekonamy si�, �e jeste� oddanym s�ug� �ni�cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy mo�esz do mnie wr�ci�, a ja udziel� ci lekcji.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							ST�RKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Poka�esz mi, jak poprawi� moj� si�� i zr�czno��?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Si�a i zr�czno�� to cechy wielkiego wojownika.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chc� zosta� �wi�tynnym Stra�nikiem!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chc� zosta� �wi�tynnym Stra�nikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jeste� jeszcze gotowy. Mo�esz do nas do��czy�, kiedy zdob�dziesz nieco wi�cej do�wiadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszed� dzie�, w kt�rym dane ci b�dzie do nas do��czy�.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pami�taj, �e �wi�tynny Stra�nik to co� wi�cej ni� wojownik strzeg�cy Obozu Bractwa. Jeste�my wybranymi stra�nikami wyznawc�w �ni�cego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zar�wno nasz� si�� fizyczn� jak i duchow�. Prawdziwym Stra�nikiem �wi�tynnym mo�e zosta� tylko ten, kt�rego cia�o i duch funkcjonuj� w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Ciesz� si�, �e uda�o ci si� osi�gn�� tak wiele w tak kr�tkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pami�taj: Duchowa koncentracja i zdrowe cia�o sprostaj� ka�demu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Id� teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;
		HeroJoinToPSI ();
		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Dzi� Cor Angar przyj�� mnie w poczet Stra�y �wi�tynnej. Gor Na Toth ma mi wr�czy� moj� now� zbroj�. Znajd� go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar pomo�e mi rozwin�� moj� si��, zr�czno��.");
	};

};



//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  GUR_1202_CorAngar_TEACH_2H_START (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_TEACH_2H_START_Condition;
	information		= GUR_1202_CorAngar_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  GUR_1202_CorAngar_TEACH_2H_START_Condition()
{	
	if  Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && ((Npc_GetTrueGuild    (hero) == GIL_NOV) || (Npc_GetTrueGuild    (hero) == GIL_TPL) || (Npc_GetTrueGuild    (hero) == GIL_GUR) || (Npc_GetTrueGuild    (hero) == GIL_DMB))
	{
	return TRUE;
	};
};

FUNC void  GUR_1202_CorAngar_TEACH_2H_START_Info()
{
	AI_Output (other, self,"GUR_1202_CorAngar_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"GUR_1202_CorAngar_TEACH_2H_START_Info_09_02"); //No dobra.

    Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,"Wr��",DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);
	

};

func void DIA_CorAngar_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);

};



func void DIA_CorAngar_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);

	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);


};



func void DIA_CorAngar_START_TRAIN_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
};



  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der gro�en Beschw�rung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co si� stanie teraz?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co si� stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja by�a bardzo mglista. Zamiast odpowiedzi da�a nam jeszcze wi�cej pyta�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega w�tpliwo�ci: widzia�em orka w jaskini. W pobli�u znajduje si� opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmar�ych, dlatego nazywamy ten labirynt jaski� Cmentarzyskiem Ork�w.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor uda� si� tam z oddzia�em Stra�nik�w �wi�tynnych. Mo�e znajd� co�, co pozwoli nam wyja�ni� znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przyda�by mi si� kto�, kto rozejrzy si� tam troch� i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie p�jdziesz tam sam? W ko�cu jeste� przyw�dc� Stra�y �wi�tynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Ja�nie O�wieconego. Musz� zosta� na miejscu, �eby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odda�e� Obozowi nieocenione us�ugi. Tylko na tobie mog� polega�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Prosz�, udaj si� na Cmentarzysko Ork�w i dostarcz mi informacji na temat odkry� poczynionych przez Stra�nik�w.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostan� w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast rusz� w drog�!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostan� w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak �le ci� oceni�em. Ale potrzebuj� twojej pomocy. Prosz�, oto 100 bry�ek rudy. Wi�cej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast rusz� w drog�!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim p�jdziesz, we� ten pier�cie�. Niech ci� chroni w walce.
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie jest to Cmentarzysko Ork�w?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Gdzie jest to Cmentarzysko Ork�w?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko st�d. Nowicjusz Talas wska�e ci drog�. Znajdziesz go na �wi�tynnym dziedzi�cu. On b�dzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,	"Nowicjusz Talas wska�e mi drog� do Cmentarzyska Ork�w. Czeka na mnie na �wi�tynnym dziedzi�cu.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "By�em na Cmentarzysku Ork�w."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //By�em na Cmentarzysku Ork�w. Tam NIC NIE MA. Ani �ni�cego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Stra�nikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zgin�li.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zgin�li? Ale dlaczego, co si� sta�o?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach a� roi�o si� od ork�w. Wybili Stra� �wi�tynn� do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszli�my z tego ca�o, ale nagle Baal postrada� zmys�y.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszcza�, �e �ni�cy kaza� mu mnie zabi� i zamierza� wykona� to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Najwyra�niej nie m�g� si� pogodzi� z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierz�, �eby b�ogos�awiony wp�yw �ni�cego m�g� go popchn�� do tak brutalnego dzia�ania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie mo�e... Nie mo�e... NIEWA�NE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najwa�niejsze, �e zamiar Baala Lukora si� nie powi�d�.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz nasz� jedyn� nadziej� jest Y'Berion.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co s�ycha� u Ja�nie O�wieconego?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co s�ycha� u Ja�nie O�wieconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi si�. I z godziny na godzin� jest co raz s�abszy. Wiem, jak mo�na go zbudzi�, ale potrzebuj� twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobi�?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynie� mi pi�� najmocniejszych zi� uzdrawiaj�cych jakie mo�na znale�� na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz si�!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion nadal nie odzyska� przytomno�ci. Cor Angar nakaza� mi znale�� pi�� leczniczych zi� o silnym dzia�aniu.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Gdzie mog� znale�� te zio�a?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mog� znale�� te zio�a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz si� zapu�ci� do�� daleko, wi�c uwa�aj na b�otne w�e!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie tra� ani chwili. Id� ju�!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Potrzebne Angarowi zio�a rosn� daleko na bagnach, za Obozem Bractwa. Musz� mie� oczy szeroko otwarte - tamta okolica roi si� od b�otnych w�y.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Jak rozpoznam te zio�a?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zio�a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominaj� gwiazd� z o�mioma zielonymi i pomara�czowymi li��mi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drog�.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Lecznicze zio�a przypominaj� gwiazdy. Maj� cztery zielone i cztery pomara�czowe li�cie.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalaz�em jeszcze potrzebnej ilo�ci zi�.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo�e Fortuno, handlarz zio�ami, ma troch� w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz si�. Potrzebuj� pi�ciu zi�. Y'Berionowi nie zosta�o ju� zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kr�uter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno, handlarz zielem, mo�e mie� takie zio�a na sk�adzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam ju� wszystkie uzdrawiaj�ce zio�a dla Y'Beriona.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam ju� wszystkie uzdrawiaj�ce zio�a dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudzi� si� na chwil� tu� przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedzia� co�?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedzia�, �e �ni�cy nie jest tym, za co go uwa�amy. Pod �adnym pozorem nie wolno nam go zbudzi�.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mie� nadziej�, �e dla biednego Y'Beriona nie jest jeszcze za p�no.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Da�em Cor Angarowi odpowiednie zio�a. Miejmy tylko nadziej�, �e nie jest jeszcze za p�no...");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE �YJE. Nasz duchowy przyw�dca odszed� w za�wiaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja b�yskawiczna pomoc nie mog�a zapobiec jego �mierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz b�dzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufa�em Y'Berionowi. Tu� przed �mierci� kaza� nam upatrywa� nadziei ocalenia w planie ucieczki opracowanym przez Mag�w Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinni�my wesprze� Mag�w Wody w ich d��eniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda si� im kamie� ogniskuj�cy i almanach. Ale te s� wci�� w r�kach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebra� oddzia� Stra�nik�w �wi�tynnych i wyruszy� na poszukiwanie �ni�cego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamie� ogniskuj�cy?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdaj� si�, �e kamie� i ksi�ga s� wci�� w jego laboratorium. Masz tu klucz do skrzyni.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
	Npc_ExchangeRoutine (GUR_1202_CorAngar,"chef");//1.4
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze co�!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //We� t� magiczn� run� jako symbol naszej wdzi�czno�ci za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportowa� si� na �wi�tynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dzi�kuj�!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};

///////////////////////////////////////////////////
// 	Where Is Kalom
//////////////////////////////////////////////////

INSTANCE DIA_CorAngar_WhereIsKalom (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_WhereIsKalom_Condition;
   information  = DIA_CorAngar_WhereIsKalom_Info;
   permanent	= FALSE;
   description	= "Wiesz dok�d uda� si� Cor Kalom?";
};

FUNC INT DIA_CorAngar_WhereIsKalom_Condition()
{
    if (CorAngar_FindHerb == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_WhereIsKalom_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_01"); //Wiesz dok�d uda� si� Cor Kalom?
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_02"); //Nie, wci�� jest to dla mnie zagadk�. 
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_03"); //Chcia�bym dowiedzie� si� dok�d poszed�.
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_04"); //By� mo�e kto� go widzia�. Tak du�a liczba �wi�tynnych nie mog�a przej�� przez koloni� niezauwa�ona.
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_05"); //Kto� m�g� ich widzie�. Powiniene� porozmawia� z my�liwymi. Cz�sto w�druj� po Kolonii w poszukiwaniu zwierzyny. 
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_06"); //Podobno maj� sw�j ob�z nad rzek�.
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_07"); //Tak, znam to miejsce. Udam si� tam jak najszybciej. 

	MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciek� z Bractwa wraz z grup� Nowicjuszy i �wi�tynnych. Musz� dowiedzie� si� dok�d poszli. Wskaz�wki mog� mi da� my�liwi. Cor Angar uwa�a, �e kt�ry� z nich m�g� ich widzie�.");
};

///////////////////////////////////////////////////
// 	Kalom Is In Orc City
//////////////////////////////////////////////////

INSTANCE DIA_CorAngar_KalomOrcCity (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_KalomOrcCity_Condition;
   information  = DIA_CorAngar_KalomOrcCity_Info;
   permanent	= FALSE;
   description	= "Kalom uda� si� do miasta ork�w.";
};

FUNC INT DIA_CorAngar_KalomOrcCity_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_SectTeam))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_KalomOrcCity_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_01"); //Kalom, wraz z kilkoma Stra�nikami �wi�tynnymi uda� si� do Miasta Ork�w.
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_02"); //�owcy ork�w ostatni raz widzieli go przy bagnie na Ziemiach Ork�w.
	AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_03"); //Ciekawi mnie tylko jak Kalom przedosta� si� przez grupy zielonosk�rych.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_04"); //Widocznie musia� mie� ze sob� jaki� atut, kt�ry go ochroni�.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_05"); //Prawdopodobnie nigdy si� tego nie dowiemy.
	//log
    B_LogEntry               (CH3_SearchKalom,"Powiedzia�em Cor Angarowi, �e �owcy ork�w widzieli Kaloma, kt�ry prawdopodobnie uda� si� na ziemie ork�w. Pozostaje nam mie� nadziej�, �e szalony Guru nie zrobi nic g�upiego.");
    Log_SetTopicStatus       (CH3_SearchKalom, LOG_SUCCESS);
    MIS_SearchKalom = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_AboutKalom);
	//prize
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
};
//========================================
//-----------------> GuruMomPlese
//========================================

INSTANCE DIA_CorAngar_GuruMomPlese (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 2;
   condition    = DIA_CorAngar_GuruMomPlese_Condition;
   information  = DIA_CorAngar_GuruMomPlese_Info;
   permanent	= FALSE;
   description	= "Mistrzu, kto zast�pi Y'Beriona?";
};

FUNC INT DIA_CorAngar_GuruMomPlese_Condition()
{
    if ((Npc_GetTrueGuild (hero) == GIL_TPL) || (Npc_GetTrueGuild (hero) == GIL_NOV))
	&& (Npc_KnowsInfo (hero, Info_CorAngar_FindHerb_Success))
	&& (Kapitel >= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_GuruMomPlese_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_01"); //Mistrzu, kto zast�pi Y'Beriona?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_02"); //�mier� Wielkiego Mistrza stawia nasz� spo�eczno�� przed powa�nym problemem. Na razie osobi�cie postaram si� mie� wszystko pod kontrol�.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_03"); //Jednak sam nie dam sobie rady. Zw�aszcza, �e Cor Kalom odszed�. Kto� musi go zast�pi�. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_04"); //Ty... Sta�e� si� silniejszy i bardziej do�wiadczony od kiedy tu przyby�e�.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_05"); //Pomagasz nam w trudno�ciach, wiernie s�u�ysz Bractwu, bez ciebie nie odby�o by si� przywo�anie...
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_06"); //Czy nie zechcia�by� za�o�y� szat� Guru?
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_07"); //C�, nie wygl�da na zbyt wygodn�...
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_08"); //Pr�bujesz ukry� si� pod p�aszczykiem arogancji. M�w, co ci� trapi.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_09"); //Mistrzu, chodzi o to, �e �ni�cy jest demonem. Obaj dobrze o tym wiemy. Dlaczego mia�bym chcie� zosta� Guru, jego najwierniejszym s�ug�?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_10"); //Rozumiem twoje obawy. To si� bardzo chwali, �e mi o tym powiedzia�e�. Nie licz� si� dla ciebie tytu�y lecz duch!
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_11"); //Bractwo wymaga teraz wiele pracy, aby przetrwa�o. Wiara w �ni�cego nie jest ju� tym, co nas spaja. ��czy nas wsp�lna przesz�o�� i nowe wyzwania. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_12"); //Ci ludzie potrzebuj� kogo�, kto pomo�e im si� po tym wszystkim otrz�sn��. Robisz to wi�c nie dla �ni�cego, tylko dla jego by�ych wyznawc�w.
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_13"); //No dobrze. Za�o�� szat� Guru.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_14"); //Zaczekaj! Musisz mi wcze�niej udowodni�, �e jeste� got�w.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_15"); //CO?!
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_16"); //Baal Cadar jest w posiadaniu pewniej tajemniczej ksi�gi. Od kilku dni pr�buje j� sprzeda�. Czyta�em jej fragmenty. Nale�a�a do jakiego� alchemika.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_17"); //Odkup j� od niego i przeczytaj. Wewn�trz znajduje si� przepis na mikstur� lecz�c� umys�. Uwarz j�, a uznam, �e jeste� got�w.
    MIS_TestGuru = LOG_RUNNING;

    Log_CreateTopic          (CH3_TestGuru, LOG_MISSION);
    Log_SetTopicStatus       (CH3_TestGuru, LOG_RUNNING);
    B_LogEntry               (CH3_TestGuru,"Aby zosta� Guru musz� przygotowa� specjaln� mikstur�. Przepis znajd� w ksi�dze, kt�r� chce sprzeda� Baal Cadar.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Mixtura156
//========================================

INSTANCE DIA_CorAngar_Mixtura156 (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_Mixtura156_Condition;
   information  = DIA_CorAngar_Mixtura156_Info;
   permanent	= FALSE;
   description	= "Uwarzy�em mikstur� oczyszczenia.";
};

FUNC INT DIA_CorAngar_Mixtura156_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorAngar_GuruMomPlese))
    && (Npc_HasItems (other, ItFo_Potion_Clear) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_Mixtura156_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_01"); //Uwarzy�em mikstur� oczyszczenia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_02"); //To nap�j o kt�rym pisano w ksi�dze?
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_03"); //Tak, ta mikstura oczyszcza umys� ka�dego, kto j� wypije.
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_04"); //Przepis by� bardzo skomplikowany i wymaga� wielu sk�adnik�w trudnych do zdobycia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_05"); //Udowodni�e�, �e jeste� godzien nosi� szat� Guru. Witaj w�r�d nas. Mo�esz rozgo�ci� si� w laboratorium Kaloma.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_06"); //We� upragnion� szat� i ten kostur. Niechaj ci s�u��. Bractwo na ciebie liczy.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_07"); //Shan b�dzie twoim asystentem i powie ci, czym nale�y si� zaj��.
    hero.guild = GIL_GUR;
    CreateInvItems (self, GUR_ARMOR_M, 1);
    B_GiveInvItems (self, other, GUR_ARMOR_M, 1);
	CreateInvItems (self, ItMw_2H_Staff_GuruMage_03, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_GuruMage_03, 1);
	AI_EquipBestArmor	(hero); 
    B_LogEntry                     (CH3_TestGuru,"Uda�o mi si�. Zosta�em Guru w Obozie Bractwa. Mam zast�powa� Cor Kaloma. Moim asystentem jest Shan, by�y pomocnik Y'Beriona. Od niego dowiem si�, co mam do zrobienia...");
    Log_SetTopicStatus       (CH3_TestGuru, LOG_SUCCESS);
    MIS_TestGuru = LOG_SUCCESS;
	Npc_SetTrueGuild (hero,GIL_GUR);
	HeroJoinToPSI ();
    B_GiveXP (2000);
	
	var c_Npc cadar; cadar = Hlp_GetNpc (GUR_1208_BaalCadar);
	CreateInvItems (cadar, ItMw_2H_Staff_GuruMage_04, 1);
	CreateInvItems (cadar, ItMw_2H_Staff_GuruMage_05, 1);
};

//========================================
//-----------------> BuyArmorH
//========================================

INSTANCE DIA_CorAngar_BuyArmorH (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 2;
   condition    = DIA_CorAngar_BuyArmorH_Condition;
   information  = DIA_CorAngar_BuyArmorH_Info;
   permanent	= FALSE;
   description	= "Kup zdobion� szat� Guru.(2460 bry�ek rudy)";
};

FUNC INT DIA_CorAngar_BuyArmorH_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_GUR)
    {
		var int AFIP_ShowItem; AFIP_ShowItem = GUR_ARMOR_H;
    	return TRUE;
    };
};


FUNC VOID DIA_CorAngar_BuyArmorH_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_01"); //Chc� nosi� zdobion� szat�.
    AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_02"); //Ten wyj�tkowy pancerz nie jest tani. Masz wystarczaj�co du�o rudy?
    if (Npc_HasItems (hero, ItMiNugget)>=2460)
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_03"); //Oczywi�cie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_04"); //Oto twoja szata.
        CreateInvItems (self, GUR_ARMOR_H, 1);
        B_GiveInvItems (self, other, GUR_ARMOR_H, 1);
        B_GiveInvItems (other, self, ItMiNugget, 2460);
    }
    else
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_05"); //Niestety nie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_06"); //Wr��, gdy uzbierasz odpowiedni� ilo�� rudy.
		DIA_CorAngar_BuyArmorH.permanent = true;
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> KopalniaClear
//========================================

INSTANCE DIA_CorAngar_KopalniaClear (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_KopalniaClear_Condition;
   information  = DIA_CorAngar_KopalniaClear_Info;
   permanent	= FALSE;
   description	= "Pomog�em pozby� si� ludzi Gomeza z Kopalni.";
};

FUNC INT DIA_CorAngar_KopalniaClear_Condition()
{
    if (MIS_PsiAbadonedMine == LOG_SUCCESS)
	&& (Npc_GetTrueGuild(hero) == GIL_GUR)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorAngar_KopalniaClear_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_01"); //Pomog�em pozby� si� ludzi Gomeza z Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_02"); //To �wietnie. Pos�aniec dotar�? 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_03"); //Tak, ale nie widzia�em si� z nim. Informacj� przekaza� mi Najemnik, kt�ry poleci� mi rozmow� z Laresem.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_04"); //Lares to twardy i odpowiedzialny cz�owiek. Dobrze zna Bandyt�w i stosunki mi�dzy obozami.
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_05"); //Kopalnia by�a pe�na o�ywie�c�w a cz�� korytarzy zala�a podziemna rzeka. 
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_06"); //Wiele si� m�wi�o o tej kopalni. Widocznie cz�� z nich by�a prawd�...
    B_GiveXP (500);
};


//========================================
//-----------------> Blokada
//========================================

INSTANCE DIA_CorAngar_Blokada (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_Blokada_Condition;
   information  = DIA_CorAngar_Blokada_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorAngar_Blokada_Condition()
{
if (kapitel == 4)
&& (Npc_GetTrueGuild(hero) == GIL_TPL)
{
    return TRUE;
};
};
FUNC VOID DIA_CorAngar_Blokada_Info()
{
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_01"); //Musimy pom�wi� przyjacielu.
    AI_Output (other, self ,"DIA_CorAngar_Blokada_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_03"); //Odk�d zawali�a si� Stara Kopalnia Gomez wpad� w sza�. Potrzebuje zysk�w i gor�czkowo szuka sposob�w ich pozyskania. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_04"); //Teraz postanowi� wys�a� liczny oddzia� Stra�nik�w, kt�ry b�dzie mia� za zadanie blokad� Bractwa. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_05"); //Ten szaleniec zamierza wymusi� od Sekty olbrzymi� kontrybucj� w sk�ad, kt�rej b�d� wchodzi� olbrzymia ilo�� rudy i ziela.
	Log_CreateTopic		(Blokada,	LOG_MISSION);
	Log_SetTopicStatus	(Blokada,	LOG_RUNNING);
	B_LogEntry          (Blokada,"Cor Angar poinformowa� mnie o blokadzie Bractwa przez si�y Gomeza. Ten zarozumia�y tyran doprowadzony do ostateczno�ci przez zawalenie Starej Kopalni zamierza wymusi� na obozie , kt�rego jestem cz�onkiem olbrzymi� kontrybucj�. Cor Angar poleci� mi pom�wi� z Gor Na Tothem o rozbiciu si� Gomeza przez naszych ludzi,");
    Wld_SendUnTrigger ("GRD_BLO_TENT1"); 
	Wld_SetObjectRoutine (20,00,"GRD_BLO_TENT1",1);
	Wld_SetObjectRoutine (06,00,"GRD_BLO_TENT1",0);
};

//========================================
//-----------------> Blokada_02
//========================================

INSTANCE DIA_CorAngar_Blokada_02 (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 2;
   condition    = DIA_CorAngar_Blokada_02_Condition;
   information  = DIA_CorAngar_Blokada_02_Info;
   permanent	= FALSE;
   description	= "Co takiego?! Sk�d o tym wiesz?";
};

FUNC INT DIA_CorAngar_Blokada_02_Condition()
{
if (Npc_KnowsInfo(hero,DIA_CorAngar_Blokada))
{
    return TRUE;
};
};
FUNC VOID DIA_CorAngar_Blokada_02_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_01"); //Co takiego?! Sk�d o tym wiesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_02"); //Przys�a� emisariusza, kt�rego odprawili�my. Teraz jego ludzie przyst�pili do blokady naszego obozu.
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_03"); //Atakuj� wszysztkich, kt�rzy pr�buj� z niego wyj�� lub do niego wej��. 
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_04"); //Trzeba si� troch� zabawi�. Co proponujesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_05"); //Porozmawiaj z Gor Na Tothem. Niech da ci ludzi i rozbijcie w py� t� przekl�t� band� wariat�w!
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_06"); //W porz�dku.
	Wld_InsertNpc				(GRD_40090_Gardist,"WP_BLO_GRD4");
	Wld_InsertNpc				(GRD_40087_Gardist,"WP_BLO_GRD4");
	Wld_InsertNpc				(GRD_40088_Gardist,"WP_BLO_GRD4");
	Wld_InsertNpc				(GRD_40089_Gardist,"WP_BLO_GRD4");
};

//========================================
//-----------------> BlokadaEnd
//========================================

INSTANCE DIA_CorAngar_BlokadaEnd (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_BlokadaEnd_Condition;
   information  = DIA_CorAngar_BlokadaEnd_Info;
   permanent	= FALSE;
   description	= "Dzi�ki uczniom Gor Na Totha uda�o si� pokona� blokad� Stra�nik�w Gomeza.";
};

FUNC INT DIA_CorAngar_BlokadaEnd_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaWon))
{
    return TRUE;
};
};
FUNC VOID DIA_CorAngar_BlokadaEnd_Info()
{
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_01"); //Dzi�ki uczniom Gor Na Draka uda�o si� pokona� blokad� Stra�nik�w Gomeza.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_02"); //Wspaniale. Okazali�cie wielk� odwag� I hart ducha. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_03"); //Wszyscy nasi ludzie s� wam niezmiernie wdzi�czni.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_04"); //Przy dow�dcy blokady znalaz�em to pismo...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_05"); //A to pod�e dranie. S� chytrzy I przebiegli. Nie spodziewa�em si�, �e do tego stopnia.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_06"); //To banda szale�c�w, kt�rzy s� gotowi na wszystko co najgorsze dla uratowania �ycia, wp�yw�w I rudy. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_07"); //C�, mo�na powiedzie� �e uratowa�e� mi �ycie.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_08"); //We� to w nagrod�. Zas�u�y�e� na niewsp�miernie wi�ksze splendory ale rozumiesz sytuacje w, kt�rej jeste�my.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_09"); //Dzi�ki i do zobaczenia.
	B_GiveInvItems (self,other, itminugget, 200);
	B_GiveInvItems (self,other, Schutzamulett_Waffen_Geschosse, 1);
	 B_LogEntry               (Blokada,"Wr�czy�em Cor Angarowi pismo, kt�re mia� dow�dca blokady. By� poruszony I zdenerwowany. Ale u�wiadomi� sobie, �e ocali�em ob�z I r�wnie� jego �ycie. By� bardzo wdzi�czny I nale�ycie wynagrodzi� mnie za okazan� pomoc wobec Bractwa I siebie samego.");
	Log_SetTopicStatus	(Blokada,	LOG_SUCCESS);
	B_GiveXP(650);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> FM_FreeForGrd
//========================================

INSTANCE DIA_CorAngar_FM_FreeForGrd (C_INFO)
{
   npc          = GUR_1202_CorAngar;
   nr           = 1;
   condition    = DIA_CorAngar_FM_FreeForGrd_Condition;
   information  = DIA_CorAngar_FM_FreeForGrd_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorAngar_FM_FreeForGrd_Condition()
{
 if (Npc_KnowsInfo(hero,Info_Gorn_FMWATCH))
 && (Npc_GetTrueGuild(hero) == GIL_TPL)
{
    return TRUE;
};
};

FUNC VOID DIA_CorAngar_FM_FreeForGrd_Info()
{
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_01"); //Hej! Zatrzymaj si�!
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_03"); //S�ysza�em o twoich dokonaniach w wolnej kopalni. Chcia�bym ci podzi�kowa� w imieniu ca�ego obozu bractwa.
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_04"); //Prosz� we� te bro�, niech ci s�u�y. 
	B_GiveInvItems (self,other, ItMw_2h_SleeperEye, 1);
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_05"); //Robi�em to, co trzeba by�o zrobi� Angarze.
	
    AI_StopProcessInfos	(self);
};


/*
//========================================
//-----------------> OPCJA KRADZIE�Y
//========================================

INSTANCE DIA_CorAngar_PICKPOCKET(C_INFO)
{
	npc          = GUR_1202_CorAngar;
	nr           = 900;
	condition    = DIA_CorAngar_PICKPOCKET_Condition;
	information  = DIA_CorAngar_PICKPOCKET_Info;
	permanent    = TRUE;
	description  = Pickpocket_120;
};

FUNC INT DIA_CorAngar_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};

FUNC VOID DIA_CorAngar_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_CorAngar_PICKPOCKET);
	Info_AddChoice		(DIA_CorAngar_PICKPOCKET, DIALOG_BACK 	,DIA_CorAngar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CorAngar_PICKPOCKET, DIALOG_PICKPOCKET 	,DIA_CorAngar_PICKPOCKET_DoIt);
};

FUNC VOID DIA_CorAngar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices	(DIA_CorAngar_PICKPOCKET);
};

FUNC VOID DIA_CorAngar_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_CorAngar_PICKPOCKET);
};
*/