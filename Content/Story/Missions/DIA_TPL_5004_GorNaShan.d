//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Shan_EXIT(C_INFO)
{
	npc             = TPL_5004_Shan;
	nr              = 999;
	condition	= DIA_Shan_EXIT_Condition;
	information	= DIA_Shan_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Shan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Shan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Shan_WORK (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_WORK_Condition;
   information  = DIA_Shan_WORK_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Shan_WORK_Condition()
{
	if (kapitel < 3) {
    return TRUE; };
};

FUNC VOID DIA_Shan_WORK_Info()
{
    AI_Output (other, self ,"DIA_Shan_WORK_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Shan_WORK_03_02"); //S³u¿ê Y'Berionowi rad¹, opiekujê siê œwi¹tyni¹, dbam o drobne sprawy.
    AI_Output (other, self ,"DIA_Shan_WORK_15_03"); //Pewnie du¿o z tym zamieszania.
    AI_Output (self, other ,"DIA_Shan_WORK_03_04"); //Nie jest tak Ÿle. Palê ziele, aby uspokoiæ mojego ducha.
};


//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Shan_HELLO (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_HELLO_Condition;
   information  = DIA_Shan_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Shan_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Shan_HELLO_03_01"); //Witaj, przybyszu! Nazywam siê Shan, pokorny s³uga Œni¹cego.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_02"); //Jestem pomocnikiem Y'Beriona. Wydajê tak¿e polecenia.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_03"); //Je¿eli szukasz pracy, zg³oœ siê do mnie.
};

///////////////////////////
// GURU 
//////////////////////////

//========================================
//-----------------> SZEF
//========================================

INSTANCE DIA_Shan_SZEF (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SZEF_Condition;
   information  = DIA_Shan_SZEF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shan_SZEF_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Shan_SZEF_Info()
{
    AI_Output (self, other ,"DIA_Shan_SZEF_03_01"); //Mistrzu, mamy kilka spraw, którymi natychmiast musisz siê zaj¹æ.
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Shan_QUEST1 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 2;
   condition    = DIA_Shan_QUEST1_Condition;
   information  = DIA_Shan_QUEST1_Info;
   permanent	= FALSE;
   description	= "Od czego zaczynamy?";
};

FUNC INT DIA_Shan_QUEST1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Shan_SZEF))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Shan_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_01"); //Od czego zaczynamy?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_02"); //Podczas rytua³u przywo³ania Œni¹cego na placu jak i w œwi¹tyni by³o niema³e zamieszanie.
	AI_Output (other, self ,"DIA_Shan_QUEST1_15_03"); //Co w zwi¹zku z tym?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_04"); //Wszed³ tu jeden z Nowicjuszy i zabra³ Kostur Œwiat³a nale¿¹cy do Y'Beriona. 
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_05"); //To bardzo wa¿ne, aby go odzyskaæ. Jest nam potrzebny do ceremonii pogrzebu Mistrza.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_06"); //Kostur musi siê znaleŸæ w jego grobie. 
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_07"); //Gdzie mam zacz¹æ poszukiwania?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_08"); //Popytaj ludzi bêd¹cych na placu. Mówi siê, ¿e z³odziej bardzo szybko wybieg³ i wpad³ po drodze na naszych braci.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_09"); //Mo¿e ktoœ coœ wie...
    MIS_StolenStaff = LOG_RUNNING;

    Log_CreateTopic          (CH3_StolenStaff, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StolenStaff, LOG_RUNNING);
    B_LogEntry               (CH3_StolenStaff,"Shan kaza³ mi znaleŸæ z³odzieja, który w³ama³ siê do œwi¹tyni podczas rytua³u przywo³ania i ukrad³ kostur Y'Beriona. Rabuœ wypad³ ze œwi¹tyni jak oszala³y. Z pewnoœci¹ potr¹ci³ kogoœ na placu. Tam powinienem szukaæ wskazówek.");
};
//========================================
//-----------------> QUEST1_WIN
//========================================

INSTANCE DIA_QUEST1_QUEST1_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 3;
   condition    = DIA_QUEST1_QUEST1_WIN_Condition;
   information  = DIA_QUEST1_QUEST1_WIN_Info;
   permanent	= FALSE;
   description	= "Odzyska³em skradziony kostur.";
};

