// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator816_EXIT(C_INFO)
{
	npc             = ORG_816_Organisator;
	nr              = 999;
	condition		= DIA_Organisator816_EXIT_Condition;
	information		= DIA_Organisator816_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator816_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator816_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Organisator_Fight (C_INFO)
{
   npc          = ORG_816_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_Fight_Condition;
   information  = DIA_Organisator_Fight_Info;
   permanent	= FALSE;
   description	= "Ty chyba masz coœ na sumieniu.";
};

FUNC INT DIA_Organisator_Fight_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_CronosTheft))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_Fight_Info()
{
    AI_Output (other, self ,"DIA_Organisator_Fight_15_01"); //Ty chyba masz coœ na sumieniu.
    AI_Output (self, other ,"DIA_Organisator_Fight_03_02"); //Zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Organisator_Fight_15_03"); //Doœæ tego, gdzie s¹ kosztownoœci Cronosa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_04"); //Nie mam pojêcia, przysiêgam!
	AI_Output (self, other ,"DIA_Organisator_Fight_03_05"); //Umówiliœmy siê z Vincentem. Ja kradnê sakiewkê, a on j¹ sprzedaje po jakimœ czasie w Starym Obozie. Mia³ nie wzbudzaæ podejrzeñ.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_06"); //Dzieñ wczeœniej zap³aci³ mi za robotê z góry 50 bry³ek rudy. Nie mam pojêcia, gdzie siê teraz ukrywa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_07"); //Powiedzia³ tylko, ¿e ma œwietn¹ kryjówkê w pobli¿u obozu. Mówi³, ¿e nikt przenigdy go tam nie znajdzie.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_08"); //Masz, weŸ rudê, któr¹ zarobi³em. I tak pewnie wkrótce skoñcze w piachu.
	AI_DrawWeapon		(self);
	AI_Output (other, self ,"DIA_Organisator_Fight_15_09"); //Nie rób nic pochopnie!
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Znalaz³em Szkodnika, który okrad³ Cronosa. Zanim pope³ni³ samobójstwo przyzna³ siê i powiedzia³, ¿e nie wie, gdzie jest jego wspólnik. Podobno ma œwietn¹ kryjówkê doœæ blisko Nowego Obozu. Muszê przeszukaæ pobliskie jaskinie.");
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50); 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "die");
};

//========================================
//-----------------> HI_AbsolutlySukinsyn
//========================================

INSTANCE DIA_Organisator_HI_AbsolutlySukinsyn (C_INFO)
{
   npc          = ORG_816_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_HI_AbsolutlySukinsyn_Condition;
   information  = DIA_Organisator_HI_AbsolutlySukinsyn_Info;
   permanent	= FALSE;
   description	= "Witam.";
};

FUNC INT DIA_Organisator_HI_AbsolutlySukinsyn_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Organisator_HI_AbsolutlySukinsyn_Info()
{
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_01"); //Witam.
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_02"); //¯egnam.
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_03"); //S³ucham?
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_04"); //Nie rozumiesz? Won natrêcie!
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_05"); //A jak nie odejdziesz to mogê ci pomóc!
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_06"); //Ktoœ tu jest chyba bardzo nerwowy.
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_07"); //Ale dobrze, jak chcesz. Bywaj.
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_08"); //Odwal siê ode mnie, dupku. 
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_09"); //Dostaniesz jeszcze lekcjê ¿ycia w Kolonii.
    AI_StopProcessInfos	(self);
};

instance dia_org_816_pickpocket(c_info) {
    npc = org_816_organisator;
    nr = 900;
    condition = dia_org_816_pickpocket_condition;
    information = dia_org_816_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_816_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_816_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_816_pickpocket);
	info_addchoice(dia_org_816_pickpocket, dialog_back, dia_org_816_pickpocket_back);
	info_addchoice(dia_org_816_pickpocket, dialog_pickpocket, dia_org_816_pickpocket_doit);
};

func void dia_org_816_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_816_pickpocket);
};

func void dia_org_816_pickpocket_back() {
    info_clearchoices(dia_org_816_pickpocket);
};