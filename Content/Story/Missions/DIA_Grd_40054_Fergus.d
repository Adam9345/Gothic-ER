//poprawione i sprawdzone - Reflide

  
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fergus_EXIT(C_INFO)
{
	npc             = Grd_40054_Fergus;
	nr              = 999;
	condition	= DIA_Fergus_EXIT_Condition;
	information	= DIA_Fergus_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Fergus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fergus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HI
//========================================

INSTANCE DIA_Fergus_HI (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_HI_Condition;
   information  = DIA_Fergus_HI_Info;
   permanent	= FALSE;
   description	= "Dobrze znasz si� na tej robocie?";
};

FUNC INT DIA_Fergus_HI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fergus_HELLO_HI))
{

    return TRUE;
};
};
FUNC VOID DIA_Fergus_HI_Info()
{
    AI_Output (other, self ,"DIA_Fergus_HI_15_01"); //Dobrze znasz si� na tej robocie?
    AI_Output (self, other ,"DIA_Fergus_HI_03_02"); //Staram si�. Nie pracuje w tej robocie od wczoraj ch�opcze.
    AI_Output (self, other ,"DIA_Fergus_HI_03_03"); //Mo�e nie jestem samorodnym talentem ale ci�k� prac� naby�em swoje umiej�tno�ci.
    AI_Output (self, other ,"DIA_Fergus_HI_03_04"); //Niegdy� jeszcze na kontynencie by�em czeladnikiem u kowala. Dobrze mi sz�o w pewnym momencie nawet chcia�em otworzy� w�asny warsztat.
    AI_Output (other, self ,"DIA_Fergus_HI_15_05"); //Domy�lam si� , �e wszystko si� posypa�o.
    AI_Output (self, other ,"DIA_Fergus_HI_03_06"); // Pod miastem pozna�em pewn� farmerk� o imieniu Polly. I zakocha�em si� na zab�j.
    AI_Output (self, other ,"DIA_Fergus_HI_03_07"); //Chcia�em si� z ni� o�eni� , mie� dom I dzieci. Ale wtedy pojawi� si� ten pata�ach.
    AI_Output (other, self ,"DIA_Fergus_HI_15_08"); //Jaki pata�ach?
    AI_Output (self, other ,"DIA_Fergus_HI_03_09"); //Pewien strojni� z odleg�ych stron. Widzia�em, �e jeszcze troch� I mu si� uda. 
    AI_Output (self, other ,"DIA_Fergus_HI_03_10"); //Uci��em sobie z nim wi�c ,,m�sk� rozmow�. Powiedzia�em co my�l� I wygarn��em w ryj.  A ten p�aczek upadaj�c uderzy� ty�em g�owy o jak�� wystaj�c� ska��.
    AI_Output (self, other ,"DIA_Fergus_HI_03_11"); // I by�o po nim. Zaraz by�o zbiegowisko , s�d I wyrok. Zsy�ka do Kolonii karnej. I oto tu jestem ju� par� lat.
    AI_Output (self, other ,"DIA_Fergus_HI_03_12"); //Ka�dy z nas za co� tu trafi�. Ka�dy ma swoje brzemi� ch�opcze.
};


//========================================
//-----------------> HELLO_HI
//========================================

