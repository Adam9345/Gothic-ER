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
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zostaæ silnym wojownikiem, wiêc szukasz mistrza, który wska¿e ci drogê.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mogê ci pomóc.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Poœwiêcam mój czas tylko cz³onkom Wielkiego Krêgu Stra¿y Œwi¹tynnej.
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Angar mo¿e mnie nauczyæ walki dwurêcznym orê¿em lub poka¿e mi jak zwiêkszyæ si³ê i zrêcznoœæ, o ile bêdê cz³onkiem Bractwa. ");
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
	description = "Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz ods³u¿yæ swoje jako Nowicjusz, dopóki nie przekonamy siê, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy mo¿esz do mnie wróciæ, a ja udzielê ci lekcji.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Si³a i zrêcznoœæ to cechy wielkiego wojownika.
	
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
	description		= "Chcê zostaæ Œwi¹tynnym Stra¿nikiem!"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chcê zostaæ Œwi¹tynnym Stra¿nikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jesteœ jeszcze gotowy. Mo¿esz do nas do³¹czyæ, kiedy zdobêdziesz nieco wiêcej doœwiadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszed³ dzieñ, w którym dane ci bêdzie do nas do³¹czyæ.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamiêtaj, ¿e Œwi¹tynny Stra¿nik to coœ wiêcej ni¿ wojownik strzeg¹cy Obozu Bractwa. Jesteœmy wybranymi stra¿nikami wyznawców Œni¹cego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zarówno nasz¹ si³ê fizyczn¹ jak i duchow¹. Prawdziwym Stra¿nikiem Œwi¹tynnym mo¿e zostaæ tylko ten, którego cia³o i duch funkcjonuj¹ w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Cieszê siê, ¿e uda³o ci siê osi¹gn¹æ tak wiele w tak krótkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pamiêtaj: Duchowa koncentracja i zdrowe cia³o sprostaj¹ ka¿demu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //IdŸ teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;
		HeroJoinToPSI ();
		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Dziœ Cor Angar przyj¹³ mnie w poczet Stra¿y Œwi¹tynnej. Gor Na Toth ma mi wrêczyæ moj¹ now¹ zbrojê. Znajdê go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar pomo¿e mi rozwin¹æ moj¹ si³ê, zrêcznoœæ.");
	};

};



//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
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
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,"Wróæ",DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);
	

};

func void DIA_CorAngar_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);

};



