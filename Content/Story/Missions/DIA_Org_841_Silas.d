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
	AI_Output (self, other,"DIA_Silas_Hehler_06_01"); //Œwietnie! Sprzedajemy tu nasz¹ ry¿ówkê za parê bry³ek rudy.
	AI_Output (self, other,"DIA_Silas_Hehler_06_02"); //Da siê z tego wy¿yæ. W koñcu co innego mog¹ ch³opcy zrobiæ z ciê¿ko zarobion¹ rud¹?
	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Silas sprzedaje ry¿ówkê w karczmie na jeziorze.");
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
	description = "Chcê siê napiæ.";
	trade		= 1;
};                       

FUNC INT DIA_Silas_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Trade_Info()
{	
   
	AI_Output (other, self,"DIA_Silas_Trade_15_00"); //Chcê siê napiæ.
	AI_Output (self, other,"DIA_Silas_Trade_06_01"); //Nie ma nic za darmo.
	B_ClearTreaderAmmo(self);
};



//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
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
   description	= "Wiesz, gdzie mogê kupiæ eliksir z pe³zaczy?";
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
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_01"); //Wiesz, gdzie mogê kupiæ eliksir z pe³zaczy?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_02"); //Taka informacja bêdzie sporo kosztowaæ.
    AI_Output (other, self ,"DIA_Silas_WhoSellElixier_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Silas_WhoSellElixier_03_04"); //75 bry³ek rudy. Nie wygl¹dasz mi na biedaka.
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
        AI_Output (self, other ,"DIA_Silas_Elixir_03_02"); //To Cipher. Znajdziesz go w karczmie. Handluje te¿ zielem, ale bierze tylko du¿e partie. 
        B_GiveInvItems (other, self, ItMiNugget, 75);
		HeroKnowCipherSellElixier = true;
		B_LogEntry     (CH3_SellElixer,"Od Silasa dowiedzia³em siê, ¿e Cipher handluje eliksirem.");
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
   description	= "Mam dostawê od Cyrusa.";
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
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_01"); //Mam dostawê od Cyrusa.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_02"); //Œwietnie. Pewnie mam ci zap³aciæ za dostarczenie?
    AI_Output (other, self ,"DIA_Silas_Cyrus_Dostawa_15_03"); //By³oby mi³o. 
    AI_Output (self, other ,"DIA_Silas_Cyrus_Dostawa_03_04"); //Trzymaj. Bêdziesz mia³ na piwo. 
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
   description	= "Co wiesz o ostatnim napadzie Szkodników...";
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
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_01"); //Co wiesz o ostatnim napadzie Szkodników na obóz pod star¹ kopalni¹?
    AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_02"); //To, ¿e by³o to ³atwiejsze ni¿ ukraœæ grzebieñ pijanej rozwódce hahaha.
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_03"); //Interesuj¹ mnie szczegó³y.
    AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_04"); //Takie informacje kosztuj¹.
    AI_Output (other, self ,"DIA_Silas_Alcohol_Part_15_05"); //Ile?
	AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_06"); //Przys³ugê. Mój pomocnik ma dostarczyæ du¿¹ partiê alkoholu do obozu w kotle ale potrzebuje ochrony. 	
	AI_Output (self, other ,"DIA_Silas_Alcohol_Part_03_07"); //Jeœli chcesz siê wiêcej dowiedzieæ o ostatnim napadzie szkodników to bêdziesz go chroni³ póki tam nie dotrze.
	 B_LogEntry              (CennyKwarcyt ,"Rozmawia³em z Silasem. W zamian za informacjê chcê bym eskortowa³ jego pomocnika do Kot³a. Ma tam dostarczyæ du¿¹ partiê alkoholu.");
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
   description	= "Niech bêdzie.";
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
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol_Part_15_01"); //Niech bêdzie.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol_Part_03_02"); //Dobrze. PójdŸ do mojego pomocnika i powiedz, ¿e pora wyruszaæ do kot³a. 
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol_Part_15_03"); //W porz¹dku.
   
	
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
   description	= "Twój pomocnik z towarem dotar³ do kot³a.";
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
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_01"); //Twój pomocnik z towarem dotar³ do kot³a.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_02"); //Bardzo dobrze. Wykona³eœ swoj¹ robotê poprawnie.
    AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_03"); //Pora byœ wywi¹za³ siê z umowy.
    AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_04"); //Jakiej umowy?
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_05"); //Mia³eœ zdradziæ mi gdzie szkodnicy trzymaj¹ kwarcyt zrabowany z obozu przed star¹ kopalni¹.
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_06"); //Aaaaa... Tak. Trzech Szkodników pilnuje skrzyni z kwarcytem obok budynku gdzie zbieracze k³ad¹ siê spaæ.
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_07"); //Dziêki.
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_08"); //Czekaj no... Powiedzia³em ci o tym ale nie chcê k³opotów. Masz za³atwiæ sprawê po cichu.
	AI_Output (other, self ,"DIA_Silas_Cyrus_Alcohol1_Part_15_09"); //Co to znaczy?
	AI_Output (self, other ,"DIA_Silas_Cyrus_Alcohol1_Part_03_10"); //Na przyk³ad przynieœæ im gorza³kê ze œrodkiem nasennym i wtedy dobraæ siê do kufra i zwiaæ.
	B_LogEntry               (CennyKwarcyt,"Silas twierdzi, ¿e Szkodnicy ukryli zrabowany kwarcyt w kufrze przy budynku gdzie zbieracze udaj¹ siê na nocleg. Mam za³atwiæ sprawê po cichu, daj¹c im alkohol ze œrodkiem nasennym. Mam siê udaæ w tej sprawie do alchemika Jeremiasza.");
	    Info_ClearChoices (DIA_Silas_Cyrus_Alcohol_Part1);
	    Info_AddChoice    (DIA_Silas_Cyrus_Alcohol_Part1,"Sk¹d mam wzi¹æ napój usypiaj¹cy.",DIA_Silas_Alcohol_Sleep);
		
};



