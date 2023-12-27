//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gardist_EXIT(C_INFO)
{
	npc             = Grd_220_Gardist;
	nr              = 999;
	condition	= DIA_Gardist_EXIT_Condition;
	information	= DIA_Gardist_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gardist_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gardist_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PRECZ_BANDYTO
//========================================

INSTANCE DIA_Gardist_PRECZ_BANDYTO (C_INFO)
{
   npc          = Grd_220_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_PRECZ_BANDYTO_Condition;
   information  = DIA_Gardist_PRECZ_BANDYTO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_PRECZ_BANDYTO_Condition()
{
    if (Npc_HasItems (other, BAU_ARMOR_L) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_PRECZ_BANDYTO_Info()
{
    AI_Output (self, other ,"DIA_Gardist_PRECZ_BANDYTO_03_01"); //Kto ciê tu wpuœci³, przeklêty Bandyto?!
    AI_Output (other, self ,"DIA_Gardist_PRECZ_BANDYTO_15_02"); //Ja tylko...
    AI_Output (self, other ,"DIA_Gardist_PRECZ_BANDYTO_03_03"); //Zreszt¹ za póŸno na jakiekolwiek wyt³umaczenia!
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};