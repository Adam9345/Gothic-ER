//*** SHIT POPRAWIONY ****
// Zrobione porz�dnie, gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Balam_EXIT(C_INFO)
{
	npc             = STT_324_Balam;
	nr              = 999;
	condition	= DIA_Balam_EXIT_Condition;
	information	= DIA_Balam_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Balam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balam_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Balam_HELLO1 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 1;
   condition    = DIA_Balam_HELLO1_Condition;
   information  = DIA_Balam_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak si� maj� sprawy?";
};

FUNC INT DIA_Balam_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO1_15_01"); //Jak si� maj� sprawy?
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_02"); //Widz� �e jeste� tu nowy. Jestem Balam, kucharz Gomeza. Jeden z najlepszych kucharzy na ca�ej wyspie Khorinis i najlepszy kucharz w ca�ej Kolonii.
    AI_Output (self, other ,"DIA_Balam_HELLO1_03_03"); //Zajmuj� si� tym od ponad dwudziestu lat. Wsp�lnie z Omidem zwiedzili�my spory kawa�ek �wiata i znamy rozmaite przepisy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Balam_HELLO2 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 2;
   condition    = DIA_Balam_HELLO2_Condition;
   information  = DIA_Balam_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o zamku?";
};

FUNC INT DIA_Balam_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO2_15_01"); //Co mo�esz mi powiedzie� o zamku?
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_02"); //W sumie to niewiele. Pracuj� dla Gomeza od niedawna i nie mam zazwyczaj czasu na w��czenie si� po zamku.
    AI_Output (self, other ,"DIA_Balam_HELLO2_03_03"); //Zreszt�, nie wsz�dzie jeste�my wpuszczani.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Balam_HELLO3 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 3;
   condition    = DIA_Balam_HELLO3_Condition;
   information  = DIA_Balam_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czym si� wcze�niej zajmowa�e�?";
};

FUNC INT DIA_Balam_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Balam_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO3_15_01"); //Czym si� wcze�niej zajmowa�e�?
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_02"); //By�em, a w�a�ciwie wci�� jestem Cieniem. Zanim przydzielono nas do kuchni, pomagali�my w prowadzeniu karczmy w Zewn�trznym Pier�cieniu.
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_03"); //Do kuchni trafili�my przez przypadek. Poprzedni kucharz mia� ma�y wypadek. Poparzy� si� ogniem. Kilka dni p�niej zmar�.
    AI_Output (self, other ,"DIA_Balam_HELLO3_03_04"); //Nieciekawa sprawa...
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Balam_HELLO4 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 4;
   condition    = DIA_Balam_HELLO4_Condition;
   information  = DIA_Balam_HELLO4_Info;
   permanent	= FALSE;
   description	= "Tw�j przyjaciel nie jest zbyt rozmowny. ";
};

FUNC INT DIA_Balam_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Omid_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO4_15_01"); //Tw�j przyjaciel nie jest zbyt rozmowny. 
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_02"); //To prawda. To g��wnie dlatego, �e dosta� ostatnio bur� od Bartholo. Omid strasznie nie lubi krytyki i zawsze si� obra�a.
    AI_Output (self, other ,"DIA_Balam_HELLO4_03_03"); //Do mnie na szcz�cie Magnaci nie maj� zastrze�e�, dlatego mo�emy zamieni� kilka s��w.
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Balam_HELLO5 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_HELLO5_Condition;
   information  = DIA_Balam_HELLO5_Info;
   permanent	= FALSE;
   description	= "W Zewn�trznym Pier�cieniu spotka�em innego kucharza, Snafa.";
};

FUNC INT DIA_Balam_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_01"); //W Zewn�trznym Pier�cieniu spotka�em innego kucharza, Snafa.
    AI_Output (self, other ,"DIA_Balam_HELLO5_03_02"); //Dalej pr�buje przerobi� chrz�szcze na �arcie?
    AI_Output (other, self ,"DIA_Balam_HELLO5_15_03"); //Tak.
	AI_Output (self, other ,"DIA_Balam_HELLO5_03_04"); //Ha ha! Sukinsynowi, chyba nigdy si� to nie znudzi. 
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Balam_HELLO6 (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 6;
   condition    = DIA_Balam_HELLO6_Condition;
   information  = DIA_Balam_HELLO6_Info;
   permanent	= TRUE;
   description	= "Jak tam robota?";
};

FUNC INT DIA_Balam_HELLO6_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Balam_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Balam_HELLO6_15_01"); //Jak tam robota?
    AI_Output (self, other ,"DIA_Balam_HELLO6_03_02"); //�eby �ycie mia�o smaczek, raz kotlecik, raz ziemniaczek. He he...
};

//========================================
//-----------------> LookingForRings
//========================================

INSTANCE DIA_Balam_LookingForRings (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_LookingForRings_Condition;
   information  = DIA_Balam_LookingForRings_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o pier�cieniach Magnat�w?";
};

