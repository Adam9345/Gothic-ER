// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tr�nke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysy�a mnie Saturas.";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Przysy�a mnie Saturas.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ach, chod� bli�ej. Ju� mi o wszystkim doniesiono.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Prosz�, we� to. Znajdziesz tu najr�niejsze wywary.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Teraz mo�esz ju� rusza� na poszukiwanie kamieni ogniskuj�cych. Jeste� nasz� jedyn� nadziej�.

	CreateInvItems (self, ItFo_Potion_Health_01,	5); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,5); //Notwendig f�r die Ausschrift "20 Items �bergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	5);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		2);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	//balans
	//CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	//CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas powiedzia�, �e masz dla mnie nagrod�.";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas powiedzia�, �e masz dla mnie nagrod�.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ach, chod�, chod�!
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Nasz przyw�dca opowiedzia� mi o twoich bohaterskich czynach.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Ca�y nasz Ob�z... Ach, co ja m�wi� - ca�a KOLONIA powinna ci by� dozgonnie wdzi�czna.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Przyjmij t� skromn� nagrod� w uznaniu twoich zas�ug.

	CreateInvItems		(self, ItFo_Potion_Health_02,		5);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 5);//Notwenidg f�r Ausschrift "20 Items �bergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		5);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			3);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,	"Riordian by� jak zwykle uprzejmy. Otrzyma�em od niego zapas magicznych wywar�w. To niezwykle cenny i przydatny dar.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Ciesz� si�, �e ju� jeste�. Czeka�em na ciebie!
};




//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czeka�e�? Jak to?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Czeka�e�? Jak to?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn prosi� mnie, �ebym ci� do niego przys�a�, gdy tylko si� zjawisz.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //O co chodzi?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Ma plan, jak odzyska� zaj�t� kopalni�.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Czy wci�� pilnuje wej�cia do kopalni?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Tak! Prosz�, zajrzyj do niego mo�liwie jak najszybciej!
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Ciesz� si�, �e do nas do��czy�e�.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Je�li jeste� ranny, mog� ci pom�c.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo�esz co� na to poradzi�?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo�esz co� na to poradzi�?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s�owy przywo�uj� uzdrawiaj�c� si��! Niech twe cia�o i duch zn�w zaznaj� spokoju!
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Witaj, magu!
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgaduj�, �e szukasz magicznego napoju?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, jeden z Mag�w Wody, sprzedaje magiczne wywary. Znajd� go w laboratorium alchemicznym, na g�rnym poziomie.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka� mi co masz do zaoferowania."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Poka� mi co masz do zaoferowania.
	B_ClearTreaderAmmo(self);
};  
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_riordian_KnowsAlchemy2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_riordian_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_riordian_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_riordian_KnowsAlchemy2.permanent = true;
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

INSTANCE DIA_riordian_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 4;
   condition    = DIA_riordian_KnowsAlchemy2_L2_Condition;
   information  = DIA_riordian_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_riordian_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_GetTrueGuild    (hero) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_riordian_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury, b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To z czym b�dziesz mia� do czynienia to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_riordian_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_riordian_KnowsAlchemy2_l2.permanent = true;
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

//---------------------------------------------------------------------------------------------1.6.1------------------------------------------------------------------------


//---------------------------------------------------------------------
//          DZIWNA PRZYPAD�O��
//---------------------------------------------------------------------
instance Info_Riordian_Fiolka_Krwi (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_Fiolka_Krwi_Condition;
	information	= Info_Riordian_Fiolka_Krwi_Info;
	permanent	= 0;
	important 	= 0;
	description = "Witaj. Co z fiolk� krwi?";
};

