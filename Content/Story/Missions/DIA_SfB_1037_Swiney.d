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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in¿ynierem, jakiego ta przeklêta Kolonia kiedykolwiek widzia³a, ch³opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnujê, ¿eby nasi ch³opcy nie œci¹gnêli sobie na g³owy sterty kamieni kopi¹c w niew³aœciwym miejscu.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 1;
	description = "Chcia³bym do was do³¹czyæ, jako Kret.";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia³bym do was do³¹czyæ, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy¿by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry¿u na dzieñ. Resztê musisz sobie sam za³atwiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca³¹ tê brudn¹ robotê? ¯eby pewnego dnia móc wyjœæ na wolnoœæ z tego przeklêtego wiêzienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca³y nasz urobek jest sk³adowany na wielkim kopcu. Raz w miesi¹cu ka¿dy z nas dostaje 50 bry³ek, ¿eby móc siê porz¹dnie upiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa¿niejsze rzeczy, które powinieneœ wiedzieæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia¿ jakieœ doœwiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nie."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Tak."  ,Info_Swiney_Schuerfer_Ja);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Na razie nie chcê byæ Kretem."  ,Info_Swiney_Schuerfer_Back);
};

func void Info_Swiney_Schuerfer_Back ()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Back_15_00"); //Na razie nie chcê byæ Kretem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Back_09_01"); //Wróæ, gdy siê namyœlisz.
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 1;
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To œwietnie! Zatem wiesz, na co nale¿y uwa¿aæ. Masz tu swój strój roboczy. Kilof musisz znaleŸæ sobie sam. Mi³ej zabawy.
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
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi siê podoba! Zosta³em Kretem bez ¿adnych g³upich zadañ. Jednak by zostaæ Szkodnikiem, bêdê musia³ zrobiæ coœ ambitniejszego ni¿ kopanie rudy.");
	B_giveXP (XP_BecomeSfb);
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_Swiney_Schuerfer.permanent = 0;
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja muszê was uœwiadamiaæ. S³uchaj uwa¿nie: weŸ te ciuchy i za³ó¿ je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa³ek rudy spad³ ci na bos¹ stopê, zosta³byœ kalek¹ do koñca ¿ycia. Oczywiœcie wtedy by³byœ dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzieœ w pobli¿u powinien le¿eæ jakiœ kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywiœcie wiele z nim nie zdzia³asz... Mówi siê trudno...
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
  	B_LogEntry               (CH1_AwansJakoKret,"I to mi siê podoba! Zosta³em Kretem bez ¿adnych g³upich zadañ. Jednak by zostaæ Szkodnikiem, bêdê musia³ zrobiæ coœ ambitniejszego ni¿ kopanie rudy. ");
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
	description = "Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie mówi¹, ¿e mamy ju¿ niemal ca³¹ potrzebn¹ iloœæ. Kiedy bêdziesz w Nowym Obozie rzuæ okiem na kopiec.
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
	description = "Gdzie mogê tu coœ kupiæ?";
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
	AI_Output (other, self,"Info_Swiney_TRADE_15_00"); //Gdzie mogê tu coœ kupiæ?
	AI_Output (self, other,"Info_Swiney_TRADE_09_01"); //Pogadaj z Okylem. On zarz¹dza nie tylko prac¹, ale tak¿e dostawami.
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
	description		= "Naucz mnie górnictwa. (100 bry³ek rudy)"; 
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
    AI_Output (other, self, "SfB_1037_Swiney_START_LEARN_15_00"); //Naucz mnie górnictwa!
	
	if (Npc_HasItems (other, ItMiNugget) >=100)
	{
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_01"); //No dobra. Trzeba uderzaæ spokojnie i jednostajnie. Nie spiesz siê – ale uwa¿aj, ¿eby nie zasn¹æ przy pracy.
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_02"); //Nie wal ci¹gle w jedno miejsce – spróbuj wyci¹æ ³adny samorodek.
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_03"); //Postêpuj zgodnie z moimi wskazówkami, a zostaniesz prawdziwym mistrzem wœród kopaczy.
			B_GiveInvItems (other,self, itminugget, 100);
		//HERO_HACKCHANCE = HERO_HACKCHANCE + 10;
		b_upgrade_hero_hackchance(10);
		//Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "SfB_1037_Swiney_START_LEARN_01_04"); //Najpierw chcê zobaczyæ moj¹ czêœæ.
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
	description = "Co mo¿esz mi powiedzieæ o transporcie rudy?";
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
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_15_00"); //Co mo¿esz mi powiedzieæ o transporcie rudy?
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_01"); //Nie rozumiem, czemu mia³oby ciê to interesowaæ.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_09_02"); //Przecie¿ nie nale¿ysz do Nowego Obozu.
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
	Info_AddChoice   (Info_Swiney_CAVALORN_TEST, "Chcê do³¹czyæ do Nowego Obozu, wiêc potrzebujê dowiedzieæ siê jak najwiêcej."	,Info_Swiney_CAVALORN_TEST_TRUE);
	Info_AddChoice	 (Info_Swiney_CAVALORN_TEST, "Jestem po prostu ciekawy." ,Info_Swiney_CAVALORN_TEST_FALSE);
};

