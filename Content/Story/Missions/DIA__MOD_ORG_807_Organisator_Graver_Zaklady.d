// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Organisator_EXIT(C_INFO)
{
	npc             = ORG_807_Organisator;
	nr              = 999;
	condition	= DIA_Organisator_EXIT_Condition;
	information	= DIA_Organisator_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Organisator_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Organisator_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Organisator_HELLO1 (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_HELLO1_Condition;
   information  = DIA_Organisator_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Organisator_HELLO1_Condition()
{
 if !(Npc_GetDistToWP(hero,"CHUJ2")<3000)
{
    return TRUE;
};
};
FUNC VOID DIA_Organisator_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Organisator_HELLO1_03_01"); //Hej! Dorabiam sobie na boku organizuj¹c ma³e zak³ady.
    AI_Output (self, other ,"DIA_Organisator_HELLO1_03_02"); //Chcesz coœ obstawiæ? A mo¿e wolisz zagraæ w koœci?
	Log_CreateTopic   	(GE_Games,LOG_NOTE);
    B_LogEntry          (GE_Games,"Szkodnik imieniem Greaver oferuje grê w koœci i proste zak³ady. Je¿eli mam chêæ zagraæ, muszê siê do niego zg³osiæ.");
};

//========================================
//-----------------> ZkladyInfos
//========================================

INSTANCE DIA_Organisator_ZkladyInfos (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 2;
   condition    = DIA_Organisator_ZkladyInfos_Condition;
   information  = DIA_Organisator_ZkladyInfos_Info;
   permanent	= 0;
   description	= "Na czym polegaj¹ zak³ady?";
};

FUNC INT DIA_Organisator_ZkladyInfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_ZkladyInfos_Info()
{
    AI_Output (other, self ,"DIA_Organisator_ZkladyInfos_15_01"); //Na czym polegaj¹ zak³ady?
    AI_Output (self, other ,"DIA_Organisator_ZkladyInfos_03_02"); //To proste. Obstawiamy 50 bry³ek rudy na to, kogo dzisiaj pobije Butch.
    AI_Output (other, self ,"DIA_Organisator_ZkladyInfos_15_03"); //Dosyæ oryginalne.
};

//========================================
//-----------------> Obstawiaj
//========================================
var int gra4;
INSTANCE DIA_Organisator_Obstawiaj (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 3;
   condition    = DIA_Organisator_Obstawiaj_Condition;
   information  = DIA_Organisator_Obstawiaj_Info;
   permanent	= TRUE;
   description	= "Chcê obstawiæ...";
};

FUNC INT DIA_Organisator_Obstawiaj_Condition()
{
    if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Organisator_Obstawiaj_Info()
{
    AI_Output (other, self ,"DIA_Organisator_Obstawiaj_15_01"); //Chcê obstawiæ...

    Info_ClearChoices		(DIA_Organisator_Obstawiaj);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, DIALOG_BACK, DIA_Organisator_Obstawiaj_BACK);
  //  Info_AddChoice		(DIA_Organisator_Obstawiaj, "Baal Kagan", DIA_Organisator_Obstawiaj_Baal);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Szkodnik przy kotle", DIA_Organisator_Obstawiaj_Handlarz);
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Szkodnik przy ognisku", DIA_Organisator_Obstawiaj_Ktos1);
	if (Npc_KnowsInfo (hero, DIA_Shrike_GetLost))
	{
    Info_AddChoice		(DIA_Organisator_Obstawiaj, "Krzykacz", DIA_Organisator_Obstawiaj_Ktos2);
	};
  //  Info_AddChoice		(DIA_Organisator_Obstawiaj, "Osoba3", DIA_Organisator_Obstawiaj_Ktos3);
};

FUNC VOID DIA_Organisator_Obstawiaj_BACK()
{
    Info_ClearChoices	(DIA_Organisator_Obstawiaj);
};

FUNC VOID DIA_Organisator_Obstawiaj_Baal()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Baal_15_01"); //Dziœ dostanie Baal Kagan.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Baal_03_01"); //Ho, ho! NieŸle!

		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Baal_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,ORG_817_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Handlarz()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Handlarz_15_01"); //Dziœ dostanie Szkodnik przy kotle.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Handlarz_03_01"); //Ho, ho! NieŸle!
		Npc_SetTarget(Org_851_Butch,ORG_817_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Handlarz_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Ktos1()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Ktos1_15_01"); //Dziœ dostanie Szkodnik przy ognisku.
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos1_03_01"); //Ho, ho! NieŸle!
		Npc_SetTarget(Org_851_Butch,ORG_822_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos1_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,Nov_1332_BaalKagan);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};