FUNC INT Info_Riordian_Fiolka_Krwi_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cronos_DP_RIORDIAN_Go))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_Fiolka_Krwi_Info()
{
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_01"); //Witaj. Co z fiolk� krwi?
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_02"); //Nie spodziewa�em si� tego co uda�o mi si� odkry�. Niestety to dla twojego przyjaciela bardzo z�a wiadomo��...
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_03"); //Mianowicie?
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_04"); //To Basileus Vultaris niezwykle toksyczny grzyb. Niemal ju� niespotykany, trucizna w czystej postaci.
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_05"); //Ale ten cz�owiek wci�� �yje.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_06"); //Nie powiedzia�e� mi kim on jest.	
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_07"); //To Kopacz ze Starej kopalni.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_08"); //Podejrzewam, �e jak wielu kopaczy nie wylewa za ko�nierz. W tym konkretnym przypadku ocali�o mu to �ycie.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_09"); //Alkohol os�abi� dzia�anie toksyny ale oczywi�cie jej nie wyeliminowa�. Zapewne ten cz�owiek jest ju� w stanie agonii. Zosta�o mu maksymalnie par� dni �ycia.
    
  Info_ClearChoices (Info_Riordian_Fiolka_Krwi);
  Info_AddChoice    (Info_Riordian_Fiolka_Krwi,"Da si� mu jako� pom��?",DIA_Riordian_Pomoc);



};

FUNC VOID DIA_Riordian_Pomoc()
{
	AI_Output (other,self ,"DIA_Riordian_Pomoc_15_00");  //Da si� mu jako� pom��?
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_01");  //Eh... Cronos za ciebie por�czy� wi�c ci pomog�. Przygotowa�em list� sk�adnik�w. Musisz je jak najszybciej zebra� i mi dostarczy�.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_02");  //Znajdziesz je u kupc�w a cz�� szukaj�c w terenie. Z jednym wyj�tkiem...
	//CreateInvItem (KDW_605_Riordian, ItWr_Riordian_DP);
    B_GiveInvItems (self,other, ItWr_Riordian_DP, 1);
    AI_Output (other,self ,"DIA_Riordian_Pomoc_15_03");  //Tak?
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_04");  //Chodzi o nasiona Rombowca Modrego. S� unikalne i jedynym cz�owiekiem, kt�re powinien je mie� jest szalony Baal Netbek z Bractwa.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_05");  //Ale je�li chcesz ocali� tamtego Kopacza...
    AI_Output (other,self ,"DIA_Riordian_Pomoc_15_06");  //Wyruszam.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_07");  //I pami�taj... Masz niezwykle ma�o czasu.
	
   B_LogEntry               (DziwnaPrzypadlosc,"Riordian mia� dla mnie bardzo niepokoj�ce wie�ci. Okazuje si�, �e Richard zjad� silnie toksycznego grzyba. Wkr�tce umrze, zosta�o mu tylko kilka dni na podanie antidotum. Musz� zebra� podane przez Riordiana sk�adniki i dostarczy� je jak najszybciej. Nale�� do nich nasiona rombowca modrego, kt�re ma pono� Baal Netbek.");
	
	
	AI_StopProcessInfos	     (self); 
};


//---------------------------------------------------------------------
//          DZIWNA PRZYPAD�O��
//---------------------------------------------------------------------
var int Riordian_DP_Day;
instance Info_Riordian_DP_Rzeczy (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_DP_Rzeczy_Condition;
	information	= Info_Riordian_DP_Rzeczy_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam rzeczy, kt�re chcia�e�.";
};

