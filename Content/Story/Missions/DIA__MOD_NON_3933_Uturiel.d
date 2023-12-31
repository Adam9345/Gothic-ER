//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Uturiel_EXIT(C_INFO)
{
	npc             = NON_3933_Uturiel;
	nr              = 999;
	condition		= DIA_Uturiel_EXIT_Condition;
	information		= DIA_Uturiel_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Uturiel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Uturiel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Uturiel_HELLO1 (C_INFO)
{
   npc         	= NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_HELLO1_Condition;
   information  = DIA_Uturiel_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Uturiel_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Uturiel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Uturiel_HELLO1_03_02"); //Nazywam si� Uturiel. Jestem Magiem Kr�gu Ognia i skromnym s�ug� naszego pana, Innosa.
	AI_Output (other, self ,"DIA_Uturiel_HELLO2_15_01"); //MAGIEM OGNIA? Co tu robisz?
	AI_Output (self, other ,"DIA_Uturiel_HELLO2_03_03"); //Chcia�bym zapyta� ci� o to samo, jednak zaspokoj� twoj� ciekawo��. Mieszkam tutaj.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Uturiel_HELLO3 (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 3;
   condition    = DIA_Uturiel_HELLO3_Condition;
   information  = DIA_Uturiel_HELLO3_Info;
   permanent	= FALSE;
   description	= "Dlaczego nie przebywasz z pozosta�ymi magami?";
};

FUNC INT DIA_Uturiel_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HELLO3_15_01"); //Dlaczego nie przebywasz z pozosta�ymi magami?
    AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_02"); //Po odej�ciu Xardasa najwy�sze miejsce w hierarchii zaj�� Corristo. Nigdy za nim nie przepada�em, by� zbyt arogancki. Jednak to nie wszystko.
    AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_03"); //Z czasem ten siwy mag coraz bardziej si� zmienia�. Wygl�da�o to tak jakby czego� oczekiwa�. Przesta�em mu wtedy ca�kowicie ufa�.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_04"); //Tutaj mog� swobodnie prowadzi� moje badania. W Starym Obozie nikt nie chcia� mnie s�ucha�.
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_15_05"); //O jakich badaniach m�wisz?
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_06"); //Czy�by� by� zainteresowany? Ot� wpad�em na pomys�, �e Magicznej Bariery mo�e wcale nie trzeba niszczy�, aby si� st�d wydosta�.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_07"); //Pewnie si� zastanawiasz jak to osi�gn��. My�l�, �e odpowiedzi� mog� by� kryszta�y ogniskuj�ce moc. 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_03_08"); //M�wi� o tych du�ych b�yszcz�cych kamieniach, kt�re mo�na spotka� w jaskiniach. Widzia�e� kiedy� takie? 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
    Info_AddChoice		(DIA_Uturiel_HELLO3, "Tak.", DIA_Uturiel_HELLO3_Yes);
    Info_AddChoice		(DIA_Uturiel_HELLO3, "Nie.", DIA_Uturiel_HELLO3_No);
};

FUNC VOID DIA_UTURIEL_HELLO3_NEXT ()
{
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_01"); //Wracaj�c do tematu, te kamienie potrafi� zbiera� magiczn� moc z najbli�szego otoczenia. To w�a�nie dlatego noc� �wiec�. Promieniuj� bardzo s�ab� magi�.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_02"); //Skoro Bariera powsta�a przy u�yciu magii, to mo�na spr�bowa� wykorzysta� kryszta�y do �ci�gni�cia cz�ci jej mocy.
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_next_15_03"); //Niezbyt rozumiem.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_04"); //M�wi�c pro�ciej podchodzisz do Bariery z odpowiednio spreparowanym kryszta�em, kt�ry �ci�gaj�c magiczn� moc tworzy wyrw� w Barierze. 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_05"); //Przez tak� wyrw� mo�na by�oby si� przedosta� na drug� stron�. 
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_next_15_06"); //Tw�j plan wydaje si� szalony. Czy to na pewno bezpieczne?
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_07"); //Pewnie, �e to nie jest bezpieczne! My�lisz, �e dlaczego Magowie Ognia uznali mnie za czubka?! 
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_08"); //Jednak na ten moment to nasza jedyna szansa. Wed�ug moich wylicze� odpowiedni kryszta� m�g�by wytrzyma� kilka sekund.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_next_03_09"); //To wystarczaj�ce, aby zrobi� skok na drug� stron�. A wi�c jak? Pomo�esz mi?
};

