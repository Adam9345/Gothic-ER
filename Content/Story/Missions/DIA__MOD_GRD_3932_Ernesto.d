//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_DungeonGuard_EXIT(C_INFO)
{
	npc             = GRD_3932_DungeonGuard;
	nr              = 999;
	condition	= DIA_DungeonGuard_EXIT_Condition;
	information	= DIA_DungeonGuard_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_DungeonGuard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DungeonGuard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_DungeonGuard_HELLO1 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 1;
   condition    = DIA_DungeonGuard_HELLO1_Condition;
   information  = DIA_DungeonGuard_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_DungeonGuard_HELLO1_Condition()
{
	if (MIS_ScarMurder != LOG_RUNNING)
	{
    return TRUE;
	};
};

FUNC VOID DIA_DungeonGuard_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO1_03_01"); //Hej, ty! Nie masz tu czego szuka�! Do piwnic mog� wchodzi� tytko Magnaci, a ty nie jeste� jednym z nich. SPADAJ!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_DungeonGuard_HELLO2 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 2;
   condition    = DIA_DungeonGuard_HELLO2_Condition;
   information  = DIA_DungeonGuard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo�e jednak si� jako� dogadamy?";
};

FUNC INT DIA_DungeonGuard_HELLO2_Condition()
{
    if (MIS_OldCampCellar == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DungeonGuard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_01"); //Mo�e jednak si� jako� dogadamy?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_02"); //Kaza�em ci spada�! ALE JU�!
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_03"); //100 bry�ek rudy, je�li pozwolisz mi wej�� do piwnic. 
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_04"); //Niech b�dzie. Dawaj bry�ki, to pogadamy.
    B_LogEntry                     (CH2_OldCampCellar,"Cena za mo�liwo�� buszowania po lochach to 100 bry�ek rudy.");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_DungeonGuard_HELLO3 (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 3;
   condition    = DIA_DungeonGuard_HELLO3_Condition;
   information  = DIA_DungeonGuard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Prosz�, oto 100 bry�ek.";
};

FUNC INT DIA_DungeonGuard_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_DungeonGuard_HELLO2))
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DungeonGuard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_01"); //Prosz�, oto 100 bry�ek.
    B_GiveInvItems (hero, self, ItMiNugget, 100);
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_02"); //No dobra, przymkn� oko na wej�cie do piwnic, ale i tak nie uda ci si� tego dokona� bez klucza. 
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_03"); //Sk�d mog� wzi�� klucz?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_04"); //Maj� go tylko trzy osoby; ja, Stra�nik Berg oraz Gomez. Ja jednak nie oddam ci klucza. Je�li co� zniknie i Magnaci mnie przeszukaj�, nie znajduj�c klucza, wpadn� w nie lada tarapaty.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_05"); //Ech... Zdaje si�, �e z Gomezem nie mam �adnych szans. Opowiedz mi o tym Bergu.
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_06"); //Berg by� Stra�nikiem tych drzwi, zanim obj��em t� funkcj�. Pewnego dnia Thorus wys�a� go na zwiady, jednak Berg zapomnia� zwr�ci� klucz Magnatom. Je�li zatem chcesz zdoby� klucz, b�dziesz musia� odnale�� Berga.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_07"); //Czy wiesz dok�d zosta� wys�any Berg?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_08"); //Zosta� wys�any na zwiady przez Thorusa. Nie mam jednak poj�cia, gdzie dok�adnie. Je�li chcesz si� tego dowiedzie�, powiniene� pogada� z jak�� osob�, kt�ra trzyma z Thorusem.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_09"); //Dzi�ki za informacje. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KILL
//========================================

INSTANCE DIA_DungeonGuard_KILL (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 1;
   condition    = DIA_DungeonGuard_KILL_Condition;
   information  = DIA_DungeonGuard_KILL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_DungeonGuard_KILL_Condition()
{
	if (MIS_ScarMurder == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Snake_NOWAY))
	{
    return TRUE;
	};
};