FUNC INT DIA_QUEST1_QUEST1_WIN_Condition()
{
    if (Npc_HasItems (other, Stab_des_Lichts) >=1) && (MIS_StolenStaff == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_QUEST1_QUEST1_WIN_Info()
{
    AI_Output (other, self ,"DIA_QUEST1_QUEST1_WIN_15_01"); //Odzyska³em skradziony kostur.
    AI_Output (self, other ,"DIA_QUEST1_QUEST1_WIN_03_02"); //Proszê, daj mi go. Zajmê siê jego przechowaniem.
    B_LogEntry           (CH3_StolenStaff,"Odda³em skradziony kostur Shanowi. On dopilnuje, by broñ zosta³a zabezpieczona razem z cia³em Y'Beriona.");
    Log_SetTopicStatus   (CH3_StolenStaff, LOG_SUCCESS);
    MIS_StolenStaff = LOG_SUCCESS;
	
    B_GiveInvItems (other, self, Stab_des_Lichts, 1);

    B_GiveXP (150);
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_Shan_QUEST2 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 4;
   condition    = DIA_Shan_QUEST2_Condition;
   information  = DIA_Shan_QUEST2_Info;
   permanent	= FALSE;
   description	= "Co jeszcze jest do zrobienia?";
};

FUNC INT DIA_Shan_QUEST2_Condition()
{
    if (MIS_StolenStaff == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_01"); //Co jeszcze jest do zrobienia?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_02"); //Ca³kiem sporo...
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_03"); //Dowiedzia³em siê, ¿e w Obozie odbywa siê utajniony obrót amuletami i talizmanami. Ktoœ sprzedaje takie artefakty po zawy¿onej cenie.
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_04"); //Nie podoba mi siê to. Tylko Guru maj¹ wy³¹cznoœæ na sprzeda¿ magicznych przedmiotów. Powinieneœ siê tym jak najszybciej zaj¹æ.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_05"); //Dlaczego to takie wa¿ne?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_06"); //Sk¹d to pytanie? Magiczne artefakty maj¹ potê¿na moc. W niepowo³anych rêkach mog¹ wyrz¹dziæ wiele szkód. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_07"); //Tylko Guru maj¹ wystarczaj¹co du¿o doœwiadczenia, by móc oceniæ, czy Nowicjusz ma czyste intencje. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_08"); //Miej te¿ na uwadze, ¿e od kiedy dowiedzieliœmy siê, ¿e Œni¹cy jest demonem, ludzie w Obozie zaczynaj¹ wariowaæ. 
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_09"); //Po prostu znajdŸ tego cz³owieka i naka¿ mu oddaæ wszystkie b³yskotki Baal Cadarowi.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_10"); //Mo¿esz mnie jakoœ naprowadziæ?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_11"); //Twoim punktem zaczepienia powinna byæ rozmowa z Talasem. To on poinformowa³ mnie o tym procederze.
    MIS_StrangeResearcher = LOG_RUNNING;

    Log_CreateTopic          (CH3_StrangeResearcher, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_RUNNING);
    B_LogEntry               (CH3_StrangeResearcher,"Shan kaza³ mi odkryæ kto w Obozie prowadzi badania nad bagnem. Wskazówk¹ jest to, ¿e osoba handluje poszukiwanymi przez Y'Beriona przedmiotami.");
};

//========================================
//-----------------> QUEST2_WIN
//========================================

INSTANCE DIA_Shan_QUEST2_WIN (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 5;
   condition    = DIA_Shan_QUEST2_WIN_Condition;
   information  = DIA_Shan_QUEST2_WIN_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em tego handlarza.";
};

FUNC INT DIA_Shan_QUEST2_WIN_Condition()
{
    if (MIS_StrangeResearcher == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Steh_QUEST2_YOU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QUEST2_WIN_Info()
{
    AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_01"); //Odnalaz³em tego handlarza. Nie bêdzie ju¿ sprzedawa³ artefaktów.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_02"); //Zgodzi³ siê nawet oddaæ je do œwi¹tyni. Nazywa siê Steh.
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_03"); //Doskonale. Teraz amulety i pierœcienie nie wpadn¹ w niepowo³ane rêce. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_04"); //Mimo to odczuliœmy ju¿ skutki niepos³uszeñstwa Steha.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_05"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_06"); //Porozmawiamy o tym za chwilê. Mistrzu, weŸ tê rudê ze skrzyni Y'Beriona.
    B_LogEntry               (CH3_StrangeResearcher,"Powiedzia³em Shanowi o mojej rozmowie ze Stehem. By³ zadowolony, ale jednoczeœnie zaniepokojony. Widocznie sta³o siê coœ z³ego.");
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_SUCCESS);
    MIS_StrangeResearcher = LOG_SUCCESS;

    B_GiveXP (120);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	AI_StopProcessInfos (self);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> QuestCH3
