//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_osko_EXIT(C_INFO)
{
	npc             = NON_2706_osko;
	nr              = 999;
	condition	= DIA_osko_EXIT_Condition;
	information	= DIA_osko_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_osko_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_osko_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoJu
//========================================

INSTANCE DIA_osko_WhoJu (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_osko_WhoJu_Condition;
   information  = DIA_osko_WhoJu_Info;
   permanent	= false;
   description	= "Kim jeste�?";
};

FUNC INT DIA_osko_WhoJu_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_WhoJu_Info()
{
    AI_Output (other, self ,"DIA_osko_WhoJu_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_osko_WhoJu_03_02"); //Hmm? Jestem Osko. Poluj� na ork�w razem z band� Wilsona. Mia�e� du�o szcz�cia, �e uda�o ci si� tu dotrze� w jednym kawa�ku.
	AI_Output (other, self ,"DIA_osko_WhoJu_15_03"); //Wspi��em si� tu po �cianie skalnej.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_04"); //To oczywiste. Nie da�by� rady przej�� od strony Ziem Ork�w. Wej�cie do obozu jest zabarykadowane. Poza tym nik�e szanse, �e w og�le by� do niego dotar�. 
	AI_Output (self, other ,"DIA_osko_WhoJu_03_05"); //Nie zmienia to faktu, �e droga przez ska�y te� nie jest �atwa. Jeden fa�szywy ruch i l�dujesz na ziemi ze skr�conym karkiem.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_06"); //Poni�ej, w szczelinie skalnej mieszka pewien staruszek. Rozmawia�em z nim kiedy�. Uciek� ze Starego Obozu kilka lat temu, a ja obieca�em, �e go nie wydam.
	AI_Output (self, other ,"DIA_osko_WhoJu_03_07"); //No bo w sumie po co? Nie nadepn�� mi na odcisk, a za Stra�nikami z Obozu niezbyt przepadam, wi�c niech sobie tu �yje. 
	AI_Output (other, self ,"DIA_osko_WhoJu_15_08"); //Do czego zmierzasz?
	AI_Output (self, other ,"DIA_osko_WhoJu_03_09"); //Ten staruszek pomimo lat wci�� potrafi si� nie�le wspina�. My�l�, �e gdyby� z nim pogada�, m�g�by ci� czego� nauczy�.
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"�owca ork�w Osko zdradzi� mi, �e w jaskini w pobli�u ich obozu mieszka niezwykle zr�czny staruszek. Je�li go poprosz�, mo�e nauczy mnie akrobatyki.");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_osko_HELLO5 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 5;
   condition    = DIA_osko_HELLO5_Condition;
   information  = DIA_osko_HELLO5_Info;
   permanent	= FALSE;
   description	= "Dlaczego polujecie na ork�w?";
};

FUNC INT DIA_osko_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO5_15_01"); //Dlaczego polujecie na ork�w?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_02"); //A dlaczego by nie? Co mamy lepszego do roboty pod Barier�?
    AI_Output (self, other ,"DIA_osko_HELLO5_03_03"); //Wyobra� sobie, �e kiedy� uciekniemy z tego okropnego miejsca. Wtedy umiej�tno�ci si� przydadz�. Zw�aszcza, �e na kontynencie trwa wojna.
    AI_Output (self, other ,"DIA_osko_HELLO5_03_04"); //Sko�czy�y si� czasy w kt�rych do stra�y miejskiej przyjmowa�o si� byle kogo. W czasie wojny s�abi pracuj� w polu, a silni walcz�. 
	AI_Output (other, self ,"DIA_osko_HELLO5_15_05"); //Dobrze rozumiem, �e je�li uda�oby ci si� st�d uciec, to zaci�gn��by� si� do stra�y miejskiej, by walczy� z orkami?
	AI_Output (self, other ,"DIA_osko_HELLO5_03_06"); //Gdybym mia� okazj�, to owszem. Stra�nicy dostaj� �o�d, zni�ki w burdelach i mieszka�cy ich szanuj�. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_07"); //Od czasu do czasu musia�bym tylko ubi� jakiego� orka, kt�ry niebezpiecznie si� zbli�y�. 
	AI_Output (self, other ,"DIA_osko_HELLO5_03_08"); //Nic nadzwyczajnego. Tutaj robi� to codziennie. 
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_osko_HELLO6 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 6;
   condition    = DIA_osko_HELLO6_Condition;
   information  = DIA_osko_HELLO6_Info;
   permanent	= FALSE;
   description	= "To trudna praca?";
};

