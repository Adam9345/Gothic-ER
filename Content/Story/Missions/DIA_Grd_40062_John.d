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
    AI_Output (self, other ,"DIA_John_HELLO1_03_01"); //Ej ty zatrzymaj si�!
    AI_Output (other, self ,"DIA_John_HELLO1_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_John_HELLO1_03_03"); //Mam dla ciebie atrakcyjn� oferte. Dostaniesz szybk� I �atw� rud�. I to ca�kiem sporo.
    AI_Output (other, self ,"DIA_John_HELLO1_15_04"); //Gdzie jest podst�p?
    AI_Output (self, other ,"DIA_John_HELLO1_03_05"); //Nigdzie. Po prostu wykonasz dla mnie pewne zadanie. �atwy zysk a misja i misja banalna mimo, �e zwi�zana z Magami.
	  
	  
	  
	  

    Info_ClearChoices	(DIA_John_HELLO1);
    Info_AddChoice		(DIA_John_HELLO1, "W porz�dku. M�w dalej", DIA_John_Blachostka_Tak);	  
	Info_AddChoice		(DIA_John_HELLO1, "Nie jestem zainteresowany", DIA_John_Blachostka_Nie);	  
	  
};


FUNC VOID DIA_John_Blachostka_Tak()
{
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_01"); //W porz�dku m�w dalej
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_02"); //Widz�, �e jeste� ambitny ale mam dla ciebie jeszcze drobne zadanko kwalifikacyjne.
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_03"); //Co to za ,,zadanko�?
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_04"); //Pewien Kopacz imieniem Fallon zalega mi od dawna z rud�. Jeszcze z czas�w gdy zbiera�em datki na ochron�. 
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_05"); //Ale p�niej otrzyma�em inne zadania haha...
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_06"); //Wydajesz si� mie� tu do�� mocn� pozycj�. Dlaczego sam nie odbierzesz nale�no�ci od tego Kopacza.
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_07"); //Tak wa�na persona jak ja nie ma czasu na jakie� bzdety tego pokroju. Co innego dla ciebie ch�opcz�.
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_08"); //Gdzie znajd� tego Fallona?
    AI_Output (self, other ,"DIA_John_Blachostka_Tak_03_09"); //Poszukaj tego brudnego parcha w okolicach targowiska.
	Log_CreateTopic		(Blachostka,	LOG_MISSION);
	Log_SetTopicStatus	(Blachostka,	LOG_RUNNING);
    AI_Output (other, self ,"DIA_John_Blachostka_Tak_15_10"); //W porz�dku. Pom�wi� z nim.
	B_LogEntry               (Blachostka,"Zgodzi�em si� na propozycj� Stra�nika imieniem John. Musz� odzyska� zaleg�� rud� kt�r� Fallon wisi Johnowi by�o tego oko�o 50 bry�ek, znajd� go na targowisku.");
	
	Fallon_Nugget   = TRUE;
	AI_StopProcessInfos	(self);
};