//========================================

INSTANCE DIA_Shan_QuestCH3 (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_QuestCH3_Condition;
   information  = DIA_Shan_QuestCH3_Info;
   permanent	= FALSE;
   description	= "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_Shan_QuestCH3_Condition()
{
    if (Kapitel >= 3)
    && (Npc_GetTrueGuild(hero) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_QuestCH3_Info()
{
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_01"); //Mogê coœ dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_02"); //Jest pewna sprawa, któr¹ móg³byœ siê zaj¹æ.
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_04"); //Ktoœ z naszych sprzedaje eliksir z wnêtrznoœci pe³zaczy do pozosta³ych obozów.
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_05"); //Dowiedz siê, kto to jest i natychmiast mi o tym powiedz. Nie wiem od czego mia³byœ zacz¹æ. Spróbuj pogadaæ z handlarzami.
    MIS_SellElixer = LOG_RUNNING;

    Log_CreateTopic          (CH3_SellElixer, LOG_MISSION);
    Log_SetTopicStatus       (CH3_SellElixer, LOG_RUNNING);
    B_LogEntry               (CH3_SellElixer,"Shan kaza³ mi odkryæ, kto nielegalnie sprzedaje eliksir z wnêtrznoœci pe³zaczy. Towar trafia do pozosta³ych obozów. Powinienem popytaæ wœród handlarzy.");
    AI_StopProcessInfos	(self);
	
	var c_npc dexter;
	dexter = Hlp_GetNpc(STT_329_Dexter);
	CreateInvItems (dexter, ItFo_Potion_Elixier_Egg, 3);
};

//========================================
//-----------------> SellElixirCaine
//========================================

INSTANCE DIA_Shan_SellElixirCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_SellElixirCaine_Condition;
   information  = DIA_Shan_SellElixirCaine_Info;
   permanent	= FALSE;
   description	= "Uda³o mi siê odnaleŸæ sprzedawcê eliksiru.";
};

FUNC INT DIA_Shan_SellElixirCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_SellElixirCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_01"); //Uda³o mi siê odnaleŸæ sprzedawcê eliksiru. To Nowicjusz Caine.
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_02"); //Próbowa³ mnie przekupiæ, ale nie przyj¹³em jego propozycji.
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_03"); //Caine? Nieprawdopodobne. Nie spodziewa³em siê tego po nim. Jest zaufanym cz³owiekiem Cor Kaloma.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_04"); //Ju¿ chyba nim nie bêdzie...
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_05"); //Oczywiœcie, spotka go kara, jednak w¹tpiê, ¿e zniknie z Obozu. Jego doœwiadczenie jest dla nas bardzo wa¿ne.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_06"); //Jaki problem przyuczyæ kogoœ nowego do pomocy?
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Wiesz, to wymaga czasu. Mamy teraz wa¿niejsze sprawy na g³owie. Jednak porozmawiam o tym z mistrzem Kalomem.
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Tak czy inaczej, dobrze siê spisa³eœ. Oto twoja nagroda. 
	
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
	
    B_LogEntry               (CH3_SellElixer,"Powiedzia³em o wszystkim Shanowi. Caina chyba jednak nie spotka tak bolesna kara, jak s¹dzi³em. Niemniej jednak zachowa³em siê uczciwie, za co Shan mnie wynagrodzi³.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_SUCCESS);
    MIS_SellElixer = LOG_SUCCESS;

    B_GiveXP (XP_SellElixer);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LieAboutCaine
//========================================

INSTANCE DIA_Shan_LieAboutCaine (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_LieAboutCaine_Condition;
   information  = DIA_Shan_LieAboutCaine_Info;
   permanent	= FALSE;
   description	= "Nie uda³o mi siê znaleŸæ sprzedawcy eliksiru.";
};

FUNC INT DIA_Shan_LieAboutCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    && (CaineFriend == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_LieAboutCaine_Info()
{
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_01"); //Nie uda³o mi siê znaleŸæ sprzedawcy eliksiru.
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_02"); //Sprawdzi³em wszystkie poszlaki, jednak trop siê urwa³.
    AI_Output (self, other ,"DIA_Shan_LieAboutCaine_03_03"); //Nie cieszy mnie ta wiadomoœæ. Oznacza to, ¿e zdrajca jest wci¹¿ na wolnoœci. 
	AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_04"); //Có¿, bêdê musia³ poleciæ pozosta³ym Œwi¹tynnym by mieli tê sprawê na uwadze. 
    
    B_LogEntry               (CH3_SellElixer,"Powiedzia³em Shanowi, ¿e trop w sprawie siê urwa³. Wprawdzie zawali³em zadanie, jednak sporo zarobi³em.");
    Log_SetTopicStatus       (CH3_SellElixer, LOG_FAILED);
    MIS_SellElixer = LOG_FAILED;
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Uwolnieni
//========================================

INSTANCE DIA_Shan_Uwolnieni (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_Uwolnieni_Condition;
   information  = DIA_Shan_Uwolnieni_Info;
   permanent	= FALSE;
   description	= "Uwolni³em braci!";
};

FUNC INT DIA_Shan_Uwolnieni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaKosh_Ocaleni))
    && (MIS_HelpBrothersBra == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_Uwolnieni_Info()
{
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_01"); //Uwolni³em braci!
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_02"); //Zostali uwiêzieni za wielk¹ krat¹ s³u¿¹c¹ jako brama do Starej Kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_03"); //Dobra robota, Stra¿niku.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_04"); //Masz ze sob¹ jakieœ wieœci z tamtej czêœci Kolonii?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_05"); //Sytuacja nie wygl¹da najlepiej.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_06"); //Artegor siê zbuntowa³ i utworzy³ w³asny obóz przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_07"); //Obóz ten nie podlega³ Gomezowi.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_08"); //Jednak, gdy Magnat dowiedzia³ siê o buncie, wys³a³ olbrzymi oddzia³ swoich ludzi w kierunku kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_09"); //Co siê sta³o potem?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_10"); //Wszyscy zginêli! Pozosta³ tylko Artegor, który pozwoli³ mi uwolniæ Gor Na Kosha i innych.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_11"); //Wykaza³eœ siê nie lada odwag¹.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_12"); //Jestem pe³en podziwu.
    B_LogEntry                     (CH1_HelpBrothersBra,"Przekaza³em Shanowi informacje o wydarzeniach z Kolonii. Przy okazji zosta³em wynagrodzony za uwolnienie braci z kopalni.");
    Log_SetTopicStatus       (CH1_HelpBrothersBra, LOG_SUCCESS);
    MIS_HelpBrothersBra = LOG_SUCCESS;

    B_GiveXP (550);
    //CreateInvItems (self, ItMiNugget, 200);
    //B_GiveInvItems (self, other, ItMiNugget, 200);
    CreateInvItems (self, ItMw_2H_Sword_Heavy_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Sword_Heavy_01, 1);
    AI_StopProcessInfos	(self);
};
	//========================================
//-----------------> DRAX_IMPORTANT
//========================================

INSTANCE DIA_Shan_DRAX_IMPORTANT (C_INFO)
{
   npc          = TPL_5004_Shan;
   nr           = 1;
   condition    = DIA_Shan_DRAX_IMPORTANT_Condition;
   information  = DIA_Shan_DRAX_IMPORTANT_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Draxem.";
};

FUNC INT DIA_Shan_DRAX_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Ded))
    && (MIS_HuntersSupport == LOG_SUCCESS)
    && (second_d_Shan == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Shan_DRAX_IMPORTANT_Info()
{
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_01"); //Rozmawia³em z Draxem.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_03"); //Pomog³em Bandytom zorganizowaæ atak na patrole Gomeza. Œci¹gn¹³em im do pomocy ³owców orków.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_04"); //Mam nadziejê, ¿e sobie poradz¹.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_05"); //No dobrze. Proponujê ci, abyœ uda³ siê w okolice Nowego Obozu. Grupa Najemników prowadzi tam walki ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_06"); //Powinieneœ im pomóc.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_08"); //Stra¿nicy staj¹ siê coraz wiêkszym zagro¿eniem równie¿ dla naszego Obozu. 
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_09"); //Dlatego musisz wesprzeæ naszych braci z Nowego Obozu.
    B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Muszê udaæ siê w kierunku Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami. ");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

instance dia_shan_pickpocket(c_info) {
    npc = tpl_5004_shan;
    nr = 900;
    condition = dia_shan_pickpocket_condition;
    information = dia_shan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_shan_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 35);
};

func void dia_shan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_shan_pickpocket);
	info_addchoice(dia_shan_pickpocket, dialog_back, dia_shan_pickpocket_back);
	info_addchoice(dia_shan_pickpocket, dialog_pickpocket, dia_shan_pickpocket_doit);
};

func void dia_shan_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_shan_pickpocket);
};

func void dia_shan_pickpocket_back() {
    info_clearchoices(dia_shan_pickpocket);
};