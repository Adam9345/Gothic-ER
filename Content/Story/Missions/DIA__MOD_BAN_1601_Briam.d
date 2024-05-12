//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Briam_EXIT(C_INFO)
{
	npc             = BAN_1601_Briam;
	nr              = 999;
	condition		= DIA_Briam_EXIT_Condition;
	information		= DIA_Briam_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Briam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Briam_EXIT_Info()
{
	AI_Output (self, other ,"DIA_Briam_EXIT_03_01"); //Wpadnij jeszcze kiedy�.
	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� -
// Dialogi og�lne, handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Briam_WhoYou (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Briam_WhoYou_Condition;
   information  = DIA_Briam_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Briam_WhoYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Briam_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Briam_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_02"); //Nazywam si� Briam, jestem alchemikiem. G��wnie zajmuj� si� destylacj� gorza�ki i kr�ceniem blant�w.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_03"); //Czesem jednak zdarza si�, �e przyrz�dz� jak�� mikstur�.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_04"); //Ale to raczej rzadko. Mam tu tylko pospolite sk�adniki, sam wiesz. Kontakty z magami s� te� do�� ograniczone.
    AI_Output (self, other ,"DIA_Briam_WhoYou_03_05"); //Preparacja u�ywek to chyba najwa�niejsza robota tu w  Obozie. Bandyci lubi� si� napi� jak i zapali�.
    AI_Output (other, self ,"DIA_Briam_WhoYou_15_07"); //M�g�by� nauczy� mnie alchemii?
	AI_Output (self, other ,"DIA_Briam_WhoYou_03_08"); //Jasne! Kiedy� terminowa�em u alchemika Constantino, ale to by�o w czasach kiedy mia� jeszcze bujne w�osy.

	//log
	Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
	B_LogEntry			(GE_TeacherBAN,"Briam nauczy mnie alchemii. Znajd� go w jaskini w Obozie Bandyt�w.");
};

//========================================
//-----------------> LifeInCamp
//========================================

INSTANCE DIA_Briam_LifeInCamp (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 2;
   condition    = DIA_Briam_LifeInCamp_Condition;
   information  = DIA_Briam_LifeInCamp_Info;
   permanent	= FALSE;
   description	= "Jak ci si� tu �yje?";
};

FUNC INT DIA_Briam_LifeInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Briam_LifeInCamp_Info()
{
    AI_Output (other, self ,"DIA_Briam_LifeInCamp_15_01"); //Jak ci si� tu �yje?
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_02"); //Nie jest �le. Ka�dy zajmuje si� swoj� robot� i nie wchodzi innym w drog�.
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_03"); //Quentin dobrze zarz�dza Obozem i sprawiedliwie dzieli rud�.
    AI_Output (self, other ,"DIA_Briam_LifeInCamp_03_04"); //Zobaczysz, wkr�tce si� st�d wyrwiemy i wymienimy rud� za z�oto.
};

//========================================
//-----------------> WorkInCamp
//========================================

INSTANCE DIA_Briam_WorkInCamp (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 3;
   condition    = DIA_Briam_WorkInCamp_Condition;
   information  = DIA_Briam_WorkInCamp_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o waszej organizacji pracy.";
};

