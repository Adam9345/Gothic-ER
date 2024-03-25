// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in�ynierem, jakiego ta przekl�ta Kolonia kiedykolwiek widzia�a, ch�opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnuj�, �eby nasi ch�opcy nie �ci�gn�li sobie na g�owy sterty kamieni kopi�c w niew�a�ciwym miejscu.
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 1;
	description = "Chcia�bym do was do��czy�, jako Kret.";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (kopaczNotBlockOtherGuilds) {
		if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) && ((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_VLK))
		{
			return 1;
		};
	} else {
		if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) && ((Npc_GetTrueGuild(other) == GIL_NONE))
		{
			return 1;
		};
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia�bym do was do��czy�, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy�by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry�u na dzie�. Reszt� musisz sobie sam za�atwi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca�� t� brudn� robot�? �eby pewnego dnia m�c wyj�� na wolno�� z tego przekl�tego wi�zienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca�y nasz urobek jest sk�adowany na wielkim kopcu. Raz w miesi�cu ka�dy z nas dostaje 50 bry�ek, �eby m�c si� porz�dnie upi�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa�niejsze rzeczy, kt�re powiniene� wiedzie�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia� jakie� do�wiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nie."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Tak."  ,Info_Swiney_Schuerfer_Ja);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Na razie nie chc� by� Kretem."  ,Info_Swiney_Schuerfer_Back);
};

func void Info_Swiney_Schuerfer_Back ()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Back_15_00"); //Na razie nie chc� by� Kretem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Back_09_01"); //Wr��, gdy si� namy�lisz.
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 1;
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To �wietnie! Zatem wiesz, na co nale�y uwa�a�. Masz tu sw�j str�j roboczy. Kilof musisz znale�� sobie sam. Mi�ej zabawy.
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItem		(hero,SFB_ARMOR_L);
	AI_EquipBestArmor	(other); 
	hero.guild = GIL_SfB;
	Npc_SetTrueGuild (hero,GIL_SfB);
	HeroJoinToNC ();
	MIS_AwansJakoKret = LOG_RUNNING;
 	Log_CreateTopic          (CH1_AwansJakoKret, LOG_MISSION);
   	Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_RUNNING);
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi si� podoba! Zosta�em Kretem bez �adnych g�upich zada�. Jednak by zosta� Szkodnikiem, b�d� musia� zrobi� co� ambitniejszego ni� kopanie rudy.");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja musz� was u�wiadamia�. S�uchaj uwa�nie: we� te ciuchy i za�� je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa�ek rudy spad� ci na bos� stop�, zosta�by� kalek� do ko�ca �ycia. Oczywi�cie wtedy by�by� dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzie� w pobli�u powinien le�e� jaki� kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywi�cie wiele z nim nie zdzia�asz... M�wi si� trudno...
	hero.guild = GIL_SfB;
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	CreateInvItem		(hero,SFB_ARMOR_L);
	AI_EquipBestArmor	(other); 
	Npc_SetTrueGuild (hero,GIL_SfB);
	HeroJoinToNC ();
	MIS_AwansJakoKret = LOG_RUNNING;
 	Log_CreateTopic          (CH1_AwansJakoKret, LOG_MISSION);
   	Log_SetTopicStatus       (CH1_AwansJakoKret, LOG_RUNNING);
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi si� podoba! Zosta�em Kretem bez �adnych g�upich zada�. Jednak by zosta� Szkodnikiem, b�d� musia� zrobi� co� ambitniejszego ni� kopanie rudy. ");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Jak du�o rudy uda�o si� wam uzbiera� do tej pory?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du�o rudy uda�o si� wam uzbiera� do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie m�wi�, �e mamy ju� niemal ca�� potrzebn� ilo��. Kiedy b�dziesz w Nowym Obozie rzu� okiem na kopiec.
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							TRADE
// ************************************************************

INSTANCE Info_Swiney_TRADE(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_TRADE_Condition;
	information	= Info_Swiney_TRADE_Info;
	permanent	= 0;
	description = "Gdzie mog� tu co� kupi�?";
};                       

