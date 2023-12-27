//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Schatten_EXIT(C_INFO)
{
	npc             = STT_316_Schatten;
	nr              = 999;
	condition		= DIA_Schatten_EXIT_Condition;
	information		= DIA_Schatten_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Schatten_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Schatten_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RonosHelp
//========================================

INSTANCE DIA_Schatten_RonosHelp (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 1;
   condition    = DIA_Schatten_RonosHelp_Condition;
   information  = DIA_Schatten_RonosHelp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Schatten_RonosHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_GivePlate))
    && (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_RonosHelp_Info()
{
    AI_Output (self, other ,"DIA_Schatten_RonosHelp_03_01"); //Pomog³eœ Rono. To mój przyjaciel. Jestem ci wdziêczny. D³ugo mêczyliœmy siê z t¹ skrzyni¹.
    AI_Output (self, other ,"DIA_Schatten_RonosHelp_03_02"); //Myœlê, ¿e jesteœ w porz¹dku. Jak spotkam Diego, to szepnê mu s³ówko o tobie. 
    AI_StopProcessInfos	(self);
	
	B_LogEntry (CH1_JoinOC,"Relghar faktycznie poprze mnie u Diego.");
};

//========================================
//-----------------> WhoTou
//========================================

INSTANCE DIA_Schatten_WhoTou (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 2;
   condition    = DIA_Schatten_WhoTou_Condition;
   information  = DIA_Schatten_WhoTou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Schatten_WhoTou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_WhoTou_Info()
{
    AI_Output (other, self ,"DIA_Schatten_WhoTou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Schatten_WhoTou_03_02"); //Nazywam siê Relghar. Zes³any za rozbój na kupcu.
};


//========================================
//-----------------> Porady
//========================================

INSTANCE DIA_Schatten_Porady (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 3;
   condition    = DIA_Schatten_Porady_Condition;
   information  = DIA_Schatten_Porady_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakieœ rady?";
};

FUNC INT DIA_Schatten_Porady_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_Porady_Info()
{
    AI_Output (other, self ,"DIA_Schatten_Porady_15_01"); //Masz dla mnie jakieœ rady?
    AI_Output (self, other ,"DIA_Schatten_Porady_03_02"); //Jeœli chcesz tutaj prze¿yæ, musisz mieæ dobr¹ broñ i tyle pancerza ile zdo³asz unieœæ. A, i unikaj od k³opotów. Mo¿e jeszcze ze dwa zaklêcia jak nie masz na co wydawaæ rudy. 
    AI_Output (self, other ,"DIA_Schatten_Porady_03_03"); //Pamiêtaj, by æwiczyæ swoje umiejêtnoœci. Tylko nie wewn¹trz murów Starego Obozu, bo nie potrzebujemy tu rozrób. 
    AI_Output (self, other ,"DIA_Schatten_Porady_03_04"); //Najlepiej u¿yj sobie na tych pata³achach z Nowego Obozu - oni nie maj¹ tu ¿adnych praw.
};


//========================================
//-----------------> STTGuild
//========================================

INSTANCE DIA_Schatten_STTGuild (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 4;
   condition    = DIA_Schatten_STTGuild_Condition;
   information  = DIA_Schatten_STTGuild_Info;
   permanent	= FALSE;
   description	= "Chcia³bym do³¹czyæ do Cieni.";
};

FUNC INT DIA_Schatten_STTGuild_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_STTGuild_Info()
{
    AI_Output (other, self ,"DIA_Schatten_STTGuild_15_01"); //Chcia³bym do³¹czyæ do Cieni.
    AI_Output (self, other ,"DIA_Schatten_STTGuild_03_02"); //S³u¿ba w imiê Gomeza to nie przelewki. Nikt ciê nie bêdzie tu prowadzi³ za r¹czkê. Diego ciê nie przyjmie, je¿eli nie bêdzie pewny, ¿e podo³asz naszym zadaniom. 
    AI_Output (self, other ,"DIA_Schatten_STTGuild_03_03"); //Jeœli nie masz doœæ sprytu umiejêtnoœci, to nie masz nawet po co siê staraæ. 
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Schatten_HELLO5 (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 5;
   condition    = DIA_Schatten_HELLO5_Condition;
   information  = DIA_Schatten_HELLO5_Info;
   permanent	= FALSE;
   description	= "Powiesz mi jeszcze coœ ciekawego?";
};

FUNC INT DIA_Schatten_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Schatten_Porady))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Schatten_HELLO5_15_01"); //Powiesz mi jeszcze coœ ciekawego?
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_02"); //Jak bêdziesz potrzebowa³ dobrego ³uku, lub strza³, przejdŸ siê do Cavalorna. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_03"); //To jeden z Cieni, któremu Diego powierzy³ zadanie kontrolowania jednej z dróg wiod¹cych do Nowego Obozu. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_04"); //Myœlê jednak, ¿e ten lis po prostu chcia³ sobie ca³ymi dniami polowaæ i przekona³ szefa, ¿e trzeba wys³aæ zwiadowcê w tamt¹ okolicê. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_05"); //Pewnie siedzi sobie teraz w starej chacie po Garlanie. 
};