FUNC INT DIA_Briam_WorkInCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_LifeInCamp))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Briam_WorkInCamp_Info()
{
    AI_Output (other, self ,"DIA_Briam_WorkInCamp_15_01"); //Opowiedz mi o waszej organizacji pracy.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_03"); //To proste. Ka�dy ma tu wyznaczone jakie� zadanie.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_04"); //Wi�kszo�� Bandyt�w wykonuje prace w samym Obozu, a cz�� pracuje poza nim.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_05"); //Dzi�ki temu mamy jedzenie, gorza�e i przedmioty potrzebne do przetrwania
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_06"); //Od czasu do czasu przychodzi tu jaki� wys�annik z innego obozu.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_07"); //Zazwyczaj przychodz� z jakimi� problemami, na kt�re szkoda im w�asnych ludzi.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_08"); //W�wczas najmujemy si� do zlece�, kt�rych nikt nie chce rusza�.
    AI_Output (other, self ,"DIA_Briam_WorkInCamp_15_09"); //Czyli inne obozy wami pogardzaj�? Tak mam to rozumie�?
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_10"); //Niby tak, ale czasem zarabiamy po kilka tysi�cy bry�ek. Szczeg�lnie dobrze p�ac� Guru.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_11"); //Oczywi�cie, je�eli uda nam si� prze�y�.
    AI_Output (self, other ,"DIA_Briam_WorkInCamp_03_12"); //Najcz�ciej jednak wysy�amy do�wiadczonych ludzi takich jak Rocky, Doyle czy Martin. Ci go�cie wiedz� co robi�.
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Briam_TRADE (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Briam_TRADE_Condition;
   information  = DIA_Briam_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Briam_TRADE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Briam_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Briam_TRADE_15_01"); //Chc� co� kupi�.
    AI_Output (self, other ,"DIA_Briam_TRADE_03_02"); //Wybierz sobie.
	B_ClearTreaderAmmo(self);
	var int know_briam_sell;
	if (know_briam_sell == false)
	{
	know_briam_sell = true;
	Log_CreateTopic	(GE_Bandit,	LOG_NOTE);
	B_LogEntry		(GE_Bandit,	"Briam handluje r�nymi przedmiotami zwi�zanymi z alchemi�. Znajd� go w jaskini w g��bi Obozu Bandyt�w.");
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Briam_RAYAN (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 3;
   condition    = DIA_Briam_RAYAN_Condition;
   information  = DIA_Briam_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o �mierci Rayana?";
};

FUNC INT DIA_Briam_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Briam_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Briam_RAYAN_15_01"); //Wiesz co� o �mierci Rayana?
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_02"); //W�a�nie mia�em i�� pogada� na ten temat z Jensem. To prawda, �e Kereth co� kombinuje? 
	AI_Output (other, self ,"DIA_Briam_RAYAN_15_03"); //Tak. Masz jakie� u�ytecznie informacje?
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_04"); //Chyba mam. Wcze�niej wydawa�y mi si� niewa�ne, ale w �wietle tego, co si� dzieje mog� by� do�� istotne.
	AI_Output (other, self ,"DIA_Briam_RAYAN_15_05"); //Zamieniam si� w s�uch.
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_06"); //Widzia�em jak Kereth chowa� do skrzyni miecz Jensa. To by�o p�nym wieczorem. Wraca� sk�d�. Na pocz�tku my�la�em, �e po prostu odkupi� t� bro�. 
    AI_Output (self, other ,"DIA_Briam_RAYAN_03_07"); //No, ale skoro s� skonfliktowani...
    AI_Output (other, self ,"DIA_Briam_RAYAN_15_08"); //Wychodzi�oby na to, �e Kereth sam rujnuje gr�b swojego brata, �eby wykurzy� Jensa z Obozu. 
	AI_Output (self, other ,"DIA_Briam_RAYAN_03_09"); //Kawa� sukinsyna z niego. Lepiej szybko wyprostujcie t� spraw�. 
	
	B_LogEntry     (CH1_DestroyedGrave,"Briam przedstawi� do�� wa�n� spraw�. Twierdzi, �e widzia� jak Kereth p�n� noc� chowa do swojej skrzyni miecz Jensa.");
};

//========================================
//-----------------> DobraRobota
//========================================

INSTANCE DIA_Jens_DobraRobota (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_DobraRobota_Condition;
   information  = DIA_Jens_DobraRobota_Info;
   permanent	= FALSE;
   description	= "Mam receptur�.";
};

FUNC INT DIA_Jens_DobraRobota_Condition()
{
    if (Npc_HasItems (other, ItMis_RecipeSlepperBreath) >=1)
    && (MIS_KalomsNewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_DobraRobota_Info()
{
    AI_Output (other, self ,"DIA_Jens_DobraRobota_15_01"); //Mam receptur�.
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_02"); //Poka� mi j�!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_03"); //Hmm... Interesuj�ce. Spr�bujmy ukr�ci� troch� rudy z tego przepisu.
    AI_Output (other, self ,"DIA_Jens_DobraRobota_15_04"); //Co z moj� dzia�k�?
    AI_Output (self, other ,"DIA_Jens_DobraRobota_03_05"); //Trzymaj. Zas�u�y�e�.
	//log
    B_LogEntry                     (CH2_KalomsNewWeed,"Briam otrzyma� receptur�, a ja swoj� dol� za wykonanie zadania.");
	//experience
    B_GiveXP (XP_PrzepisNaZiolo);
	CreateInvItems (self, itminugget, 150);
    B_GiveInvItems (self, other, itminugget, 150);
	B_GiveInvItems (hero, self, ItMis_RecipeSlepperBreath, 1);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� 4
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> FreePotions
//========================================

INSTANCE DIA_Bandyta_FreePotions (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 1;
   condition    = DIA_Bandyta_FreePotions_Condition;
   information  = DIA_Bandyta_FreePotions_Info;
   permanent	= FALSE;
   description	= "Quentin przys�a� mnie po eliksiry.";
};

FUNC INT DIA_Bandyta_FreePotions_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_FreePotions_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FreePotions_15_01"); //Quentin przys�a� mnie po eliksiry.
    AI_Output (self, other ,"DIA_Bandyta_FreePotions_03_02"); //Mam tu co� dla ciebie. Powodzenia.
	//log
	B_LogEntry     (CH4_NewDanger,"Wzi��em od Briama eliksiry.");
	//items
	B_GiveInvItems (self,hero, ItFo_Potion_Health_02, 5);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Briam
// Rozdzia� -
// Nauka alchemii
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_Bandyta_KnowsAlchemy2 (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_Bandyta_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_Bandyta_KnowsAlchemy2.permanent = true;
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

INSTANCE DIA_Bandyta_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = BAN_1601_Briam;
   nr           = 4;
   condition    = DIA_Bandyta_KnowsAlchemy2_L2_Condition;
   information  = DIA_Bandyta_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_Bandyta_KnowsAlchemy2_L2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_WhoYou))
    && (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To z czym b�dziesz mia� do czynienia to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_Bandyta_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_Bandyta_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_Bandyta_KnowsAlchemy2_l2.permanent = true;
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


instance dia_briam_pickpocket(c_info) {
    npc = ban_1601_briam;
    nr = 900;
    condition = dia_briam_pickpocket_condition;
    information = dia_briam_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_briam_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_briam_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_briam_pickpocket);
	info_addchoice(dia_briam_pickpocket, dialog_back, dia_briam_pickpocket_back);
	info_addchoice(dia_briam_pickpocket, dialog_pickpocket, dia_briam_pickpocket_doit);
};

func void dia_briam_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_briam_pickpocket);
};

func void dia_briam_pickpocket_back() {
    info_clearchoices(dia_briam_pickpocket);
};