// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ziggy_EXIT(C_INFO)
{
	npc             = SFB_40063_Ziggy;
	nr              = 999;
	condition	= DIA_Ziggy_EXIT_Condition;
	information	= DIA_Ziggy_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Ziggy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ziggy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ziggy_HELLO1 (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 1;
   condition    = DIA_Ziggy_HELLO1_Condition;
   information  = DIA_Ziggy_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ziggy_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_01"); //Witaj nieznajomy. To ja pot�ny Ziggy!
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_02"); //Mocne s�owa jak na go�cia odzianego w brudne �achmany.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_03"); //Eee... Nie zwracaj na to uwagi. Jak to m�wi� suknia nie czyni druida czy jako� tak...
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_04"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_05"); //Masz okazj� dzi�ki, kt�rej zdob�dziesz mn�stwo rudy. Wystarczy, �e mi pomo�esz!
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_06"); //Par� razy ju� to s�ysza�em.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_07"); //Ale tym razem to prawda. I to najczystsza z mo�liwych.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_08"); //Mog� liczy� na twoje wsparcie w mej sprawie?

    Info_ClearChoices	(DIA_Ziggy_HELLO1);
    Info_AddChoice		(DIA_Ziggy_HELLO1, "Tak.", DIA_ZIGGY_TAK);
	Info_AddChoice		(DIA_Ziggy_HELLO1, "Nie mam na to czasu.", DIA_ZIGGY_NIE);
};

FUNC VOID DIA_ZIGGY_TAK()
{
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_01"); //Tak.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_02"); //Bystrzak z ciebie. Wiedzia�em, �e si� zgodzisz.
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_03"); //Do�� tej paplaniny. Jaki masz plan?
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_04"); //Z tego co wiem paru Szkodnik�w okrad�o Mag�w. Maj� zrabowan� rud� w du�ym kufrze.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_05"); //Poka�� ci gdzie on jest a ty usuniesz ewentualn� obstaw�.
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_06"); //A ty?

    AI_Output (self, other ,"DIA_Ziggy_TAK_03_07"); //Wiesz, walka to nie jest m�j wrodzony dar.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_08"); //To co, idziemy?
	Log_CreateTopic		(LatwySzmal,	LOG_MISSION);
	Log_SetTopicStatus	(LatwySzmal,	LOG_RUNNING);
	Npc_ExchangeRoutine(self,"SZKODNICY");
	B_LogEntry               (LatwySzmal,"Zagada� do mnie niejaki Ziggy. Pono� paru Szkodnik�w okrad�o Mag�w a on wie gdzie ci ukryli rud�. Nie zaszkodzi chyba jak mu pomog�.");
	Ziggy_Yes = TRUE;
	AI_StopProcessInfos	(self);
};


