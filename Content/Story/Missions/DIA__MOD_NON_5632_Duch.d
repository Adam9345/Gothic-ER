// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Duch_EXIT(C_INFO)
{
	npc             = NON_5632_Duch;
	nr              = 999;
	condition		= DIA_Duch_EXIT_Condition;
	information		= DIA_Duch_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Duch_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Duch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Duch_HELLO1 (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_HELLO1_Condition;
   information  = DIA_Duch_HELLO1_Info;
   permanent	= FALSE;
   description	= "O Innosie! Nieumar³y!";
};

FUNC INT DIA_Duch_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Duch_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Duch_HELLO1_15_01"); //O Innosie! Nieumar³y!
    AI_Output (self, other ,"DIA_Duch_HELLO1_03_02"); //OdejdŸ, je¿eli nie potrafisz mi pomóc!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Duch_HELLO2 (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 2;
   condition    = DIA_Duch_HELLO2_Condition;
   information  = DIA_Duch_HELLO2_Info;
   permanent	= FALSE;
   description	= "Znasz Magnusa?";
};

FUNC INT DIA_Duch_HELLO2_Condition()
{
    if (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_01"); //Znasz Magnusa?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_02"); //Przys³a³ ciê tutaj? Ba³ siê przyjœæ sam?
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_03"); //Jest w szoku po tym co siê sta³o.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_04"); //Jakim cudem ja w ogóle z tob¹ rozmawiam?!
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_05"); //Jesteœ iluzj¹?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_06"); //Nie. Ostrze, którym zosta³em ugodzony by³o przeklête.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_07"); //Wch³onê³o moc Beliara.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_08"); //Ka¿dy, kto od niego zginie skazany jest na wieczn¹ tu³aczkê po œwiecie. 
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_09"); //Mogê w jakiœ sposób uwolniæ ciê od kl¹twy?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_10"); //Musisz odnaleŸæ i zniszczyæ to przeklête ostrze.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_11"); //Kto jest w jego posiadaniu?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_12"); //To Stra¿nik Œwi¹tynny Gor Na Tokas.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_13"); //To nie bêdzie ³atwa walka...
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_14"); //Wiem. Je¿eli uda ci siê to zrobiæ, bêdziesz musia³ odnaleŸæ o³tarz oczyszczenia i zniszczyæ miecz.
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_15"); //Gdzie znajdê taki o³tarz?
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_16"); //Nie mam pojêcia. W zamierzch³ych czasach orkowie budowali takie o³tarze przy cmentarzyskach.
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_17"); //W¹tpiê, ¿eby któryœ z nich siê zachowa³...
    AI_Output (other, self ,"DIA_Duch_HELLO2_15_18"); //Bêdê szuka³ do skutku. 
    AI_Output (self, other ,"DIA_Duch_HELLO2_03_19"); //Powodzenia.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Odnalaz³em myœliwego. Okazuje siê, ¿e ostrze od którego zgin¹³ by³o przeklête. Teraz skazany jest na wieczn¹ tu³aczkê. Chyba, ¿e odnajdê Gor Na Tokas'a i zniszczê zaklêty miecz, który posiada."); 

    B_GiveXP (50);
};
//========================================
//-----------------> TokasSwordDuch
//========================================

INSTANCE DIA_Duch_TokasSwordDuch (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_TokasSwordDuch_Condition;
   information  = DIA_Duch_TokasSwordDuch_Info;
   permanent	= FALSE;
   description	= "Mam miecz Tokasa.";
};

FUNC INT DIA_Duch_TokasSwordDuch_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Sword))
    && (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_TokasSwordDuch_Info()
{
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_01"); //Mam miecz Tokasa.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_02"); //Jak uda³o ci siê tego dokonaæ?!
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_03"); //Zachowam to dla siebie.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_04"); //Bardziej mnie obchodzi, co mam z tym teraz zrobiæ.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_05"); //Masz w rêkach potê¿n¹ i szybk¹ broñ, ale jeœli chcesz uwolniæ mnie od kl¹twy, musisz j¹ zniszczyæ.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_06"); //Jak mam to zrobiæ?
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_07"); //Musisz porozmawiaæ z jakimœ magiem. Oni ci pomog¹.
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_08"); //Mówi³eœ coœ o jakimœ o³tarzu...
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_09"); //Tak. Do zniszczenia broni bêdzie wam potrzebny o³tarz oczyszczenia.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_10"); //I tu jest najwiêkszy problem. Od dawna nikt tych o³tarzy nie widzia³.
    AI_Output (self, other ,"DIA_Duch_TokasSwordDuch_03_11"); //Zw³aszcza w Kolonii...
    AI_Output (other, self ,"DIA_Duch_TokasSwordDuch_15_12"); //Spróbujê znaleŸæ jakiœ sposób. Tymczasem udam siê do magów.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Pokaza³em miecz Biornowi (lub raczej temu czemuœ, co po nim zosta³o). Muszê go teraz zanieœæ do magów, którzy pomog¹ mi dokonaæ procesu zniszczenia ostrza. Szkoda, bo to naprawdê dobry miecz..."); 
	CronosTalk_Sword = true;
    B_GiveXP (350);
};

//========================================
//-----------------> TokasFire
//========================================

INSTANCE DIA_Duch_TokasFire (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_TokasFire_Condition;
   information  = DIA_Duch_TokasFire_Info;
   permanent	= FALSE;
   description	= "Tokas kaza³ mi ciê spaliæ.";
};

