//poprawione i sprawdzone -  

// ****************************************
// 					FIRST 
// ****************************************

instance  GUR_1201_CorKalom_FIRST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_FIRST_Condition;
	information		= GUR_1201_CorKalom_FIRST_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self,ZS_TALK))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Czego chcesz?
	Kalom_TalkedTo = TRUE;
};  

// ****************************************
// 				Wanna Join
// ****************************************

instance  GUR_1201_CorKalom_WannaJoin (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_WannaJoin_Condition;
	information		= GUR_1201_CorKalom_WannaJoin_Info;
	permanent		= 0;
	description		= "Chcia�bym przy��czy� si� do Bractwa."; 
};

FUNC int  GUR_1201_CorKalom_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Chcia�bym przy��czy� si� do Bractwa.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Podobno jeste� zwierzchnikiem Nowicjuszy i to ty decydujesz kto zostanie przyj�ty.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Nie mam teraz czasu! Moje eksperymenty s� zbyt wa�ne, bym m�g� zawraca� sobie g�ow� nowoprzyby�ymi!
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Zdam si� na os�d Baal�w. Je�li oni uznaj�, �e jeste� got�w, by do nas do��czy� zg�o� si� do mnie ponownie.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Cor Kalom pozwoli mi zosta� Nowicjuszem Bractwa, je�li uda mi si� przekona� do siebie czterech Baal�w.");
};  

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance  GUR_1201_CorKalom_Recipe (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 20;
	condition		= GUR_1201_CorKalom_Recipe_Condition;
	information		= GUR_1201_CorKalom_Recipe_Info;
	permanent		= 0;
	description		= "Jeden z kupc�w ze Starego Obozu jest zainteresowany pewn� receptur�..."; 
};

FUNC int  GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Jeden z kupc�w ze Starego Obozu jest zainteresowany twoj� receptur� na nap�j uzdrawiaj�cy.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //Moje receptury nie s� na sprzeda�!

	B_LogEntry	(CH1_KalomsRecipe,	"Cor Kalom nie chce da� mi swojej receptury. Ale w jego laboratorium stoj� wielkie skrzynie... a on sam wygl�da� na bardzo zaj�tego...");
};  

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Experimente (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_Experimente_Condition;
	information		= GUR_1201_CorKalom_Experimente_Info;
	permanent		= 1;
	description		= "Jakie eksperymenty przeprowadzasz?"; 
};

FUNC int  GUR_1201_CorKalom_Experimente_Condition()
{
	if	(Kapitel <= 2)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Jakie eksperymenty przeprowadzasz?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Moje badania dotycz� spraw, o kt�rych nie masz najmniejszego poj�cia, ch�opcze, wi�c przesta� zawraca� mi g�ow�!
};  

// ****************************************
// Info BRINGWEED
// ****************************************

instance  GUR_1201_CorKalom_BRINGWEED (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_BRINGWEED_Condition;
	information		= GUR_1201_CorKalom_BRINGWEED_Info;
	permanent		= 1;
	description		= "Przynosz� codzienn� porcj� ziela!"; 
};

FUNC int  GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if	(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Przynosz� codzienn� porcj� ziela!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //TO ma by� WSZYSTKO? Masz mi przynie�� przynajmniej 100 sztuk!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ach, daj mi to. A teraz zejd� mi z oczu!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,	"Cor Kalom by� r�wnie nieprzyjemny, co zwykle. Odda�em mu zebrane na bagnach ziele..");
		Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_SUCCESS);
		B_GiveXP			(XP_DeliveredWeedHarvest);
		
		BaalOrun_FetchWeed = LOG_SUCCESS;		
		AI_StopProcessInfos	(self);
	};
};  

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Crawlerzangen (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 800;
	condition		= GUR_1201_CorKalom_Crawlerzangen_Condition;
	information		= GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent		= 1;
	description		= "Przynios�em ci wn�trzno�ci pe�zaczy..."; 
};

FUNC int  GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01)>0)
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Przynios�em ci wn�trzno�ci pe�zaczy.
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Wspaniale. W nagrod� mo�esz sobie wzi�� jeden z moich najlepszych wywar�w.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //�wietnie. We� sobie w nagrod� kilka moich wywar�w.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. Tylko tyle? Masz tu nap�j many i zejd� mi z oczu.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};
	
	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other,ItAt_Crawler_01));
}; 




