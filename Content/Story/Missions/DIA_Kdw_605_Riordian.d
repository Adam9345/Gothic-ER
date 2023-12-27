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
//***************************************************************************//Bist du der Wassermagier, der die Tränke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysy³a mnie Saturas.";
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
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Przysy³a mnie Saturas.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ach, chodŸ bli¿ej. Ju¿ mi o wszystkim doniesiono.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Proszê, weŸ to. Znajdziesz tu najró¿niejsze wywary.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Teraz mo¿esz ju¿ ruszaæ na poszukiwanie kamieni ogniskuj¹cych. Jesteœ nasz¹ jedyn¹ nadziej¹.

	CreateInvItems (self, ItFo_Potion_Health_01,	5); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,5); //Notwendig für die Ausschrift "20 Items übergeben", wird sofort ausgeglichen
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
	description = "Saturas powiedzia³, ¿e masz dla mnie nagrodê.";
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
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas powiedzia³, ¿e masz dla mnie nagrodê.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ach, chodŸ, chodŸ!
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Nasz przywódca opowiedzia³ mi o twoich bohaterskich czynach.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Ca³y nasz Obóz... Ach, co ja mówiê - ca³a KOLONIA powinna ci byæ dozgonnie wdziêczna.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Przyjmij tê skromn¹ nagrodê w uznaniu twoich zas³ug.

	CreateInvItems		(self, ItFo_Potion_Health_02,		5);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 5);//Notwenidg für Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		5);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			3);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,	"Riordian by³ jak zwykle uprzejmy. Otrzyma³em od niego zapas magicznych wywarów. To niezwykle cenny i przydatny dar.");
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
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Cieszê siê, ¿e ju¿ jesteœ. Czeka³em na ciebie!
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
	description = "Czeka³eœ? Jak to?";
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
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Czeka³eœ? Jak to?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn prosi³ mnie, ¿ebym ciê do niego przys³a³, gdy tylko siê zjawisz.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //O co chodzi?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Ma plan, jak odzyskaæ zajêt¹ kopalniê.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Czy wci¹¿ pilnuje wejœcia do kopalni?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Tak! Proszê, zajrzyj do niego mo¿liwie jak najszybciej!
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
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Cieszê siê, ¿e do nas do³¹czy³eœ.
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
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Jeœli jesteœ ranny, mogê ci pomóc.
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
	description		= "Jestem ranny. Mo¿esz coœ na to poradziæ?"; 
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
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo¿esz coœ na to poradziæ?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s³owy przywo³ujê uzdrawiaj¹c¹ si³ê! Niech twe cia³o i duch znów zaznaj¹ spokoju!
	 
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
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgadujê, ¿e szukasz magicznego napoju?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, jeden z Magów Wody, sprzedaje magiczne wywary. Znajdê go w laboratorium alchemicznym, na górnym poziomie.");
	
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
	description		= "Poka¿ mi co masz do zaoferowania."; 
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
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Poka¿ mi co masz do zaoferowania.
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
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_riordian_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
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
    AI_Output (other, self ,"DIA_riordian_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury, bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To z czym bêdziesz mia³ do czynienia to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_riordian_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_riordian_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
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
//          DZIWNA PRZYPAD£OŒÆ
//---------------------------------------------------------------------
instance Info_Riordian_Fiolka_Krwi (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_Fiolka_Krwi_Condition;
	information	= Info_Riordian_Fiolka_Krwi_Info;
	permanent	= 0;
	important 	= 0;
	description = "Witaj. Co z fiolk¹ krwi?";
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
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_01"); //Witaj. Co z fiolk¹ krwi?
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_02"); //Nie spodziewa³em siê tego co uda³o mi siê odkryæ. Niestety to dla twojego przyjaciela bardzo z³a wiadomoœæ...
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_03"); //Mianowicie?
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_04"); //To Basileus Vultaris niezwykle toksyczny grzyb. Niemal ju¿ niespotykany, trucizna w czystej postaci.
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_05"); //Ale ten cz³owiek wci¹¿ ¿yje.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_06"); //Nie powiedzia³eœ mi kim on jest.	
	AI_Output (hero, self,"Info_Riordian_Fiolka_Krwi_15_07"); //To Kopacz ze Starej kopalni.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_08"); //Podejrzewam, ¿e jak wielu kopaczy nie wylewa za ko³nierz. W tym konkretnym przypadku ocali³o mu to ¿ycie.
	AI_Output (self, hero,"Info_Riordian_Fiolka_Krwi_14_09"); //Alkohol os³abi³ dzia³anie toksyny ale oczywiœcie jej nie wyeliminowa³. Zapewne ten cz³owiek jest ju¿ w stanie agonii. Zosta³o mu maksymalnie parê dni ¿ycia.
    
  Info_ClearChoices (Info_Riordian_Fiolka_Krwi);
  Info_AddChoice    (Info_Riordian_Fiolka_Krwi,"Da siê mu jakoœ pomóæ?",DIA_Riordian_Pomoc);



};

