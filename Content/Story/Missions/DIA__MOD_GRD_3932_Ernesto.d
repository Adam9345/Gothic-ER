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
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO1_03_01"); //Hej, ty! Nie masz tu czego szukaæ! Do piwnic mog¹ wchodziæ tytko Magnaci, a ty nie jesteœ jednym z nich. SPADAJ!
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
   description	= "Mo¿e jednak siê jakoœ dogadamy?";
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
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_01"); //Mo¿e jednak siê jakoœ dogadamy?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_02"); //Kaza³em ci spadaæ! ALE JU¯!
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO2_15_03"); //100 bry³ek rudy, jeœli pozwolisz mi wejœæ do piwnic. 
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO2_03_04"); //Niech bêdzie. Dawaj bry³ki, to pogadamy.
    B_LogEntry                     (CH2_OldCampCellar,"Cena za mo¿liwoœæ buszowania po lochach to 100 bry³ek rudy.");
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
   description	= "Proszê, oto 100 bry³ek.";
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
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_01"); //Proszê, oto 100 bry³ek.
    B_GiveInvItems (hero, self, ItMiNugget, 100);
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_02"); //No dobra, przymknê oko na wejœcie do piwnic, ale i tak nie uda ci siê tego dokonaæ bez klucza. 
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_03"); //Sk¹d mogê wzi¹æ klucz?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_04"); //Maj¹ go tylko trzy osoby; ja, Stra¿nik Berg oraz Gomez. Ja jednak nie oddam ci klucza. Jeœli coœ zniknie i Magnaci mnie przeszukaj¹, nie znajduj¹c klucza, wpadnê w nie lada tarapaty.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_05"); //Ech... Zdaje siê, ¿e z Gomezem nie mam ¿adnych szans. Opowiedz mi o tym Bergu.
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_06"); //Berg by³ Stra¿nikiem tych drzwi, zanim obj¹³em tê funkcjê. Pewnego dnia Thorus wys³a³ go na zwiady, jednak Berg zapomnia³ zwróciæ klucz Magnatom. Jeœli zatem chcesz zdobyæ klucz, bêdziesz musia³ odnaleŸæ Berga.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_07"); //Czy wiesz dok¹d zosta³ wys³any Berg?
    AI_Output (self, other ,"DIA_DungeonGuard_HELLO3_03_08"); //Zosta³ wys³any na zwiady przez Thorusa. Nie mam jednak pojêcia, gdzie dok³adnie. Jeœli chcesz siê tego dowiedzieæ, powinieneœ pogadaæ z jak¹œ osob¹, która trzyma z Thorusem.
    AI_Output (other, self ,"DIA_DungeonGuard_HELLO3_15_09"); //Dziêki za informacje. 
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
    AI_Output (self, other ,"DIA_DungeonGuard_KILL_03_01"); //Po¿a³ujesz, ¿e siê tu zjawi³eœ!
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
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_02"); //Nuda. Odzywczai³em siê od widoku i rozmów z ludŸmi.
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_03"); //I nie chce tego przywracaæ bo nie lubiê gnid i szumowin. Takich jak zapewne ty.
    AI_Output (other, self ,"DIA_DungeonGuard_Magazine_15_04"); //Sk¹d pewnoœæ, ¿e do nich nale¿ê?
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_05"); //Lepiej byæ nieufnym ni¿ zaufaæ o raz za du¿o nieodpowiedniej osobie. Zw³aszcza pod Barier¹.
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_06"); //Ale doœæ tej gadki. Mam tu wa¿ne zadanie a ty przestañ siê tu krêciæ.
    AI_Output (other, self ,"DIA_DungeonGuard_Magazine_15_07"); //Zajrza³em tu tylko ¿eby....
    AI_Output (self, other ,"DIA_DungeonGuard_Magazine_03_08"); //Nic mnie to nie obchodzi. Tutaj nikt nie ma prawa siê krêciæ. Wypad st¹d! 
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
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_01"); //Czy ja mówiê do œciany gówniarzu?
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_DungeonGuard_Triggered_15_02"); //Moje uszy s¹ w najlepszym porz¹dku.
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_03"); //Skoro tak cwaniaku to niech i oczy nad¹¿¹. Zaraz ten wyci¹gniêty miecz wygarbuje ci skórê!
    AI_Output (other, self ,"DIA_DungeonGuard_Triggered_15_04"); //To tylko twoje przypuszczenie. Mo¿e sobie pójdê... Do magazynu albo jak najdalej st¹d.
    AI_Output (self, other ,"DIA_DungeonGuard_Triggered_03_05"); //Wybierz to drugie bo bêd¹ k³opoty. I niejedna plama twojej krwi.
	
	Info_ClearChoices	(DIA_DungeonGuard_Triggered);
    Info_AddChoice		(DIA_DungeonGuard_Triggered, "Dobra, zabieram siê st¹d.", DIA_Ernesto_OkIBack);
    Info_AddChoice		(DIA_DungeonGuard_Triggered, "Chêtnie pomyszkuje w tym magazynie. Na pewno ma sporo do zaoferowania.", DIA_Ernesto_NoILoveYAss);
};

FUNC VOID DIA_Ernesto_OkIBack()
{
    AI_Output (other,self,"DIA_Ernesto_OkIBack_15_01"); //Dobra, zabieram siê st¹d.
	AI_Output (self,other,"DIA_Ernesto_OkIBack_03_02"); //I s³usznie zje¿d¿aj st¹d migiem ¿ebym nie musia³ znowu dobywaæ orê¿a.
	AI_Output (other,self,"DIA_Ernesto_OkIBack_15_02"); //¯egnam.
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Ernesto_NoILoveYAss()
{
    AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_01"); //Chêtnie pomyszkuje w tym magazynie. Na pewno ma sporo do zaoferowania.
	AI_Output (self,other,"DIA_Ernesto_NoILoveYAss_03_02"); //W takim razie ja zaoferuje ci gniew, ból i cierpienie bo w³aœnie œmiertelnie mnie wkurzy³eœ dupku!
	AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_03"); //Oferta odrzucona. Skopiê ci ty³ek i zobaczê co Magnaci chowaj¹ w magazynie.
	AI_Output (self,other,"DIA_Ernesto_NoILoveYAss_03_04"); //No to teraz nauczê ciê rozumu bezczelny skurczybku!
	AI_Output (other,self,"DIA_Ernesto_NoILoveYAss_15_05"); //Chcia³oby siê... Gadaj zdrów!
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