FUNC INT Info_Swiney_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_TRADE_Info()
{	
	AI_Output (other, self,"Info_Swiney_TRADE_15_00"); //Gdzie mog� tu co� kupi�?
	AI_Output (self, other,"Info_Swiney_TRADE_09_01"); //Pogadaj z Okylem. On zarz�dza nie tylko prac�, ale tak�e dostawami.
};
//----------------------------------------
//         MINING
//----------------------------------------
instance  SfB_1037_Swiney_START_LEARN (C_INFO)
{
	npc				= SfB_1037_Swiney;
	condition		= SfB_1037_Swiney_START_LEARN_Condition;
	information		= SfB_1037_Swiney_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie g�rnictwa. (100 bry�ek rudy)"; 
};

FUNC int  SfB_1037_Swiney_START_LEARN_Condition()
{	
		if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
		&& (Npc_HasItems (other, ItMiNugget) >=100)
		&& (HERO_HACKCHANCE <= 90)
		{
		return 1;
		};
};

FUNC void  SfB_1037_Swiney_START_LEARN_Info()
{
    AI_Output (other, self, "SfB_1037_Swiney_START_LEARN_15_00"); //Naucz mnie g�rnictwa!
	
	if (Npc_HasItems (other, ItMiNugget) >=100)
	{
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_01"); //No dobra. Trzeba uderza� spokojnie i jednostajnie. Nie spiesz si� � ale uwa�aj, �eby nie zasn�� przy pracy.
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_02"); //Nie wal ci�gle w jedno miejsce � spr�buj wyci�� �adny samorodek.
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_03"); //Post�puj zgodnie z moimi wskaz�wkami, a zostaniesz prawdziwym mistrzem w�r�d kopaczy.
			B_GiveInvItems (other,self, itminugget, 100);
		//HERO_HACKCHANCE = HERO_HACKCHANCE + 10;
		b_upgrade_hero_hackchance(10);
		//Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_04"); //Najpierw chc� zobaczy� moj� cz��.
	};
};


// ************************************************************
// 							CAVALORN_TEST
// ************************************************************

INSTANCE Info_Swiney_CAVALORN_TEST(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_CAVALORN_TEST_Condition;
	information	= Info_Swiney_CAVALORN_TEST_Info;
	permanent	= 0;
	description = "Co mo�esz mi powiedzie� o transporcie rudy?";
};                       

