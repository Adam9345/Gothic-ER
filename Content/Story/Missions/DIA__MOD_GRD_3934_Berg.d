//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Berg_EXIT(C_INFO)
{
	npc             = GRD_3934_Berg;
	nr              = 999;
	condition		= DIA_Berg_EXIT_Condition;
	information		= DIA_Berg_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Berg_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Berg_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Berg_HELLO1 (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_HELLO1_Condition;
   information  = DIA_Berg_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty jesteœ Berg, Stra¿nik ze Starego Obozu?";
};

FUNC INT DIA_Berg_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_GDZIE_PATROLE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_01"); //Ty jesteœ Berg, Stra¿nik ze Starego Obozu?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_02"); //Zgadza siê. Zosta³em jednak wys³any w te okolice na zwiady. Czego chcesz?
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_03"); //S³ysza³em, ¿e masz klucz do piwnic zamkowych. Chcia³em spytaæ, czy nie sprzeda³byœ mi go?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_04"); //Hmm, s¹dz¹c po twojej zbroi, nale¿ysz do Nowego Obozu. Mam dla ciebie dwie propozycje.
    AI_Output (other, self ,"DIA_Berg_HELLO1_15_05"); //Co to za propozycje?
    AI_Output (self, other ,"DIA_Berg_HELLO1_03_06"); //Mo¿esz albo odkupiæ ode mnie klucz za 200 bry³ek rudy, albo dostaæ go ode mnie w prezencie. Jednak w drugim przypadku musia³byœ mi przynieœæ w ci¹gu jednego dnia pewien pierœcieñ, który Gomez trzyma w piwnicy. Któr¹ opcjê wybierasz?

    Info_ClearChoices		(DIA_Berg_HELLO1);
	if (Npc_HasItems (hero, ItMiNugget)>=200) {
    Info_AddChoice		(DIA_Berg_HELLO1, "Zap³acê ci 200 bry³ek rudy. Oto one.", DIA_Berg_HELLO1_200_ORE); };
    Info_AddChoice		(DIA_Berg_HELLO1, "Pomogê ci odzyskaæ pierœcieñ. O jaki konkretnie ci chodzi?", DIA_Berg_HELLO1_INNE_ROZW);
};

FUNC VOID DIA_Berg_HELLO1_200_ORE()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_200_ORE_15_01"); //Zap³acê ci 200 bry³ek rudy. Oto one.
    AI_Output (self, other ,"DIA_Berg_HELLO1_200_ORE_03_02"); //No có¿, szkoda, ¿e nie przyniesiesz mi pierœcienia, ale niech ci bêdzie. Przynajmniej siê trochê wzbogaci³em. Oto klucz.
    B_GiveInvItems (other, self, ItMiNugget, 200);
    CreateInvItems (self, ItKe_DunegonKeyOC, 1);
    B_GiveInvItems (self, other, ItKe_DunegonKeyOC, 1);
    B_LogEntry                     (CH2_OldCampCellar,"Odkupi³em od Berga klucz za 200 bry³ek rudy.");

    B_GiveXP (120);
    Info_ClearChoices		(DIA_Berg_HELLO1);
    AI_StopProcessInfos	(self);
	Choice_BergsRing = FALSE;
};

FUNC VOID DIA_Berg_HELLO1_INNE_ROZW()
{
    AI_Output (other, self ,"DIA_Berg_HELLO1_INNE_ROZW_15_01"); //Pomogê ci odzyskaæ pierœcieñ. O jaki konkretnie ci chodzi?
    AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_02"); //Jest to du¿y srebrny pierœcieñ. Poznasz go, bo jest na nim moje imiê. Dosta³em go za zas³ugi w obozie myœliwych w Khorinis.
    AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_03"); //Jednak pewnego wieczoru, gdy by³em w siedzibie Magnatów, zgubi³em go. Zorientowa³em siê dopiero rano. Zapyta³em Kruka, czy nie widzia³ mojego pierœcienia, a on powiedzia³, ¿e "znalezione, nie kradzione" i ¿ebym lepiej spada³.
	AI_Output (self, other ,"DIA_Berg_HELLO1_INNE_ROZW_03_04"); //Potem widzia³em, jak wys³a³ Bartholo do piwnic z moim pierœcieniem. Pamiêtaj jednak, ¿e masz tylko jeden dzieñ na przyniesienie mi go, inaczej powiem Thorusowi, ¿e chcia³eœ okraœæ Magnatów, jasne?
    AI_Output (other, self ,"DIA_Berg_HELLO1_INNE_ROZW_15_05"); //Nie ma sprawy.
    B_LogEntry                     (CH2_OldCampCellar,"Berg da³ mi klucz do skrzyni za darmo, ale mam jeden dzieñ, aby znaleŸæ wœród ³upów jego pierœcieñ i przynieœæ mu go jako wynagrodzenie.");
    Info_ClearChoices		(DIA_Berg_HELLO1);
	Berg_ring_giveday = wld_getday ();
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItKe_DunegonKeyOC, 1);
    B_GiveInvItems (self, other, ItKe_DunegonKeyOC, 1);
	Choice_BergsRing = TRUE;
};