// ****************************************
// 				Join PSI
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI_Condition;
	information		= GUR_1201_CorKalom_JoinPSI_Info;
	permanent		= 1;
	description		= "Chyba uda�o mi si� przekona� Baal�w!"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI_Condition()
{
	if	((Npc_GetTrueGuild(hero) == GIL_NONE))
	&&	Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin) 
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;	//Counter l�schen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Chyba uda�o mi si� przekona� Baal�w!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun uwa�a, �e jestem godnym s�ug� �ni�cego.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //M�w dalej...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar ma mnie za poj�tnego ucznia.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib jest przekonany co do szczero�ci mojej wiary.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Dzi�ki mnie, Baal Tyon prze�y� objawienie.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //I?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral uwa�a, �e powinienem zosta� przyj�ty. Przyprowadzi�em mu nowego ucznia.
		counter = counter + 1;
	};
	//er 1.4

	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Dobrze. Je�li Baalowie przemawiaj� za tob�, to mi wystarczy.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Masz. Za�� to. A teraz id� robi� co� po�ytecznego.
	
			// Ernennung zum Novizen
			
			//Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",118,0,-1);
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			HeroJoinToPSI ();
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,	"Dzi� Cor Kalom przyj�� mnie w poczet Nowicjuszy. By� jak zwykle wredny, ale teraz jestem przynajmniej pe�noprawnym cz�onkiem Bractwa �ni�cego.");
			B_LogEntry			(GE_TraderPSI,	"Powinienem odebra� szat� Nowicjusza u Baal Namiba.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry				(CH1_JoinOC,	"Odk�d zgodzi�em si� przysta� do Bractwa �ni�cego nie mog� ju� liczy� na zostanie przyj�tym Cieni Gomeza.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry				(CH1_JoinNC,	"Nie mog� do��czy� do Szkodnik�w z Nowego Obozu. Moje miejsce jest w Bractwie �ni�cego.");
			
			//Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
			//Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
			//B_LogEntry				(CH1_BANDITOS_CAMP,	"Quentin mo�e zapomnie� o mojej osobie. Do��czy�em do Bractwa.");
			
			Log_CreateTopic		(CH1_EasyJoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_EasyJoinOC,	LOG_FAILED);
			B_LogEntry				(CH1_EasyJoinOC,	"Nic nie wysz�o z mojego u�atwionego przyj�cia do Starego Obozu. Zosta�em cz�onkiem Bractwa �ni�cego.");

		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //I?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To ju� wszystko.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Marnujesz tylko m�j cenny czas. Wr�� kiedy uda ci si� przekona� do siebie co najmniej czterech Baal�w!
		};
	}
	else
	{	
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI2 (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI2_Condition;
	information		= GUR_1201_CorKalom_JoinPSI2_Info;
	permanent		= 0;
	description		= "Tylko tyle? �adnego powitania, ani nic?"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //Tylko tyle? �adnego powitania, ani nic?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Witamy.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //O wiele lepiej.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Przesta� si� tu kr�ci�. Zr�b co� po�ytecznego. Zanie� to ziele do Starego Obozu i daj je Gomezowi.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Gdyby jego siepacze stwarzali ci jakie� problemy, powiedz, �e przysy�a ci� Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,	"Cor Kalom kaza� mi dostarczy� parti� bagiennego ziela do Gomeza ze Starego Obozu."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Jeszcze tu jeste�?!
	AI_StopProcessInfos	(self);
};  

// **************************************************************************
// 							MISSION: 	Drug Monopol
// **************************************************************************



// --------------------------------------------------------------------------

INSTANCE Info_Kalom_DrugMonopol (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_DrugMonopol_Condition;
	information	= Info_Kalom_DrugMonopol_Info;
	permanent 	= 0; 
	description = "Masz dla mnie jeszcze jakie� zadania?";
};


FUNC INT Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_DrugMonopol_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Masz dla mnie jeszcze jakie� zadania?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //W Nowym Obozie kilku ludzi zacz�o upraw� ziela na w�asn� r�k�.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Chc�, �eby� po�o�y� temu kres.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Jak?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //To ju� nie moja sprawa!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Ich obozowisko musi znajdowa� si� gdzie� w pobli�u Nowego Obozu. Wiesz, co masz zrobi�...

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,	"Cor Kalom kaza� mi przeciwdzia�a� wytwarzaniu ziela w Nowym Obozie. Nie wiem jeszcze gdzie mam zacz��, ale powinienem czym pr�dzej uda� si� do Nowego Obozu.");

	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

INSTANCE Info_Kalom_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_Success_Condition;
	information	= Info_Kalom_Success_Info;
	permanent	= 1;
	description = "Wracaj�c do produkcji ziela w Nowym Obozie...";
};


FUNC INT Info_Kalom_Success_Condition()
{
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_Success_Info()
{
	var C_NPC Killian; 	Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_NPC Renyu; 	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_NPC Jacko; 	Jacko = Hlp_GetNpc(ORG_862_Jacko);
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Wracaj�c do produkcji ziela w Nowym Obozie...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Tak?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Nie mog� znale�� tych ludzi.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //C�, mog�em si� tego po tobie spodziewa�.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Ju� po k�opocie.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Zaskakujesz mnie. Chyba ci� troch� nie docenia�em. Mo�e jednak b�dzie z ciebie jaki� po�ytek.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,	"Poinformowa�em Cor Kaloma o powstrzymaniu konkurencyjnej produkcji ziela. By� r�wnie 'mi�y' jak zwykle.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
		Info_Kalom_Success.permanent = 0;
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR�CK
// ****************************************************************
var int kalom_raz_oddane;
INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "Dostarczy�em przesy�k�.";
};

func INT Info_Kalom_KrautboteBACK_Condition()
{
	if	Kalom_DeliveredWeed && (KALOM_KRAUTBOTE == LOG_RUNNING) //&& kalom_raz_oddane == false
	{
		return TRUE;
	};
};

FUNC VOID Info_Kalom_KrautboteBACK_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Dostarczy�em przesy�k�.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //To dobrze. Poszukaj sobie jakiego� nowego zaj�cia.

		KALOM_KRAUTBOTE = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,	"Cor Kalom otrzyma� pieni�dze za bagienne ziele dostarczone przeze mnie do Starego Obozu.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);
		//kalom_raz_oddane = true;
		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Gdzie jest 500 bry�ek rudy, ch�opcze? Lepiej si� pospiesz. Nie b�d� d�ugo czeka�.
	}; 
};

// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************

//========================================
//-----------------> MessengerIngredients
//========================================

INSTANCE DIA_CorKalom_MessengerIngredients (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_MessengerIngredients_Condition;
   information  = DIA_CorKalom_MessengerIngredients_Info;
   permanent	= FALSE;
   description	= "Mam sk�adniki niezb�dne do przywo�ania pos�a�ca.";
};

FUNC INT DIA_CorKalom_MessengerIngredients_Condition()
{
    if (MIS_MessengerRecall == LOG_RUNNING)
    && (Npc_HasItems (other, ItFo_Plants_RavenHerb_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_Bloodwood_01) >=1)
    && (Npc_HasItems (other, ItMiJoint_3) >=1)
    && (Npc_HasItems (other, ItMi_Alchemy_Quicksilver_01) >=1)
    && (Npc_HasItems (other, ItFo_Plants_utarteJagody_01) >=1)
    && (Npc_HasItems (other, ItFo_Honey) >=1)
    && (Npc_HasItems (other, ItMi_WhiteWolfBlood) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_MessengerIngredients_Info()
{
    AI_Output (other, self ,"DIA_CorKalom_MessengerIngredients_15_01"); //Mam sk�adniki niezb�dne do przywo�ania pos�a�ca.
    B_GiveInvItems (other, self, ItMi_Alchemy_Quicksilver_01, 1);
    B_GiveInvItems (other, self, ItFo_Plants_RavenHerb_01, 1);
	B_GiveInvItems (other, self, ItFo_Plants_Bloodwood_01, 1);
	B_GiveInvItems (other, self, ItMiJoint_3, 1);
	B_GiveInvItems (other, self, ItFo_Plants_utarteJagody_01, 1);
	B_GiveInvItems (other, self, ItFo_Honey, 1);
	B_GiveInvItems (other, self, ItMi_WhiteWolfBlood, 1);
    AI_Output (self, other ,"DIA_CorKalom_MessengerIngredients_03_02"); //Faktycznie, masz wszystko. 
    AI_Output (self, other ,"DIA_CorKalom_MessengerIngredients_03_03"); //A wi�c wszystko gotowe. Spotkajmy si� na placu �wi�tynnym. Jest tam ma�y o�tarz. My�l�, �e wystarczy. 

    AI_StopProcessInfos	(self);
	
	B_GiveXP (200);
	
	B_LogEntry(CH2_MessengerRecall, "Wreszcie wszystko jest gotowe. Mam si� spotka� z Kalomem na placu �wi�tynnym.");
	
	Npc_ExchangeRoutine (GUR_1201_CorKalom, "messenger");
	Npc_ExchangeRoutine (GUR_1200_YBerion, "messenger");
	Npc_ExchangeRoutine (GUR_1208_BaalCadar, "messenger");
};



func void messenger_spawn ()
{
	Wld_PlayEffect("spellFX_Demon",hero,self, 0, 0, 0, TRUE);
	Wld_SpawnNpcRange	(hero,OrcMessengerRecalled,	1,	500);
};

//========================================
//-----------------> ReadyToCall
//========================================

INSTANCE DIA_CorKalom_ReadyToCall (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_ReadyToCall_Condition;
   information  = DIA_CorKalom_ReadyToCall_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorKalom_ReadyToCall_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_MessengerIngredients))
    && (Npc_GetDistToWP (self, "PSI_MESSENGER_KALOM") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_ReadyToCall_Info()
{
    AI_Output (self, other ,"DIA_CorKalom_ReadyToCall_03_01"); //Jeste�. A wi�c zaczynajmy. 
	AI_GotoWP (self, "PSI_MESSENGER_RITUAL"); 
    AI_Output (self, other ,"DIA_CorKalom_ReadyToCall_03_02"); //O wielki �ni�cy! Uznaj nasze pragnienia kontaktu z tw� niesko�czon� chwa��!
    AI_Output (self, other ,"DIA_CorKalom_ReadyToCall_03_03"); //Jako zapowied� swego tryumfalnego nadej�cia, ujawnij teraz swego pos�a�ca!
	
	AI_StopProcessInfos (Self);
	
	B_GiveXP (500);
	
	B_LogEntry(CH2_MessengerRecall, "Co� chyba posz�o nie tak. Kalom przywo�a� istot� podobn� do orka. Cokolwiek to by�o od razu zaatakowa�o wszystkich wok�.");
	AI_Function (self, messenger_spawn);
};

//========================================
//-----------------> AfterParty
//========================================

INSTANCE DIA_CorKalom_AfterParty (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_AfterParty_Condition;
   information  = DIA_CorKalom_AfterParty_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_CorKalom_AfterParty_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_CorKalom_ReadyToCall))
    &&  (Npc_IsDead(OrcMessengerRecalled))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_AfterParty_Info()
{
    AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_01"); //Nie... Nie wiem co si� sta�o... 
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_02"); //Ta istota... Co to by�o? Wygl�da�o podobnie do orka... 
    AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_03"); //Co� musia�o zak��ci� rytua�. Pos�a�cem �ni�cego nie m�g� by� ork!
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_04"); //Dlaczego? By� mo�e orkowie maj� jak�� wiedz� na temat �ni�cego. 
    AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_05"); //To nie mo�e by� prawda. Musz� przeprowadzi� badania...
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_06"); //Przemy�l to o czym m�wi�. To mo�e by� dla nas...
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_07"); //ZAMILCZ! Przywo�anie pos�a�ca nie powiod�o si�, ale to nas nie zatrzyma. B��d le�y z pewno�ci� po naszej stronie. 
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_08"); //Durniu! Do rytua�u przy��czyli si� wszyscy tu zgromadzeni. Czyja� obecno�� zak��ci�a ca�y proces.
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_09"); //Szukasz winnych?
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_10"); //(udaje, �e nie s�yszy, m�wi do siebie) Niepowodzenie nas nie powstrzyma! Musimy sami odnale�� odpowied� na nasze pytania.
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_11"); //Kopalnia, wydzielina. To jest odpowied�! Sami j� poznamy. Udaj si� do Starej Kopalni! 
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_12"); //A co z pos�a�cem?
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_13"); //Zapomnij o tym. Ruszaj!
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	AI_Output (other, self ,"DIA_CorKalom_AfterParty_05_14"); //Jestem cz�onkiem obozu Quentina, w�tpi� �e stra�nicy dobrowolnie mnie wpuszcz� do kopalni...
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_15"); //C�...
	  B_UseFakeScroll( );  
	AI_Output (self, other ,"DIA_CorKalom_AfterParty_03_16"); //W razie problem�w poka� ten list stra�nikom, nie powinni sprawia� problem�w.
	B_GiveInvItems (self,other, ItWr_CorCToArtegor, 1);
	
	};
	MIS_MessengerRecall = LOG_SUCCESS;
	Log_SetTopicStatus(CH2_MessengerRecall, LOG_SUCCESS);	
	B_LogEntry(CH2_MessengerRecall, "Cor Kalom kaza� mi zapomnie� o tym ca�ym pos�a�cu. Plan jak wida� nie wypali�, a Guru nie chc�, by Nowicjusze po�apali si� o co w tym wszystkim chodzi. Mam si� uda� do Starej Kopalni i poszuka� odpowiedzi.");
	B_GiveXP (250);
	
	Npc_ExchangeRoutine (GUR_1201_CorKalom, "start");
	Npc_ExchangeRoutine (GUR_1200_YBerion, "start");
	Npc_ExchangeRoutine (GUR_1208_BaalCadar, "start");
};

