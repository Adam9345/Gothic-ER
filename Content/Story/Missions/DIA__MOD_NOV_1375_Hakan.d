//*****************************************
// SPRAWDZONE - GOTHIC1210
//*****************************************
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hakan_EXIT(C_INFO)
{
	npc             = NOV_1375_Hakan;
	nr              = 999;
	condition	= DIA_Hakan_EXIT_Condition;
	information	= DIA_Hakan_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hakan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hakan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Hakan_HELLO5 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 5;
   condition    = DIA_Hakan_HELLO5_Condition;
   information  = DIA_Hakan_HELLO5_Info;
   permanent	= FALSE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Hakan_HELLO5_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Hakan_HELLO5_15_01"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Hakan_HELLO5_03_02"); //Ca�y dzie� sp�dzam przy kotle. Jestem obozowym kucharzem.
    AI_Output (other, self ,"DIA_Hakan_HELLO5_15_03"); //Mo�esz mi sprzeda� jakie� przepisy?
    AI_Output (self, other ,"DIA_Hakan_HELLO5_03_04"); //Jasne, je�li tylko mi zap�acisz.
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Hakan z Obozu Bractwa sprzeda mi przepisy.");//fix
};
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Hakan_TRADE (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 5;
   condition    = DIA_Hakan_TRADE_Condition;
   information  = DIA_Hakan_TRADE_Info;
   permanent	= true;
   trade 		= true;
   description	= "Co oferujesz?";
};

FUNC INT DIA_Hakan_TRADE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Hakan_TRADE_15_01"); //Co oferujesz?
    AI_Output (self, other ,"DIA_Hakan_TRADE_03_02"); //Sam zobacz.
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> LIFE
//========================================
INSTANCE DIA_Hakan_LIFE (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 3;
   condition    = DIA_Hakan_LIFE_Condition;
   information  = DIA_Hakan_LIFE_Info;
   permanent	= FALSE;
   description	= "Jak wygl�da �ycie tutaj?";
};

FUNC INT DIA_Hakan_LIFE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_LIFE_Info()
{
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_01"); //Jak wygl�da �ycie tutaj?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_02"); //Ka�dy ma swoje obowi�zki na rzecz spo�eczno�ci i powinien je sumiennie wykonywa�. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_03"); //Tak si� niestety nie dzieje. Wielu Nowicjuszy liczy, �e kto� odwali robot� za nich.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_04"); //To g��wnie przybysze z innych oboz�w maj�cy niewiele wsp�lnego ze �ni�cym.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_05"); //Problem le�y w tym, �e u nas nie ma solidnego nadzoru. Tutaj nikt ci� nie spierze, je�li nie przyjdziesz do pracy.
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_06"); //Z tym jest najwi�cej k�opot�w.
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_08"); //Gdy przepracujesz ca�y dzie�, masz prawo odpoczywa� drugi dzie�. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_09"); //Jednak stanowisko pracy mo�na opu�ci� wy��cznie, je�eli kto� przyjdzie ci� zmieni�. 
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_10"); //Cz�sto zmiennik po prostu nie przychodzi...
    AI_Output (other, self ,"DIA_Hakan_LIFE_15_11"); //Baalowie nie reaguj�?
    AI_Output (self, other ,"DIA_Hakan_LIFE_03_12"); //Rzadko, na og� wol� si� nie wtr�ca� w sprawy Nowicjuszy. Zreszt�, ma�o co m�wi�.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Hakan_HELLO4 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 4;
   condition    = DIA_Hakan_HELLO4_Condition;
   information  = DIA_Hakan_HELLO4_Info;
   permanent	= FALSE;
   description	= "Czy ka�dy w Bractwie wierzy w �ni�cego?";
};

FUNC INT DIA_Hakan_HELLO4_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hakan_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Hakan_HELLO4_15_01"); //Czy ka�dy w Bractwie wierzy w �ni�cego?
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_02"); //Tak w�a�ciwie to nie. Wielu przybywa do Obozu, szukaj�c �atwego �ycia.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_03"); //Nienawidz� takich wyzyskiwaczy. My pracujemy, a oni licz�, �e dostan� co� za darmo. 
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_04"); //Uwa�am, �e ka�dy Nowicjusz powinien przej�� pr�b� wiary, ot co.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_05"); //Z pewno�ci� by�oby mniej ch�tnych. 
    AI_Output (other, self ,"DIA_Hakan_HELLO4_15_06"); //Rozumiem, �e aby do��czy� do Obozu nie trzeba si� zbytnio wysila�.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_07"); //W sumie to wystarczy dobrze k�ama�. Baalowie praktycznie ca�y czas s� odurzeni zielem.
    AI_Output (self, other ,"DIA_Hakan_HELLO4_03_08"); //Nie potrafi� oceni�, jakie kto ma intencje. 
};