FUNC VOID DIA_ZIGGY_NIE()
{
    AI_Output (other, self ,"DIA_Ziggy_NIE_15_01"); //Nie mam na to czasu.
    AI_Output (self, other ,"DIA_Ziggy_NIE_03_02"); //Myli�em si� jednak jeste� s�aby tch�rzem a nie kim� przed, kt�rym ca�a kolonia stoi otworem!
    AI_Output (other, self ,"DIA_Ziggy_NIE_15_03"); //Zachowaj te g�upie uwagi dla siebie. Nie wygl�dasz mi na kogo� z kim mo�na si� wzbogaci�.
    AI_Output (self, other ,"DIA_Ziggy_NIE_03_04"); //Jeste� �a�osny. Odejd� ju� st�d najlepiej. Zaraz znajd� kogo� inteligentnego i odwa�nego.
    AI_Output (other, self ,"DIA_Ziggy_NIE_15_05"); //Powodzenia wariacie...
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Szkodnicy
//========================================

INSTANCE DIA_Ziggy_Szkodnicy (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 4;
   condition    = DIA_Ziggy_Szkodnicy_Condition;
   information  = DIA_Ziggy_Szkodnicy_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_Szkodnicy_Condition()
{
if (Npc_GetDistToWP(SFB_40063_Ziggy,"WP_LSZ04")<500)
&& (Ziggy_Yes == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_Szkodnicy_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_01"); //To oni. Rozwal ich i dosta� si� do skrzyni.
    AI_Output (other, self ,"DIA_Ziggy_Szkodnicy_15_02"); //By�oby mi �atwiej gdyby� mi pom�g�.
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_03"); //To ja jestem m�zgiem tej operacji!
    AI_Output (other, self ,"DIA_Ziggy_Szkodnicy_15_04"); //C�... nie potrzebnie si� w to miesza�em...
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_05"); //Id� ju�, ruda czeka!
	   Npc_SetPermAttitude (NON_40072_Rabus, ATT_HOSTILE);
	Npc_SetTarget (NON_40072_Rabus, hero);
    AI_StartState (NON_40072_Rabus, ZS_ATTACK, 1, "");
	   Npc_SetPermAttitude (NON_40073_Rabus, ATT_HOSTILE);
	Npc_SetTarget (NON_40073_Rabus, hero);
    AI_StartState (NON_40073_Rabus, ZS_ATTACK, 1, "");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KUFER
//========================================

INSTANCE DIA_Ziggy_KUFER (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 5;
   condition    = DIA_Ziggy_KUFER_Condition;
   information  = DIA_Ziggy_KUFER_Info;
   permanent	= FALSE;
   description	= "W kufrze nie ma �adnej rudy!";
};

FUNC INT DIA_Ziggy_KUFER_Condition()
{
 if (Npc_HasItems (other, ItMi_LSZ_BrokenScoop) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_KUFER_Info()
{
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_01"); //W kufrze nie ma �adnej rudy!
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_03"); //By�a tylko jaka� zardzewia�a �y�ka. Gdzie ten tw�j skarb?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_04"); //Cholera. Przecie� mia�em wiarygodne informacje...
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_05"); //Trac� z tob� tylko czas.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_06"); //Jak dowiesz si�, �e m�j brat jest pot�nym Magnatem w Starym Obozie to zmienisz zdanie.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_07"); //�e co?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_08"); //W�a�nie tak. Potrzebuje kogo� kto dostarczy mu wiadomo�� ode mnie. Pytam w niej co u niego i czy m�g�bym u niego zamieszka�.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_09"); //Jak ma na imi� tw�j brat?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_10"); //Nosi dumne imi� Adolf. Oto moja wiadomo��.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_11"); //Jak z nim zamieszkam to dostaniesz tyle rudy ile b�dziesz w stanie unie��.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_12"); //Prawie ci wierz�...
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_13"); //No szybciej. Chc� rozpocz�� wreszcie dostatnie �ycie. Bo ta wegetacja mnie dobija...
B_GiveInvItems (self,other, ItWr_LSZ_ZiggyToMud, 1);	
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_14"); //Dobra id�. Jak b�d� mia� czas to przeka�� twojemu bratu wiadomo�� od ciebie.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_15"); //Wielkie dzi�ki przyjacielu!
	Npc_ExchangeRoutine(SFB_40063_Ziggy,"FMCstart");
	B_LogEntry               (LatwySzmal,"W kufrze nic nie ma. Ten Ziggy opr�cz tego, �e wygl�da na �ebraka to jest zwyk�ym os�em. Twierdzi jednak, �e jego brat Adolf to Magnat w Starym Obozie. Ziggy chce u niego zamieszka� ale najpierw mam przekaza� jego bratu wiadomo�� od niego. Skoro ju� wszed�em w kontakt z tym ,,mistrzem� to nie zaszkodzi wzbogaci� si� rud� jego brata. Powinienem pogada� z, kt�rym� z Magnat�w na zamku Gomeza. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LSZ_MUD
//========================================

INSTANCE DIA_Ziggy_LSZ_MUD (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 1;
   condition    = DIA_Ziggy_LSZ_MUD_Condition;
   information  = DIA_Ziggy_LSZ_MUD_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z twoim bratem";
};

FUNC INT DIA_Ziggy_LSZ_MUD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Mud_LSZ_Info))
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_LSZ_MUD_Info()
{
    AI_Output (other, self ,"DIA_Ziggy_LSZ_MUD_15_01"); //Rozmawia�em z twoim bratem
    AI_Output (self, other ,"DIA_Ziggy_LSZ_MUD_03_02"); //Z Adolfem?! No i jak?
	
    Info_ClearChoices	(DIA_Ziggy_LSZ_MUD);
    Info_AddChoice		(DIA_Ziggy_LSZ_MUD, "Tw�j brat ci� oszuka�. ", DIA_ZIGGY_TAK_MUD);
	Info_AddChoice		(DIA_Ziggy_LSZ_MUD, "Tw�j brat jest Magnatem I praw� r�k� Gomeza.", DIA_ZIGGY_MUD_NIE);
};


FUNC VOID DIA_ZIGGY_TAK_MUD()
{
   
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_01"); //Tw�j brat ci� oszuka�. Jest obozowym przegrywem nie Magnatem.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_02"); //Co to za brednie! M�j brat to pot�ny Magnat.
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_03"); //Od kiedy niby Gomez jest twoim bratem?
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_04"); //Gomez jest tylko fasad�. A wi�kszo�� w�adzy sprawuje m�j rodzony brat Adolf.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_05"); //Po prostu nie dopuszczono ci� przed jego oblicze. Nie da�e� rady dosta� si� do zamku. Ot I ca�a filozofia!
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_06"); //Co jak co ale Ziggy i Wrz�d nie musz� si� martwi�, �e kto� im zamieni� ko�yski... Ta sama krew (pod nosem)
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_07"); //C�... Na razie.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_08"); //Zawiod�e� mnie przyjacielu.
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_09"); //Ale zaraz... Co z nagrod� za fatyg�?
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_10"); //Mo�esz o niej zapomnie�. �garzu!
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_11"); //To poca�uj mnie w dupe obdartusie.
	B_LogEntry               (LatwySzmal,"Ziggy nie wierzy, �e jego brat go ok�ama�. Nie mam co liczy� na nagrod�. Tylko straci�em czas na tego wa�ka I jego r�wnie por�banego brata.");
  Log_SetTopicStatus	(LatwySzmal,	LOG_SUCCESS);
  B_GiveXP(150);
  AI_StopProcessInfos	(self);
	
};


