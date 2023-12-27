//poprawione i sprawdzone -  

// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam tu zbyt cz�sto go�ci, he he!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widz�, �e niez�y cwaniak z ciebie. Tak znale�� moj� kryj�wk�, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia�em ju� do�� Starego Obozu. Podpad�em paru ludziom Gomeza. To by�o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju� o mnie nie pami�ta, ale ja si� st�d nie ruszam. Jak na m�j gust - w Starym Obozie wci�� jest za du�o t�pych osi�k�w.
};

///////////////////////////////////////////////////////////////////////////////////////////
// __MOD DIALOGS
//	////////  ////////
//  //        //    //
//  //////    //////
//  //        //   //
//  ///////// //    //
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Kobieta
//========================================

INSTANCE DIA_Gilbert_Kobieta (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kobieta_Condition;
   information  = DIA_Gilbert_Kobieta_Info;
   permanent	= FALSE;
   description	= "Co robi kobieta w twojej jaskini?";
};

FUNC INT DIA_Gilbert_Kobieta_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gilbert_Kobieta_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_01"); //Co robi kobieta w twojej jaskini?
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_02"); //Uciek�a ze Starego Obozu. Spotka�em j� w okolicy. B��ka�a si�, szukaj�c schronienia.
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_03"); //Chyba nie jest zbyt rozmowna. 
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_04"); //To tylko pozory. Jest dosy� pyskata, jak si� oswoi. 
};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Gilbert_Halasy (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_Halasy_Condition;
   information  = DIA_Gilbert_Halasy_Info;
   permanent	= FALSE;
   description	= "Byli�cie ostatnio strasznie g�o�no.";
};

FUNC INT DIA_Gilbert_Halasy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_ThiefInCamp))
    && (!Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_01"); //Byli�cie ostatnio strasznie g�o�no.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_02"); //Co? O co ci chodzi? 
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_03"); //O nic. Po prostu widz�, �e dobrze si� trzymasz, staruszku.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_04"); //Nie rozumiem.
	B_giveXP (100);
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Gilbert_BANG (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_BANG_Condition;
   information  = DIA_Gilbert_BANG_Info;
   permanent	= FALSE;
   description	= "Podobno zr�czny z ciebie go��.";
};

FUNC INT DIA_Gilbert_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_BANG_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_01"); //Podobno zr�czny z ciebie go��.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_02"); //Hmm? Szukasz nauczyciela z�odziejskich sztuczek? Nie pomog� ci. Nie znam si� na tym.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_03"); //Nie o to mi chodzi. Jeden z �owc�w ork�w stwierdzi�, �e potrafisz sprawnie porusza� si� po ska�ach.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_04"); //Nie ukrywam, �e to ciekawa umeij�tno��.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_05"); //O to chodzi. Tak, znam si� troch� na tych sprawach. Potrafi� sprawnie balansowa� cia�em.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_06"); //Mog� ci� tego nauczy�, jednak b�dziesz musia� mi co� przynie��.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_07"); //Czego potrzebujesz? 
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_08"); //Marz� o zjedzeniu solidnego kawa�ka szynki. M�g�by� podw�dzi� dla mnie co nieco ze Starego Obozu?
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_09"); //Mog� spr�bowa�. 
};

//========================================
//-----------------> MEAT
//========================================

INSTANCE DIA_Gilbert_MEAT (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_MEAT_Condition;
   information  = DIA_Gilbert_MEAT_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kawa�ek szynki.";
};

FUNC INT DIA_Gilbert_MEAT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_BANG))
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_MEAT_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_MEAT_15_01"); //Mam dla ciebie kawa�ek szynki.
    B_GiveInvItems (other, self, ItFo_mutton_01, 1);
    AI_Output (self, other ,"DIA_Gilbert_MEAT_03_02"); //Dzi�kuj�. Ach... cudowny zapach. Teraz mog� ci� uczy�.
    B_LogEntry		(GE_TeacherOW,"Gilbert mo�e mnie uczy� akrobatyki, poniewa� przynios�em mu kawa�ek szynki, o kt�ry mnie prosi�.");
	B_GiveXP (50);
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Gilbert_TEACH (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 3;
   condition    = DIA_Gilbert_TEACH_Condition;
   information  = DIA_Gilbert_TEACH_Info;
   permanent	= 1;
   description	= B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0);
};

