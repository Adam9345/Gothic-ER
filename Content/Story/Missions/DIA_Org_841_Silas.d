//poprawione i sprawdzone - Reflide

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Silas_EXIT(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 999;
	condition	= DIA_Silas_EXIT_Condition;
	information	= DIA_Silas_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_EXIT_Info()
{	
    CreateInvItems (Org_841_Silas, ItFoBooze, 1);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Hehler(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Hehler_Condition;
	information	= DIA_Silas_Hehler_Info;
	permanent	= 0;
	description = "Jak leci?";
};                       

FUNC INT DIA_Silas_Hehler_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Hehler_Info()
{	
	AI_Output (other, self,"DIA_Silas_Hehler_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Silas_Hehler_06_01"); //�wietnie! Sprzedajemy tu nasz� ry��wk� za par� bry�ek rudy.
	AI_Output (self, other,"DIA_Silas_Hehler_06_02"); //Da si� z tego wy�y�. W ko�cu co innego mog� ch�opcy zrobi� z ci�ko zarobion� rud�?
	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Silas sprzedaje ry��wk� w karczmie na jeziorze.");
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Trade(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Trade_Condition;
	information	= DIA_Silas_Trade_Info;
	permanent	= 1; //
	description = "Chc� si� napi�.";
	trade		= 1;
};                       

FUNC INT DIA_Silas_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Trade_Info()
{	
   
	AI_Output (other, self,"DIA_Silas_Trade_15_00"); //Chc� si� napi�.
	AI_Output (self, other,"DIA_Silas_Trade_06_01"); //Nie ma nic za darmo.
	B_ClearTreaderAmmo(self);
};



//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
//////////////////////////////////////////////

//========================================
//-----------------> WhoSellElixier
//========================================

INSTANCE DIA_Silas_WhoSellElixier (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_WhoSellElixier_Condition;
   information  = DIA_Silas_WhoSellElixier_Info;
   permanent	= FALSE;
   description	= "Wiesz, gdzie mog� kupi� eliksir z pe�zaczy?";
};

FUNC INT DIA_Silas_WhoSellElixier_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_WhoSellElixier_Info()
{
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_01"); //Wiesz, gdzie mog� kupi� eliksir z pe�zaczy?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_02"); //Taka informacja b�dzie sporo kosztowa�.
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_04"); //75 bry�ek rudy. Nie wygl�dasz mi na biedaka.
};

//========================================
//-----------------> Elixir
//========================================

INSTANCE DIA_Silas_Elixir (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 2;
   condition    = DIA_Silas_Elixir_Condition;
   information  = DIA_Silas_Elixir_Info;
   permanent	= TRUE;
   description	= "Kto sprzedaje eliksir?";
};

FUNC INT DIA_Silas_Elixir_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Silas_WhoSellElixier)) && (HeroKnowCipherSellElixier == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Elixir_Info()
{
    AI_Output (other, self ,"DIA_Silas_Elixir_15_01"); //Kto sprzedaje eliksir?
    if (Npc_HasItems (hero, ItMiNugget)>=75)
    {
        AI_Output (self, other ,"DIA_Silas_Elixir_03_02"); //To Cipher. Znajdziesz go w karczmie. Handluje te� zielem, ale bierze tylko du�e partie. 
        B_GiveInvItems (other, self, ItMiNugget, 75);
		HeroKnowCipherSellElixier = true;
		B_LogEntry     (CH3_SellElixer,"Od Silasa dowiedzia�em si�, �e Cipher handluje eliksirem.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Silas_Elixir_03_03"); //Nie ma rudy. Nie ma informacji.
        AI_StopProcessInfos	(self);
    };
};

//========================================
//-----------------> Cyrus_Dostawa
//========================================
var int silas_day;
INSTANCE DIA_Silas_Cyrus_Dostawa (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Cyrus_Dostawa_Condition;
   information  = DIA_Silas_Cyrus_Dostawa_Info;
   permanent	= true;
   description	= "Mam dostaw� od Cyrusa.";
};

FUNC INT DIA_Silas_Cyrus_Dostawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cyrus_HELLO3))
    && (silas_day != wld_getday())
    && (Npc_HasItems (other, dostawa_cyrusa) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Cyrus_Dostawa_Info()
{
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_01"); //Mam dostaw� od Cyrusa.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_02"); //�wietnie. Pewnie mam ci zap�aci� za dostarczenie?
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_03"); //By�oby mi�o. 
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_04"); //Trzymaj. B�dziesz mia� na piwo. 
    CreateInvItems (self, ItMiNugget, 25);
    B_GiveInvItems (self, other, ItMiNugget, 25);
    silas_day = wld_getday();
    AI_StopProcessInfos	(self);
    B_GiveInvItems (other, self, dostawa_cyrusa, 1);
	Npc_RemoveInvItems (self, dostawa_cyrusa,1);
	B_GiveXP (75);
};