//========================================
//-----------------> Galran
//========================================

INSTANCE DIA_Schatten_Galran (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 6;
   condition    = DIA_Schatten_Galran_Condition;
   information  = DIA_Schatten_Galran_Info;
   permanent	= FALSE;
   description	= "Kim by³ Garlan?";
};

FUNC INT DIA_Schatten_Galran_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Schatten_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_Galran_Info()
{
    AI_Output (other, self ,"DIA_Schatten_Galran_15_01"); //Kim by³ Garlan?
    AI_Output (self, other ,"DIA_Schatten_Galran_03_02"); //Stary Garlan? W czasie intensywnej rozbudowy Starej Kopalni by³ szefem drwali, a raczej Kopaczy których zagoniono do r¹bania drewna. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_03"); //Przed trafieniem do Kolonii Karnej by³ drwalem, wiêc wiele w jego ¿yciu siê nie zmieni³o.
    AI_Output (self, other ,"DIA_Schatten_Galran_03_04"); //Szczerze mówi¹c, jak Gomez poleci³ budowaæ kolejne poziomy w kopalni i rozpoczê³a siê ca³a akcja z wycink¹ lasu, to Garlan czu³ siê jak ryba w wodzie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_05"); //Mówi³ nawet, ¿e to najlepsze lata jego ¿ycia. Uda³o mu siê nawet sprowadziæ swoj¹ siekierê ze Œwiata Zewnêtrznego – ponoæ wczeœniej u¿y³ jej na jakimœ opoju w karczmie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_06"); //Magnaci naprawdê potrafi¹ czasem zdzia³aæ cuda. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_07"); //Jego pasja raczej nie udziela³a siê przys³anym mu do pomocy Kopaczom… 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_08"); //Ale mniejsza z tym. Potem wielka rozbudowa dobieg³a koñca, ale stary Garlan pozosta³ w swojej chacie i dalej zajmowa³ siê r¹baniem drewna. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_09"); //Od czasu do czasu przybywali do niego ze Starego Obozu i z kopalni, by odebraæ drewno. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_10"); //Ze Starego Obozu wys³ali raz Santino, by z³o¿y³ Garlanowi kolejne zamówienie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_11"); //Cieñ mia³ pecha, bo w chacie zasta³ zieleniej¹ce ju¿ cia³o starego drwala z wygryzionymi przez zêbacze bebechami. 
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Schatten_HowAreYou (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 7;
   condition    = DIA_Schatten_HowAreYou_Condition;
   information  = DIA_Schatten_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Schatten_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_01"); //Co s³ychaæ?
    if (Npc_GetTrueGuild (hero) == GIL_ORG)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_02"); //Nie rozmawiam z takimi jak ty!
    }
    else if (Npc_GetTrueGuild (hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_03"); //Zosta³eœ jednym z nas! 
        AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_04"); //Nie da siê ukryæ. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_05"); //Twoje zdrowie, kolego.
        CreateInvItems (self, ItFoBeer, 2);
        B_GiveInvItems (self, other, ItFoBeer, 1);
        AI_UseItem (self, ItFoBeer);
        AI_UseItem (hero, ItFoBeer);
    }
    else if (Npc_GetTrueGuild (hero) == GIL_GRD)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_06"); //Jeszcze wczoraj biega³eœ po obozie próbuj¹c wkupiæ siê w szeregi Cieni.
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_07"); //Dziœ wracasz jako Stra¿nik i pogromca królowej pe³zaczy. No bracie, jak tak dalej pójdzie, pewnie za tydzieñ bêdziesz jednym z Magnatów. 
        AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_08"); //Dziêki.
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_09"); //Twoje zdrowie.
        CreateInvItems (self, ItFoBeer, 1);
        AI_UseItem (self, ItFoBeer);
    }
    else
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_10"); //Rz¹dy Magnatów przynios³y do Kolonii dobrobyt i bogactwo. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_11"); //Niestety taka obfitoœæ dóbr przyci¹ga te¿ bandytów i ci¹gle musimy u¿eraæ siê z napadaj¹cymi na nasze konwoje Szkodnikami i innym œcierwem. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_12"); //Niebawem Gomez zrobi jednak z nimi porz¹dek, a wtedy to dopiero rozpocznie siê handel ze Œwiatem Zewnêtrznym. 
    };
};