//========================================
//-----------------> GIVE_RING
//========================================

INSTANCE DIA_Berg_GIVE_RING (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_GIVE_RING_Condition;
   information  = DIA_Berg_GIVE_RING_Info;
   permanent	= FALSE;
   description	= "Przynios³em twój pierœcieñ.";
};

FUNC INT DIA_Berg_GIVE_RING_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Berg_HELLO1))
    && (Berg_ring_giveday == wld_getday ())
	&& (Npc_HasItems (other, Bergs_Ring) >=1)
	&& (Choice_BergsRing == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_GIVE_RING_Info()
{
    AI_Output (other, self ,"DIA_Berg_GIVE_RING_15_01"); //Przynios³em twój pierœcieñ.
    AI_Output (self, other ,"DIA_Berg_GIVE_RING_03_02"); //Œwietnie siê spisa³eœ. Gdy skoñczê wykonywaæ misjê od Thorusa i spotkamy siê w Starym Obozie, zapraszam na piwo do karczmy w zawalonej wie¿y.
    AI_Output (other, self ,"DIA_Berg_GIVE_RING_15_03"); //Chêtnie skorzystam.
    B_LogEntry       (CH2_OldCampCellar,"Zd¹¿y³em tego samego dnia odnieœæ Bergowi pierœcieñ. Nie bêdê mia³ k³opotów.");
	Npc_ExchangeRoutine (self,"start");
    B_GiveXP (130);
    B_GiveInvItems (other, self, Bergs_Ring, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WARN
//========================================

INSTANCE DIA_Berg_WARN (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 2;
   condition    = DIA_Berg_WARN_Condition;
   information  = DIA_Berg_WARN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Berg_WARN_Condition()
{
    if (Berg_ring_giveday != wld_getday ())
    && (Npc_KnowsInfo (hero, DIA_Berg_HELLO1))
	&& (Choice_BergsRing == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_WARN_Info()
{
    AI_Output (self, other ,"DIA_Berg_WARN_03_01"); //Ostrzega³em ciê, ¿ebyœ nie próbowa³ mnie wykiwaæ. Nie wyrobi³eœ siê w czasie, wiêc wys³a³em ju¿ goñca do Thorusa. Lepiej nie zbli¿aj siê do Starego Obozu.
    AI_Output (other, self ,"DIA_Berg_WARN_15_02"); //Cholera!
    if (Npc_HasItems (other, Bergs_Ring) >=1)
    {
		berg_problemy = false;
        AI_Output (other, self ,"DIA_Berg_WARN_15_03"); //Zaczekaj. Przecie¿ mam tu ten pierœcieñ. WeŸ go.
        AI_Output (self, other ,"DIA_Berg_WARN_03_04"); //Masz szczêœcie. Inaczej mia³byœ spore k³opoty. Spadaj st¹d.
        B_GiveInvItems (other, self, Bergs_Ring, 1);
        B_LogEntry                     (CH2_OldCampCellar,"W ostatniej chwili odda³em pierœcieñ Bergowi. W przeciwnym razie mia³bym niez³e k³opoty.");
    }
    else
    {
		berg_problemy = true;
        B_LogEntry                     (CH2_OldCampCellar,"Cholera, bêdê mia³ teraz problemy w Starym Obozie. Niepotrzebnie próbowa³em wykiwaæ Berga.");
    };
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};


















//-----------------> BEER
//========================================

INSTANCE DIA_Berg_BEER (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_BEER_Condition;
   information  = DIA_Berg_BEER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Berg_BEER_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Berg_WHAT_YOU_CA))
{
    return TRUE;
};
};
FUNC VOID DIA_Berg_BEER_Info()
{
    AI_Output (self, other ,"DIA_Berg_BEER_03_01"); //Dobra jak ju¿ tu jesteœ to za³atw coœ dla mnie.
    AI_Output (other, self ,"DIA_Berg_BEER_15_02"); //Niby co?
    AI_Output (self, other ,"DIA_Berg_BEER_03_03"); //2 piwa i trzy kawa³ki miêsa. Upiekê je w ognisku.
    AI_Output (other, self ,"DIA_Berg_BEER_15_04"); //Czemu mam ci siê wys³ugiwaæ?
    AI_Output (self, other ,"DIA_Berg_BEER_03_05"); //Chcia³eœ siê czegoœ dowiedzieæ. W sumie taki szczyl i tak nic nie zrobi z takimi informacjami.
    AI_Output (self, other ,"DIA_Berg_BEER_03_06"); //Wiêc mogê siê nimi podzieliæ.
    AI_Output (other, self ,"DIA_Berg_BEER_15_07"); //Przemyœlê. Podoba ci siê w Stra¿y?
    AI_Output (self, other ,"DIA_Berg_BEER_03_08"); // W stra¿y piêknie jak na pla¿y. A ty idŸ ju¿ i za³atw co trzeba!
};

//========================================
//-----------------> IHaveFood
//========================================

INSTANCE DIA_Berg_IHaveFood (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 2;
   condition    = DIA_Berg_IHaveFood_Condition;
   information  = DIA_Berg_IHaveFood_Info;
   permanent	= FALSE;
   description	= "Mam co chcia³eœ.";
};

FUNC INT DIA_Berg_IHaveFood_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Berg_BEER))
&&   (Npc_HasItems (other, ItfoBeer) >=2)
&&   (Npc_HasItems (other, Itfomuttonraw) >=3)
{
    return TRUE;
};
};
FUNC VOID DIA_Berg_IHaveFood_Info()
{
    AI_Output (other, self ,"DIA_Berg_IHaveFood_15_01"); //Mam co chcia³eœ.
    AI_Output (self, other ,"DIA_Berg_IHaveFood_03_02"); //Dawaj.
    AI_Output (other, self ,"DIA_Berg_IHaveFood_15_03"); //Proszê.
	B_GiveInvItems (other,self, ItfoBeer, 2);
	B_GiveInvItems (other,self, Itfomuttonraw, 3);
    AI_Output (self, other ,"DIA_Berg_IHaveFood_03_04"); //Dziêki. Piwo i zagrycha zawsze w cenie zw³aszcza jak jest siê poza obozem.
};
//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Berg_HowAreYou (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_HowAreYou_Condition;
   information  = DIA_Berg_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Berg_HowAreYou_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Berg_IHaveFood))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Berg_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_02"); //Wszystko w porz¹dku. Zosta³em tu wys³any na zwiady przez Thorusa.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_03"); //Tak myœla³em, w koñcu to rejony Nowego Obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_04"); //Nie mo¿emy pozwoliæ Szkodnikom na zbyt wiele, musz¹ znaæ swoje miejsce.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_05"); //Czego zdo³a³eœ siê dowiedzieæ?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_06"); //No có¿, pobliska chatka to czêsty punkt zwiadowczy Szkodników.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_07"); //Mieszka w niej myœliwy Aidan, czasem przychodzi jednak kilku tych obdartusów na przeszpiegi.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_08"); //Przewa¿nie jednak siedz¹ w Obozie. To obiboki, jak po³owa mieszkañców tego pieprzonego Nowego Obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_09"); //Tylko ostatnio zdarzy³o siê coœ dziwnego...
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_10"); //Co takiego?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_11"); //Szkodnicy ci¹gnêli ze sob¹ jednego z myœliwych z pobliskiego obozu.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_12"); //Nie wiem czy go porwali, czy jak, ale z pewnoœci¹ zameldujê o tym Thorusowi.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_13"); //Coœ jeszcze?
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_14"); //Tak, w pobli¿u chatki rybackiej jest jaskinia w której znajduje siê nielegalna wytwórnia bagiennego ziela. 
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_15"); //Guru z Obozu Sekty z pewnoœci¹ nie byliby zachwyceni t¹ informacj¹.
    AI_Output (other, self ,"DIA_Berg_HowAreYou_15_16"); //Mo¿e ktoœ powinien im o tym powiedzieæ.
    AI_Output (self, other ,"DIA_Berg_HowAreYou_03_17"); //Oni nie s¹ g³upi, z czasem sami siê zorientuj¹. 
};

