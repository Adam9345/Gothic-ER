//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Lorenzo_EXIT(C_INFO)
{
	npc             = STT_5013_Lorenzo;
	nr              = 999;
	condition		= DIA_Lorenzo_EXIT_Condition;
	information		= DIA_Lorenzo_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Lorenzo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lorenzo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Lorenzo_HELLO1 (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_HELLO1_Condition;
   information  = DIA_Lorenzo_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Lorenzo_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lorenzo_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Lorenzo_HELLO1_03_02"); //A coœ ty za jeden, ¿e ciê to interesuje? Chcesz pracowaæ w Kopalni? Za³atwiam zmiany i ludzi do pracy Ianowi.
	AI_Output (self, other ,"DIA_Lorenzo_HELLO1_03_03"); //Nie ma siê czego baæ. Uczciwa praca ka¿demu siê przyda. No co siê tak gapisz?
};

//========================================
//-----------------> YOURWORK
//========================================

INSTANCE DIA_Lorenzo_YOURWORK (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_YOURWORK_Condition;
   information  = DIA_Lorenzo_YOURWORK_Info;
   permanent	= 0;
   description	= "Na czym dok³adnie polega twoja praca?";
};

FUNC INT DIA_Lorenzo_YOURWORK_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lorenzo_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_YOURWORK_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_YOURWORK_15_01"); //Na czym dok³adnie polega twoja praca?
    AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_02"); //Cholera, co za upierdliwy typ. Dbam o to, by ró¿ne szumowiny bez przysz³oœci mia³y co robiæ. Organizujê zmiany ludzi do Starej Kopalni i przyjmujê nowych.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_03"); //To JA decydujê kogo Artegor przepuszcza, a kto dostaje kopa w dupê.
	AI_Output (other, self ,"DIA_Lorenzo_YOURWORK_15_04"); //Do Kopalni nie mo¿na swobodnie wchodziæ? 
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_05"); //Nie! I to ju¿ od jakiegoœ czasu. Có¿, rozporz¹dzenie odgórne. Po korytarzach i magazynach pod ziemi¹ krêci³o siê zbyt du¿o obiboków i marnych z³odziejaszków.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_06"); //Szczególnie tych brudasów z Nowego Obozu. Wszêdzie siê wepchaj¹. Kupowali ubrania od Kopaczy, przekupywali Stra¿ników, a niektórzy durnie nawet próbowali ich zastraszaæ.
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_07"); //Ale takie numery to nie z naszymi ludŸmi. Teraz te bandziory dyndaj¹ na wietrze, he he...
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_08"); //A i pamiêtaj: moi ludzie to Graham i Petro, tak¿e nie wkurzaj ich, bo to silne ch³opaki. 
	AI_Output (self, other ,"DIA_Lorenzo_YOURWORK_03_09"); //Graham mo¿e wygl¹da niepozornie, ale to bardzo dobry rysownik i kartograf. Niezwykle przydatny cz³owiek.
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_Lorenzo_PERM (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_PERM_Condition;
   information  = DIA_Lorenzo_PERM_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_Lorenzo_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lorenzo_PERM_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_PERM_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Lorenzo_PERM_03_02"); //Mhm...
	AI_Output (other, self ,"DIA_Lorenzo_PERM_15_03"); //Co?
	AI_Output (self, other ,"DIA_Lorenzo_PERM_03_04"); //Jazda do roboty, a nie mi siê po chacie bêdziesz krêci³!
};


//========================================
//-----------------> BRINGLIST
//========================================

INSTANCE DIA_Lorenzo_BRINGLIST (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_BRINGLIST_Condition;
   information  = DIA_Lorenzo_BRINGLIST_Info;
   permanent	= 0;
   description	= "Potrzebujê przepustki do Kopalni.";
};

