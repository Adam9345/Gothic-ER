// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Victor_EXIT(C_INFO)
{
	npc             = BAN_40067_Victor;
	nr              = 999;
	condition	    = DIA_Victor_EXIT_Condition;
	information  	= DIA_Victor_EXIT_Info;
	permanent	    = TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Victor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Victor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> ZL
//========================================

INSTANCE DIA_Victor_ZL (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 1;
   condition    = DIA_Victor_ZL_Condition;
   information  = DIA_Victor_ZL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Victor_ZL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_ZL))
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_Info()
{
    AI_Output (self, other ,"DIA_Victor_ZL_03_01"); //Hej, podejdŸ mam sprawê.
    AI_Output (other, self ,"DIA_Victor_ZL_15_02"); //Niby jak¹?
    AI_Output (self, other ,"DIA_Victor_ZL_03_03"); //Muszê zdobyæ pewn¹ cenn¹ ksiêgê. Jest zapakowana w skórê i nale¿y obecnie do Kopacza imieniem Erens.
    AI_Output (self, other ,"DIA_Victor_ZL_03_04"); //Ja nie mogê przenikn¹æ do Starego Obozu bo wyt³uk³em ju¿ zbyt wielu ludzi stamt¹d i mnie pamiêtaj¹.
    AI_Output (self, other ,"DIA_Victor_ZL_03_05"); //Ale ty jesteœ jeszcze w miarê nowy. Wiêc powinieneœ zrobiæ mniejszy szum.
    AI_Output (self, other ,"DIA_Victor_ZL_03_06"); //To jak bêdzie?

};
//========================================
//-----------------> ZL_Team
//========================================

INSTANCE DIA_Victor_ZL_Team (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 1;
   condition    = DIA_Victor_ZL_Team_Condition;
   information  = DIA_Victor_ZL_Team_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o znikaj¹cych ludziach?";
};

FUNC INT DIA_Victor_ZL_Team_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_ZL))
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_Team_Info()
{
    AI_Output (other, self ,"DIA_Victor_ZL_Team_15_01"); //Wiesz coœ o znikaj¹cych ludziach?
    AI_Output (self, other ,"DIA_Victor_ZL_Team_03_02"); //Ja? Sk¹d ten pomys³? Wiem tyle samo co i ty.
    AI_Output (self, other ,"DIA_Victor_ZL_Team_03_03"); //Nie mieszaj mnie w to.
	B_LogEntry               (ZnikajacyLudzie,"Victor nie chce by go mieszaæ do sprawy zaginionych ludzi Quentina.");
};


//========================================
//-----------------> ZL_2
//========================================

INSTANCE DIA_Victor_ZL_2 (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 2;
   condition    = DIA_Victor_ZL_2_Condition;
   information  = DIA_Victor_ZL_2_Info;
   permanent	= FALSE;
   description	= "Pogadam z tym Erenesem. Ale nie za darmo.";
};