FUNC INT DIA_osko_HELLO6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_osko_HELLO6_15_01"); //To trudna praca?
    AI_Output (self, other ,"DIA_osko_HELLO6_03_02"); //Oczywi�cie, �e tak. Orkowie to twardzi przeciwnicy.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_03"); //Trzeba atakowa� szybko i mocno. Nie mo�na si� waha�.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_04"); //Aby dobrze walczy� z orkami, musisz p�ynnie pos�ugiwa� si� swoim or�em.
    AI_Output (self, other ,"DIA_osko_HELLO6_03_05"); //Nie zawsze liczy si� tylko si�a.
};

//========================================
//-----------------> LegendaModdingu
//========================================

INSTANCE DIA_osko_LegendaModdingu (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 6;
   condition    = DIA_osko_LegendaModdingu_Condition;
   information  = DIA_osko_LegendaModdingu_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi opowiedzie� jeszcze co� ciekawego?";
};

FUNC INT DIA_osko_LegendaModdingu_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_LegendaModdingu_Info()
{
    AI_Output (other, self ,"DIA_osko_LegendaModdingu_15_01"); //Mo�esz mi opowiedzie� jeszcze co� ciekawego?
    AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_02"); //W�a�nie przypomnia�em sobie pewn� legend�...
    AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_03"); //Wieki temu, jeszcze przed powstaniem Bariery w G�rniczej Dolinie zjawi� si� tajemniczy Przybysz.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_04"); //By� to cz�owiek niezwykle uzdolniony. Pono� walczy� mieczem niczym najznamienitszy z wojownik�w, a cios jego by� r�wny sile uderzaj�cej �apy trolla.
    AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_05"); //Oko jego by�o stworzone do �uku, a r�ka mimo i� ci�ka potrafi�a wyci�gn�� z kieszeni bogaczy najr�niejsze skarby. 
    AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_06"); //I ta w�a�nie r�ka pewnego dnia go zawiod�a. Nasz tajemniczy Przybysz wybra� ongi� si� do klasztoru Zmiennokszta�tnych.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_07"); //Zale�a�o mu pono� na jakim� cennym artefakcie. W klasztorze opisa� si� jako handlarza.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_08"); //Mia� ze sob� r�ne sk�adniki alchemiczne i rzemie�lnicze. Od w�gla, po sztabki stali, a� po przyn�t� dla ryb. 
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_09"); //Zmiennokszta�tni uwierzyli w jego histori� i wpu�cili do klasztoru. Sp�dzi� tam kilka dni.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_10"); //Pi�tego dnia dokona� odwa�nej pr�by kradzie�y na najznamienitszym spo�r�d cz�onk�w gildii. Natychmiast go przy�apano.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_11"); //Jego niedosz�a ofiara wpad�a w sza�. Przybysz musia� zosta� ukarany. 
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_12"); //Jako, �e Zmiennokszta�tni doskonalili sztuk� transmutacji, postanowili wykorzysta� go jako sw�j eksperyment.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_13"); //Przetestowali na nim zakl�cie przemiany w k�sacza. S�uch ci� nie myli. W k�sacza...
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_14"); //Czar zadzia�a�. Cz�owiek w jednej chwili sta� si� potworem, ale nie utraci� swojej si�y.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_15"); //Powali� magus�w i pu�ci� si� w szale�czy p�d, kt�ry zako�czy� dopiero na Ziemiach Ork�w.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_16"); //Legenda g�osi, �e kr�ci si� tutaj po dzi� dzie�. Zgin�� bowiem mo�e tylko z r�ki wojownika. Staro�� mu niestraszna.
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_17"); //Wi�c gdyby� kiedy� przy szlachtowaniu k�saczy w ciele jednego z nich znalaz� rozmaite skarby, w�gle i stal najcudowniejsz�...
	AI_Output (self, other ,"DIA_osko_LegendaModdingu_03_18"); //... to wiec �e� zaszlachtowa� pradawnego Przybysza, wojownika, handlarza, co Zmiennokszta�tnych magus�w oszuka� pragn��.
};
	
	
//========================================
//-----------------> PROWOKACJA_DO_QUESTA
//========================================