FUNC INT DIA_Lorenzo_BRINGLIST_Condition()
{
	if  (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_BRINGLIST_Info()
{

    AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_01"); //Potrzebujê przepustki do Kopalni.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_02"); //A ja potrzebujê flaszki najlepszego wina na Khorinis i czterech nowych ludzi do pracy. Jak widzisz nie mo¿emy sobie pomóc.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_03"); //Za³atwiê ludzi.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_04"); //Ambitny, co? Po grzyba ci ta przepustka? Szukasz uczciwej pracy?
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_05"); //Diego zleci³ mi pewne zadanie...
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_06"); //Ha ha... Diego zleci³... Doprawdy? Nie mogê ci wydaæ przepustki.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_07"); //A to dlaczego?
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_08"); //To proste. Nie mam ludzi do pracy, wiêc jak chcesz dostaæ siê do Kopalni, bêdziesz musia³ zostaæ Kopaczem. Za³atwisz mi jeszcze trzech ludzi i wyruszycie od razu.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_09"); //Gdy ju¿ znajdziesz siê pod ziemi¹, wtedy wykonasz swoje zlecenie i mo¿e Ian uwierzy w twoj¹ historyjkê.
	AI_Output (other, self ,"DIA_Lorenzo_BRINGLIST_15_10"); //A jeœli tego nie zrobi? Znaj¹c was, jest to bardzo mo¿liwe.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_11"); //Wtedy bêdziesz musia³ chwyciæ za kilof i zacz¹æ kopaæ. Im szybciej wykopiesz rudê, tym szybciej spotkasz siê z powrotem z Diegiem.
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_12"); //O ile to co mówisz jest prawd¹...
	
	
	MIS_ZmianaLorenza = LOG_RUNNING;
	Log_CreateTopic          (Ch1_ZmianaLorenza, LOG_MISSION);
    Log_SetTopicStatus       (Ch1_ZmianaLorenza, LOG_RUNNING);
    B_LogEntry               (Ch1_ZmianaLorenza,"Jeœli chcê wejœæ do Starej Kopalni, bêdê musia³ zostaæ Kopaczem. Lorenzo nie da³ mi nawet cienia nadziei na to, ¿e za³atwi mi przepustkê. Muszê za³atwiæ trzech nowych ludzi na zmianê do pracy w Kopalni. Najlepiej pogadaæ z Kopaczami bêd¹cymi w Obozie.");
	}
	else
	{
	AI_Output (self, other ,"DIA_Lorenzo_BRINGLIST_03_13"); //Zje¿d¿aj, dobra?!
	AI_StopProcessInfos (self);
	};
};

//========================================
//-----------------> OFERTA
//========================================

INSTANCE DIA_Lorenzo_OFERTA (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_OFERTA_Condition;
   information  = DIA_Lorenzo_OFERTA_Info;
   permanent	= 0;
   description	= "Podobno trzeba odnieœæ raport do zamku.";
};

FUNC INT DIA_Lorenzo_OFERTA_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_LorenzoCourier)) && MIS_ZmianaLorenza == LOG_RUNNING
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_OFERTA_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_OFERTA_15_01"); //Podobno trzeba odnieœæ raport z Kopalni do zamku. Przeczyta³eœ go ju¿?
    AI_Output (self, other ,"DIA_Lorenzo_OFERTA_03_02"); //Ha ha! Spryciarz! Myœlisz, ¿e w ten sposób dostaniesz siê do zamku? Nie tak ³atwo kolego. Raport PRZED CHWIL¥ trafi³ do Eckera.
	AI_Output (self, other ,"DIA_Lorenzo_OFERTA_03_03"); //Trochê siê spóŸni³eœ.
	B_LogEntry(CH1_ZmianaLorenza, "Idealnie siê z³o¿y³o. Raport w³aœnie przed chwil¹ trafi³ w rêce Cienia Eckera. Muszê go szybko ukraœæ.");
};

//========================================
//-----------------> ITS_ALL
//========================================

INSTANCE DIA_Lorenzo_ITS_ALL (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_ITS_ALL_Condition;
   information  = DIA_Lorenzo_ITS_ALL_Info;
   permanent	= 0;
   description	= "Mam ju¿ trzech ludzi do pracy!";
};

