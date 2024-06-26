// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Calash_EXIT(C_INFO)
{
	npc             = ORG_857_Calash;
	nr              = 999;
	condition	= DIA_Calash_EXIT_Condition;
	information	= DIA_Calash_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Calash_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Calash_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Calash_HELLO1 (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_HELLO1_Condition;
   information  = DIA_Calash_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Calash_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Calash_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_02"); //Jestem my�liwym, tylko nie takim zwyk�ym! Poluj� na ziemne trolle.
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_03"); //Ta kopalnia to jedyne miejsce, w kt�rym si� je spotyka.
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_04"); //A Wolna Kopalnia?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_05"); //Mimo i� jestem cz�onkiem Obozu, nie mog� tam wej��. Zreszt� nie mia�bym po co. Podobno Najemnicy pozbyli si� ju� wszystkich trolli. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Calash_HELLO2 (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 2;
   condition    = DIA_Calash_HELLO2_Condition;
   information  = DIA_Calash_HELLO2_Info;
   permanent	= FALSE;
   description	= "Uda�o ci si� spotka� jakiego� trolla?";
};

FUNC INT DIA_Calash_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_01"); //Uda�o ci si� spotka� jakiego� trolla?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_02"); //Tutaj? Pewnie, �e tak! Jest ich co najmniej kilka... Pono� jeden ukrywa si� w szybie na dnie kopalni.
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_03"); //Czemu na niego nie zapolujesz?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_04"); //Trolle ziemne s� s�absze ni� ich krewniacy z powierzchni, jednak dalej stanowi� zagro�enie nawet dla do�wiadczonego �owcy.
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_05"); //Potrzebuj� jakiego� wsparcia, kogo�, kto by mnie ubezpiecza� i os�ania�. 
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_06"); //Mo�e ty zechcia�by� pom�c?
};

//========================================
//-----------------> HelpAndMission
//========================================

INSTANCE DIA_Calash_HelpAndMission (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 3;
   condition    = DIA_Calash_HelpAndMission_Condition;
   information  = DIA_Calash_HelpAndMission_Info;
   permanent	= FALSE;
   description	= "Mo�liwe, �e chc� ci pom�c.";
};

FUNC INT DIA_Calash_HelpAndMission_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_HelpAndMission_Info()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_01"); //Mo�liwe, �e chc� ci pom�c.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_02"); //To �wietnie. Mam nadziej�, �e masz jak�� dobr� bro� ze sob�. Zardzewia�ym mieczem nie przebijesz ich sk�ry. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_03"); //Ziemne trolle s� niezwykle wra�liwe na ogie�. Mo�esz to wykorzysta�. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_04"); //Kupi�em w Starym Obozie kilka zwoj�w z czarami ognia. M�g�bym ci je da�. 
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_05"); //A co je�eli nie potrafi� si� nimi pos�u�y�?
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_06"); //Hmm... W Starym Obozie mo�na spotka� kurier�w Mag�w Ognia.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_07"); //Pono� ucz� podstaw magii podr�nik�w. Pomagaj� zwi�kszy� energi� magiczn�, czy co� tam... Nie znam si�. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_08"); //Tak czy inaczej, mo�e pora na szkolenie? Jestem got�w na ciebie poczeka�. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_11"); //To jak? Wchodzisz w to?

    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Dobra, wchodz� w to!", DIA_Calash_HelpAndMission_Pomoge);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Niestety nie mog� ci pom�c.", DIA_Calash_HelpAndMission_NiePomagam);
};

FUNC VOID DIA_Calash_HelpAndMission_Pomoge()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_Pomoge_15_01"); //Niech b�dzie. Pomog� ci. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_02"); //�wietnie. Tak jak m�wi�em, mo�esz i�� do Starego Obozu si� poduczy�. No chyba, �e nie potrzebujesz. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_03"); //Wr��, gdy b�dziesz gotowy. Tylko niech ci to nie zajmie ca�ego �ycia!
    MIS_TrollGroundHunting = LOG_RUNNING;

    Log_CreateTopic            (CH1_TrollGroundHunting, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TrollGroundHunting, LOG_RUNNING);
    B_LogEntry                     (CH1_TrollGroundHunting,"Mam pom�c Calashowi w upolowaniu ziemnego trolla. My�liwy zaproponowa� mi, �e da mi kilka zwoj�w z czarami ognia, na kt�re ziemne trolle s� bardzo wra�liwe.");
    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Calash_HelpAndMission_NiePomagam()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_NiePomagam_15_01"); //Niestety nie mog� ci pom�c.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_NiePomagam_03_02"); //Szkoda.
    Info_ClearChoices		(DIA_Calash_HelpAndMission); 
   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QuestStart