FUNC VOID DIA_Uturiel_HELLO3_Yes ()
{
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_yes_15_01"); //Tak, cho� w G�rniczej Dolinie jest ich ma�o.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_yes_03_02"); //Masz racj�. Wi�cej mo�na spotka� poza Khorinis lub na kontynencie. Co nie zmienia faktu, �e i w tym zapomnianym miejscu mo�na je zobaczy�. 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
	DIA_UTURIEL_HELLO3_NEXT ();
};

FUNC VOID DIA_Uturiel_HELLO3_No ()
{
	AI_Output (other, self ,"DIA_Uturiel_HELLO3_no_15_01"); //Nie.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_02"); //Widocznie nie penetrowa�e� jeszcze tutejszych jaski� a� tak dok�adnie. Hmm... Jakby ci to zobrazowa�.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_03"); //Ach, ju� pami�tam. Kilka takich kryszta��w mo�na zobaczy� po drugiej stronie jeziorka, kt�re znajduje si� nieopodal.
	AI_Output (self, other ,"DIA_Uturiel_HELLO3_no_03_04"); //Mo�esz si� tam wybra� i poogl�da�. Tylko uwa�aj na potwory. 
	Info_ClearChoices	(DIA_Uturiel_HELLO3);
	DIA_UTURIEL_HELLO3_NEXT ();
};

//========================================
//-----------------> HelpMe
//========================================
var int uturiel_dia_help;
INSTANCE DIA_Uturiel_HelpMe (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_HelpMe_Condition;
   information  = DIA_Uturiel_HelpMe_Info;
   permanent	= TRUE;//patch 1.4.5.1
   description	= "Jak mam ci pom�c?";
};

FUNC INT DIA_Uturiel_HelpMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_HELLO3)) && uturiel_dia_help == false
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_HelpMe_15_01"); //Jak mam ci pom�c?
	if (kapitel >= 4)
	{
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_02"); //Musisz przeszuka� pobliskie jaskinie w poszukiwaniu od�amanych fragment�w kryszta��w. Przynie� mi przynajmniej trzy kawa�ki.
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_03"); //Wybior� spo�r�d nich najlepszy i wtedy spr�bujemy przedrze� si� przez Barier�.
    AI_Output (other, self ,"DIA_Uturiel_HelpMe_15_04"); //No dobrze, poszukam ich.
    AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_05"); //Powodzenia. I uwa�aj na siebie. W tej okolicy czai si� pe�no niebezpiecznych potwor�w. 
    MIS_MagicalCrystals = LOG_RUNNING;

    Log_CreateTopic          	 (CH4_MagicalCrystals, LOG_MISSION);
    Log_SetTopicStatus      	 (CH4_MagicalCrystals, LOG_RUNNING);
    B_LogEntry              	 (CH4_MagicalCrystals,"Trzynasty Mag Ognia Uturiel ma pomys� jak sforsowa� Barier� przy u�yciu kryszta��w kumuluj�cych magiczn� moc. Takie kryszta�y cz�sto spotyka si� w jaskiniach. Musz� przynie�� mu przynajmniej trzy fragmenty, aby wybra� najlepszy spo�r�d nich. Nie wiem czy ten plan ma jakiekolwiek szanse powodzenia, ale warto spr�bowa�.");
	
	uturiel_dia_help = true;
	}
	else 
	{
	AI_Output (self, other ,"DIA_Uturiel_HelpMe_03_NOPE"); //Jeszcze nie nadszed� na to czas. Przypomnia�em sobie, �e musz� dopracowa� jedn� rzecz. Zg�o� si� p�niej.
	PrintS_Ext ("Warunek: rozdzia� 4",COL_WHITE) ;
	};
};