func void Info_Swiney_CAVALORN_TEST_TRUE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_00"); //Chcê do³¹czyæ do Nowego Obozu, wiêc potrzebujê dowiedzieæ siê jak najwiêcej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_01"); //Ach tak... Lares sobie upatrzy³ jakiegoœ ¿ó³todzioba?
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_02"); //Tak, pracujê dla Laresa.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_03"); //W takim razie dobrze, powiem ci jak to wygl¹da.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_04"); //O czym ty... Ach tak, transport.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_05"); //Ostatnio uda³o nam siê wydobyæ 30 skrzyñ rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_06"); //Jest to rekord w historii Wolnej Kopalni, wczeœniej wydobyliœmy mniej.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_07"); //Wygl¹da na to, ¿e wielu Kretów wziê³o sobie do serca zapewnienia magów o odzyskaniu wolnoœci.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_08"); //A wracaj¹c do tematu: nied³ugo organizujemy transport rudy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_09"); //Dopiero zacz¹³em opracowywaæ plan, wiêc za wiele ci nie powiem.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_TRUE_09_10"); //Myœlê, ¿e najlepsz¹ por¹ bêdzie noc. Przynajmniej zmniejszy to ryzyko, ¿e zostaniemy okradzeni.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_TRUE_15_11"); //Dziêki za informacje.
	knowsOre2 = true;
	B_LogEntry                     (CH1_TestOC,"Od Swineya dowiedzia³em siê, ¿e Krety w Wolnej Kopalni wydoby³y 30 skrzyñ rudy. Swiney dopiero obmyœla plan transportu, ale jest pewien, ¿e odbêdzie siê on w nocy.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};

func void Info_Swiney_CAVALORN_TEST_FALSE ()
{
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_00"); //Jestem po prostu ciekawy.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_01"); //Ciekawy? Nie rozœmieszaj mnie, ch³opcze.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_02"); //Pewnie Gomezowi zachcia³o siê nas szpiegowaæ.
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_03"); //Nic ci nie powiem, a jeœli spróbujesz coœ kombinowaæ, to Okyl zrobi z tob¹ porz¹dek.
	AI_Output (other, self,"Info_Swiney_CAVALORN_TEST_FALSE_15_04"); //Ale...
	AI_Output (self, other,"Info_Swiney_CAVALORN_TEST_FALSE_09_05"); //Spadaj st¹d!
	knowsOre2 = false;
	B_LogEntry                     (CH1_TestOC,"Nawali³em... Swiney nic mi nie powie o transporcie rudy. Co nie znaczy, ¿e obla³em test. Warto wróciæ do Cavalorna i sprawdziæ jak mnie oceni.");
	Info_ClearChoices(Info_Swiney_CAVALORN_TEST);
};