INSTANCE DIA_Fergus_HELLO_HI (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_HELLO_HI_Condition;
   information  = DIA_Fergus_HELLO_HI_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Fergus_HELLO_HI_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fergus_HELLO_HI_Info()
{
    AI_Output (other, self ,"DIA_Fergus_HELLO_HI_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Fergus_HELLO_HI_03_02"); //Nazywam si� Fergus i jestem kowalem, jak widzisz...
    AI_Output (other, self ,"DIA_Fergus_HELLO_HI_15_03"); //Mog� co� u ciebie dosta�?
    AI_Output (self, other ,"DIA_Fergus_HELLO_HI_03_04"); //Wybacz ale obecnej chwili nie mam czasu na zajmowanie si� g�upotami.
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Fergus_HELLO1 (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_HELLO1_Condition;
   information  = DIA_Fergus_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co nowego u Ciebie kowalu?";
};

FUNC INT DIA_Fergus_HELLO1_Condition()
{
if (Kapitel == 2)
{
    return TRUE;
};
};
FUNC VOID DIA_Fergus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_01"); //Co nowego u Ciebie kowalu?
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_02"); //W sumie bez zmian. To samo g�wno co zawsze.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_03"); //Na dodatek ten baran Asghan... Nie chc� mi si� o tym nawet gada�.
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_04"); //Rozumiem.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_05"); //Wiesz co... Mam do ciebie pro�b�. M�j m�odszy kuzyn Eliott ma problemy.
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_06"); //Jak wi�kszo�� tej kolonii. O co chodzi.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_07"); //Czepiaj� si� go pono� Stra�nicy. Dostaje od nich po g�bie co tu du�o gada�. Zw�aszcza od jakiego� Winstona. Eliott przyci�ga problemy...
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_08"); //M�g�by� zapyta� co u niego? Mo�e dali ju� mu spok�j?
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_09"); //Pogadam z Eliottem.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_10"); //Dobra. Masz tu ode mnie piwo za fatyg�.
	CreateInvItems	(self, Itfobeer, 1);
	B_GiveInvItems (self,other, Itfobeer, 1);
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_11"); //Dzi�ki. 
	Log_CreateTopic		(Oprawca,	LOG_MISSION);
	Log_SetTopicStatus	(Oprawca,	LOG_RUNNING);
	B_LogEntry               (Oprawca,"Kowal Fergus opowiedzia� mi o swoim kuzynie o imieniu Eliott. Jest on dr�czony przez Stra�nik�w. Fergus poprosi� mnie bym dowiedzia� si� jak si� teraz trzyma.");
};
//========================================
//-----------------> OPR_END
//========================================

INSTANCE DIA_Fergus_OPR_END (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_OPR_END_Condition;
   information  = DIA_Fergus_OPR_END_Info;
   permanent	= FALSE;
   description	= "Rozw�za�em problem Eliotta.";
};

FUNC INT DIA_Fergus_OPR_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Eliott_Oprawca_End))
{
    return TRUE;
};
};

FUNC VOID DIA_Fergus_OPR_END_Info()
{
    AI_Output (other, self ,"DIA_Fergus_OPR_END_15_01"); //Rozw�za�em problem Eliotta.
    AI_Output (self, other ,"DIA_Fergus_OPR_END_03_02"); //To �wietnie, r�wny z ciebie go��.
    AI_Output (self, other ,"DIA_Fergus_OPR_END_03_03"); //Masz to w nagrod�...
    B_GiveInvItems (self,other, Plan_Miecz1H7, 1);
    AI_Output (other, self ,"DIA_Fergus_OPR_END_15_04"); //Dzi�ki.
	AI_Output (self, other ,"DIA_Fergus_OPR_END_03_05"); //Czyli dali mu ju� spok�j.
	AI_Output (other, self ,"DIA_Fergus_OPR_END_15_06"); //Mia� pecha trafiaj�c na pewnego sukinsyna ale ma ju� go z g�owy.
	AI_Output (self, other ,"DIA_Fergus_OPR_END_03_07"); //Rozumiem.
	
	
	B_LogEntry               (Oprawca,"Fergus zdawa� si� by� zadowoloy, otrzyma�em od niego przepis na solidn� bro�.");
	B_GiveXP(100);
	Log_SetTopicStatus	(Oprawca,	LOG_SUCCESS);
};


//========================================
//-----------------> LearnMe
//========================================

INSTANCE DIA_Fergus_LearnMe (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_LearnMe_Condition;
   information  = DIA_Fergus_LearnMe_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Fergus_LearnMe_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fergus_HELLO_HI))
{
    return TRUE;
};
};
FUNC VOID DIA_Fergus_LearnMe_Info()
{
    AI_Output (other, self ,"DIA_Fergus_LearnMe_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Fergus_LearnMe_03_02"); //Jasne, mog� ci pokaza� jak wyku� solidny miecz.
};