FUNC VOID DIA_DungeonGuard_KILL_Info()
{
    AI_Output (self, other ,"DIA_DungeonGuard_KILL_03_01"); //Po�a�ujesz, �e si� tu zjawi�e�!
    AI_StopProcessInfos	(self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_ExchangeRoutine (NON_7852_Snake,"free");
};


//========================================
//-----------------> Magazine
//========================================

INSTANCE DIA_DungeonGuard_Magazine (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 1;
   condition    = DIA_DungeonGuard_Magazine_Condition;
   information  = DIA_DungeonGuard_Magazine_Info;
   permanent	= FALSE;
   description	= "Jak tam pilnowanie magazynu?";
};

FUNC INT DIA_DungeonGuard_Magazine_Condition()
{
    return TRUE;
};

FUNC VOID DIA_DungeonGuard_Magazine_Info()
{
    AI_Output (other, self ,"DIA_DungeonGuard_Magazine_15_01"); //Jak tam pilnowanie magazynu?
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_02"); //Nuda. Odzywczai�em si� od widoku i rozm�w z lud�mi.
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_03"); //I nie chce tego przywraca� bo nie lubi� gnid i szumowin. Takich jak zapewne ty.
    AI_Output (other, self ,"DIA_DungeonGuard_Magazine_15_04"); //Sk�d pewno��, �e do nich nale��?
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_05"); //Lepiej by� nieufnym ni� zaufa� o raz za du�o nieodpowiedniej osobie. Zw�aszcza pod Barier�.
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_06"); //Ale do�� tej gadki. Mam tu wa�ne zadanie a ty przesta� si� tu kr�ci�.
    AI_Output (other, self ,"DIA_DungeonGuard_Magazine_15_07"); //Zajrza�em tu tylko �eby....
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_08"); //Nic mnie to nie obchodzi. Tutaj nikt nie ma prawa si� kr�ci�. Wypad st�d! 
};

//========================================
//-----------------> Triggered
//========================================

INSTANCE DIA_DungeonGuard_Triggered (C_INFO)
{
   npc          = GRD_3932_DungeonGuard;
   nr           = 2;
   condition    = DIA_DungeonGuard_Triggered_Condition;
   information  = DIA_DungeonGuard_Triggered_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_DungeonGuard_Triggered_Condition()
{
if (Npc_KnowsInfo(hero,DIA_DungeonGuard_Magazine))
&& (Npc_GetDistToNpc(hero,GRD_3932_DungeonGuard)<500) 
{
    return TRUE;
};
};
FUNC VOID DIA_DungeonGuard_Triggered_Info()
{
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_01"); //Czy ja m�wi� do �ciany g�wniarzu?
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_DungeonGuard_Triggered_15_02"); //Moje uszy s� w najlepszym porz�dku.
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_03"); //Skoro tak cwaniaku to niech i oczy nad���. Zaraz ten wyci�gni�ty miecz wygarbuje ci sk�r�!
    AI_Output (other, self ,"DIA_DungeonGuard_Triggered_15_04"); //To tylko twoje przypuszczenie. Mo�e sobie p�jd�... Do magazynu albo jak najdalej st�d.
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_05"); //Wybierz to drugie bo b�d� k�opoty. I niejedna plama twojej krwi.
	
	Info_ClearChoices	(DIA_DungeonGuard_Triggered);
    Info_AddChoice		(DIA_DungeonGuard_Triggered, "Dobra, zabieram si� st�d.", DIA_Ernesto_OkIBack);
    Info_AddChoice		(DIA_DungeonGuard_Triggered, "Ch�tnie pomyszkuje w tym magazynie. Na pewno ma sporo do zaoferowania.", DIA_Ernesto_NoILoveYAss);
};

FUNC VOID DIA_Ernesto_OkIBack()
{
    AI_Output (other,self,"DIA_Ernesto_OkIBack_15_01"); //Dobra, zabieram si� st�d.
	AI_Output (self,other,"DIA_Ernesto_OkIBack_03_02"); //I s�usznie zje�d�aj st�d migiem �ebym nie musia� znowu dobywa� or�a.
	AI_Output (other,self,"DIA_Ernesto_OkIBack_15_02"); //�egnam.
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Ernesto_NoILoveYAss()
{
    AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_01"); //Ch�tnie pomyszkuje w tym magazynie. Na pewno ma sporo do zaoferowania.
	AI_Output (self,other,"DIA_Ernesto_NoILoveYAss_03_02"); //W takim razie ja zaoferuje ci gniew, b�l i cierpienie bo w�a�nie �miertelnie mnie wkurzy�e� dupku!
	AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_03"); //Oferta odrzucona. Skopi� ci ty�ek i zobacz� co Magnaci chowaj� w magazynie.
	AI_Output (self,other,"DIA_Ernesto_NoILoveYAss_03_04"); //No to teraz naucz� ci� rozumu bezczelny skurczybku!
	AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_05"); //Chcia�oby si�... Gadaj zdr�w!
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};

instance dia_grd_3932_pickpocket(c_info) {
    npc = grd_3932_dungeonguard;
    nr = 900;
    condition = dia_grd_3932_pickpocket_condition;
    information = dia_grd_3932_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3932_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3932_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3932_pickpocket);
	info_addchoice(dia_grd_3932_pickpocket, dialog_back, dia_grd_3932_pickpocket_back);
	info_addchoice(dia_grd_3932_pickpocket, dialog_pickpocket, dia_grd_3932_pickpocket_doit);
};

func void dia_grd_3932_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_3932_pickpocket);
};

func void dia_grd_3932_pickpocket_back() {
    info_clearchoices(dia_grd_3932_pickpocket);
};