FUNC INT Info_Swiney_CAVALORN_TEST_Condition()
{
	if (wiecejOre == true) && (Npc_KnowsInfo (hero, DIA_Aidan_BROWAE))
    && (MIS_TestOc == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_CAVALORN_TEST_Info()
{	
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_15_00"); //Co mo�esz mi powiedzie� o transporcie rudy?
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_01"); //Nie rozumiem, czemu mia�oby ci� to interesowa�.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_02"); //Przecie� nie nale�ysz do Nowego Obozu.
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
	Info_AddChoice   (Info_Swiney_CAVALORN_TEST, "Chc� do��czy� do Nowego Obozu, wi�c potrzebuj� dowiedzie� si� jak najwi�cej."	,Info_Swiney_CAVALORN_TEST_TRUE);
	Info_AddChoice	 (Info_Swiney_CAVALORN_TEST, "Jestem po prostu ciekawy." ,Info_Swiney_CAVALORN_TEST_FALSE);
};

func void Info_Swiney_CAVALORN_TEST_TRUE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_00"); //Chc� do��czy� do Nowego Obozu, wi�c potrzebuj� dowiedzie� si� jak najwi�cej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_01"); //Ach tak... Lares sobie upatrzy� jakiego� ��todzioba?
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_02"); //Tak, pracuj� dla Laresa.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_03"); //W takim razie dobrze, powiem ci jak to wygl�da.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_04"); //O czym ty... Ach tak, transport.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_05"); //Ostatnio uda�o nam si� wydoby� 30 skrzy� rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_06"); //Jest to rekord w historii Wolnej Kopalni, wcze�niej wydobyli�my mniej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_07"); //Wygl�da na to, �e wielu Kret�w wzi�o sobie do serca zapewnienia mag�w o odzyskaniu wolno�ci.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_08"); //A wracaj�c do tematu: nied�ugo organizujemy transport rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_09"); //Dopiero zacz��em opracowywa� plan, wi�c za wiele ci nie powiem.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_10"); //My�l�, �e najlepsz� por� b�dzie noc. Przynajmniej zmniejszy to ryzyko, �e zostaniemy okradzeni.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_11"); //Dzi�ki za informacje.
	knowsOre2 = true;
	B_LogEntry                     (CH1_TestOC,"Od Swineya dowiedzia�em si�, �e Krety w Wolnej Kopalni wydoby�y 30 skrzy� rudy. Swiney dopiero obmy�la plan transportu, ale jest pewien, �e odb�dzie si� on w nocy.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

func void Info_Swiney_CAVALORN_TEST_FALSE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_00"); //Jestem po prostu ciekawy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_01"); //Ciekawy? Nie roz�mieszaj mnie, ch�opcze.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_02"); //Pewnie Gomezowi zachcia�o si� nas szpiegowa�.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_03"); //Nic ci nie powiem, a je�li spr�bujesz co� kombinowa�, to Okyl zrobi z tob� porz�dek.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_04"); //Ale...
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_05"); //Spadaj st�d!
	knowsOre2 = false;
	B_LogEntry                     (CH1_TestOC,"Nawali�em... Swiney nic mi nie powie o transporcie rudy. Co nie znaczy, �e obla�em test. Warto wr�ci� do Cavalorna i sprawdzi� jak mnie oceni.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};



//------------------------------------------------------------------------------------1.6.1-------------------------------------------------------------------

//========================================
//-----------------> Cie� w boku
//========================================

INSTANCE DIA_SWINEY_CIEN (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_CIEN_Condition;
   information  = DIA_SWINEY_CIEN_Info;
   permanent	= FALSE;
   description	= "M�wi ci co� ksywka Grabarz?";
};

FUNC INT DIA_SWINEY_CIEN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_Cien))
    && (MIS_CIENOKYL == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SWINEY_CIEN_Info()
{
    AI_Output (other, self ,"DIA_SWINEY_CIEN_15_01"); //M�wi ci co� ksywka Grabarz?
    AI_Output (self, other ,"DIA_SWINEY_CIEN_03_02"); //Wiem tylko tyle, �e to Szkodnik, kt�ry si� tu kr�ci... A teraz daj mi spok�j ch�opcze bo mam przed sob� du�o pracy!
    AI_Output (other, self ,"DIA_SWINEY_CIEN_15_03"); //Zrobi�e� si� nerwowy. A pytanie czemu chronisz Grabarza raczej nie ostudzi twojego zapa�u...
    AI_Output (self, other ,"DIA_SWINEY_CIEN_15_04"); //Powiedzia�em daj mi spok�j. Id� w swoj� stron�.
    AI_Output (other, self ,"DIA_SWINEY_CIEN_03_05"); //Jak chcesz. Ale ja i tak dowiem si� wszystkiego, Okyl obieca� mi niez�� nagrod�.
    Info_ClearChoices (DIA_SWINEY_CIEN);
	Info_AddChoice (DIA_SWINEY_CIEN,"Kt�ry� z Kret�w na pewno wszystko mi opowie. Co raczej...",DIA_SWINEY_GRABCIO);
};


FUNC VOID DIA_SWINEY_GRABCIO()
  {
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_00");  //Kt�ry� z Kret�w na pewno wszystko mi opowie. Co raczej nie wp�ynie dobrze na twoj� sytuacje.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_01");  //Dobrze ju�. Opowiem ci wszystko je�li mi pomo�esz.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_02");  //Z czym?
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_03");  //Z Grabarzem.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_04");  //Przecie� to ty jeste� jego obro�c�.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_05");  //Gdyby sytuacja by�a normalna, pierwszy ��da�bym jego wyrzucenia z Kot�a.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_06");  //Ale niestety... Jest pewna przykra sprawa.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_07");  //Zatem opowiedz mi o tym.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_08");  //Par� lat temu gdy kontakty Nowego Obozu ze Starym by�y nieco lepsze, zawar�em pewn� umow� handlow� ze Star� Kopalni�.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_09");  //Obecnie taki dokument m�g�by mi powa�nie zaszkodzi�. Na pewno straci�bym posad� g��wnego in�yniera.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_10");  //Zaraz przecie� ta umowa zosta�a zawarta par� lat temu...
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_11");  //Tylko w teorii, niedawno kto� w�ama� si� do mojego domu. Nast�pnego dnia przyszed� Grabarz z moim dokumentem.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_12");  //Sfa�szowa� dat� zawarcia umowy. Wychodzi, �e podpisa�em j� zaledwie par� tygodni temu. 
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_13");  //Na dodatek dopisa�, �e dostarcza�em r�wnie� w tajemnicy bro� ludziom Gomeza.
	
    B_LogEntry  (Cienwboku,"Swiney chroni Grabarza gdy� ma na niego kompromituj�ce pismo. Chcia�by �ebym wyci�gn�� je od tego szkodnika, problem polega na tym, �e sam Grabarz nie ma go przy sobie. Musze si� dowiedzie� gdzie s� te dokumenty. Popytam ludzi w kotle.");
	

};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_SWINEY_CIENWMR (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_CIENWMR_Condition;
   information  = DIA_SWINEY_CIENWMR_Info;
   permanent	= FALSE;
   description	= "Gdyby tak odebra� ten papier temu Szkodnikowi...";
};

