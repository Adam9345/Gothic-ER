//poprawione i sprawdzone -  

//poprawne g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorNaTokas_EXIT(C_INFO)
{
	npc             = TPL_1490_GorNaTokas;
	nr              = 999;
	condition	= DIA_GorNaTokas_EXIT_Condition;
	information	= DIA_GorNaTokas_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorNaTokas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorNaTokas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1_ZWYKLY
//========================================

INSTANCE DIA_GorNaTokas_HELLO1_ZWYKLY (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_HELLO1_ZWYKLY_Condition;
   information  = DIA_GorNaTokas_HELLO1_ZWYKLY_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_GorNaTokas_HELLO1_ZWYKLY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaTokas_HELLO1_ZWYKLY_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_ZWYKLY_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_ZWYKLY_03_02"); //Jestem Gor Na Tokas, Stra¿nik Œwi¹tynny. 
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_ZWYKLY_03_03"); //Ale kim ty jesteœ, ¿ebym w ogóle z tob¹ rozmawia³?
};

//========================================
//-----------------> IF_NOT_MAGNUS
//========================================

INSTANCE DIA_GorNaTokas_IF_NOT_MAGNUS (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 2;
   condition    = DIA_GorNaTokas_IF_NOT_MAGNUS_Condition;
   information  = DIA_GorNaTokas_IF_NOT_MAGNUS_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e masz ciekawy miecz.";
};

FUNC INT DIA_GorNaTokas_IF_NOT_MAGNUS_Condition()
{
    if (MIS_NieSpelnionaZemsta =! LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_IF_NOT_MAGNUS_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_IF_NOT_MAGNUS_15_01"); //Widzê, ¿e masz ciekawy miecz.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_02"); //Ciekawy?
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_03"); //Ch³opaczku, lepiej st¹d odejdŸ. Nie chcia³byœ by ten miecz znalaz³ siê w twoich trzewiach, wierz mi.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_04"); //Nie skoñczy³oby siê to dla ciebie za dobrze.
    AI_Output (other, self ,"DIA_GorNaTokas_IF_NOT_MAGNUS_15_05"); //Grozisz mi?
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_06"); //Gro¿ê? Ale¿ nie! Wierzê, ¿e mój Pan rozprawi siê z takimi jak ty we w³aœciwym czasie.
    AI_Output (self, other ,"DIA_GorNaTokas_IF_NOT_MAGNUS_03_07"); //A teraz odejdŸ st¹d, bo poznasz jego gniew! 
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaTokas_HELLO1 (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_HELLO1_Condition;
   information  = DIA_GorNaTokas_HELLO1_Info;
   permanent	= FALSE;
   description	= "Zabi³eœ myœliwego Biorna!";
};

FUNC INT DIA_GorNaTokas_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Duch_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_01"); //Zabi³eœ myœliwego Biorna!
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_02"); //Mia³ zgin¹æ! To jego przeznaczenie.
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_03"); //O czym ty w ogóle mówisz?
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_04"); //Co to ziele z wami robi, do cholery?!
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_05"); //Czas na tego cz³owieka ju¿ nadszed³...
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_06"); //Jakim prawem decydujesz o ludzkim ¿yciu?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_07"); //Jestem tylko narzêdziem w rêkach czegoœ potê¿niejszego.
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_08"); //Kogoœ, komu ten cz³owiek przeszkadza³.
    AI_Output (other, self ,"DIA_GorNaTokas_HELLO1_15_09"); //O czym ty mówisz?
    AI_Output (self, other ,"DIA_GorNaTokas_HELLO1_03_10"); //Jestem wys³annikiem, emisariuszem...
	B_LogEntry                     (CH1_NieSpelnionaZemsta,"Rozmawia³em z Tokasem. Bredzi³ coœ o tym, ¿e jest tylko narzêdziem w rêkach kogoœ znacznie potê¿niejszego. Coœ mi tu œmierdzi mrocznymi si³ami...");

};
//========================================
//-----------------> Sword
//========================================

INSTANCE DIA_GorNaTokas_Sword (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_Sword_Condition;
   information  = DIA_GorNaTokas_Sword_Info;
   permanent	= FALSE;
   description	= "Oddaj mi swój miecz!";
};