FUNC INT DIA_Gilbert_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_MEAT))
    && (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_TEACH_Info()
{
	if  (B_teachthieftalent(self,other,NPC_TALENT_ACROBAT))
	{
    AI_Output (other, self ,"DIA_Gilbert_TEACH_15_01"); //Naucz mnie akrobatyki. 
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_02"); //Je�li b�dziesz odpowiednio balansowa� cia�em, unikniesz upadku podczas wspinaczki.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_03"); //Pami�taj, �eby dok�adnie obserwowa� drog� po kt�rej chcesz si� wspina�. Zwracaj uwag� na s�absze fragmenty ska�, kt�re mog� odpa��.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_04"); //Nie ka�dy fragment skalny jest w stanie wytrzyma� tw�j ci�ar. 
	};		
};

/////////////////////////////////////////////////////////////
// NIEAKTYWNE DIALOGI
// BY�Y PO PROSTU Z�E
/////////////////////////////////////////////////////////////

//========================================
//-----------------> GoToTondral
//========================================

INSTANCE DIA_Gilbert_GoToTondral (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_GoToTondral_Condition;
   information  = DIA_Gilbert_GoToTondral_Info;
   permanent	= FALSE;
   description	= "Mo�e chcesz p�j�� ze mn� do Bractwa?";
};

FUNC INT DIA_Gilbert_GoToTondral_Condition()
{
    if (BaalTondral_GetNewGuy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Gilbert_Hallo))

    {
    return FALSE;
    };
};


FUNC VOID DIA_Gilbert_GoToTondral_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_01"); //W Bractwie poszukuj� nowych wyznawc�w. Mo�e chcesz p�j�� tam ze mn�?
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_02"); //Czemu nie? Chyba czas ju� co� zmieni� w swoim �yciu. Od lat twki� w tej jaskini. 
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_03"); //Rozumiem, �e mnie tam zaprowadzisz?
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_04"); //Jasne. Dam ci znak, gdy b�d� gotowy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gilbert_HELLO2 (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_HELLO2_Condition;
   information  = DIA_Gilbert_HELLO2_Info;
   permanent	= FALSE;
   description	= "Ruszajmy.";
};

FUNC INT DIA_Gilbert_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_GoToTondral))
    && (BaalTondral_GetNewGuy == LOG_RUNNING)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Gilbert_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_HELLO2_15_01"); //Ruszajmy.
    AI_Output (self, other ,"DIA_Gilbert_HELLO2_03_02"); //Dobrze. Tylko uwa�aj na ska�y.
    	self.flags = NPC_FLAG_IMMORTAL;
self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH1_RecruitDusty,"Postanowi�em, �e zaprowadz� Gilberta do Bractwa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Ku�nia Stone'a 
//========================================

INSTANCE DIA_Gilbert_Kuznia (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kuznia_Condition;
   information  = DIA_Gilbert_Kuznia_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Gilbert_Kuznia_Condition()
{
    if  (Kapitel == 3) 
	&& (!Jacko_KS_Dead == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Kuznia_Info()
{
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_01");  //Hej ch�opcz� mia�bym do ciebie spraw�.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_02");  //Jak�?
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_03");  //Jak wiesz by�em wcze�niej w Starym obozie. I dowiedzia�em si� paru wa�nych rzeczy.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_04");  //Chocia�by tego, �e w ku�ni kowala Stone�a znajduje si� co najmniej par� warto�ciowych rzeczy.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_05");  //Na przyk�ad pewien cenny medalion, wart wiele rudy.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_06");  //Mia�bym si� tam w�ama�?
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_07");  //To nie takie proste. Gdy by�em jeszcze w obozie niejaki Buster ukrad� klucz do ku�ni.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_08");  //Ale nie wydaje mi si� by z niego skorzysta�. Najpewniej wci�� go ma.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_09");  //Mam z nim o tym pom�wi�?
	AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_10");  //Dok�adnie. Spr�buj wyci�gn�� od niego ten klucz i przy sprzyjaj�cej okazji dosta� si� do ku�ni.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_11");  //Mog� si� tym zaj��.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_12");  //Na pewno ten cwaniak b�dzie czego� od ciebie chcia� ale co� mi m�wi, �e dasz sobie z tym rad�.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_13");  //Mam nadziej�.
	
	
  
	Log_CreateTopic   	(KuzniaStone,LOG_MISSION);
	Log_SetTopicStatus  (KuzniaStone,LOG_RUNNING);
	
	  B_LogEntry                     (KuzniaStone,"Gilbert chcia�by zdoby� rzeczy ukryte w ku�ni Kowala Stone�a a zw�aszcza pewien medalion. Problem polega na tym, �e klucz do ku�ni ukrad� Buster. Powinienem z nim o tym pom�wi�.");
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Medalion (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Medalion_Condition;
   information  = DIA_Gilbert_Medalion_Info;
   permanent	= FALSE;
   description  = "Mam tw�j medalion.";
};

