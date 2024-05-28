//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_John_EXIT(C_INFO)
{
	npc             = Grd_40062_John;
	nr              = 999;
	condition	= DIA_John_EXIT_Condition;
	information	= DIA_John_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_John_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_John_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_John_HELLO1 (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_HELLO1_Condition;
   information  = DIA_John_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_John_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_John_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_John_HELLO1_03_01"); //Ej ty zatrzymaj siê!
    AI_Output (other, self ,"DIA_John_HELLO1_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_John_HELLO1_03_03"); //Mam dla ciebie atrakcyjn¹ oferte. Dostaniesz szybk¹ I ³atw¹ rudê. I to ca³kiem sporo.
    AI_Output (other, self ,"DIA_John_HELLO1_15_04"); //Gdzie jest podstêp?
    AI_Output (self, other ,"DIA_John_HELLO1_03_05"); //Nigdzie. Po prostu wykonasz dla mnie pewne zadanie. £atwy zysk a misja i misja banalna mimo, ¿e zwi¹zana z Magami.
	  
	  
	  
	  

    Info_ClearChoices	(DIA_John_HELLO1);
    Info_AddChoice		(DIA_John_HELLO1, "W porz¹dku. Mów dalej", DIA_John_Blachostka_Tak);	  
	Info_AddChoice		(DIA_John_HELLO1, "Nie jestem zainteresowany", DIA_John_Blachostka_Nie);	  
	  
};


FUNC VOID DIA_John_Blachostka_Tak()
{
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_01"); //W porz¹dku mów dalej
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_02"); //Widzê, ¿e jesteœ ambitny ale mam dla ciebie jeszcze drobne zadanko kwalifikacyjne.
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_03"); //Co to za ,,zadanko”?
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_04"); //Pewien Kopacz imieniem Fallon zalega mi od dawna z rud¹. Jeszcze z czasów gdy zbiera³em datki na ochronê. 
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_05"); //Ale póŸniej otrzyma³em inne zadania haha...
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_06"); //Wydajesz siê mieæ tu doœæ mocn¹ pozycjê. Dlaczego sam nie odbierzesz nale¿noœci od tego Kopacza.
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_07"); //Tak wa¿na persona jak ja nie ma czasu na jakieœ bzdety tego pokroju. Co innego dla ciebie ch³opczê.
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_08"); //Gdzie znajdê tego Fallona?
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_09"); //Poszukaj tego brudnego parcha w okolicach targowiska.
	Log_CreateTopic		(Blachostka,	LOG_MISSION);
	Log_SetTopicStatus	(Blachostka,	LOG_RUNNING);
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_10"); //W porz¹dku. Pomówiê z nim.
	B_LogEntry               (Blachostka,"Zgodzi³em siê na propozycjê Stra¿nika imieniem John. Muszê odzyskaæ zaleg³¹ rudê któr¹ Fallon wisi Johnowi by³o tego oko³o 50 bry³ek, znajdê go na targowisku.");
	
	Fallon_Nugget   = TRUE;
	AI_StopProcessInfos	(self);
};


FUNC VOID DIA_John_Blachostka_Nie()
{
    AI_Output (other, self ,"DIA_John_Blachostka_Nie_15_01"); //Nie jestem zainteresowany
    AI_Output (self, other ,"DIA_John_Blachostka_Nie_03_02"); //Widzê, ¿e jesteœ tylko tchórzliwym ch³optasiem. A nie mê¿czyzn¹ z krwi I koœci. ZejdŸ mi z oczu bêcwale. 
    AI_Output (other, self ,"DIA_John_Blachostka_Nie_15_03"); //Z przyjemnoœci¹.
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Fallon_dlug
//========================================

INSTANCE DIA_John_Fallon_dlug (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_Fallon_dlug_Condition;
   information  = DIA_John_Fallon_dlug_Info;
   permanent	= FALSE;
   description	= "Mam d³ug Fallona.";
};

FUNC INT DIA_John_Fallon_dlug_Condition()
{
if (Fallon_Dlug == TRUE)
&& (Npc_HasItems (other, Itminugget) >=50)
{
    return TRUE;
};
};
FUNC VOID DIA_John_Fallon_dlug_Info()
{
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_01"); //Mam d³ug Fallona.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_02"); //Hmmm... No I bardzo dobrze. Na pewno ten padalec rzuca³ siê, ¿e nie jest mi nic winien.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_03"); //Tak by³o. Szczerze mówi¹c wygl¹da³ doœæ wiarygodnie.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_04"); //To tylko pozory ch³opczê. Stary goblin chcia³ siê wy³gaæ. Ot co.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_05"); //Czy mo¿emy teraz przejœæ do w³aœciwej sprawy o, któr¹ mnie zaczepi³eœ?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_06"); //Jasne panie zdolniacho. A teraz s³uchaj.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_07"); //Potrzebuje pewnego unikalnego zaklêcia. A tak siê sk³ada, ¿e maj¹ go Magowie Ognia. I tylko oni.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_08"); //Dlaczego sam do nich nie pójdziesz?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_09"); //Mia³em z nimi drobn¹ sprzeczkê ale nie rozdrapujmy ran... Po prostu nie jestem tam mile widziany.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_10"); //Co to za zaklêcie?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_11"); //Czar zwany ,,Kling¹ Ognia”. Niezwykle potê¿ny.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_12"); //W¹tpie czy Magowie oddadz¹ go dobrowolnie.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_13"); //He... A kto powiedzia³, ¿e maj¹ oddaæ po dobroci. Kombinuj ch³opczê. W tej Kolonii kto tego nie robi, szybko koñczy w piachu jedzony przez robale.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_14"); //Na pocz¹tku po prostu zapytaj czy go nie sprzedadz¹. A potem wymyœl coœ.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_15"); //Porozmawiam z Magami.
	B_GiveInvItems (other,self, itminugget, 50);
	B_LogEntry               (Blachostka,"Po oddaniu rudy kopacza John zaproponowa³ bym spróbowa³ zdobyæ od Magów Ognia zaklêcie zwane ,, Kling¹ Ognia”. Mam je spróbowaæ od nich kupiæ a jak siê nie uda zdobyæ w inny sposób. Tylko w jaki?");
	B_Corristo_talk = TRUE;
	B_GiveXP(100);
};


//========================================
//-----------------> B_Zaklecie
//========================================

INSTANCE DIA_John_B_Zaklecie (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_B_Zaklecie_Condition;
   information  = DIA_John_B_Zaklecie_Info;
   permanent	= FALSE;
   description	= "Mam zaklêcie, które chcia³eœ.";
};

FUNC INT DIA_John_B_Zaklecie_Condition()
{
if (Npc_HasItems (other, ItMi_BLA_ZWOJ) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_John_B_Zaklecie_Info()
{
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_01"); //Mam zaklêcie, które chcia³eœ.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_02"); //Brawo! Zdolniacha z ciebie m³ody!
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_03"); //Coœ w tym jest...
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_04"); //A teraz daj mi ten czar.
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_05"); //Najpierw ruda.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_06"); //Masz, trzymaj. Zas³u¿y³eœ na ni¹.
	B_GiveInvItems (other,self, ItMi_BLA_ZWOJ, 1);
	B_GiveInvItems (self,other, itminugget, 200);
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_07"); //Dziêkuje. A oto zwój z zaklêciem.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_08"); //No i takie biznesy to rozumiem. 
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_09"); //A teraz mo¿esz ju¿ iœæ. Muszê pomówiæ z tym I owym... ¯egnaj przyjacielu.
	MiltenBla_Day = Wld_GetDay();
	B_LogEntry               (Blachostka,"Napad³em I zabi³em kuriera Magów. Zabra³em mu klucze I mogê dostaæ siê do wie¿y Magów. Ale zada³em sobie pytanie – Po co to robiê? Cholera, ju¿ za póŸno by siê wycofaæ. Mog³em jednak odrzuciæ ofertê Johna. Odda³em Johnowi czar, który chcia³ zdobyæ. Wyp³aci³ mi nagrodê ale mam z³e przeczucia. Wydaje mi siê, ¿e to koniec tej sprawy.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Blachostka_END
//========================================

INSTANCE DIA_John_Blachostka_END (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_Blachostka_END_Condition;
   information  = DIA_John_Blachostka_END_Info;
   permanent	= FALSE;
   description	= "Wykorzysta³eœ mnie do swoich niecnych gierek!";
};

FUNC INT DIA_John_Blachostka_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_PC_MAGE_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_John_Blachostka_END_Info()
{

    AI_Output (other, self ,"DIA_John_Blachostka_END_15_01"); //Wykorzysta³eœ mnie do swoich niecnych gierek!
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_02"); //Nie wiem o czym mówisz...
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_03"); //Mag Wody Cronos zosta³ zaatakowany zaklêciem, które ci da³em.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_04"); //Hahah, które ukrad³eœ.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_05"); //Jesteœ tylko pionkiem na szachownicy ch³opcze. A prawdziwi gracze siedz¹ przy stole.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_06"); //Ale wiedz, ¿e trzymam z nimi. A nawet z najwiêkszym z nich.
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_07"); //Chodzi ci o Gomeza?
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_08"); //No w³aœnie. To najpotê¿niejszy cz³owiek w Kolonii. A ci, którzy z nim trzymaj¹ s¹ tutaj wa¿nymi osobami.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_09"); //No i chyba zrazi³em kogoœ do Starego Obozu haha... Ale wiedz, ¿e warto byæ jednym z nas. Wtedy ¿aden Najemnik, Bandyta czy æpun z Sekty ci nie podskoczy.
	}
	
	
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_10"); //Nikomu ani s³owa, o tym ¿e ci pomog³em.
    AI_Output (self,other  ,"DIA_John_Blachostka_END_03_11"); //Dobrze. Zas³u¿y³eœ na tê przys³ugê.
	
    B_LogEntry               (Blachostka,"Ten sukinsyn John po prostu mnie wyœmia³. Przyzna³ siê bezczelnie do tego co zrobi³ ale obieca³, ¿e nie wyjawi nikomu faktu o moim udziale w tym spisku. Nie bardzo wierzê temu podstêpnemu gadowi. Mimo, ¿e ostatecznie pochwali³ moje zdolnoœci.");
	Log_SetTopicStatus	(Blachostka,	LOG_SUCCESS);
	B_GiveXP(500);
	
	
	Info_ClearChoices	(DIA_John_Blachostka_END);
    Info_AddChoice		(DIA_John_Blachostka_END, "Zmywam siê.", DIA_John_LEFT);
    Info_AddChoice		(DIA_John_Blachostka_END, "Jednak nie! Nie odpuszczê Ci", DIA_John_LESSON);
  
};
FUNC VOID DIA_John_LEFT()
{
    AI_Output (other, self ,"DIA_John_LEFT_15_01"); //Zmywam siê.
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_John_LESSON()
{
    AI_Output (other, self ,"DIA_John_LESSON_15_01"); //Jednak nie! Nie odpuszczê Ci
    AI_Output (self, other ,"DIA_John_LESSON_03_02"); //Co takiego? Czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_John_LESSON_15_03"); //Przyznasz siê, ¿e to ty okrad³eœ Magów Ognia.
    AI_Output (self, other ,"DIA_John_LESSON_03_04"); //Pff... A jakim sposobem? Zmusisz mnie?
    AI_Output (other, self ,"DIA_John_LESSON_15_05"); //Dok³adnie.
    AI_Output (self, other ,"DIA_John_LESSON_03_06"); //Zatem s³ucham na jaki¿ to sposób ukarania mnie wpad³eœ!
    John_Fight = TRUE;
	Info_ClearChoices	(DIA_John_Blachostka_END);
};

 //========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_John_FIGHT (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_FIGHT_Condition;
   information  = DIA_John_FIGHT_Info;
   permanent	= FALSE;
   description	= "Wyzywam ciê do walki na arenie!";
};