INSTANCE DIA_osko_PROWOKACJA_DO_QUESTA (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_PROWOKACJA_DO_QUESTA_Condition;
   information  = DIA_osko_PROWOKACJA_DO_QUESTA_Info;
   permanent	= FALSE;
   description	= "Jak tam sytuacja w obozie?";
};

FUNC INT DIA_osko_PROWOKACJA_DO_QUESTA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_osko_PROWOKACJA_DO_QUESTA_Info()
{
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_01"); //Jak tam sytuacja w obozie?
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_02"); //Jak na razie wszystko pod kontrol�, orkowie trzymaj� si� od nas z dala. A jak kt�ry� z nich zapu�ci si� zbyt blisko naszego obozu, szybko tego �a�uje.
	AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_03"); //Ostatnio jednak zdarzy�o si� co� dziwnego, jak masz chwilk� mog� ci opowiedzie�.
    AI_Output (other, self ,"DIA_osko_PROWOKACJA_DO_QUESTA_15_04"); //Mam czas, opowiadaj.
    AI_Output (self, other ,"DIA_osko_PROWOKACJA_DO_QUESTA_03_05"); //Najpierw przynie� mi piwo, bo troch� zasch�o mi w ustach.
};

//========================================
//-----------------> QUEST_HUGO_START
//========================================

INSTANCE DIA_osko_QUEST_HUGO_START (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 2;
   condition    = DIA_osko_QUEST_HUGO_START_Condition;
   information  = DIA_osko_QUEST_HUGO_START_Info;
   permanent	= FALSE;
   description	= "Prosz� bardzo. Wypij moje zdrowie.";
};