//========================================

INSTANCE DIA_Calash_QuestStart (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_QuestStart_Condition;
   information  = DIA_Calash_QuestStart_Info;
   permanent	= FALSE;
   description	= "Uwa�am, �e jestem gotowy.";
};

FUNC INT DIA_Calash_QuestStart_Condition()
{
    if (MIS_TrollGroundHunting == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_QuestStart_Info()
{
    AI_Output (other, self ,"DIA_Calash_QuestStart_15_01"); //Uwa�am, �e jestem gotowy.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_02"); //�wietnie. Opowiem ci, co i jak. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_03"); //Naszym celem jest samica ziemnego trolla. Jest s�absza od samca, ale w jej okolicy mo�e si� kr�ci� jej potomstwo. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_05"); //B�d� ostro�ny. Oto obiecane zwoje.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_06"); //Trzymaj si� blisko. Idziemy! 

    CreateInvItems (self, ItArScrollFirebolt, 2);
    B_GiveInvItems (self, other, ItArScrollFirebolt, 2);
    CreateInvItems (self, ItArScrollFireball, 5);
    B_GiveInvItems (self, other, ItArScrollFireball, 5);
    CreateInvItems (self, ItArScrollFirestorm, 2);
    B_GiveInvItems (self, other, ItArScrollFirestorm, 2);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "guide");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Win
//========================================

INSTANCE DIA_Calash_Win (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_Win_Condition;
   information  = DIA_Calash_Win_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Calash_Win_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Calash_QuestStart))
    && (Npc_GetDistToWP (self, "OM_TROLL2") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Calash_Win_Info()
{
    AI_Output (self, other ,"DIA_Calash_Win_03_01"); //Uda�o si�! 
    AI_Output (other, self ,"DIA_Calash_Win_15_02"); //Dobra robota.
    AI_Output (self, other ,"DIA_Calash_Win_03_03"); //Teraz musz� zebra� trofea z tego olbrzyma.
    AI_Output (self, other ,"DIA_Calash_Win_03_04"); //W nagrod� mo�esz zachowa� reszt� zwoj�w.
    AI_Output (self, other ,"DIA_Calash_Win_03_05"); //We� te� te sk�r�. Zdj��em j� niegdy� z b�otnego w�a.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    CreateInvItems (self, ItAt_Swampshark_01, 1);
    B_GiveInvItems (self, other, ItAt_Swampshark_01, 1);
    B_LogEntry                     (CH1_TrollGroundHunting,"Troll zosta� upolowany. W nagrod� otrzyma�em sk�r� w�a b�otnego i troch� rudy. ");
    Log_SetTopicStatus       (CH1_TrollGroundHunting, LOG_SUCCESS);
    MIS_TrollGroundHunting = LOG_SUCCESS;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "start");
    B_GiveXP (250);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CALASH_PAS_JOIN
//========================================

INSTANCE DIA_Calash_CALASH_PAS_JOIN (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 1;
   condition    = DIA_Calash_CALASH_PAS_JOIN_Condition;
   information  = DIA_Calash_CALASH_PAS_JOIN_Info;
   permanent	= FALSE;
   description	= "Musimy pom�wi�. Pono� m�g�by� mi pom�c dosta� si� w szeregi szajki Laresa.";
};

FUNC INT DIA_Calash_CALASH_PAS_JOIN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Pascal_WHAT_LARES_PP))
&& ((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_SFB))
{
    return TRUE;
};
};
FUNC VOID DIA_Calash_CALASH_PAS_JOIN_Info()
{
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_01"); //Musimy pom�wi�. Pono� m�g�by� mi pom�c dosta� si� w szeregi szajki Laresa.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_02"); //Nie pomagam byle komu.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_03"); //Przysy�a mnie Pascal.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_04"); //Aaa. To zmienia posta� rzeczy.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_05"); //To m�j kompan. Wiele razy napadali�my na konwoje ludzi Gomeza I wy��opali�my razem morze alkoholu haha.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_06"); //To wszystko ciekawe ale jak mo�esz mi pom�c?
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_07"); //Mam szcz�cie ch�opcz�. Ian spisa� pewn� list�. Zawiera potrzebne rzeczy jakie maj� zosta� dostarczone ze Starego Obozu.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_08"); //Gdyby� da� to Laresowi to by�oby dla ciebie gigantyczne wyr�nienie.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_09"); //Za��my, �e chce zdoby� t� list�. Jak mo�esz mi pom�c?
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_10"); //Daj mi 250 bry�ek rudy a wykradn� Ianowi list�.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_11"); //To cenne pismo zw�aszcza dla ciebie. Wi�c zdobycie go kosztuje.
	B_LogEntry				(CH1_JoinNC, "Calash ��da 250 bry�ek wzamian za list� zam�wie� ze starej kopalni.");	
    B_LogEntry    	          (CH1_BringList,"Calash mo�e ukra�� list� zam�wie� od Iana w zamian za 250 bry�ek rudy.");	
};

