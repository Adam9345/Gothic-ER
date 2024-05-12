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
   description	= "Pono� znasz si� na zakl�tych mieczach.";
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
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_01"); //Pono� znasz si� na zakl�tych mieczach.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_02"); //Hmm? Czego chcesz?
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_03"); //Mam tutaj miecz, kt�ry skazuje ka�dego kto od niego zginie na wieczn� tu�aczk�.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_04"); //Niestety bro� trafi�a w r�ce �wira z Sekty, a ofiar� miecza sta� si� my�liwy Biorn.
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_05"); //Chc� zniszczy� ten or�, aby uwolni� Biorna od kl�twy. 
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_06"); //Ju� rozumiem. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_07"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_08"); //Skoro to takie wa�ne, dokonam rytua�u oczyszczenia miecza, ale potrzebuj�...
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_09"); //...o�tarza oczyszczenia. Mam go znale��?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_10"); //Widz�, �e co� ju� wiesz. 
    AI_Output (other, self ,"DIA_Merdarion_MieczTokasa_15_11"); //Jak ma wygl�da� ten o�tarz?
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_12"); //Orkowie wykorzystywali go podczas ceremonii pogrzebowych.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_13"); //To dok�adnie ociosany kamienny blok otoczony znakami runicznymi.
    AI_Output (self, other ,"DIA_Merdarion_MieczTokasa_03_14"); //W�tpi�, aby� znalaz� co� takiego w Kolonii. Nawet na Ziemiach Ork�w.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Bez o�tarza oczyszczenia mog� zapomnie� o zniszczeniu miecza. Mo�e gdzie� w G�rniczej Dolinie uda mi si� znale�� co� takiego. Pono� bez walki z orkami si� nie obejdzie...");
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
   description	= "Znalaz�em o�tarz.";
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
    AI_Output (other, self ,"DIA_Merdarion_Find_15_01"); //Znalaz�em o�tarz.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_02"); //Doprawdy? Na pewno nie pomyli�e� go z niczym innym.
    AI_Output (other, self ,"DIA_Merdarion_Find_15_03"); //Nie, to na pewno o�tarz. Znajduje si� w pobli�u Cmentarzyska Ork�w. 
    AI_Output (other, self ,"DIA_Merdarion_Find_15_04"); //Id�c do Bractwa nale�y skr�ci� w kierunku g�r, ale nieznacznie, po czym przej�� przez most.
    AI_Output (self, other ,"DIA_Merdarion_Find_03_05"); //No dobrze. Postaram si� przyby� tam jak najszybciej. 
    AI_Output (self, other ,"DIA_Merdarion_Find_03_06"); //Spotkamy si� na miejscu.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Mam si� spotka� z Merdarionem przy o�tarzu. ");

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
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_01"); //�wietnie. Mo�emy zaczyna�.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_02"); //Jeste� pewien, �e chcesz oczy�ci� to ostrze?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_03"); //Oczy�ci�? My�la�em, �e chcemy je zniszczy�!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_04"); //My�l�, �e to nie b�dzie konieczne. Piecz�� na klindze odpowiada za kl�tw�.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_05"); //Ostrze b�dziesz m�g� zachowa�. B�dzie jednak troch� s�absze. 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_06"); //Jeste� pewien, �e chcesz to zrobi�?
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_15_07"); //A co je�eli chc� to prze�o�y�?
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_08"); //My�lisz, �e b�dziesz mi zawraca� g�ow� kiedy ci si� spodoba? 
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_03_09"); //Wybieraj. 

    Info_ClearChoices		(DIA_Merdarion_RytualOczyszczenia);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Oczy�� ostrze!", DIA_Merdarion_RytualOczyszczenia_Clear);
    Info_AddChoice		(DIA_Merdarion_RytualOczyszczenia, "Rozmy�li�em si�. Wracaj do Obozu.", DIA_Merdarion_RytualOczyszczenia_Pozostaw);
};

FUNC VOID DIA_Merdarion_RytualOczyszczenia_Clear()
{
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Clear_15_01"); //Oczy�� ostrze!
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_02"); //W porz�dku!
	AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Clear_03_03"); //Oto oczyszczona bro�.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Rytua� oczyszczenia miecza dobieg� ko�ca. Ciekawe co z Biornem...");
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
    AI_Output (other, self ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_15_01"); //Rozmy�li�em si�. Wracaj do Obozu.
    AI_Output (self, other ,"DIA_Merdarion_RytualOczyszczenia_Pozostaw_03_02"); //Drugiej szansy ju� nie b�dzie.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Zachowa�em miecz dla siebie. Jedna dusza nie jest warta utraty tak pot�nej broni. ");
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Merdarion_INFOS_PODST_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Merdarion_INFOS_PODST_Info()
{
    AI_Output (other, self ,"DIA_Merdarion_INFOS_PODST_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Merdarion_INFOS_PODST_03_02"); //Nazywam si� Merdarion, Mag Wody oraz mistrz teleportacji. W czym mog� ci pom�c?
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
   description	= "Interesuj� mnie kwestia teleportacji.";
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
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_02"); //Heh, no c�... Je�li chcesz korzysta� z tej dziedziny magii, powiniene� wyposa�y� si� w runy teleportacji.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_03"); //Mog� nimi w�ada� jednak tylko zas�u�eni cz�onkowie danej spo�eczno�ci. Wiem o istnieniu trzech run dzia�aj�cych na terenie Kolonii.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_04"); //Runa teleportacji do obozu na bagnie zosta�a utworzona przez samego mistrza Y'Beriona, kt�ry by� jej posiadaczem. 
	AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_05"); //Jednak podejrzewam, �e mieli te� do niej dost�p Cor Kalom i Cor Angar.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_06"); //Run� teleportacji do Nowego Obozu wytworzy�em ja. Odda�em j� Saturasowi. 
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_07"); //Natomiast przenosz�ca do Starego Obozu zagin�a lata temu. Zdaje si�, �e w jej posiadaniu by� Xardas, kt�ry opu�ci� Kr�g Ognia.
    AI_Output (self, other ,"DIA_Merdarion_TELEPORT_INFOS_03_08"); //Nie wykluczam tak�e wyst�powania innych run teleportacji na terenie G�rniczej Doliny.
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
   description	= "Czy istniej� jeszcze jakie� inne sposoby teleportacji?";
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
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_01"); //Czy istniej� jeszcze jakie� inne sposoby teleportacji?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_02"); //Tak, gdy tworzyli�my Magiczn� Barier� u�ywali�my platform teleportacyjnych, znajduj�cych si� w miejscach jej tworzenia. Zdaje si�, �e by�o ich pi��.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_03"); //Platformy znajdowa�y si� w G�rskiej Fortecy, ruinach Klasztoru Zmiennokszta�tnych, w Kanionie Trolli, przy kamiennym kr�gu na Ziemiach Ork�w...
	AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_04"); //...oraz na szczycie �wi�tynnego wzg�rza po�o�onego nad dzisiejszym Bractwem �ni�cego.
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_05"); //Po tym jak Bariera powsta�a, zdezaktywowali�my platformy.
    AI_Output (other, self ,"DIA_Merdarion_OTHER_TELE_15_06"); //My�lisz, �e takie platformy mog� znajdowa� si� tak�e poza G�rnicz� Dolin�?
    AI_Output (self, other ,"DIA_Merdarion_OTHER_TELE_03_07"); //Wydaje mi si�, �e tak. Pochodz� one z pradawnych czas�w, wi�c mog� by� rozsiane po ca�ej wyspie Khorinis. Je�li uda nam si� obali� Barier�, z pewno�ci� ich poszukam. 
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