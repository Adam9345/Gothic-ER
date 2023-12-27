//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_CoErpresser_EXIT(C_INFO)
{
	npc             = ORG_889_CoErpresser;
	nr              = 999;
	condition		= DIA_CoErpresser_EXIT_Condition;
	information		= DIA_CoErpresser_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_CoErpresser_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CoErpresser_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pogadanka
//========================================

INSTANCE DIA_CoErpresser_Pogadanka (C_INFO)
{
   npc          = ORG_889_CoErpresser;
   nr           = 1;
   condition    = DIA_CoErpresser_Pogadanka_Condition;
   information  = DIA_CoErpresser_Pogadanka_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_CoErpresser_Pogadanka_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CoErpresser_Pogadanka_Info()
{
    AI_Output (other, self ,"DIA_CoErpresser_Pogadanka_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_CoErpresser_Pogadanka_03_02"); //Po co mi dupê zawracasz? Przecie¿ mo¿esz przejœæ.
    AI_Output (self, other ,"DIA_CoErpresser_Pogadanka_03_03"); //Mi³ej pracy w Wolnej Kopalni!
};

//========================================
//-----------------> Myto
//========================================

INSTANCE DIA_CoErpresser_Myto (C_INFO)
{
   npc          = ORG_889_CoErpresser;
   nr           = 2;
   condition    = DIA_CoErpresser_Myto_Condition;
   information  = DIA_CoErpresser_Myto_Info;
   permanent	= FALSE;
   description	= "Po co w ogóle zbieracie myto?";
};

FUNC INT DIA_CoErpresser_Myto_Condition()
{
    return TRUE;
};

FUNC VOID DIA_CoErpresser_Myto_Info()
{
    AI_Output (other, self ,"DIA_CoErpresser_Myto_15_01"); //Po co w ogóle zbieracie myto?
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_02"); //A dlaczego nie? Wed³ug nas konwoje ze Starego Obozu s¹ zbyt rzadko napadane.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_03"); //A my lubimy dobre burdy, hehe.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_04"); //Nawet nie masz pojêcia ilu ludzi têdy przechodzi codziennie. Nie mo¿emy jednak pobieraæ myta w Obozie.
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_05"); //Lee przekona³ Laresa, aby zabroni³ nam napadów na Kretów. Szef ostatnio trochê za bardzo w³azi w dupê Najemnikom. 
    AI_Output (self, other ,"DIA_CoErpresser_Myto_03_06"); //Ale raz siê ¿yje! Tutaj nikt nas nie z³apie, w pobli¿u jest sporo niez³ych kryjówek.
};

