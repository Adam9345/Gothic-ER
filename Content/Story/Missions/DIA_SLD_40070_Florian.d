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
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_02"); //To cisza przed burz�. 
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_03"); //Jak� burz�?
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_04"); //Wkr�tce udam si� na zwiad w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_05"); // Lee na mnie liczy. I wywi��e si� z tego zadania.
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_06"); //Co konkretnie masz wybada�?
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_07"); //Niepotrzebnie o tym m�wi� I nie zdradz� ci wi�cej.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_08"); //Wypi�em piwko I rozwi�za� mi si� j�zyk. Takie co� mo�e kosztowa� w kolonii g�ow�.
    AI_Output (self, other ,"DIA_Florian_HELLO1_03_09"); //Wiem co m�wi�.
    AI_Output (other, self ,"DIA_Florian_HELLO1_15_10"); //W porz�dku. Nie b�d� ju� dopytywa� o twoj� wycieczk�.
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
   description	= "Przysy�a mnie Lee.";
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
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_01"); //Przysy�a mnie Lee. Pono� widzia�e� Zombie w szeregach Gomeza, kt�re stan�o przeciw wam.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_02"); //Cz�owieku ani mi o tym nie m�w! Do dzisiaj mam koszmary na sam� my�l o tym!
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_03"); //Co dok�adnie si� sta�o?
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_04"); //W czasie jednej z potyczek pod Starym Obozem dawali�my �upnia tym baranom ze Stra�y.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_05"); //Zyskiwali�my przewag� ale wtedy...
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_06"); //Pojawi� si� jaki� m�ody Mag i zacz�� odprawia� jaki� rytua�. Wtem martwi Stra�nicy powstali i zn�w ruszyli do walki. 
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_07"); //C�... Czyli wszystko jasne.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_08"); //Nasi ludzie wpadli w panik� i zacz�li ucieka�.
    AI_Output (self, other ,"DIA_Florian_TMQ_ZOMBIE_03_09"); //Od tamtej pory morale znacznie podupad�y, skoro nawet si�y ciemno�ci wspar�y Gomeza.
    AI_Output (other, self ,"DIA_Florian_TMQ_ZOMBIE_15_10"); //Musz� powiadomi� Lee i Quentina.
	B_LogEntry               (TajnaMisjaQuentina,"Florian powiedzia�, �e Najemnicy zyskiwali przewag� nad si�ami Gomeza kiedy pojawi� si� jaki� Mag i sprawi�, �e martwi Stra�nicy powstali jako zombie. Musz� o tym powiedzie� koniecznie Lee. I to szybko.");
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
   description	= "Buster wspomina�, �e czego� ode mnie chcesz.";
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
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_01"); //Buster wspomina�, �e czego� ode mnie chcesz.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_02"); //Zgadza si�. Podobno jeste� zdolny. Mo�esz mi si� przyda�.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_03"); //Mam lepsze rzeczy do roboty ni� ,,przydawanie� si� tobie.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_04"); //Nie za darmo rzecz jasna. A i robota nie b�dzie d�uga je�li sprawnie to rozegrasz.
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_05"); //Lee interesuje kto ostatnio wyznacza sk�ad konwoj�w do Starej Kopalni.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_06"); //Mam to ustali�?
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_07"); //Tak to wa�na sprawa. Nie�le sypn� rud� je�li si� spiszesz. 
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_08"); //Spr�buje. Udam si� do Starego Obozu i troch� pow�sz�. 
    AI_Output (self, other ,"DIA_Florian_KS_WHAT_03_09"); //Tylko nie pytaj byle kogo. To ma by� kto� kto ma dost�p do najwy�szych kr�g�w ale jednocze�nie nie jest przesadnie lojalny.
    AI_Output (other, self ,"DIA_Florian_KS_WHAT_15_10"); //Zajm� si� tym. A ty przygotuj rud�.
    B_LogEntry                     (KuzniaStone,"Najemnik Florian chce si� dowiedzie� kto odpowiada za sk�ad personalny konwoj�w do Starej Kopalni. Nim zajm� si� dost�pem do ku�ni Stone�a musz� o to popyta� w Starym Obozie, najlepiej na zamku. Oczywi�cie nie chodzi o pogaw�dk� z Gomezem.");

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
   description	= "Wiem kto ustala sk�ad konwoj�w ze Starego Obozu do kopalni.";
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
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_01"); //Wiem kto ustala sk�ad konwoj�w ze Starego Obozu do kopalni.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_02"); //�wietnie. A wi�c o kogo chodzi?
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_03"); //Cz�owiekiem tym jest Stra�nik John.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_04"); //Pono� niezwykle przebieg�y bydlak. Hmmm... To cenna informacja
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_05"); //Musz� niezw�ocznie pom�wi� o tym z Lee.
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_06"); //Chyba o czym� zapomnia�e�.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_07"); //Ach tak...Wcze�niej wyp�ac� ci nale�n� rud� za wykonan� misje.
	B_GiveInvItems (self,other, itminugget, 150);
    AI_Output (other, self ,"DIA_Florian_KS_COVOY_15_08"); //Dzi�ki. Teraz ta sprawa zostaje w twoich r�kach.
    AI_Output (self, other ,"DIA_Florian_KS_COVOY_03_09"); //Tak. Oby potoczy�a si� dobrze. Ale to ju� zale�y ode mnie i od Lee.
	B_GiveXP(200);
	B_LogEntry                     (KuzniaStone,"Poinformowa�em Floriana kto odpowiada za dob�r ludzi do konwoj�w Gomeza do Starej Kopalni. Otrzyma�em nale�n� zap�at�.");

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
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_04"); //�api� chwil� wytchnienia.
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_05"); //Jako Szkodnik cz�ciej tu wpada�em to z racji, �e Lee ma dla mniej troch� mniej roboty postanowi�em przypomnie� sobie dawne czasy.
    AI_Output (other, self ,"DIA_Florian_HI_FLORI_15_06"); //Mam wra�enie, �e wola�by� nadal by� Szkodnikiem...
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_07"); //P�ki co tak ale mo�e fucha Najemnika z czasem przypadnie mi do gustu.
    AI_Output (self, other ,"DIA_Florian_HI_FLORI_03_08"); //Mimo, �e jest bardziej stonowana I powa�na ni� wyluzowane �ycie Szkodnika napadaj�cego na konwoje I zalewaj�cego si� w trupa.
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
    AI_Output (self, other ,"DIA_Florian_PZ_03_02"); //Szed�em pogada� z Orikiem bo mam do niego spraw�.
    AI_Output (other, self ,"DIA_Florian_PZ_15_03"); //Ju� nie masz. On nie �yje.
    AI_Output (self, other ,"DIA_Florian_PZ_03_04"); //Co?!... Jak?!... Niemo�liwe!
    AI_Output (other, self ,"DIA_Florian_PZ_15_05"); //Mo�liwe. Po�wi�ci� si� ratuj�c Lee przed zamachowcami. Pod��am ich tropem. Widzia�e� ich?
    AI_Output (self, other ,"DIA_Florian_PZ_03_06"); //Widzia�em dw�ch Szkodnik�w. Gnali jakby ich tysi�c demon�w goni�o. 
    AI_Output (other, self ,"DIA_Florian_PZ_15_07"); //Gdzie pobiegli?
    AI_Output (self, other ,"DIA_Florian_PZ_03_08"); //Byli zdezorientowani i warkn�li na siebie.
    AI_Output (self, other ,"DIA_Florian_PZ_03_09"); //Rozbiegli si�. Jeden z zimn� krwi� ruszy� w stron� bramy a drugi zd�bia� na chwil�.
    AI_Output (self, other ,"DIA_Florian_PZ_03_10"); //Na m�j widok przestraszy� si� jeszcze bardziej i wp�aw ruszy� na wysp� tutaj nad jeziorem.
    AI_Output (other, self ,"DIA_Florian_PZ_15_11"); //Wielkie dzi�ki! Musz� dopa�� ich obu a na pocz�tek tego, kt�ry jest na wysepce.
    AI_Output (self, other ,"DIA_Florian_PZ_03_12"); //Dobrze. Nie zabieram ci czasu. Zobacz� jak miewa si� Lee.
    AI_Output (other, self ,"DIA_Florian_PZ_15_13"); //Dobrze. Bywaj zatem.
    AI_Output (self, other ,"DIA_Florian_PZ_03_14"); //Nie miej dla nich lito�ci!
	 Npc_ExchangeRoutine(self,"PZLee");
	B_LogEntry               (PodejrzaneZamieszanie,"Spotka�em Floriana. Widzia� uciekaj�cych zab�jc�w - jeden prawdopodobnie schroni� si� na wysepce nieopodal gdzie kiedy� znajdowa� si� topielec niszcz�cy tam�, a drugi bardziej rozs�dnie uciek� bram�. W pierwszej kolejno�ci musz� dopa�� zamachowca, kt�ry jest bli�ej.");
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