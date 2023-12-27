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
    AI_Output (self, other ,"DIA_Victor_ZL_03_01"); //Hej, podejd� mam spraw�.
    AI_Output (other, self ,"DIA_Victor_ZL_15_02"); //Niby jak�?
    AI_Output (self, other ,"DIA_Victor_ZL_03_03"); //Musz� zdoby� pewn� cenn� ksi�g�. Jest zapakowana w sk�r� i nale�y obecnie do Kopacza imieniem Erens.
    AI_Output (self, other ,"DIA_Victor_ZL_03_04"); //Ja nie mog� przenikn�� do Starego Obozu bo wyt�uk�em ju� zbyt wielu ludzi stamt�d i mnie pami�taj�.
    AI_Output (self, other ,"DIA_Victor_ZL_03_05"); //Ale ty jeste� jeszcze w miar� nowy. Wi�c powiniene� zrobi� mniejszy szum.
    AI_Output (self, other ,"DIA_Victor_ZL_03_06"); //To jak b�dzie?

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
   description	= "Wiesz co� o znikaj�cych ludziach?";
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
    AI_Output (other, self ,"DIA_Victor_ZL_Team_15_01"); //Wiesz co� o znikaj�cych ludziach?
    AI_Output (self, other ,"DIA_Victor_ZL_Team_03_02"); //Ja? Sk�d ten pomys�? Wiem tyle samo co i ty.
    AI_Output (self, other ,"DIA_Victor_ZL_Team_03_03"); //Nie mieszaj mnie w to.
	B_LogEntry               (ZnikajacyLudzie,"Victor nie chce by go miesza� do sprawy zaginionych ludzi Quentina.");
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
    AI_Output (self, other ,"DIA_Victor_ZL_2_03_02"); //Ale� oczywi�cie... Dostaniesz swoj� nagrod�... Ale pami�taj by nie uszkodzi� albo co gorsza zgubi� tej ksi�gi!
    AI_Output (other, self ,"DIA_Victor_ZL_2_15_03"); //W porz�dku. 
    AI_Output (self, other ,"DIA_Victor_ZL_2_03_04"); //No!
    AI_Output (other, self ,"DIA_Victor_ZL_2_15_05"); //Na razie!
	Log_CreateTopic		(KsiegaDlaVictora,	LOG_MISSION);
	Log_SetTopicStatus	(KsiegaDlaVictora,	LOG_RUNNING);
	B_LogEntry               (KsiegaDlaVictora,"Bandyta Victor chce bym zdoby� dla niego pewn� ksi�g�. W Starym Obozie powinien mie� j� Kopacz � niejaki Erens. Musz� z nim pom�wi�.");
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
   description	= "Mam ksi�g�.";
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
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_01"); //Mam ksi�g�.
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_02"); //Wspaniale. Daj mi j�.
	B_GiveInvItems (other,self, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_03"); //�wietnie. Spisa�e� si� nale�ycie. 
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_04"); //Co z moj� nagrod�?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_05"); //Zap�ata b�dzie sowita ale jeszcze nie teraz.
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_06"); //A niby kiedy?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_07"); //Przynie� mi 3 fiolki z krwi� czarnego wilka. 
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_08"); //Na choler� ci co� takiego?
    AI_Output (self, other ,"DIA_Victor_ZL_IHAVEBOOK_03_09"); //Chcesz nagrod�? To przesta� pyta�.
    AI_Output (other, self ,"DIA_Victor_ZL_IHAVEBOOK_15_10"); //Co za cyrk...
	B_LogEntry               (KsiegaDlaVictora,"Zanios�em Victorowi ksi�g� Erensa. Ten kaza� mi przynie�� 3 fiolki z krwi� czarnego wilka. Co� mi si� tu nie podoba...");
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
   description	= "Mam 3 fiolki z krwi� czarnego wilka.";
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
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_01"); //Mam 3 fiolki z krwi� czarnego wilka.
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_02"); //Znakomicie. Daj mi je.
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_03"); //Masz a teraz nagroda.
	B_GiveInvItems (other,self, ItMi_ZL_WBlood, 3);
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_04"); //Przyjd� do mnie o nocnej porze to dostaniesz nagrod�.
    AI_Output (other, self ,"DIA_Victor_ZL_BW_BLOOD_15_05"); //Dlaczego nie dasz mi rudy teraz?
    AI_Output (self, other ,"DIA_Victor_ZL_BW_BLOOD_03_06"); //S�odka tajemnica.
	B_LogEntry               (KsiegaDlaVictora,"Victor dosta� ode mnie 3 fiolki z krwi� czarnego wilka. Teraz poleci� mi poczeka� do wieczora i przyj�� do niego po nagrod�.");
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
    AI_Output (self, other ,"DIA_Victor_ZL_DROGA_03_02"); //Dobra cho� za mn�. Nie trzymam jej w obozie.
    AI_Output (other, self ,"DIA_Victor_ZL_DROGA_15_03"); //Tylko bez �adnych sztuczek, bo dostaniesz po g�bie!
    AI_Output (self, other ,"DIA_Victor_ZL_DROGA_03_04"); //Jasne...
	Npc_ExchangeRoutine(self,"Follow");
	B_LogEntry               (KsiegaDlaVictora,"Victor kaza� uda� si� z nim poza Ob�z w jakie� tajemne miejsce. Poszed�em z nim w ko�cu chodzi o moj� nagrod�. Cho� mam z�e przeczucia.");
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
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_01"); //O pot�ny Sattiku! Wyjd� z czelu�ci piekie� i podziel si� swoj� moc�!
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_02"); //Przynios�em ci dar, kt�ry zaraz otrzymasz. Krew poleje si� a ty b�dziesz m�g� nasyci� ni� swoje jestestwo. 
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_03"); //Ju� czas zar�n�� ofiar�!
	CreateInvItems (self, ItWr_ZL_Book, 1);
    AI_Output (other, self ,"DIA_Victor_ZL_PRAY_15_04"); //Ty durny pajacu... Na nic ci si� to nie zda!
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_05"); //Sattik ucieszy si� tym bardziej jak dostanie krew ofiary, kt�ra mocno si� broni�a. 
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_06"); //Nie tak jak tamci. Sztylet w plecy to nie to co daje najwi�ksz� radoch�.
    AI_Output (other, self ,"DIA_Victor_ZL_PRAY_15_07"); //Zamknij si� i walcz.
    AI_Output (self, other ,"DIA_Victor_ZL_PRAY_03_08"); //Sattik jest g�odny twej krwi!
	B_LogEntry               (KsiegaDlaVictora,"Victorowi odbi�o i zacz�� odprawia� rytua� w czasie kt�rego da� mi do zrozumienia, �e chc� mnie zabi�. Jego niedoczekanie!");
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Victor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Victor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_02"); //Mam na imi� Victor. Szczerze m�wi� troch� si� nudz�. Jak wida� z reszt�.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_03"); //Nie masz nic ciekawego do roboty?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_04"); //Rabowanie ludzi ze Starego Obozu ju� nie sprawia mi przyjemno�ci jak kiedy�.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_05"); //Czego wi�c szukasz?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_06"); //Mistyki i objawienia.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_07"); //Wi�c mo�e id� do Sekty na bagnach. Chyba, �e zapach bagien ci� odrzuca.
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_08"); //Nie lubi� tej bandy �ysych kretyn�w. �ni�cy to tylko ich fantazja i efekt palenia zielska. Ja szukam czego� prawdziwego ch�opcze.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_09"); //Mianowicie?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_10"); //Dowiem si� tego. Pr�dzej czy p�niej znajd� to czego szukam a mam ju� odpowieni trop.
    AI_Output (other, self ,"DIA_Victor_HELLO1_15_11"); //Jaki trop?
    AI_Output (self, other ,"DIA_Victor_HELLO1_03_12"); //To tajemnica. Spadaj ju�.
    AI_StopProcessInfos	(self);

};