FUNC INT DIA_SWINEY_CIENWMR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SWINEY_CIEN))
    && (MIS_CIENOKYL == LOG_RUNNING)

    {
    return TRUE;
    };
};


FUNC VOID DIA_SWINEY_CIENWMR_Info()
{
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_15_01"); //Gdyby tak odebra� ten papier temu Szkodnikowi, sprawa sama by si� rozwi�za�a.
    AI_Output (self, other ,"DIA_SWINEY_CIENWMR_03_02"); //Kiedy� Grabarz upi� si� do nieprzytomno�ci. Przeszuka�em go wtedy i nic nie znalaz�em. On nie nosi tego dokumentu przy sobie.
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_15_03"); //M�g�bym poszuka� jaki� poszlak.
    AI_Output (self, other ,"DIA_SWINEY_CIENWMR_15_04"); //Popytaj ludzi w Kotle. Oczywi�cie poza Grabarzem i Okylem.
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_03_05"); //W porz�dku.
  
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_SWINEY_PAPIER (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_PAPIER_Condition;
   information  = DIA_SWINEY_PAPIER_Info;
   permanent	= FALSE;
   description	= "Mam twoje dokumenty.";
};

FUNC INT DIA_SWINEY_PAPIER_Condition()
{
    if (Npc_HasItems(other,ItMi_DokumentSwineya) >= 1) 
	&& (Npc_KnowsInfo(hero,DIA_KLIN_PAPIER))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_SWINEY_PAPIER_Info()
{
    AI_Output (other, self ,"DIA_SWINEY_PAPIER_15_01"); //Mam twoje dokumenty.
    AI_Output (self, other ,"DIA_SWINEY_PAPIER_03_02"); //Masz moje uznanie! Daj mi to pismo.
    AI_Output (other, self ,"DIA_SWINEY_PAPIER_15_03"); //A co z nagrod�.
    AI_Output (self, other ,"DIA_SWINEY_PAPIER_15_04"); //Ju� prawie jest twoja.
    AI_Output (other, self ,"DIA_SWINEY_PAPIER_03_05"); //Jak to prawie?
    AI_Output (self, other ,"DIA_SWINEY_PAPIER_15_06"); //Id� i skop ty�ek Grabarzowi. Ma si� st�d wynie�� raz na zawsze, teraz nie ma ju� na mnie �adnego haczyka.
		B_GiveInvItems (other,self, ItMi_DokumentSwineya, 1);
	 B_LogEntry               (Cienwboku,"Dostarczy�em dokument Swiney�owi. Teraz Grabarz nie ma �adnej os�ony. Musze go pobi� i zmusi� do odej�cia z Kot�a.");
	
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_SWINEY_ZDECH (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_ZDECH_Condition;
   information  = DIA_SWINEY_ZDECH_Info;
   permanent	= FALSE;
   description	= "Zabi�em Grabarza.";
};

FUNC INT DIA_SWINEY_ZDECH_Condition()
{
    if (Npc_IsDead(ORG_40045_Grabarz)) 
   && (Npc_KnowsInfo (hero, Info_Grabarz_Hello))
   && (MIS_Grabcio == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_SWINEY_ZDECH_Info()
{
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_15_01"); //Zabi�em Grabarza.
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_03_02"); //Co takiego?! Dopu�ci�e� si� morderstwa w obozie w kotle! Mia�e� go tylko postraszy�.
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_15_03"); //C� ostrze mi si� odrobin� omskn�o�.
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_04"); //W takim razie nic nie p�ac�!
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_03_05"); //Jak to? Przecie� rozwi�za�em tw�j problem z Grabarzem.
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_06"); //Ale nie w taki spos�b jaki oczekiwa�em.
	AI_Output (other, self ,"DIA_SWINEY_ZDECH_03_07"); //Co� mi si� nale�y.
	AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_08"); //Nie. To moje ostateczne s�owo.
	AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_09");  //Odejd� ode mnie morderco!
	B_LogEntry               (Cienwboku,"Swiney nie chc� mi wyp�aci� nagrody bo dosz�o do niepotrzebnego rozlewu krwi. Ca�e moja starania na darmo. Obawiam si�, �e to jeszcze nie koniec.");
	GrabarzIsDead1 = TRUE;
	 AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_SWINEY_ZYJE (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_ZYJE_Condition;
   information  = DIA_SWINEY_ZYJE_Info;
   permanent	= FALSE;
   description	= "Grabarz opu�ci� Kocio�.";
};

FUNC INT DIA_SWINEY_ZYJE_Condition()
{
    if(GrabarzIsDead == FALSE)
	&& (GrabarzWygnany == true)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_SWINEY_ZYJE_Info()
{
    AI_Output (other, self ,"DIA_SWINEY_ZYJE_15_01"); //Grabarz opu�ci Kocio�. 
    AI_Output (self, other ,"DIA_SWINEY_ZYJE_03_02"); //Jestem twoim d�u�nikiem. We� t� rude w zamian za t� wielk� przys�ug� jak� mi wy�wiadczy�e�.
    B_GiveInvItems (self,other, ItMiNugget, 100);
	ORG_40045_Grabarz.attribute[ATR_HITPOINTS] = 220;
	CreateInvItem		(ORG_40045_Grabarz, ItMw_1H_Sword_Long_02);	
	AI_EquipBestMeleeWeapon (ORG_40045_Grabarz);
	GrabarzIsDead1 = TRUE;
};

instance dia_swiney_pickpocket(c_info) {
    npc = sfb_1037_swiney;
    nr = 900;
    condition = dia_swiney_pickpocket_condition;
    information = dia_swiney_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_swiney_pickpocket_condition() {
	e_beklauen(baseThfChanceSFB, 30);
};

func void dia_swiney_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_swiney_pickpocket);
	info_addchoice(dia_swiney_pickpocket, dialog_back, dia_swiney_pickpocket_back);
	info_addchoice(dia_swiney_pickpocket, dialog_pickpocket, dia_swiney_pickpocket_doit);
};

func void dia_swiney_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_swiney_pickpocket);
};

func void dia_swiney_pickpocket_back() {
    info_clearchoices(dia_swiney_pickpocket);
};













