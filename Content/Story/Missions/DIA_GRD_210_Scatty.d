//poprawione i sprawdzone - Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Organizujê walki na arenie. Przyjmujê zak³ady, pozyskujê nowych wojowników... No wiesz.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4) 
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chcê do³¹czyæ do waszego Obozu. Mo¿esz mi pomóc?
	
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Pomogê ci, jeœli zrobisz na mnie odpowiednio dobre wra¿enie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Najlepsi wojownicy z wszystkich obozów przybywaj¹ tutaj, by stan¹æ w szranki na mojej arenie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Wyzwij któregoœ z nich na pojedynek. Zobaczê, co potrafisz, i jeœli mi siê spodoba, mo¿e szepnê s³ówko w twoim imieniu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC, "Scatty, organizator walk na arenie, chcia³by zobaczyæ, jak sobie poradzê w starciu z którymœ z jego wojowników.");
	//};
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Walczy³em z Kirgo!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) ) && (Kapitel < 4) //&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Walczy³em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Tak, ale przegra³eœ!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Chyba nie myœlisz, ¿e bêdê pod wra¿eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC, "Pora¿ka w walce z Kirgo nie zjedna³a mi bynajmniej sympatii Scatty'ego.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKirgo = true;
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //I pokona³eœ go! Ca³kiem nieŸle jak na takiego ¿ó³todzioba! Jestem pod wra¿eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Scatty by³ pod wra¿eniem mojej walki z Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Wyzwa³em Kharima na pojedynek!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) ) && (Kapitel < 4) //&& ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Wyzwa³em Kharima na pojedynek!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //I spuœci³ ci niez³e baty!
		PokonanyPrzezKharim = true;
		if (Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ale muszê przyznaæ, ¿e wybra³eœ sobie dobrego przeciwnika. Nie znoszê tych sukinsynów z Nowego Obozu.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Widzê, ¿e myœlimy podobnie. Przyda siê nam ktoœ taki jak ty!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC, "Zosta³em pokonany przez Kharima! Scatty podziwia moj¹ odwagê, ale uwa¿a, ¿e wojownik ze mnie ¿aden.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		PokonanyKharim = true; 
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //I pokona³eœ go! Muszê przyznaæ, ¿e œwietnie sobie poradzi³eœ. Kharim od dawna uchodzi³ za jednego z najlepszych wojowników w Kolonii.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Jestem pod wra¿eniem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		KHARIM.aivar[AIV_WASDEFEATEDBYSC] == false;
		B_LogEntry( CH1_JoinOC, "Pokaza³em Kharimowi, gdzie raki zimuj¹. Scatty by³ pod wra¿eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Dlaczego pozwalacie obcym walczyæ na waszej arenie?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myœla³em, ¿e Stary i Nowy Obóz nie dogaduj¹ siê najlepiej. Dlaczego pozwalacie obcym walczyæ na waszej arenie?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi¹ patrzeæ, jak Szkodniki z Nowego Obozu dostaj¹ po g³owie.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Gdy walczy któryœ z nich przyjmujê wiêcej zak³adów, a to dobrze wp³ywa na interes!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Osobiœcie nienawidzê tych wieprzy z Nowego Obozu, ale w tych trudnych czasach ¿aden pieni¹dz nie œmierdzi...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Chcia³bym obstawiæ walkê.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chcia³bym obstawiæ walkê.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Przecie¿ teraz nikt nie walczy!
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Najbli¿sza walka odbêdzie siê dopiero za kilka dni. Bêdzie og³oszenie!
	
};
var int walczyl_Kirgo;
var int walczyl_Hanis;
var int walczyl_Kharim;
////********************************************************
//*
/*
DIALOGI NA ARENIE PRZENIESIONE Z POWODU TEGO ¯E PARSER ODRZUCA£ WCZESNIEJ
START

*/
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ((Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 3)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dobra, zaczynajmy! Niech wygra najlepszy!
		Info_Kirgo_InArena.permanent = 0;
		AI_StopProcessInfos	( self );
		self.npctype = npctype_FRIEND;
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		walczyl_Kirgo = true;
		
		//Kirgo_Charged = false;
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 3)// || (hero_moze_walczyc	== true)	// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Ból to tylko kwestia si³y woli!
		
		AI_StopProcessInfos	( self );
		walczyl_Kharim = true;
		Npc_ExchangeRoutine(self,"START");
		Info_Kharim_InArena.permanent = 0;
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		//Kharim_Charged = false;
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Mo¿e zapomnimy o naszej ma³ej sprzeczce...
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
// **************************************
//				IN DER ARENA
// **************************************

instance Info_Hanis_InArena (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_Hanis_InArena_Condition;
	information		= Info_Hanis_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Hanis_InArena_Condition()
{
	if ( (CHARGE_Hanis == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Hanis_InArena_Info()
{
	if (Kapitel <= 3)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Hanis_InArena_05_00"); //Dobra, zaczynajmy! Za Œni¹cego!
		
		AI_StopProcessInfos	( self );
			walczyl_Hanis = true;
		Npc_ExchangeRoutine(self,"START");
		//CHARGE_Hanis = false;
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
		Info_Hanis_InArena.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
};



// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 0;
	description = "Zajmujesz siê równie¿ szkoleniem wojowników?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC, "Scatty mo¿e mnie nauczyæ walki jednorêcznym orê¿em, o ile zostanê cz³onkiem Starego Obozu.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Zajmujesz siê równie¿ szkoleniem wojowników?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Tak, ale nie za darmo. Jak chcesz, ¿ebym ciê czegoœ nauczy³, musisz zap³aciæ.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_02"); //Aha, szkolê tylko CZ£ONKÓW STAREGO OBOZU.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_03"); //Dlaczego tylko ich? Mogê ci zap³aciæ.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_04"); //Wielu ludzi siê u mnie szkoli³o. Pokrêcili siê tu trochê po czym zwiewali do Nowego Obozu i napadali na nasze konwoje.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_05"); //Wykorzystali wiedze, któr¹ ode mnie otrzymali przeciwko naszym ludziom. Dlatego te¿ Thorus na³o¿y³ ograniczenia wobec osób dorabiaj¹cych sobie nauczaniem.
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_06"); //Mo¿e w innym obozie znajdê nauczyciela.
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_07"); //Oj, nie znajdziesz. Nauka walki broni¹ jest kluczowa, a wyszkoleni i lojalni ludzie s¹ cenni. Nauczyciele z innych obozów wiedz¹ o tym tak samo dobrze jak ja czy Thorus.

};



// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Scatty_START_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_START_TRAIN_Condition;
	information	= DIA_Scatty_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Scatty_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_TRAIN)) && ((Npc_GetTrueGuild(hero) == GIL_VLK) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Scatty_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Scatty_START_TRAIN_01_01"); //Do roboty!
	
	
    Info_ClearChoices(DIA_Scatty_START_TRAIN);
	Info_AddChoice(DIA_Scatty_START_TRAIN,"Wróæ",DIA_Scatty_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Scatty_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Scatty_START_TRAIN_1H_5);
	
	
};

func void DIA_Scatty_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,T_MED);
	Info_ClearChoices(DIA_Scatty_START_TRAIN);
	Info_AddChoice(DIA_Scatty_START_TRAIN,Dialog_Back,DIA_Scatty_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Scatty_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Scatty_START_TRAIN_1H_5);

};



