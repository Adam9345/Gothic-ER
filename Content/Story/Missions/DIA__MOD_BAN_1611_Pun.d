//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RaeuberKowal_EXIT(C_INFO)
{
	npc             = BAN_1611_Pun;
	nr              = 999;
	condition	= DIA_RaeuberKowal_EXIT_Condition;
	information	= DIA_Raeuberkowal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_RaeuberKowal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RaeuberKowal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia³ -
// Dialogi ogólne, fabularne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Raeuber_HELLO1 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_HELLO1_Condition;
   information  = DIA_Raeuber_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jesteœ tu kowalem?";
};

FUNC INT DIA_Raeuber_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Raeuber_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO1_15_01"); //Jesteœ tu kowalem?
    AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_02"); //Nazywam siê Pun i kujê orê¿ dla Bandytów. Nic szczególnego: proste miecze i maczugi.
	AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_03"); //Kiedyœ robi³em wspania³e bronie, ale teraz nie mam sk³adników, ani porz¹dnego sprzêtu. Poza tym ludzie w Kolonii maj¹ inne priorytety dotycz¹ce broni.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Raeuber_HELLO2 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_HELLO2_Condition;
   information  = DIA_Raeuber_HELLO2_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e znasz siê na tej robocie.";
};

FUNC INT DIA_Raeuber_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO1))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_01"); //Widzê, ¿e znasz siê na tej robocie.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_02"); //Kucie prostych mieczy wcale nie jest takie trudne. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_03"); //Nawet ty z pewnoœci¹ byœ sobie poradzi³. Gorszych obiboków niegdyœ uczy³em.
   
   
};
/*
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Raeuber_HELLO3 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 3;
   condition    = DIA_Raeuber_HELLO3_Condition;
   information  = DIA_Raeuber_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz doœwiadczenie w budowaniu kuŸni.";
};

FUNC INT DIA_Raeuber_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_01"); //Masz doœwiadczenie w budowaniu kuŸni. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_02"); //Sk¹d w ogóle macie kowad³o w Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_03"); //He he. Wiedzia³em, ¿e ktoœ w koñcu o to zapyta. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_04"); //O ile sprawa w Khorinis by³a prostsza, to tutaj musieliœmy ju¿ siê nag³owiæ, jak zdobyæ kowad³o.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_05"); //Najpierw opowiem ci o kowadle w jaskini. Gdy by³em na wolnoœci i mia³em zamiar kuæ potajemnie broñ dla bandytów dowiedzia³em siê, ¿e do miasta ma przyp³yn¹æ nowa dostawa z kontynentu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_06"); //Na statku mia³y siê znajdowaæ trzy nowiutkie kowad³a. Postanowi³em, ¿e wykorzystam okazjê.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_07"); //Kiedy stra¿nicy wy³adowali kowad³a i poszli napiæ siê piwa, szybko wepchn¹³em jedno z nich na ma³¹, przygotowan¹ wczeœniej ³ódŸ.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_08"); //Chyba sam Innos nade mn¹ czuwa³, bo kowad³o nie zrobi³o dziury w dnie ³odzi.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_09"); //Szybko odp³yn¹³em dalej od miasta i z trudem wyj¹³em kowad³o na brzeg. PóŸniej czeka³o mnie tylko przetransportowanie mojej zdobyczy do jaskini.
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_10"); //To ci dopiero historia. A jak to by³o z kowad³em w tym Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_11"); //Tutaj te¿ mieliœmy olbrzymie szczêœcie. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_12"); //Otó¿ parê lat wstecz Gomez zaplanowa³ budowê kuŸni w Starej Kopalni. Staliœmy siê na tyle uci¹¿liwi, ¿e konwoje z kopalni do obozu nie by³y ju¿ bezpieczne.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_13"); //Kopaczy nios¹cych ciê¿kie skrzynie rudy napaœæ by³o znacznie ³atwiej. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_14"); //Gomez chyba planowa³ kuæ broñ bezpoœrednio w kopalni i dopiero wtedy dostarczaæ l¿ejszy ³adunek do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_15"); //Gdy tylko dowiedzieliœmy siê kiedy kowad³o bêdzie transportowane do kopalni, przyst¹piliœmy do dzia³ania. 
	AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_16"); //WyobraŸ sobie piêtnastu Bandytów pchaj¹cych noc¹ kowad³o przez las. Magnaci najwyraŸniej nie spodziewali siê, ¿e coœ takiego przyjdzie nam do g³owy.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_17"); //Jako obstawê wys³ali zaledwie piêciu Stra¿ników. Pokonanie ich to pestka. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_18"); //Szczerze to dziwiê siê, ¿e Gomez jeszcze nas nie zaatakowa³. Nawet nie próbowa³ siê zemœciæ. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_19"); //Mo¿e czeka na odpowiedni moment?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_20"); //Mo¿e, ale dzisiaj... wolê o tym nie myœleæ.
};
*/
//========================================
//-----------------> SwordElement
//========================================

