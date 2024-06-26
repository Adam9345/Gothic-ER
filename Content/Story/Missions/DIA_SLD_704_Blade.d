 //========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Blade_EXIT(C_INFO)
{
	npc             = SLD_704_Blade;
	nr              = 999;
	condition		= DIA_Blade_EXIT_Condition;
	information		= DIA_Blade_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Blade_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Blade_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Blade_GoToMine (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_GoToMine_Condition;
   information  = DIA_Blade_GoToMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_GoToMine_Condition()
{
    if (kapitel == 1) && (Npc_GetTrueGuild (hero ) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_GoToMine_Info()
{
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_01"); //Hej, zaczekaj!
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_02"); //Dopiero co tutaj trafi�e�, tak? 
    AI_Output (other, self ,"DIA_Blade_GoToMine_15_03"); //Mo�e...
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_04"); //Nazywam si� Kosa i mam dla ciebie propozycj�. Mog� ci pom�c zosta� Kretem. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_05"); //W ten spos�b zostaj�c cz�onkiem naszego obozu, zyskasz szacunek, prac� i �r�d�o dochodu. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_06"); //Nie id� do Starego Obozu. Gomez to pod�y oszust i wyzyskiwacz. W Bractwie natomiast zrobi� ci pranie m�zgu.
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_07"); //Nowy Ob�z to najlepsze miejsce dla skaza�c�w, kt�rzy chc� czu� cho� odrobin� wolno�ci w tym piekle.

    Info_ClearChoices		(DIA_Blade_GoToMine);
    Info_AddChoice		(DIA_Blade_GoToMine, "Opowiedz mi o tym ca�ym Nowym Obozie.", DIA_Blade_GoToMine_AboutNewCamp);
    Info_AddChoice		(DIA_Blade_GoToMine, "Nigdzie z tob� nie p�jd�!", DIA_Blade_GoToMine_Nope);
    Info_AddChoice		(DIA_Blade_GoToMine, "Dobrze. Zaprowad� mnie do Kopalni.", DIA_Blade_GoToMine_LetsGo);
};

FUNC VOID DIA_Blade_GoToMine_AboutNewCamp()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_AboutNewCamp_15_01"); //Opowiedz mi o tym ca�ym Nowym Obozie.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_02"); //Nasz Ob�z r�ni si� od innych miejsc w Kolonii. Tam mo�esz robi� co chcesz. Nikt ci nic nie ka�e.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_03"); //Wsp�pracujemy z Magami Wody. Powiem ci w sekrecie, �e Arcymag Wody Saturas opracowa� plan, kt�ry doprowadzi do zniszczenia Bariery.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_04"); //Aby to zrobi� potrzebujemy magicznej rudy. Krety zajmuj� si� jej wydobyciem.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_05"); //W ko�cu uda nam si� odzyska� wolno��. Do��czaj�c do nas dok�adasz cegie�k� do tego wielkiego przedsi�wzi�cia!
};

FUNC VOID DIA_Blade_GoToMine_Nope()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_Nope_15_01"); //Nigdzie z tob� nie p�jd�!
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_02"); //Nie wiesz w co si� pakujesz, ch�opcze. Wkr�tce zrozumiesz.
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_03"); //Jakby� jednak zmieni� zdanie, porozmawiaj z Mordragiem. To nasz cz�owiek w Starym Obozie.
    Info_ClearChoices		(DIA_Blade_GoToMine);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Blade_GoToMine_LetsGo()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_LetsGo_15_01"); //Dobrze. Zaprowad� mnie do Kopalni.
    AI_Output (self, other ,"DIA_Blade_GoToMine_LetsGo_03_02"); //Doskona�y wyb�r. Wyja�ni� ci wszystko na miejscu. Trzymaj si� blisko mnie.
    MIS_PathToFreeMine = LOG_RUNNING;
	CreateInvItems (self, ItFo_Potion_Health_02,3);
    Log_CreateTopic         (CH1_PathToFreeMine, LOG_MISSION);
    Log_SetTopicStatus      (CH1_PathToFreeMine, LOG_RUNNING);
    B_LogEntry              (CH1_PathToFreeMine,"Niejaki Kosa zaproponowa� mi, �e zaprowadzi mnie do Wolnej Kopalni. Tam b�d� m�g� do��czy� do Nowego Obozu - pono� to ostatni bastion wolnych ludzi w Kolonii - jako Kret. Postanowi�em skorzysta� z propozycji i da� si� zaprowadzi�. Mam nadziej�, �e nie zostan� oszukany.");
    Npc_ExchangeRoutine 	(self, "GUIDE");
	self.npctype = NPCTYPE_FRIEND;
    Info_ClearChoices		(DIA_Blade_GoToMine);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos		(self);
};

//========================================
//-----------------> NearbyNC
//========================================