func void DIA_Scatty_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,T_MED);
	Info_ClearChoices(DIA_Scatty_START_TRAIN);
	Info_AddChoice(DIA_Scatty_START_TRAIN,Dialog_Back,DIA_Scatty_START_TRAIN_BACK);

	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Scatty_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Scatty_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Scatty_START_TRAIN_1H_5);


};

func void DIA_Scatty_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_START_TRAIN);
};

//========================================
//-----------------> DowodyNaOszustwa
//========================================

INSTANCE DIA_Scatty_DowodyNaOszustwa (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_DowodyNaOszustwa_Condition;
   information  = DIA_Scatty_DowodyNaOszustwa_Info;
   permanent	= FALSE;
   description	= "Oszukujesz Gomeza! Mam na to dowody.";
};

FUNC INT DIA_Scatty_DowodyNaOszustwa_Condition()
{
    if (HeroKnowsScattyThief == true)
    && (Npc_HasItems (other, ZapiskiScattego) >=1) && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_DowodyNaOszustwa_Info()
{
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_01"); //Oszukujesz Gomeza! Mam na to dowody.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_02"); //Co? Jak œmiesz mnie oskar¿aæ?!
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_03"); //Mam tutaj twoje fa³szywe raporty. O twoich oszustwach Kopacze wiedz¹ ju¿ od dawna.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_04"); //I co teraz zrobisz? Doniesiesz na mnie Thorusowi?
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_05"); //Byæ mo¿e... Czekam na twoje propozycje. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_06"); //Có¿... Jedyne, co mogê ci za³atwiæ, to wstêp do siedziby Gomeza. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_07"); //Jeœli nie doniesiesz na mnie Gomezowi, zostaniesz wpuszczony do siedziby Magnatów.
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_08"); //A co ze stra¿nikami bramy i Thorusem?
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_09"); //Tego nie mogê ci za³atwiæ. 
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_10"); //Stra¿nik przy wejœciu to mój bliski przyjaciel. To jak bêdzie? 
    AI_Output (other, self ,"DIA_Scatty_DowodyNaOszustwa_15_11"); //No dobra. Za³atw mi wejœcie do siedziby Magnatów, a nie powiem nic Thorusowi.
    AI_Output (self, other ,"DIA_Scatty_DowodyNaOszustwa_03_12"); //Umowa stoi. 
	B_GiveInvItems (hero,self, ZapiskiScattego,1);
	AI_StopProcessInfos	(self);
	GRD_245_Gardist.aivar[AIV_PASSGATE]=TRUE;
	Grd_218_GArdist.aivar[AIV_PASSGATE]=TRUE;
};