INSTANCE DIA_Raeuber_SwordElement (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Raeuber_SwordElement_Condition;
   information  = DIA_Raeuber_SwordElement_Info;
   permanent	= FALSE;
   description	= "Pamiêtasz mo¿e taki miecz?";
};

FUNC INT DIA_Raeuber_SwordElement_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bandyta_FindSwordElement)) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Raeuber_SwordElement_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_01"); //Pamiêtasz mo¿e taki miecz?
    AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_02"); //Pamiêtam. Sk¹d to masz?
	AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_03"); //Znalaz³em. Interesuje mnie w³aœciciel tego miecza.
	AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_03"); //Robi³em miecz o takim ostrzu dla Jensa. Nie wierzê, ¿e go zniszczy³. Zawsze szanowa³ moj¹ pracê...
	
	B_LogEntry               (CH1_DestroyedGrave,"Pokaza³em Punowi fragment miecza. Powiedzia³, ¿e sprzeda³ takie ostrze Jensowi. Ciekawe co na to Kereth...");
};

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Raeuber_RAYAN (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 2;
   condition    = DIA_Raeuber_RAYAN_Condition;
   information  = DIA_Raeuber_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ na temat œmierci Rayana?";
};

FUNC INT DIA_Raeuber_RAYAN_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Raeuber_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_01"); //Wiesz coœ na temat œmierci Rayana?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_02"); //Ostatnio dowiedzia³em siê, ¿e ktoœ niszczy³ jego grób przy u¿yciu miecza, który zrobi³em dla Jensa. 
	AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_03"); //Faktycznie tak by³o. Coœ wiêcej?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_03"); //Nic, a nic. Jestem zajêty prac¹. Ostatnio nie zwraca³em uwagi na to co siê dzieje w Obozie.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia³ 4
// Wa¿ne dialogi dla w¹tków fabularnych innych obozów
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> LearnMe
//========================================

INSTANCE DIA_Pun_LearnMe (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_LearnMe_Condition;
   information  = DIA_Pun_LearnMe_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Pun_LearnMe_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Raeuber_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Pun_LearnMe_Info()
{
    AI_Output (other, self ,"DIA_Pun_LearnMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Pun_LearnMe_03_02"); //Jasne, mogê ci pokazaæ jak wykuæ solidny miecz.
};


//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Pun_LearnSmith_01 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_LearnSmith_01_Condition;
   information  = DIA_Pun_LearnSmith_01_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wykuæ miecz. (Kowalstwo poz.1/3 - 5 PN)";
};

FUNC INT DIA_Pun_LearnSmith_01_Condition()
{
 if (NPC_TALENT_SMITH == 0) && (Npc_KnowsInfo(hero,DIA_Pun_LearnMe))
{
    return TRUE;
};
};
FUNC VOID DIA_Pun_LearnSmith_01_Info()
{

    if  (hero.lp >= 5) 
	{
    AI_Output (other, self ,"DIA_Pun_LearnSmith_01_15_01"); //Naucz mnie jak wykuæ miecz. 
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_02"); //To doœæ proste. ZnajdŸ sobie plan oraz kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_04"); //Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_05"); //Reszty dowiesz siê sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Pun_LearnSmith_01_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
	};
	
};



//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Pun_LearnSmith_02 (C_INFO)
{
   npc          = BAN_1611_Pun;
   nr           = 1;
   condition    = DIA_Pun_LearnSmith_02_Condition;
   information  = DIA_Pun_LearnSmith_02_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wykuæ dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
};

FUNC INT DIA_Pun_LearnSmith_02_Condition()
{
 if (NPC_TALENT_SMITH == 1) 
{
    return TRUE;
};
};
FUNC VOID DIA_Pun_LearnSmith_02_Info()
{

    if  (hero.lp >= 10) 
	{
    AI_Output (other, self ,"DIA_Pun_LearnSmith_02_15_01"); //Naucz mnie jak wykuæ dobry miecz. 
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_02"); //Podstawy ju¿ znasz, teraz czas na coœ trudniejszego...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_03"); //Gdy uderzasz w gor¹c¹ stal staraj siê robiæ to z wyczuciem i nie b¹dŸ spiêty.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_04"); //Najwa¿niejsze, jest to byœ nie uderza³ zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_05"); //Poza tym, wszystko zale¿y od ciebie i rodzaju broni, jak¹ chcesz wykonaæ.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Pun_LearnSmith_02_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
	};
	
};

instance dia_pun_pickpocket(c_info) {
    npc = ban_1611_pun;
    nr = 900;
    condition = dia_pun_pickpocket_condition;
    information = dia_pun_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pun_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_pun_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pun_pickpocket);
	info_addchoice(dia_pun_pickpocket, dialog_back, dia_pun_pickpocket_back);
	info_addchoice(dia_pun_pickpocket, dialog_pickpocket, dia_pun_pickpocket_doit);
};

func void dia_pun_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_pun_pickpocket);
};

func void dia_pun_pickpocket_back() {
    info_clearchoices(dia_pun_pickpocket);
};