//------------------------------------------------------------------------------------1.6.1-------------------------------------------------------------------

//========================================
//-----------------> Cieñ w boku
//========================================

INSTANCE DIA_SWINEY_CIEN (C_INFO)
{
   npc          = SfB_1037_Swiney;
   nr           = 1;
   condition    = DIA_SWINEY_CIEN_Condition;
   information  = DIA_SWINEY_CIEN_Info;
   permanent	= FALSE;
   description	= "Mówi ci coœ ksywka Grabarz?";
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
    AI_Output (other, self ,"DIA_SWINEY_CIEN_15_01"); //Mówi ci coœ ksywka Grabarz?
    AI_Output (self, other ,"DIA_SWINEY_CIEN_03_02"); //Wiem tylko tyle, ¿e to Szkodnik, który siê tu krêci... A teraz daj mi spokój ch³opcze bo mam przed sob¹ du¿o pracy!
    AI_Output (other, self ,"DIA_SWINEY_CIEN_15_03"); //Zrobi³eœ siê nerwowy. A pytanie czemu chronisz Grabarza raczej nie ostudzi twojego zapa³u...
    AI_Output (self, other ,"DIA_SWINEY_CIEN_15_04"); //Powiedzia³em daj mi spokój. IdŸ w swoj¹ stronê.
    AI_Output (other, self ,"DIA_SWINEY_CIEN_03_05"); //Jak chcesz. Ale ja i tak dowiem siê wszystkiego, Okyl obieca³ mi niez³¹ nagrodê.
    Info_ClearChoices (DIA_SWINEY_CIEN);
	Info_AddChoice (DIA_SWINEY_CIEN,"Któryœ z Kretów na pewno wszystko mi opowie. Co raczej...",DIA_SWINEY_GRABCIO);
};