FUNC INT DIA_Gilbert_Medalion_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buster_Plants))
	&& (Npc_HasItems (other, Amulett_Stone) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Medalion_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_01");  //Mam tw�j medalion.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_02");  //�wietnie m�ody. Wiedzia�em, �e podo�asz.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_03");  //Daj mi go.
	B_GiveInvItems (other, self, Amulett_Stone, 1);
	Npc_RemoveInvItems (self, Amulett_Stone, 1);
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_04");   //Prosz�.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_05");   //Dzi�ki a ty we� t� rud�.
	B_GiveInvItems (self,other, itminugget, 60);
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_06");  //My�l�, �e z korzy�ci� dla nas dw�ch dobili�my targu.
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_07");  //Nie zaprzecz�.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_08");  //Jak dalej b�dziesz si� tak rozwija� to zajdziesz daleko w tej Kolonii.
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_09");  //By� mo�e. Na razie.
	AI_Output (self, other ,"DIA_Gilbert_Medalion_03_10");  //Do zobaczenia.
 
	B_GiveXP (110);
    B_LogEntry                     (KuzniaStone,"Przekaza�em medalion Gilbertowi. By� ze mnie zadowolony i wyp�aci� mi nagrod�.");
	Log_SetTopicStatus  (KuzniaStone,LOG_SUCCESS);
	AI_StopProcessInfos	( self );
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Zaczepka (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Zaczepka_Condition;
   information  = DIA_Gilbert_Zaczepka_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Gilbert_Zaczepka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_Klucz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Zaczepka_Info()
{
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_01");  //Masz m�j medalion?
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_02");  //Niestety nie.
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_03");  //Nie uda�o ci si� dosta� do ku�ni Stone�a?
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_04");  //Nie. Gdyby by�o inaczej dosta�by� sw�j medalion.
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_05");  //Rozumiem. Zatem m�wi si� trudno ch�opcz�.
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_06");  //No c�...
   
    AI_StopProcessInfos	( self );
   
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Gaston (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Gaston_Condition;
   information  = DIA_Gilbert_Gaston_Info;
   permanent	= FALSE;
   description  = "Poszukuje niejakiego Gastona. Pono� to tw�j kuzyn.";
};

FUNC INT DIA_Gilbert_Gaston_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalTondral_Zdrajca))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Gaston_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_01");  //Poszukuje niejakiego Gastona. Pono� to tw�j kuzyn.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_02");  //Garsona?? S�abo s�ysz�...
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_03");  //Dobrze wiesz o kogo chodzi.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_04");  //Nie wiem o czym m�wisz.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_05");  //O twoim kuzynie Gastonie, kt�ry do niedawna by� obiecuj�cym Nowicjuszem w bractwie.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_06");  //Dalej nic nie rozumiem.
	AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_Output (other, self ,"DIA_Gilbert_Gaston_15_07");  //Mo�e teraz zrozumiesz?

    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_08");  //Eeee... Dobrze ju�. Schowaj t� bro�.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_09");  //To zacznij w ko�cu m�wi�.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_10");  //No wi�c jaki� czas temu by� u mnie Gaston. Wygl�da� na zm�czonego i przestraszonego. M�wi�, �e uciek� z bractwa i dowiedzia� si� czego� wa�nego.
 	
	Info_ClearChoices	(DIA_Gilbert_Gaston);
	Info_AddChoice		(DIA_Gilbert_Gaston, "Co to znaczy?", DIA_Gilbert_Gaston_Add_Choice);
	
};

