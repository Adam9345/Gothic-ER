//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Samuel_EXIT(C_INFO)
{
	npc             = NON_2037_Samuel;
	nr              = 999;
	condition	= DIA_Samuel_EXIT_Condition;
	information	= DIA_Samuel_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Samuel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Samuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Samuel_HELLO1 (C_INFO)
{
   npc          = NON_2037_Samuel;
   nr           = 1;
   condition    = DIA_Samuel_HELLO1_Condition;
   information  = DIA_Samuel_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Samuel_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Samuel_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Samuel_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Samuel_HELLO1_03_02"); //Nazywam siê Samuel. Jestem pomocnikiem w karczmie.
    AI_Output (self, other ,"DIA_Samuel_HELLO1_03_03"); //Zazwyczaj coœ gotujê.
    AI_Output (self, other ,"DIA_Samuel_HELLO1_03_04"); //Mogê ci sprzedaæ kilka przepisów.
B_LogEntry		(GE_TraderOC,"Kopacz Samuel mo¿e mi sprzedaæ kilka przepisów."); 
};

//========================================
//-----------------> TADE
//========================================

INSTANCE DIA_Samuel_TADE (C_INFO)
{
   npc          = NON_2037_Samuel;
   nr           = 2;
   condition    = DIA_Samuel_TADE_Condition;
   information  = DIA_Samuel_TADE_Info;
   permanent	= TRUE;
   description	= "Chcê kupiæ przepis.";
};

FUNC INT DIA_Samuel_TADE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Samuel_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Samuel_TADE_Info()
{
    AI_Output (other, self ,"DIA_Samuel_TADE_15_01"); //Chcê kupiæ przepis.

    Info_ClearChoices		(DIA_Samuel_TADE);
	Info_AddChoice		(DIA_Samuel_TADE, DIALOG_BACK, DIA_Samuel_TADE_BACK);
    Info_AddChoice		(DIA_Samuel_TADE, "[Zupa z kretoszczura - 15 bry³ek]", DIA_Samuel_TADE_MoleratSoup);
	Info_AddChoice		(DIA_Samuel_TADE, "[Potrawka z chrz¹szcza - 15 bry³ek rudy]", DIA_Samuel_TADE_SnafSoup);
	Info_AddChoice		(DIA_Samuel_TADE, "[Zupa ze œcierwojada - 15 bry³ek rudy]", DIA_Samuel_TADE_ScaSoup);
	Info_AddChoice		(DIA_Samuel_TADE, "[Zupa z pe³zacza - 16 bry³ek rudy]", DIA_Samuel_TADE_CraSoup);
	Info_AddChoice		(DIA_Samuel_TADE, "[Zupa serowa - 16 bry³ek rudy]", DIA_Samuel_TADE_ChesseSoup);
};

FUNC VOID DIA_Samuel_TADE_MoleratSoup()
{
    AI_Output (other, self ,"DIA_Samuel_TADE_MoleratSoup_15_01"); //Daj mi przepis na zupê z kretoszczura.
    if (Npc_HasItems (hero, ItMiNugget)>=15)
    {
        CreateInvItems (self, ItRe_MoleratSoup, 1);
        B_GiveInvItems (self, other, ItRe_MoleratSoup, 1);
        B_GiveInvItems (other, self, ItMiNugget, 15);
    }
    else
    {
        AI_Output (self, other ,"DIA_Samuel_TADE_MoleratSoup_03_02"); //Nie masz tyle rudy przy sobie. Wróæ póŸniej.
    };
	};
	func void DIA_Samuel_TADE_SnafSoup ()
	{
	AI_Output (other, self ,"DIA_Samuel_TADE_SnafSoup_15_01"); //Daj mi przepis na tê potrawkê.
	if (Npc_HasItems (hero, ItMiNugget)>=15)
    {
        CreateInvItems (self, ItRe_SnafSoup, 1);
        B_GiveInvItems (self, other, ItRe_SnafSoup, 1);
        B_GiveInvItems (other, self, ItMiNugget, 15);
    }
    else
    {
        AI_Output (self, other ,"DIA_Samuel_TADE_SnafSoup_03_02"); //Nie ma rudy, nie ma przepisu.
    };
};
	func void DIA_Samuel_TADE_ScaSoup ()
	{
	AI_Output (other, self ,"DIA_Samuel_TADE_ScaSoup_15_01"); //Daj mi przepis na tê zupê.
	if (Npc_HasItems (hero, ItMiNugget)>=15)
    {
        CreateInvItems (self, ItRe_ScaSoup, 1);
        B_GiveInvItems (self, other, ItRe_ScaSoup, 1);
        B_GiveInvItems (other, self, ItMiNugget, 15);
    }
    else
    {
        AI_Output (self, other ,"DIA_Samuel_TADE_ScaSoup_03_02"); //Nie ma rudy, nie ma przepisu.
    };
};
	func void DIA_Samuel_TADE_CraSoup ()
	{
	AI_Output (other, self ,"DIA_Samuel_TADE_CraSoup_15_01"); //Daj mi przepis na tê zupê z pe³zacza.
	if (Npc_HasItems (hero, ItMiNugget)>=16)
    {
        CreateInvItems (self, ItRe_CrawelSoup, 1);
        B_GiveInvItems (self, other, ItRe_CrawelSoup, 1);
        B_GiveInvItems (other, self, ItMiNugget, 16);
    }
    else
    {
        AI_Output (self, other ,"DIA_Samuel_TADE_CraSoup_03_02"); //Nie ma rudy, nie ma przepisu.
    };
};
	func void DIA_Samuel_TADE_ChesseSoup ()
	{
	AI_Output (other, self ,"DIA_Samuel_TADE_ChesseSoup_15_01"); //Daj mi przepis na zupê serow¹.
	if (Npc_HasItems (hero, ItMiNugget)>=16)
    {
        CreateInvItems (self, ItRe_CheeseSoup, 1);
        B_GiveInvItems (self, other, ItRe_CheeseSoup, 1);
        B_GiveInvItems (other, self, ItMiNugget, 16);
    }
    else
    {
        AI_Output (self, other ,"DIA_Samuel_TADE_ChesseSoup_03_02"); //Trochê ci brakuje!
    };
};
func void DIA_Samuel_TADE_BACK ()
{
Info_ClearChoices		(DIA_Samuel_TADE);
};

instance dia_samuel_pickpocket(c_info) {
    npc = non_2037_samuel;
    nr = 900;
    condition = dia_samuel_pickpocket_condition;
    information = dia_samuel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_samuel_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_samuel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_samuel_pickpocket);
	info_addchoice(dia_samuel_pickpocket, dialog_back, dia_samuel_pickpocket_back);
	info_addchoice(dia_samuel_pickpocket, dialog_pickpocket, dia_samuel_pickpocket_doit);
};

func void dia_samuel_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_samuel_pickpocket);
};

func void dia_samuel_pickpocket_back() {
    info_clearchoices(dia_samuel_pickpocket);
};