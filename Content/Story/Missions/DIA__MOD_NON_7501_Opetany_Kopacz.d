// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Opetany_Kopacz7501_EXIT(C_INFO)
{
	npc             = NON_7501_Opetany_Kopacz;
	nr              = 999;
	condition	= DIA_Opetany_Kopacz7501_EXIT_Condition;
	information	= DIA_Opetany_Kopacz7501_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Opetany_Kopacz7501_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz7501_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Opetany_Kopacz7501_Angry (C_INFO)
{
   npc          = NON_7501_Opetany_Kopacz;
   nr           = 1;
   condition    = DIA_Opetany_Kopacz7501_Angry_Condition;
   information  = DIA_Opetany_Kopacz7501_Angry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Opetany_Kopacz7501_Angry_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz7501_Angry_Info()
{
    AI_Output (self, other ,"DIA_Opetany_Kopacz7501_Angry_03_01"); //IdŸ precz! Modlê siê do mojego Boga, bo obieca³ mi potêgê!
    AI_Output (other, self ,"DIA_Opetany_Kopacz7501_Angry_15_02"); //Jesteœ s³ug¹ Beliara?
    AI_Output (self, other ,"DIA_Opetany_Kopacz7501_Angry_03_03"); //Tak! I zamierzam z³o¿yæ mu twoj¹ g³owê w ofierze na o³tarzu, piesku Innosa!
    AI_Output (self, other ,"DIA_Opetany_Kopacz7501_Angry_03_04"); //GIÑ!!!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