/*------------------------------------------------------------------------
							CRYSTAL							
------------------------------------------------------------------------*/

instance  NON_3933_Uturiel_CRYSTAL (C_INFO)
{
	npc				= NON_3933_Uturiel;
	condition		= NON_3933_Uturiel_CRYSTAL_Condition;
	information		= NON_3933_Uturiel_CRYSTAL_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam kryszta�y.";

};

FUNC int  NON_3933_Uturiel_CRYSTAL_Condition()
{	
	if (MIS_MagicalCrystals == LOG_RUNNING) &&  (Npc_HasItems(other,BlueCrystal)>=3)
	{
		return TRUE;
	};

};
FUNC void  NON_3933_Uturiel_CRYSTAL_Info()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_01"); //Mam trzy kryszta�y.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_02"); //Doskonale. Mo�emy przej�� do nast�pnego etapu.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_03"); //Na czym on mia�by polega�?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_04"); //Potrzebuj� kostura w kt�rym m�g�bym osadzi� kamie�. Nie zbli�� si� do Bariery trzymaj�c kryszta�u w r�kach. To mog�oby si� �le sko�czy�.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Info_15_05"); //W porz�dku. Zapytam mag�w czy mog� mi jaki� sprzeda�.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_06"); //To nie takie proste. Potrzebujemy kostura bez osadzonego wewn�trz kamienia lub runy. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Info_02_07"); //Zar�wno Magowie w Starym, jak i Nowym Obozie posiadaj� kostury z ju� osadzonymi artefaktami. 
	Info_ClearChoices 	(NON_3933_Uturiel_CRYSTAL);
	Info_Addchoice 		(NON_3933_Uturiel_CRYSTAL,"Artefaktu nie da si� usun��?",NON_3933_Uturiel_CRYSTAL_Wyjac);
	Info_Addchoice 		(NON_3933_Uturiel_CRYSTAL,"Trzeba przygotowa� nowy kostur?",NON_3933_Uturiel_CRYSTAL_New);
	
	B_GiveInvItems (hero,self,BlueCrystal,3);
	B_GiveXP (200);
	B_LogEntry               (CH4_MagicalCrystals,"Odnalaz�em trzy magiczne kryszta�y i odda�em je Uturielowi. Mag potrzebuje teraz kostura, w kt�rym osadzi najlepszy spo�r�d nich.");
};

FUNC VOID NON_3933_Uturiel_CRYSTAL_Wyjac ()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_Wyjac_15_01"); //A nie mo�emy po prostu usun�� artefakt z pierwszego lepszego kostura?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Wyjac_02_02"); //Jest mo�liwe, jednak zajmie to troch� czasu i mo�e doprowadzi� do uszkodzenia broni. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Wyjac_02_04"); //Poza tym w moim mieszkaniu nie mam odpowiednich narz�dzi...	
};

FUNC VOID NON_3933_Uturiel_CRYSTAL_New ()
{
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_New_15_01"); //Trzeba przygotowa� nowy kostur?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_02"); //Niekoniecznie. Mam pewnego znajomego w Bractwie �ni�cego. Nazywa si� Tondral. Utrzymywa�em z nim znajomo�� zanim powsta� ob�z na bagnie.
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_03"); //Owego czasu nosi� przy sobie pusty kostur. Opowiada� mi jego histori�. Nie b�d� ci� ni� teraz zanudza�.
	AI_Output (other, self,"NON_3933_Uturiel_CRYSTAL_New_15_04"); //My�lisz, �e m�g�by odda� nam ten kostur?
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_Newc_02_05"); //S�k w tym, �e tego w�a�nie nie jestem pewien. To dla niego bardzo wa�na pami�tka. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_06"); //Mimo to my�l�, �e warto spr�bowa�. Udaj si� na bagno, odszukaj tego cz�owieka i przekonaj go, aby odda� ci kostur. 
	AI_Output (self, other,"NON_3933_Uturiel_CRYSTAL_New_02_07"); //Powo�aj si� na znajomo�� ze mn�. Ja w tym czasie zajm� si� naszymi b�yskotkami. Powodzenia.
	
	B_LogEntry               (CH4_MagicalCrystals,"Uturiel opowiedzia� mi o swojej dawnej znajomo�ci z niejakim Tondralem z Bractwa. Ostatnio, gdy si� widzieli, ten cz�owiek by� w posiadaniu pustego kostura. Akurat taki jest nam teraz potrzebny, wi�c musz� uda� si� do Bractwa i go zdoby�.");
	
	Info_ClearChoices 	(NON_3933_Uturiel_CRYSTAL);
	AI_StopProcessInfos (self);
};
	
