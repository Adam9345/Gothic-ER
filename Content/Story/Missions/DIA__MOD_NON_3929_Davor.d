// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Davor_EXIT(C_INFO)
{
	npc             = NON_3929_Davor;
	nr              = 999;
	condition	= DIA_Davor_EXIT_Condition;
	information	= DIA_Davor_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Davor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Davor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Davor_HELLO1 (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_HELLO1_Condition;
   information  = DIA_Davor_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Davor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Davor_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_02"); //Ja? Nazywam siê Davor. Jestem samotnym myœliwym. 
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_03"); //Polujê g³ównie przy u¿yciu ³uku. Zbli¿am siê tylko do MARTWEJ zwierzyny.
};
//========================================
//-----------------> BowTrain
//========================================

INSTANCE DIA_Davor_BowTrain (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_BowTrain_Condition;
   information  = DIA_Davor_BowTrain_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie nauczyæ jak pos³ugiwaæ siê ³ukiem?";
};

FUNC INT DIA_Davor_BowTrain_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_BowTrain_Info()
{
    AI_Output (other, self ,"DIA_Davor_BowTrain_15_01"); //Mo¿esz mnie nauczyæ jak pos³ugiwaæ siê ³ukiem?
    AI_Output (self, other ,"DIA_Davor_BowTrain_03_02"); //Jasne, bêdzie cie to kosztowaæ 200 bry³ek rudy.
};


//========================================
//-----------------> HI_Davor
//========================================

INSTANCE DIA_Davor_HI_Davor (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_HI_Davor_Condition;
   information  = DIA_Davor_HI_Davor_Info;
   permanent	= FALSE;
   description	= "D³ugo jesteœ w Kolonii?";
};

FUNC INT DIA_Davor_HI_Davor_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Davor_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Davor_HI_Davor_Info()
{
    AI_Output (other, self ,"DIA_Davor_HI_Davor_15_01"); //D³ugo jesteœ w Kolonii?
    AI_Output (self, other ,"DIA_Davor_HI_Davor_03_02"); //Wkrótce minie rok. Ale z racji, ¿e zajmowa³em siê myœlistwem od lat jakoœ daje sobie radê.

};



//========================================
//-----------------> LEARN_BOW_START
//========================================

INSTANCE DIA_Davor_LEARN_BOW_START (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 3;
   condition    = DIA_Davor_LEARN_BOW_START_Condition;
   information  = DIA_Davor_LEARN_BOW_START_Info;
   permanent	= FALSE;
   description	= "Chce siê u ciebie uczyæ strzelaæ z ³uku. (200 Bry³ek rudy)";
};

FUNC INT DIA_Davor_LEARN_BOW_START_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_BowTrain))
	&& (Npc_HasItems (other, ItMiNugget) >=200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_LEARN_BOW_START_Info()
{
	AI_Output (other, self ,"DIA_Davor_LEARN_BOW_START_15_01"); //Chce siê u ciebie uczyæ strzelaæ z ³uku.
	if (Npc_HasItems (hero, ItMiNugget) >=200)
	{
    AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_02"); //Jasne. Powiedz, gdy bêdziesz gotów.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_LEARN_BOW_START.permanent = false;
	};
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,DIALOG_BACK,DIA_Davor_Bow_BACK);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
	
	
	
};
func void Dia_Davor_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,Dialog_Back,DIA_Davor_Bow_BACK);
	
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
};

func void Dia_Davor_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,5,100);
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,Dialog_Back,DIA_Davor_Bow_BACK);
	
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
};
func void DIA_Davor_Bow_BACK()
{
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
};


//========================================
//-----------------> OBOZ
//========================================

INSTANCE DIA_Davor_OBOZ (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 5;
   condition    = DIA_Davor_OBOZ_Condition;
   information  = DIA_Davor_OBOZ_Info;
   permanent	= FALSE;
   description	= "Mo¿e chcesz do³¹czyæ do obozu ³owców orków?";
};

FUNC INT DIA_Davor_OBOZ_Condition()
{
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Davor_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_OBOZ_Info()
{
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_01"); //Mo¿e chcesz do³¹czyæ do obozu ³owców orków?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_02"); //W grupie zawsze raŸniej. Ju¿ od pewnego czasu planowa³em opuœciæ to miejsce, jednak coœ mnie tu trzyma.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_04"); //To trochê g³upie, ale zgubi³em swój ³uk gdzieœ w okolicy.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_05"); //Jak mo¿na zgubiæ ³uk?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_06"); //Zwyczajnie. Pewnie zsun¹³ mi siê z ramienia. 
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_07"); //Móg³byœ go poszukaæ?
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Davor uda siê do obozu ³owców orków, je¿eli znajdê jego ³uk. Powinien byæ gdzieœ w okolicy.");
};

//========================================
//-----------------> FIND_BOW
//========================================

INSTANCE DIA_Davor_FIND_BOW (C_INFO)
{
   npc          = NON_3929_Davor;
   nr           = 1;
   condition    = DIA_Davor_FIND_BOW_Condition;
   information  = DIA_Davor_FIND_BOW_Info;
   permanent	= FALSE;
   description	= "Mam twój ³uk.";
};

FUNC INT DIA_Davor_FIND_BOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Davor_OBOZ))
    && (Npc_HasItems (other, It_DavorsBow) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Davor_FIND_BOW_Info()
{
    AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_01"); //Mam twój ³uk.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_02"); //Œwietnie. Pewnie by³ gdzieœ w okolicy.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_03"); //Teraz mogê iœæ do obozu ³owców orków.
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_04"); //Powodzenia w polowaniu na orków.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_05"); //Dziêki. Trzymaj siê.
        Npc_ExchangeRoutine (self, "lowcy");
		B_GiveInvItems      (hero, self, It_DavorsBow, 1);//fix
        AI_StopProcessInfos	(self);
        B_LogEntry                     (CH3_NewBloodForOrcHunters,"Znalaz³em ³uk Davora. Myœliwy uda³ siê do obozu ³owców. ");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_06"); //Niestety rekrutacja jest ju¿ zakoñczona.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_07"); //No có¿. Mimo wszystko dziêki za ³uk.
       B_GiveXP (200);       
	   AI_StopProcessInfos	(self);
    };
};

instance dia_davor_pickpocket(c_info) {
    npc = non_3929_davor;
    nr = 900;
    condition = dia_davor_pickpocket_condition;
    information = dia_davor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_davor_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 25);
};

func void dia_davor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_davor_pickpocket);
	info_addchoice(dia_davor_pickpocket, dialog_back, dia_davor_pickpocket_back);
	info_addchoice(dia_davor_pickpocket, dialog_pickpocket, dia_davor_pickpocket_doit);
};

func void dia_davor_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_davor_pickpocket);
};

func void dia_davor_pickpocket_back() {
    info_clearchoices(dia_davor_pickpocket);
};