FUNC INT DIA_Lorenzo_ITS_ALL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Erens_NALDURLOSE)) && (Npc_KnowsInfo (hero, DIA_Urban_OHMYHEAD)) && TogardPrzekonany == true && MIS_ZmianaLorenza == LOG_RUNNING
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_ITS_ALL_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_ITS_ALL_15_01"); //Mam ju¿ trzech ludzi do pracy!
    AI_Output (self, other ,"DIA_Lorenzo_ITS_ALL_03_02"); //Dobra robota. Bêd¹ z ciebie ludzie. Myœlê, ¿e mogê ciê teraz przyj¹æ do Kopaczy. Wtedy uzyskasz dostêp do wnêtrza Kopalni.
	AI_Output (self, other ,"DIA_Lorenzo_ITS_ALL_03_03"); //Chcesz tego?
	
	B_LogEntry                     (CH1_ZmianaLorenza,"Zorganizowa³em zmianê do Kopalni. Mogê teraz zostaæ Kopaczem, a tym samym do³¹czyæ do Starego Obozu i zrobiæ pierwszy krok ku zostaniu Cieniem.");
    Log_SetTopicStatus       (CH1_ZmianaLorenza, LOG_SUCCESS);
    MIS_ZmianaLorenza = LOG_SUCCESS;
};

//========================================
//-----------------> GET_GUILD
//========================================

INSTANCE DIA_Lorenzo_GET_GUILD (C_INFO)
{
   npc          = STT_5013_Lorenzo;
   nr           = 1;
   condition    = DIA_Lorenzo_GET_GUILD_Condition;
   information  = DIA_Lorenzo_GET_GUILD_Info;
   permanent	= 0;
   description	= "Chcê zostaæ Kopaczem.";
};

FUNC INT DIA_Lorenzo_GET_GUILD_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lorenzo_ITS_ALL)) && (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Lorenzo_GET_GUILD_Info()
{
    AI_Output (other, self ,"DIA_Lorenzo_GET_GUILD_15_01"); //Chcê zostaæ Kopaczem.
    AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_02"); //Rozs¹dny wybór skoro naprawdê chcesz siê dostaæ do Starej Kopalni. Petro czeka ju¿ przed Obozem. Zaprowadzi was do Kopalni. 
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_03"); //Przy wejœciu zaczepi ciê Artegor. Powiedz, ¿e przysy³a ciê Lorenzo i ¿e do nas do³¹czy³eœ. Nie powinien robiæ k³opotów. 
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_04"); //Zw³aszcza jeœli zobaczy z wami Petro. Gdy ju¿ wejdziesz do Kopalni, twoim zwierzchnikiem stanie siê Ian. To on rz¹dzi w Kopalni.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_05"); //Byæ mo¿e ³yknie twoj¹ historiê o zadaniu dla Diego. Jeœli nie, to bêdziesz musia³ wykopaæ okreœlon¹ iloœæ rudy. Ale to ju¿ z nim uzgodnisz.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_06"); //Acha, nie dostaniesz od nas ¿adnego pancerza. Kup sobie ubranie robocze u Fiska, jeœli jeszcze tego nie zrobi³eœ.
	AI_Output (self, other ,"DIA_Lorenzo_GET_GUILD_03_07"); //Jako ¿e dobrze siê spisa³eœ z t¹ zmian¹, mogê czêœciowo ufundowaæ ci uniform. Te sto bry³ek rudy bêdzie w sam raz na pocz¹tek. 
	
	CreateInvItems (self, itminugget,100);
	B_GiveInvItems (self,other,itminugget,100);
	B_GiveXP (XP_BecomeVlk);
	B_LogEntry     (CH1_BringList,"Do³¹czy³em do Kopaczy, wiêc nie bêdê mia³ ju¿ problemów z wejœciem do Starej Kopalni.");
	hero.guild = GIL_VLK;
	Npc_SetTrueGuild (hero,GIL_VLK);
	HeroJoinToOC ();
	
	
};