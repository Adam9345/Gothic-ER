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
   description	= "Dobrze znasz siê na tej robocie?";
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
    AI_Output (other, self ,"DIA_Fergus_HI_15_01"); //Dobrze znasz siê na tej robocie?
    AI_Output (self, other ,"DIA_Fergus_HI_03_02"); //Staram siê. Nie pracuje w tej robocie od wczoraj ch³opcze.
    AI_Output (self, other ,"DIA_Fergus_HI_03_03"); //Mo¿e nie jestem samorodnym talentem ale ciê¿k¹ prac¹ naby³em swoje umiejêtnoœci.
    AI_Output (self, other ,"DIA_Fergus_HI_03_04"); //Niegdyœ jeszcze na kontynencie by³em czeladnikiem u kowala. Dobrze mi sz³o w pewnym momencie nawet chcia³em otworzyæ w³asny warsztat.
    AI_Output (other, self ,"DIA_Fergus_HI_15_05"); //Domyœlam siê , ¿e wszystko siê posypa³o.
    AI_Output (self, other ,"DIA_Fergus_HI_03_06"); // Pod miastem pozna³em pewn¹ farmerkê o imieniu Polly. I zakocha³em siê na zabój.
    AI_Output (self, other ,"DIA_Fergus_HI_03_07"); //Chcia³em siê z ni¹ o¿eniæ , mieæ dom I dzieci. Ale wtedy pojawi³ siê ten pata³ach.
    AI_Output (other, self ,"DIA_Fergus_HI_15_08"); //Jaki pata³ach?
    AI_Output (self, other ,"DIA_Fergus_HI_03_09"); //Pewien strojniœ z odleg³ych stron. Widzia³em, ¿e jeszcze trochê I mu siê uda. 
    AI_Output (self, other ,"DIA_Fergus_HI_03_10"); //Uci¹³em sobie z nim wiêc ,,mêsk¹ rozmowê”. Powiedzia³em co myœlê I wygarn¹³em w ryj.  A ten p³aczek upadaj¹c uderzy³ ty³em g³owy o jak¹œ wystaj¹c¹ ska³ê.
    AI_Output (self, other ,"DIA_Fergus_HI_03_11"); // I by³o po nim. Zaraz by³o zbiegowisko , s¹d I wyrok. Zsy³ka do Kolonii karnej. I oto tu jestem ju¿ parê lat.
    AI_Output (self, other ,"DIA_Fergus_HI_03_12"); //Ka¿dy z nas za coœ tu trafi³. Ka¿dy ma swoje brzemiê ch³opcze.
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Fergus_HELLO_HI_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fergus_HELLO_HI_Info()
{
    AI_Output (other, self ,"DIA_Fergus_HELLO_HI_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Fergus_HELLO_HI_03_02"); //Nazywam siê Fergus i jestem kowalem, jak widzisz...
    AI_Output (other, self ,"DIA_Fergus_HELLO_HI_15_03"); //Mogê coœ u ciebie dostaæ?
    AI_Output (self, other ,"DIA_Fergus_HELLO_HI_03_04"); //Wybacz ale obecnej chwili nie mam czasu na zajmowanie siê g³upotami.
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
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_02"); //W sumie bez zmian. To samo gówno co zawsze.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_03"); //Na dodatek ten baran Asghan... Nie chcê mi siê o tym nawet gadaæ.
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_04"); //Rozumiem.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_05"); //Wiesz co... Mam do ciebie proœbê. Mój m³odszy kuzyn Eliott ma problemy.
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_06"); //Jak wiêkszoœæ tej kolonii. O co chodzi.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_07"); //Czepiaj¹ siê go ponoæ Stra¿nicy. Dostaje od nich po gêbie co tu du¿o gadaæ. Zw³aszcza od jakiegoœ Winstona. Eliott przyci¹ga problemy...
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_08"); //Móg³byœ zapytaæ co u niego? Mo¿e dali ju¿ mu spokój?
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_09"); //Pogadam z Eliottem.
    AI_Output (self, other ,"DIA_Fergus_HELLO1_03_10"); //Dobra. Masz tu ode mnie piwo za fatygê.
	CreateInvItems	(self, Itfobeer, 1);
	B_GiveInvItems (self,other, Itfobeer, 1);
    AI_Output (other, self ,"DIA_Fergus_HELLO1_15_11"); //Dziêki. 
	Log_CreateTopic		(Oprawca,	LOG_MISSION);
	Log_SetTopicStatus	(Oprawca,	LOG_RUNNING);
	B_LogEntry               (Oprawca,"Kowal Fergus opowiedzia³ mi o swoim kuzynie o imieniu Eliott. Jest on drêczony przez Stra¿ników. Fergus poprosi³ mnie bym dowiedzia³ siê jak siê teraz trzyma.");
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
   description	= "Rozw¹za³em problem Eliotta.";
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
    AI_Output (other, self ,"DIA_Fergus_OPR_END_15_01"); //Rozw¹za³em problem Eliotta.
    AI_Output (self, other ,"DIA_Fergus_OPR_END_03_02"); //To œwietnie, równy z ciebie goœæ.
    AI_Output (self, other ,"DIA_Fergus_OPR_END_03_03"); //Masz to w nagrodê...
    B_GiveInvItems (self,other, Plan_Miecz1H7, 1);
    AI_Output (other, self ,"DIA_Fergus_OPR_END_15_04"); //Dziêki.
	AI_Output (self, other ,"DIA_Fergus_OPR_END_03_05"); //Czyli dali mu ju¿ spokój.
	AI_Output (other, self ,"DIA_Fergus_OPR_END_15_06"); //Mia³ pecha trafiaj¹c na pewnego sukinsyna ale ma ju¿ go z g³owy.
	AI_Output (self, other ,"DIA_Fergus_OPR_END_03_07"); //Rozumiem.
	
	
	B_LogEntry               (Oprawca,"Fergus zdawa³ siê byæ zadowoloy, otrzyma³em od niego przepis na solidn¹ broñ.");
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
    AI_Output (other, self ,"DIA_Fergus_LearnMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Fergus_LearnMe_03_02"); //Jasne, mogê ci pokazaæ jak wykuæ solidny miecz.
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
   description	= "Naucz mnie jak wykuæ miecz. (Kowalstwo poz.1/3 - 5 PN)";
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
    AI_Output (other, self ,"DIA_Fergus_LearnSmith_01_15_01"); //Naucz mnie jak wykuæ miecz. 
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_02"); //To doœæ proste. ZnajdŸ sobie plan oraz kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_04"); //Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_01_03_05"); //Reszty dowiesz siê sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Fergus_LearnSmith_01_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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
   description	= "Naucz mnie jak wykuæ dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
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
    AI_Output (other, self ,"DIA_Fergus_LearnSmith_02_15_01"); //Naucz mnie jak wykuæ dobry miecz. 
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_02"); //Podstawy ju¿ znasz, teraz czas na coœ trudniejszego...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_03"); //Gdy uderzasz w gor¹c¹ stal staraj siê robiæ to z wyczuciem i nie b¹dŸ spiêty.
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_04"); //Najwa¿niejsze, jest to byœ nie uderza³ zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Fergus_LearnSmith_02_03_05"); //Poza tym, wszystko zale¿y od ciebie i rodzaju broni, jak¹ chcesz wykonaæ.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Fergus_LearnSmith_02_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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
    AI_Output (other, self ,"DIA_Fergus_CONTACTS_15_02"); //Sk¹d o tym wiesz?
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_03"); //Mo¿e Kolonia wydaje siê czasem statyczna ale plotki rozchodz¹ siê tu szybko.
    AI_Output (other, self ,"DIA_Fergus_CONTACTS_15_04"); //To chyba korzystna pog³oska.
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_05"); //Jak najbardziej. Ka¿dy chcia³by mieæ w swoich szeregach kogoœ zdolnego.
    AI_Output (self, other ,"DIA_Fergus_CONTACTS_03_06"); //Póki nie zacznie zagra¿aæ pozycji jego samego rzecz jasna.... 
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