func void DIA_CorAngar_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);

	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);


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
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co siê stanie teraz?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co siê stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja by³a bardzo mglista. Zamiast odpowiedzi da³a nam jeszcze wiêcej pytañ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega w¹tpliwoœci: widzia³em orka w jaskini. W pobli¿u znajduje siê opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmar³ych, dlatego nazywamy ten labirynt jaskiñ Cmentarzyskiem Orków.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor uda³ siê tam z oddzia³em Stra¿ników Œwi¹tynnych. Mo¿e znajd¹ coœ, co pozwoli nam wyjaœniæ znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przyda³by mi siê ktoœ, kto rozejrzy siê tam trochê i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie pójdziesz tam sam? W koñcu jesteœ przywódc¹ Stra¿y Œwi¹tynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Jaœnie Oœwieconego. Muszê zostaæ na miejscu, ¿eby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odda³eœ Obozowi nieocenione us³ugi. Tylko na tobie mogê polegaæ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Proszê, udaj siê na Cmentarzysko Orków i dostarcz mi informacji na temat odkryæ poczynionych przez Stra¿ników.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostanê w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast ruszê w drogê!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostanê w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak Ÿle ciê oceni³em. Ale potrzebujê twojej pomocy. Proszê, oto 100 bry³ek rudy. Wiêcej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast ruszê w drogê!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim pójdziesz, weŸ ten pierœcieñ. Niech ciê chroni w walce.
	
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
	description		= "Gdzie jest to Cmentarzysko Orków?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Gdzie jest to Cmentarzysko Orków?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko st¹d. Nowicjusz Talas wska¿e ci drogê. Znajdziesz go na œwi¹tynnym dziedziñcu. On bêdzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,	"Nowicjusz Talas wska¿e mi drogê do Cmentarzyska Orków. Czeka na mnie na œwi¹tynnym dziedziñcu.");
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
	description		= "By³em na Cmentarzysku Orków."; 
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
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //By³em na Cmentarzysku Orków. Tam NIC NIE MA. Ani Œni¹cego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Stra¿nikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zginêli.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zginêli? Ale dlaczego, co siê sta³o?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach a¿ roi³o siê od orków. Wybili Stra¿ Œwi¹tynn¹ do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszliœmy z tego ca³o, ale nagle Baal postrada³ zmys³y.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszcza³, ¿e Œni¹cy kaza³ mu mnie zabiæ i zamierza³ wykonaæ to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //NajwyraŸniej nie móg³ siê pogodziæ z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierzê, ¿eby b³ogos³awiony wp³yw Œni¹cego móg³ go popchn¹æ do tak brutalnego dzia³ania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie mo¿e... Nie mo¿e... NIEWA¯NE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najwa¿niejsze, ¿e zamiar Baala Lukora siê nie powiód³.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz nasz¹ jedyn¹ nadziej¹ jest Y'Berion.
	 

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
	description = "Co s³ychaæ u Jaœnie Oœwieconego?";
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
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co s³ychaæ u Jaœnie Oœwieconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi siê. I z godziny na godzinê jest co raz s³abszy. Wiem, jak mo¿na go zbudziæ, ale potrzebujê twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobiæ?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynieœ mi piêæ najmocniejszych zió³ uzdrawiaj¹cych jakie mo¿na znaleŸæ na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz siê!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion nadal nie odzyska³ przytomnoœci. Cor Angar nakaza³ mi znaleŸæ piêæ leczniczych zió³ o silnym dzia³aniu.");
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
	description = "Gdzie mogê znaleŸæ te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mogê znaleŸæ te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz siê zapuœciæ doœæ daleko, wiêc uwa¿aj na b³otne wê¿e!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie traæ ani chwili. IdŸ ju¿!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Potrzebne Angarowi zio³a rosn¹ daleko na bagnach, za Obozem Bractwa. Muszê mieæ oczy szeroko otwarte - tamta okolica roi siê od b³otnych wê¿y.");
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
	description = "Jak rozpoznam te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominaj¹ gwiazdê z oœmioma zielonymi i pomarañczowymi liœæmi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drogê.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Lecznicze zio³a przypominaj¹ gwiazdy. Maj¹ cztery zielone i cztery pomarañczowe liœcie.");
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
	description = "Nie znalaz³em jeszcze potrzebnej iloœci zió³.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalaz³em jeszcze potrzebnej iloœci zió³.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo¿e Fortuno, handlarz zio³ami, ma trochê w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz siê. Potrzebujê piêciu zió³. Y'Berionowi nie zosta³o ju¿ zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno, handlarz zielem, mo¿e mieæ takie zio³a na sk³adzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudzi³ siê na chwilê tu¿ przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedzia³ coœ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedzia³, ¿e Œni¹cy nie jest tym, za co go uwa¿amy. Pod ¿adnym pozorem nie wolno nam go zbudziæ.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mieæ nadziejê, ¿e dla biednego Y'Beriona nie jest jeszcze za póŸno.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Da³em Cor Angarowi odpowiednie zio³a. Miejmy tylko nadziejê, ¿e nie jest jeszcze za póŸno...");
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
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE ¯YJE. Nasz duchowy przywódca odszed³ w zaœwiaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja b³yskawiczna pomoc nie mog³a zapobiec jego œmierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz bêdzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufa³em Y'Berionowi. Tu¿ przed œmierci¹ kaza³ nam upatrywaæ nadziei ocalenia w planie ucieczki opracowanym przez Magów Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinniœmy wesprzeæ Magów Wody w ich d¹¿eniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda siê im kamieñ ogniskuj¹cy i almanach. Ale te s¹ wci¹¿ w rêkach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebra³ oddzia³ Stra¿ników Œwi¹tynnych i wyruszy³ na poszukiwanie Œni¹cego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamieñ ogniskuj¹cy?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdajê siê, ¿e kamieñ i ksiêga s¹ wci¹¿ w jego laboratorium. Masz tu klucz do skrzyni.

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
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze coœ!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //WeŸ tê magiczn¹ runê jako symbol naszej wdziêcznoœci za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportowaæ siê na œwi¹tynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dziêkujê!

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
   description	= "Wiesz dok¹d uda³ siê Cor Kalom?";
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
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_01"); //Wiesz dok¹d uda³ siê Cor Kalom?
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_02"); //Nie, wci¹¿ jest to dla mnie zagadk¹. 
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_03"); //Chcia³bym dowiedzieæ siê dok¹d poszed³.
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_04"); //Byæ mo¿e ktoœ go widzia³. Tak du¿a liczba œwi¹tynnych nie mog³a przejœæ przez koloniê niezauwa¿ona.
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_05"); //Ktoœ móg³ ich widzieæ. Powinieneœ porozmawiaæ z myœliwymi. Czêsto wêdruj¹ po Kolonii w poszukiwaniu zwierzyny. 
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_06"); //Podobno maj¹ swój obóz nad rzek¹.
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_07"); //Tak, znam to miejsce. Udam siê tam jak najszybciej. 

	MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciek³ z Bractwa wraz z grup¹ Nowicjuszy i Œwi¹tynnych. Muszê dowiedzieæ siê dok¹d poszli. Wskazówki mog¹ mi daæ myœliwi. Cor Angar uwa¿a, ¿e któryœ z nich móg³ ich widzieæ.");
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
   description	= "Kalom uda³ siê do miasta orków.";
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
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_01"); //Kalom, wraz z kilkoma Stra¿nikami Œwi¹tynnymi uda³ siê do Miasta Orków.
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_02"); //£owcy orków ostatni raz widzieli go przy bagnie na Ziemiach Orków.
	AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_03"); //Ciekawi mnie tylko jak Kalom przedosta³ siê przez grupy zielonoskórych.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_04"); //Widocznie musia³ mieæ ze sob¹ jakiœ atut, który go ochroni³.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_05"); //Prawdopodobnie nigdy siê tego nie dowiemy.
	//log
    B_LogEntry               (CH3_SearchKalom,"Powiedzia³em Cor Angarowi, ¿e ³owcy orków widzieli Kaloma, który prawdopodobnie uda³ siê na ziemie orków. Pozostaje nam mieæ nadziejê, ¿e szalony Guru nie zrobi nic g³upiego.");
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
   description	= "Mistrzu, kto zast¹pi Y'Beriona?";
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
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_01"); //Mistrzu, kto zast¹pi Y'Beriona?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_02"); //Œmieræ Wielkiego Mistrza stawia nasz¹ spo³ecznoœæ przed powa¿nym problemem. Na razie osobiœcie postaram siê mieæ wszystko pod kontrol¹.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_03"); //Jednak sam nie dam sobie rady. Zw³aszcza, ¿e Cor Kalom odszed³. Ktoœ musi go zast¹piæ. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_04"); //Ty... Sta³eœ siê silniejszy i bardziej doœwiadczony od kiedy tu przyby³eœ.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_05"); //Pomagasz nam w trudnoœciach, wiernie s³u¿ysz Bractwu, bez ciebie nie odby³o by siê przywo³anie...
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_06"); //Czy nie zechcia³byœ za³o¿yæ szatê Guru?
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_07"); //Có¿, nie wygl¹da na zbyt wygodn¹...
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_08"); //Próbujesz ukryæ siê pod p³aszczykiem arogancji. Mów, co ciê trapi.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_09"); //Mistrzu, chodzi o to, ¿e Œni¹cy jest demonem. Obaj dobrze o tym wiemy. Dlaczego mia³bym chcieæ zostaæ Guru, jego najwierniejszym s³ug¹?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_10"); //Rozumiem twoje obawy. To siê bardzo chwali, ¿e mi o tym powiedzia³eœ. Nie licz¹ siê dla ciebie tytu³y lecz duch!
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_11"); //Bractwo wymaga teraz wiele pracy, aby przetrwa³o. Wiara w Œni¹cego nie jest ju¿ tym, co nas spaja. £¹czy nas wspólna przesz³oœæ i nowe wyzwania. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_12"); //Ci ludzie potrzebuj¹ kogoœ, kto pomo¿e im siê po tym wszystkim otrz¹sn¹æ. Robisz to wiêc nie dla Œni¹cego, tylko dla jego by³ych wyznawców.
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_13"); //No dobrze. Za³o¿ê szatê Guru.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_14"); //Zaczekaj! Musisz mi wczeœniej udowodniæ, ¿e jesteœ gotów.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_15"); //CO?!
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_16"); //Baal Cadar jest w posiadaniu pewniej tajemniczej ksiêgi. Od kilku dni próbuje j¹ sprzedaæ. Czyta³em jej fragmenty. Nale¿a³a do jakiegoœ alchemika.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_17"); //Odkup j¹ od niego i przeczytaj. Wewn¹trz znajduje siê przepis na miksturê lecz¹c¹ umys³. Uwarz j¹, a uznam, ¿e jesteœ gotów.
    MIS_TestGuru = LOG_RUNNING;

    Log_CreateTopic          (CH3_TestGuru, LOG_MISSION);
    Log_SetTopicStatus       (CH3_TestGuru, LOG_RUNNING);
    B_LogEntry               (CH3_TestGuru,"Aby zostaæ Guru muszê przygotowaæ specjaln¹ miksturê. Przepis znajdê w ksiêdze, któr¹ chce sprzedaæ Baal Cadar.");
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
   description	= "Uwarzy³em miksturê oczyszczenia.";
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
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_01"); //Uwarzy³em miksturê oczyszczenia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_02"); //To napój o którym pisano w ksiêdze?
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_03"); //Tak, ta mikstura oczyszcza umys³ ka¿dego, kto j¹ wypije.
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_04"); //Przepis by³ bardzo skomplikowany i wymaga³ wielu sk³adników trudnych do zdobycia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_05"); //Udowodni³eœ, ¿e jesteœ godzien nosiæ szatê Guru. Witaj wœród nas. Mo¿esz rozgoœciæ siê w laboratorium Kaloma.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_06"); //WeŸ upragnion¹ szatê i ten kostur. Niechaj ci s³u¿¹. Bractwo na ciebie liczy.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_07"); //Shan bêdzie twoim asystentem i powie ci, czym nale¿y siê zaj¹æ.
    hero.guild = GIL_GUR;
    CreateInvItems (self, GUR_ARMOR_M, 1);
    B_GiveInvItems (self, other, GUR_ARMOR_M, 1);
	CreateInvItems (self, ItMw_2H_Staff_GuruMage_03, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_GuruMage_03, 1);
	AI_EquipBestArmor	(hero); 
    B_LogEntry                     (CH3_TestGuru,"Uda³o mi siê. Zosta³em Guru w Obozie Bractwa. Mam zastêpowaæ Cor Kaloma. Moim asystentem jest Shan, by³y pomocnik Y'Beriona. Od niego dowiem siê, co mam do zrobienia...");
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
   description	= "Kup zdobion¹ szatê Guru.(2460 bry³ek rudy)";
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
    AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_01"); //Chcê nosiæ zdobion¹ szatê.
    AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_02"); //Ten wyj¹tkowy pancerz nie jest tani. Masz wystarczaj¹co du¿o rudy?
    if (Npc_HasItems (hero, ItMiNugget)>=2460)
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_03"); //Oczywiœcie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_04"); //Oto twoja szata.
        CreateInvItems (self, GUR_ARMOR_H, 1);
        B_GiveInvItems (self, other, GUR_ARMOR_H, 1);
        B_GiveInvItems (other, self, ItMiNugget, 2460);
    }
    else
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_05"); //Niestety nie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_06"); //Wróæ, gdy uzbierasz odpowiedni¹ iloœæ rudy.
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
   description	= "Pomog³em pozbyæ siê ludzi Gomeza z Kopalni.";
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
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_01"); //Pomog³em pozbyæ siê ludzi Gomeza z Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_02"); //To œwietnie. Pos³aniec dotar³? 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_03"); //Tak, ale nie widzia³em siê z nim. Informacjê przekaza³ mi Najemnik, który poleci³ mi rozmowê z Laresem.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_04"); //Lares to twardy i odpowiedzialny cz³owiek. Dobrze zna Bandytów i stosunki miêdzy obozami.
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_05"); //Kopalnia by³a pe³na o¿ywieñców a czêœæ korytarzy zala³a podziemna rzeka. 
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_06"); //Wiele siê mówi³o o tej kopalni. Widocznie czêœæ z nich by³a prawd¹...
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
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_01"); //Musimy pomówiæ przyjacielu.
    AI_Output (other, self ,"DIA_CorAngar_Blokada_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_03"); //Odk¹d zawali³a siê Stara Kopalnia Gomez wpad³ w sza³. Potrzebuje zysków i gor¹czkowo szuka sposobów ich pozyskania. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_04"); //Teraz postanowi³ wys³aæ liczny oddzia³ Stra¿ników, który bêdzie mia³ za zadanie blokadê Bractwa. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_05"); //Ten szaleniec zamierza wymusiæ od Sekty olbrzymi¹ kontrybucjê w sk³ad, której bêd¹ wchodziæ olbrzymia iloœæ rudy i ziela.
	Log_CreateTopic		(Blokada,	LOG_MISSION);
	Log_SetTopicStatus	(Blokada,	LOG_RUNNING);
	B_LogEntry          (Blokada,"Cor Angar poinformowa³ mnie o blokadzie Bractwa przez si³y Gomeza. Ten zarozumia³y tyran doprowadzony do ostatecznoœci przez zawalenie Starej Kopalni zamierza wymusiæ na obozie , którego jestem cz³onkiem olbrzymi¹ kontrybucjê. Cor Angar poleci³ mi pomówiæ z Gor Na Tothem o rozbiciu si³ Gomeza przez naszych ludzi,");
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
   description	= "Co takiego?! Sk¹d o tym wiesz?";
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
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_01"); //Co takiego?! Sk¹d o tym wiesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_02"); //Przys³a³ emisariusza, którego odprawiliœmy. Teraz jego ludzie przyst¹pili do blokady naszego obozu.
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_03"); //Atakuj¹ wszysztkich, którzy próbuj¹ z niego wyjœæ lub do niego wejœæ. 
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_04"); //Trzeba siê trochê zabawiæ. Co proponujesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_05"); //Porozmawiaj z Gor Na Tothem. Niech da ci ludzi i rozbijcie w py³ t¹ przeklêt¹ bandê wariatów!
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_06"); //W porz¹dku.
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
   description	= "Dziêki uczniom Gor Na Totha uda³o siê pokonaæ blokadê Stra¿ników Gomeza.";
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
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_01"); //Dziêki uczniom Gor Na Draka uda³o siê pokonaæ blokadê Stra¿ników Gomeza.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_02"); //Wspaniale. Okazaliœcie wielk¹ odwagê I hart ducha. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_03"); //Wszyscy nasi ludzie s¹ wam niezmiernie wdziêczni.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_04"); //Przy dowódcy blokady znalaz³em to pismo...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_05"); //A to pod³e dranie. S¹ chytrzy I przebiegli. Nie spodziewa³em siê, ¿e do tego stopnia.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_06"); //To banda szaleñców, którzy s¹ gotowi na wszystko co najgorsze dla uratowania ¿ycia, wp³ywów I rudy. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_07"); //Có¿, mo¿na powiedzieæ ¿e uratowa³eœ mi ¿ycie.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_08"); //WeŸ to w nagrodê. Zas³u¿y³eœ na niewspó³miernie wiêksze splendory ale rozumiesz sytuacje w, której jesteœmy.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_09"); //Dziêki i do zobaczenia.
	B_GiveInvItems (self,other, itminugget, 200);
	B_GiveInvItems (self,other, Schutzamulett_Waffen_Geschosse, 1);
	 B_LogEntry               (Blokada,"Wrêczy³em Cor Angarowi pismo, które mia³ dowódca blokady. By³ poruszony I zdenerwowany. Ale uœwiadomi³ sobie, ¿e ocali³em obóz I równie¿ jego ¿ycie. By³ bardzo wdziêczny I nale¿ycie wynagrodzi³ mnie za okazan¹ pomoc wobec Bractwa I siebie samego.");
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
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_01"); //Hej! Zatrzymaj siê!
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_03"); //S³ysza³em o twoich dokonaniach w wolnej kopalni. Chcia³bym ci podziêkowaæ w imieniu ca³ego obozu bractwa.
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_04"); //Proszê weŸ te broñ, niech ci s³u¿y. 
	B_GiveInvItems (self,other, ItMw_2h_SleeperEye, 1);
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_05"); //Robi³em to, co trzeba by³o zrobiæ Angarze.
	
    AI_StopProcessInfos	(self);
};


/*
//========================================
//-----------------> OPCJA KRADZIE¯Y
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