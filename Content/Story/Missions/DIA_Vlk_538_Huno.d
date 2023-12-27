// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia� 1 
// Dialogi podstawowe
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widz�, �e znasz si� na swoim fachu.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Widz�, �e znasz si� na swoim fachu.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Jeszcze nikt nie mia� powodu do narzekania.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //I lepiej, �eby nikt tego nie robi�! Ka�dy dure� potrzebuje miecza, i to w�a�nie ode mnie dostaj�!
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak d�ugo zajmuje wykucie jednego miecza?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak d�ugo zajmuje wykucie jednego miecza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //To zale�y. Je�li chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Oczywi�cie pod warunkiem, �e jestem odpowiednio zmotywowany... Finansowo.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Oczywi�cie �wiry pokroju �wistaka musz� czeka� na swoje cacka nieco d�u�ej.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Dlaczego? Czy�by �wistak za ma�o ci zap�aci�?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Nie, wr�cz przeciwnie. Za sw�j ostatni miecz da� mi 150 bry�ek rudy.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywi�cie kosztuje!
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hej, ciekawski z ciebie facet, kolego!
	//B_LogEntry (CH1_JoinOC,"Huno wyrabia miecze dla cz�onk�w Obozu. Podobno �wistak zam�wi� u niego specjalne ostrze.");
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak stoisz z prac�, kowalu?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Jak stoisz z prac�, kowalu?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //A co ci� to obchodzi?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //By� mo�e mam dla ciebie zam�wienie.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Czy�by? A c� takiego, je�li wolno spyta�?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Jeszcze si� zastanowi�.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Wr��, jak naprawd� b�dziesz czego� potrzebowa�. P�ki co - nie zawracaj mi g�owy.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ch�tnie spr�bowa�bym si� jako kowal.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)// && (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) == 0) && (Npc_HasItems (hero, ItMiNugget)>=150)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Ch�tnie spr�bowa�bym si� jako kowal.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Tylko nie wyobra�aj sobie, �e tak �atwo jest wyku� solidny miecz! Je�li chcesz mog� ci� nauczy� konkretnie czego� o kowalstwie.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co powinienem zrobi�?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobra, we� stal i rozgrzej j� nad ogniem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potem rozbij j� na kowadle.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim. To wszystko je�li chodzi o wykucie prostego miecza.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumiem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Oczywi�cie do tego wszystkiego potrzeba odpowiedniego wyposa�enia. M�g�bym ci je sprzeda�, je�li chcesz.
	//Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	//PrintScreen	("Nowa umiej�tno��: Kowalstwo", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	//B_giveXP (150);
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"U Huno kupi� narz�dzia kowalskie. Znajd� go w Zewn�trznym Pier�cieniu."); 
	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chcia�bym kupi� narz�dzia kowalskie!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chcia�bym kupi� narz�dzia kowalskie!
B_ClearTreaderAmmo(self);
	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
	if	(Npc_HasItems(self,Gold01			) < 10)		{	CreateInvItems(self,Gold01,				10);};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia� 1 
// Ruda dla Togarda
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
//	Magic Ore
// **************************************************
INSTANCE DIA_Huno_FakeMagicOre (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_FakeMagicOre_Condition;
	information		= DIA_Huno_FakeMagicOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebuj� czego�, co przypomina czarn� rud�.";
};

FUNC INT DIA_Huno_FakeMagicOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Snaf_LookingForWorkers) && MIS_ZmianaLorenza == LOG_RUNNING
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_FakeMagicOre_Info()
{
	AI_Output (other,self,"DIA_Huno_FakeMagicOre_15_00"); //Potrzebuj� czego�, co przypomina czarn� rud�.
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_01"); //Po co ci co� takiego?
	AI_Output (other,self,"DIA_Huno_FakeMagicOre_15_02"); //Powiedzmy, �e chc� zrobi� koledze dowcip. Umiesz co� takiego zrobi�?
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_03"); //No dobra, b�d� si� musia� z tym pobawi�, ale tylko za CZTERDZIE��I bry�ek rudy, jasne?
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_04"); //A, i jeszcze jedno! Efekt nie b�dzie trwa�y. Po jakim� czasie wyjdzie na jaw, �e to �art. Je�li ten tw�j kole�ka zacznie za bardzo d�uba�...
	AI_Output (self,other,"DIA_Huno_FakeMagicOre_09_05"); //... to mo�e si� dokopa� do prawdy. Miej to na uwadze. 
	B_LogEntry               (CH1_ZmianaLorenza,"Zapyta�em Huno, czy m�g�by stworzy� co� co b�dzie przypomina� czarn� rud�. Zrobi to za czterdzie�ci bry�ek rudy. To pozwoli mi przekona� Togarda do przy��czania si� do organizowanej zmiany do Kopalni.");	
};

