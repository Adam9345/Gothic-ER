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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Calash_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Calash_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_02"); //Jestem myœliwym, tylko nie takim zwyk³ym! Polujê na ziemne trolle.
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_03"); //Ta kopalnia to jedyne miejsce, w którym siê je spotyka.
    AI_Output (other, self ,"DIA_Calash_HELLO1_15_04"); //A Wolna Kopalnia?
    AI_Output (self, other ,"DIA_Calash_HELLO1_03_05"); //Mimo i¿ jestem cz³onkiem Obozu, nie mogê tam wejœæ. Zreszt¹ nie mia³bym po co. Podobno Najemnicy pozbyli siê ju¿ wszystkich trolli. 
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
   description	= "Uda³o ci siê spotkaæ jakiegoœ trolla?";
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
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_01"); //Uda³o ci siê spotkaæ jakiegoœ trolla?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_02"); //Tutaj? Pewnie, ¿e tak! Jest ich co najmniej kilka... Ponoæ jeden ukrywa siê w szybie na dnie kopalni.
    AI_Output (other, self ,"DIA_Calash_HELLO2_15_03"); //Czemu na niego nie zapolujesz?
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_04"); //Trolle ziemne s¹ s³absze ni¿ ich krewniacy z powierzchni, jednak dalej stanowi¹ zagro¿enie nawet dla doœwiadczonego ³owcy.
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_05"); //Potrzebujê jakiegoœ wsparcia, kogoœ, kto by mnie ubezpiecza³ i os³ania³. 
    AI_Output (self, other ,"DIA_Calash_HELLO2_03_06"); //Mo¿e ty zechcia³byœ pomóc?
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
   description	= "Mo¿liwe, ¿e chcê ci pomóc.";
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
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_01"); //Mo¿liwe, ¿e chcê ci pomóc.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_02"); //To œwietnie. Mam nadziejê, ¿e masz jak¹œ dobr¹ broñ ze sob¹. Zardzewia³ym mieczem nie przebijesz ich skóry. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_03"); //Ziemne trolle s¹ niezwykle wra¿liwe na ogieñ. Mo¿esz to wykorzystaæ. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_04"); //Kupi³em w Starym Obozie kilka zwojów z czarami ognia. Móg³bym ci je daæ. 
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_15_05"); //A co je¿eli nie potrafiê siê nimi pos³u¿yæ?
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_06"); //Hmm... W Starym Obozie mo¿na spotkaæ kurierów Magów Ognia.
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_07"); //Ponoæ ucz¹ podstaw magii podró¿ników. Pomagaj¹ zwiêkszyæ energiê magiczn¹, czy coœ tam... Nie znam siê. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_08"); //Tak czy inaczej, mo¿e pora na szkolenie? Jestem gotów na ciebie poczekaæ. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_03_11"); //To jak? Wchodzisz w to?

    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Dobra, wchodzê w to!", DIA_Calash_HelpAndMission_Pomoge);
    Info_AddChoice		(DIA_Calash_HelpAndMission, "Niestety nie mogê ci pomóc.", DIA_Calash_HelpAndMission_NiePomagam);
};