//========================================
//-----------------> TondralStaff
//========================================

INSTANCE DIA_Uturiel_TondralStaff (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_TondralStaff_Condition;
   information  = DIA_Uturiel_TondralStaff_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kostur Baal Tondrala.";
};

FUNC INT DIA_Uturiel_TondralStaff_Condition()
{
    if (Npc_KnowsInfo (hero, NON_3933_Uturiel_CRYSTAL))
    && (Npc_HasItems (other, ItMi_Mod_TondralStaff) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_TondralStaff_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_01"); //Mam dla ciebie kostur Baal Tondrala.
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_02"); //Doskonale. Sprawia� jakie� problemy?
    AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_03"); //Nic o czym warto by m�wi�...
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_04"); //Podczas twojej nieobecno�ci wybra�em najlepszy spo�r�d kryszta��w, kt�re mi przynios�e�.
    AI_Output (self, other ,"DIA_Uturiel_TondralStaff_03_05"); //Osadz� go w broni i b�d� gotowy. Spotkamy si� za t� wielk� wie��. 
	AI_Output (other, self ,"DIA_Uturiel_TondralStaff_15_06"); //Czemu akurat tam? 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_07"); //A masz lepsze miejsce? Za wie�� jest jeziorko w pobli�u kt�rego silnie oddzia�uje Bariera. 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_08"); //Sprawdzimy czy m�j plan ma szans� si� powie��. Je�li si� uda znajdziemy lepsze miejsce i przedostaniemy si� do Khorinis. 
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_09"); //Z oczywistych przyczyn prze��cz b�dziemy musieli omin�� ze wzgl�du na ciebie. Na pewno roi si� tam od ludzi kr�la.
	AI_Output (self, other ,"DIA_Uturiel_TondralStaff_02_10"); //Ale o tym p�niej. Teraz mamy inne sprawy na g�owie. Do zobaczenia za wie��. 
	
	B_LogEntry               (CH4_MagicalCrystals,"Przynios�em Uturielowi kostur nale��cy do Baal Tondrala. Podczas mojej nieobecno�ci mag wybra� najlepszy kryszta� i kaza� mi si� z nim spotka� przy jeziorku za wie�� Xardasa. Ciekawe co z tego wyjdzie.");
	
	Npc_ExchangeRoutine			(NON_3933_Uturiel,"experiment"); 
	B_GiveInvItems (other, self, ItMi_Mod_TondralStaff,1);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EXPERIMENT
//========================================

INSTANCE DIA_Uturiel_EXPERIMENT (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_EXPERIMENT_Condition;
   information  = DIA_Uturiel_EXPERIMENT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_EXPERIMENT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_TondralStaff))
    && (Npc_GetDistToWP (self, "OW_MIS_UTURIELEXPERIMENT") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_EXPERIMENT_Info()
{
    AI_Output (self, other ,"DIA_Uturiel_EXPERIMENT_03_01"); //Jeste�. A wi�c pora zaczyna�. 
    AI_Output (other, self ,"DIA_Uturiel_EXPERIMENT_15_02"); //Czy� honory. B�d� obserwowa� z daleka.
	
	
    B_LogEntry              		 (CH4_MagicalCrystals,"Moje obawy by�y s�uszne. Podczas pr�by przedarcia si� przez Magiczn� Barier� Uturiel zosta� pora�ony, a kryszta� rozpad� si� w drzazgi. ");
    Log_SetTopicStatus     	 (CH4_MagicalCrystals, LOG_SUCCESS);
    MIS_MagicalCrystals = LOG_SUCCESS;

    B_GiveXP (350);	
};

//========================================
//-----------------> EXPERIMENT_CUTSCENE
//========================================

INSTANCE DIA_Uturiel_EXPERIMENT_CUTSCENE (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 1;
   condition    = DIA_Uturiel_EXPERIMENT_CUTSCENE_Condition;
   information  = DIA_Uturiel_EXPERIMENT_CUTSCENE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_EXPERIMENT_CUTSCENE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Uturiel_EXPERIMENT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_EXPERIMENT_CUTSCENE_Info()
{
	PlayVideo ("er_cutscene_uturiel.bik"); 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine			(self,"die"); 
};

//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_MissionFail (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_MissionFail_Condition;
   information  = DIA_Uturiel_MissionFail_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Uturiel_MissionFail_Condition()
{
    if (MIS_MagicalCrystals == LOG_FAILED)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_MissionFail_Info()
{
    AI_Output (self, other ,"DIA_Uturiel_MissionFail_03_01"); //Widz�, �e nie masz ze sob� kostura.
    AI_Output (other, self ,"DIA_Uturiel_MissionFail_15_02"); //Nie wszystko posz�o po mojej my�li. 
    AI_Output (self, other ,"DIA_Uturiel_MissionFail_03_03"); //Odejd�. Wol� si� sam wszystkim zaj��. Nic mi z twojej pomocy.
    B_LogEntry                     (CH4_MagicalCrystals,"Uturiel bardzo si� zdenerwowa� tym, �e nie uda�o mi si� zdoby� kostura Baal Tondrala. Powiedzia�, �e nie chce mojej pomocy. ");
    Log_SetTopicStatus       (CH4_MagicalCrystals, LOG_FAILED);
    AI_StopProcessInfos	(self);
	
};

//=====================================================================================================================================================================================================================

//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_Book (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_Book_Condition;
   information  = DIA_Uturiel_Book_Info;
   permanent	= FALSE;
   description  = "Witaj Magu.";
};

FUNC INT DIA_Uturiel_Book_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kastagir_DOSTAWA_Q11))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_Book_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_Book_15_01");  //Witaj Magu.
    AI_Output (self, other ,"DIA_Uturiel_Book_03_02");  //Co ci� do mnie sprowadza m�odzie�cze?
    AI_Output (other, self ,"DIA_Uturiel_Book_15_03");  //Poszukuje pewnej ksi�gi . Nazywa si� ,,Pot�ga Magicznych Kryszta��w,,.
	AI_Output (self, other ,"DIA_Uturiel_Book_03_04");  //Przeczyta�em j� wi�cej razy ni� mam w�os�w na g�owie. Znam j� na pami��.
	AI_Output (other, self ,"DIA_Uturiel_Book_15_05");  //Czy wci�� jest w twoim posiadaniu?
	AI_Output (self, other ,"DIA_Uturiel_Book_03_06");  //Tak, wci�� j� mam.
	AI_Output (other, self ,"DIA_Uturiel_Book_15_07");  //Czy m�g�bym j� od ciebie odkupi�?
	AI_Output (self, other ,"DIA_Uturiel_Book_03_08");  //Nie. Mog� ci j� da�. Gardz� rud� jak� kolejn� odmian� ludzkiej waluty, kt�ra s�u�y zwykle z�ym lub prostym celom.
	AI_Output (other, self ,"DIA_Uturiel_Book_15_09");  //Zatem daj mi prosz� t� ksi�g�.
	AI_Output (self, other ,"DIA_Uturiel_Book_03_10");  //Nie tak pr�dko ch�opcz�. To, �e nie chc� rudy nie oznacza, �e nie chce niczego.
	AI_Output (other, self ,"DIA_Uturiel_Book_15_11");  //Zatem czego chcesz?
	AI_Output (self, other ,"DIA_Uturiel_Book_03_12");  //Kilka dni temu natkn��em si� na ohydnego potwora � jednego z Bagiennych Golem�w.
	AI_Output (self, other ,"DIA_Uturiel_Book_03_13");  //Zaatakowa� mnie a ja os�abi�em go magicznie. Jednak z r�k wypad� mi pewien magiczny kamie� a ta bestia go po�kn�a przez jaki� czas by� dzi�ki temu odporny na moj� magi�.
	AI_Output (self, other ,"DIA_Uturiel_Book_03_14");  //Musia�em si� oddali�. Jednak chcia�bym ju� odzyska� tamten kamie�.
	
	Info_ClearChoices 	(DIA_Uturiel_Book);
	Info_Addchoice 		(DIA_Uturiel_Book,"Gdzie znajd� tego Golema.",DIA_Uturiel_Kamien);
	
};