FUNC INT DIA_osko_QUEST_HUGO_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_PROWOKACJA_DO_QUESTA))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_QUEST_HUGO_START_Info()
{
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_01"); //Prosz� bardzo. Wypij moje zdrowie.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_StandUp (self);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_02"); //Dzi�ki. No wi�c tak... W naszym obozie jeszcze kilka dni temu by� jeszcze jeden �owca. Nazywa� si� Hugo i troch� za bardzo interesowa� si� orkow� kultur�. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_03"); //Wiesz, zanim wsadzi� jakiemu� orkowi top�r w dup�, wpierw troch� go torturowa�, pytaj�c o r�ne rzeczy.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_04"); //W ka�dym razie jaki� tydzie� temu walczyli�my z grupk� ork�w w ruinach starej Cytadeli, na najwy�szej g�rze Kolonii. 
	AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_05"); //Hugo po walce znalaz� przy zw�okach orkowego przyw�dcy jak�� map�. Po tym jak wr�cili�my do obozu, studiowa� j� przez dwa dni, po czym znikn�� bez �ladu nikomu nic nie m�wi�c.
    AI_Output (self, other ,"DIA_osko_QUEST_HUGO_START_03_06"); //Ja i reszta ch�opak�w jeste�my troch� tym faktem zmartwieni. Hugo to �wietny wojownik i wie jak traktowa� ork�w. Szkoda by�oby straci� kogo� takiego. Je�li gdzie� go spotkasz, daj mi zna�. 
    AI_Output (other, self ,"DIA_osko_QUEST_HUGO_START_15_07"); //W porz�dku. Je�li go gdzie� spotkam, to si� o tym dowiesz.
    MIS_HunterHugo = LOG_RUNNING;

    Log_CreateTopic          (CH1_HunterHugo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_RUNNING);
    B_LogEntry               (CH1_HunterHugo,"Osko zdradzi� mi, �e w obozie �owc�w ork�w by� jeszcze jeden my�liwy imieniem Hugo. Pono� bardzo interesowa�a go kultura ork�w. By� dosy� osobliwym cz�owiekiem, ale potrafi� sobie poradzi� w niebezpiecze�stwie. Musz� go poszuka�. Z pewno�ci� jest gdzie� w pobli�u obozu. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ODKRYLEM
//========================================

INSTANCE DIA_osko_ODKRYLEM (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 1;
   condition    = DIA_osko_ODKRYLEM_Condition;
   information  = DIA_osko_ODKRYLEM_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.";
};

FUNC INT DIA_osko_ODKRYLEM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_osko_ODKRYLEM_Info()
{
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_01"); //Odnalaz�em Hugo, pomog�em mu w pewnej sprawie. Powinien wkr�tce wr�ci�.
    AI_Output (self, other ,"DIA_osko_ODKRYLEM_03_02"); //Dobra robota, ciesz� si�, �e taki kawa� wojownika jak on nie da� si� tak �atwo zabi�. Oto 100 bry�ek rudy za informacje.
    AI_Output (other, self ,"DIA_osko_ODKRYLEM_15_03"); //Dzi�ki. 
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry     (CH1_HunterHugo,"Powiedzia�em Osko o tym, �e znalaz�em Hugo i pomog�em mu rozwi�za� jego problemy.");
    Log_SetTopicStatus       (CH1_HunterHugo, LOG_SUCCESS);
    MIS_HunterHugo = LOG_SUCCESS;

    B_GiveXP (200);
};


//--------------------------------------------------------------------------------1.6.1-----------------------------------------------------------------------------------------------

//========================================
//-----------------> Przegrupowania Ork�w
//========================================

INSTANCE DIA_Osko_Przegrupowania_Orkow (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_Osko_Przegrupowania_Orkow_Condition;
   information  = DIA_Osko_Przegrupowania_Orkow_Info;
   permanent	= false;
   description	= "Szykuje si� powa�na robota.";
};

FUNC INT DIA_Osko_Przegrupowania_Orkow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Wilson_Przegrupowania_Prin))
{
    return TRUE;
};
};
FUNC VOID DIA_Osko_Przegrupowania_Orkow_Info()
{
    AI_Output (other, self ,"DIA_Osko_Przegrupowania_Orkow_15_01"); //Szykuje si� powa�na robota.
    AI_Output (self, other ,"DIA_Osko_Przegrupowania_Orkow_03_02"); //Zak�adam, �e ma to co� wsp�lnego z ostatnimi manewrami w�r�d Ork�w.
	AI_Output (other, self ,"DIA_Osko_Przegrupowania_Orkow_15_03"); //Zgad�e�. Nale�y zabi� ich trzech herszt�w. Wilson m�wi�, �e mamy to zrobi� razem z Rakusem.
	AI_Output (self, other ,"DIA_Osko_Przegrupowania_Orkow_03_04"); //Wreszcie co� zacz�o si� dzia�! Ju� zacz��em si� nudzi�.
	AI_Output (self, other ,"DIA_Osko_Przegrupowania_Orkow_03_05"); //Je�li chodzi o mnie mo�emy rusza� natychmiast. B�d� czeka� przed obozem.
    Npc_ExchangeRoutine(NON_2706_osko,"POWait");
	
};



//========================================
//-----------------> Przegrupowania Ork�w
//========================================

INSTANCE DIA_Osko_Przegrupowania_GR1 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_Osko_Przegrupowania_GR1_Condition;
   information  = DIA_Osko_Przegrupowania_GR1_Info;
   permanent	= false;
   important    = TRUE;
};