FUNC VOID DIA_SWINEY_GRABCIO()
  {
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_00");  //Któryœ z Kretów na pewno wszystko mi opowie. Co raczej nie wp³ynie dobrze na twoj¹ sytuacje.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_01");  //Dobrze ju¿. Opowiem ci wszystko jeœli mi pomo¿esz.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_02");  //Z czym?
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_03");  //Z Grabarzem.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_04");  //Przecie¿ to ty jesteœ jego obroñc¹.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_05");  //Gdyby sytuacja by³a normalna, pierwszy ¿¹da³bym jego wyrzucenia z Kot³a.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_06");  //Ale niestety... Jest pewna przykra sprawa.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_07");  //Zatem opowiedz mi o tym.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_08");  //Parê lat temu gdy kontakty Nowego Obozu ze Starym by³y nieco lepsze, zawar³em pewn¹ umowê handlow¹ ze Star¹ Kopalni¹.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_09");  //Obecnie taki dokument móg³by mi powa¿nie zaszkodziæ. Na pewno straci³bym posadê g³ównego in¿yniera.
	AI_Output (other,self ,"DIA_SWINEY_GRABCIO_15_10");  //Zaraz przecie¿ ta umowa zosta³a zawarta parê lat temu...
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_11");  //Tylko w teorii, niedawno ktoœ w³ama³ siê do mojego domu. Nastêpnego dnia przyszed³ Grabarz z moim dokumentem.
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_12");  //Sfa³szowa³ datê zawarcia umowy. Wychodzi, ¿e podpisa³em j¹ zaledwie parê tygodni temu. 
	AI_Output (self ,other,"DIA_SWINEY_GRABCIO_11_13");  //Na dodatek dopisa³, ¿e dostarcza³em równie¿ w tajemnicy broñ ludziom Gomeza.
	
    B_LogEntry  (Cienwboku,"Swiney chroni Grabarza gdy¿ ma na niego kompromituj¹ce pismo. Chcia³by ¿ebym wyci¹gn¹³ je od tego szkodnika, problem polega na tym, ¿e sam Grabarz nie ma go przy sobie. Musze siê dowiedzieæ gdzie s¹ te dokumenty. Popytam ludzi w kotle.");
	

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
   description	= "Gdyby tak odebraæ ten papier temu Szkodnikowi...";
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
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_15_01"); //Gdyby tak odebraæ ten papier temu Szkodnikowi, sprawa sama by siê rozwi¹za³a.
    AI_Output (self, other ,"DIA_SWINEY_CIENWMR_03_02"); //Kiedyœ Grabarz upi³ siê do nieprzytomnoœci. Przeszuka³em go wtedy i nic nie znalaz³em. On nie nosi tego dokumentu przy sobie.
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_15_03"); //Móg³bym poszukaæ jakiœ poszlak.
    AI_Output (self, other ,"DIA_SWINEY_CIENWMR_15_04"); //Popytaj ludzi w Kotle. Oczywiœcie poza Grabarzem i Okylem.
    AI_Output (other, self ,"DIA_SWINEY_CIENWMR_03_05"); //W porz¹dku.
  
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
    AI_Output (other, self ,"DIA_SWINEY_PAPIER_15_03"); //A co z nagrod¹.
    AI_Output (self, other ,"DIA_SWINEY_PAPIER_15_04"); //Ju¿ prawie jest twoja.
    AI_Output (other, self ,"DIA_SWINEY_PAPIER_03_05"); //Jak to prawie?
    AI_Output (self, other ,"DIA_SWINEY_PAPIER_15_06"); //IdŸ i skop ty³ek Grabarzowi. Ma siê st¹d wynieœæ raz na zawsze, teraz nie ma ju¿ na mnie ¿adnego haczyka.
		B_GiveInvItems (other,self, ItMi_DokumentSwineya, 1);
	 B_LogEntry               (Cienwboku,"Dostarczy³em dokument Swiney’owi. Teraz Grabarz nie ma ¿adnej os³ony. Musze go pobiæ i zmusiæ do odejœcia z Kot³a.");
	
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
   description	= "Zabi³em Grabarza.";
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
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_15_01"); //Zabi³em Grabarza.
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_03_02"); //Co takiego?! Dopuœci³eœ siê morderstwa w obozie w kotle! Mia³eœ go tylko postraszyæ.
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_15_03"); //Có¿ ostrze mi siê odrobinê omsknê³o….
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_04"); //W takim razie nic nie p³acê!
    AI_Output (other, self ,"DIA_SWINEY_ZDECH_03_05"); //Jak to? Przecie¿ rozwi¹za³em twój problem z Grabarzem.
    AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_06"); //Ale nie w taki sposób jaki oczekiwa³em.
	AI_Output (other, self ,"DIA_SWINEY_ZDECH_03_07"); //Coœ mi siê nale¿y.
	AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_08"); //Nie. To moje ostateczne s³owo.
	AI_Output (self, other ,"DIA_SWINEY_ZDECH_15_09");  //OdejdŸ ode mnie morderco!
	B_LogEntry               (Cienwboku,"Swiney nie chcê mi wyp³aciæ nagrody bo dosz³o do niepotrzebnego rozlewu krwi. Ca³e moja starania na darmo. Obawiam siê, ¿e to jeszcze nie koniec.");
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
   description	= "Grabarz opuœci³ Kocio³.";
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
    AI_Output (other, self ,"DIA_SWINEY_ZYJE_15_01"); //Grabarz opuœci Kocio³. 
    AI_Output (self, other ,"DIA_SWINEY_ZYJE_03_02"); //Jestem twoim d³u¿nikiem. WeŸ tê rude w zamian za t¹ wielk¹ przys³ugê jak¹ mi wyœwiadczy³eœ.
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













