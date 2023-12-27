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
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_01"); //Witaj nieznajomy. To ja potê¿ny Ziggy!
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_02"); //Mocne s³owa jak na goœcia odzianego w brudne ³achmany.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_03"); //Eee... Nie zwracaj na to uwagi. Jak to mówi¹ suknia nie czyni druida czy jakoœ tak...
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_04"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_05"); //Masz okazjê dziêki, której zdobêdziesz mnóstwo rudy. Wystarczy, ¿e mi pomo¿esz!
    AI_Output (other, self ,"DIA_Ziggy_HELLO1_15_06"); //Parê razy ju¿ to s³ysza³em.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_07"); //Ale tym razem to prawda. I to najczystsza z mo¿liwych.
    AI_Output (self, other ,"DIA_Ziggy_HELLO1_03_08"); //Mogê liczyæ na twoje wsparcie w mej sprawie?

    Info_ClearChoices	(DIA_Ziggy_HELLO1);
    Info_AddChoice		(DIA_Ziggy_HELLO1, "Tak.", DIA_ZIGGY_TAK);
	Info_AddChoice		(DIA_Ziggy_HELLO1, "Nie mam na to czasu.", DIA_ZIGGY_NIE);
};

FUNC VOID DIA_ZIGGY_TAK()
{
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_01"); //Tak.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_02"); //Bystrzak z ciebie. Wiedzia³em, ¿e siê zgodzisz.
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_03"); //Doœæ tej paplaniny. Jaki masz plan?
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_04"); //Z tego co wiem paru Szkodników okrad³o Magów. Maj¹ zrabowan¹ rudê w du¿ym kufrze.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_05"); //Poka¿ê ci gdzie on jest a ty usuniesz ewentualn¹ obstawê.
    AI_Output (other, self ,"DIA_Ziggy_TAK_15_06"); //A ty?

    AI_Output (self, other ,"DIA_Ziggy_TAK_03_07"); //Wiesz, walka to nie jest mój wrodzony dar.
    AI_Output (self, other ,"DIA_Ziggy_TAK_03_08"); //To co, idziemy?
	Log_CreateTopic		(LatwySzmal,	LOG_MISSION);
	Log_SetTopicStatus	(LatwySzmal,	LOG_RUNNING);
	Npc_ExchangeRoutine(self,"SZKODNICY");
	B_LogEntry               (LatwySzmal,"Zagada³ do mnie niejaki Ziggy. Ponoæ paru Szkodników okrad³o Magów a on wie gdzie ci ukryli rudê. Nie zaszkodzi chyba jak mu pomogê.");
	Ziggy_Yes = TRUE;
	AI_StopProcessInfos	(self);
};