//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Fergus_LearnSmith_01 (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_LearnSmith_01_Condition;
   information  = DIA_Fergus_LearnSmith_01_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.1/3 - 5 PN)";
};

FUNC INT DIA_Fergus_LearnSmith_01_Condition()
{
 if (NPC_TALENT_SMITH == 0) && (Npc_KnowsInfo(hero,DIA_Fergus_LearnMe))
{
    return TRUE;
};
};
FUNC VOID DIA_Fergus_LearnSmith_01_Info()
{

    if  (hero.lp >= 5) 
	{
    AI_Output (other, self ,"DIA_Fergus_LearnSmith_01_15_01"); //Naucz mnie jak wyku� miecz. 
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_02"); //To do�� proste. Znajd� sobie plan oraz kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_04"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_05"); //Reszty dowiesz si� sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Fergus_LearnSmith_01_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};



//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Fergus_LearnSmith_02 (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_LearnSmith_02_Condition;
   information  = DIA_Fergus_LearnSmith_02_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
};

FUNC INT DIA_Fergus_LearnSmith_02_Condition()
{
 if (NPC_TALENT_SMITH == 1) 
{
    return TRUE;
};
};
FUNC VOID DIA_Fergus_LearnSmith_02_Info()
{

    if  (hero.lp >= 10) 
	{
    AI_Output (other, self ,"DIA_Fergus_LearnSmith_02_15_01"); //Naucz mnie jak wyku� dobry miecz. 
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_02"); //Podstawy ju� znasz, teraz czas na co� trudniejszego...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_03"); //Gdy uderzasz w gor�c� stal staraj si� robi� to z wyczuciem i nie b�d� spi�ty.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_04"); //Najwa�niejsze, jest to by� nie uderza� zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_05"); //Poza tym, wszystko zale�y od ciebie i rodzaju broni, jak� chcesz wykona�.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Fergus_LearnSmith_02_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};

//========================================
//-----------------> CONTACTS
//========================================

INSTANCE DIA_Fergus_CONTACTS (C_INFO)
{
   npc          = Grd_40054_Fergus;
   nr           = 1;
   condition    = DIA_Fergus_CONTACTS_Condition;
   information  = DIA_Fergus_CONTACTS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fergus_CONTACTS_Condition()
{
if (kapitel == 2)
{
    return TRUE;
};
};
FUNC VOID DIA_Fergus_CONTACTS_Info()
{
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_01"); //Podobno szybko zawierasz przydatne kontakty.
    AI_Output (other, self ,"DIA_Fergus_CONTACTS_15_02"); //Sk�d o tym wiesz?
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_03"); //Mo�e Kolonia wydaje si� czasem statyczna ale plotki rozchodz� si� tu szybko.
    AI_Output (other, self ,"DIA_Fergus_CONTACTS_15_04"); //To chyba korzystna pog�oska.
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_05"); //Jak najbardziej. Ka�dy chcia�by mie� w swoich szeregach kogo� zdolnego.
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_06"); //P�ki nie zacznie zagra�a� pozycji jego samego rzecz jasna.... 
};

instance dia_fergus_pickpocket(c_info) {
    npc = grd_40054_fergus;
    nr = 900;
    condition = dia_fergus_pickpocket_condition;
    information = dia_fergus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fergus_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_fergus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fergus_pickpocket);
	info_addchoice(dia_fergus_pickpocket, dialog_back, dia_fergus_pickpocket_back);
	info_addchoice(dia_fergus_pickpocket, dialog_pickpocket, dia_fergus_pickpocket_doit);
};

func void dia_fergus_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_fergus_pickpocket);
};

func void dia_fergus_pickpocket_back() {
    info_clearchoices(dia_fergus_pickpocket);
};