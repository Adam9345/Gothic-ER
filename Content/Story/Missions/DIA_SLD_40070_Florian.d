// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Florian_EXIT(C_INFO)
{
	npc             = SLD_40070_Florian;
	nr              = 999;
	condition	= DIA_Florian_EXIT_Condition;
	information	= DIA_Florian_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Florian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Florian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Florian_HELLO1 (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_HELLO1_Condition;
   information  = DIA_Florian_HELLO1_Info;
   permanent	= FALSE;
   description	= "Tak po prostu przesiadujesz w karczmie?";
};

FUNC INT DIA_Florian_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Florian_HI_FLORI))
{
    return TRUE;
};
};
FUNC VOID DIA_Florian_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_01"); //Tak po prostu przesiadujesz w karczmie?
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_02"); //To cisza przed burz¹. 
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_03"); //Jak¹ burz¹?
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_04"); //Wkrótce udam siê na zwiad w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_05"); // Lee na mnie liczy. I wywi¹¿e siê z tego zadania.
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_06"); //Co konkretnie masz wybadaæ?
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_07"); //Niepotrzebnie o tym mówiê I nie zdradzê ci wiêcej.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_08"); //Wypi³em piwko I rozwi¹za³ mi siê jêzyk. Takie coœ mo¿e kosztowaæ w kolonii g³owê.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_09"); //Wiem co mówiê.
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_10"); //W porz¹dku. Nie bêdê ju¿ dopytywa³ o twoj¹ wycieczkê.
};


//========================================
//-----------------> TMQ_ZOMBIE
//========================================

INSTANCE DIA_Florian_TMQ_ZOMBIE (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_TMQ_ZOMBIE_Condition;
   information  = DIA_Florian_TMQ_ZOMBIE_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Lee.";
};

FUNC INT DIA_Florian_TMQ_ZOMBIE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_TMQ_UNDEAD))
{
    return TRUE;
};
};
FUNC VOID DIA_Florian_TMQ_ZOMBIE_Info()
{
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_01"); //Przysy³a mnie Lee. Ponoæ widzia³eœ Zombie w szeregach Gomeza, które stanê³o przeciw wam.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_02"); //Cz³owieku ani mi o tym nie mów! Do dzisiaj mam koszmary na sam¹ myœl o tym!
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_03"); //Co dok³adnie siê sta³o?
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_04"); //W czasie jednej z potyczek pod Starym Obozem dawaliœmy ³upnia tym baranom ze Stra¿y.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_05"); //Zyskiwaliœmy przewagê ale wtedy...
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_06"); //Pojawi³ siê jakiœ m³ody Mag i zacz¹³ odprawiaæ jakiœ rytua³. Wtem martwi Stra¿nicy powstali i znów ruszyli do walki. 
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_07"); //Có¿... Czyli wszystko jasne.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_08"); //Nasi ludzie wpadli w panikê i zaczêli uciekaæ.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_09"); //Od tamtej pory morale znacznie podupad³y, skoro nawet si³y ciemnoœci wspar³y Gomeza.
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_10"); //Muszê powiadomiæ Lee i Quentina.
	B_LogEntry               (TajnaMisjaQuentina,"Florian powiedzia³, ¿e Najemnicy zyskiwali przewagê nad si³ami Gomeza kiedy pojawi³ siê jakiœ Mag i sprawi³, ¿e martwi Stra¿nicy powstali jako zombie. Muszê o tym powiedzieæ koniecznie Lee. I to szybko.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KS_WHAT
//========================================

INSTANCE DIA_Florian_KS_WHAT (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_KS_WHAT_Condition;
   information  = DIA_Florian_KS_WHAT_Info;
   permanent	= FALSE;
   description	= "Buster wspomina³, ¿e czegoœ ode mnie chcesz.";
};

FUNC INT DIA_Florian_KS_WHAT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buster_BUS_WAIT_KS))
{
    return TRUE;
};
};
FUNC VOID DIA_Florian_KS_WHAT_Info()
{
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_01"); //Buster wspomina³, ¿e czegoœ ode mnie chcesz.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_02"); //Zgadza siê. Podobno jesteœ zdolny. Mo¿esz mi siê przydaæ.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_03"); //Mam lepsze rzeczy do roboty ni¿ ,,przydawanie” siê tobie.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_04"); //Nie za darmo rzecz jasna. A i robota nie bêdzie d³uga jeœli sprawnie to rozegrasz.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_05"); //Lee interesuje kto ostatnio wyznacza sk³ad konwojów do Starej Kopalni.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_06"); //Mam to ustaliæ?
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_07"); //Tak to wa¿na sprawa. NieŸle sypnê rud¹ jeœli siê spiszesz. 
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_08"); //Spróbuje. Udam siê do Starego Obozu i trochê powêszê. 
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_09"); //Tylko nie pytaj byle kogo. To ma byæ ktoœ kto ma dostêp do najwy¿szych krêgów ale jednoczeœnie nie jest przesadnie lojalny.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_10"); //Zajmê siê tym. A ty przygotuj rudê.
    B_LogEntry                     (KuzniaStone,"Najemnik Florian chce siê dowiedzieæ kto odpowiada za sk³ad personalny konwojów do Starej Kopalni. Nim zajmê siê dostêpem do kuŸni Stone’a muszê o to popytaæ w Starym Obozie, najlepiej na zamku. Oczywiœcie nie chodzi o pogawêdkê z Gomezem.");

};