instance TRIA_ZakladyErensa (C_INFO)
{
    npc         = Grd_210_Scatty;
    nr          = 10;
    condition   = TRIA_ZakladyErensa_condition;
    information = TRIA_ZakladyErensa_info;
    important   = true;
    permanent   = false;
};

func int TRIA_ZakladyErensa_condition()
{
	if (Npc_GetDistToWP(hero,"OCR_STAND_WETT")<500) && (Npc_GetDistToWP(VLK_517_Buddler,"OCR_STAND_WETT")<500) && Npc_KnowsInfo (hero,DIA_Erens_ORE)
	{
    return TRUE;
	};
};

func void TRIA_ZakladyErensa_info()
{
    var c_npc Scatty;    	Scatty = Hlp_GetNpc(Grd_210_Scatty); // Ihm gehört der Dialog
    //var c_npc Robotnik;   	Robotnik = Hlp_GetNpc(VLK_2004_Robotnik);
    var c_npc Erens; 		Erens = Hlp_GetNpc(VLK_517_Buddler);
	
    //TRIA_Invite(Robotnik);   // Lade Robotnik in diesen Dialog ein
    TRIA_Invite(Erens); // Lade Erens in diesen Dialog ein
	TRIA_Invite(Scatty);
    TRIA_Start();         // Starte das Gespräch

    TRIA_Next(Scatty);
	AI_GotoNpc(hero, Erens);
    DIAG_Reset();
	AI_Output (self, other, "TRIA_ZakladyErensa_0F"); //Czego sobie ¿yczycie?

    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Erens (self = Erens, other = Hero)
    TRIA_Next(Erens);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (Erens,Scatty);
    AI_Output (self, other, "TRIA_ZakladyErensa_04"); //Chcia³bym obstawiæ walkê. Ten brudas przeciwko Naldurowi. Stawiam sto bry³ek na Naldura.
	AI_TurnToNpc (hero,Scatty);
	AI_Output (other, self, "TRIA_ZakladyErensa_05"); //Ja stawiam sto bry³ek na siebie.

    // Held redet nun wieder mit Scatty (self = Scatty, other = Hero)
    TRIA_Next(Scatty);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, Erens);
    AI_Output (self, other, "TRIA_ZakladyErensa_06"); //A to ci dopiero niespodzianka. Panowie popadli w konflikt? 
	AI_Output (other, self, "TRIA_ZakladyErensa_07"); //Nie z mojej winy. Ten goœæ po prostu bardzo prêdko chce siê pozbyæ swojej rudy i wróciæ do Kopalni.

    //AI_TurnToNpc(other, self);

    // Kamerafahrt Ende
    TRIA_Cam("");

    // Scatty soll zornig reagieren
	TRIA_Next(Erens);
	DIAG_Reset();
    DIAG("Angry", 0, 4);
	//AI_TurnToNpc (self,Grd_210_Scatty);
    AI_Output (self, other, "TRIA_ZakladyErensa_08"); //Jeszcze zobaczymy!

    // Held soll sich jetzt wieder normal bewegen
	TRIA_Next(Scatty);
    DIAG_Reset();
	AI_TurnToNpc(self, hero);
    AI_Output (self, other, "TRIA_ZakladyErensa_09"); //No dobra! Zak³ady przyjête. Walki odbywaj¹ siê wieczorem od godziny 19. W tym czasie staw siê na arenie. Naldur bêdzie tam ju¿ czeka³.


    TRIA_Finish(); // und Ende
	
	Npc_ExchangeRoutine	(Scatty, "start");
	Npc_ExchangeRoutine	(Erens, "start");
	AI_StopProcessInfos (Grd_210_Scatty);
	
	Npc_ExchangeRoutine	(VLK_577_Buddler, "arena");
	Npc_ExchangeRoutine	(STT_3919_Polykacz, "urlop");
	Npc_ExchangeRoutine	(STT_3918_Polykacz, "urlop");
};