FUNC VOID DIA_ZIGGY_MUD_NIE()
{
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_01"); //Tw�j brat jest Magnatem I praw� r�k� Gomeza. Nie ma dla Ciebie czasu.
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_02"); //O nie... Zawi�d� mnie tak bardzo. M�g�bym u niego �y� dostatnio maj�c wikt i opierunek. No i pi�kne kobiety.
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_03"); //Twoja pora�ka �rednio by mnie obchodzi�a gdyby nie to, �e masz mi zap�aci� za fatyg�.
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_04"); //Ale ja nic nie mam... My�la�em, �e zap�ac� ci jak ju� b�d� sobie �y� dostatnio na zamku.
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_05"); //Ale� ja by�em g�upi wchodz�c w ten uk�ad z tob�...
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_06"); //Ale mam dla ciebie co� cenniejszego od rudy!
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_07"); //Niby co?
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_08"); //My�l� o swoim towarzystwie. Razem kolonia stoi przed nami otworem!
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_09"); //Ku chwale!
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_10"); //Pora si� st�d zmywa�...
	LSZ_ZiggyF = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
	B_LogEntry               (LatwySzmal,"Powiedzia�em Ziggy�emu to co chcia� jego brat Wrz�d. Ten nie ma nawet rudy by mi zap�aci� za fatyg�. Ale oferuje siebie jako towarzysza w drodz� po ,,chwa�� . Co ja najlepszego narobi�em?");
    Log_SetTopicStatus	(LatwySzmal,	LOG_SUCCESS);
	 B_GiveXP(100);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RUDA
//========================================

INSTANCE DIA_Ziggy_RUDA (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 4;
   condition    = DIA_Ziggy_RUDA_Condition;
   information  = DIA_Ziggy_RUDA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_RUDA_Condition()
{
if (LSZ_ZiggyF == TRUE) //(Npc_KnowsInfo(hero,DIA_BaalNamib_GIT)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_RUDA_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_01"); //Masz plan jak zdoby� rud�?
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_02"); //Kogo najpierw skroimy?
    AI_Output (other, self ,"DIA_Ziggy_RUDA_15_03"); //Z tob� nie da�oby rady skroi� nawet �lepej i pijanej staruszki. Odwal si�!
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_04"); //Dobra ju� nic nie m�wi�. Dzia�aj przyjacielu!
    AI_Output (other, self ,"DIA_Ziggy_RUDA_15_05"); //O Innosie. Co za t�pak.
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> YOU_HAVEAPLAN
//========================================

INSTANCE DIA_Ziggy_YOU_HAVEAPLAN (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 1;
   condition    = DIA_Ziggy_YOU_HAVEAPLAN_Condition;
   information  = DIA_Ziggy_YOU_HAVEAPLAN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_YOU_HAVEAPLAN_Condition()
{
 if (Npc_KnowsInfo(hero,DIA_Ziggy_RUDA)) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
{
    return TRUE;
};
};

FUNC VOID DIA_Ziggy_YOU_HAVEAPLAN_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_01"); //No I jak masz ju� jaki� plan na zdobycie fortuny przyjacielu?
    AI_Output (other, self ,"DIA_Ziggy_YOU_HAVEAPLAN_15_02"); //M�j plan jest taki... Ty zostajesz a ja id� dalej.
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_03"); //To gdzie ten milion bry�ek rudy w twoim planie?
    AI_Output (other, self ,"DIA_Ziggy_YOU_HAVEAPLAN_15_04"); //Raczej w twoich snach. A teraz spadaj!
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_05"); //Dobra my�l spokojnie. Nie zaszkodzi jak chwil� pomilcz�.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HICH4
//========================================

INSTANCE DIA_Ziggy_HICH4 (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 1;
   condition    = DIA_Ziggy_HICH4_Condition;
   information  = DIA_Ziggy_HICH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_HICH4_Condition()
{
    if (Kapitel == 4)
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_HICH4_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_01"); //Hej mi�o ci� widzie� stary! Jak tam dorobi�e� si� ju� czego�?
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_02"); //G��wnie kilku siniak�w...
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_03"); //To kiepsko. W�a�nie trafi�em tu z Kot�a. A pono� tam sta�o si� co� nieprzyjemnego.
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_04"); //Stra�nicy znienacka wpadli I wszystkich wymordowali.
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_05"); //Cholera. Wiesz co� wi�cej?
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_06"); //Nie. Ale chcia�em ci� pocieszy�. Najwi�ksza persona tamtejszej spo�eczno�ci prze�y�a.
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_07"); //Kto taki?
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_08"); //Jak to kto? Ja!
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_09"); //Bogowie... 
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_10"); //Bogowie niech nam pomog� w dorobieniu si� fortuny!
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_11"); //Wola�bym �eby najpierw ci� st�d wyteleportowali...
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CH5
//========================================

INSTANCE DIA_Ziggy_CH5 (C_INFO)
{
   npc          = SFB_40063_Ziggy;
   nr           = 1;
   condition    = DIA_Ziggy_CH5_Condition;
   information  = DIA_Ziggy_CH5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ziggy_CH5_Condition()
{
if (kapitel ==5)
{
    return TRUE;
};
};
FUNC VOID DIA_Ziggy_CH5_Info()
{
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_01"); //Cholera , chcia�bym wiedzie� co u mojego brata na tle aktualnych wydarze�.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_02"); //Mo�e m�g�by� si� dowiedzie�? Ale nie przyprowadzaj go do mnie bo wyda si� , �e nic nie mam .... Znaczy p�ki co!
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_03"); //Mam lepsze rzeczy do roboty.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_04"); //To nie w porz�dku by tak odrzuca� pro�b� kumpla. M�j brat to r�wny go��. W�a�nie wspomina�em nasze dzieci�stwo jak mama czyta�a nam bajki.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_05"); //Nasz� ulubion� by�a chyba ,,Zakl�ta w pe�zacza" chocia� w sumie....
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_06"); //Racz odpu�ci� mi te wzruszaj�ce wspominki. Delikatnie m�wi�c mam co robi�.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_07"); // W razie czego wiesz gdzie mnie szuka�.
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_08"); //Raczej jakie miejsce omija�....
    AI_StopProcessInfos	(self);
};