INSTANCE DIA_Blade_NearbyNC (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_NearbyNC_Condition;
   information  = DIA_Blade_NearbyNC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_NearbyNC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_GoToMine))
    && (Npc_GetDistToWP (self, "OW_PATH_07_21") < 2000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_NearbyNC_Info()
{
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_01"); //Oto brama do Nowego Obozu, ostatniego wolnego miejsca w Kolonii. Tu mo�esz czu� si� swobodnie.
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_02"); //Chod� dalej. Kopalnia jest za Obozem.
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine 	(self, "GUIDE2");
};

//========================================
//-----------------> InFreeMineCamp
//========================================

INSTANCE DIA_Blade_InFreeMineCamp (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 2;
   condition    = DIA_Blade_InFreeMineCamp_Condition;
   information  = DIA_Blade_InFreeMineCamp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_InFreeMineCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_GoToMine))
    && (Npc_GetDistToWP (self, "OW_PATH_3004") < 2000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_InFreeMineCamp_Info()
{
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_01"); //Jeste�my na miejscu. Tutaj znajduje si� tak zwany Kocio�. To zewn�trzna cz�� Kopalni.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_02"); //Co mam robi� dalej? 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_03"); //Porozmawiaj ze Swineyem. To do�wiadczony g�rnik. On wyda ci spodnie i powie co robi� dalej. 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_04"); //Moja rola tutaj si� ko�czy.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_05"); //Dzi�ki...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_06"); //Ach, jeszcze jedno! Prawie zapomnia�em. Nie wchod� do wn�trza Kopalni. 
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_07"); //CO?! Przecie� mam tam pracowa�!
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_08"); //Kopalnia jest ju� obsadzona. Potrzebujemy ludzi na powierzchni. Trzeba przygotowywa� podpory, i wydobywa� to, co jest na zewn�trz...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_09"); //Roboty jest mn�stwo. Mamy swoje powody, �eby nie wpuszcza� niekt�rych os�b do Kopalni.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_10"); //Po prostu si� tym nie interesuj, przynajmniej na razie, a wszystko b�dzie w porz�dku.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_11"); //No, id� ju�. Poradzisz sobie!
    B_LogEntry                     (CH1_PathToFreeMine,"Kosa zaprowadzi� mnie do Kopalni. Zasady kt�re mi przedstawi� s� dosy� dziwne. Mam pracowa� na zewn�trz i nie interesowa� si� wn�trzem Kopalni. Od Swineya dostan� ekwipunek oraz zostan� kretem. ");
    Log_SetTopicStatus       (CH1_PathToFreeMine, LOG_SUCCESS);
    MIS_PathToFreeMine = LOG_SUCCESS;

    B_GiveXP (XP_GoToFreeMineCamp);
    Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npctype = NPCTYPE_MAIN;
    AI_StopProcessInfos	(self);
};


////////////////////////////////////////////////
//   About Recruit
////////////////////////////////////////////////

INSTANCE DIA_Blade_About_Recruit (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_About_Recruit_Condition;
   information  = DIA_Blade_About_Recruit_Info;
   permanent	= FALSE;
   description	= "Podobno mo�esz mi pom�c.";
};

FUNC INT DIA_Blade_About_Recruit_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Will_ThompsonDED)) && (!Npc_KnowsInfo (hero, DIA_Will_Rekrut_Shrat))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_About_Recruit_Info()
{
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_01"); //Podobno mo�esz mi pom�c.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_02"); //Czy�by? A w czym?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_03"); //Podobno znasz si� na poszukiwaniu wiarygodnych pracownik�w.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_04"); //Hmm... Czego chcesz?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_05"); //Musz� zrekrutowa� robotnika. Nie wiem od czego zacz�� poszukiwania.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_06"); //Nie wiem dlaczego mia�bym ci pomaga�, ale je�li potrzebujesz tylko robotnika to szukaj w�r�d Kopaczy lub Nowicjuszy. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_07"); //Proponowa�bym uda� si� do Bractwa. Bramy w Starym Obozie s� strze�one i ci�ko kogo� stamt�d wyprowadzi�. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_08"); //W�r�d sekciarzy rozgl�daj si� za kim�, komu nie odpowiada �ycie w obozie. �atwiej b�dzie ci go nam�wi�.
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_09"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_10"); //Dosta�e� za darmo ca�kiem dobre rady. A teraz spadaj! 
   
    B_LogEntry               (CH2_GoldMine,"Kosa poleci� mi szuka� robotnika w obozie Bractwa.");
};


//************************************************************
// KONTYNUACJA ZADANIA OD MILA 
// POLOWANIE NA MAGNAT�W
//************************************************************