//========================================
//-----------------> WinWithNaldur
//========================================

INSTANCE DIA_Scatty_WinWithNaldur (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_WinWithNaldur_Condition;
   information  = DIA_Scatty_WinWithNaldur_Info;
   permanent	= FALSE;
   important	= 1;
};

FUNC INT DIA_Scatty_WinWithNaldur_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Naldur_WIN)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_WinWithNaldur_Info()
{
    AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_01"); //Wygra³eœ walkê z Naldurem. Zgodnie z umow¹ otrzymujesz swój wk³ad i sto bry³ek Erensa. 
	AI_Output (self, other ,"DIA_Scatty_WinWithNaldur_03_02"); //Zrobi³eœ dobre wra¿enie. Osobiœcie siê cieszê, ¿e wreszcie ktoœ utar³ Erensowi nosa. Ten dziadek chyba ma tu za dobrze.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia³em ze Scattym, który wrêczy³ mi nagrodê za walkê. Teraz pora wróciæ i zobaczyæ reakcjê Erensa.");
	CreateInvItems (self,itminugget,200);
	B_GiveInvItems (self,other,itminugget,200);
};

//========================================
//-----------------> LoseWithNaldur
//========================================

INSTANCE DIA_Scatty_LoseWithNaldur (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_LoseWithNaldur_Condition;
   information  = DIA_Scatty_LoseWithNaldur_Info;
   permanent	= FALSE;
   important	= 1;
};

FUNC INT DIA_Scatty_LoseWithNaldur_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Naldur_LOSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_LoseWithNaldur_Info()
{
    AI_Output (self, other ,"DIA_Scatty_LoseWithNaldur_03_01"); //Przegra³eœ z Naldurem. A szkoda, bo liczy³em, ¿e utrzesz nosa Erensowi.
    B_LogEntry               (CH1_FightWithNaldur,"Rozmawia³em ze Scattym, który szczerze ¿a³owa³, ¿e przegra³em. Nie mam odwagi spojrzeæ Erensowi w oczy, ale chyba bêdê musia³ to zrobiæ.");
};

//========================================
//-----------------> ArenaEnd
//========================================

INSTANCE DIA_Scatty_ArenaEnd (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_ArenaEnd_Condition;
   information  = DIA_Scatty_ArenaEnd_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e ju¿ po twoim interesie z aren¹.";
};

FUNC INT DIA_Scatty_ArenaEnd_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_ArenaEnd_Info()
{
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_01"); //Widzê, ¿e ju¿ po twoim interesie z aren¹.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_02"); //Jest wiele innych sposobów ¿eby zarobiæ.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_03"); //Cz³owiek musi potrafiæ dostosowaæ siê do zmieniaj¹cego siê otoczenia. Wiesz o czym mówiê?
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_04"); //Zamierzam na powa¿nie zaj¹æ siê handlem. Zabra³em ze Starego Obozu kilka fajnych rzeczy.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_05"); //Myœlê, ¿e wkrótce mi siê przydadz¹. A ty jak sobie radzisz?
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_06"); //Nie najgorzej. Orkowie, szamani, harpie... To co zwykle.
    AI_Output (self, other ,"DIA_Scatty_ArenaEnd_03_07"); //Ha! Chyba tylko smok móg³by stawiæ ci opór. Ha ha ha!
    AI_Output (other, self ,"DIA_Scatty_ArenaEnd_15_08"); //(uœmiecha siê) Wola³bym go nie spotkaæ. 
};
//---------------------------------------------------------------------------------1.6.1---------------------------------------------------------------------