FUNC VOID DIA_Uturiel_Kamien ()
{
	AI_Output (other, self,"DIA_Uturiel_Kamien_15_01"); //Gdzie znajd� tego Golema?
	AI_Output (self, other,"DIA_Uturiel_Kamien_02_02"); //Przy jeziorku nieopodal st�d, ko�o wielkiej wie�y.
	AI_Output (other, self,"DIA_Uturiel_Kamien_15_03"); //Zatem odzyskam ten kamie�.
	AI_Output (self, other,"DIA_Uturiel_Kamien_02_04"); //By�oby �wietnie.
	AI_StopProcessInfos	(self);
	B_LogEntry              (Kastragir,"Rozmawia�em z Magiem Uturielem. Jest zdecydowany da� mi ksi�g� jednak najpierw musz� zmierzy� si� z golemem, kt�ry w czasie walki z Uturielem rzekomo po�kn�� jego magiczny kamie�. Musz� zabi� t� istot� i odzyska� ten cenny przedmiot.");

	Wld_InsertNpc				(SwampGolemUturiel,"FP_ROAM_OW_SWAMPGOLEM_UTURIEL");
};




//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_Golem (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_Golem_Condition;
   information  = DIA_Uturiel_Golem_Info;
   permanent	= FALSE;
   description  = "Mam tw�j kamie�.";
};