///////////////////////////////////////////////
// Choroba
///////////////////////////////////////////////

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Hakan_QUEST1 (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 3;
   condition    = DIA_Hakan_QUEST1_Condition;
   information  = DIA_Hakan_QUEST1_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Baal Orun.";
};

FUNC INT DIA_Hakan_QUEST1_Condition()
{
    if (MIS_SickHakan == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hakan_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Hakan_QUEST1_15_01"); //Przysy�a mnie Baal Orun. Lepiej si� ju� czujesz?
	if (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
    AI_Output (self, other ,"DIA_Hakan_QUEST1_03_02"); //(milczy)
	AI_Output (other, self ,"DIA_Hakan_QUEST1_15_03"); //Mo�esz si� do mnie odezwa�. Odpowiedz na pytanie.
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_04"); //Mistrzu, nie wiem dlaczego si� do mnie odezwa�e�, ale...
	}
	else
	{
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_05"); //Wci�� czuj� si� �le. Opadam z si�y. Coraz trudniej mi oddycha�. 
	AI_Output (self, other ,"DIA_Hakan_QUEST1_03_06"); //Potrzebuj� lekarstwa, inaczej zgin�.
	};
	Wld_InsertItem 	(ItMi_RecipeAganistPlague, 			"FP_ITEM_PLAGUE_MESSAGE");
	B_LogEntry               (CH4_SickHakan,"Hakan jest w kiepskim stanie. Musz� przygotowa� dla niego lekarstwo, inaczej zginie. Chyba zajrz� do pracowni Kaloma...");
};

//========================================
//-----------------> LEKI
//========================================

INSTANCE DIA_Hakan_LEKI (C_INFO)
{
   npc          = NOV_1375_Hakan;
   nr           = 4;
   condition    = DIA_Hakan_LEKI_Condition;
   information  = DIA_Hakan_LEKI_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie lek!";
};

FUNC INT DIA_Hakan_LEKI_Condition()
{
    if (MIS_SickHakan == LOG_RUNNING)
    && (Npc_HasItems (other, ItMis_Drug) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hakan_LEKI_Info()
{
    AI_Output (other, self ,"DIA_Hakan_LEKI_15_01"); //Mam twoje lek!
    AI_Output (self, other ,"DIA_Hakan_LEKI_15_02"); //Wielkie dzi�ki. To moja ostatnia nadzieja. 
	B_GiveInvItems (other, self, ItMis_Drug, 1);
	AI_UseItem (self, ItMis_Drug);
	AI_Output (self, other ,"DIA_Hakan_LEKI_15_03"); //P�jd� teraz odpocz��. Jestem ci bardzo wdzi�czny.
	
    B_LogEntry               (CH4_SickHakan,"Odda�em lekarstwo Hakanowi. Mam nadziej�, �e jego stan si� poprawi. ");
    Log_SetTopicStatus       (CH4_SickHakan, LOG_SUCCESS);
    MIS_SickHakan = LOG_SUCCESS;
    B_GiveXP (XP_SickLumberjack);
};

//////////////////////////////////////////////////////////////////
// Seria zab�jstw w Bractwie
///////////////////////////////////////////////////////////////////

instance dia_hakan_pickpocket(c_info) {
    npc = nov_1375_hakan;
    nr = 900;
    condition = dia_hakan_pickpocket_condition;
    information = dia_hakan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hakan_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 15);
};

func void dia_hakan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hakan_pickpocket);
	info_addchoice(dia_hakan_pickpocket, dialog_back, dia_hakan_pickpocket_back);
	info_addchoice(dia_hakan_pickpocket, dialog_pickpocket, dia_hakan_pickpocket_doit);
};

func void dia_hakan_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hakan_pickpocket);
};

func void dia_hakan_pickpocket_back() {
    info_clearchoices(dia_hakan_pickpocket);
};