FUNC INT DIA_Victor_ZL_2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Victor_ZL))
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_2_Info()
{
    AI_Output (other, self ,"DIA_Victor_ZL_2_15_01"); //Pogadam z tym Erenesem. Ale nie za darmo.
    AI_Output (self, other ,"DIA_Victor_ZL_2_03_02"); //Ale¿ oczywiœcie... Dostaniesz swoj¹ nagrodê... Ale pamiêtaj by nie uszkodziæ albo co gorsza zgubiæ tej ksiêgi!
    AI_Output (other, self ,"DIA_Victor_ZL_2_15_03"); //W porz¹dku. 
    AI_Output (self, other ,"DIA_Victor_ZL_2_03_04"); //No!
    AI_Output (other, self ,"DIA_Victor_ZL_2_15_05"); //Na razie!
	Log_CreateTopic		(KsiegaDlaVictora,	LOG_MISSION);
	Log_SetTopicStatus	(KsiegaDlaVictora,	LOG_RUNNING);
	B_LogEntry               (KsiegaDlaVictora,"Bandyta Victor chce bym zdoby³ dla niego pewn¹ ksiêgê. W Starym Obozie powinien mieæ j¹ Kopacz – niejaki Erens. Muszê z nim pomówiæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_IHAVEBOOK
//========================================

INSTANCE DIA_Victor_ZL_IHAVEBOOK (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 1;
   condition    = DIA_Victor_ZL_IHAVEBOOK_Condition;
   information  = DIA_Victor_ZL_IHAVEBOOK_Info;
   permanent	= FALSE;
   description	= "Mam ksiêgê.";
};

FUNC INT DIA_Victor_ZL_IHAVEBOOK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buddler_ZL_GIVE_NUGGET))
&& (Npc_HasItems (other, ItWr_ZL_Sattik) >=1)
&& (!SattikBook ==TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_IHAVEBOOK_Info()
{
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_01"); //Mam ksiêgê.
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_02"); //Wspaniale. Daj mi j¹.
	B_GiveInvItems (other,self, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_03"); //Œwietnie. Spisa³eœ siê nale¿ycie. 
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_04"); //Co z moj¹ nagrod¹?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_05"); //Zap³ata bêdzie sowita ale jeszcze nie teraz.
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_06"); //A niby kiedy?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_07"); //Przynieœ mi 3 fiolki z krwi¹ czarnego wilka. 
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_08"); //Na cholerê ci coœ takiego?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_09"); //Chcesz nagrodê? To przestañ pytaæ.
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_10"); //Co za cyrk...
	B_LogEntry               (KsiegaDlaVictora,"Zanios³em Victorowi ksiêgê Erensa. Ten kaza³ mi przynieœæ 3 fiolki z krwi¹ czarnego wilka. Coœ mi siê tu nie podoba...");
	Wld_InsertNpc				(BlackWolf_ZL1,"BANDITOS_PATH2"); 
	Wld_InsertNpc				(BlackWolf_ZL2,"BANDITOS_PATH2");
	Wld_InsertNpc				(BlackWolf_ZL3,"BANDITOS_PATH2");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_BW_BLOOD
//========================================

INSTANCE DIA_Victor_ZL_BW_BLOOD (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 2;
   condition    = DIA_Victor_ZL_BW_BLOOD_Condition;
   information  = DIA_Victor_ZL_BW_BLOOD_Info;
   permanent	= FALSE;
   description	= "Mam 3 fiolki z krwi¹ czarnego wilka.";
};