//========================================
//-----------------> ArenaEnd
//========================================

INSTANCE DIA_Scatty_Dlug (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_Dlug_Condition;
   information  = DIA_Scatty_Dlug_Info;
   permanent	= FALSE;
   description	= "Podobno Fletcher jest ci winien parê bry³ek.";
};

FUNC INT DIA_Scatty_Dlug_Condition()
{
    if (MIS_dlugfletchera == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_Dlug_Info()
 {
    AI_Output (other, self ,"DIA_Scatty_Dlug_15_01"); //Podobno Fletcher jest ci winien parê bry³ek.
    AI_Output (self, other ,"DIA_Scatty_Dlug_03_02"); //I niech nie myœli, ¿e umorzê mu ten d³ug. Zaraz zacznê naliczaæ procent.
    AI_Output (other, self ,"DIA_Scatty_Dlug_03_03"); //Fletcher przysy³a mnie z t¹ rud¹.
    AI_Output (self, other ,"DIA_Scatty_Dlug_03_04"); //Nie wymiga siê z tego tak ³atwo. Zbyt d³ugo czeka³em!
    AI_Output (other, self ,"DIA_Scatty_Dlug_03_05"); //Czyli?
    AI_Output (self, other ,"DIA_Scatty_Dlug_15_06"); //Jeœli chcesz za niego zap³aciæ. To stañ w szranki na mojej arenie!
    AI_Output (self, other ,"DIA_Scatty_Dlug_03_07"); //Przed walk¹ daj mi 200 bry³ek. Jeœli wygrasz, przyjmê rudê Fletchera. Jeœli przegrasz to ten wa³koñ jest mi winien dwa razy tyle!

 };
 
 
 
 //========================================
//-----------------> ArenaEnd
//========================================

INSTANCE DIA_Scatty_Dlug1 (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_Dlug1_Condition;
   information  = DIA_Scatty_Dlug1_Info;
   permanent	= FALSE;
   description	= "Z kim mam walczyæ?";
};

FUNC INT DIA_Scatty_Dlug1_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Scatty_Dlug)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_Dlug1_Info()
 {
    AI_Output (other, self ,"DIA_Scatty_Dlug1_15_01"); //Z kim mam walczyæ?
    AI_Output (self, other ,"DIA_Scatty_Dlug1_03_02"); //Z Gor Hanisem. To œwietny wojownik, wiêc przemyœl jeszcze swoj¹ decyzjê bo dostaniesz ³omot nie tylko do niego ale i od Fletchera.
    AI_Output (self, other ,"DIA_Scatty_Dlug1_03_03"); //A i jeszcze jedno. Musisz nale¿eæ do jakiegoœ obozu. Chcia³bym by paru ludzi obstawi³o t¹ walkê.
    AI_Output (self, other ,"DIA_Scatty_Dlug1_03_04"); //A pojedynki gdzie walczy zwyk³y przyb³êda nikogo nie interesuj¹.
    ScattyWalkaHanis = TRUE;
    B_LogEntry			(Dlug,	"Scatty wœciek³ siê na Fletchera do tego stopnia, ¿e nie chce tak po prostu rudy. Wymaga bym stan¹³ do walki na arenie do pojedynku z Gor Hanisem. Jeœli przegram to Fletcher bêdzie winny dwa razy tyle rudy. Jeœli zaœ wygram to d³ug zostanie umorzony. Muszê jednak wpierw nale¿eæ do jakiegoœ Obozu bo wtedy bêdê bardziej znany i wiêcej ludzi obstawi tê walkê.");
 };
 
 //========================================
//-----------------> ArenaEnd
//========================================

INSTANCE DIA_Scatty_Dlug2 (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 1;
   condition    = DIA_Scatty_Dlug2_Condition;
   information  = DIA_Scatty_Dlug2_Info;
   permanent	= FALSE;
   description	= "Nale¿ê ju¿ do jednego z obozów.";
};

FUNC INT DIA_Scatty_Dlug2_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Scatty_Dlug1)) 
	&& ((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_KDF)|| (Npc_GetTrueGuild(hero) == GIL_BAU) || (Npc_GetTrueGuild(hero) == GIL_NOV))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_Dlug2_Info()
 {
    AI_Output (other, self ,"DIA_Scatty_Dlug2_15_01"); //Nale¿ê ju¿ do jednego z obozów.
    AI_Output (self, other ,"DIA_Scatty_Dlug2_03_02"); //Dobrze. Zatem obstaw teraz swoj¹ walkê. 
    AI_Output (other, self ,"DIA_Scatty_Dlug2_15_03"); //Proszê.
    B_GiveInvItems (other,self, ItMiNugget, 200);
    AI_Output (self, other ,"DIA_Scatty_Dlug2_03_04"); //Zawo³aj Hanisa i ruszajcie na arenê!
  
     B_LogEntry			(Dlug,	"Idê walczyæ z Gor Hanisem i oby mi siê powiod³o.");
};
  var int walczyl_HanisG;
 

 //========================================