// **************************************************
//	Fuck Ore Go Sex
// **************************************************
INSTANCE DIA_Huno_BuyFakeOre (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BuyFakeOre_Condition;
	information		= DIA_Huno_BuyFakeOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przygotuj dla mnie t� imitacj� czarnej rudy.";
};

FUNC INT DIA_Huno_BuyFakeOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_FakeMagicOre) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (hero,itminugget) >= 40
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BuyFakeOre_Info()
{
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_00"); //Przygotuj dla mnie t� imitacj� czarnej rudy.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_01"); //Masz, tylko pami�taj to, o czym ci m�wi�em.
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_02"); //Dzi�ki, interesy z tob� to przyjemno��.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_03"); //Nie wierz�, �e kto� w tym miejscu, gdzie ka�da bry�ka jest na wag� z�ota wydaje 40 sztuk na g�upi dowcip.
	AI_Output (other,self,"DIA_Huno_BuyFakeOre_15_04"); //Spokojnie, zwr�ci mi si�.
	AI_Output (self,other,"DIA_Huno_BuyFakeOre_09_05"); //'Zaufaj mi, wiem co robi�' - znam to. Powodzenia.
	B_LogEntry               (CH1_ZmianaLorenza,"Dosta�em od Huno imitacj� czarnej rudy. Musz� j� teraz tylko pokaza� Togardowi.");
	B_GiveInvItems (other, self, itminugget,40);
	CreateInvItems (self,itmi_Fakeblackore,1);
	B_GiveInvItems (self,hero,itmi_Fakeblackore,1);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia� 1 
// Wykucie miecza dla �wistaka (tymczasowo usuni�te) #Kowalstwo
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> OstrzeWhistelra
//========================================

INSTANCE DIA_Huno_OstrzeWhistelra (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_OstrzeWhistelra_Condition;
   information  = DIA_Huno_OstrzeWhistelra_Info;
   permanent	= FALSE;
   description	= "Sprzeda�e� ju� ostrze �wistakowi?";
};

FUNC INT DIA_Huno_OstrzeWhistelra_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_HowLong))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_OstrzeWhistelra_Info()
{
    AI_Output (other, self ,"DIA_Huno_OstrzeWhistelra_15_01"); //Sprzeda�e� ju� ostrze �wistakowi?
    AI_Output (self, other ,"DIA_Huno_OstrzeWhistelra_03_02"); //Nie. Ostatnio by� u mnie Fisk i zaproponowa�, �e b�dzie moim po�rednikiem. Odda�em mu miecz za 80 bry�ek rudy.
    AI_Output (self, other ,"DIA_Huno_OstrzeWhistelra_03_03"); //W sumie... dlaczego nie? Mam spok�j. Dosta�em rud� i nie musz� si� ugania� za klientem.
B_LogEntry (CH1_JoinOC,"Huno sprzeda� ostrze dla �wistaka Fiskowi.");
};

//========================================
//-----------------> PlanNaMiecz
//========================================

INSTANCE DIA_Huno_PlanNaMiecz (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 2;
   condition    = DIA_Huno_PlanNaMiecz_Condition;
   information  = DIA_Huno_PlanNaMiecz_Info;
   permanent	= FALSE;
   description	= "Czy m�g�by� sprzeda� plan tego ostrza?";
};

