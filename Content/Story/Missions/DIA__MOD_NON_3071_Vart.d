// *Script was make in Easy Dialog Maker (EDM)
var int polujvart ;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Vart_EXIT(C_INFO)
{
	npc             = NON_3071_Vart;
	nr              = 999;
	condition	= DIA_Vart_EXIT_Condition;
	information	= DIA_Vart_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Vart_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vart_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Vart_HELLO1 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 1;
   condition    = DIA_Vart_HELLO1_Condition;
   information  = DIA_Vart_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jesteœ myœliwym?";
};

FUNC INT DIA_Vart_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vart_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO1_15_01"); //Jesteœ myœliwym?
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_02"); //Tak, jestem czeladnikiem Cavalorna.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_03"); //Nazywam siê Vart.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_04"); //Jednak nie mogê ciê niczego nauczyæ.
    AI_Output (self, other ,"DIA_Vart_HELLO1_03_05"); //Zbyt s³abo siê na tym znam.
	polujvart = false;
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Vart_HELLO2 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 2;
   condition    = DIA_Vart_HELLO2_Condition;
   information  = DIA_Vart_HELLO2_Info;
   permanent	= FALSE;
   description	= "Sk¹d siê tu wzi¹³eœ?";
};

FUNC INT DIA_Vart_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vart_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO2_15_01"); //Sk¹d siê tu wzi¹³eœ?
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_02"); //Kiedyœ by³em Kopaczem, ale uciek³em z kopalni.
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_03"); //Ca³y swój urobek odda³em jednemu Stra¿nikowi za pomoc w ucieczce.
    AI_Output (other, self ,"DIA_Vart_HELLO2_15_04"); //Kim by³ ten Stra¿nik?
    AI_Output (self, other ,"DIA_Vart_HELLO2_03_05"); //Nazywa³ siê Drake.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Vart_HELLO3 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 3;
   condition    = DIA_Vart_HELLO3_Condition;
   information  = DIA_Vart_HELLO3_Info;
   permanent	= true;
   description	= "ChodŸmy zapolowaæ!";
};

FUNC INT DIA_Vart_HELLO3_Condition()
{
	if (polujvart == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Vart_HELLO3_Info()
{
	AI_Output (other, self ,"DIA_Vart_HELLO3_15_01"); //ChodŸmy zapolowaæ!
	if (kapitel >= 2)
	{
    AI_Output (self, other ,"DIA_Vart_HELLO3_03_02"); //Bardzo chêtnie. ProwadŸ!
    AI_Output (self, other ,"DIA_Vart_HELLO3_03_03"); //Tylko nie idŸ zbyt daleko.
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"follow");
	polujvart = true;
	}
	else
	{
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_04"); //Chyba niezbyt wiele wiesz o walce, co? 
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_05"); //Nie mam zamiaru ubijaæ potworów za ciebie.
	AI_Output (self, other ,"DIA_Vart_HELLO3_03_06"); //PrzyjdŸ, gdy bêdziesz silniejszy. 
	};
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Vart_HELLO4 (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 4;
   condition    = DIA_Vart_HELLO4_Condition;
   information  = DIA_Vart_HELLO4_Info;
   permanent	= true;
   description	= "Wracaj do domu.";
};

FUNC INT DIA_Vart_HELLO4_Condition()
{
    if (polujvart == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Vart_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Vart_HELLO4_15_01"); //Wracaj do domu.
    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
	self.aivar[AIV_PARTYMEMBER] = false;
	polujvart = false;
};

//========================================
//-----------------> PotionHeal
//========================================

INSTANCE DIA_Ash_PotionHeal (C_INFO)
{
   npc          = NON_3071_Vart;
   nr           = 1;
   condition    = DIA_Ash_PotionHeal_Condition;
   information  = DIA_Ash_PotionHeal_Info;
   permanent	= true;
   description	= "WeŸ tê miksturê lecznicz¹. ";
};

FUNC INT DIA_Ash_PotionHeal_Condition()
{
    if (polujvart == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ash_PotionHeal_Info()
{
    AI_Output (other, self ,"DIA_Ash_PotionHeal_15_01"); //WeŸ tê miksturê lecznicz¹. 
	Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma³¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj œredni¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du¿¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Big);
    };
	
  //  AI_StopProcessInfos	(self);
};
func void DIA_Ash_PotionHeal_BACK ()
{
Info_ClearChoices	(DIA_Ash_PotionHeal);	
};
func void DIA_Ash_PotionHeal_Small ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_01, 1);
		AI_UseItem (self, ItFo_Potion_Health_01);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma³¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj œredni¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du¿¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Big);
    };
};
func void DIA_Ash_PotionHeal_Mid ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_02, 1);
		AI_UseItem (self, ItFo_Potion_Health_02);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma³¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj œredni¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du¿¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Big);
    };
};
func void DIA_Ash_PotionHeal_Big ()
{
        B_GiveInvItems (other, self, ItFo_Potion_Health_03, 1);
		AI_UseItem (self, ItFo_Potion_Health_03);
		Info_ClearChoices	(DIA_Ash_PotionHeal);	
	Info_AddChoice		(DIA_Ash_PotionHeal,DIALOG_BACK	,DIA_Ash_PotionHeal_BACK);
    if (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj ma³¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Small);
};
    if (Npc_HasItems (other, ItFo_Potion_Health_02) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj œredni¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Mid);
    };
    if (Npc_HasItems (other, ItFo_Potion_Health_03) >=1)
    {
	Info_AddChoice		(DIA_Ash_PotionHeal,"Daj du¿¹ miksturê lecznicz¹" ,DIA_Ash_PotionHeal_Big);
    };
};