FUNC VOID DIA_Riordian_Pomoc()
{
	AI_Output (other,self ,"DIA_Riordian_Pomoc_15_00");  //Da siê mu jakoœ pomóæ?
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_01");  //Eh... Cronos za ciebie porêczy³ wiêc ci pomogê. Przygotowa³em listê sk³adników. Musisz je jak najszybciej zebraæ i mi dostarczyæ.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_02");  //Znajdziesz je u kupców a czêœæ szukaj¹c w terenie. Z jednym wyj¹tkiem...
	//CreateInvItem (KDW_605_Riordian, ItWr_Riordian_DP);
    B_GiveInvItems (self,other, ItWr_Riordian_DP, 1);
    AI_Output (other,self ,"DIA_Riordian_Pomoc_15_03");  //Tak?
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_04");  //Chodzi o nasiona Rombowca Modrego. S¹ unikalne i jedynym cz³owiekiem, które powinien je mieæ jest szalony Baal Netbek z Bractwa.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_05");  //Ale jeœli chcesz ocaliæ tamtego Kopacza...
    AI_Output (other,self ,"DIA_Riordian_Pomoc_15_06");  //Wyruszam.
	AI_Output (self ,other,"DIA_Riordian_Pomoc_11_07");  //I pamiêtaj... Masz niezwykle ma³o czasu.
	
   B_LogEntry               (DziwnaPrzypadlosc,"Riordian mia³ dla mnie bardzo niepokoj¹ce wieœci. Okazuje siê, ¿e Richard zjad³ silnie toksycznego grzyba. Wkrótce umrze, zosta³o mu tylko kilka dni na podanie antidotum. Muszê zebraæ podane przez Riordiana sk³adniki i dostarczyæ je jak najszybciej. Nale¿¹ do nich nasiona rombowca modrego, które ma ponoæ Baal Netbek.");
	
	
	AI_StopProcessInfos	     (self); 
};


//---------------------------------------------------------------------
//          DZIWNA PRZYPAD£OŒÆ
//---------------------------------------------------------------------
var int Riordian_DP_Day;
instance Info_Riordian_DP_Rzeczy (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_DP_Rzeczy_Condition;
	information	= Info_Riordian_DP_Rzeczy_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam rzeczy, które chcia³eœ.";
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
	AI_Output (hero, self,"Info_Riordian_DP_Rzeczy_15_01"); //Mam rzeczy, które chcia³eœ.
	AI_Output (self, hero,"Info_Riordian_DP_Rzeczy_14_02"); //Znakomicie, teraz pójdê do swego laboratorium i przyrz¹dzê antidotum. Jutro powinno byæ gotowe. 
	AI_Output (hero, self,"Info_Riordian_DP_Rzeczy_15_03"); //Bêdê czeka³.
	B_GiveInvItems (other,self, ItMi_Netbek_Seed, 1);
	B_GiveInvItems (other,self, ItFo_Plants_Velayis_01, 2);
	B_GiveInvItems (other,self, ItAt_Bloodfly_01, 1);
	B_GiveInvItems (other,self, ItMi_Alchemy_Alcohol_01, 1);
	B_GiveInvItems (other,self, ItFo_Honey, 1);
	Riordian_DP_Day = Wld_GetDay();
    B_LogEntry               (DziwnaPrzypadlosc,"Wróci³em do Riordiana ze sk³adnikami. Teraz potrzebuje on jednego dnia na przygotowanie antidotum.");
	
};