FUNC INT DIA_Huno_PlanNaMiecz_Condition()
{
    if (Whistler_BuyMySword == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Huno_OstrzeWhistelra))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_PlanNaMiecz_Info()
{
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_01"); //Czy m�g�by� sprzeda� plan tego ostrza?
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_02"); //W sumie nie powinienem tego robi�. To s� moje tajemnice kowalskie. No, ale dla ciebie zrobi� wyj�tek. 
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_03"); //Za 100 bry�ek rudy sprzedam ci plan. 
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_04"); //Fiskowi sprzeda�e� miecz za 80 bry�ek...
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_05"); //Ju� ci m�wi�em, �e to s� moje tajemnice kowalskie.
    AI_Output (other, self ,"DIA_Huno_PlanNaMiecz_15_06"); //Przemy�l� to...
    AI_Output (self, other ,"DIA_Huno_PlanNaMiecz_03_07"); //Za dodatkowe 10 bry�ek rudy sprzedam ci kosztowno�ci, kt�re s� potrzebne do wykucia tego miecza.
    B_LogEntry                     (CH1_JoinOC,"Huno za 100 bry�ek rudy sprzeda mi plan na miecz dla �wistaka. Za dodatkowe 10 bry�ek dostan� kosztowno�ci, kt�re przydadz� si� przy produkcji.");
};

//========================================
//-----------------> SellPlan
//========================================

INSTANCE DIA_Huno_SellPlan (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 3;
   condition    = DIA_Huno_SellPlan_Condition;
   information  = DIA_Huno_SellPlan_Info;
   permanent	= FALSE;
   description	= "Sprzedaj mi plan.";
};

FUNC INT DIA_Huno_SellPlan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_PlanNaMiecz))
    && (Whistler_BuyMySword == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_SellPlan_Info()
{
    AI_Output (other, self ,"DIA_Huno_SellPlan_15_01"); //Sprzedaj mi plan.
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
        AI_Output (self, other ,"DIA_Huno_SellPlan_03_02"); //Jasne. Jest tw�j.
        CreateInvItems (self, WhistlerSwordPlan, 1);
        B_GiveInvItems (self, other, WhistlerSwordPlan, 1);
        B_GiveInvItems (other, self, ItMiNugget, 100);
		DIA_Huno_SellPlan.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Huno_SellPlan_03_03"); //Nie masz rudy.
        DIA_Huno_SellPlan.permanent = true;
    };
};

//========================================
//-----------------> SellGold
//========================================

INSTANCE DIA_Huno_SellGold (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 4;
   condition    = DIA_Huno_SellGold_Condition;
   information  = DIA_Huno_SellGold_Info;
   permanent	= FALSE;
   description	= "Sprzedaj mi kosztowno�ci.";
};