//-----------------> FightWithHanis
//========================================

INSTANCE DIA_Scatty_FightFletcherWithHanis (C_INFO)
{
   npc          = Grd_210_Scatty;
   nr           = 2;
   condition    = DIA_Scatty_FightFletcherWithHanis_Condition;
   information  = DIA_Scatty_FightFletcherWithHanis_Info;
   permanent	= TRUE;
   important = true;
};

FUNC INT DIA_Scatty_FightFletcherWithHanis_Condition()
{
    if (walczyl_HanisG == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scatty_FightFletcherWithHanis_Info()
{
    AI_Output (self, other ,"DIA_Scatty_FightFletcherWithHanis_03_01"); //Walczy³eœ z Gor Hanisem.
    if (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (other, self ,"DIA_Scatty_FightFletcherWithHanis_15_02"); //Pokona³em Hanisa.
        AI_Output (self, other ,"DIA_Scatty_FightFletcherWithHanis_03_03"); //Dobra robota. To by³ dobry pojedynek, d³ug Fletchera zosta³ sp³acony.
        AI_Output (other, self ,"DIA_Scatty_FightFletcherWithHanis_15_04"); //Doskonale.
	    Npc_ExchangeRoutine( TPL_1422_GorHanis,"start");
		   B_LogEntry			(Dlug,	"Pokona³em Gor Hanisa wiêc d³ug Fletchera zosta³ umorzony. Muszê mu o tym powiedzieæ i odebraæ nale¿n¹ mi nagrodê.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Scatty_FightFletcherWithHanis_03_05"); //A nie mówi³em, przegra³eœ!
        AI_Output (other, self ,"DIA_Scatty_FightFletcherWithHanis_15_06"); //Tak.
	    AI_Output (self, other ,"DIA_Scatty_FightFletcherWithHanis_03_07"); //Ty masz parê dodatkowych siniaków a Fletcher ma mi oddaæ dwa razy tyle czyli 400 bry³ek.
        AI_Output (other, self ,"DIA_Scatty_FightFletcherWithHanis_15_08"); //Po prostu œwietnie...
		HanisPrzegrana = true;
		Npc_ExchangeRoutine( TPL_1422_GorHanis,"start");
		  B_LogEntry			(Dlug,	"Niestety oberwa³em na arenie od Gor Hanisa. Z powodu mojej przegranej Fletcher ma teraz dwa razy wiêkszy d³ug wynosz¹cy ju¿ 400 bry³ek rudy. Na pewno nie bêdzie zachwycony tym faktem.");
    };
	walczyl_HanisG = false;
    AI_StopProcessInfos	(self);
	
	
};

instance dia_scatty_pickpocket(c_info) {
    npc = grd_210_scatty;
    nr = 900;
    condition = dia_scatty_pickpocket_condition;
    information = dia_scatty_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scatty_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 40);
};

func void dia_scatty_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scatty_pickpocket);
	info_addchoice(dia_scatty_pickpocket, dialog_back, dia_scatty_pickpocket_back);
	info_addchoice(dia_scatty_pickpocket, dialog_pickpocket, dia_scatty_pickpocket_doit);
};

func void dia_scatty_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_scatty_pickpocket);
};

func void dia_scatty_pickpocket_back() {
    info_clearchoices(dia_scatty_pickpocket);
};