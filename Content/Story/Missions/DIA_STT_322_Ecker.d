// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_322_Schatten_Exit (C_INFO)
{
	npc			= STT_322_Schatten;
	nr			= 999;
	condition	= DIA_STT_322_Schatten_Exit_Condition;
	information	= DIA_STT_322_Schatten_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_322_Schatten_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_322_Schatten_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					HOW ARE YOU
// **************************************************

INSTANCE DIA_Fingers_HowAreYou (C_INFO)
{
	npc				= STT_322_Schatten;
	nr				= 2;
	condition		= DIA_Fingers_HowAreYou_Condition;
	information		= DIA_Fingers_HowAreYou_Info;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC INT DIA_Fingers_HowAreYou_Condition()
{	
		return 1;
};

FUNC VOID DIA_Fingers_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_Fingers_HowAreYou_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Fingers_HowAreYou_05_01"); //W porz¹dku, mam ostatnio ma³o roboty. Pomagam tylko Diego i Lorenzo w drobnych sprawach. 
	AI_Output (self, other,"DIA_Fingers_HowAreYou_05_02"); //Rudy te¿ mi nie brakuje. Ogó³em jestem zadowolony. A ty?
	AI_Output (other, self,"DIA_Fingers_HowAreYou_15_03"); //Jakoœ ujdzie. W sumie nikt mnie nigdy o to nie zapyta³.
	AI_Output (self, other,"DIA_Fingers_HowAreYou_05_04"); //No widzisz! (uœmiecha siê przyjaŸnie) Tak w ogóle to jestem Ecker.	
};

var int ecker_theft;
//========================================
//-----------------> THEFT_MODE
//========================================

INSTANCE DIA_Ecker_THEFT_MODE (C_INFO)
{
   npc          = STT_322_Schatten;
   nr           = 800;
   condition    = DIA_Ecker_THEFT_MODE_Condition;
   information  = DIA_Ecker_THEFT_MODE_Info;
   permanent	= true;
   description	= "(Ukradnij raport)";
};

FUNC INT DIA_Ecker_THEFT_MODE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Lorenzo_OFERTA) && MIS_ZmianaLorenza == LOG_RUNNING && !Npc_KnowsInfo (hero, DIA_Togard_GiveFakeOre) && (ecker_theft == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Ecker_THEFT_MODE_Info()
{
    AI_Output (other, self ,"DIA_Ecker_THEFT_MODE_15_01"); //S³ysza³em, ¿e dzisiaj maj¹ siê odbyæ jakieœ walki na arenie. Podobno ma walczyæ ktoœ nowy?
	if (hero.attribute[ATR_dexterity] >= 15)
	{
    AI_Output (self, other ,"DIA_Ecker_THEFT_MODE_03_02"); //Doprawdy?
	AI_Output (other, self ,"DIA_Ecker_THEFT_MODE_15_03"); //Tak, koleœ jest z Nowego Obozu.
	AI_Output (self, other ,"DIA_Ecker_THEFT_MODE_03_04"); //No to szykuje siê dobra zabawa dziœ wieczorem. Bêdziesz?
	AI_Output (other, self ,"DIA_Ecker_THEFT_MODE_15_05"); //Jasne. 
	
	B_GiveXP (100);
	PrintScreen ("Kradzie¿ udana!",-1,-1,"font_old_10_white.tga",1);
	CreateInvItem (hero, itmi_OM_LorenzoRaport);
	ecker_theft = true;
	}
	else
	{
	AI_Output (self, other ,"DIA_Ecker_THEFT_MODE_03_05"); //Nie interesuje mnie to.
	PrintScreen ("Ryzyk zbyt du¿e!",-1,-1,"font_old_10_white.tga",1);
	};
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					GIVE RAPORT
// **************************************************

INSTANCE DIA_Fingers_GiveRaport (C_INFO)
{
	npc				= STT_322_Schatten;
	nr				= 2;
	condition		= DIA_Fingers_GiveRaport_Condition;
	information		= DIA_Fingers_GiveRaport_Info;
	permanent		= 0;
	description		= "Znalaz³em ten raport."; 
};

FUNC INT DIA_Fingers_GiveRaport_Condition()
{	
	if NPC_HasItems (hero,itmi_OM_LorenzoRaport) >= 1
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_GiveRaport_Info()
{
	AI_Output (other, self,"DIA_Fingers_GiveRaport_15_00"); //Znalaz³em ten raport.
	AI_Output (self, other,"DIA_Fingers_GiveRaport_05_01"); //Gdzie by³? Na Innosa, wielkie dziêki. Idê czym prêdzej oddaæ go Magnatom. 
	B_GiveInvItems (other, self, itmi_OM_LorenzoRaport,1);
};