instance Info_CorKalom_BringFocus (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringFocus_Condition;
	information	= Info_CorKalom_BringFocus_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysy�a mnie Y'Berion. Mam kamie� ogniskuj�cy.";
};

FUNC INT Info_CorKalom_BringFocus_Condition()
{	
	if  (YBerion_BringFocus == LOG_SUCCESS) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BringFocus_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Przysy�a mnie Y'Berion. Mam kamie� ogniskuj�cy
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ach, kamie� ogniskuj�cy... Nareszcie mog� zbada� magiczn� natur� tego artefaktu.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Gdybym tylko mia� do�� wydzieliny... Niech to piek�o poch�onie!
	
	B_LogEntry		(CH2_Focus,	"Dostarczy�em kamie� ogniskuj�cy Cor Kalomowi!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f�r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y'Berion powiedzia�, �e wynagrodzisz mnie za dostarczenie kamienia!";
};

FUNC INT Info_CorKalom_BLUFF_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringFocus)) 
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BLUFF_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion powiedzia�, �e wynagrodzisz mnie za dostarczenie kamienia!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Czy�by? Tak powiedzia�? No tak. 50 bry�ek rudy chyba wystarczy?
	
	CreateInvItems (self,Itminugget,50);
	B_GiveInvItems (self, other, Itminugget,50);
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_SACHE (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_SACHE_Condition;
	information		= GUR_1201_CorKalom_SACHE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wydzieliny?"; 
};