FUNC INT DIA_Uturiel_Golem_Condition()
{
    if (Npc_IsDead(SwampGolemUturiel))
	&& (Npc_HasItems (other, ItMi_UturielStone) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_Golem_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_Golem_15_01");  //Mam tw�j kamie�.
    AI_Output (self, other ,"DIA_Uturiel_Golem_03_02");  //Doskonale daj mi go prosz�.
    AI_Output (other, self ,"DIA_Uturiel_Golem_15_03");  //Oto on.
	AI_Output (self, other ,"DIA_Uturiel_Golem_03_04");  //Dzi�ki m�odzie�cze. A teraz we� t� ksi�g� w dow�d mojej wdzi�czno�ci.
	AI_Output (other, self ,"DIA_Uturiel_Golem_15_05");  //Dzi�kuje, Magu.
	B_GiveInvItems (other, self, ItMi_UturielStone,1);
	B_GiveInvItems (self, other, ItWr_UturielBook,1);
			B_LogEntry              (Kastragir,"Odda�em kamien Uturielowi za co ten podarowa� mi ksi�g�, teraz musz� uda� si� do Kastagira.");
};


//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_KASTAGIR_DEAD (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_KASTAGIR_DEAD_Condition;
   information  = DIA_Uturiel_KASTAGIR_DEAD_Info;
   permanent	= FALSE;
   description  = "Mam tu pewien pot�ny kryszta� wype�niony z�� moc�.";
};

FUNC INT DIA_Uturiel_KASTAGIR_DEAD_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_SZEFU_KASTAGIR_IS_DEAD))
	&&(Npc_HasItems (other, OrcCrystal) >=1) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_KASTAGIR_DEAD_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD_15_01");  //Mam tu pewien pot�ny kryszta� wype�niony z�� moc�. Trzeba go zniszczy�.
    AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD_03_02");  //Hmmm... Czujesz si� jako� inaczej od kiedy masz go w posiadaniu?
    AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD_15_03");  //Raczej nie.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD_03_04");  //Zatem jeste� jedn� z niewielu os�b maj�cych pewien rodzaj odporno�ci przed takimi artefaktami.
	AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD_15_05");  //Zatem ten kryszta� m�g�by mnie zmieni�? Chc� si� go natychmiast pozby�.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD_03_06");  //Daj mi go, prosz�.
			
};