FUNC VOID DIA_Gilbert_Gaston_Add_Choice()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_01"); //Co to znaczy?
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_02"); //Nie powiem ci p�ki mi nie pomo�esz.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_03"); //Ehh... W czym?
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_04"); //Ja tak�e mam problem z przesz�o�ci�. Jaki� czas temu przez przypadek widzia� mnie stra�nik Pacho. Potem doni�s� o wszystkim Bloodwynowi.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_05"); //Ten przypomnia� sobie o moich d�ugach w op�atach za ochron� i postanowi� schwyta�.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_06"); //Jednocze�nie Guy, kt�ry jako jedyny zna� miejsce mojego ukrycia, odwiedzi� mnie.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_07"); //Za��da� rudy w zamian za milczenie przed Bloodywnem. Akurat mia�em jeszcze troch� rudy i zap�aci�em mu.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_08");  //Ale kolejnym razem ju� nie i zagrozi�, �e wszystko powie stra�nikom. Boje si�, �e przyjd� i ukatrupi� mnie a tak�e skrzywdz� Angelin�.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_09"); //Nie stanie si� tak. Porozmawiam z Guyem.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_10"); //Powodzenia.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_11"); //Do zobaczenia.
    B_LogEntry               (PSI_Zdrajca,"Gilbert po usilnych namowach powie mi co� istotnego na temat Gastona. Jednak wpierw musz� rozwi�za� jego problem. Kopacz Guy szanta�uje go wydaniem mjejsca jego kryj�wki, musz� go jako� przekona� �eby zostawi� Gilberta w spokoju.");
    AI_StopProcessInfos	( self );

};

//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Guy_Spokoj (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Guy_Spokoj_Condition;
   information  = DIA_Gilbert_Guy_Spokoj_Info;
   permanent	= FALSE;
   description    = "Guy da ci spok�j.";
};

FUNC INT DIA_Gilbert_Guy_Spokoj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Nugget_FGilbert))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Guy_Spokoj_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_01");  //Guy da ci spok�j.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_02");  //Wspaniale. Wreszcie ja i Angela b�dziemy bezpieczni.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_03");  //Teraz opowiedz mi o tym jak Gaston do ciebie wr�ci�.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_04");  //To ju� nie by� Gaston Nowicjusz z bagna.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_05");  //A kto?
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_06");  //To by� my�liwy Arnold. Takie imi� przyj�� odk�d do nich przysta�.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_07");  //Wspaniale. Teraz ju� wiem gdzie go szuka�.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_08");  //Tylko nie r�b mu krzywdy!
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_09");  //Tego nie mog� obieca�. 
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_10");  //Do zobaczenia.
	CreateInvItems (NON_40034_Arnold, ItMi_Tondrall_Slab,5);
    AI_StopProcessInfos	( self );
    B_LogEntry                     (PSI_Zdrajca,"Okazjue si�, �e jaki� czas temu Gaston przysta� do my�liwych i przyj� imie Arnold. Wygl�da na to, �e uda�o mi si� go zlokalizowa�. Musz� go teraz jako� wywabi� z obozu my�liwych.");
};

instance dia_gilbert_pickpocket(c_info) {
    npc = non_1500_gilbert;
    nr = 900;
    condition = dia_gilbert_pickpocket_condition;
    information = dia_gilbert_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gilbert_pickpocket_condition() {
	e_beklauen(baseThfChanceNON, 25);
};

func void dia_gilbert_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gilbert_pickpocket);
	info_addchoice(dia_gilbert_pickpocket, dialog_back, dia_gilbert_pickpocket_back);
	info_addchoice(dia_gilbert_pickpocket, dialog_pickpocket, dia_gilbert_pickpocket_doit);
};

func void dia_gilbert_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gilbert_pickpocket);
};

func void dia_gilbert_pickpocket_back() {
    info_clearchoices(dia_gilbert_pickpocket);
};