FUNC INT DIA_John_FIGHT_Condition()
{ 
  if (John_Fight == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_John_FIGHT_Info()
{
    AI_Output (other, self ,"DIA_John_FIGHT_15_01"); //Wyzywam ciê do walki na arenie!
    AI_Output (self, other ,"DIA_John_FIGHT_03_02"); //Haha... Zadziorny kogucik. A tacy s¹ najlepsi by daæ im po g³owie.
    AI_Output (self, other ,"DIA_John_FIGHT_03_03"); //Jeœli mnie pokonasz co niemo¿liwe... To og³oszê Magom, ¿e to ja jestem z³odziejem tego czaru.
    AI_Output (self, other ,"DIA_John_FIGHT_03_04"); //Widzê te¿, ¿e chyba mi nie odpuœcisz a to sprawia, ¿e...
    AI_Output (other, self ,"DIA_John_FIGHT_15_05"); //Wstawaj I walcz!
    AI_Output (self, other ,"DIA_John_FIGHT_03_06"); //Dobra chodŸmy na arene I miejmy to ju¿ z g³owy.
	B_LogEntry               (Blachostka,"Po chwili wachania postawi³em siê Johnowi I wyzwa³em go do walki na arenie. Powiedzia³, ¿e jeœli go pokonam to ujawni Magom, ¿e to on sta³ za ostatnim rabunkiem. Obawiam siê, ¿e jeœli przegram to John dobije mnie. Gra toczy siê o najwy¿sz¹ stawkê.");
	Npc_ExchangeRoutine (self,"fight");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fightgo
//========================================

INSTANCE DIA_John_Fightgo (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_Fightgo_Condition;
   information  = DIA_John_Fightgo_Info;
   permanent	= FALSE;
   description	= "Walczmy";
};

FUNC INT DIA_John_Fightgo_Condition()
{
if (Npc_KnowsInfo(hero,DIA_John_FIGHT))
&& (Npc_GetDistToWP(hero,"OCR_ARENA_BUY")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_John_Fightgo_Info()
{
    AI_Output (other, self ,"DIA_John_Fightgo_15_01"); //Walczmy.
    AI_Output (self, other ,"DIA_John_Fightgo_03_02"); //Widzimy sie na arenie ch³optasiu.
	 Npc_ExchangeRoutine(Grd_40062_John,"Arena");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> WAR
//========================================

INSTANCE DIA_John_WAR (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 2;
   condition    = DIA_John_WAR_Condition;
   information  = DIA_John_WAR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_John_WAR_Condition()
{
if (Npc_KnowsInfo(hero,DIA_John_Fightgo))
&& (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_John_WAR_Info()
{
    AI_Output (self, other ,"DIA_John_WAR_03_01"); //Na co czekasz?! Wyci¹gaj swój sztylecik.
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
  
};


//========================================
//-----------------> HI_JOH
//========================================

INSTANCE DIA_John_HI_JOH (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_HI_JOH_Condition;
   information  = DIA_John_HI_JOH_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_John_HI_JOH_Condition()
{
    return TRUE;
};

FUNC VOID DIA_John_HI_JOH_Info()
{
    AI_Output (other, self ,"DIA_John_HI_JOH_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_John_HI_JOH_03_02"); //Jak deszcz na pobojowisko ch³optasiu. Kim jesteœ?
    AI_Output (other, self ,"DIA_John_HI_JOH_15_03"); //Jestem…
    AI_Output (self, other ,"DIA_John_HI_JOH_03_04"); //Nowym skazañcem. Bo kim¿e innym.
    AI_Output (other, self ,"DIA_John_HI_JOH_15_05"); //A Ty?
    AI_Output (self, other ,"DIA_John_HI_JOH_03_06"); //Stra¿nikiem. Dobrym w swoim fachu I jestem tu ju¿ jakiœ czas.
    AI_Output (other, self ,"DIA_John_HI_JOH_15_07"); //Trudno by³o do³¹czyæ do stra¿y?
    AI_Output (self, other ,"DIA_John_HI_JOH_03_08"); //Jeœli jesteœ silny mentalnie, intelektualnie I masz twarde miêœnie to dasz radê. 
    AI_Output (other, self ,"DIA_John_HI_JOH_15_09"); //Chcia³em jeszcze zapytaæ…
    AI_Output (self, other ,"DIA_John_HI_JOH_03_10"); //Doœæ tego przes³uchania. W razie czego to ja przes³uchuje, rozumiesz ch³opcze?
};



//========================================
//-----------------> FIGHT_END
//========================================

INSTANCE DIA_John_FIGHT_END (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 2;
   condition    = DIA_John_FIGHT_END_Condition;
   information  = DIA_John_FIGHT_END_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_John_FIGHT_END_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_John_WAR))
  && (Grd_40062_John.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_John_FIGHT_END_Info()
{
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_01"); //W mordê...
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_02"); //W³aœnie po niej dosta³eœ.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_03"); //Milcz. Nie wierzê, ¿e przegra³em z takim ¿ó³todziobem.
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_04"); //A jednak. Teraz wspólnie pójdziemy do siedziby Magów.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_05"); //Nie ma mowy. Precz mi z oczu bo zawo³am swoich kumpli. A tego byœ nie chcia³.
    AI_Output (other,self  ,"DIA_John_FIGHT_END_15_06"); //Trudno. Przynajmniej da³em ci w koœæ za to, ¿e wmiesza³eœ mnie w to gówno.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_07"); //Moje koœci... Pewnie masz siê za bohatera ch³opcze ale Kolonia po¿ar³a I zwóci³a ju¿ wielu takich.
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_08"); //Zapewne. A teraz ju¿ bêdê siê zbiera³. Polecam siê na przysz³oœæ.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_09"); //Spadaj.
	B_LogEntry               (Blachostka,"John dosta³ za swoje. Jednak ten drab po raz kolejny mnie oszuka³. Nie przyzna siê do wszystkiego Magom Ognia. Pokonuj¹c go naby³em nieco doœwiadczenia ale wiêcej ju¿ nie wskóram w tej sprawie.");
	Npc_ExchangeRoutine(self,"Start");
	B_GiveXP(500);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Fightdie
//========================================

INSTANCE DIA_John_Fightdie (C_INFO)
{
   npc          = Grd_40062_John;
   nr           = 1;
   condition    = DIA_John_Fightdie_Condition;
   information  = DIA_John_Fightdie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_John_Fightdie_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_John_WAR))
&& (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_John_Fightdie_Info()
{
    AI_Output (self, other ,"DIA_John_Fightdie_03_01"); //Wynoœ siê, st¹d nim cie poæwiartujê ofermo.
	B_LogEntry               (Blachostka,"John darowa³ mi ¿ycie, by³ wœciek³y. Chyba nici z jego przyznania siê do kradzie¿y");
	Npc_ExchangeRoutine(self,"Start");
    AI_StopProcessInfos	(self);
};

instance dia_john_pickpocket(c_info) {
    npc = grd_40062_john;
    nr = 900;
    condition = dia_john_pickpocket_condition;
    information = dia_john_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_john_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_john_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_john_pickpocket);
	info_addchoice(dia_john_pickpocket, dialog_back, dia_john_pickpocket_back);
	info_addchoice(dia_john_pickpocket, dialog_pickpocket, dia_john_pickpocket_doit);
};

func void dia_john_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_john_pickpocket);
};

func void dia_john_pickpocket_back() {
    info_clearchoices(dia_john_pickpocket);
};















