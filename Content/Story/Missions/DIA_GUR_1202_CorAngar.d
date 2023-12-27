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
	description = "Możesz mnie czegoś nauczyć?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zostać silnym wojownikiem, więc szukasz mistrza, który wskaże ci drogę.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mogę ci pomóc.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Poświęcam mój czas tylko członkom Wielkiego Kręgu Straży Świątynnej.
	Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry			(GE_TeacherPSI,"Cor Angar może mnie nauczyć walki dwuręcznym orężem lub pokaże mi jak zwiększyć siłę i zręczność, o ile będę członkiem Bractwa. ");
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
	description = "Co mam zrobić, żeby zostać Świątynnym Strażnikiem?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobić, żeby zostać Świątynnym Strażnikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz odsłużyć swoje jako Nowicjusz, dopóki nie przekonamy się, że jesteś oddanym sługą Śniącego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy możesz do mnie wrócić, a ja udzielę ci lekcji.
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
	description = "Pokażesz mi, jak poprawić moją siłę i zręczność?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Pokażesz mi, jak poprawić moją siłę i zręczność?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Siła i zręczność to cechy wielkiego wojownika.
	
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
	description		= "Chcę zostać Świątynnym Strażnikiem!"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chcę zostać Świątynnym Strażnikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jesteś jeszcze gotowy. Możesz do nas dołączyć, kiedy zdobędziesz nieco więcej doświadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszedł dzień, w którym dane ci będzie do nas dołączyć.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamiętaj, że Świątynny Strażnik to coś więcej niż wojownik strzegący Obozu Bractwa. Jesteśmy wybranymi strażnikami wyznawców Śniącego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zarówno naszą siłę fizyczną jak i duchową. Prawdziwym Strażnikiem Świątynnym może zostać tylko ten, którego ciało i duch funkcjonują w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Cieszę się, że udało ci się osiągnąć tak wiele w tak krótkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pamiętaj: Duchowa koncentracja i zdrowe ciało sprostają każdemu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Idź teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;
		HeroJoinToPSI ();
		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Dziś Cor Angar przyjął mnie w poczet Straży Świątynnej. Gor Na Toth ma mi wręczyć moją nową zbroję. Znajdę go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar pomoże mi rozwinąć moją siłę, zręczność.");
	};

};



//---------------------------------------------------------------
// NAUKA WALKI ORĘŻEM 2H
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
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,"Wróć",DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);
	

};

func void DIA_CorAngar_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);
	
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);

};