FUNC INT DIA_Balam_LookingForRings_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Miguel_AboutThirdRing)) && (MIS_BaronsRings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_LookingForRings_Info()
{
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_01"); //Wiesz co� o pier�cieniach Magnat�w?
    AI_Output (self, other ,"DIA_Balam_LookingForRings_03_02"); //Hej, kolego. Wiem, co ci chodzi po g�owie. Moja cena to 60 bry�ek rudy.
    AI_Output (other, self ,"DIA_Balam_LookingForRings_15_03"); //Nie za du�o?
	AI_Output (self, other ,"DIA_Balam_LookingForRings_03_04"); //Mo�esz szuka� sam...
	B_LogEntry    (CH1_BaronsRings,"Balam wie co� o trzecim pier�cieniu, jednak ta informacja kosztuje 60 bry�ek rudy.");
};

//========================================
//-----------------> PayForInfo
//========================================

INSTANCE DIA_Balam_PayForInfo (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 5;
   condition    = DIA_Balam_PayForInfo_Condition;
   information  = DIA_Balam_PayForInfo_Info;
   permanent	= FALSE;
   description	= "Dobra, m�w co wiesz. (Zap�a� 60 bry�ek)";
};

FUNC INT DIA_Balam_PayForInfo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Balam_LookingForRings)) && (MIS_BaronsRings == LOG_RUNNING) && (Npc_HasItems (hero, ItMiNugget)>=60)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Balam_PayForInfo_Info()
{
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_01"); //Dobra, m�w co wiesz.
    AI_Output (self, other ,"DIA_Balam_PayForInfo_03_02"); //Poszukaj w naszej kuchni. Tej w wie�y. 
    AI_Output (other, self ,"DIA_Balam_PayForInfo_15_03"); //Naprawd�? W kuchni? Chyba sobie ze mnie nie �artujesz.
	AI_Output (self, other ,"DIA_Balam_PayForInfo_03_04"); //Nie, m�wi� powa�nie. Te� bym go schowa� gdzie� indziej, ale Gomez to t�pak.
	B_GiveInvItems (hero,self,itminugget,60);
	B_LogEntry    (CH1_BaronsRings,"Balam powiedzia� mi, �ebym szuka� pier�cienia w kuchni Magnat�w, kt�ra znajduje si� w wie�y.");
};


//========================================
//-----------------> KS_FLO
//========================================

INSTANCE DIA_Balam_KS_FLO (C_INFO)
{
   npc          = STT_324_Balam;
   nr           = 1;
   condition    = DIA_Balam_KS_FLO_Condition;
   information  = DIA_Balam_KS_FLO_Info;
   permanent	= FALSE;
   description	= "Wiesz co� mo�e na temat cz�owieka, kt�ry ustala sk�ad konwoj�w od Starej Kopalni?";
};

FUNC INT DIA_Balam_KS_FLO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Florian_KS_WHAT))
{
    return TRUE;
};
};
FUNC VOID DIA_Balam_KS_FLO_Info()
{
    AI_Output (other, self ,"DIA_Balam_KS_FLO_15_01"); //Wiesz co� mo�e na temat cz�owieka, kt�ry ustala sk�ad konwoj�w od Starej Kopalni?
    AI_Output (self, other ,"DIA_Balam_KS_FLO_03_02"); //Niestety nie. Ostatnio odby�a si� wa�na narada Magnat�w. Omid podawa� im do sto�u wino i piecze�, kt�r� przygotowa�em.
    AI_Output (other, self ,"DIA_Balam_KS_FLO_15_03"); //Mo�e co� us�ysza�.
    AI_Output (self, other ,"DIA_Balam_KS_FLO_03_04"); //Jest na to szansa. 
	B_LogEntry               (KuzniaStone,"Kucharz Balam twierdzi, �e jego pomocnik Omid m�g� co nieco us�ysze� na ostatniej naradzie Magnat�w.");
};