//---------------------------------------------------------------------
//          DZIWNA PRZYPAD£OŒÆ
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
	AI_Output (self, hero,"Info_Riordian_DP_Lekarstwo_14_02"); //Oto ono. PêdŸ z nim do tego kopacza. Teraz ka¿da minuta siê liczy by go uratowaæ.
	AI_Output (self,hero ,"Info_Riordian_DP_Lekarstwo_15_03"); //Ja tymczasem wracam do swoich obowi¹zków.
    AI_Output (hero, self,"Info_Riordian_DP_Lekarstwo_15_04"); //Do zobaczenia Magu! I dziêkuje za pomoc!
	B_StartOtherRoutine(KDW_605_Riordian,"Start");
	B_LogEntry               (DziwnaPrzypadlosc,"Zabra³em gotowe antidotum od Riordiana. Teraz pêdzê do Richarda z lekarstwem. Oby jeszcze ¿y³.");
	
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
   description	= "Czy jest coœ w czym móg³bym ci pomóc?";
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
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_01"); //Czy jest coœ w czym móg³bym ci pomóc?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_02"); //A wiesz, ¿e tak! Chocia¿ bêdzie to wymaga³o cierpliwoœci i wysi³ku. Ale jeœli siê na to zdecydujesz, nagroda ciê nie ominie. 
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_03"); //Co to za zadanie?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_04"); //Có¿, prowadzê eksperyment nad pozyskaniem substancji potrzebnej do sta³ego zwiêkszenia si³y magicznej.
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_05"); //Lecz brakuje mi ostatniego sk³adnika.
    AI_Output (other, self ,"DIA_Riordian_Crystal_Heart_15_06"); //Jaki to sk³adnik?
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_07"); //Serce kryszta³owego golema.
    AI_Output (self, other ,"DIA_Riordian_Crystal_Heart_03_08"); //Gdybyœ pokona³ tak¹ istotê i pozyska³ dla mnie jej serce to znacz¹co zbli¿y³bym siê do stworzenia tego eliksiru.
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
   description	= "Przyniosê ci to serce...";
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
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_01"); //Przyniosê ci serce kryszta³owego golema.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_02"); //Wspaniale. Wiedzia³em, ¿e mo¿na na ciebie liczyæ.
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_03"); //Tylko gdzie go szukaæ?
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_04"); //Minera³y przeniknê³y do nadstruktury tych stworów.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_05"); //Musisz szukaæ ich w pobli¿u z³ó¿ rzadkich minera³ów. W kolonii znajdziesz parê takich.
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_06"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Riordian_SKG_OK_03_07"); //Powodzenia przyjacielu. 
    AI_Output (other, self ,"DIA_Riordian_SKG_OK_15_08"); //Zdobyæ serce potwora... Czy¿ to nie brzmi dwuznacznie... (pod nosem)
	Log_CreateTopic		(Sercekrysztalowegogolema,	LOG_MISSION);
	Log_SetTopicStatus	(Sercekrysztalowegogolema,	LOG_RUNNING);
	B_LogEntry          (Sercekrysztalowegogolema,"Riordian poprosi³ mnie o zorganizowanie serca kryszta³owego golema. Powinienem go szukaæ w pobli¿u z³ó¿ rzadkich minera³ów.");
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
   description	= "Mam serce kryszta³owego golema.";
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
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_01"); //Mam serce kryszta³owego golema.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_02"); //Doskonale.
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_03"); //Oto ono.
    B_GiveInvItems (other,self, ItAt_CrystalGolem_Heart, 1);
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_04"); //Wykona³eœ misje pomyœlnie. Masz tu obiecan¹ nagrodê...
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_05"); //Dziêki.
    CreateInvItems (self, ItFo_Potion_Mana_Perma_02, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_02, 2);
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_06"); //Jak wra¿enia po spotkaniu z t¹ magiczn¹ istot¹?
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_07"); //Randka udana. Ale tylko dla mnie.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_08"); //To widzê hah... Teraz mogê zaj¹æ siê prac¹ nad magiczn¹ substancj¹ o, której ci mówi³em.
    AI_Output (other, self ,"DIA_Riordian_SKG_END_15_09"); //Mi³ej pracy.
    AI_Output (self, other ,"DIA_Riordian_SKG_END_03_10"); //Do zobaczenia.
	B_LogEntry               (Sercekrysztalowegogolema,"Zdoby³em dla Riordiana serce kryszta³owego golema. Ten wynagrodzi³ mnie nale¿ycie ze wykonan¹ pracê.");
	Log_SetTopicStatus	(Sercekrysztalowegogolema,	LOG_SUCCESS);
	B_GiveXP(600);
    AI_StopProcessInfos	(self);
};