func void DIA_CorAngar_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(GUR_1202_CorAngar_TEACH_2H_START);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,Dialog_Back,DIA_CorAngar_START_TRAIN_BACK);

	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_CorAngar_START_TRAIN_2H_1);
	Info_AddChoice(GUR_1202_CorAngar_TEACH_2H_START,B_BuildLearnString("Broń dwuręczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_CorAngar_START_TRAIN_2H_5);


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
	description		= "Co się stanie teraz?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co się stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja była bardzo mglista. Zamiast odpowiedzi dała nam jeszcze więcej pytań.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega wątpliwości: widziałem orka w jaskini. W pobliżu znajduje się opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmarłych, dlatego nazywamy ten labirynt jaskiń Cmentarzyskiem Orków.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor udał się tam z oddziałem Strażników Świątynnych. Może znajdą coś, co pozwoli nam wyjaśnić znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przydałby mi się ktoś, kto rozejrzy się tam trochę i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie pójdziesz tam sam? W końcu jesteś przywódcą Straży Świątynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Jaśnie Oświeconego. Muszę zostać na miejscu, żeby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Oddałeś Obozowi nieocenione usługi. Tylko na tobie mogę polegać.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Proszę, udaj się na Cmentarzysko Orków i dostarcz mi informacji na temat odkryć poczynionych przez Strażników.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostanę w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast ruszę w drogę!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostanę w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak źle cię oceniłem. Ale potrzebuję twojej pomocy. Proszę, oto 100 bryłek rudy. Więcej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast ruszę w drogę!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim pójdziesz, weź ten pierścień. Niech cię chroni w walce.
	
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
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko stąd. Nowicjusz Talas wskaże ci drogę. Znajdziesz go na świątynnym dziedzińcu. On będzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,	"Nowicjusz Talas wskaże mi drogę do Cmentarzyska Orków. Czeka na mnie na świątynnym dziedzińcu.");
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
	description		= "Byłem na Cmentarzysku Orków."; 
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
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Byłem na Cmentarzysku Orków. Tam NIC NIE MA. Ani Śniącego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Strażnikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zginęli.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zginęli? Ale dlaczego, co się stało?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach aż roiło się od orków. Wybili Straż Świątynną do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszliśmy z tego cało, ale nagle Baal postradał zmysły.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszczał, że Śniący kazał mu mnie zabić i zamierzał wykonać to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Najwyraźniej nie mógł się pogodzić z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierzę, żeby błogosławiony wpływ Śniącego mógł go popchnąć do tak brutalnego działania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie może... Nie może... NIEWAŻNE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najważniejsze, że zamiar Baala Lukora się nie powiódł.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz naszą jedyną nadzieją jest Y'Berion.
	 

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
	description = "Co słychać u Jaśnie Oświeconego?";
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
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co słychać u Jaśnie Oświeconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi się. I z godziny na godzinę jest co raz słabszy. Wiem, jak można go zbudzić, ale potrzebuję twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobić?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynieś mi pięć najmocniejszych ziół uzdrawiających jakie można znaleźć na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz się!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion nadal nie odzyskał przytomności. Cor Angar nakazał mi znaleźć pięć leczniczych ziół o silnym działaniu.");
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
	description = "Gdzie mogę znaleźć te zioła?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mogę znaleźć te zioła?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz się zapuścić dość daleko, więc uważaj na błotne węże!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie trać ani chwili. Idź już!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Potrzebne Angarowi zioła rosną daleko na bagnach, za Obozem Bractwa. Muszę mieć oczy szeroko otwarte - tamta okolica roi się od błotnych węży.");
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
	description = "Jak rozpoznam te zioła?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zioła?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominają gwiazdę z ośmioma zielonymi i pomarańczowymi liśćmi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drogę.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Lecznicze zioła przypominają gwiazdy. Mają cztery zielone i cztery pomarańczowe liście.");
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
	description = "Nie znalazłem jeszcze potrzebnej ilości ziół.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalazłem jeszcze potrzebnej ilości ziół.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Może Fortuno, handlarz ziołami, ma trochę w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz się. Potrzebuję pięciu ziół. Y'Berionowi nie zostało już zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno, handlarz zielem, może mieć takie zioła na składzie.");
	};
};
var int AngarTellHeroForCalom;
// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam już wszystkie uzdrawiające zioła dla Y'Beriona.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam już wszystkie uzdrawiające zioła dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudził się na chwilę tuż przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedział coś?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedział, że Śniący nie jest tym, za co go uważamy. Pod żadnym pozorem nie wolno nam go zbudzić.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mieć nadzieję, że dla biednego Y'Beriona nie jest jeszcze za późno.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Dałem Cor Angarowi odpowiednie zioła. Miejmy tylko nadzieję, że nie jest jeszcze za późno...");
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
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE ŻYJE. Nasz duchowy przywódca odszedł w zaświaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja błyskawiczna pomoc nie mogła zapobiec jego śmierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz będzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufałem Y'Berionowi. Tuż przed śmiercią kazał nam upatrywać nadziei ocalenia w planie ucieczki opracowanym przez Magów Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinniśmy wesprzeć Magów Wody w ich dążeniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda się im kamień ogniskujący i almanach. Ale te są wciąż w rękach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebrał oddział Strażników Świątynnych i wyruszył na poszukiwanie Śniącego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamień ogniskujący?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdaję się, że kamień i księga są wciąż w jego laboratorium. Masz tu klucz do skrzyni.
    AngarTellHeroForCalom = TRUE;
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
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze coś!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Weź tę magiczną runę jako symbol naszej wdzięczności za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportować się na świątynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dziękuję!

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
   description	= "Wiesz dokąd udał się Cor Kalom?";
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
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_01"); //Wiesz dokąd udał się Cor Kalom?
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_02"); //Nie, wciąż jest to dla mnie zagadką. 
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_03"); //Chciałbym dowiedzieć się dokąd poszedł.
    AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_04"); //Być może ktoś go widział. Tak duża liczba świątynnych nie mogła przejść przez kolonię niezauważona.
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_05"); //Ktoś mógł ich widzieć. Powinieneś porozmawiać z myśliwymi. Często wędrują po Kolonii w poszukiwaniu zwierzyny. 
	AI_Output (self, other ,"DIA_CorAngar_WhereIsKalom_03_06"); //Podobno mają swój obóz nad rzeką.
    AI_Output (other, self ,"DIA_CorAngar_WhereIsKalom_15_07"); //Tak, znam to miejsce. Udam się tam jak najszybciej. 

	MIS_SearchKalom = LOG_RUNNING;

    Log_CreateTopic         (CH3_SearchKalom, LOG_MISSION);
    Log_SetTopicStatus      (CH3_SearchKalom, LOG_RUNNING);
    B_LogEntry              (CH3_SearchKalom,"Cor Kalom uciekł z Bractwa wraz z grupą Nowicjuszy i Świątynnych. Muszę dowiedzieć się dokąd poszli. Wskazówki mogą mi dać myśliwi. Cor Angar uważa, że któryś z nich mógł ich widzieć.");
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
   description	= "Kalom udał się do miasta orków.";
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
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_01"); //Kalom, wraz z kilkoma Strażnikami Świątynnymi udał się do Miasta Orków.
    AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_02"); //Łowcy orków ostatni raz widzieli go przy bagnie na Ziemiach Orków.
	AI_Output (other, self ,"DIA_CorAngar_KalomOrcCity_15_03"); //Ciekawi mnie tylko jak Kalom przedostał się przez grupy zielonoskórych.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_04"); //Widocznie musiał mieć ze sobą jakiś atut, który go ochronił.
    AI_Output (self, other ,"DIA_CorAngar_KalomOrcCity_03_05"); //Prawdopodobnie nigdy się tego nie dowiemy.
	//log
    B_LogEntry               (CH3_SearchKalom,"Powiedziałem Cor Angarowi, że łowcy orków widzieli Kaloma, który prawdopodobnie udał się na ziemie orków. Pozostaje nam mieć nadzieję, że szalony Guru nie zrobi nic głupiego.");
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
   description	= "Mistrzu, kto zastąpi Y'Beriona?";
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
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_01"); //Mistrzu, kto zastąpi Y'Beriona?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_02"); //Śmierć Wielkiego Mistrza stawia naszą społeczność przed poważnym problemem. Na razie osobiście postaram się mieć wszystko pod kontrolą.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_03"); //Jednak sam nie dam sobie rady. Zwłaszcza, że Cor Kalom odszedł. Ktoś musi go zastąpić. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_04"); //Ty... Stałeś się silniejszy i bardziej doświadczony od kiedy tu przybyłeś.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_05"); //Pomagasz nam w trudnościach, wiernie służysz Bractwu, bez ciebie nie odbyło by się przywołanie...
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_06"); //Czy nie zechciałbyś założyć szatę Guru?
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_07"); //Cóż, nie wygląda na zbyt wygodną...
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_08"); //Próbujesz ukryć się pod płaszczykiem arogancji. Mów, co cię trapi.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_09"); //Mistrzu, chodzi o to, że Śniący jest demonem. Obaj dobrze o tym wiemy. Dlaczego miałbym chcieć zostać Guru, jego najwierniejszym sługą?
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_10"); //Rozumiem twoje obawy. To się bardzo chwali, że mi o tym powiedziałeś. Nie liczą się dla ciebie tytuły lecz duch!
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_11"); //Bractwo wymaga teraz wiele pracy, aby przetrwało. Wiara w Śniącego nie jest już tym, co nas spaja. Łączy nas wspólna przeszłość i nowe wyzwania. 
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_12"); //Ci ludzie potrzebują kogoś, kto pomoże im się po tym wszystkim otrząsnąć. Robisz to więc nie dla Śniącego, tylko dla jego byłych wyznawców.
    AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_13"); //No dobrze. Założę szatę Guru.
    AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_14"); //Zaczekaj! Musisz mi wcześniej udowodnić, że jesteś gotów.
	AI_Output (other, self ,"DIA_CorAngar_GuruMomPlese_15_15"); //CO?!
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_16"); //Baal Cadar jest w posiadaniu pewniej tajemniczej księgi. Od kilku dni próbuje ją sprzedać. Czytałem jej fragmenty. Należała do jakiegoś alchemika.
	AI_Output (self, other ,"DIA_CorAngar_GuruMomPlese_03_17"); //Odkup ją od niego i przeczytaj. Wewnątrz znajduje się przepis na miksturę leczącą umysł. Uwarz ją, a uznam, że jesteś gotów.
    MIS_TestGuru = LOG_RUNNING;

    Log_CreateTopic          (CH3_TestGuru, LOG_MISSION);
    Log_SetTopicStatus       (CH3_TestGuru, LOG_RUNNING);
    B_LogEntry               (CH3_TestGuru,"Aby zostać Guru muszę przygotować specjalną miksturę. Przepis znajdę w księdze, którą chce sprzedać Baal Cadar.");
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
   description	= "Uwarzyłem miksturę oczyszczenia.";
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
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_01"); //Uwarzyłem miksturę oczyszczenia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_02"); //To napój o którym pisano w księdze?
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_03"); //Tak, ta mikstura oczyszcza umysł każdego, kto ją wypije.
    AI_Output (other, self ,"DIA_CorAngar_Mixtura156_15_04"); //Przepis był bardzo skomplikowany i wymagał wielu składników trudnych do zdobycia.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_05"); //Udowodniłeś, że jesteś godzien nosić szatę Guru. Witaj wśród nas. Możesz rozgościć się w laboratorium Kaloma.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_06"); //Weź upragnioną szatę i ten kostur. Niechaj ci służą. Bractwo na ciebie liczy.
    AI_Output (self, other ,"DIA_CorAngar_Mixtura156_03_07"); //Shan będzie twoim asystentem i powie ci, czym należy się zająć.
    hero.guild = GIL_GUR;
    CreateInvItems (self, GUR_ARMOR_M, 1);
    B_GiveInvItems (self, other, GUR_ARMOR_M, 1);
	CreateInvItems (self, ItMw_2H_Staff_GuruMage_03, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_GuruMage_03, 1);
	AI_EquipBestArmor	(hero); 
    B_LogEntry                     (CH3_TestGuru,"Udało mi się. Zostałem Guru w Obozie Bractwa. Mam zastępować Cor Kaloma. Moim asystentem jest Shan, były pomocnik Y'Beriona. Od niego dowiem się, co mam do zrobienia...");
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
   description	= "Kup zdobioną szatę Guru.(2460 bryłek rudy)";
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
    AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_01"); //Chcę nosić zdobioną szatę.
    AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_02"); //Ten wyjątkowy pancerz nie jest tani. Masz wystarczająco dużo rudy?
    if (Npc_HasItems (hero, ItMiNugget)>=2460)
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_03"); //Oczywiście.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_04"); //Oto twoja szata.
        CreateInvItems (self, GUR_ARMOR_H, 1);
        B_GiveInvItems (self, other, GUR_ARMOR_H, 1);
        B_GiveInvItems (other, self, ItMiNugget, 2460);
    }
    else
    {
        AI_Output (other, self ,"DIA_CorAngar_BuyArmorH_15_05"); //Niestety nie.
        AI_Output (self, other ,"DIA_CorAngar_BuyArmorH_03_06"); //Wróć, gdy uzbierasz odpowiednią ilość rudy.
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
   description	= "Pomogłem pozbyć się ludzi Gomeza z Kopalni.";
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
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_01"); //Pomogłem pozbyć się ludzi Gomeza z Kopalni.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_02"); //To świetnie. Posłaniec dotarł? 
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_03"); //Tak, ale nie widziałem się z nim. Informację przekazał mi Najemnik, który polecił mi rozmowę z Laresem.
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_04"); //Lares to twardy i odpowiedzialny człowiek. Dobrze zna Bandytów i stosunki między obozami.
    AI_Output (other, self ,"DIA_CorAngar_KopalniaClear_15_05"); //Kopalnia była pełna ożywieńców a część korytarzy zalała podziemna rzeka. 
    AI_Output (self, other ,"DIA_CorAngar_KopalniaClear_03_06"); //Wiele się mówiło o tej kopalni. Widocznie część z nich była prawdą...
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
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_01"); //Musimy pomówić przyjacielu.
    AI_Output (other, self ,"DIA_CorAngar_Blokada_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_03"); //Odkąd zawaliła się Stara Kopalnia Gomez wpadł w szał. Potrzebuje zysków i gorączkowo szuka sposobów ich pozyskania. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_04"); //Teraz postanowił wysłać liczny oddział Strażników, który będzie miał za zadanie blokadę Bractwa. 
    AI_Output (self, other ,"DIA_CorAngar_Blokada_03_05"); //Ten szaleniec zamierza wymusić od Sekty olbrzymią kontrybucję w skład, której będą wchodzić olbrzymia ilość rudy i ziela.
	Log_CreateTopic		(Blokada,	LOG_MISSION);
	Log_SetTopicStatus	(Blokada,	LOG_RUNNING);
	B_LogEntry          (Blokada,"Cor Angar poinformował mnie o blokadzie Bractwa przez siły Gomeza. Ten zarozumiały tyran doprowadzony do ostateczności przez zawalenie Starej Kopalni zamierza wymusić na obozie , którego jestem członkiem olbrzymią kontrybucję. Cor Angar polecił mi pomówić z Gor Na Tothem o rozbiciu sił Gomeza przez naszych ludzi,");
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
   description	= "Co takiego?! Skąd o tym wiesz?";
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
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_01"); //Co takiego?! Skąd o tym wiesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_02"); //Przysłał emisariusza, którego odprawiliśmy. Teraz jego ludzie przystąpili do blokady naszego obozu.
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_03"); //Atakują wszysztkich, którzy próbują z niego wyjść lub do niego wejść. 
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_04"); //Trzeba się trochę zabawić. Co proponujesz?
    AI_Output (self, other ,"DIA_CorAngar_Blokada_02_03_05"); //Porozmawiaj z Gor Na Tothem. Niech da ci ludzi i rozbijcie w pył tą przeklętą bandę wariatów!
    AI_Output (other, self ,"DIA_CorAngar_Blokada_02_15_06"); //W porządku.
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
   description	= "Dzięki uczniom Gor Na Totha udało się pokonać blokadę Strażników Gomeza.";
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
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_01"); //Dzięki uczniom Gor Na Draka udało się pokonać blokadę Strażników Gomeza.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_02"); //Wspaniale. Okazaliście wielką odwagę I hart ducha. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_03"); //Wszyscy nasi ludzie są wam niezmiernie wdzięczni.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_04"); //Przy dowódcy blokady znalazłem to pismo...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_05"); //A to podłe dranie. Są chytrzy I przebiegli. Nie spodziewałem się, że do tego stopnia.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_06"); //To banda szaleńców, którzy są gotowi na wszystko co najgorsze dla uratowania życia, wpływów I rudy. 
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_07"); //Cóż, można powiedzieć że uratowałeś mi życie.
    AI_Output (self, other ,"DIA_CorAngar_BlokadaEnd_03_08"); //Weź to w nagrodę. Zasłużyłeś na niewspółmiernie większe splendory ale rozumiesz sytuacje w, której jesteśmy.
    AI_Output (other, self ,"DIA_CorAngar_BlokadaEnd_15_09"); //Dzięki i do zobaczenia.
	B_GiveInvItems (self,other, itminugget, 200);
	B_GiveInvItems (self,other, Schutzamulett_Waffen_Geschosse, 1);
	 B_LogEntry               (Blokada,"Wręczyłem Cor Angarowi pismo, które miał dowódca blokady. Był poruszony I zdenerwowany. Ale uświadomił sobie, że ocaliłem obóz I również jego życie. Był bardzo wdzięczny I należycie wynagrodził mnie za okazaną pomoc wobec Bractwa I siebie samego.");
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
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_01"); //Hej! Zatrzymaj się!
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_03"); //Słyszałem o twoich dokonaniach w wolnej kopalni. Chciałbym ci podziękować w imieniu całego obozu bractwa.
    AI_Output (self, other ,"DIA_CorAngar_FM_FreeForGrd_03_04"); //Proszę weź te broń, niech ci służy. 
	B_GiveInvItems (self,other, ItMw_2h_SleeperEye, 1);
    AI_Output (other, self ,"DIA_CorAngar_FM_FreeForGrd_15_05"); //Robiłem to, co trzeba było zrobić Angarze.
	
    AI_StopProcessInfos	(self);
};


/*
//========================================
//-----------------> OPCJA KRADZIEŻY
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