FUNC int  GUR_1201_CorKalom_SACHE_Condition()
{	
	if (Npc_KnowsInfo ( hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};

};
FUNC VOID  GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //Wydzieliny?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Tak. Jak zapewne wiesz, przygotowuj� magiczne wywary, kt�re pozwol� nam nawi�za� kontakt ze �ni�cym. Jednak do tego celu potrzebuj� du�ych ilo�ci wydzieliny z wn�trzno�ci pe�zaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Wiesz, co to s� pe�zacze, prawda?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Nie.",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Tak.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Nie.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //To bardzo gro�ne istoty zamieszkuj�ce mroczne korytarze kopalni. Pe�zacze cz�sto atakuj� pracuj�cych tam g�rnik�w.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Ich wn�trzno�ci zawieraj� szczeg�ln� wydzielin�.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Wykorzystuj� j� do wytwarzania napoju, kt�ry otwiera przed nami duchow� �cie�k� do �ni�cego.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Tak.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //To �wietnie!
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_VISION (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_VISION_Condition;
	information		= GUR_1201_CorKalom_VISION_Info;
	important		= 0;
	permanent		= 0;
	description		= "M�w dalej..."; 
};

FUNC int  GUR_1201_CorKalom_VISION_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

};
FUNC void  GUR_1201_CorKalom_VISION_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //M�w dalej...
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //C�, jaki� czas temu �ni�cy objawi� mi si� osobi�cie i da� mi znak.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Da� mi do zrozumienia, �e istnieje inny spos�b, nie wymagaj�cy wydzieliny z wn�trzno�ci pe�zaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //I wybra� mnie, bym przekaza� komu� jego zalecenia. Nie wype�niasz tego zadania dla mnie! To polecenie samego �ni�cego!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //To niemo�liwe!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Milcz, g�upcze!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Da� mi do zrozumienia, �e wybrali�my w�a�ciw� drog�, ale dysponujemy niewystarczaj�cymi �rodkami.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Oznacza to, �e W�A�CIWE �rodki znajdziemy u pe�zaczy, ale sama wydzielina z wn�trzno�ci to za ma�o.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Musi by� co� jeszcze.
};  

var int dia_badanpelzaczach;
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nie przeprowadzali�cie �adnych bada� na pe�zaczach?"; 
};

FUNC int  GUR_1201_CorKalom_NEST_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_VISION)) && (dia_badanpelzaczach == false)
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_NEST_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Nie przeprowadzali�cie �adnych bada� na pe�zaczach? Mo�e jaka� cz�� ich cia�a zawiera wi�ksze ilo�ci wydzieliny od innych?
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Oczywi�cie, zbadali�my kilka martwych pe�zaczy, ale wydzielina zdaje si� by� gromadzona wy��cznie w ich gruczo�ach jadowych.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //To musi by� co� innego. Znajd� ich gniazdo, a poznasz odpowied�!
	
	if MIS_MessengerRecall == LOG_RUNNING
	{
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_04"); //Tej odpowiedzi m�g�by nam udzieli� wcze�niej pos�aniec �ni�cego, ale oci�gasz si� w wykonaniem zadania. 
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_05"); //Najpierw przywo�ajmy pos�a�ca, a je�li on nie da nam wskaz�wek, to udasz si� do Starej Kopalni. 
	}
	else if MIS_MessengerRecall == LOG_SUCCESS
	{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_06"); //Szkoda, �e nie udzieli� nam jej ten wasz ca�y pos�aniec. 
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_07"); //Nie wszystko przebieg�o zgodnie z planem, jasne? Id� do Starej Kopalni. Tam znajdziesz to czego szukamy. 
	CorKalom_BringMCQBalls = LOG_RUNNING;
	GUR_1201_CorKalom_NEST.permanent = 0; 
	dia_badanpelzaczach = true;
	}
	else
	{
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_08"); //Tej odpowiedzi m�g�by nam udzieli� wcze�niej pos�aniec �ni�cego, ale ty nawet pewnie nie wiesz o czym m�wi�.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_09"); //Pogadaj z Y'Berionem. 
	};
	

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,	"Guru Cor Kalom poprosi� mnie, bym odnalaz� dla niego silniejsz� wydzielin� pe�zaczy. Do tej pory pozyskiwano j� z wn�trzno�ci potwor�w, ale Kalom uwa�a, �e mo�na j� pozyska� w inny spos�b.");
B_LogEntry                     (CH1_PSIcampWORK,"Kalom prowadzi podejrzane badania nad wydzielin� pe�zaczy. Jednak w dalszym ci�gu nic nie wiem o wsp�pracy Bractwa ze Starym Obozem.");
	if (PresseTourJanuar2001)
	{
		CreateInvItems	(hero,	ItAt_Crawlerqueen,	3);
	};
};


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_WEG (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_WEG_Condition;
	information		= GUR_1201_CorKalom_WEG_Info;
	nr				= 21;
	important		= 0;
	permanent		= 0;
	description		= "To ci dopiero b�dzie mroczna wyprawa."; 
};