FUNC VOID DIA_Organisator_Obstawiaj_Ktos2()
{
AI_Output (other, self ,"DIA_Organisator_Obstawiaj_Ktos2_15_01"); //Dziœ dostanie Krzykacz!
gra4 = Hlp_Random (2);
if (gra4 == true)
{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos2_03_01"); //Trafi³eœ!
		Npc_SetTarget(Org_851_Butch,ORG_842_Shrike);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
		CreateInvItems (self, ItMiNugget, 50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		}
		else 
		{
		AI_Output (self, other ,"DIA_Organisator_Obstawiaj_Ktos2_03_02"); //No, nie uda³o siê!
		B_GiveInvItems (other, self, ItMiNugget, 50);
		Npc_RemoveInvItems (self, ItMiNugget, 50);
		Npc_SetTarget(Org_851_Butch,ORG_822_Organisator);
		AI_StartState(Org_851_Butch,ZS_ATTACK,1,"");
};
AI_StopProcessInfos	(self);	
};
/*
FUNC VOID DIA_Organisator_Obstawiaj_Ktos3()
{
};

*/
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Organisator_HELLO3 (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 3;
   condition    = DIA_Organisator_HELLO3_Condition;
   information  = DIA_Organisator_HELLO3_Info;
   permanent	= TRUE;
   description	= "Zagrajmy w koœci.";
};

FUNC INT DIA_Organisator_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_HELLO1))
    {
    return TRUE;
    };
};

func void dia_organisator_hello3_choices() {
	if(npc_hasitems(hero, itminugget) >= 5) {
        info_addchoice(dia_organisator_hello3, "5 bry³ek rudy", dia_organisator_hello3_20ore);
    };
    if(npc_hasitems(hero, itminugget) >= 15) {
        info_addchoice(dia_organisator_hello3, "15 bry³ek rudy", dia_organisator_hello3_60ore);
    };
    if(npc_hasitems(hero, itminugget) >= 30) {
        info_addchoice(dia_organisator_hello3, "30 bry³ek rudy", dia_organisator_hello3_150ore);
    };
    if(npc_hasitems(hero, itminugget) >= 50) {
        info_addchoice(dia_organisator_hello3, "50 bry³ek rudy", dia_organisator_hello3_300ore);
    };
    info_addchoice(dia_organisator_hello3, "Jednak zrezygnujê.", dia_organisator_hello3_back);
};

func void dia_organisator_hello3_info() {
    ai_output(other, self, "DIA_Organisator_HELLO3_15_01");
    ai_output(self, other, "DIA_Organisator_HELLO3_03_02");
    playdicegame(1, self);
    info_clearchoices(dia_organisator_hello3);
	//dia_organisator_hello3_choices();
};

func void dia_organisator_hello3_20ore() {
	//ThrowDice(5);
    info_clearchoices(dia_organisator_hello3);
	//dia_organisator_hello3_choices();
};

func void dia_organisator_hello3_60ore() {
	//ThrowDice(15);
    info_clearchoices(dia_organisator_hello3);
	//dia_organisator_hello3_choices();
};

func void dia_organisator_hello3_150ore() {
    //ThrowDice(30);
    info_clearchoices(dia_organisator_hello3);
	//dia_organisator_hello3_choices();
};

func void dia_organisator_hello3_300ore() {
	//ThrowDice(50);
    info_clearchoices(dia_organisator_hello3);
	//dia_organisator_hello3_choices();
};