FUNC INT DIA_GorNaTokas_Sword_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_HELLO1)) && (!Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Sword_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Sword_15_01"); //Oddaj mi swój miecz!
    AI_Output (self, other ,"DIA_GorNaTokas_Sword_03_02"); //To ostrze zosta³o mi przekazane przez wys³anników mojego Pana.
    AI_Output (other, self ,"DIA_GorNaTokas_Sword_15_03"); //Oddaj mi je!
    AI_Output (self, other ,"DIA_GorNaTokas_Sword_03_04"); //Po moim trupie!
	TPL_1490_GorNaTokas.guild = GIL_NONE;
	Npc_SetTrueGuild (TPL_1490_GorNaTokas,GIL_NONE);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};


//========================================
//-----------------> Dogadanie
//========================================

INSTANCE DIA_GorNaTokas_Dogadanie (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 1;
   condition    = DIA_GorNaTokas_Dogadanie_Condition;
   information  = DIA_GorNaTokas_Dogadanie_Info;
   permanent	= FALSE;
   description	= "Mo¿e siê jakoœ dogadamy.";
};

FUNC INT DIA_GorNaTokas_Dogadanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_HELLO1))
    && (!Npc_KnowsInfo (hero, DIA_GorNaTokas_Sword))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Dogadanie_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_01"); //Mo¿e siê jakoœ dogadamy.
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_02"); //He? O co ci chodzi?
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_03"); //Po prostu chcê uwolniæ tego cz³owieka.
    AI_Output (other, self ,"DIA_GorNaTokas_Dogadanie_15_04"); //Rozumiem, ¿e czymœ ci zawini³. Pozby³eœ siê go, wiêc dlaczego ma dalej cierpieæ?
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_05"); //Nie obchodzi mnie jego los, ale sam fakt, ¿e nie zaatakowa³eœ mnie jest godzien pochwa³y.
    AI_Output (self, other ,"DIA_GorNaTokas_Dogadanie_03_06"); //Mo¿esz go zabiæ przy u¿yciu ognia. Na inne obra¿enia jest odporny. 
    B_LogEntry                     (CH1_NieSpelnionaZemsta,"Mogê zabiæ Biorna przy u¿yciu ognia. Na inne obra¿enia jest odporny.");

    B_GiveXP (250);
    CreateInvItems (self, ItArScrollFireball, 2);
    B_GiveInvItems (self, other, ItArScrollFireball, 2);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Bezlitosny
//========================================

INSTANCE DIA_GorNaTokas_Bezlitosny (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 2;
   condition    = DIA_GorNaTokas_Bezlitosny_Condition;
   information  = DIA_GorNaTokas_Bezlitosny_Info;
   permanent	= FALSE;
   description	= "Zabi³em Biorna.";
};

FUNC INT DIA_GorNaTokas_Bezlitosny_Condition()
{
    
    if (Npc_IsDead(NON_5632_Duch)) && (Npc_KnowsInfo (hero, DIA_GorNaTokas_Dogadanie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Bezlitosny_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Bezlitosny_15_01"); //Zabi³em Biorna.
    AI_Output (self, other ,"DIA_GorNaTokas_Bezlitosny_03_02"); //To nie moja sprawa. Zrobi³eœ jak uwa¿a³eœ.
    AI_Output (self, other ,"DIA_GorNaTokas_Bezlitosny_03_03"); //Doceniam, ¿e mnie nie zaatakowa³eœ. Nie mia³byœ najmniejszych szans. Dobrze, ¿e znasz swoje miejsce.
};

//========================================
//-----------------> Sworddd
//========================================

INSTANCE DIA_GorNaTokas_Sworddd (C_INFO)
{
   npc          = TPL_1490_GorNaTokas;
   nr           = 3;
   condition    = DIA_GorNaTokas_Sworddd_Condition;
   information  = DIA_GorNaTokas_Sworddd_Info;
   permanent	= FALSE;
   description	= "Sk¹d masz ten miecz?";
};

FUNC INT DIA_GorNaTokas_Sworddd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaTokas_Bezlitosny))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaTokas_Sworddd_Info()
{
    AI_Output (other, self ,"DIA_GorNaTokas_Sworddd_15_01"); //Sk¹d masz ten miecz?
    AI_Output (self, other ,"DIA_GorNaTokas_Sworddd_03_02"); //To dziedzictwo skrytobójców, którzy dzia³ali na tych ziemiach.
    AI_Output (self, other ,"DIA_GorNaTokas_Sworddd_03_03"); //Nie musisz wszystkiego wiedzieæ.
};