FUNC INT Info_Riordian_DP_Rzeczy_Condition()
{	

	if (Npc_KnowsInfo(hero,Info_Riordian_Fiolka_Krwi)) 
	&& (Npc_HasItems (other, ItMi_Netbek_Seed)        >=1) 
	&& (Npc_HasItems (other, ItFo_Plants_Velayis_01)  >=2) 
	&& (Npc_HasItems (other, ItAt_Bloodfly_01)        >=1)  
	&& (Npc_HasItems (other, ItMi_Alchemy_Alcohol_01) >=1)
    && (Npc_HasItems (other, ItFo_Honey)              >=1)
	
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_DP_Rzeczy_Info()
{
	AI_Output (hero, self,"Info_Riordian_DP_Rzeczy_15_01"); //Mam rzeczy, kt�re chcia�e�.
	AI_Output (self, hero,"Info_Riordian_DP_Rzeczy_14_02"); //Znakomicie, teraz p�jd� do swego laboratorium i przyrz�dz� antidotum. Jutro powinno by� gotowe. 
	AI_Output (hero, self,"Info_Riordian_DP_Rzeczy_15_03"); //B�d� czeka�.
	B_GiveInvItems (other,self, ItMi_Netbek_Seed, 1);
	B_GiveInvItems (other,self, ItFo_Plants_Velayis_01, 2);
	B_GiveInvItems (other,self, ItAt_Bloodfly_01, 1);
	B_GiveInvItems (other,self, ItMi_Alchemy_Alcohol_01, 1);
	B_GiveInvItems (other,self, ItFo_Honey, 1);
	Riordian_DP_Day = Wld_GetDay();
    B_LogEntry               (DziwnaPrzypadlosc,"Wr�ci�em do Riordiana ze sk�adnikami. Teraz potrzebuje on jednego dnia na przygotowanie antidotum.");
	
};




//---------------------------------------------------------------------
//          DZIWNA PRZYPAD�O��
//---------------------------------------------------------------------
instance Info_Riordian_DP_Lekarstwo (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_DP_Lekarstwo_Condition;
	information	= Info_Riordian_DP_Lekarstwo_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co z lekarstwem?";
};

FUNC INT Info_Riordian_DP_Lekarstwo_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_DP_Rzeczy))
	&& (Riordian_DP_Day != Wld_GetDay()) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_DP_Lekarstwo_Info()
{
	AI_Output (hero, self,"Info_Riordian_DP_Lekarstwo_15_01"); //Co z lekarstwem?
	//CreateInvItems	(self, ItMi_Dp_Antidotum, 1);
	B_GiveInvItems (self,other, ItMi_Dp_Antidotum, 1);
	AI_Output (self, hero,"Info_Riordian_DP_Lekarstwo_14_02"); //Oto ono. P�d� z nim do tego kopacza. Teraz ka�da minuta si� liczy by go uratowa�.
	AI_Output (self,hero ,"Info_Riordian_DP_Lekarstwo_15_03"); //Ja tymczasem wracam do swoich obowi�zk�w.
    AI_Output (hero, self,"Info_Riordian_DP_Lekarstwo_15_04"); //Do zobaczenia Magu! I dzi�kuje za pomoc!
	B_StartOtherRoutine(KDW_605_Riordian,"Start");
	B_LogEntry               (DziwnaPrzypadlosc,"Zabra�em gotowe antidotum od Riordiana. Teraz p�dz� do Richarda z lekarstwem. Oby jeszcze �y�.");
	
};









































//========================================
//-----------------> Crystal_Heart
//========================================

INSTANCE DIA_Riordian_Crystal_Heart (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 1;
   condition    = DIA_Riordian_Crystal_Heart_Condition;
   information  = DIA_Riordian_Crystal_Heart_Info;
   permanent	= FALSE;
   description	= "Czy jest co� w czym m�g�bym ci pom�c?";
};

FUNC INT DIA_Riordian_Crystal_Heart_Condition()
{
if (Kapitel == 4)
&& (Npc_GetTrueGuild(hero) == GIL_KDW)
{
    return TRUE;
};
};
FUNC VOID DIA_Riordian_Crystal_Heart_Info()
{
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_01"); //Czy jest co� w czym m�g�bym ci pom�c?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_02"); //A wiesz, �e tak! Chocia� b�dzie to wymaga�o cierpliwo�ci i wysi�ku. Ale je�li si� na to zdecydujesz, nagroda ci� nie ominie. 
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_03"); //Co to za zadanie?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_04"); //C�, prowadz� eksperyment nad pozyskaniem substancji potrzebnej do sta�ego zwi�kszenia si�y magicznej.
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_05"); //Lecz brakuje mi ostatniego sk�adnika.
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_06"); //Jaki to sk�adnik?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_07"); //Serce kryszta�owego golema.
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_08"); //Gdyby� pokona� tak� istot� i pozyska� dla mnie jej serce to znacz�co zbli�y�bym si� do stworzenia tego eliksiru.
};