FUNC INT DIA_Duch_TokasFire_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_TokasFire_Info()
{
    AI_Output (other, self ,"DIA_Duch_TokasFire_15_01"); //Tokas kaza³ mi ciê spaliæ.
    AI_Output (self, other ,"DIA_Duch_TokasFire_03_02"); //Nie odebra³eœ mu miecza?
    AI_Output (other, self ,"DIA_Duch_TokasFire_15_03"); //Nie, jest z nim zbyt silny. 
    AI_Output (self, other ,"DIA_Duch_TokasFire_03_04"); //A co je¿eli to nie pomo¿e i moja dusza wci¹¿ bêdzie potêpiona?! Skazujesz mnie na wieczne nieszczêœcie!
	AI_Output (self, other ,"DIA_Duch_TokasFire_03_05"); //Nie mogê na to pozwoliæ! Dobrze, ¿e wci¹¿ mam mój miecz!
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Powiedzia³em Biornowi, ¿e Gor Na Tokas kaza³ mi spaliæ jego ¿yj¹ce szcz¹tki, aby uwolniæ go od kl¹twy. Niestety Biorn nie uwierzy³ w moje intencje i zacz¹³ mnie atakowaæ. Jeœli to co mówi³ Tokas jest prawd¹ bezpoœrednia walka nie ma sensu. Powinienem siê wycofaæ i zaatakowaæ zwojami czarów ognia. "); 
    B_GiveXP (350);
	CronosTalk_Sword = false;
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> PorzucMisje
//========================================

INSTANCE DIA_Duch_PorzucMisje (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 2;
   condition    = DIA_Duch_PorzucMisje_Condition;
   information  = DIA_Duch_PorzucMisje_Info;
   permanent	= FALSE;
   description	= "Nie zamierzam ci pomagaæ.";
};

FUNC INT DIA_Duch_PorzucMisje_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Duch_TokasSwordDuch))
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    && (Npc_HasItems (other, Tokas_Sword) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_PorzucMisje_Info()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_15_01"); //Nie zamierzam ci pomagaæ.
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_15_02"); //Zachowam to ostrze dla siebie.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_03_03"); //Nie rób tego. Jego z³a moc ciê opêta.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_03_04"); //Trzeba je jak najszybciej zniszczyæ.

    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    Info_AddChoice		(DIA_Duch_PorzucMisje, "Tym ostrzem mogê wiele zmieniæ. Mo¿e pos³u¿yæ do walki ze z³em!", DIA_Duch_PorzucMisje_NIE);
    Info_AddChoice		(DIA_Duch_PorzucMisje, "Ta broñ... Masz racjê. Muszê j¹ zniszczyæ.", DIA_Duch_PorzucMisje_TAK);
};

FUNC VOID DIA_Duch_PorzucMisje_NIE()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_NIE_15_01"); //Tym ostrzem mogê wiele zmieniæ. Mo¿e pos³u¿yæ do walki ze z³em!
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_NIE_03_02"); //Opêta ciê i zniszczy wszystko, o co dba³eœ.
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_NIE_15_03"); //Próbujesz mnie oszukaæ! To ty jesteœ z³y.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Zachowa³em broñ dla siebie skazuj¹c Biorna na wieczn¹ tu³aczkê. Chyba, ¿e znajdê inny sposób, jak uwolniæ jego duszê od cierpieñ.");
    Log_SetTopicStatus       (CH1_NieSpelnionaZemsta, LOG_FAILED);
    MIS_NieSpelnionaZemsta = LOG_FAILED;
    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    AI_StopProcessInfos	(self);
	CronosTalk_Sword = false;
};

FUNC VOID DIA_Duch_PorzucMisje_TAK()
{
    AI_Output (other, self ,"DIA_Duch_PorzucMisje_TAK_15_01"); //Ta broñ... Masz racjê. Muszê j¹ zniszczyæ.
    AI_Output (self, other ,"DIA_Duch_PorzucMisje_TAK_03_02"); //Ruszaj czym prêdzej, zanim ta broñ ca³kiem ciê opêta.
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Z³e myœli niemal zaw³adnê³y mym umys³em. Jednak w porê uda³o mi siê otrz¹sn¹æ. ");
    Info_ClearChoices		(DIA_Duch_PorzucMisje);
    AI_StopProcessInfos	(self);
	CronosTalk_Sword = true;
};

//========================================
//-----------------> ENDMISSION
//========================================

INSTANCE DIA_Duch_ENDMISSION (C_INFO)
{
   npc          = NON_5632_Duch;
   nr           = 1;
   condition    = DIA_Duch_ENDMISSION_Condition;
   information  = DIA_Duch_ENDMISSION_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Duch_ENDMISSION_Condition()
{
    if (SwordClear == true)
    && (MIS_NieSpelnionaZemsta == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Duch_ENDMISSION_Info()
{
    AI_Output (self, other ,"DIA_Duch_ENDMISSION_03_01"); //Uda³o ci siê.
    AI_Output (other, self ,"DIA_Duch_ENDMISSION_15_02"); //Sk¹d wiesz?
    AI_Output (self, other ,"DIA_Duch_ENDMISSION_03_03"); //Czujê to. Dziêkujê, ch³opcze.
    B_GiveXP (450);
	B_LogEntry                     (CH1_NieSpelnionaZemsta,"Biorn mo¿e spocz¹æ w spokoju. Kl¹twa zosta³a zdjêta. Mogê iœæ i przekazaæ dobr¹ wiadomoœæ Magnusowi.");
    AI_StopProcessInfos	(self); 
	Npc_ExchangeRoutine (self, "die");
};
