//poprawione i sprawdzone - Reflide

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================
//edit by Reflide

INSTANCE DIA_Raeuber_EXIT(C_INFO)
{
	npc             = NON_5050_Raeuber;
	nr              = 999;
	condition	= DIA_Raeuber_EXIT_Condition;
	information	= DIA_Raeuber_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Raeuber_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Raeuber_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
var int oszukany99;
//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Raeuber_HELLO (C_INFO)
{
   npc          = NON_5050_Raeuber;
   nr           = 1;
   condition    = DIA_Raeuber_HELLO_Condition;
   information  = DIA_Raeuber_HELLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_HELLO_Condition()
{

    if !(Npc_KnowsInfo (hero, DIA_Connor_ENEMY))
{
    return TRUE;
};
};

FUNC VOID DIA_Raeuber_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_01"); //Ej, cz³owieku!
    AI_Output (other, self ,"DIA_Raeuber_HELLO_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_03"); //Tam, w jaskini znalaz³em skarb. Jednak stadko kretoszczurów nie pozwala mi wejœæ.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_03_04"); //Pomó¿ mi je zabiæ, a podzielê siê zyskami.

    Info_ClearChoices	(DIA_Raeuber_HELLO);
    Info_AddChoice		(DIA_Raeuber_HELLO, "Dobra, chodŸmy.", DIA_Raeuber_HELLO_OK);
    Info_AddChoice		(DIA_Raeuber_HELLO, "Spadaj.", DIA_Raeuber_HELLO_WON);
};

FUNC VOID DIA_Raeuber_HELLO_OK()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO_OK_15_01"); //Dobra. ChodŸmy.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_OK_03_02"); //IdŸ za mn¹!
    Info_ClearChoices		(DIA_Raeuber_HELLO);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	oszukany99 = true;
    Npc_ExchangeRoutine (self,"go");
    AI_StopProcessInfos	(self);
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_NONE );
	NON_5052_Raeuber.guild = GIL_NONE;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_NONE );
	NON_5051_Raeuber.guild = GIL_NONE;
};

FUNC VOID DIA_Raeuber_HELLO_WON()
{
    AI_Output (other, self ,"DIA_Raeuber_HELLO_WON_15_01"); //Spadaj.
    AI_Output (self, other ,"DIA_Raeuber_HELLO_WON_03_02"); //Jesteœ g³upcem.
	oszukany99 = false; 
    Info_ClearChoices		(DIA_Raeuber_HELLO);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DUREN
//========================================

INSTANCE DIA_Raeuber_DUREN (C_INFO)
{
   npc          = NON_5050_Raeuber;
   nr           = 2;
   condition    = DIA_Raeuber_DUREN_Condition;
   information  = DIA_Raeuber_DUREN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_DUREN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_HELLO))
    && (Npc_GetDistToWP(self, "BANDITOS01") < 1000)
    && (oszukany99 == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_DUREN_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_DUREN_03_01"); //Co za dureñ! Jesteœ strasznie ³atwowierny, wiesz? 
    AI_Output (self, other ,"DIA_Raeuber_DUREN_03_02"); //Braæ go ch³opcy!
    AI_Output (other, self ,"DIA_Raeuber_DUREN_15_03"); //Zobaczymy, kto bêdzie zbiera³ zêby z pod³ogi.
    AI_DrawWeapon (other);
         
	B_SetPermAttitude	(NON_5050_Raeuber,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_5051_Raeuber,	ATT_HOSTILE);    
	B_SetPermAttitude	(NON_5052_Raeuber,	ATT_HOSTILE);   
	
    AI_StopProcessInfos	(self);
	
	if (kapitel < 4)
	{
	Npc_SetTrueGuild (self,GIL_BDT );
	self.guild = GIL_BDT;
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_BDT );
	NON_5052_Raeuber.guild = GIL_BDT;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_BDT );
	NON_5051_Raeuber.guild = GIL_BDT;
	}
	else
	{
	Npc_SetTrueGuild (self,GIL_GRD );
	self.guild = GIL_GRD;
	
	Npc_SetTrueGuild (NON_5052_Raeuber,GIL_GRD );
	NON_5052_Raeuber.guild = GIL_GRD;
	
	Npc_SetTrueGuild (NON_5051_Raeuber,GIL_GRD );
	NON_5051_Raeuber.guild = GIL_GRD;
	};
};

instance dia_non_5050_pickpocket(c_info) {
    npc = non_5050_raeuber;
    nr = 900;
    condition = dia_non_5050_pickpocket_condition;
    information = dia_non_5050_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5050_pickpocket_condition() {
	e_beklauen(baseThfChanceNON, 20);
};

func void dia_non_5050_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5050_pickpocket);
	info_addchoice(dia_non_5050_pickpocket, dialog_back, dia_non_5050_pickpocket_back);
	info_addchoice(dia_non_5050_pickpocket, dialog_pickpocket, dia_non_5050_pickpocket_doit);
};

func void dia_non_5050_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_5050_pickpocket);
};

func void dia_non_5050_pickpocket_back() {
    info_clearchoices(dia_non_5050_pickpocket);
};