FUNC VOID DIA_ZIGGY_NIE()
{
    AI_Output (other, self ,"DIA_Ziggy_NIE_15_01"); //Nie mam na to czasu.
    AI_Output (self, other ,"DIA_Ziggy_NIE_03_02"); //Myli³em siê jednak jesteœ s³aby tchórzem a nie kimœ przed, którym ca³a kolonia stoi otworem!
    AI_Output (other, self ,"DIA_Ziggy_NIE_15_03"); //Zachowaj te g³upie uwagi dla siebie. Nie wygl¹dasz mi na kogoœ z kim mo¿na siê wzbogaciæ.
    AI_Output (self, other ,"DIA_Ziggy_NIE_03_04"); //Jesteœ ¿a³osny. OdejdŸ ju¿ st¹d najlepiej. Zaraz znajdê kogoœ inteligentnego i odwa¿nego.
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
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_01"); //To oni. Rozwal ich i dostañ siê do skrzyni.
    AI_Output (other, self ,"DIA_Ziggy_Szkodnicy_15_02"); //By³oby mi ³atwiej gdybyœ mi pomóg³.
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_03"); //To ja jestem mózgiem tej operacji!
    AI_Output (other, self ,"DIA_Ziggy_Szkodnicy_15_04"); //Có¿... nie potrzebnie siê w to miesza³em...
    AI_Output (self, other ,"DIA_Ziggy_Szkodnicy_03_05"); //IdŸ ju¿, ruda czeka!
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
   description	= "W kufrze nie ma ¿adnej rudy!";
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
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_01"); //W kufrze nie ma ¿adnej rudy!
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_03"); //By³a tylko jakaœ zardzewia³a ³y¿ka. Gdzie ten twój skarb?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_04"); //Cholera. Przecie¿ mia³em wiarygodne informacje...
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_05"); //Tracê z tob¹ tylko czas.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_06"); //Jak dowiesz siê, ¿e mój brat jest potê¿nym Magnatem w Starym Obozie to zmienisz zdanie.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_07"); //¯e co?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_08"); //W³aœnie tak. Potrzebuje kogoœ kto dostarczy mu wiadomoœæ ode mnie. Pytam w niej co u niego i czy móg³bym u niego zamieszkaæ.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_09"); //Jak ma na imiê twój brat?
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_10"); //Nosi dumne imiê Adolf. Oto moja wiadomoœæ.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_11"); //Jak z nim zamieszkam to dostaniesz tyle rudy ile bêdziesz w stanie unieœæ.
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_12"); //Prawie ci wierzê...
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_13"); //No szybciej. Chcê rozpocz¹æ wreszcie dostatnie ¿ycie. Bo ta wegetacja mnie dobija...
B_GiveInvItems (self,other, ItWr_LSZ_ZiggyToMud, 1);	
    AI_Output (other, self ,"DIA_Ziggy_KUFER_15_14"); //Dobra idê. Jak bêdê mia³ czas to przeka¿ê twojemu bratu wiadomoœæ od ciebie.
    AI_Output (self, other ,"DIA_Ziggy_KUFER_03_15"); //Wielkie dziêki przyjacielu!
	Npc_ExchangeRoutine(SFB_40063_Ziggy,"FMCstart");
	B_LogEntry               (LatwySzmal,"W kufrze nic nie ma. Ten Ziggy oprócz tego, ¿e wygl¹da na ¿ebraka to jest zwyk³ym os³em. Twierdzi jednak, ¿e jego brat Adolf to Magnat w Starym Obozie. Ziggy chce u niego zamieszkaæ ale najpierw mam przekazaæ jego bratu wiadomoœæ od niego. Skoro ju¿ wszed³em w kontakt z tym ,,mistrzem” to nie zaszkodzi wzbogaciæ siê rud¹ jego brata. Powinienem pogadaæ z, którymœ z Magnatów na zamku Gomeza. ");
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
   description	= "Rozmawia³em z twoim bratem";
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
    AI_Output (other, self ,"DIA_Ziggy_LSZ_MUD_15_01"); //Rozmawia³em z twoim bratem
    AI_Output (self, other ,"DIA_Ziggy_LSZ_MUD_03_02"); //Z Adolfem?! No i jak?
	
    Info_ClearChoices	(DIA_Ziggy_LSZ_MUD);
    Info_AddChoice		(DIA_Ziggy_LSZ_MUD, "Twój brat ciê oszuka³. ", DIA_ZIGGY_TAK_MUD);
	Info_AddChoice		(DIA_Ziggy_LSZ_MUD, "Twój brat jest Magnatem I praw¹ rêk¹ Gomeza.", DIA_ZIGGY_MUD_NIE);
};


FUNC VOID DIA_ZIGGY_TAK_MUD()
{
   
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_01"); //Twój brat ciê oszuka³. Jest obozowym przegrywem nie Magnatem.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_02"); //Co to za brednie! Mój brat to potê¿ny Magnat.
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_03"); //Od kiedy niby Gomez jest twoim bratem?
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_04"); //Gomez jest tylko fasad¹. A wiêkszoœæ w³adzy sprawuje mój rodzony brat Adolf.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_05"); //Po prostu nie dopuszczono ciê przed jego oblicze. Nie da³eœ rady dostaæ siê do zamku. Ot I ca³a filozofia!
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_06"); //Co jak co ale Ziggy i Wrzód nie musz¹ siê martwiæ, ¿e ktoœ im zamieni³ ko³yski... Ta sama krew (pod nosem)
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_07"); //Có¿... Na razie.
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_08"); //Zawiod³eœ mnie przyjacielu.
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_09"); //Ale zaraz... Co z nagrod¹ za fatygê?
    AI_Output (self, other ,"DIA_Ziggy_TAK_MUD_03_10"); //Mo¿esz o niej zapomnieæ. £garzu!
    AI_Output (other, self ,"DIA_Ziggy_TAK_MUD_15_11"); //To poca³uj mnie w dupe obdartusie.
	B_LogEntry               (LatwySzmal,"Ziggy nie wierzy, ¿e jego brat go ok³ama³. Nie mam co liczyæ na nagrodê. Tylko straci³em czas na tego wa³ka I jego równie por¹banego brata.");
  Log_SetTopicStatus	(LatwySzmal,	LOG_SUCCESS);
  B_GiveXP(150);
  AI_StopProcessInfos	(self);
	
};