//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Silas_Alcohol_Part (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Alcohol_Part_Condition;
   information  = DIA_Silas_Alcohol_Part_Info;
   permanent	= 0;
   description	= "Co wiesz o ostatnim napadzie Szkodnik�w...";
};

FUNC INT DIA_Silas_Alcohol_Part_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_New_Camp_Quartz))  
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Alcohol_Part_Info()
{
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_01"); //Co wiesz o ostatnim napadzie Szkodnik�w na ob�z pod star� kopalni�?
    AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_02"); //To, �e by�o to �atwiejsze ni� ukra�� grzebie� pijanej rozw�dce hahaha.
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_03"); //Interesuj� mnie szczeg�y.
    AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_04"); //Takie informacje kosztuj�.
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_05"); //Ile?
	AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_06"); //Przys�ug�. M�j pomocnik ma dostarczy� du�� parti� alkoholu do obozu w kotle ale potrzebuje ochrony. 	
	AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_07"); //Je�li chcesz si� wi�cej dowiedzie� o ostatnim napadzie szkodnik�w to b�dziesz go chroni� p�ki tam nie dotrze.
	 B_LogEntry              (CennyKwarcyt ,"Rozmawia�em z Silasem. W zamian za informacj� chc� bym eskortowa� jego pomocnika do Kot�a. Ma tam dostarczy� du�� parti� alkoholu.");
};

//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Silas_Cyrus_Alcohol_Part (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Cyrus_Alcohol_Part_Condition;
   information  = DIA_Silas_Cyrus_Alcohol_Part_Info;
   permanent	= 0;
   description	= "Niech b�dzie.";
};

FUNC INT DIA_Silas_Cyrus_Alcohol_Part_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Silas_Alcohol_Part))  
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Cyrus_Alcohol_Part_Info()
{
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol_Part_15_01"); //Niech b�dzie.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol_Part_03_02"); //Dobrze. P�jd� do mojego pomocnika i powiedz, �e pora wyrusza� do kot�a. 
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol_Part_15_03"); //W porz�dku.
   
	
};


//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Silas_Cyrus_Alcohol_Part1 (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Cyrus_Alcohol_Part1_Condition;
   information  = DIA_Silas_Cyrus_Alcohol_Part1_Info;
   permanent	= 0;
   description	= "Tw�j pomocnik z towarem dotar� do kot�a.";
};

FUNC INT DIA_Silas_Cyrus_Alcohol_Part1_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Pomocnik_Schuerfer))  
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Silas_Cyrus_Alcohol_Part1_Info()
{
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_01"); //Tw�j pomocnik z towarem dotar� do kot�a.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_02"); //Bardzo dobrze. Wykona�e� swoj� robot� poprawnie.
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_03"); //Pora by� wywi�za� si� z umowy.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_04"); //Jakiej umowy?
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_05"); //Mia�e� zdradzi� mi gdzie szkodnicy trzymaj� kwarcyt zrabowany z obozu przed star� kopalni�.
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_06"); //Aaaaa... Tak. Trzech Szkodnik�w pilnuje skrzyni z kwarcytem obok budynku gdzie zbieracze k�ad� si� spa�.
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_07"); //Dzi�ki.
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_08"); //Czekaj no... Powiedzia�em ci o tym ale nie chc� k�opot�w. Masz za�atwi� spraw� po cichu.
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_09"); //Co to znaczy?
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_10"); //Na przyk�ad przynie�� im gorza�k� ze �rodkiem nasennym i wtedy dobra� si� do kufra i zwia�.
	B_LogEntry               (CennyKwarcyt,"Silas twierdzi, �e Szkodnicy ukryli zrabowany kwarcyt w kufrze przy budynku gdzie zbieracze udaj� si� na nocleg. Mam za�atwi� spraw� po cichu, daj�c im alkohol ze �rodkiem nasennym. Mam si� uda� w tej sprawie do alchemika Jeremiasza.");
	    Info_ClearChoices (DIA_Silas_Cyrus_Alcohol_Part1);
	    Info_AddChoice    (DIA_Silas_Cyrus_Alcohol_Part1,"Sk�d mam wzi�� nap�j usypiaj�cy.",DIA_Silas_Alcohol_Sleep);
		
};



