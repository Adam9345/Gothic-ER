//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Vincent_EXIT(C_INFO)
{
	npc             = ORG_956_Vincent;
	nr              = 999;
	condition	= DIA_Vincent_EXIT_Condition;
	information	= DIA_Vincent_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Vincent_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vincent_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEFF
//========================================

INSTANCE DIA_Vincent_THIEFF (C_INFO)
{
   npc          = ORG_956_Vincent;
   nr           = 1;
   condition    = DIA_Vincent_THIEFF_Condition;
   information  = DIA_Vincent_THIEFF_Info;
   permanent	= FALSE;
   description	= "No proszê, co za wspania³a kryjówka.";
};

FUNC INT DIA_Vincent_THIEFF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_Fight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Vincent_THIEFF_Info()
{
    AI_Output (other, self ,"DIA_Vincent_THIEFF_15_01"); //No proszê, co za wspania³a kryjówka. Myœla³eœ, ¿e jak wejdziesz za wodospad, to znikniesz w tajemniczych okolicznoœciach?
    AI_Output (self, other ,"DIA_Vincent_THIEFF_03_02"); //Jak mnie znalaz³eœ?
    AI_Output (other, self ,"DIA_Vincent_THIEFF_15_03"); //To nieistotne. Oddaj to co ukrad³eœ.
    AI_Output (self, other ,"DIA_Vincent_THIEFF_03_04"); //Wiêc Cronos ciê tu przys³a³? W takim razie giñ!
	
	CreateInvItems (self, ItMi_CronosPrecious, 1);
	
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Vincent_HELLO1 (C_INFO)
{
   npc          = ORG_956_Vincent;
   nr           = 1;
   condition    = DIA_Vincent_HELLO1_Condition;
   information  = DIA_Vincent_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Vincent_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vincent_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_02"); //Skazañcem. 
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_03"); //Domyœli³em siê.
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_04"); //Wiêc domyœl siê, ¿e nie zamierzam z tob¹ rozmawiaæ.
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_05"); //Dlaczego? Chcia³em siê tylko czegoœ dowiedzieæ.
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_06"); //Co to ksi¹¿kê piszesz? Móg³bym siê ni¹ podetrzeæ i nie zamierzam ci nic ujawniaæ.
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_07"); //Skoro tak stawiasz sprawê to nic nie wskóram.
};

instance dia_vincent_pickpocket(c_info) {
    npc = org_956_vincent;
    nr = 900;
    condition = dia_vincent_pickpocket_condition;
    information = dia_vincent_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vincent_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_vincent_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vincent_pickpocket);
	info_addchoice(dia_vincent_pickpocket, dialog_back, dia_vincent_pickpocket_back);
	info_addchoice(dia_vincent_pickpocket, dialog_pickpocket, dia_vincent_pickpocket_doit);
};

func void dia_vincent_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_vincent_pickpocket);
};

func void dia_vincent_pickpocket_back() {
    info_clearchoices(dia_vincent_pickpocket);
};