//========================================
//-----------------> HELLO1
//========================================
var int dia_blade_avbl;
INSTANCE DIA_Blade_HELLO1 (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_HELLO1_Condition;
   information  = DIA_Blade_HELLO1_Info;
   permanent	= true;
   description	= "Podobno mo�na u ciebie dorobi�...";
};

FUNC INT DIA_Blade_HELLO1_Condition()
{
    if (kapitel ==10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_01"); //Podobno mo�na u ciebie dorobi�...
	if (Kapitel == 3)
	{
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_02"); //Dobrze, �e si� zjawi�e�.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_03"); //Najpierw odpowiedz na moje pytania.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_04"); //Dlaczego tak wa�ne by�o, aby Blizna otrzyma� p�aszcz? I co ty masz z tym wsp�lnego?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_05"); //Ja tylko wykonuj� zlecenie. A dok�adnie koordynuj� wszystkie dzia�ania. M�j zleceniodawca kaza� mi si� go pozby�, a ty mi w tym pomo�esz.
    AI_Output (other, self ,"DIA_Blade_HELLO1_03_06"); //Kim jest tw�j zleceniodawca?
    AI_Output (self, other ,"DIA_Blade_HELLO1_15_07"); //Tego nie mog� ci zdradzi�.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_08"); //Powiedz mi chocia� o co chodzi z tym cholernym p�aszczem?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_09"); //To po prostu znak. Cz�owiek, kt�ry dokona zab�jstwa nigdy nie by� w Starym Obozie. Nie zna Magnat�w, a dzi�ki temu p�aszczowi �atwo si� zorientuje, kogo ma sprz�tn��. 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_10"); //Zab�jca, kt�rego wybra�em do tej roboty to prawdziwy profesjonalista. Na kontynencie nale�a� do bandy Ortegi. Jednak, gdy trafi� do Kolonii nie do��czy� do �adnego obozu i �y� w ukryciu. 
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_11"); //Odnalaz�em go, zaproponowa�em prac�, a on si� zgodzi�. 
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_12"); //Ale, cholera, czemu akurat z futra jakiego� bia�ego wilka?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_13"); //O to ju� pytaj Mila. Mo�e chcia� ci� sprawdzi�?
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_14"); //Dobra, nie wa�ne. Jak mam ci pom�c? I najwa�niejsze: ile mi za to zap�acisz?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_15"); //Konkrety... Dobrze... Za robot� dostaniesz 500 bry�ek rudy. Zab�jstwo Magnata to nie byle co.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_16"); //A co mam robi�? 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_17"); //Id� do Starego Obozu i zobacz co si� tam dzieje. Potem wr�� jak najszybciej do mnie. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_18"); //Nie ma potrzeby. Mog� ci wszystko opowiedzie� od razu. Stra�nicy na zamku pij� piwo i objadaj� si� pieczonym mi�siwem. Magnaci debatuj� w sali Gomeza, Kopacze przesiadu...
	AI_Output (self,other  ,"DIA_Blade_HELLO1_03_19"); //Przesta� si� zgrywa� i ruszaj si�. Musz� wiedzie� jak wygl�da sytuacja. Nie ma czasu. 
    B_LogEntry                     (CH3_ScarMurder,"Mam i�� do Starego Obozu i zobaczy� co si� tam dzieje. Kosa i jego pracownik ju� chyba podj�li jakie� dzia�ania.");
    AI_StopProcessInfos	(self);
	DIA_Blade_HELLO1.permanent = 0;
	dia_blade_avbl = true;
	B_Story_ScarDie ();
	Scar_die = true; 
	}
	else
	{
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_20"); //Nic si� jeszcze nie zacz�o. Czekamy na odpowiedni moment. Przyjd� p�niej. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_21"); //Nie rozumiem...
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_22"); //I bardzo dobrze! Na razie nie zaprz�taj sobie tym g�owy.
	//DIA_Blade_HELLO1.permanent = 1;
	};
};

//========================================
//-----------------> BACK_FROM_OC
//========================================

INSTANCE DIA_Blade_BACK_FROM_OC (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_BACK_FROM_OC_Condition;
   information  = DIA_Blade_BACK_FROM_OC_Info;
   permanent	= FALSE;
   description	= "By�em w Starym Obozie.";
};