FUNC VOID DIA_Silas_Alcohol_Sleep()
  {
   AI_Output (other, self,"DIA_Silas_Alcohol_Sleep_15_01"); //Sk�d mam wzi�� nap�j usypiaj�cy.
   AI_Output (self, other,"DIA_Silas_Alcohol_Sleep_01_02"); //Od Jeremiasza. Co jak co ale daleko nie musisz go szuka�, hehe.
   AI_Output (other, self,"DIA_Silas_Alcohol_Sleep_15_03"); //Porozmawiam z nim.
  		
    AI_StopProcessInfos	           (self);
  
};


//========================================
//-----------------> HI_ZD
//========================================

INSTANCE DIA_Silas_HI_ZD (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_HI_ZD_Condition;
   information  = DIA_Silas_HI_ZD_Info;
   permanent	= FALSE;
   description	= "Chcia�bym kupi� butelk� grzanego wina.";
};

FUNC INT DIA_Silas_HI_ZD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Dillon_ZD_YES))
{
    return TRUE;
};
};
FUNC VOID DIA_Silas_HI_ZD_Info()
{
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_01"); //Chcia�bym kupi� butelk� grzanego wina.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_02"); //O kto� tu wie co dobre. Sprzedaje najlepsze grzane wino w ca�ej Kolonii.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_03"); //Mo�liwe. Cho� po prawdzie mam je tylko dostarczy� pewnemu cz�owiekowi.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_04"); //Mog� ci je sprzeda� za 60 bry�ek ale przedtem mam drobn� rob�tk� dla kogo� takiego jak ty.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_05"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_06"); //W obozie My�liwych znajduje si� pewien cz�owiek, kt�ry z nimi trzyma cho� oficjalnie do nich nie nale�y. To Magnus. Mam dla niego pewn� przesy�k�.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_07"); //Skrzynk� przedniego piwa.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_08"); //Mam mu j� dostarczy�, tak? I wtedy sprzedasz mi to wino?
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_09"); //Bystrzacha z ciebie.
	
	if (Magnus_PathToCave == TRUE)
	{
	B_LogEntry               (ZachciankiDiliona,"Silas sprzeda mi grzane wino za 60 bry�ek rudy ale najpierw mam dostarczy� skrzynk� piwa Magnusowi. Znajd� go kopalni z�ota Willa.");
	}
	else
	{
	B_LogEntry               (ZachciankiDiliona,"Silas sprzeda mi grzane wino za 60 bry�ek rudy ale najpierw mam dostarczy� skrzynk� piwa Magnusowi. Znajd� go w obozie My�liwych.");
	};
};

//========================================
//-----------------> ZD_CRATES
//========================================

INSTANCE DIA_Silas_ZD_CRATES (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_ZD_CRATES_Condition;
   information  = DIA_Silas_ZD_CRATES_Info;
   permanent	= FALSE;
   description	= "Daj mi t� skrzynk� a ja zanios� j� Magnusowi.";
};

FUNC INT DIA_Silas_ZD_CRATES_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Silas_HI_ZD))
{
    return TRUE;
};
};
FUNC VOID DIA_Silas_ZD_CRATES_Info()
{
    AI_Output (other, self ,"DIA_Silas_ZD_CRATES_15_01"); //Daj mi t� skrzynk� a ja zanios� j� Magnusowi.
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_02"); //Trzymaj, oto ona.
	B_GiveInvItems (self,other, ItMi_ZDCRATE, 1);
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_03"); //Tylko nie wy��op po drodze bo osobi�cie wygarbuje ci sk�r� moim toporem!
    AI_Output (other, self ,"DIA_Silas_ZD_CRATES_15_04"); //Zachowaj top�r na kogo� innego. Ja dotrzymam danego s�owa.
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_05"); //No... ja my�l�.
};

//========================================
//-----------------> ZD_MAGNUS
//========================================

INSTANCE DIA_Silas_ZD_MAGNUS (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 2;
   condition    = DIA_Silas_ZD_MAGNUS_Condition;
   information  = DIA_Silas_ZD_MAGNUS_Info;
   permanent	= FALSE;
   description	= "Dostarczy�em skrzynk� od ciebie Magnusowi.";
};