func void GardistInVRoom()
{

    Wld_InsertNpc 	(GRD_40156_Gardist,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(GRD_40155_Gardist,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(GRD_40158_Gardist,          "WP_BDT_CENTRE");

};

//========================================
//-----------------> Velaya
//========================================

INSTANCE DIA_Balam_Velaya (C_INFO)
{
   npc          = NONE_40157_Balam;
   nr           = 1;
   condition    = DIA_Balam_Velaya_Condition;
   information  = DIA_Balam_Velaya_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Balam_Velaya_Condition()
{
if (kapitel == 5)
//&& (Npc_KnowsInfo(hero,DIA_GRD_219_Stone1)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Balam_Velaya_Info()
{
    AI_Output (self, other ,"DIA_Balam_Velaya_03_01"); //Ch�opcz� podejd� p�ki czas!
    AI_Output (other, self ,"DIA_Balam_Velaya_15_02"); //Co si� dzieje?
    AI_Output (self, other ,"DIA_Balam_Velaya_03_03"); //Gomez wyzby� si� wszelkich zahamowa�. Jest zdolny do wszystkiego!
    AI_Output (other, self ,"DIA_Balam_Velaya_15_04"); //Nie czuje si� tym zaskoczony.
    AI_Output (self, other ,"DIA_Balam_Velaya_03_05"); //Poch�ania go tylko walka o odzyskanie wp�yw�w.
    AI_Output (other, self ,"DIA_Balam_Velaya_15_06"); //Do czego zmierzasz?
    AI_Output (self, other ,"DIA_Balam_Velaya_03_07"); //Albo obieca� nagrod� swoim ludziom za lojalno�� albo o niczym nie wie.
    AI_Output (other, self ,"DIA_Balam_Velaya_15_08"); //M�wisz bez �adu i sk�adu. Otrz��nij si�.
    AI_Output (self, other ,"DIA_Balam_Velaya_03_09"); //Wybacz to przez emocje. Velaya znalaz�a si� w niebezpiecze�stwie!
    AI_Output (other, self ,"DIA_Balam_Velaya_15_10"); //Co si� z ni� teraz dzieje?
    AI_Output (self, other ,"DIA_Balam_Velaya_03_11"); //Widzia�em kilku Stra�nik�w wchodz�cych do jej komnaty. 
    AI_Output (self, other ,"DIA_Balam_Velaya_03_12"); //Zamierzaj� da� upust swoim rz�dz�. Trzeba jej szybko pom�c.
    AI_Output (other, self ,"DIA_Balam_Velaya_15_13"); //Pomog� jej. 
    AI_Output (self, other ,"DIA_Balam_Velaya_03_14"); //Zaczekam tutaj.
	
	Log_CreateTopic		(VelayaWNiebezbieczenstwie,	LOG_MISSION);
	Log_SetTopicStatus	(VelayaWNiebezbieczenstwie,	LOG_RUNNING);
	B_LogEntry          (VelayaWNiebezbieczenstwie,"Przed siedzib� Magnat�w zaczepi� mnie kucharz Balam. Powiedzia�, �e kobiecie Gomeza imieniem Velaya grozi niebezpiecze�stwo ze strony g�odnych wra�e� Stra�nik�w, kt�rzy weszli do jej komnaty. Musze jej niezw�ocznie pom�c.");
    GardistInVRoom();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> VelayaIsGood
//========================================

INSTANCE DIA_Balam_VelayaIsGood (C_INFO)
{
   npc          = NONE_40157_Balam;
   nr           = 2;
   condition    = DIA_Balam_VelayaIsGood_Condition;
   information  = DIA_Balam_VelayaIsGood_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Balam_VelayaIsGood_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Velaya_VWN))
{
    return TRUE;
};
};
FUNC VOID DIA_Balam_VelayaIsGood_Info()
{
    AI_Output (self, other ,"DIA_Balam_VelayaIsGood_03_01"); //Uda�o ci si�. 
    AI_Output (other, self ,"DIA_Balam_VelayaIsGood_15_02"); //To jeszcze nie koniec. Trzeba ulokowa� j� w miar� spokojnym miejscu.
    AI_Output (self, other ,"DIA_Balam_VelayaIsGood_03_03"); //Mo�na j� ukry� w ku�ni Stone'a. To r�wny go��, mia�by na ni� oko p�ki to wszystko si� nie sko�czy.
    AI_Output (self, other ,"DIA_Balam_VelayaIsGood_03_04"); //Ty zapewne gdzie� si� wybierasz bo nie lubisz siedzie� w miejscu co?
    AI_Output (other, self ,"DIA_Balam_VelayaIsGood_15_05"); //Pogadam ze Stone'm.
    AI_Output (self, other ,"DIA_Balam_VelayaIsGood_03_06"); //Tylko uwa�aj. Podpad� Magnatom i ci kazali go zamkn��.
    AI_Output (other, self ,"DIA_Balam_VelayaIsGood_15_07"); //Mam nadzieje, �e wszystko si� uda. 
    AI_Output (self, other ,"DIA_Balam_VelayaIsGood_03_08"); //Powodzenia ch�opcz�.
	B_LogEntry               (VelayaWNiebezbieczenstwie,"Balam poleci� mi ukry� Velaye u kowala Stone'a. To cz�owiek godny zaufanaia ale sam ma na pie�ku z Magnatmi. Pora do niego zajrze�.");
    AI_StopProcessInfos	(self);
};

instance dia_balam_pickpocket(c_info) {
    npc = stt_324_balam;
    nr = 900;
    condition = dia_balam_pickpocket_condition;
    information = dia_balam_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_balam_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_balam_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_balam_pickpocket);
	info_addchoice(dia_balam_pickpocket, dialog_back, dia_balam_pickpocket_back);
	info_addchoice(dia_balam_pickpocket, dialog_pickpocket, dia_balam_pickpocket_doit);
};

func void dia_balam_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_balam_pickpocket);
};

func void dia_balam_pickpocket_back() {
    info_clearchoices(dia_balam_pickpocket);
};