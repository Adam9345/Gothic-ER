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
    AI_Output (self, other ,"DIA_Shan_WORK_03_02"); //S�u�� Y'Berionowi rad�, opiekuj� si� �wi�tyni�, dbam o drobne sprawy.
    AI_Output (other, self ,"DIA_Shan_WORK_15_03"); //Pewnie du�o z tym zamieszania.
    AI_Output (self, other ,"DIA_Shan_WORK_03_04"); //Nie jest tak �le. Pal� ziele, aby uspokoi� mojego ducha.
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
    AI_Output (self, other ,"DIA_Shan_HELLO_03_01"); //Witaj, przybyszu! Nazywam si� Shan, pokorny s�uga �ni�cego.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_02"); //Jestem pomocnikiem Y'Beriona. Wydaj� tak�e polecenia.
    AI_Output (self, other ,"DIA_Shan_HELLO_03_03"); //Je�eli szukasz pracy, zg�o� si� do mnie.
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
    AI_Output (self, other ,"DIA_Shan_SZEF_03_01"); //Mistrzu, mamy kilka spraw, kt�rymi natychmiast musisz si� zaj��.
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
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_02"); //Podczas rytua�u przywo�ania �ni�cego na placu jak i w �wi�tyni by�o niema�e zamieszanie.
	AI_Output (other, self ,"DIA_Shan_QUEST1_15_03"); //Co w zwi�zku z tym?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_04"); //Wszed� tu jeden z Nowicjuszy i zabra� Kostur �wiat�a nale��cy do Y'Beriona. 
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_05"); //To bardzo wa�ne, aby go odzyska�. Jest nam potrzebny do ceremonii pogrzebu Mistrza.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_06"); //Kostur musi si� znale�� w jego grobie. 
    AI_Output (other, self ,"DIA_Shan_QUEST1_15_07"); //Gdzie mam zacz�� poszukiwania?
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_08"); //Popytaj ludzi b�d�cych na placu. M�wi si�, �e z�odziej bardzo szybko wybieg� i wpad� po drodze na naszych braci.
    AI_Output (self, other ,"DIA_Shan_QUEST1_03_09"); //Mo�e kto� co� wie...
    MIS_StolenStaff = LOG_RUNNING;

    Log_CreateTopic          (CH3_StolenStaff, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StolenStaff, LOG_RUNNING);
    B_LogEntry               (CH3_StolenStaff,"Shan kaza� mi znale�� z�odzieja, kt�ry w�ama� si� do �wi�tyni podczas rytua�u przywo�ania i ukrad� kostur Y'Beriona. Rabu� wypad� ze �wi�tyni jak oszala�y. Z pewno�ci� potr�ci� kogo� na placu. Tam powinienem szuka� wskaz�wek.");
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
   description	= "Odzyska�em skradziony kostur.";
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
    AI_Output (other, self ,"DIA_QUEST1_QUEST1_WIN_15_01"); //Odzyska�em skradziony kostur.
    AI_Output (self, other ,"DIA_QUEST1_QUEST1_WIN_03_02"); //Prosz�, daj mi go. Zajm� si� jego przechowaniem.
    B_LogEntry           (CH3_StolenStaff,"Odda�em skradziony kostur Shanowi. On dopilnuje, by bro� zosta�a zabezpieczona razem z cia�em Y'Beriona.");
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
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_02"); //Ca�kiem sporo...
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_03"); //Dowiedzia�em si�, �e w Obozie odbywa si� utajniony obr�t amuletami i talizmanami. Kto� sprzedaje takie artefakty po zawy�onej cenie.
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_04"); //Nie podoba mi si� to. Tylko Guru maj� wy��czno�� na sprzeda� magicznych przedmiot�w. Powiniene� si� tym jak najszybciej zaj��.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_05"); //Dlaczego to takie wa�ne?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_06"); //Sk�d to pytanie? Magiczne artefakty maj� pot�na moc. W niepowo�anych r�kach mog� wyrz�dzi� wiele szk�d. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_07"); //Tylko Guru maj� wystarczaj�co du�o do�wiadczenia, by m�c oceni�, czy Nowicjusz ma czyste intencje. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_03_08"); //Miej te� na uwadze, �e od kiedy dowiedzieli�my si�, �e �ni�cy jest demonem, ludzie w Obozie zaczynaj� wariowa�. 
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_09"); //Po prostu znajd� tego cz�owieka i naka� mu odda� wszystkie b�yskotki Baal Cadarowi.
    AI_Output (other, self ,"DIA_Shan_QUEST2_15_10"); //Mo�esz mnie jako� naprowadzi�?
    AI_Output (self, other ,"DIA_Shan_QUEST2_03_11"); //Twoim punktem zaczepienia powinna by� rozmowa z Talasem. To on poinformowa� mnie o tym procederze.
    MIS_StrangeResearcher = LOG_RUNNING;

    Log_CreateTopic          (CH3_StrangeResearcher, LOG_MISSION);
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_RUNNING);
    B_LogEntry               (CH3_StrangeResearcher,"Shan kaza� mi odkry� kto w Obozie prowadzi badania nad bagnem. Wskaz�wk� jest to, �e osoba handluje poszukiwanymi przez Y'Beriona przedmiotami.");
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
   description	= "Odnalaz�em tego handlarza.";
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
    AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_01"); //Odnalaz�em tego handlarza. Nie b�dzie ju� sprzedawa� artefakt�w.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_02"); //Zgodzi� si� nawet odda� je do �wi�tyni. Nazywa si� Steh.
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_03"); //Doskonale. Teraz amulety i pier�cienie nie wpadn� w niepowo�ane r�ce. 
	AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_04"); //Mimo to odczuli�my ju� skutki niepos�usze�stwa Steha.
	AI_Output (other, self ,"DIA_Shan_QUEST2_WIN_15_05"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Shan_QUEST2_WIN_03_06"); //Porozmawiamy o tym za chwil�. Mistrzu, we� t� rud� ze skrzyni Y'Beriona.
    B_LogEntry               (CH3_StrangeResearcher,"Powiedzia�em Shanowi o mojej rozmowie ze Stehem. By� zadowolony, ale jednocze�nie zaniepokojony. Widocznie sta�o si� co� z�ego.");
    Log_SetTopicStatus       (CH3_StrangeResearcher, LOG_SUCCESS);
    MIS_StrangeResearcher = LOG_SUCCESS;

    B_GiveXP (120);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	AI_StopProcessInfos (self);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
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
   description	= "Mog� co� dla ciebie zrobi�?";
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
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_01"); //Mog� co� dla ciebie zrobi�?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_02"); //Jest pewna sprawa, kt�r� m�g�by� si� zaj��.
    AI_Output (other, self ,"DIA_Shan_QuestCH3_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_04"); //Kto� z naszych sprzedaje eliksir z wn�trzno�ci pe�zaczy do pozosta�ych oboz�w.
    AI_Output (self, other ,"DIA_Shan_QuestCH3_03_05"); //Dowiedz si�, kto to jest i natychmiast mi o tym powiedz. Nie wiem od czego mia�by� zacz��. Spr�buj pogada� z handlarzami.
    MIS_SellElixer = LOG_RUNNING;

    Log_CreateTopic          (CH3_SellElixer, LOG_MISSION);
    Log_SetTopicStatus       (CH3_SellElixer, LOG_RUNNING);
    B_LogEntry               (CH3_SellElixer,"Shan kaza� mi odkry�, kto nielegalnie sprzedaje eliksir z wn�trzno�ci pe�zaczy. Towar trafia do pozosta�ych oboz�w. Powinienem popyta� w�r�d handlarzy.");
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
   description	= "Uda�o mi si� odnale�� sprzedawc� eliksiru.";
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
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_01"); //Uda�o mi si� odnale�� sprzedawc� eliksiru. To Nowicjusz Caine.
    AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_02"); //Pr�bowa� mnie przekupi�, ale nie przyj��em jego propozycji.
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_03"); //Caine? Nieprawdopodobne. Nie spodziewa�em si� tego po nim. Jest zaufanym cz�owiekiem Cor Kaloma.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_04"); //Ju� chyba nim nie b�dzie...
    AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_05"); //Oczywi�cie, spotka go kara, jednak w�tpi�, �e zniknie z Obozu. Jego do�wiadczenie jest dla nas bardzo wa�ne.
	AI_Output (other, self ,"DIA_Shan_SellElixirCaine_15_06"); //Jaki problem przyuczy� kogo� nowego do pomocy?
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Wiesz, to wymaga czasu. Mamy teraz wa�niejsze sprawy na g�owie. Jednak porozmawiam o tym z mistrzem Kalomem.
	AI_Output (self, other ,"DIA_Shan_SellElixirCaine_03_07"); //Tak czy inaczej, dobrze si� spisa�e�. Oto twoja nagroda. 
	
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
	
    B_LogEntry               (CH3_SellElixer,"Powiedzia�em o wszystkim Shanowi. Caina chyba jednak nie spotka tak bolesna kara, jak s�dzi�em. Niemniej jednak zachowa�em si� uczciwie, za co Shan mnie wynagrodzi�.");
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
   description	= "Nie uda�o mi si� znale�� sprzedawcy eliksiru.";
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
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_01"); //Nie uda�o mi si� znale�� sprzedawcy eliksiru.
    AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_02"); //Sprawdzi�em wszystkie poszlaki, jednak trop si� urwa�.
    AI_Output (self, other ,"DIA_Shan_LieAboutCaine_03_03"); //Nie cieszy mnie ta wiadomo��. Oznacza to, �e zdrajca jest wci�� na wolno�ci. 
	AI_Output (other, self ,"DIA_Shan_LieAboutCaine_15_04"); //C�, b�d� musia� poleci� pozosta�ym �wi�tynnym by mieli t� spraw� na uwadze. 
    
    B_LogEntry               (CH3_SellElixer,"Powiedzia�em Shanowi, �e trop w sprawie si� urwa�. Wprawdzie zawali�em zadanie, jednak sporo zarobi�em.");
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
   description	= "Uwolni�em braci!";
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
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_01"); //Uwolni�em braci!
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_02"); //Zostali uwi�zieni za wielk� krat� s�u��c� jako brama do Starej Kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_03"); //Dobra robota, Stra�niku.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_04"); //Masz ze sob� jakie� wie�ci z tamtej cz�ci Kolonii?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_05"); //Sytuacja nie wygl�da najlepiej.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_06"); //Artegor si� zbuntowa� i utworzy� w�asny ob�z przy Starej Kopalni.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_07"); //Ob�z ten nie podlega� Gomezowi.
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_08"); //Jednak, gdy Magnat dowiedzia� si� o buncie, wys�a� olbrzymi oddzia� swoich ludzi w kierunku kopalni.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_09"); //Co si� sta�o potem?
    AI_Output (other, self ,"DIA_Shan_Uwolnieni_15_10"); //Wszyscy zgin�li! Pozosta� tylko Artegor, kt�ry pozwoli� mi uwolni� Gor Na Kosha i innych.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_11"); //Wykaza�e� si� nie lada odwag�.
    AI_Output (self, other ,"DIA_Shan_Uwolnieni_03_12"); //Jestem pe�en podziwu.
    B_LogEntry                     (CH1_HelpBrothersBra,"Przekaza�em Shanowi informacje o wydarzeniach z Kolonii. Przy okazji zosta�em wynagrodzony za uwolnienie braci z kopalni.");
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
   description	= "Rozmawia�em z Draxem.";
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
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_01"); //Rozmawia�em z Draxem.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_03"); //Pomog�em Bandytom zorganizowa� atak na patrole Gomeza. �ci�gn��em im do pomocy �owc�w ork�w.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_04"); //Mam nadziej�, �e sobie poradz�.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_05"); //No dobrze. Proponuj� ci, aby� uda� si� w okolice Nowego Obozu. Grupa Najemnik�w prowadzi tam walki ze Stra�nikami.
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_06"); //Powiniene� im pom�c.
    AI_Output (other, self ,"DIA_Shan_DRAX_IMPORTANT_15_07"); //Dlaczego?
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_08"); //Stra�nicy staj� si� coraz wi�kszym zagro�eniem r�wnie� dla naszego Obozu. 
    AI_Output (self, other ,"DIA_Shan_DRAX_IMPORTANT_03_09"); //Dlatego musisz wesprze� naszych braci z Nowego Obozu.
    B_LogEntry                     (CH4_BanditNeedPsionicHelp,"Musz� uda� si� w kierunku Nowego Obozu i pom�c Najemnikom w walce ze Stra�nikami. ");

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