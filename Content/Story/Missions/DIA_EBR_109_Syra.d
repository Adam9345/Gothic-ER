// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Syra_EXIT(C_INFO)
{
	npc             = EBR_109_Syra;
	nr              = 999;
	condition	= DIA_Syra_EXIT_Condition;
	information	= DIA_Syra_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Syra_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Syra_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloSira
//========================================

INSTANCE DIA_Syra_HelloSira (C_INFO)
{
   npc          = EBR_109_Syra;
   nr           = 2;
   condition    = DIA_Syra_HelloSira_Condition;
   information  = DIA_Syra_HelloSira_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Syra_HelloSira_Condition()
{
    if (Kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Syra_HelloSira_Info()
{
    AI_Output (other, self ,"DIA_Syra_HelloSira_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Syra_HelloSira_03_02"); //OdejdŸ! Nie wolno ci ze mn¹ rozmawiaæ!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GomezDied
//========================================

INSTANCE DIA_Syra_GomezDied (C_INFO)
{
   npc          = EBR_109_Syra;
   nr           = 1;
   condition    = DIA_Syra_GomezDied_Condition;
   information  = DIA_Syra_GomezDied_Info;
   permanent	= FALSE;
   description	= "Gomez gryzie ziemie.";
};

FUNC INT DIA_Syra_GomezDied_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Syra_GomezDied_Info()
{
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_01"); //Gomez gryzie ziemie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_02"); //I bardzo dobrze. Ten dupek zas³u¿y³ sobie na to.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_03"); //Nigdy nie zapomnê dnia, gdy zosta³am zrzucona za Barierê.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_04"); //Stawia³am opór, gdy pochwycili mnie Stra¿nicy i ci idioci pobili mnie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_05"); //Ca³e szczêœcie, ¿e dostali lekcje szacunku.
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_06"); //Tak, te¿ nie pochwalam takiego traktowania kobiet.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_07"); //Jesteœ taki s³odki. Powiedz mi, jak ci na imiê?
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_08"); //Jestem...
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_09"); //A zreszt¹ niewa¿ne. Teraz jesteœ tu bohaterem i to tacy ludzie powinni rz¹dziæ w Kolonii.
    AI_Output (other, self ,"DIA_Syra_GomezDied_15_10"); //To nie dla mnie. Mam inne sprawy na g³owie.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_11"); //Ach... W takim razie powodzenia. Zaczekam tutaj, a¿ zjawi¹ siê Najemnicy z Nowego Obozu.
    AI_Output (self, other ,"DIA_Syra_GomezDied_03_12"); //Zostanê z nimi.
};