FUNC INT DIA_Huno_SellGold_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_PlanNaMiecz))
    && (WhistlerSwordPlan == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_SellGold_Info()
{
    AI_Output (other, self ,"DIA_Huno_SellGold_15_01"); //Sprzedaj mi kosztowno�ci.
    if (Npc_HasItems (hero, ItMiNugget)>=10)
    {
        AI_Output (self, other ,"DIA_Huno_SellGold_03_02"); //Masz tu 3 bry�ki z�ota.
        AI_Output (other, self ,"DIA_Huno_SellGold_15_03"); //A to przypadkiem nie mia�y by� kosztowno�ci?
        AI_Output (self, other ,"DIA_Huno_SellGold_03_04"); //Za gotowe ornamenty musia�by� mi zap�aci� pi�� razy tyle. Nawet nie wiesz, ile jest roboty z czym� takim.
        AI_Output (self, other ,"DIA_Huno_SellGold_03_05"); //Nie m�wi�c ju� o tym, �e zajmuje to cholernie du�o czasu.
		DIA_Huno_SellGold.permanent = false;
        AI_Output (other, self ,"DIA_Huno_SellGold_15_06"); //Dobra, dobra. Dotar�o.
        B_GiveInvItems (other, self, ItMiNugget, 10);
        CreateInvItems (self, Gold01, 3);
        B_GiveInvItems (self, other, Gold01, 3);
    }
    else
    {
        AI_Output (self, other ,"DIA_Huno_SellGold_03_07"); //Nie masz nawet 10 bry�ek rudy?
		DIA_Huno_SellGold.permanent = true;
    };
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia� 1 
// ZADANIE: Nowi palacze
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> JARAJ
//========================================
//edit by  
INSTANCE DIA_Huno_JARAJ (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_JARAJ_Condition;
   information  = DIA_Huno_JARAJ_Info;
   permanent	= FALSE;
   description	= "Zechcesz zapali�?";
};

FUNC INT DIA_Huno_JARAJ_Condition()
{
    if (MIS_Druggy == LOG_RUNNING)
    && (Npc_HasItems (other, RecruitJoint) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_JARAJ_Info()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_15_01"); //Zechcesz zapali�?
    AI_Output (self, other ,"DIA_Huno_JARAJ_03_02"); //Co? Ja... nie. Nie mog�. W przesz�o�ci du�o pali�em. Nie mog� do tego wraca�.

    Info_ClearChoices		(DIA_Huno_JARAJ);
    Info_AddChoice		(DIA_Huno_JARAJ, "Ca�y dzie� ci�ko pracujesz. Nale�y ci si� chwila wytchnienia.", DIA_Huno_JARAJ_PRZY_PRACY);
    Info_AddChoice		(DIA_Huno_JARAJ, "Spr�buj, to co� nowego.", DIA_Huno_JARAJ_Sprobuj);
    Info_AddChoice		(DIA_Huno_JARAJ, "Szkoda. W takim razie dam je komu� innemu.", DIA_Huno_JARAJ_NIE);
};

FUNC VOID DIA_Huno_JARAJ_PRZY_PRACY()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_01"); //Ca�y dzie� ci�ko pracujesz. Nale�y ci si� chwila wytchnienia.
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_02"); //Ta przekl�ta Kolonia potrafi doprowadzi� cz�owieka do sza�u. 
    AI_Output (other, self ,"DIA_Huno_JARAJ_PRZY_PRACY_15_03"); //Lepiej zapal, odstresuj si�... Czym si� przejmowa�?
    AI_Output (self, other ,"DIA_Huno_JARAJ_PRZY_PRACY_03_04"); //No dobra. Jednego sobie zapal�, ale tylko jednego.
    B_GiveInvItems (other, self, RecruitJoint, 1);
    AI_UseItem (self, RecruitJoint);
    AI_Output (self, other ,"DIA_Huno_JARAJ_PRZY_PRACY_03_05"); //Och... Od razu lepiej.
    B_LogEntry                     (CH1_Druggy,"Da�em Huno zapali� jednego skr�ta. Wypada�oby teraz da� mu co� innego.");
	Npc_ExchangeRoutine			(Vlk_538_Huno,"pali");
	Huno_drugs_level = 1;
    B_GiveXP (100);

    Info_ClearChoices		(DIA_Huno_JARAJ);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huno_JARAJ_Sprobuj()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_Sprobuj_15_01"); //Spr�buj, to co� nowego.
    AI_Output (self, other ,"DIA_Huno_JARAJ_Sprobuj_03_02"); //Nie. Dzi�kuj�. 
};

FUNC VOID DIA_Huno_JARAJ_NIE()
{
    AI_Output (other, self ,"DIA_Huno_JARAJ_NIE_15_01"); //Szkoda. W takim razie dam je komu� innemu.
    AI_Output (self, other ,"DIA_Huno_JARAJ_NIE_03_02"); //Tak b�dzie najlepiej.
    B_LogEntry                     (CH1_Druggy,"Nie mog�em tego zrobi�. Ten cz�owiek wyszed� z na�ogu i zacz�� w Kolonii nowe �ycie. Nie mog� mu go zniszczy�.");
    Info_ClearChoices		(DIA_Huno_JARAJ);
	Huno_drugs_level = 0;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Huno_HELLO2 (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 2;
   condition    = DIA_Huno_HELLO2_Condition;
   information  = DIA_Huno_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jeszcze jednego?";
};

FUNC INT DIA_Huno_HELLO2_Condition()
{
    if (Huno_drugs_level == 1)
    && (Npc_HasItems (other, ItMiJoint_1) >=1)
	 && (!Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Huno_HELLO2_15_01"); //Jeszcze jednego?
    AI_Output (self, other ,"DIA_Huno_HELLO2_03_02"); //A, tak. Ch�tnie.
    B_GiveInvItems (other, self, ItMiJoint_1, 1);
    B_LogEntry                     (CH1_Druggy,"Huno z ch�ci� zapali� drugiego skr�ta. ");
    AI_UseItem (self, itmijoint_1);
    AI_StopProcessInfos	(self);
    Huno_drugs_level = 2;
	Huno_drugs_day = wld_getday ();
};

//========================================
//-----------------> DAWAJ_SKRETA
//========================================

INSTANCE DIA_Huno_DAWAJ_SKRETA (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 3;
   condition    = DIA_Huno_DAWAJ_SKRETA_Condition;
   information  = DIA_Huno_DAWAJ_SKRETA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huno_DAWAJ_SKRETA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Huno_HELLO2))
    && (Huno_drugs_day != wld_getday ())
    && (MIS_Druggy == LOG_RUNNING)
    && (!Npc_KnowsInfo (hero, DIA_BaalTaran_HUNO_SYTUACJA)) && (Huno_drugs_level == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_DAWAJ_SKRETA_Info()
{
    AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_01"); //Daj mi jeszcze jednego Zielonego Nowicjusza. Szybko.
    if (Npc_HasItems (other, ItMiJoint_1) >=1)
    {
        AI_Output (other, self ,"DIA_Huno_DAWAJ_SKRETA_15_02"); //Trzymaj.
        AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_03"); //Dzi�ki.
        B_GiveInvItems (other, self, ItMiJoint_1, 1);
        AI_UseItem (self, itmijoint_1);
    }
    else
    {
        AI_Output (other, self ,"DIA_Huno_DAWAJ_SKRETA_15_04"); //Ju� nic nie mam.
        AI_Output (self, other ,"DIA_Huno_DAWAJ_SKRETA_03_05"); //Cholera, musz� i�� do Baal Tarana.
    };
    B_LogEntry                     (CH1_Druggy,"Nie�le. Skr�ty Baal Tarana szybko podzia�a�y na Huno. Wr�ci� do swoich na�og�w. Co� czuj�, �e �le zrobi�em.");
	Huno_drugs_level = 3;
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAGRODA_ZA_UCZCIWOSC
//========================================
//edit by  

INSTANCE DIA_Huno_NAGRODA_ZA_UCZCIWOSC (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Condition;
   information  = DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_POKABLOWAC_DOBRA_RZECZ))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_NAGRODA_ZA_UCZCIWOSC_Info()
{
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_01"); //Hej! S�ysza�em ju� o Baal Taranie i o twojej postawie. Jestem ci bardzo wdzi�czny.
    AI_Output (other, self ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_15_02"); //Nie ma sprawy. Zrobi�em to, co by�o s�uszne.
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_03"); //Doceniam to. We� w nagrod� to ostrze. 
    CreateInvItems (self, Miecz1H5, 1);
    B_GiveInvItems (self, other, Miecz1H5, 1);
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_04"); //To miecz horyzont�w - wyj�tkowe ostrze jednor�czne. Je�li b�dziesz chcia� si� poduczy� walki mieczem, to pogadaj ze Scatty'm. 
    AI_Output (self, other ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_03_05"); //Tylko pami�taj, �e on uczy wy��cznie cz�onk�w Starego Obozu. Ta bro� ma naprawd� olbrzymi potencja�. Mo�esz to wykorzysta�. 
    AI_Output (other, self ,"DIA_Huno_NAGRODA_ZA_UCZCIWOSC_15_06"); //Dzi�kuj�.
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Huno
// Rozdzia� 4 
// Ob�z Kruka
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhatsUpSmith
//========================================

INSTANCE DIA_Huno_WhatsUpSmith (C_INFO)
{
   npc          = VLK_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_WhatsUpSmith_Condition;
   information  = DIA_Huno_WhatsUpSmith_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�, kowalu?";
};

FUNC INT DIA_Huno_WhatsUpSmith_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huno_WhatsUpSmith_Info()
{
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_01"); //Co s�ycha�, kowalu?
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_02"); //Ca�kiem dobrze. Odpoczywam.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_03"); //Nie ma dla mnie nic do roboty odk�d opu�ci�em Stary Ob�z.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_04"); //Nie mamy tutaj ku�ni, wi�c na razie zbijam b�ki.
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_05"); //Dlaczego opu�ci�e� Stary Ob�z?
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_06"); //Sam nie wiem. Kruk, gdy odchodzi� do�� d�ugo mnie do tego przekonywa�.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_07"); //M�wi�, �e po �mierci Mag�w Ognia Gomez b�dzie wy�adowywa� z�o�� na Kopaczach i �e w Obozie niepotrzebny jest drugi kowal.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_08"); //Ostatecznie si� zgodzi�em i teraz zastanawiam si�, czy dobrze zrobi�em.
    AI_Output (other, self ,"DIA_Huno_WhatsUpSmith_15_09"); //Mo�e jednak przyjd� lepsze czasy.
    AI_Output (self, other ,"DIA_Huno_WhatsUpSmith_03_10"); //Mam nadzieje.
};



//---------------------------------------------------------------------------1.6.1----------------------------------------------------


//========================================
//-----------------> Oprawca
//========================================

INSTANCE DIA_Huno_Oprawca (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_Oprawca_Condition;
   information  = DIA_Huno_Oprawca_Info;
   permanent	= FALSE;
   description	= "Witaj. Obi�o ci si� o uszy imi� Winston?";
};

FUNC INT DIA_Huno_Oprawca_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Skip_Oprawca))
{
    return TRUE;
};
};
FUNC VOID DIA_Huno_Oprawca_Info()
{
    AI_Output (other, self ,"DIA_Huno_Oprawca_15_01"); //Witaj. Obi�o ci si� o uszy imi� Winston?
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_02"); //Eeeee... Tak by� u mnie w miar� niedawno. M�wi�, �e kopacze w starej kopalni b�d� dostawa� miecze do obrony przed pe�zaczami.
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_03"); //Wyda�o mi si� dziwne, �e ka�� im d�wiga� jeszcze wi�cej �elastwa. Ale co ja tam wiem.
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_04"); //Chcia� tanie miecze to je wyku�em. Jak na swoj� bardzo nisk� cen� nie s� takie z�e.
    AI_Output (other, self ,"DIA_Huno_Oprawca_15_05"); //Aha. Rzuci�o ci si� co� jeszcze w oczy?
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_06"); //Niespecjalnie. Jak dobili�my targu to zwo�a� tragarzy i zapisa� co� w swoim dzienniku.
    AI_Output (other, self ,"DIA_Huno_Oprawca_15_07"); //Interesuj�ce. Teraz albo p�j�� tropem dziennika albo tych tragarzy.
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_08"); //Pami�tam pewnego kopacza. Ma na imi� Brennus, teraz chyba przebywa gdzie� w pobli�u Gravo.
    AI_Output (other, self ,"DIA_Huno_Oprawca_15_09"); //Dzi�ki za pomoc.
    AI_Output (self, other ,"DIA_Huno_Oprawca_03_10"); //C�, wracam do roboty.
	  B_LogEntry               (Oprawca,"Huno powiedzia�, �e Winston by� u niego po miecze dla kopaczy. Ten dra� chcia� przechytrzy� swoich mocodawc�w, zagarniaj�c reszt� rudy dla siebie. Ale potrzebuje dowod�w. Huno wspomina� o dzienniku Winstona i tragarzu o imieniu Brennus. Dziennik m�g�by mu ukra�� dla mnie kto� kto ma do tego smyka�k� w kopalni a Brennus powinien by� gdzie� w pobli�u Gravo. Kt�r� �cie�k� wybior� zale�y ju� ode mnie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Huno_LearnSmith_01 (C_INFO)
{
   npc          = Vlk_538_Huno;
   nr           = 1;
   condition    = DIA_Huno_LearnSmith_01_Condition;
   information  = DIA_Huno_LearnSmith_01_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.1/3 - 5 PN)";
};

FUNC INT DIA_Huno_LearnSmith_01_Condition()
{
 if (NPC_TALENT_SMITH == 0) && (Npc_KnowsInfo(hero,DIA_Huno_LEARNSMITH))
{
    return TRUE;
};
};
FUNC VOID DIA_Huno_LearnSmith_01_Info()
{

    if  (hero.lp >= 5) 
	{
    AI_Output (other, self ,"DIA_Huno_LearnSmith_01_15_01"); //Naucz mnie jak wyku� miecz. 
    AI_Output (self, other ,"DIA_Huno_LearnSmith_01_03_02"); //To do�� proste. Znajd� sobie plan oraz kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
    AI_Output (self, other ,"DIA_Huno_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Huno_LearnSmith_01_03_04"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
    AI_Output (self, other ,"DIA_Huno_LearnSmith_01_03_05"); //Reszty dowiesz si� sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Huno_LearnSmith_01_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};





