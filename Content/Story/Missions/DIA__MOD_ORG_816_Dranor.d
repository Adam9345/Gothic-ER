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
   description	= "Ty chyba masz co� na sumieniu.";
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
    AI_Output (other, self ,"DIA_Organisator_Fight_15_01"); //Ty chyba masz co� na sumieniu.
    AI_Output (self, other ,"DIA_Organisator_Fight_03_02"); //Zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Organisator_Fight_15_03"); //Do�� tego, gdzie s� kosztowno�ci Cronosa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_04"); //Nie mam poj�cia, przysi�gam!
	AI_Output (self, other ,"DIA_Organisator_Fight_03_05"); //Um�wili�my si� z Vincentem. Ja kradn� sakiewk�, a on j� sprzedaje po jakim� czasie w Starym Obozie. Mia� nie wzbudza� podejrze�.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_06"); //Dzie� wcze�niej zap�aci� mi za robot� z g�ry 50 bry�ek rudy. Nie mam poj�cia, gdzie si� teraz ukrywa. 
	AI_Output (self, other ,"DIA_Organisator_Fight_03_07"); //Powiedzia� tylko, �e ma �wietn� kryj�wk� w pobli�u obozu. M�wi�, �e nikt przenigdy go tam nie znajdzie.
	AI_Output (self, other ,"DIA_Organisator_Fight_03_08"); //Masz, we� rud�, kt�r� zarobi�em. I tak pewnie wkr�tce sko�cze w piachu.
	AI_DrawWeapon		(self);
	AI_Output (other, self ,"DIA_Organisator_Fight_15_09"); //Nie r�b nic pochopnie!
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Znalaz�em Szkodnika, kt�ry okrad� Cronosa. Zanim pope�ni� samob�jstwo przyzna� si� i powiedzia�, �e nie wie, gdzie jest jego wsp�lnik. Podobno ma �wietn� kryj�wk� do�� blisko Nowego Obozu. Musz� przeszuka� pobliskie jaskinie.");
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
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_02"); //�egnam.
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_03"); //S�ucham?
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_04"); //Nie rozumiesz? Won natr�cie!
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_05"); //A jak nie odejdziesz to mog� ci pom�c!
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_06"); //Kto� tu jest chyba bardzo nerwowy.
    AI_Output (other, self ,"DIA_Organisator_HI_AbsolutlySukinsyn_15_07"); //Ale dobrze, jak chcesz. Bywaj.
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_08"); //Odwal si� ode mnie, dupku. 
    AI_Output (self, other ,"DIA_Organisator_HI_AbsolutlySukinsyn_03_09"); //Dostaniesz jeszcze lekcj� �ycia w Kolonii.
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