FUNC INT DIA_Osko_Przegrupowania_GR1_Condition()
{
	if (Npc_IsDead (OrcGeneral_Move_01)) && (Npc_KnowsInfo(hero,DIA_Rakus_Atak_Orkow))
{
    return TRUE;
};
};
FUNC VOID DIA_Osko_Przegrupowania_GR1_Info()
{
    AI_GotoNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Osko_Przegrupowania_GR1_03_01"); //Dobry pocz�tek. Kocham t� robot�.
    AI_Output (other, self ,"DIA_Osko_Przegrupowania_GR1_15_02"); //W�a�ciwy cz�owiek na w�a�ciwym miejscu. Ale pogadamy p�niej teraz czas na kolejnego dow�dce.
    B_LogEntry               (PrzegrupowaniaOrkow,"Pokonali�my pierwszego dow�dc� Ork�w. Dobry pocz�tek.");
};




//========================================
//-----------------> Przegrupowania Ork�w
//========================================

Func void Hero_Teleport_PO()
{

AI_Teleport(hero,"LOCATION_02_05");
AI_StopProcessInfos(self);
};


INSTANCE DIA_Osko_Przegrupowania_GR3 (C_INFO)
{
   npc          = NON_2706_osko;
   nr           = 4;
   condition    = DIA_Osko_Przegrupowania_GR3_Condition;
   information  = DIA_Osko_Przegrupowania_GR3_Info;
   permanent	= false;
   important    = TRUE;
};

FUNC INT DIA_Osko_Przegrupowania_GR3_Condition()
{
	if (Npc_IsDead (OrcGeneral_Move_03)) && (Npc_KnowsInfo(hero,DIA_Rakus_Atak_Orkow))
{
    return TRUE;
};
};
FUNC VOID DIA_Osko_Przegrupowania_GR3_Info()
{
    AI_GotoNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Osko_Przegrupowania_GR3_03_01"); //Ufff. No i zn�w zrobili�my swoje. Orkowie nie pr�dko si� otrz�sn�!.
	AI_Output (other, self ,"DIA_Osko_Przegrupowania_GR3_15_02"); //I o to chodzi�o. Czas zameldowa� to Wilsonowi.
	B_LogEntry               (PrzegrupowaniaOrkow,"Ostatni orkowy dow�dca nie �yje. Pora zameldowa� to Wilsonowi.");
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = FALSE;
	NON_2706_osko.aivar[AIV_PARTYMEMBER]  = FALSE;
	Npc_ExchangeRoutine(NON_2705_Rakus,"Start");
    Npc_ExchangeRoutine(NON_2706_osko, "Start");
	
	
	Info_ClearChoices	(DIA_Osko_Przegrupowania_GR3);
    Info_AddChoice		(DIA_Osko_Przegrupowania_GR3, "(Wr�� do obozu)", DIA_Osko_Przegrupowania_END);
	Info_AddChoice		(DIA_Osko_Przegrupowania_GR3, "(Zajmij si� swoimi sprawami)", DIA_Osko_Przegrupowania_ENDGO);
};

FUNC VOID DIA_Osko_Przegrupowania_END()
{
AI_StopProcessInfos(self);
AI_Teleport(Hero,"LOCATION_02_05");
Hero_Teleport_PO();
};


FUNC VOID DIA_Osko_Przegrupowania_ENDGO()
{
  
	AI_Output (other, self ,"DIA_Osko_Przegrupowania_ENDGO_15_01"); //Do zobaczenia w obozie.
    AI_Output (self, other ,"DIA_Osko_Przegrupowania_ENDGO_03_02"); //Trzymaj si�.
	AI_StopProcessInfos(self);
};

instance dia_osko_pickpocket(c_info) {
    npc = non_2706_osko;
    nr = 900;
    condition = dia_osko_pickpocket_condition;
    information = dia_osko_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_osko_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_osko_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_osko_pickpocket);
	info_addchoice(dia_osko_pickpocket, dialog_back, dia_osko_pickpocket_back);
	info_addchoice(dia_osko_pickpocket, dialog_pickpocket, dia_osko_pickpocket_doit);
};

func void dia_osko_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_osko_pickpocket);
};

func void dia_osko_pickpocket_back() {
    info_clearchoices(dia_osko_pickpocket);
};