FUNC VOID DIA_Silas_Alcohol_Sleep()
  {
   AI_Output (other, self,"DIA_Silas_Alcohol_Sleep_15_01"); //Sk¹d mam wzi¹æ napój usypiaj¹cy.
   AI_Output (self, other,"DIA_Silas_Alcohol_Sleep_01_02"); //Od Jeremiasza. Co jak co ale daleko nie musisz go szukaæ, hehe.
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
   description	= "Chcia³bym kupiæ butelkê grzanego wina.";
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
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_01"); //Chcia³bym kupiæ butelkê grzanego wina.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_02"); //O ktoœ tu wie co dobre. Sprzedaje najlepsze grzane wino w ca³ej Kolonii.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_03"); //Mo¿liwe. Choæ po prawdzie mam je tylko dostarczyæ pewnemu cz³owiekowi.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_04"); //Mogê ci je sprzedaæ za 60 bry³ek ale przedtem mam drobn¹ robótkê dla kogoœ takiego jak ty.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_05"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_06"); //W obozie Myœliwych znajduje siê pewien cz³owiek, który z nimi trzyma choæ oficjalnie do nich nie nale¿y. To Magnus. Mam dla niego pewn¹ przesy³kê.
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_07"); //Skrzynkê przedniego piwa.
    AI_Output (other, self ,"DIA_Silas_HI_ZD_15_08"); //Mam mu j¹ dostarczyæ, tak? I wtedy sprzedasz mi to wino?
    AI_Output (self, other ,"DIA_Silas_HI_ZD_03_09"); //Bystrzacha z ciebie.
	
	if (Magnus_PathToCave == TRUE)
	{
	B_LogEntry               (ZachciankiDiliona,"Silas sprzeda mi grzane wino za 60 bry³ek rudy ale najpierw mam dostarczyæ skrzynkê piwa Magnusowi. Znajdê go kopalni z³ota Willa.");
	}
	else
	{
	B_LogEntry               (ZachciankiDiliona,"Silas sprzeda mi grzane wino za 60 bry³ek rudy ale najpierw mam dostarczyæ skrzynkê piwa Magnusowi. Znajdê go w obozie Myœliwych.");
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
   description	= "Daj mi t¹ skrzynkê a ja zaniosê j¹ Magnusowi.";
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
    AI_Output (other, self ,"DIA_Silas_ZD_CRATES_15_01"); //Daj mi t¹ skrzynkê a ja zaniosê j¹ Magnusowi.
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_02"); //Trzymaj, oto ona.
	B_GiveInvItems (self,other, ItMi_ZDCRATE, 1);
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_03"); //Tylko nie wy¿³op po drodze bo osobiœcie wygarbuje ci skórê moim toporem!
    AI_Output (other, self ,"DIA_Silas_ZD_CRATES_15_04"); //Zachowaj topór na kogoœ innego. Ja dotrzymam danego s³owa.
    AI_Output (self, other ,"DIA_Silas_ZD_CRATES_03_05"); //No... ja myœlê.
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
   description	= "Dostarczy³em skrzynkê od ciebie Magnusowi.";
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
    AI_Output (other, self ,"DIA_Silas_ZD_MAGNUS_15_01"); //Dostarczy³em skrzynkê od ciebie Magnusowi.
    AI_Output (self, other ,"DIA_Silas_ZD_MAGNUS_03_02"); //I bardzo dobrze. Niech wie, ¿e stary Silas pamiêta o przyjacio³ach. 
    AI_Output (other, self ,"DIA_Silas_ZD_MAGNUS_15_03"); //Sprzedasz mi teraz to grzane wino?
    AI_Output (self, other ,"DIA_Silas_ZD_MAGNUS_03_04"); //Jasne. To naprawdê œwietna partia wina. Jak mówi³em kosztuje 60 bry³ek ch³opcze. 
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
   description	= "Masz t¹ rudê.";
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
    AI_Output (other, self ,"DIA_Silas_ZD_S_NUGG_15_01"); //Masz t¹ rudê.
    AI_Output (self, other ,"DIA_Silas_ZD_S_NUGG_03_02"); //Dziêki. A to wino dla ciebie.
    AI_Output (other, self ,"DIA_Silas_ZD_S_NUGG_15_03"); //Bêdê lecia³. Trzymaj siê.
	B_GiveInvItems (self,other, ItFo_HotWine, 1);
	B_GiveInvItems (other,self, itminugget, 60);
	CreateInvItems (self, ItRe_HotWine, 1);
	B_LogEntry               (ZachciankiDiliona,"Kupi³em grzane wino od Silasa. Jeœli mam wszystko co trzeba to mogê wróciæ do Dillona by oddaæ mu pozyskane towary I dostaæ zap³atê.");
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
   description	= "Co tu robi ten pijany w sztok Wojownik Œwi¹tynny?";
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
    AI_Output (other, self ,"DIA_Silas_Lin_15_01"); //Co tu robi ten pijany w sztok Wojownik Œwi¹tynny?
    AI_Output (self, other ,"DIA_Silas_Lin_03_02"); //Wieœci szybko siê rozchodz¹ co?
    AI_Output (other, self ,"DIA_Silas_Lin_15_03"); //Raczej smród jego rzygowin.
    AI_Output (self, other ,"DIA_Silas_Lin_03_04"); //To nie moja sprawa. 
    AI_Output (other, self ,"DIA_Silas_Lin_15_05"); //Przecie¿ robi ci ba³agan w lokalu. Tylko le¿y i be³kocze coœ.
    AI_Output (self, other ,"DIA_Silas_Lin_03_06"); //Trudno. Bywalcy karczmy zd¹¿yli siê do niego przyzwyczaiæ.
    AI_Output (other, self ,"DIA_Silas_Lin_15_07"); //Czemu przymykasz na to oko?
    AI_Output (self, other ,"DIA_Silas_Lin_03_08"); //Mam wa¿niejsze sprawy na g³owie. A ty d³u¿ej nie zawracaj mi tym dupy. Zrozumiano?
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