FUNC VOID DIA_ZIGGY_MUD_NIE()
{
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_01"); //Twój brat jest Magnatem I praw¹ rêk¹ Gomeza. Nie ma dla Ciebie czasu.
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_02"); //O nie... Zawiód³ mnie tak bardzo. Móg³bym u niego ¿yæ dostatnio maj¹c wikt i opierunek. No i piêkne kobiety.
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_03"); //Twoja pora¿ka œrednio by mnie obchodzi³a gdyby nie to, ¿e masz mi zap³aciæ za fatygê.
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_04"); //Ale ja nic nie mam... Myœla³em, ¿e zap³acê ci jak ju¿ bêdê sobie ¿y³ dostatnio na zamku.
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_05"); //Ale¿ ja by³em g³upi wchodz¹c w ten uk³ad z tob¹...
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_06"); //Ale mam dla ciebie coœ cenniejszego od rudy!
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_07"); //Niby co?
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_08"); //Myœlê o swoim towarzystwie. Razem kolonia stoi przed nami otworem!
    AI_Output (self, other ,"DIA_Ziggy_MUD_NIE_03_09"); //Ku chwale!
    AI_Output (other, self ,"DIA_Ziggy_MUD_NIE_15_10"); //Pora siê st¹d zmywaæ...
	LSZ_ZiggyF = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
	B_LogEntry               (LatwySzmal,"Powiedzia³em Ziggy’emu to co chcia³ jego brat Wrzód. Ten nie ma nawet rudy by mi zap³aciæ za fatygê. Ale oferuje siebie jako towarzysza w drodzê po ,,chwa³ê” . Co ja najlepszego narobi³em?");
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
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_01"); //Masz plan jak zdobyæ rudê?
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_02"); //Kogo najpierw skroimy?
    AI_Output (other, self ,"DIA_Ziggy_RUDA_15_03"); //Z tob¹ nie da³oby rady skroiæ nawet œlepej i pijanej staruszki. Odwal siê!
    AI_Output (self, other ,"DIA_Ziggy_RUDA_03_04"); //Dobra ju¿ nic nie mówiê. Dzia³aj przyjacielu!
    AI_Output (other, self ,"DIA_Ziggy_RUDA_15_05"); //O Innosie. Co za têpak.
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
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_01"); //No I jak masz ju¿ jakiœ plan na zdobycie fortuny przyjacielu?
    AI_Output (other, self ,"DIA_Ziggy_YOU_HAVEAPLAN_15_02"); //Mój plan jest taki... Ty zostajesz a ja idê dalej.
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_03"); //To gdzie ten milion bry³ek rudy w twoim planie?
    AI_Output (other, self ,"DIA_Ziggy_YOU_HAVEAPLAN_15_04"); //Raczej w twoich snach. A teraz spadaj!
    AI_Output (self, other ,"DIA_Ziggy_YOU_HAVEAPLAN_03_05"); //Dobra myœl spokojnie. Nie zaszkodzi jak chwilê pomilczê.
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
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_01"); //Hej mi³o ciê widzieæ stary! Jak tam dorobi³eœ siê ju¿ czegoœ?
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_02"); //G³ównie kilku siniaków...
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_03"); //To kiepsko. W³aœnie trafi³em tu z Kot³a. A ponoæ tam sta³o siê coœ nieprzyjemnego.
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_04"); //Stra¿nicy znienacka wpadli I wszystkich wymordowali.
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_05"); //Cholera. Wiesz coœ wiêcej?
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_06"); //Nie. Ale chcia³em ciê pocieszyæ. Najwiêksza persona tamtejszej spo³ecznoœci prze¿y³a.
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_07"); //Kto taki?
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_08"); //Jak to kto? Ja!
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_09"); //Bogowie... 
    AI_Output (self, other ,"DIA_Ziggy_HICH4_03_10"); //Bogowie niech nam pomog¹ w dorobieniu siê fortuny!
    AI_Output (other, self ,"DIA_Ziggy_HICH4_15_11"); //Wola³bym ¿eby najpierw ciê st¹d wyteleportowali...
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
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_01"); //Cholera , chcia³bym wiedzieæ co u mojego brata na tle aktualnych wydarzeñ.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_02"); //Mo¿e móg³byœ siê dowiedzieæ? Ale nie przyprowadzaj go do mnie bo wyda siê , ¿e nic nie mam .... Znaczy póki co!
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_03"); //Mam lepsze rzeczy do roboty.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_04"); //To nie w porz¹dku by tak odrzucaæ proœbê kumpla. Mój brat to równy goœæ. W³aœnie wspomina³em nasze dzieciñstwo jak mama czyta³a nam bajki.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_05"); //Nasz¹ ulubion¹ by³a chyba ,,Zaklêta w pe³zacza" chocia¿ w sumie....
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_06"); //Racz odpuœciæ mi te wzruszaj¹ce wspominki. Delikatnie mówi¹c mam co robiæ.
    AI_Output (self, other ,"DIA_Ziggy_CH5_03_07"); // W razie czego wiesz gdzie mnie szukaæ.
    AI_Output (other, self ,"DIA_Ziggy_CH5_15_08"); //Raczej jakie miejsce omijaæ....
    AI_StopProcessInfos	(self);
};

