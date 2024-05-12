//*************************************************** MERDARION ! ******************************************************************************************************************
// ************************ EXIT **************************

instance  Info_Merdarion_EXIT (C_INFO)
{
	npc			= KDW_602_Merdarion;
	nr			= 999;
	condition	= Info_Merdarion_EXIT_Condition;
	information	= Info_Merdarion_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MieczTokasa
//========================================

INSTANCE DIA_Merdarion_MieczTokasa (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_MieczTokasa_Condition;
   information  = DIA_Merdarion_MieczTokasa_Info;
   permanent	= FALSE;
   description	= "Ponoæ znasz siê na zaklêtych mieczach.";
};

FUNC INT DIA_Merdarion_MieczTokasa_Condition()
{
    if (MerdarionTalk_Sword == true)
    && (Npc_HasItems (other, Tokas_Sword) >=1)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_MieczTokasa_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_01"); //Ponoæ znasz siê na zaklêtych mieczach.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_02"); //Hmm? Czego chcesz?
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_03"); //Mam tutaj miecz, który skazuje ka¿dego kto od niego zginie na wieczn¹ tu³aczkê.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_04"); //Niestety broñ trafi³a w rêce œwira z Sekty, a ofiar¹ miecza sta³ siê myœliwy Biorn.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_05"); //Chcê zniszczyæ ten orê¿, aby uwolniæ Biorna od kl¹twy. 
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_06"); //Ju¿ rozumiem. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_07"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_08"); //Skoro to takie wa¿ne, dokonam rytua³u oczyszczenia miecza, ale potrzebujê...
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_09"); //...o³tarza oczyszczenia. Mam go znaleŸæ?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_10"); //Widzê, ¿e coœ ju¿ wiesz. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_11"); //Jak ma wygl¹daæ ten o³tarz?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_12"); //Orkowie wykorzystywali go podczas ceremonii pogrzebowych.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_13"); //To dok³adnie ociosany kamienny blok otoczony znakami runicznymi.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_14"); //W¹tpiê, abyœ znalaz³ coœ takiego w Kolonii. Nawet na Ziemiach Orków.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Bez o³tarza oczyszczenia mogê zapomnieæ o zniszczeniu miecza. Mo¿e gdzieœ w Górniczej Dolinie uda mi siê znaleŸæ coœ takiego. Ponoæ bez walki z orkami siê nie obejdzie...");
	finf_olt = true;
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Find
//========================================

INSTANCE DIA_Merdarion_Find (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_Find_Condition;
   information  = DIA_Merdarion_Find_Info;
   permanent	= FALSE;
   description	= "Znalaz³em o³tarz.";
};

FUNC INT DIA_Merdarion_Find_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_MieczTokasa))
    && (oltarzLOC == true)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_Find_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_Find_15_01"); //Znalaz³em o³tarz.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_02"); //Doprawdy? Na pewno nie pomyli³eœ go z niczym innym.
    AI_Output (other, self ,"DIA_Merdarion_Find_15_03"); //Nie, to na pewno o³tarz. Znajduje siê w pobli¿u Cmentarzyska Orków. 
    AI_Output (other, self ,"DIA_Merdarion_Find_15_04"); //Id¹c do Bractwa nale¿y skrêciæ w kierunku gór, ale nieznacznie, po czym przejœæ przez most.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_05"); //No dobrze. Postaram siê przybyæ tam jak najszybciej. 
    AI_Output (self, other ,"DIA_Merdarion_Find_03_06"); //Spotkamy siê na miejscu.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Mam siê spotkaæ z Merdarionem przy o³tarzu. ");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
	AI_Teleport                    (KDW_602_Merdarion,"OLTARZ_OCZYSZCZENIA"); 
	Npc_ExchangeRoutine (KDW_602_Merdarion,"rytual");
};
//========================================
//-----------------> RytualOczyszczenia
//========================================

INSTANCE DIA_Merdarion_RytualOczyszczenia (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_RytualOczyszczenia_Condition;
   information  = DIA_Merdarion_RytualOczyszczenia_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Merdarion_RytualOczyszczenia_Condition()
{
    if (Npc_GetDistToWP (self, "OLTARZ_OCZYSZCZENIA") < 500)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
	&& (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_RytualOczyszczenia_Info()
{
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_01"); //Œwietnie. Mo¿emy zaczynaæ.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_02"); //Jesteœ pewien, ¿e chcesz oczyœciæ to ostrze?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_03"); //Oczyœciæ? Myœla³em, ¿e chcemy je zniszczyæ!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_04"); //Myœlê, ¿e to nie bêdzie konieczne. Pieczêæ na klindze odpowiada za kl¹twê.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_05"); //Ostrze bêdziesz móg³ zachowaæ. Bêdzie jednak trochê s³absze. 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_06"); //Jesteœ pewien, ¿e chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_07"); //A co je¿eli chcê to prze³o¿yæ?
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_08"); //Myœlisz, ¿e bêdziesz mi zawraca³ g³owê kiedy ci siê spodoba? 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_09"); //Wybieraj. 

    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Oczyœæ ostrze!", DIA_Merdarion_RytualOczyszczenia_Clear);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Rozmyœli³em siê. Wracaj do Obozu.", DIA_Merdarion_RytualOczyszczenia_Pozostaw);
};

