//poprawione i sprawdzone -  

//sprawdzone przez gothic1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================


INSTANCE DIA_Martin_EXIT(C_INFO)
{
	npc             = BAN_1603_Martin;
	nr              = 999;
	condition	= DIA_Martin_EXIT_Condition;
	information	= DIA_Martin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Martin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTO
//========================================

INSTANCE DIA_Martin_KTOTO (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 1;
   condition    = DIA_Martin_KTOTO_Condition;
   information  = DIA_Martin_KTOTO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Martin_KTOTO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Martin_KTOTO_Info()
{
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_02"); //Nazywam siê Martin. Zajmujê siê zaopatrzeniem Obozu.
    AI_Output (other, self ,"DIA_Martin_KTOTO_15_03"); //Mo¿esz mi coœ sprzedaæ?
    AI_Output (self, other ,"DIA_Martin_KTOTO_03_04"); //Sprzedajê towary tylko Bandytom.
		Log_CreateTopic	(GE_Bandit,	LOG_NOTE);
		B_LogEntry		(GE_Bandit,	"Martin sprzedaje ekwipunek tylko Bandytom.");
};
//var int ArrowTreaderAmount;
//ArrowTreaderAmount = Npc_hasitems (self, ItAmArrow);
//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Martin_TRADE (C_INFO)
{
   npc          = BAN_1603_Martin;
   nr           = 2;
   condition    = DIA_Martin_TRADE_Condition;
   information  = DIA_Martin_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Co masz na sprzeda¿?";
};

FUNC INT DIA_Martin_TRADE_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU) || (przyjaciel_Bandytow == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Martin_TRADE_Info()
{
    AI_Output (other, self ,"DIA_Martin_TRADE_15_01"); //Co masz na sprzeda¿?
    AI_Output (self, other ,"DIA_Martin_TRADE_03_02"); //Wybierz coœ.
	
	B_ClearTreaderAmmo(self);
};

instance dia_martin_pickpocket(c_info) {
    npc = ban_1603_martin;
    nr = 900;
    condition = dia_martin_pickpocket_condition;
    information = dia_martin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_martin_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_martin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_martin_pickpocket);
	info_addchoice(dia_martin_pickpocket, dialog_back, dia_martin_pickpocket_back);
	info_addchoice(dia_martin_pickpocket, dialog_pickpocket, dia_martin_pickpocket_doit);
};

func void dia_martin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_martin_pickpocket);
};

func void dia_martin_pickpocket_back() {
    info_clearchoices(dia_martin_pickpocket);
};