//========================================
//-----------------> KS_COVOY
//========================================

INSTANCE DIA_Florian_KS_COVOY (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_KS_COVOY_Condition;
   information  = DIA_Florian_KS_COVOY_Info;
   permanent	= FALSE;
   description	= "Wiem kto ustala sk³ad konwojów ze Starego Obozu do kopalni.";
};

FUNC INT DIA_Florian_KS_COVOY_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Omid_KS_FLOR_TAKE))
{

    return TRUE;
};
};
FUNC VOID DIA_Florian_KS_COVOY_Info()
{
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_01"); //Wiem kto ustala sk³ad konwojów ze Starego Obozu do kopalni.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_02"); //Œwietnie. A wiêc o kogo chodzi?
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_03"); //Cz³owiekiem tym jest Stra¿nik John.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_04"); //Ponoæ niezwykle przebieg³y bydlak. Hmmm... To cenna informacja
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_05"); //Muszê niezw³ocznie pomówiæ o tym z Lee.
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_06"); //Chyba o czymœ zapomnia³eœ.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_07"); //Ach tak...Wczeœniej wyp³acê ci nale¿n¹ rudê za wykonan¹ misje.
	B_GiveInvItems (self,other, itminugget, 150);
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_08"); //Dziêki. Teraz ta sprawa zostaje w twoich rêkach.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_09"); //Tak. Oby potoczy³a siê dobrze. Ale to ju¿ zale¿y ode mnie i od Lee.
	B_GiveXP(200);
	B_LogEntry                     (KuzniaStone,"Poinformowa³em Floriana kto odpowiada za dobór ludzi do konwojów Gomeza do Starej Kopalni. Otrzyma³em nale¿n¹ zap³atê.");

};

//========================================
//-----------------> HI_FLORI
//========================================

