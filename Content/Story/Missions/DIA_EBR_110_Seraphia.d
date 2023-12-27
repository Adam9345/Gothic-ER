// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Seraphia_EXIT(C_INFO)
{
	npc             = EBR_110_Seraphia;
	nr              = 999;
	condition	= DIA_Seraphia_EXIT_Condition;
	information	= DIA_Seraphia_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Seraphia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Seraphia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloSeraphia
//========================================

INSTANCE DIA_Seraphia_HelloSeraphia (C_INFO)
{
   npc          = EBR_110_Seraphia;
   nr           = 2;
   condition    = DIA_Seraphia_HelloSeraphia_Condition;
   information  = DIA_Seraphia_HelloSeraphia_Info;
   permanent	= TRUE;
   description	= "Witaj, nieznajoma!";
};

FUNC INT DIA_Seraphia_HelloSeraphia_Condition()
{
    if (Kapitel < 5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Seraphia_HelloSeraphia_Info()
{
    AI_Output (other, self ,"DIA_Seraphia_HelloSeraphia_15_01"); //Witaj, nieznajoma!
    AI_Output (self, other ,"DIA_Seraphia_HelloSeraphia_03_02"); //Wybacz, ale nie mogê z tob¹ rozmawiaæ. Magnaci nie pozwalaj¹ nam na kontakt z innymi skazañcami.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GomezDied
//========================================

INSTANCE DIA_Seraphia_GomezDied (C_INFO)
{
   npc          = EBR_110_Seraphia;
   nr           = 1;
   condition    = DIA_Seraphia_GomezDied_Condition;
   information  = DIA_Seraphia_GomezDied_Info;
   permanent	= FALSE;
   description	= "Magnaci gryz¹ ziemie, a ty jesteœ wolna.";
};

FUNC INT DIA_Seraphia_GomezDied_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Seraphia_GomezDied_Info()
{
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_01"); //Magnaci gryz¹ ziemie, a ty jesteœ wolna.
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_02"); //Naprawdê? Jesteœ niesamowity!
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_03"); //Nie spodziewa³am siê, ¿e kiedykolwiek siê uwolniê od ich tyrañskich rz¹dów.
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_04"); //Stokrotne dziêki.
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_05"); //Co zamierzasz teraz robiæ?
    AI_Output (self, other ,"DIA_Seraphia_GomezDied_03_06"); //Podobno ludzie z Nowego Obozu maj¹ wkrótce zaj¹æ zamek. Raczej zostanê tutaj.
    AI_Output (other, self ,"DIA_Seraphia_GomezDied_15_07"); //Jasne.
};

