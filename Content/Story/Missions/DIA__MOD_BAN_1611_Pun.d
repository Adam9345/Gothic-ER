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
// Rozdzia� -
// Dialogi og�lne, fabularne
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
   description	= "Jeste� tu kowalem?";
};

FUNC INT DIA_Raeuber_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Raeuber_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO1_15_01"); //Jeste� tu kowalem?
    AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_02"); //Nazywam si� Pun i kuj� or� dla Bandyt�w. Nic szczeg�lnego: proste miecze i maczugi.
	AI_Output (self, other ,"DIA_Raeuber_HELLO1_03_03"); //Kiedy� robi�em wspania�e bronie, ale teraz nie mam sk�adnik�w, ani porz�dnego sprz�tu. Poza tym ludzie w Kolonii maj� inne priorytety dotycz�ce broni.
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
   description	= "Widz�, �e znasz si� na tej robocie.";
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
    AI_Output (other, self ,"DIA_Raeuber_HELLO2_15_01"); //Widz�, �e znasz si� na tej robocie.
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_02"); //Kucie prostych mieczy wcale nie jest takie trudne. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO2_03_03"); //Nawet ty z pewno�ci� by� sobie poradzi�. Gorszych obibok�w niegdy� uczy�em.
   
   
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
   description	= "Masz do�wiadczenie w budowaniu ku�ni.";
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
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_01"); //Masz do�wiadczenie w budowaniu ku�ni. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_02"); //Sk�d w og�le macie kowad�o w Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_03"); //He he. Wiedzia�em, �e kto� w ko�cu o to zapyta. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_04"); //O ile sprawa w Khorinis by�a prostsza, to tutaj musieli�my ju� si� nag�owi�, jak zdoby� kowad�o.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_05"); //Najpierw opowiem ci o kowadle w jaskini. Gdy by�em na wolno�ci i mia�em zamiar ku� potajemnie bro� dla bandyt�w dowiedzia�em si�, �e do miasta ma przyp�yn�� nowa dostawa z kontynentu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_06"); //Na statku mia�y si� znajdowa� trzy nowiutkie kowad�a. Postanowi�em, �e wykorzystam okazj�.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_07"); //Kiedy stra�nicy wy�adowali kowad�a i poszli napi� si� piwa, szybko wepchn��em jedno z nich na ma��, przygotowan� wcze�niej ��d�.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_08"); //Chyba sam Innos nade mn� czuwa�, bo kowad�o nie zrobi�o dziury w dnie �odzi.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_09"); //Szybko odp�yn��em dalej od miasta i z trudem wyj��em kowad�o na brzeg. P�niej czeka�o mnie tylko przetransportowanie mojej zdobyczy do jaskini.
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_10"); //To ci dopiero historia. A jak to by�o z kowad�em w tym Obozie?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_11"); //Tutaj te� mieli�my olbrzymie szcz�cie. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_12"); //Ot� par� lat wstecz Gomez zaplanowa� budow� ku�ni w Starej Kopalni. Stali�my si� na tyle uci��liwi, �e konwoje z kopalni do obozu nie by�y ju� bezpieczne.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_13"); //Kopaczy nios�cych ci�kie skrzynie rudy napa�� by�o znacznie �atwiej. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_14"); //Gomez chyba planowa� ku� bro� bezpo�rednio w kopalni i dopiero wtedy dostarcza� l�ejszy �adunek do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_15"); //Gdy tylko dowiedzieli�my si� kiedy kowad�o b�dzie transportowane do kopalni, przyst�pili�my do dzia�ania. 
	AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_16"); //Wyobra� sobie pi�tnastu Bandyt�w pchaj�cych noc� kowad�o przez las. Magnaci najwyra�niej nie spodziewali si�, �e co� takiego przyjdzie nam do g�owy.
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_17"); //Jako obstaw� wys�ali zaledwie pi�ciu Stra�nik�w. Pokonanie ich to pestka. 
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_18"); //Szczerze to dziwi� si�, �e Gomez jeszcze nas nie zaatakowa�. Nawet nie pr�bowa� si� zem�ci�. 
    AI_Output (other, self ,"DIA_Raeuber_HELLO3_15_19"); //Mo�e czeka na odpowiedni moment?
    AI_Output (self, other ,"DIA_Raeuber_HELLO3_03_20"); //Mo�e, ale dzisiaj... wol� o tym nie my�le�.
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
   description	= "Pami�tasz mo�e taki miecz?";
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
    AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_01"); //Pami�tasz mo�e taki miecz?
    AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_02"); //Pami�tam. Sk�d to masz?
	AI_Output (other, self ,"DIA_Raeuber_SwordElement_15_03"); //Znalaz�em. Interesuje mnie w�a�ciciel tego miecza.
	AI_Output (self, other ,"DIA_Raeuber_SwordElement_03_03"); //Robi�em miecz o takim ostrzu dla Jensa. Nie wierz�, �e go zniszczy�. Zawsze szanowa� moj� prac�...
	
	B_LogEntry               (CH1_DestroyedGrave,"Pokaza�em Punowi fragment miecza. Powiedzia�, �e sprzeda� takie ostrze Jensowi. Ciekawe co na to Kereth...");
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
   description	= "Wiesz co� na temat �mierci Rayana?";
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
    AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_01"); //Wiesz co� na temat �mierci Rayana?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_02"); //Ostatnio dowiedzia�em si�, �e kto� niszczy� jego gr�b przy u�yciu miecza, kt�ry zrobi�em dla Jensa. 
	AI_Output (other, self ,"DIA_Raeuber_RAYAN_15_03"); //Faktycznie tak by�o. Co� wi�cej?
    AI_Output (self, other ,"DIA_Raeuber_RAYAN_03_03"); //Nic, a nic. Jestem zaj�ty prac�. Ostatnio nie zwraca�em uwagi na to co si� dzieje w Obozie.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Pun
// Rozdzia� 4
// Wa�ne dialogi dla w�tk�w fabularnych innych oboz�w
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
   description	= "Mo�esz mnie czego� nauczy�?";
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
    AI_Output (other, self ,"DIA_Pun_LearnMe_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Pun_LearnMe_03_02"); //Jasne, mog� ci pokaza� jak wyku� solidny miecz.
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
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.1/3 - 5 PN)";
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
    AI_Output (other, self ,"DIA_Pun_LearnSmith_01_15_01"); //Naucz mnie jak wyku� miecz. 
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_02"); //To do�� proste. Znajd� sobie plan oraz kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_04"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_01_03_05"); //Reszty dowiesz si� sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Pun_LearnSmith_01_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
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
   description	= "Naucz mnie jak wyku� dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
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
    AI_Output (other, self ,"DIA_Pun_LearnSmith_02_15_01"); //Naucz mnie jak wyku� dobry miecz. 
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_02"); //Podstawy ju� znasz, teraz czas na co� trudniejszego...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_03"); //Gdy uderzasz w gor�c� stal staraj si� robi� to z wyczuciem i nie b�d� spi�ty.
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_04"); //Najwa�niejsze, jest to by� nie uderza� zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Pun_LearnSmith_02_03_05"); //Poza tym, wszystko zale�y od ciebie i rodzaju broni, jak� chcesz wykona�.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Pun_LearnSmith_02_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
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