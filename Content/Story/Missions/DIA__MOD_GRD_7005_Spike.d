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
    AI_Output (self, other ,"DIA_Spike_HELLO1_03_02"); //Nie wida�? Zejd� mi z oczu!
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
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_01"); //To ty za�atwi�e� t� spraw� z Kopaczami.
    AI_Output (self, other ,"DIA_Spike_HELLO2_03_02"); //Wielkie dzi�ki! R�wny z ciebie go��. Nie mog� ci du�o zaoferowa�. Mam tu ca�kiem fajny miecz. Na pocz�tek b�dzie dla ciebie w sam raz.
    AI_Output (other, self ,"DIA_Spike_HELLO2_15_03"); //Dzi�ki. Bro� zawsze si� przyda.
	
    B_LogEntry                     (CH1_SpikeLoser,"Spike by� bardzo zadowolony z moich dzia�a�. Zyska�em kolejnego sojusznika w obozie.");
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
    AI_Output (self, other ,"DIA_Spike_HELLO3_03_02"); //W obozie panuje spok�j, wi�c mam ma�o pracy. Zreszt� poza tob� nikt nie kr�ci si� wok� skrzy�.
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
   description	= "Pracowa� mo�e dla ciebie ostatnio Akl?";
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
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_01"); //Pracowa� mo�e dla ciebie ostatnio Akl?
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_02"); //Hmm? Czego ty chcesz?
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_03"); //Akl powiedzia� mi, �e nosi� ostatnio dla ciebie skrzynie. Pono� zap�aci�e� mu za robot� 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_04"); //CO? Ten robak nic nie zrobi� od kiedy wyszed� z Kopalni. Ci�gle tylko siedzi i my�li nie wiadomo o czym.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_05"); //50 bry�ek rudy za noszenie skrzy�? A to dobre! W �yciu bym nikomu tyle nie zap�aci�. 
    AI_Output (other, self ,"DIA_Spike_AklWorker_15_06"); //Rozumiem, �e mam si� czu� oszukany.
    AI_Output (self, other ,"DIA_Spike_AklWorker_03_07"); //Chyba tak. Spadaj ju�. Jestem zaj�ty. 
    B_LogEntry                     (CH1_OreInOM,"Spike wy�mia� mnie, gdy zapyta�em czy Akl faktycznie mu ostatnio pomaga�. Chyba musz� jeszcze raz pogada� z Kopaczem. ");

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
   description	= "Eskortowa�em i chroni�em drwala Hargosa... ";
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
    AI_Output (other, self ,"DIA_Spike_ZND_15_01"); //Eskortowa�em i chroni�em drwala Hargosa gdy r�ba� drewno na deski w lesie. 
    AI_Output (self, other ,"DIA_Spike_ZND_03_02"); //No i tak trzyma�. Teraz mo�esz i�� chwile odsapn��. 
    AI_Output (other, self ,"DIA_Spike_ZND_15_03"); //Nie przypadkiem ci to oznajmi�em. Chyba nale�y mi si� jaka� zap�ata?
    AI_Output (self, other ,"DIA_Spike_ZND_03_04"); //Dobra, dobra. We� t� rud� skoro nadstawia�e� karku w tej sprawie.
    AI_Output (self, other ,"DIA_Spike_ZND_03_05"); //To chyba najlepsza motywacja co?
    AI_Output (other, self ,"DIA_Spike_ZND_15_06"); //Piwo i ch�� wolno�ci s� r�wnie dobre.
	B_GiveInvItems (self,other, ItMi_HargosWood, 150);
	B_GiveXP(XP_OMNeedWood);
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Odebra�em od Spike�a zap�at� za wykonan� misj�. Czas na na inne obowi�zki i wyzwania.");
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