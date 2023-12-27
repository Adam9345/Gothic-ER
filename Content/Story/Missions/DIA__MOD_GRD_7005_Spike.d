//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Spike_EXIT(C_INFO)
{
	npc             = GRD_7005_Spike;
	nr              = 999;
	condition		= DIA_Spike_EXIT_Condition;
	information		= DIA_Spike_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Spike_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Spike_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Spike_HELLO1 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 1;
   condition    = DIA_Spike_HELLO1_Condition;
   information  = DIA_Spike_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Spike_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Spike_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Spike_HELLO1_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Spike_HELLO1_03_02"); //Nie widaæ? ZejdŸ mi z oczu!
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Spike_HELLO2 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 2;
   condition    = DIA_Spike_HELLO2_Condition;
   information  = DIA_Spike_HELLO2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Spike_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KUCHARZ_OreGiveZaplata))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_HELLO2_Info()
{
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_01"); //To ty za³atwi³eœ tê sprawê z Kopaczami.
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_02"); //Wielkie dziêki! Równy z ciebie goœæ. Nie mogê ci du¿o zaoferowaæ. Mam tu ca³kiem fajny miecz. Na pocz¹tek bêdzie dla ciebie w sam raz.
    AI_Output (other, self ,"DIA_Spike_HELLO2_15_03"); //Dziêki. Broñ zawsze siê przyda.
	
    B_LogEntry                     (CH1_SpikeLoser,"Spike by³ bardzo zadowolony z moich dzia³añ. Zyska³em kolejnego sojusznika w obozie.");
    Log_SetTopicStatus       (CH1_SpikeLoser, LOG_SUCCESS);
    MIS_SpikeLoser = LOG_SUCCESS;
    B_GiveXP (100);
	CreateInvItems (self,ItMw_1H_Sword_Short_05,1);
	B_GiveInvItems (self,other,ItMw_1H_Sword_Short_05,1);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Spike_HELLO3 (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 3;
   condition    = DIA_Spike_HELLO3_Condition;
   information  = DIA_Spike_HELLO3_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Spike_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Spike_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Spike_HELLO3_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Spike_HELLO3_03_02"); //W obozie panuje spokój, wiêc mam ma³o pracy. Zreszt¹ poza tob¹ nikt nie krêci siê wokó³ skrzyñ.
};

//========================================
//-----------------> AklWorker
//========================================

INSTANCE DIA_Spike_AklWorker (C_INFO)
{
   npc          		= GRD_7005_Spike;
   nr           		= 1;
   condition    	= DIA_Spike_AklWorker_Condition;
   information  	= DIA_Spike_AklWorker_Info;
   permanent	= FALSE;
   description	= "Pracowa³ mo¿e dla ciebie ostatnio Akl?";
};

FUNC INT DIA_Spike_AklWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Akl_ore))
    && (hero_knows_hysenfinder == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Spike_AklWorker_Info()
{
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_01"); //Pracowa³ mo¿e dla ciebie ostatnio Akl?
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_02"); //Hmm? Czego ty chcesz?
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_03"); //Akl powiedzia³ mi, ¿e nosi³ ostatnio dla ciebie skrzynie. Ponoæ zap³aci³eœ mu za robotê 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_04"); //CO? Ten robak nic nie zrobi³ od kiedy wyszed³ z Kopalni. Ci¹gle tylko siedzi i myœli nie wiadomo o czym.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_05"); //50 bry³ek rudy za noszenie skrzyñ? A to dobre! W ¿yciu bym nikomu tyle nie zap³aci³. 
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_06"); //Rozumiem, ¿e mam siê czuæ oszukany.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_07"); //Chyba tak. Spadaj ju¿. Jestem zajêty. 
    B_LogEntry                     (CH1_OreInOM,"Spike wyœmia³ mnie, gdy zapyta³em czy Akl faktycznie mu ostatnio pomaga³. Chyba muszê jeszcze raz pogadaæ z Kopaczem. ");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZND
//========================================

INSTANCE DIA_Spike_ZND (C_INFO)
{
   npc          = GRD_7005_Spike;
   nr           = 1;
   condition    = DIA_Spike_ZND_Condition;
   information  = DIA_Spike_ZND_Info;
   permanent	= FALSE;
   description	= "Eskortowa³em i chroni³em drwala Hargosa... ";
};

FUNC INT DIA_Spike_ZND_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_Hargos_ZND_OMINE))
{
    return TRUE;
};
};
FUNC VOID DIA_Spike_ZND_Info()
{
    AI_Output (other, self ,"DIA_Spike_ZND_15_01"); //Eskortowa³em i chroni³em drwala Hargosa gdy r¹ba³ drewno na deski w lesie. 
    AI_Output (self, other ,"DIA_Spike_ZND_03_02"); //No i tak trzymaæ. Teraz mo¿esz iœæ chwile odsapn¹æ. 
    AI_Output (other, self ,"DIA_Spike_ZND_15_03"); //Nie przypadkiem ci to oznajmi³em. Chyba nale¿y mi siê jakaœ zap³ata?
    AI_Output (self, other ,"DIA_Spike_ZND_03_04"); //Dobra, dobra. WeŸ tê rudê skoro nadstawia³eœ karku w tej sprawie.
    AI_Output (self, other ,"DIA_Spike_ZND_03_05"); //To chyba najlepsza motywacja co?
    AI_Output (other, self ,"DIA_Spike_ZND_15_06"); //Piwo i chêæ wolnoœci s¹ równie dobre.
	B_GiveInvItems (self,other, ItMi_HargosWood, 150);
	B_GiveXP(XP_OMNeedWood);
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Odebra³em od Spike’a zap³atê za wykonan¹ misjê. Czas na na inne obowi¹zki i wyzwania.");
	Log_SetTopicStatus	     (ZapotrzebowanieNaDrewno,	LOG_SUCCESS);
	
};

instance dia_spike_pickpocket(c_info) {
    npc = grd_7005_spike;
    nr = 900;
    condition = dia_spike_pickpocket_condition;
    information = dia_spike_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_spike_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_spike_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_spike_pickpocket);
	info_addchoice(dia_spike_pickpocket, dialog_back, dia_spike_pickpocket_back);
	info_addchoice(dia_spike_pickpocket, dialog_pickpocket, dia_spike_pickpocket_doit);
};

func void dia_spike_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_spike_pickpocket);
};

func void dia_spike_pickpocket_back() {
    info_clearchoices(dia_spike_pickpocket);
};