//========================================
//-----------------> MissionFail
//========================================

INSTANCE DIA_Uturiel_KASTAGIR_DEAD1 (C_INFO)
{
   npc          = NON_3933_Uturiel;
   nr           = 2;
   condition    = DIA_Uturiel_KASTAGIR_DEAD1_Condition;
   information  = DIA_Uturiel_KASTAGIR_DEAD1_Info;
   permanent	= FALSE;
   description  = "Oto on.";
};

FUNC INT DIA_Uturiel_KASTAGIR_DEAD1_Condition()
{
   if (Npc_KnowsInfo (hero,  DIA_Uturiel_KASTAGIR_DEAD))
   &&(Npc_HasItems (other, OrcCrystal) >=1) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Uturiel_KASTAGIR_DEAD1_Info()
{
    AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_01");  //Oto on. 
	B_GiveInvItems (other, self, OrcCrystal, 1);
    Npc_RemoveInvItems (self, OrcCrystal,1);
    AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_02");  //Wyczuwam w nim pot�n� wewn�trzn� si�� w wi�kszo�ci o z�ym zabarwieniu. To bez w�tpienia pot�ny artefakt.
    AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_03");  //Przeprowadzisz teraz rytua� by go zniszczy�?
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_04");  //Tak. 	
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_05");  //O bogowie dajcie mi si��!
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_06");  //Niechaj moc tego mrocznego kryszta�u odleci na zawsze!
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_07");  //Niech stanie si� pusty by ca�a jego z�a moc przesta�a zagra�a� stworzeniom tej ziemi!
    AI_PlayAni (self,"T_PRACTICEMAGIC");
	AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_08");  //I co?
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_09");  //Ju� po wszystkim. Teraz ten artefakt utraci� swoj� zgubn� moc.
	AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_10");  //To dobrze. Zatem zagro�enie zosta�o wyeliminowane.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_11");  //Gdyby tylko ludzie potrafili kontrolowa� swoje s�abo�ci i ��dz� ten artefakt m�g�by przyczyni� si� tak�e do dobrych rzeczy.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_12");  //Niestety cz�owiek to na sw�j spos�b upo�ledzony gatunek, pe�en ma�ostkowo�ci i pychy.
	AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_13");  //Dzi�ki za pomoc. Teraz jest bezpieczniej.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_14");  //Masz racje, ch�opcze.
	AI_Output (other, self ,"DIA_Uturiel_KASTAGIR_DEAD1_15_15");  //Do zobaczenia.
	AI_Output (self, other ,"DIA_Uturiel_KASTAGIR_DEAD1_03_16");  //Niech Innos ma ci� w swojej opiece.
	AI_StopProcessInfos	(self);
	
	    B_LogEntry                     (Kastragir,"Mag Uturiel przeprowadzi� stosowny rytua� i zniszczy� kryszta� mocy. Teraz powinienem pogada� z Wilsonem i powiadomi� go o sukcesie ostatniego przedsi�wzi�cia.");

	
};

instance dia_uturiel_pickpocket(c_info) {
    npc = non_3933_uturiel;
    nr = 900;
    condition = dia_uturiel_pickpocket_condition;
    information = dia_uturiel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_uturiel_pickpocket_condition() {
	e_beklauen(baseThfChanceKDF, 30);
};

func void dia_uturiel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_uturiel_pickpocket);
	info_addchoice(dia_uturiel_pickpocket, dialog_back, dia_uturiel_pickpocket_back);
	info_addchoice(dia_uturiel_pickpocket, dialog_pickpocket, dia_uturiel_pickpocket_doit);
};

func void dia_uturiel_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_uturiel_pickpocket);
};

func void dia_uturiel_pickpocket_back() {
    info_clearchoices(dia_uturiel_pickpocket);
};