FUNC VOID DIA_John_Blachostka_Nie()
{
    AI_Output (other, self ,"DIA_John_Blachostka_Nie_15_01"); //Nie jestem zainteresowany
    AI_Output (self, other ,"DIA_John_Blachostka_Nie_03_02"); //Widz�, �e jeste� tylko tch�rzliwym ch�optasiem. A nie m�czyzn� z krwi I ko�ci. Zejd� mi z oczu b�cwale. 
    AI_Output (other, self ,"DIA_John_Blachostka_Nie_15_03"); //Z przyjemno�ci�.
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
   description	= "Mam d�ug Fallona.";
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
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_01"); //Mam d�ug Fallona.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_02"); //Hmmm... No I bardzo dobrze. Na pewno ten padalec rzuca� si�, �e nie jest mi nic winien.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_03"); //Tak by�o. Szczerze m�wi�c wygl�da� do�� wiarygodnie.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_04"); //To tylko pozory ch�opcz�. Stary goblin chcia� si� wy�ga�. Ot co.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_05"); //Czy mo�emy teraz przej�� do w�a�ciwej sprawy o, kt�r� mnie zaczepi�e�?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_06"); //Jasne panie zdolniacho. A teraz s�uchaj.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_07"); //Potrzebuje pewnego unikalnego zakl�cia. A tak si� sk�ada, �e maj� go Magowie Ognia. I tylko oni.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_08"); //Dlaczego sam do nich nie p�jdziesz?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_09"); //Mia�em z nimi drobn� sprzeczk� ale nie rozdrapujmy ran... Po prostu nie jestem tam mile widziany.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_10"); //Co to za zakl�cie?
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_11"); //Czar zwany ,,Kling� Ognia�. Niezwykle pot�ny.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_12"); //W�tpie czy Magowie oddadz� go dobrowolnie.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_13"); //He... A kto powiedzia�, �e maj� odda� po dobroci. Kombinuj ch�opcz�. W tej Kolonii kto tego nie robi, szybko ko�czy w piachu jedzony przez robale.
    AI_Output (self, other ,"DIA_John_Fallon_dlug_03_14"); //Na pocz�tku po prostu zapytaj czy go nie sprzedadz�. A potem wymy�l co�.
    AI_Output (other, self ,"DIA_John_Fallon_dlug_15_15"); //Porozmawiam z Magami.
	B_GiveInvItems (other,self, itminugget, 50);
	B_LogEntry               (Blachostka,"Po oddaniu rudy kopacza John zaproponowa� bym spr�bowa� zdoby� od Mag�w Ognia zakl�cie zwane ,, Kling� Ognia�. Mam je spr�bowa� od nich kupi� a jak si� nie uda zdoby� w inny spos�b. Tylko w jaki?");
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
   description	= "Mam zakl�cie, kt�re chcia�e�.";
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
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_01"); //Mam zakl�cie, kt�re chcia�e�.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_02"); //Brawo! Zdolniacha z ciebie m�ody!
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_03"); //Co� w tym jest...
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_04"); //A teraz daj mi ten czar.
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_05"); //Najpierw ruda.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_06"); //Masz, trzymaj. Zas�u�y�e� na ni�.
	B_GiveInvItems (other,self, ItMi_BLA_ZWOJ, 1);
	B_GiveInvItems (self,other, itminugget, 200);
    AI_Output (other, self ,"DIA_John_B_Zaklecie_15_07"); //Dzi�kuje. A oto zw�j z zakl�ciem.
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_08"); //No i takie biznesy to rozumiem. 
    AI_Output (self, other ,"DIA_John_B_Zaklecie_03_09"); //A teraz mo�esz ju� i��. Musz� pom�wi� z tym I owym... �egnaj przyjacielu.
	MiltenBla_Day = Wld_GetDay();
	B_LogEntry               (Blachostka,"Napad�em I zabi�em kuriera Mag�w. Zabra�em mu klucze I mog� dosta� si� do wie�y Mag�w. Ale zada�em sobie pytanie � Po co to robi�? Cholera, ju� za p�no by si� wycofa�. Mog�em jednak odrzuci� ofert� Johna. Odda�em Johnowi czar, kt�ry chcia� zdoby�. Wyp�aci� mi nagrod� ale mam z�e przeczucia. Wydaje mi si�, �e to koniec tej sprawy.");
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
   description	= "Wykorzysta�e� mnie do swoich niecnych gierek!";
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

    AI_Output (other, self ,"DIA_John_Blachostka_END_15_01"); //Wykorzysta�e� mnie do swoich niecnych gierek!
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_02"); //Nie wiem o czym m�wisz...
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_03"); //Mag Wody Cronos zosta� zaatakowany zakl�ciem, kt�re ci da�em.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_04"); //Hahah, kt�re ukrad�e�.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_05"); //Jeste� tylko pionkiem na szachownicy ch�opcze. A prawdziwi gracze siedz� przy stole.
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_06"); //Ale wiedz, �e trzymam z nimi. A nawet z najwi�kszym z nich.
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_07"); //Chodzi ci o Gomeza?
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_08"); //No w�a�nie. To najpot�niejszy cz�owiek w Kolonii. A ci, kt�rzy z nim trzymaj� s� tutaj wa�nymi osobami.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
    AI_Output (self, other ,"DIA_John_Blachostka_END_03_09"); //No i chyba zrazi�em kogo� do Starego Obozu haha... Ale wiedz, �e warto by� jednym z nas. Wtedy �aden Najemnik, Bandyta czy �pun z Sekty ci nie podskoczy.
	}
	
	
    AI_Output (other, self ,"DIA_John_Blachostka_END_15_10"); //Nikomu ani s�owa, o tym �e ci pomog�em.
    AI_Output (self,other  ,"DIA_John_Blachostka_END_03_11"); //Dobrze. Zas�u�y�e� na t� przys�ug�.
	
    B_LogEntry               (Blachostka,"Ten sukinsyn John po prostu mnie wy�mia�. Przyzna� si� bezczelnie do tego co zrobi� ale obieca�, �e nie wyjawi nikomu faktu o moim udziale w tym spisku. Nie bardzo wierz� temu podst�pnemu gadowi. Mimo, �e ostatecznie pochwali� moje zdolno�ci.");
	Log_SetTopicStatus	(Blachostka,	LOG_SUCCESS);
	B_GiveXP(500);
	
	
	Info_ClearChoices	(DIA_John_Blachostka_END);
    Info_AddChoice		(DIA_John_Blachostka_END, "Zmywam si�.", DIA_John_LEFT);
    Info_AddChoice		(DIA_John_Blachostka_END, "Jednak nie! Nie odpuszcz� Ci", DIA_John_LESSON);
  
};
FUNC VOID DIA_John_LEFT()
{
    AI_Output (other, self ,"DIA_John_LEFT_15_01"); //Zmywam si�.
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_John_LESSON()
{
    AI_Output (other, self ,"DIA_John_LESSON_15_01"); //Jednak nie! Nie odpuszcz� Ci
    AI_Output (self, other ,"DIA_John_LESSON_03_02"); //Co takiego? Czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_John_LESSON_15_03"); //Przyznasz si�, �e to ty okrad�e� Mag�w Ognia.
    AI_Output (self, other ,"DIA_John_LESSON_03_04"); //Pff... A jakim sposobem? Zmusisz mnie?
    AI_Output (other, self ,"DIA_John_LESSON_15_05"); //Dok�adnie.
    AI_Output (self, other ,"DIA_John_LESSON_03_06"); //Zatem s�ucham na jaki� to spos�b ukarania mnie wpad�e�!
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
   description	= "Wyzywam ci� do walki na arenie!";
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
    AI_Output (other, self ,"DIA_John_FIGHT_15_01"); //Wyzywam ci� do walki na arenie!
    AI_Output (self, other ,"DIA_John_FIGHT_03_02"); //Haha... Zadziorny kogucik. A tacy s� najlepsi by da� im po g�owie.
    AI_Output (self, other ,"DIA_John_FIGHT_03_03"); //Je�li mnie pokonasz co niemo�liwe... To og�osz� Magom, �e to ja jestem z�odziejem tego czaru.
    AI_Output (self, other ,"DIA_John_FIGHT_03_04"); //Widz� te�, �e chyba mi nie odpu�cisz a to sprawia, �e...
    AI_Output (other, self ,"DIA_John_FIGHT_15_05"); //Wstawaj I walcz!
    AI_Output (self, other ,"DIA_John_FIGHT_03_06"); //Dobra chod�my na arene I miejmy to ju� z g�owy.
	B_LogEntry               (Blachostka,"Po chwili wachania postawi�em si� Johnowi I wyzwa�em go do walki na arenie. Powiedzia�, �e je�li go pokonam to ujawni Magom, �e to on sta� za ostatnim rabunkiem. Obawiam si�, �e je�li przegram to John dobije mnie. Gra toczy si� o najwy�sz� stawk�.");
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
    AI_Output (self, other ,"DIA_John_Fightgo_03_02"); //Widzimy sie na arenie ch�optasiu.
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
    AI_Output (self, other ,"DIA_John_WAR_03_01"); //Na co czekasz?! Wyci�gaj sw�j sztylecik.
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
    AI_Output (self, other ,"DIA_John_HI_JOH_03_02"); //Jak deszcz na pobojowisko ch�optasiu. Kim jeste�?
    AI_Output (other, self ,"DIA_John_HI_JOH_15_03"); //Jestem�
    AI_Output (self, other ,"DIA_John_HI_JOH_03_04"); //Nowym skaza�cem. Bo kim�e innym.
    AI_Output (other, self ,"DIA_John_HI_JOH_15_05"); //A Ty?
    AI_Output (self, other ,"DIA_John_HI_JOH_03_06"); //Stra�nikiem. Dobrym w swoim fachu I jestem tu ju� jaki� czas.
    AI_Output (other, self ,"DIA_John_HI_JOH_15_07"); //Trudno by�o do��czy� do stra�y?
    AI_Output (self, other ,"DIA_John_HI_JOH_03_08"); //Je�li jeste� silny mentalnie, intelektualnie I masz twarde mi�nie to dasz rad�. 
    AI_Output (other, self ,"DIA_John_HI_JOH_15_09"); //Chcia�em jeszcze zapyta�
    AI_Output (self, other ,"DIA_John_HI_JOH_03_10"); //Do�� tego przes�uchania. W razie czego to ja przes�uchuje, rozumiesz ch�opcze?
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
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_01"); //W mord�...
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_02"); //W�a�nie po niej dosta�e�.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_03"); //Milcz. Nie wierz�, �e przegra�em z takim ��todziobem.
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_04"); //A jednak. Teraz wsp�lnie p�jdziemy do siedziby Mag�w.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_05"); //Nie ma mowy. Precz mi z oczu bo zawo�am swoich kumpli. A tego by� nie chcia�.
    AI_Output (other,self  ,"DIA_John_FIGHT_END_15_06"); //Trudno. Przynajmniej da�em ci w ko�� za to, �e wmiesza�e� mnie w to g�wno.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_07"); //Moje ko�ci... Pewnie masz si� za bohatera ch�opcze ale Kolonia po�ar�a I zw�ci�a ju� wielu takich.
    AI_Output (other, self ,"DIA_John_FIGHT_END_15_08"); //Zapewne. A teraz ju� b�d� si� zbiera�. Polecam si� na przysz�o��.
    AI_Output (self, other ,"DIA_John_FIGHT_END_03_09"); //Spadaj.
	B_LogEntry               (Blachostka,"John dosta� za swoje. Jednak ten drab po raz kolejny mnie oszuka�. Nie przyzna si� do wszystkiego Magom Ognia. Pokonuj�c go naby�em nieco do�wiadczenia ale wi�cej ju� nie wsk�ram w tej sprawie.");
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
    AI_Output (self, other ,"DIA_John_Fightdie_03_01"); //Wyno� si�, st�d nim cie po�wiartuj� ofermo.
	B_LogEntry               (Blachostka,"John darowa� mi �ycie, by� w�ciek�y. Chyba nici z jego przyznania si� do kradzie�y");
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