FUNC INT DIA_Silas_ZD_MAGNUS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Magnus_HI_ZD_BEER))
{

    return TRUE;
};
};
FUNC VOID DIA_Silas_ZD_MAGNUS_Info()
{
    AI_Output (other, self ,"DIA_Silas_ZD_MAGNUS_15_01"); //Dostarczy�em skrzynk� od ciebie Magnusowi.
    AI_Output (self, other ,"DIA_Silas_ZD_MAGNUS_03_02"); //I bardzo dobrze. Niech wie, �e stary Silas pami�ta o przyjacio�ach. 
    AI_Output (other, self ,"DIA_Silas_ZD_MAGNUS_15_03"); //Sprzedasz mi teraz to grzane wino?
    AI_Output (self, other ,"DIA_Silas_ZD_MAGNUS_03_04"); //Jasne. To naprawd� �wietna partia wina. Jak m�wi�em kosztuje 60 bry�ek ch�opcze. 
};

//========================================
//-----------------> ZD_S_NUGG
//========================================

INSTANCE DIA_Silas_ZD_S_NUGG (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 3;
   condition    = DIA_Silas_ZD_S_NUGG_Condition;
   information  = DIA_Silas_ZD_S_NUGG_Info;
   permanent	= FALSE;
   description	= "Masz t� rud�.";
};

FUNC INT DIA_Silas_ZD_S_NUGG_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Silas_ZD_MAGNUS))
{

    return TRUE;
};
};
FUNC VOID DIA_Silas_ZD_S_NUGG_Info()
{
    AI_Output (other, self ,"DIA_Silas_ZD_S_NUGG_15_01"); //Masz t� rud�.
    AI_Output (self, other ,"DIA_Silas_ZD_S_NUGG_03_02"); //Dzi�ki. A to wino dla ciebie.
    AI_Output (other, self ,"DIA_Silas_ZD_S_NUGG_15_03"); //B�d� lecia�. Trzymaj si�.
	B_GiveInvItems (self,other, ItFo_HotWine, 1);
	B_GiveInvItems (other,self, itminugget, 60);
	CreateInvItems (self, ItRe_HotWine, 1);
	B_LogEntry               (ZachciankiDiliona,"Kupi�em grzane wino od Silasa. Je�li mam wszystko co trzeba to mog� wr�ci� do Dillona by odda� mu pozyskane towary I dosta� zap�at�.");
};

//========================================
//-----------------> Lin
//========================================

INSTANCE DIA_Silas_Lin (C_INFO)
{
   npc          = Org_841_Silas;
   nr           = 1;
   condition    = DIA_Silas_Lin_Condition;
   information  = DIA_Silas_Lin_Info;
   permanent	= FALSE;
   description	= "Co tu robi ten pijany w sztok Wojownik �wi�tynny?";
};

FUNC INT DIA_Silas_Lin_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Silas_Hehler))
&& (Npc_KnowsInfo(hero,DIA_GorNaLin_HI_LIN))
{
    return TRUE;
};
};
FUNC VOID DIA_Silas_Lin_Info()
{
    AI_Output (other, self ,"DIA_Silas_Lin_15_01"); //Co tu robi ten pijany w sztok Wojownik �wi�tynny?
    AI_Output (self, other ,"DIA_Silas_Lin_03_02"); //Wie�ci szybko si� rozchodz� co?
    AI_Output (other, self ,"DIA_Silas_Lin_15_03"); //Raczej smr�d jego rzygowin.
    AI_Output (self, other ,"DIA_Silas_Lin_03_04"); //To nie moja sprawa. 
    AI_Output (other, self ,"DIA_Silas_Lin_15_05"); //Przecie� robi ci ba�agan w lokalu. Tylko le�y i be�kocze co�.
    AI_Output (self, other ,"DIA_Silas_Lin_03_06"); //Trudno. Bywalcy karczmy zd��yli si� do niego przyzwyczai�.
    AI_Output (other, self ,"DIA_Silas_Lin_15_07"); //Czemu przymykasz na to oko?
    AI_Output (self, other ,"DIA_Silas_Lin_03_08"); //Mam wa�niejsze sprawy na g�owie. A ty d�u�ej nie zawracaj mi tym dupy. Zrozumiano?
};

instance dia_silas_pickpocket(c_info) {
    npc = org_841_silas;
    nr = 900;
    condition = dia_silas_pickpocket_condition;
    information = dia_silas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_silas_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_silas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_silas_pickpocket);
	info_addchoice(dia_silas_pickpocket, dialog_back, dia_silas_pickpocket_back);
	info_addchoice(dia_silas_pickpocket, dialog_pickpocket, dia_silas_pickpocket_doit);
};

func void dia_silas_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_silas_pickpocket);
};

func void dia_silas_pickpocket_back() {
    info_clearchoices(dia_silas_pickpocket);
};