//========================================
//-----------------> WHAT_YOU_CA
//========================================

INSTANCE DIA_Berg_WHAT_YOU_CA (C_INFO)
{
   npc          = GRD_3934_Berg;
   nr           = 1;
   condition    = DIA_Berg_WHAT_YOU_CA_Condition;
   information  = DIA_Berg_WHAT_YOU_CA_Info;
   permanent	= FALSE;
   description	= "Co porabiasz?";
};

FUNC INT DIA_Berg_WHAT_YOU_CA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Berg_WHAT_YOU_CA_Info()
{
    AI_Output (other, self ,"DIA_Berg_WHAT_YOU_CA_15_01"); //Co porabiasz?
    AI_Output (self, other ,"DIA_Berg_WHAT_YOU_CA_03_02"); //Siedzê. Œlepy jesteœ m³okosie?
    AI_Output (other, self ,"DIA_Berg_WHAT_YOU_CA_15_03"); //A poza tym?
    AI_Output (self, other ,"DIA_Berg_WHAT_YOU_CA_03_04"); //Nic.
    AI_Output (other, self ,"DIA_Berg_WHAT_YOU_CA_15_05"); //Dziwne, ¿e jesteœ tutaj tak daleko od swojego obozu. Jednoczeœnie w pobli¿u innego.
    AI_Output (self, other ,"DIA_Berg_WHAT_YOU_CA_03_06"); //Dziw siê temu gdzie indziej.
    AI_Output (other, self ,"DIA_Berg_WHAT_YOU_CA_15_07"); //Szpiegujesz?
    AI_Output (self, other ,"DIA_Berg_WHAT_YOU_CA_03_08"); //Bystrzacha... A teraz zejdŸ mi wreszcie z oczu bo ci pomogê!
    AI_Output (other, self ,"DIA_Berg_WHAT_YOU_CA_15_09"); //Spokojna twoja ³ysa g³owa. Ju¿ mnie nie ma.
    AI_StopProcessInfos	(self);
};