FUNC VOID DIA_Merdarion_RytualOczyszczenia_Clear()
{
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Clear_15_01"); //Oczyœæ ostrze!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_02"); //W porz¹dku!
	AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_03"); //Oto oczyszczona broñ.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Rytua³ oczyszczenia miecza dobieg³ koñca. Ciekawe co z Biornem...");
	B_GiveInvItems (other, self, Tokas_Sword, 1);
	Npc_RemoveInvItems (KDW_602_Merdarion, Tokas_Sword, 1);
	CreateInvItems (self, Cleared_Tokas_Sword, 1);
    B_GiveInvItems (self, other, Cleared_Tokas_Sword, 1);
	Npc_ExchangeRoutine (KDW_602_Merdarion,"start");
	SwordClear = true;
    B_GiveXP (250);
    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Merdarion_RytualOczyszczenia_Pozostaw()
{
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_15_01"); //Rozmyœli³em siê. Wracaj do Obozu.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_03_02"); //Drugiej szansy ju¿ nie bêdzie.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Zachowa³em miecz dla siebie. Jedna dusza nie jest warta utraty tak potê¿nej broni. ");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_FAILED);
    MIS_NieSpelnionaZemsta = LOG_FAILED;
    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> INFOS_PODST
//========================================

INSTANCE DIA_Merdarion_INFOS_PODST (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 1;
   condition    = DIA_Merdarion_INFOS_PODST_Condition;
   information  = DIA_Merdarion_INFOS_PODST_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Merdarion_INFOS_PODST_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Merdarion_INFOS_PODST_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_INFOS_PODST_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Merdarion_INFOS_PODST_03_02"); //Nazywam siê Merdarion, Mag Wody oraz mistrz teleportacji. W czym mogê ci pomóc?
};

//========================================
//-----------------> TELEPORT_INFOS
//========================================

INSTANCE DIA_Merdarion_TELEPORT_INFOS (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 2;
   condition    = DIA_Merdarion_TELEPORT_INFOS_Condition;
   information  = DIA_Merdarion_TELEPORT_INFOS_Info;
   permanent	= FALSE;
   description	= "Interesujê mnie kwestia teleportacji.";
};

FUNC INT DIA_Merdarion_TELEPORT_INFOS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_INFOS_PODST)) && InfoManager_HasFinished()
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_TELEPORT_INFOS_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_TELEPORT_INFOS_15_01"); //Interesuje mnie kwestia teleportacji.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_02"); //Heh, no có¿... Jeœli chcesz korzystaæ z tej dziedziny magii, powinieneœ wyposa¿yæ siê w runy teleportacji.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_03"); //Mog¹ nimi w³adaæ jednak tylko zas³u¿eni cz³onkowie danej spo³ecznoœci. Wiem o istnieniu trzech run dzia³aj¹cych na terenie Kolonii.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_04"); //Runa teleportacji do obozu na bagnie zosta³a utworzona przez samego mistrza Y'Beriona, który by³ jej posiadaczem. 
	AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_05"); //Jednak podejrzewam, ¿e mieli te¿ do niej dostêp Cor Kalom i Cor Angar.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_06"); //Runê teleportacji do Nowego Obozu wytworzy³em ja. Odda³em j¹ Saturasowi. 
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_07"); //Natomiast przenosz¹ca do Starego Obozu zaginê³a lata temu. Zdaje siê, ¿e w jej posiadaniu by³ Xardas, który opuœci³ Kr¹g Ognia.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_08"); //Nie wykluczam tak¿e wystêpowania innych run teleportacji na terenie Górniczej Doliny.
};

//========================================
//-----------------> OTHER_TELE
//========================================

INSTANCE DIA_Merdarion_OTHER_TELE (C_INFO)
{
   npc          = KDW_602_Merdarion;
   nr           = 3;
   condition    = DIA_Merdarion_OTHER_TELE_Condition;
   information  = DIA_Merdarion_OTHER_TELE_Info;
   permanent	= FALSE;
   description	= "Czy istniej¹ jeszcze jakieœ inne sposoby teleportacji?";
};

FUNC INT DIA_Merdarion_OTHER_TELE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Merdarion_TELEPORT_INFOS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Merdarion_OTHER_TELE_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_01"); //Czy istniej¹ jeszcze jakieœ inne sposoby teleportacji?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_02"); //Tak, gdy tworzyliœmy Magiczn¹ Barierê u¿ywaliœmy platform teleportacyjnych, znajduj¹cych siê w miejscach jej tworzenia. Zdaje siê, ¿e by³o ich piêæ.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_03"); //Platformy znajdowa³y siê w Górskiej Fortecy, ruinach Klasztoru Zmiennokszta³tnych, w Kanionie Trolli, przy kamiennym krêgu na Ziemiach Orków...
	AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_04"); //...oraz na szczycie œwi¹tynnego wzgórza po³o¿onego nad dzisiejszym Bractwem Œni¹cego.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_05"); //Po tym jak Bariera powsta³a, zdezaktywowaliœmy platformy.
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_06"); //Myœlisz, ¿e takie platformy mog¹ znajdowaæ siê tak¿e poza Górnicz¹ Dolin¹?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_07"); //Wydaje mi siê, ¿e tak. Pochodz¹ one z pradawnych czasów, wiêc mog¹ byæ rozsiane po ca³ej wyspie Khorinis. Jeœli uda nam siê obaliæ Barierê, z pewnoœci¹ ich poszukam. 
};

instance dia_merdarion_pickpocket(c_info) {
    npc = kdw_602_merdarion;
    nr = 900;
    condition = dia_merdarion_pickpocket_condition;
    information = dia_merdarion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_merdarion_pickpocket_condition() {
	e_beklauen(baseThfChanceKDW, 55);
};

func void dia_merdarion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_merdarion_pickpocket);
	info_addchoice(dia_merdarion_pickpocket, dialog_back, dia_merdarion_pickpocket_back);
	info_addchoice(dia_merdarion_pickpocket, dialog_pickpocket, dia_merdarion_pickpocket_doit);
};

func void dia_merdarion_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_merdarion_pickpocket);
};

func void dia_merdarion_pickpocket_back() {
    info_clearchoices(dia_merdarion_pickpocket);
};