//========================================
//-----------------> E_JOIN_NC
//========================================

INSTANCE DIA_Calash_E_JOIN_NC (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 2;
   condition    = DIA_Calash_E_JOIN_NC_Condition;
   information  = DIA_Calash_E_JOIN_NC_Info;
   permanent	= FALSE;
   description	= "Oto ruda. Zdob�d� dla mnie ten dokument.";
};

FUNC INT DIA_Calash_E_JOIN_NC_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Calash_CALASH_PAS_JOIN))
   &&  (Npc_HasItems (other, ItMiNugget) >= 250)
{
    return TRUE;
};
};
FUNC VOID DIA_Calash_E_JOIN_NC_Info()
{
    AI_Output (other, self ,"DIA_Calash_E_JOIN_NC_15_01"); //Oto ruda. Zdob�d� dla mnie ten dokument.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_NC_03_02"); //Daj mi dzie� lub dwa a potem przyjd�. Wszystko powinno by� ju� za�atwione.
	B_GiveInvItems (other,self, itminugget, 250);
    AI_Output (other, self ,"DIA_Calash_E_JOIN_NC_15_03"); //W porz�dku.
	Calash_EasyJoinNC_Day = Wld_GetDay();
	
};

//========================================
//-----------------> E_JOIN_MESS
//========================================

INSTANCE DIA_Calash_E_JOIN_MESS (C_INFO)
{
   npc          = ORG_857_Calash;
   nr           = 3;
   condition    = DIA_Calash_E_JOIN_MESS_Condition;
   information  = DIA_Calash_E_JOIN_MESS_Info;
   permanent	= FALSE;
   description	= "Masz t� list�?";
};

FUNC INT DIA_Calash_E_JOIN_MESS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Calash_E_JOIN_NC))
&& (Calash_EasyJoinNC_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Calash_E_JOIN_MESS_Info()
{
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_01"); //Masz t� list�?
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_02"); //Nie by�o �atwo ale oczy I uszy ludzi Gomeza nie wykry�y moich dzia�a�.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_03"); //To dobrze. Inaczej by�oby z tob� krucho.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_04"); //Niedoczekanie ich. Trzymaj pismo Iana.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_05"); //Dzi�ki. Dobrze si� spisa�e�.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_06"); //Na razie nie ruszam si� z kopalni. Pozdr�w ode mnie Pascala.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_07"); //Zgoda i �ycz� powodzenia.
	B_GiveInvItems	(self,hero,TheList,1);
	B_LogEntry				(CH1_JoinNC, "Calash da� mi list� zam�wie� Iana ze starej kopalni, ciekawe jak zareaguje Lares...");		
	
	
	
};

instance dia_calash_pickpocket(c_info) {
    npc = org_857_calash;
    nr = 900;
    condition = dia_calash_pickpocket_condition;
    information = dia_calash_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_calash_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_calash_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_calash_pickpocket);
	info_addchoice(dia_calash_pickpocket, dialog_back, dia_calash_pickpocket_back);
	info_addchoice(dia_calash_pickpocket, dialog_pickpocket, dia_calash_pickpocket_doit);
};

func void dia_calash_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_calash_pickpocket);
};

func void dia_calash_pickpocket_back() {
    info_clearchoices(dia_calash_pickpocket);
};