FUNC VOID DIA_Organisator_HELLO3_500Ore()
{
    AI_Output (other, self ,"DIA_Organisator_HELLO3_500Ore_15_01"); //A co mi tam! 500 bry³ek.
    AI_Output (self, other ,"DIA_Organisator_HELLO3_500Ore_03_02"); //No nieŸle! 
    B_GiveXP (150);
	
gra1 = Hlp_Random (7);
if (gra1 == 1)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 2)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 3)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 4)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 5)
{
Print ("Wygra³eœ!");
CreateInvItems (self, ItMiNugget, 500);
B_GiveInvItems (self, other, ItMiNugget, 500);
};
if (gra1 == 6)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
if (gra1 == 7)
{
AI_Output (self, other ,"DIA_Organisator_HELLO3_LOSE"); //No niestety. Nie uda³o siê. Ruda trafia do mnie!
B_GiveInvItems (other, self, ItMiNugget, 500);
};
};

FUNC VOID DIA_Organisator_HELLO3_BACK()
{
    enddicegame();
    Info_ClearChoices	(DIA_Organisator_HELLO3);
};

//========================================
//-----------------> ANDREW
//========================================

INSTANCE DIA_Organisator_ANDREW (C_INFO)
{
   npc          = ORG_807_Organisator;
   nr           = 1;
   condition    = DIA_Organisator_ANDREW_Condition;
   information  = DIA_Organisator_ANDREW_Info;
   permanent	= FALSE;
   description	= "Gadaj gdzie jest Sharky!";
};

FUNC INT DIA_Organisator_ANDREW_Condition()
{
if (Npc_KnowsInfo(hero,DIA_alvaro_ANDREW))
&& (Npc_IsDead (SLD_5575_Alvaro))
{
    return TRUE;
};
};
FUNC VOID DIA_Organisator_ANDREW_Info()
{
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_01"); //Gadaj gdzie jest Sharky!
    AI_Output (self, other ,"DIA_Organisator_ANDREW_03_02"); //Nie wiem. Nie jestem jego niañk¹.
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_03"); //Skoro wymieniliœmy siê ju¿ uprzejmoœciami to radzi³bym zachowaæ wiêkszy rozs¹dek.
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_04"); //Inaczej bêdzie powtórka!
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Organisator_ANDREW_03_05"); //Dobra zostaw mnie w spokoju a w zamian dowiesz siê gdzie on jest.
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_06"); //Jednak potrafisz myœleæ. Zamieniam siê w s³uch.
    AI_RemoveWeapon (other);
    AI_Output (self, other ,"DIA_Organisator_ANDREW_03_07"); //Poszed³ do myœliwego Aidana nieopodal. Tamten pozyskuje sporo trofeów myœliwskich.
    AI_Output (self, other ,"DIA_Organisator_ANDREW_03_08"); //Wiêc mo¿e Sharky jest tym zainteresowany. Cholera go wie.
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_09"); //Dziêki za informacje. Nastêpnym razem nie krzy¿uj ze mn¹ orê¿a.
    AI_Output (self, other ,"DIA_Organisator_ANDREW_03_10"); //To wina tego chojraka, który wys³uguje siê innymi. Wracam do Nowego Obozu liczyæ siniaki.
    AI_Output (other, self ,"DIA_Organisator_ANDREW_15_11"); //Na razie i przyjemnego liczenia...
	 B_LogEntry                     (CH1_Bodyguard,"Pokonaliœmy zbirów, teraz dziêki informacjom od Greavera musimy przeprowadziæ powa¿n¹ rozmowê z Sharky'm. Ponoæ obecnie jest u myœliwego Aidana.");
	AI_StopProcessInfos	(self);
};

instance dia_org_807_pickpocket(c_info) {
    npc = org_807_organisator;
    nr = 900;
    condition = dia_org_807_pickpocket_condition;
    information = dia_org_807_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_807_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_807_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_807_pickpocket);
	info_addchoice(dia_org_807_pickpocket, dialog_back, dia_org_807_pickpocket_back);
	info_addchoice(dia_org_807_pickpocket, dialog_pickpocket, dia_org_807_pickpocket_doit);
};

func void dia_org_807_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_807_pickpocket);
};

func void dia_org_807_pickpocket_back() {
    info_clearchoices(dia_org_807_pickpocket);
};