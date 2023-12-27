//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Clayde_EXIT(C_INFO)
{
	npc             = VLK_595_Clayde;
	nr              = 999;
	condition	= DIA_Clayde_EXIT_Condition;
	information	= DIA_Clayde_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Clayde_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Clayde_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Clayde_HELLO1 (C_INFO)
{
   npc          = VLK_595_Clayde;
   nr           = 1;
   condition    = DIA_Clayde_HELLO1_Condition;
   information  = DIA_Clayde_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czeœæ!";
};

FUNC INT DIA_Clayde_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Clayde_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Clayde_HELLO1_15_01"); //Czeœæ!
    if (VLK_594_Bonie.aivar[AIV_WASDEFEATEDBYSC]==FALSE)	
    {
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_02"); //S³uchaj, to nasze podwórko! Moje i Bonie! 
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_03"); //Zje¿d¿aj st¹d zanim zrobiê z tob¹ porz¹dek!
    }
    else
    {
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_04"); //Bij¹c Bonie wpad³eœ w powa¿ne k³opoty!
        AI_Output (self, other ,"DIA_Clayde_HELLO1_03_05"); //Wkrótce ciê dopadniemy!
        AI_StopProcessInfos	(self);
    };
};