FUNC VOID DIA_Calash_HelpAndMission_Pomoge()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_Pomoge_15_01"); //Niech bêdzie. Pomogê ci. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_02"); //Œwietnie. Tak jak mówi³em, mo¿esz iœæ do Starego Obozu siê poduczyæ. No chyba, ¿e nie potrzebujesz. 
    AI_Output (self, other ,"DIA_Calash_HelpAndMission_Pomoge_03_03"); //Wróæ, gdy bêdziesz gotowy. Tylko niech ci to nie zajmie ca³ego ¿ycia!
    MIS_TrollGroundHunting = LOG_RUNNING;

    Log_CreateTopic            (CH1_TrollGroundHunting, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TrollGroundHunting, LOG_RUNNING);
    B_LogEntry                     (CH1_TrollGroundHunting,"Mam pomóc Calashowi w upolowaniu ziemnego trolla. Myœliwy zaproponowa³ mi, ¿e da mi kilka zwojów z czarami ognia, na które ziemne trolle s¹ bardzo wra¿liwe.");
    Info_ClearChoices		(DIA_Calash_HelpAndMission);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Calash_HelpAndMission_NiePomagam()
{
    AI_Output (other, self ,"DIA_Calash_HelpAndMission_NiePomagam_15_01"); //Niestety nie mogê ci pomóc.
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
   description	= "Uwa¿am, ¿e jestem gotowy.";
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
    AI_Output (other, self ,"DIA_Calash_QuestStart_15_01"); //Uwa¿am, ¿e jestem gotowy.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_02"); //Œwietnie. Opowiem ci, co i jak. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_03"); //Naszym celem jest samica ziemnego trolla. Jest s³absza od samca, ale w jej okolicy mo¿e siê krêciæ jej potomstwo. 
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_05"); //B¹dŸ ostro¿ny. Oto obiecane zwoje.
    AI_Output (self, other ,"DIA_Calash_QuestStart_03_06"); //Trzymaj siê blisko. Idziemy! 

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
    AI_Output (self, other ,"DIA_Calash_Win_03_01"); //Uda³o siê! 
    AI_Output (other, self ,"DIA_Calash_Win_15_02"); //Dobra robota.
    AI_Output (self, other ,"DIA_Calash_Win_03_03"); //Teraz muszê zebraæ trofea z tego olbrzyma.
    AI_Output (self, other ,"DIA_Calash_Win_03_04"); //W nagrodê mo¿esz zachowaæ resztê zwojów.
    AI_Output (self, other ,"DIA_Calash_Win_03_05"); //WeŸ te¿ te skórê. Zdj¹³em j¹ niegdyœ z b³otnego wê¿a.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    CreateInvItems (self, ItAt_Swampshark_01, 1);
    B_GiveInvItems (self, other, ItAt_Swampshark_01, 1);
    B_LogEntry                     (CH1_TrollGroundHunting,"Troll zosta³ upolowany. W nagrodê otrzyma³em skórê wê¿a b³otnego i trochê rudy. ");
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
   description	= "Musimy pomówiæ. Ponoæ móg³byœ mi pomóc dostaæ siê w szeregi szajki Laresa.";
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
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_01"); //Musimy pomówiæ. Ponoæ móg³byœ mi pomóc dostaæ siê w szeregi szajki Laresa.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_02"); //Nie pomagam byle komu.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_03"); //Przysy³a mnie Pascal.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_04"); //Aaa. To zmienia postaæ rzeczy.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_05"); //To mój kompan. Wiele razy napadaliœmy na konwoje ludzi Gomeza I wy¿³opaliœmy razem morze alkoholu haha.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_06"); //To wszystko ciekawe ale jak mo¿esz mi pomóc?
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_07"); //Mam szczêœcie ch³opczê. Ian spisa³ pewn¹ listê. Zawiera potrzebne rzeczy jakie maj¹ zostaæ dostarczone ze Starego Obozu.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_08"); //Gdybyœ da³ to Laresowi to by³oby dla ciebie gigantyczne wyró¿nienie.
    AI_Output (other, self ,"DIA_Calash_CALASH_PAS_JOIN_15_09"); //Za³ó¿my, ¿e chce zdobyæ tê listê. Jak mo¿esz mi pomóc?
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_10"); //Daj mi 250 bry³ek rudy a wykradnê Ianowi listê.
    AI_Output (self, other ,"DIA_Calash_CALASH_PAS_JOIN_03_11"); //To cenne pismo zw³aszcza dla ciebie. Wiêc zdobycie go kosztuje.
	B_LogEntry				(CH1_JoinNC, "Calash ¿¹da 250 bry³ek wzamian za listê zamówieñ ze starej kopalni.");	
    B_LogEntry    	          (CH1_BringList,"Calash mo¿e ukraœæ listê zamówieñ od Iana w zamian za 250 bry³ek rudy.");	
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
   description	= "Oto ruda. Zdob¹dŸ dla mnie ten dokument.";
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
    AI_Output (other, self ,"DIA_Calash_E_JOIN_NC_15_01"); //Oto ruda. Zdob¹dŸ dla mnie ten dokument.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_NC_03_02"); //Daj mi dzieñ lub dwa a potem przyjdŸ. Wszystko powinno byæ ju¿ za³atwione.
	B_GiveInvItems (other,self, itminugget, 250);
    AI_Output (other, self ,"DIA_Calash_E_JOIN_NC_15_03"); //W porz¹dku.
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
   description	= "Masz t¹ listê?";
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
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_01"); //Masz t¹ listê?
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_02"); //Nie by³o ³atwo ale oczy I uszy ludzi Gomeza nie wykry³y moich dzia³añ.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_03"); //To dobrze. Inaczej by³oby z tob¹ krucho.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_04"); //Niedoczekanie ich. Trzymaj pismo Iana.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_05"); //Dziêki. Dobrze siê spisa³eœ.
    AI_Output (self, other ,"DIA_Calash_E_JOIN_MESS_03_06"); //Na razie nie ruszam siê z kopalni. Pozdrów ode mnie Pascala.
    AI_Output (other, self ,"DIA_Calash_E_JOIN_MESS_15_07"); //Zgoda i ¿yczê powodzenia.
	B_GiveInvItems	(self,hero,TheList,1);
	B_LogEntry				(CH1_JoinNC, "Calash da³ mi listê zamówieñ Iana ze starej kopalni, ciekawe jak zareaguje Lares...");		
	
	
	
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