FUNC INT DIA_Blade_BACK_FROM_OC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_SCAR_DIE))
    //&& (Scar_die == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_BACK_FROM_OC_Info()
{
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_01"); //By�em w Starym Obozie.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_03"); //Wszystko chyba posz�o zgodnie z planem. Blizna nie �yje, a Stra�nicy szukaj� mordercy.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_04"); //Znale�li go?!
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_05"); //Chyba nie. Przynajmniej tak wynika�o z rozmowy z Thorusem.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_06"); //Nie zjawi� si� na miejscu spotkania. Pewnie ma k�opoty. Musisz mu pom�c.
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_07"); //Dlaczego ja?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_08"); //Je�li go z�api�, mo�e zacz�� sypa�, a wtedy wojn� ze Starym Obozem mamy jak w banku. Gdyby Lee si� dowiedzia� zabi�by nas od razu.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_09"); //Id� ponownie do Starego Obozu i odszukaj naszego cz�owieka. Razem musicie jako� uciec. 
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_10"); //Jak go poznam?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_11"); //Nazywa si� Snake. Powiedz mu, �e ja ci� przysy�am. 
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_12"); //Ale je�li si� zdradzisz i powiesz, kt�remu� z ludzi Gomeza, �e to ja ci� przysy�am, b�dziesz musia� po sobie posprz�ta�. Rozumiesz?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_13"); //Tak, nikt nie ma o niczym wiedzie�.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_14"); //Dobrze, �e si� rozumiemy. A teraz id�, bo nie ma czasu do stracenia.
    B_LogEntry                     (CH3_ScarMurder,"Sytuacja nieco wymkn�a si� spod kontroli. Magnat nie �yje, ale to nie znaczy, �e sprawa jest zamkni�ta. Snake, zab�jca, kt�rego wynaj�� Kosa najpewniej zosta� w Starym Obozie i nie mo�e uciec. Musz� mu pom�c, zanim Stra�nicy go z�api� i ca�a akcja p�jdzie na marne. Z poprzedniej rozmowy z Thorusem wiem, �e nasz cz�owiek powinien nosi� zbroje Stra�nik�w. Pewnie to dzi�ki niej jeszcze �yje. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SNAKESESCAPE
//========================================

INSTANCE DIA_Blade_SNAKESESCAPE (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_SNAKESESCAPE_Condition;
   information  = DIA_Blade_SNAKESESCAPE_Info;
   permanent	= FALSE;
   description	= "Snake uciek� z obozu.";
};

FUNC INT DIA_Blade_SNAKESESCAPE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snake_CELLAR))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_SNAKESESCAPE_Info()
{
    AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_01"); //Snake uciek� z obozu.
    if (Snake_help == true)
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_02"); //Wiem, ju� si� z nim rozliczy�em. Bardzo sobie ciebie chwali�. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_03"); //Powiedzia�, �e chce si� z tob� spotka� w Kotle. Czeka tam na ciebie.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_04"); //A oto twoja ruda. Tak jak si� umawiali�my, 500 bry�ek rudy. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_05"); //Chcesz przeliczy�?
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_06"); //A powinienem?
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_07"); //Nie. Do zobaczenia.
        B_LogEntry                     (CH3_ScarMurder,"Odebra�em od Kosy nagrod� za pomoc w wykonaniu zadania. Snake chyba te� co� dla mnie ma. Mam si� z nim spotka� w Kotle. Je�li chc� dowiedzie� si� wi�cej o sensie ca�ego tego zadania, powinienem pogada� z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
        B_GiveXP (500);
		CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    }
    else
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_08"); //Rozmawia�em ju� z nim. Nie by� z ciebie zbyt zadowolony. Podobno zebra�o ci si� na oszcz�dzanie Stra�nik�w.
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_09"); //Po prostu uzna�em, �e �mier� tamtego cz�owieka b�dzie niepotrzebna.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_10"); //Uczestnicz�c w zab�jstwie Magnata powiniene� ka�dego Stra�nika, kt�ry ci� zdemaskowa� traktowa� jak wroga...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_11"); //Mam nadziej�, �e nast�nym razem b�dziesz m�drzejszy...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_12"); //Oto twoja ruda. 
        B_LogEntry                     (CH3_ScarMurder,"Odebra�em od Kosy nagrod� za pomoc w wykonaniu zadania. Je�li chc� dowiedzie� si� wi�cej o sensie ca�ego tego zadania, powinienem pogada� z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
		
        B_GiveXP (500);
        CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    };
	AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_13"); //Zaczekaj. Nie powiedzia�e� mi kto za tym wszystkim stoi. Jaki to mia�o sens?
	AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_14"); //Porozmawiaj z Orikiem. By� mo�e ci wszystko wyja�ni, ale nie gwarantuj� tego.
    AI_StopProcessInfos	(self);
};

instance dia_blade_pickpocket(c_info) {
    npc = sld_704_blade;
    nr = 900;
    condition = dia_blade_pickpocket_condition;
    information = dia_blade_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_blade_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 30);
};

func void dia_blade_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_blade_pickpocket);
	info_addchoice(dia_blade_pickpocket, dialog_back, dia_blade_pickpocket_back);
	info_addchoice(dia_blade_pickpocket, dialog_pickpocket, dia_blade_pickpocket_doit);
};

func void dia_blade_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_blade_pickpocket);
};

func void dia_blade_pickpocket_back() {
    info_clearchoices(dia_blade_pickpocket);
};