INSTANCE DIA_Florian_HI_FLORI (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_HI_FLORI_Condition;
   information  = DIA_Florian_HI_FLORI_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Florian_HI_FLORI_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Florian_HI_FLORI_Info()
{
    AI_Output (other, self ,"DIA_Florian_HI_FLORI_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_02"); //Ano witaj.
    AI_Output (other, self ,"DIA_Florian_HI_FLORI_15_03"); //Co u Ciebie?
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_04"); //£apiê chwilê wytchnienia.
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_05"); //Jako Szkodnik czêœciej tu wpada³em to z racji, ¿e Lee ma dla mniej trochê mniej roboty postanowi³em przypomnieæ sobie dawne czasy.
    AI_Output (other, self ,"DIA_Florian_HI_FLORI_15_06"); //Mam wra¿enie, ¿e wola³byœ nadal byæ Szkodnikiem...
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_07"); //Póki co tak ale mo¿e fucha Najemnika z czasem przypadnie mi do gustu.
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_08"); //Mimo, ¿e jest bardziej stonowana I powa¿na ni¿ wyluzowane ¿ycie Szkodnika napadaj¹cego na konwoje I zalewaj¹cego siê w trupa.
};

//========================================
//-----------------> PZ
//========================================40151

INSTANCE DIA_Florian_PZ (C_INFO)
{
   npc          = SLD_40070_Florian;
   nr           = 1;
   condition    = DIA_Florian_PZ_Condition;
   information  = DIA_Florian_PZ_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Florian_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Torlof_PZ_Zamach))
{
    return TRUE;
};
};
FUNC VOID DIA_Florian_PZ_Info()
{
    AI_Output (other, self ,"DIA_Florian_PZ_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Florian_PZ_03_02"); //Szed³em pogadaæ z Orikiem bo mam do niego sprawê.
    AI_Output (other, self ,"DIA_Florian_PZ_15_03"); //Ju¿ nie masz. On nie ¿yje.
    AI_Output (self, other ,"DIA_Florian_PZ_03_04"); //Co?!... Jak?!... Niemo¿liwe!
    AI_Output (other, self ,"DIA_Florian_PZ_15_05"); //Mo¿liwe. Poœwiêci³ siê ratuj¹c Lee przed zamachowcami. Pod¹¿am ich tropem. Widzia³eœ ich?
    AI_Output (self, other ,"DIA_Florian_PZ_03_06"); //Widzia³em dwóch Szkodników. Gnali jakby ich tysi¹c demonów goni³o. 
    AI_Output (other, self ,"DIA_Florian_PZ_15_07"); //Gdzie pobiegli?
    AI_Output (self, other ,"DIA_Florian_PZ_03_08"); //Byli zdezorientowani i warknêli na siebie.
    AI_Output (self, other ,"DIA_Florian_PZ_03_09"); //Rozbiegli siê. Jeden z zimn¹ krwi¹ ruszy³ w stronê bramy a drugi zdêbia³ na chwilê.
    AI_Output (self, other ,"DIA_Florian_PZ_03_10"); //Na mój widok przestraszy³ siê jeszcze bardziej i wp³aw ruszy³ na wyspê tutaj nad jeziorem.
    AI_Output (other, self ,"DIA_Florian_PZ_15_11"); //Wielkie dziêki! Muszê dopaœæ ich obu a na pocz¹tek tego, który jest na wysepce.
    AI_Output (self, other ,"DIA_Florian_PZ_03_12"); //Dobrze. Nie zabieram ci czasu. Zobaczê jak miewa siê Lee.
    AI_Output (other, self ,"DIA_Florian_PZ_15_13"); //Dobrze. Bywaj zatem.
    AI_Output (self, other ,"DIA_Florian_PZ_03_14"); //Nie miej dla nich litoœci!
	 Npc_ExchangeRoutine(self,"PZLee");
	B_LogEntry               (PodejrzaneZamieszanie,"Spotka³em Floriana. Widzia³ uciekaj¹cych zabójców - jeden prawdopodobnie schroni³ siê na wysepce nieopodal gdzie kiedyœ znajdowa³ siê topielec niszcz¹cy tamê, a drugi bardziej rozs¹dnie uciek³ bram¹. W pierwszej kolejnoœci muszê dopaœæ zamachowca, który jest bli¿ej.");
	Wld_InsertNpc 	(ORG_40151_Podejrzany, "NC_SPAWN_DAM_LURKER2");
};

instance dia_florian_pickpocket(c_info) {
    npc = sld_40070_florian;
    nr = 900;
    condition = dia_florian_pickpocket_condition;
    information = dia_florian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_florian_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_florian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_florian_pickpocket);
	info_addchoice(dia_florian_pickpocket, dialog_back, dia_florian_pickpocket_back);
	info_addchoice(dia_florian_pickpocket, dialog_pickpocket, dia_florian_pickpocket_doit);
};

func void dia_florian_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_florian_pickpocket);
};

func void dia_florian_pickpocket_back() {
    info_clearchoices(dia_florian_pickpocket);
};