//========================================
//-----------------> SKG_OK
//========================================

INSTANCE DIA_Riordian_SKG_OK (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 2;
   condition    = DIA_Riordian_SKG_OK_Condition;
   information  = DIA_Riordian_SKG_OK_Info;
   permanent	= FALSE;
   description	= "Przynios� ci to serce...";
};

FUNC INT DIA_Riordian_SKG_OK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Riordian_Crystal_Heart))
{
    return TRUE;
};
};
FUNC VOID DIA_Riordian_SKG_OK_Info()
{
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_01"); //Przynios� ci serce kryszta�owego golema.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_02"); //Wspaniale. Wiedzia�em, �e mo�na na ciebie liczy�.
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_03"); //Tylko gdzie go szuka�?
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_04"); //Minera�y przenikn�y do nadstruktury tych stwor�w.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_05"); //Musisz szuka� ich w pobli�u z�� rzadkich minera��w. W kolonii znajdziesz par� takich.
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_06"); //W porz�dku.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_07"); //Powodzenia przyjacielu. 
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_08"); //Zdoby� serce potwora... Czy� to nie brzmi dwuznacznie... (pod nosem)
	Log_CreateTopic		(Sercekrysztalowegogolema,	LOG_MISSION);
	Log_SetTopicStatus	(Sercekrysztalowegogolema,	LOG_RUNNING);
	B_LogEntry          (Sercekrysztalowegogolema,"Riordian poprosi� mnie o zorganizowanie serca kryszta�owego golema. Powinienem go szuka� w pobli�u z�� rzadkich minera��w.");
};

//========================================
//-----------------> SKG_END
//========================================

INSTANCE DIA_Riordian_SKG_END (C_INFO)
{
   npc          = KDW_605_Riordian;
   nr           = 3;
   condition    = DIA_Riordian_SKG_END_Condition;
   information  = DIA_Riordian_SKG_END_Info;
   permanent	= FALSE;
   description	= "Mam serce kryszta�owego golema.";
};

FUNC INT DIA_Riordian_SKG_END_Condition()
{
if (Npc_HasItems (other, ItAt_CrystalGolem_Heart) >=1)
&& (Npc_KnowsInfo(hero,DIA_Riordian_SKG_OK))
{
    return TRUE;
};
};
FUNC VOID DIA_Riordian_SKG_END_Info()
{
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_01"); //Mam serce kryszta�owego golema.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_02"); //Doskonale.
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_03"); //Oto ono.
    B_GiveInvItems (other,self, ItAt_CrystalGolem_Heart, 1);
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_04"); //Wykona�e� misje pomy�lnie. Masz tu obiecan� nagrod�...
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_05"); //Dzi�ki.
    CreateInvItems (self, ItFo_Potion_Mana_Perma_02, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_02, 2);
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_06"); //Jak wra�enia po spotkaniu z t� magiczn� istot�?
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_07"); //Randka udana. Ale tylko dla mnie.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_08"); //To widz� hah... Teraz mog� zaj�� si� prac� nad magiczn� substancj� o, kt�rej ci m�wi�em.
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_09"); //Mi�ej pracy.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_10"); //Do zobaczenia.
	B_LogEntry               (Sercekrysztalowegogolema,"Zdoby�em dla Riordiana serce kryszta�owego golema. Ten wynagrodzi� mnie nale�ycie ze wykonan� prac�.");
	Log_SetTopicStatus	(Sercekrysztalowegogolema,	LOG_SUCCESS);
	B_GiveXP(600);
    AI_StopProcessInfos	(self);
};