FUNC INT DIA_Victor_ZL_BW_BLOOD_Condition()
{
if (Npc_HasItems (other, ItMi_ZL_WBlood) >=3)
&& (Npc_KnowsInfo(hero,DIA_Victor_ZL_IHAVEBOOK))
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_BW_BLOOD_Info()
{
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_01"); //Mam 3 fiolki z krwi¹ czarnego wilka.
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_02"); //Znakomicie. Daj mi je.
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_03"); //Masz a teraz nagroda.
	B_GiveInvItems (other,self, ItMi_ZL_WBlood, 3);
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_04"); //PrzyjdŸ do mnie o nocnej porze to dostaniesz nagrodê.
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_05"); //Dlaczego nie dasz mi rudy teraz?
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_06"); //S³odka tajemnica.
	B_LogEntry               (KsiegaDlaVictora,"Victor dosta³ ode mnie 3 fiolki z krwi¹ czarnego wilka. Teraz poleci³ mi poczekaæ do wieczora i przyjœæ do niego po nagrodê.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_DROGA
//========================================

INSTANCE DIA_Victor_ZL_DROGA (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 3;
   condition    = DIA_Victor_ZL_DROGA_Condition;
   information  = DIA_Victor_ZL_DROGA_Info;
   permanent	= FALSE;
   description	= "Dobra teraz nagroda.";
};

FUNC INT DIA_Victor_ZL_DROGA_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Victor_ZL_BW_BLOOD))
&& (Wld_IsTime(23,00,03,30 ))
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_DROGA_Info()
{
    AI_Output (other, self ,"DIA_Victor_ZL_DROGA_15_01"); //Dobra teraz nagroda.
    AI_Output (self, other ,"DIA_Victor_ZL_DROGA_03_02"); //Dobra choæ za mn¹. Nie trzymam jej w obozie.
    AI_Output (other, self ,"DIA_Victor_ZL_DROGA_15_03"); //Tylko bez ¿adnych sztuczek, bo dostaniesz po gêbie!
    AI_Output (self, other ,"DIA_Victor_ZL_DROGA_03_04"); //Jasne...
	Npc_ExchangeRoutine(self,"Follow");
	B_LogEntry               (KsiegaDlaVictora,"Victor kaza³ udaæ siê z nim poza Obóz w jakieœ tajemne miejsce. Poszed³em z nim w koñcu chodzi o moj¹ nagrodê. Choæ mam z³e przeczucia.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_PRAY
//========================================

INSTANCE DIA_Victor_ZL_PRAY (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 4;
   condition    = DIA_Victor_ZL_PRAY_Condition;
   information  = DIA_Victor_ZL_PRAY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Victor_ZL_PRAY_Condition()
{
if (Npc_GetDistToWP(hero,"JOSEP2")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_Victor_ZL_PRAY_Info()
{
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_01"); //O potê¿ny Sattiku! WyjdŸ z czeluœci piekie³ i podziel siê swoj¹ moc¹!
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_02"); //Przynios³em ci dar, który zaraz otrzymasz. Krew poleje siê a ty bêdziesz móg³ nasyciæ ni¹ swoje jestestwo. 
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_03"); //Ju¿ czas zar¿n¹æ ofiarê!
	CreateInvItems (self, ItWr_ZL_Book, 1);
    AI_Output (other, self ,"DIA_Victor_ZL_PRAY_15_04"); //Ty durny pajacu... Na nic ci siê to nie zda!
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_05"); //Sattik ucieszy siê tym bardziej jak dostanie krew ofiary, która mocno siê broni³a. 
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_06"); //Nie tak jak tamci. Sztylet w plecy to nie to co daje najwiêksz¹ radochê.
    AI_Output (other, self ,"DIA_Victor_ZL_PRAY_15_07"); //Zamknij siê i walcz.
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_08"); //Sattik jest g³odny twej krwi!
	B_LogEntry               (KsiegaDlaVictora,"Victorowi odbi³o i zacz¹³ odprawiaæ rytua³ w czasie którego da³ mi do zrozumienia, ¿e chcê mnie zabiæ. Jego niedoczekanie!");
	Snd_Play 	    ("MFX_DESTROYUNDEAD_CAST" );
	Wld_PlayEffect  ("spellFX_MassDeath",hero,BAN_40067_Victor, 0, 0, 0, TRUE);
	AI_PlayAni		(BAN_40067_Victor, "T_HEASHOOT_2_STAND" );
	Npc_ChangeAttribute(pc_hero,ATR_HITPOINTS,-50);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Victor_HELLO1 (C_INFO)
{
   npc          = BAN_40067_Victor;
   nr           = 1;
   condition    = DIA_Victor_HELLO1_Condition;
   information  = DIA_Victor_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Victor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Victor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_02"); //Mam na imiê Victor. Szczerze mówiæ trochê siê nudzê. Jak widaæ z reszt¹.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_03"); //Nie masz nic ciekawego do roboty?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_04"); //Rabowanie ludzi ze Starego Obozu ju¿ nie sprawia mi przyjemnoœci jak kiedyœ.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_05"); //Czego wiêc szukasz?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_06"); //Mistyki i objawienia.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_07"); //Wiêc mo¿e idŸ do Sekty na bagnach. Chyba, ¿e zapach bagien ciê odrzuca.
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_08"); //Nie lubiê tej bandy ³ysych kretynów. Œni¹cy to tylko ich fantazja i efekt palenia zielska. Ja szukam czegoœ prawdziwego ch³opcze.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_09"); //Mianowicie?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_10"); //Dowiem siê tego. Prêdzej czy póŸniej znajdê to czego szukam a mam ju¿ odpowieni trop.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_11"); //Jaki trop?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_12"); //To tajemnica. Spadaj ju¿.
    AI_StopProcessInfos	(self);

};