FUNC int  GUR_1201_CorKalom_WEG_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_RAT)) 
	&& (CorKalom_BringMCQBalls == LOG_RUNNING) && ( Npc_KnowsInfo (hero,DIA_CorKalom_AfterParty)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_WEG_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //To ci dopiero b�dzie mroczna wyprawa.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //We� te zwoje. Znajdziesz na nich magiczne formu�y zakl�cia �wiat�a. Przydadz� ci si� w nieo�wietlonych szybach.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //�wi�tynni Stra�nicy z kopalni b�d� ci s�u�y� pomoc�.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Oby �ni�cy doda� ci si�. Niech jego blask roz�wietla tw� drog�, gdziekolwiek si� udajesz!

	CreateInvItems		(self, ItArScrollLight, 5);
	B_GiveInvItems      (self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RAT (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RAT_Condition;
	information		= GUR_1201_CorKalom_RAT_Info;
	nr				= 20;
	important		= 0;
	permanent		= 0;
	description		= "Widz�, �e nie obejdzie si� bez rozlewu krwi."; 
};

FUNC int  GUR_1201_CorKalom_RAT_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_WEG))  && ( Npc_KnowsInfo (hero,DIA_CorKalom_AfterParty)) 
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_RAT_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Widz�, �e nie obejdzie si� bez rozlewu krwi.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //We� ze sob� te wywary.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Nie dostajesz ich ode mnie dlatego, �e zale�y mi na twoim �yciu, tylko ze wzgl�du na rang� zadania.

	CreateInvItems		(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems      (self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RUN (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RUN_Condition;
	information		= GUR_1201_CorKalom_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie znajd� te pe�zacze?"; 
};

FUNC int  GUR_1201_CorKalom_RUN_Condition()
{	
	if ((CorKalom_BringMCQBalls == LOG_RUNNING) 
	&& ( Npc_KnowsInfo (hero,DIA_CorKalom_AfterParty)) 
	&&	(Npc_HasItems(hero, ItAt_Crawlerqueen)< 1)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_RUN_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Gdzie znajd� te pe�zacze?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //W Starej Kopalni.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //A gdzie le�y Stara Kopalnia?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //We� t� map�. Zaznaczono na niej wszystkie wa�niejsze miejsca wewn�trz Bariery.
		CreateInvItem	(self,ItWrWorldmap);   
		B_GiveInvItems  (self, other, ItWrWorldmap, 1);
	};
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_CRAWLER (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_CRAWLER_Condition;
	information		= GUR_1201_CorKalom_CRAWLER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak nale�y walczy� z pe�zaczami?"; 
};

FUNC int  GUR_1201_CorKalom_CRAWLER_Condition()
{
	if Npc_KnowsInfo (hero, GUR_1201_CorKalom_RUN)
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	&& ( Npc_KnowsInfo (hero,DIA_CorKalom_AfterParty)) 
	{
	return 1;
	};
};


FUNC void  GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jak nale�y walczy� z pe�zaczami?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //W kopalni spotkasz kilku naszych Stra�nik�w poluj�cych na pe�zacze dla ich wydzieliny. Porozmawiaj z Gor Na Videm, on ci pomo�e.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mam odnale�� gniazdo pe�zaczy?"; 
};

FUNC int  GUR_1201_CorKalom_FIND_Condition()
{
	if ( Npc_KnowsInfo (hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIND_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Jak mam odnale�� gniazdo pe�zaczy?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To najtrudniejsza cz�� zadania. Nie wiem, gdzie powiniene� szuka�, ani czego. Ale �ni�cy wska�e ci drog� w odpowiednim momencie.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //To ci dopiero pocieszenie.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Znalaz�em jaja z�o�one przez kr�low� pe�zaczy.";
};                       

FUNC INT Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (  Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3 )
	{
		return 1;
	};
};
FUNC VOID Info_CorKalom_BringMCQBalls_Success_Info()
{	
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Znalaz�em jaja z�o�one przez kr�low� pe�zaczy.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Wiedzia�em! Moja wizja by�a znakiem od �ni�cego! Te jaja z pewno�ci� zawieraj� siln� wydzielin�!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //�wietnie. Dzi�ki nim przygotuj� nap�j, kt�ry pozwoli nam nawi�za� kontakt ze �ni�cym!
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co z moj� nagrod�?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //A, tak... Dzi�kuj�.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Wola�bym jak�� NAMACALN� nagrod�!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Dobrze ju�! Czego chcesz?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,	"Da�em Cor Kalomowi trzy jaja pe�zaczy. By� wyj�tkowo nieprzyjemny. Musia�em si� domaga� nale�nej mi nagrody!");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp, "Chyba wiem ju� wystarczaj�co wiele o wydarzeniach w Obozie Bractwa. Powinienem skontaktowa� si� z Mordragiem.");
	B_LogEntry	(CH1_GotoPsi, "Chyba wiem ju� wystarczaj�co wiele o wydarzeniach w Obozie Bractwa. Powinienem skontaktowa� si� z Krukiem.");
	B_LogEntry  (CH1_PSIcampWORK,"Chyba wiem ju� wystarczaj�co wiele o wydarzeniach w Obozie Bractwa. Powinienem pogada� z Quentinem.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi jak�� run�."	,Info_CorKalom_BringMCQBalls_Success_RUNE);
	AFIP_SetChoiceItem(Info_CorKalom_BringMCQBalls_Success_RUNE, ItArRuneLight);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi jaki� or�."	,Info_CorKalom_BringMCQBalls_Success_WAFFE);
	AFIP_SetChoiceItem(Info_CorKalom_BringMCQBalls_Success_WAFFE, ItMw_1H_Mace_War_03);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi nap�j uzdrawiaj�cy."	,Info_CorKalom_BringMCQBalls_Success_HEAL);
	AFIP_SetChoiceItem(Info_CorKalom_BringMCQBalls_Success_HEAL, ItFo_Potion_Health_Perma_01);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Wystarczy mi ruda. (x100)"		,Info_CorKalom_BringMCQBalls_Success_ORE);
	AFIP_SetChoiceItem(Info_CorKalom_BringMCQBalls_Success_ORE, ItMinugget);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Mo�e by� mana."	,Info_CorKalom_BringMCQBalls_Success_MANA);
	AFIP_SetChoiceItem(Info_CorKalom_BringMCQBalls_Success_MANA, ItFo_Potion_Mana_Perma_01);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	var int AFIP_ShowItem;
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Daj mi jak�� run�.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Niech ta runa roz�wietla tw� drog�!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	var int AFIP_ShowItem;
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Daj mi jaki� or�.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Niech ten or� sieje �mier� w szeregach twoich wrog�w!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	var int AFIP_ShowItem;
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Daj mi nap�j uzdrawiaj�cy.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Niech ten nap�j przed�u�y twoje �ycie.
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	var int AFIP_ShowItem;
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Wystarczy mi ruda.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Przyjmij t� rud� jako oznak� wdzi�czno�ci ca�ego Bractwa!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	var int AFIP_ShowItem;
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mo�e by� mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Niech ten nap�j wzmocni drzemi�c� w tobie magi�.
	CreateInvItem		(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
INSTANCE Info_CorKalom_BringBook (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Condition;
	information	= Info_CorKalom_BringBook_Info;
	permanent	= 0;
	description = "Czy mo�emy teraz przyst�pi� do przywo�ania �ni�cego?";
};

func INT Info_CorKalom_BringBook_Condition()
{
	if ( CorKalom_BringMCQBalls == LOG_SUCCESS )
	{
		return 1;
	};	
};
func VOID Info_CorKalom_BringBook_Info()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //Czy mo�emy teraz przyst�pi� do przywo�ania �ni�cego?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Nie! Nie uda�o mi si� jeszcze znale�� sposobu na na�adowanie kamienia ogniskuj�cego.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Niestety, nie dysponujemy staro�ytn� wiedz� na temat tych artefakt�w.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Chcesz powiedzie�, �e zdoby�em te jaja na pr�no?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Nie. Pos�uchaj: istnieje prastary almanach zawieraj�cy potrzebne nam informacje.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Odkupili�my go od Corristo, jednego z Mag�w Ognia ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Niestety, zosta� nam skradziony w drodze ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Kaza�em Talasowi, jednemu z Nowicjuszy, dostarczy� mi t� ksi�g�, ale ten g�upiec pozwoli� si� okra��.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Zawi�d� mnie, ale postanowi�em da� mu drug� szans�. Ma odzyska� almanach.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Porozmawiaj z nim. Przyda mu si� ka�da pomoc.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,	"Cor Kalom potrzebuje jeszcze jednego artefaktu, by uko�czy� swe dzie�o. To staro�ytna ksi�ga zawieraj�ca wskaz�wki dotycz�ce kamieni ogniskuj�cych. Niestety, przenosz�cy j� Nowicjusz Talas pozwoli� si� okra�� goblinom. Teraz kr�ci si� po �wi�tynnym dziedzi�cu szukaj�c kogo�, kto pomo�e mu odzyska� ksi�g�.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Co dostan� w zamian?"			,Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Kto ukrad� t� ksi�g�?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"Gdzie znajd� Talasa?"			,Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //Gdzie znajd� Talasa?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Powinien by� u st�p �wi�tyni. Pr�buje zjedna� sobie kogo� do pomocy.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Kto ukrad� t� ksi�g�?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas twierdzi, �e zosta� obrabowany przez czarne gobliny. Brzmi nieprawdopodobnie, ale mog�o si� tak zdarzy�...
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Co dostan� w zamian?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //Czy� nie przekona�em ci� ju� o mojej hojno�ci? Otrzymasz nagrod� odpowiedni� do rangi zadania.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Znalaz�em twoj� ksi�g�.";
};                       

FUNC INT Info_CorKalom_BringBook_Success_Condition()
{	
	if (	Npc_HasItems (Hero,ItWrFokusbuch)
	&&		(CorKalom_BringBook==LOG_RUNNING)	)
	{
		return 1 ; 
	};
};
FUNC VOID Info_CorKalom_BringBook_Success_Info()
{	
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Znalaz�em twoj� ksi�g�.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Dobra robota. Teraz mamy wszystkie potrzebne sk�adniki.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Zajm� si� teraz przygotowaniami.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Kiedy odb�dzie si� wielkie przywo�anie?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Zaczekaj do wieczora, wtedy przyjd� na dziedziniec �wi�tyni. Tam si� zbierzemy i spr�bujemy przywo�a� �ni�cego.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;
    Npc_ExchangeRoutine(Gur_1207_Natalia,"EndFan");
	B_LogEntry		(CH2_Book,	"Zanios�em almanach Cor Kalomowi, kt�ry przygotowuje teraz Bractwo do rytua�u przyzwania �ni�cego. Ceremonia odb�dzie si� w nocy, na �wi�tynnym dziedzi�cu.");
	Log_SetTopicStatus	(CH2_Book,	LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos	(self);

	B_Story_PrepareRitual();
};


// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 1;
	condition	= Info_CorKalom_Belohnung_Condition;
	information	= Info_CorKalom_Belohnung_Info;
	permanent	= 0;
	description = "Co z moj� zap�at�?";
};                       

FUNC INT Info_CorKalom_Belohnung_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringBook_Success) )
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_Belohnung_Info()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//Co z moj� zap�at�?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//A czego chcesz?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi te zwoje z zakl�ciami."	,Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Wystarczy mi ruda."				,Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi napoje mana."			,Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Daj mi te zwoje z zakl�ciami.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Wykorzystaj je m�drze.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Wystarczy mi ruda.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//To powinno zaspokoi� twoj� chciwo��.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Daj mi napoje mana.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//Niech te napoje dodadz� ci si�!
	CreateInvItems 		(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems      (self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices	(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance  GUR_1201_CorKalom_Exit (C_INFO)
{
	npc			=  GUR_1201_CorKalom;
	nr			=  999;
	condition	=  GUR_1201_CorKalom_Exit_Condition;
	information	=  GUR_1201_CorKalom_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

FUNC VOID  GUR_1201_CorKalom_Exit_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Do zobaczenia.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //Oby �ni�cy wskaza� ci w�a�ciw� drog�.
	
	AI_StopProcessInfos	( self );
};

// *******************************************************************************************************
// EDYCJA ROZSZERZONA
// *******************************************************************************************************

//========================================
//-----------------> NAUKA_ASK
//========================================

INSTANCE DIA_CorKalom_NAUKA_ASK (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_NAUKA_ASK_Condition;
   information  = DIA_CorKalom_NAUKA_ASK_Info;
   permanent	= FALSE;
   description	= "Czy mo�esz mnie nauczy� czego� o warzeniu mikstur?";
};

FUNC INT DIA_CorKalom_NAUKA_ASK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CorKalom_NAUKA_ASK_Info()
{
    AI_Output (other, self ,"DIA_CorKalom_NAUKA_ASK_15_01"); //Czy mo�esz mnie nauczy� czego� o warzeniu mikstur?
    AI_Output (self, other ,"DIA_CorKalom_NAUKA_ASK_03_02"); //Dlaczego mia�bym ci� czegokolwiek nauczy�? W naszym Obozie panuj� pewna zasada - nauka jedynie dla cz�onk�w Bractwa.
    AI_Output (other, self ,"DIA_CorKalom_NAUKA_ASK_03_03"); //Mo�e par� bry�ek rudy zdo�a ci� przekona�?
    AI_Output (self, other ,"DIA_CorKalom_NAUKA_ASK_03_04"); //�ni�cy nie sprzyja chciwo�ci. Jednak�e nie obrazi�by si�, gdybym pobra� od wiernych nieco rudy, aby wesprze� jego �wi�tynie.
    AI_Output (self, other ,"DIA_CorKalom_NAUKA_ASK_03_05"); //Tak, to wydaje si� sensowne.
    AI_Output (other, self ,"DIA_CorKalom_NAUKA_ASK_15_06"); //Ile bry�ek rudy potrzebujesz?
    AI_Output (self, other ,"DIA_CorKalom_NAUKA_ASK_03_07"); //Sto pi��dziesi�t bry�ek rudy, a naucz� ci� warzy� r�ne mikstury. Co ty na to? 
    AI_Output (other, self ,"DIA_CorKalom_NAUKA_ASK_15_08"); //Przemy�l� to sobie.
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Cor Kalom nauczy mnie alchemii, je�eli zap�ac� mu 150 bry�ek rudy.");
};

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_KALOM_KnowsAlchemy2 (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 4;
   condition    = DIA_KALOM_KnowsAlchemy2_Condition;
   information  = DIA_KALOM_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_KALOM_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_KnowsInfo (hero, DIA_CorKalom_NAUKA_ASK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_KALOM_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_KALOM_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_KALOM_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_KALOM_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};



//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_KALOM_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 4;
   condition    = DIA_KALOM_KnowsAlchemy2_L2_Condition;
   information  = DIA_KALOM_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_KALOM_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_KnowsInfo (hero, DIA_CorKalom_NAUKA_ASK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_KALOM_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_KALOM_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget) >=360)
    {
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury, b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To, z czym b�dziesz mia� do czynienia, to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_KALOM_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_KALOM_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_KALOM_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

//========================================
//-----------------> HelpMePliz
//========================================

INSTANCE DIA_CorKalom_HelpMePliz (C_INFO)
{
   npc          = GUR_1201_CorKalom;
   nr           = 1;
   condition    = DIA_CorKalom_HelpMePliz_Condition;
   information  = DIA_CorKalom_HelpMePliz_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� odtrutki na jad jaszczura!";
};

FUNC INT DIA_CorKalom_HelpMePliz_Condition()
{
    if (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CorKalom_HelpMePliz_Info()
{
    AI_Output (other, self ,"DIA_CorKalom_HelpMePliz_15_01"); //Potrzebuj� odtrutki na jad jaszczura!
    AI_Output (self, other ,"DIA_CorKalom_HelpMePliz_03_02"); //Co? Nie mam czasu na jakie� bzdury. 
    AI_Output (self, other ,"DIA_CorKalom_HelpMePliz_03_03"); //Mam inne sprawy na g�owie. 
    AI_Output (self, other ,"DIA_CorKalom_HelpMePliz_03_04"); //Odejd�!
    B_LogEntry                     (CH2_SickHunter,"Cor Kalom nie jest skory do pomocy. Po tym starym dziadzie mo�na by�o si� tego spodziewa�.");
};