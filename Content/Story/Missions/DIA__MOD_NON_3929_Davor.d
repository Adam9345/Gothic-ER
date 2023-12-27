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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Davor_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Davor_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_02"); //Ja? Nazywam si� Davor. Jestem samotnym my�liwym. 
    AI_Output (self, other ,"DIA_Davor_HELLO1_03_03"); //Poluj� g��wnie przy u�yciu �uku. Zbli�am si� tylko do MARTWEJ zwierzyny.
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
   description	= "Mo�esz mnie nauczy� jak pos�ugiwa� si� �ukiem?";
};

FUNC INT DIA_Davor_BowTrain_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Davor_BowTrain_Info()
{
    AI_Output (other, self ,"DIA_Davor_BowTrain_15_01"); //Mo�esz mnie nauczy� jak pos�ugiwa� si� �ukiem?
    AI_Output (self, other ,"DIA_Davor_BowTrain_03_02"); //Jasne, b�dzie cie to kosztowa� 200 bry�ek rudy.
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
   description	= "D�ugo jeste� w Kolonii?";
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
    AI_Output (other, self ,"DIA_Davor_HI_Davor_15_01"); //D�ugo jeste� w Kolonii?
    AI_Output (self, other ,"DIA_Davor_HI_Davor_03_02"); //Wkr�tce minie rok. Ale z racji, �e zajmowa�em si� my�listwem od lat jako� daje sobie rad�.

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
   description	= "Chce si� u ciebie uczy� strzela� z �uku. (200 Bry�ek rudy)";
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
	AI_Output (other, self ,"DIA_Davor_LEARN_BOW_START_15_01"); //Chce si� u ciebie uczy� strzela� z �uku.
	if (Npc_HasItems (hero, ItMiNugget) >=200)
	{
    AI_Output (self, other ,"DIA_Davor_LEARN_BOW_START_03_02"); //Jasne. Powiedz, gdy b�dziesz got�w.
    B_GiveInvItems (other, self, ItMiNugget, 200);
	DIA_Davor_LEARN_BOW_START.permanent = false;
	};
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,DIALOG_BACK,DIA_Davor_Bow_BACK);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
	
	
	
};
func void Dia_Davor_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,Dialog_Back,DIA_Davor_Bow_BACK);
	
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
};

func void Dia_Davor_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,5,100);
	Info_ClearChoices(DIA_Davor_LEARN_BOW_START);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,Dialog_Back,DIA_Davor_Bow_BACK);
	
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Davor_Teach_Bow_1);
	Info_AddChoice(DIA_Davor_LEARN_BOW_START,B_BuildLearnString("�uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Davor_Teach_Bow_5);
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
   description	= "Mo�e chcesz do��czy� do obozu �owc�w ork�w?";
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
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_01"); //Mo�e chcesz do��czy� do obozu �owc�w ork�w?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_02"); //W grupie zawsze ra�niej. Ju� od pewnego czasu planowa�em opu�ci� to miejsce, jednak co� mnie tu trzyma.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_04"); //To troch� g�upie, ale zgubi�em sw�j �uk gdzie� w okolicy.
    AI_Output (other, self ,"DIA_Davor_OBOZ_15_05"); //Jak mo�na zgubi� �uk?
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_06"); //Zwyczajnie. Pewnie zsun�� mi si� z ramienia. 
    AI_Output (self, other ,"DIA_Davor_OBOZ_03_07"); //M�g�by� go poszuka�?
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Davor uda si� do obozu �owc�w ork�w, je�eli znajd� jego �uk. Powinien by� gdzie� w okolicy.");
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
   description	= "Mam tw�j �uk.";
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
    AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_01"); //Mam tw�j �uk.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_02"); //�wietnie. Pewnie by� gdzie� w okolicy.
    AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_03"); //Teraz mog� i�� do obozu �owc�w ork�w.
    if (MIS_NewBloodForOrcHunters == LOG_RUNNING)
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_04"); //Powodzenia w polowaniu na ork�w.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_05"); //Dzi�ki. Trzymaj si�.
        Npc_ExchangeRoutine (self, "lowcy");
		B_GiveInvItems      (hero, self, It_DavorsBow, 1);//fix
        AI_StopProcessInfos	(self);
        B_LogEntry                     (CH3_NewBloodForOrcHunters,"Znalaz�em �uk Davora. My�liwy uda� si� do obozu �owc�w. ");

        B_GiveXP (200);
    }
    else
    {
        AI_Output (other, self ,"DIA_Davor_FIND_BOW_15_06"); //Niestety rekrutacja jest ju� zako�czona.
        AI_Output (self, other ,"DIA_Davor_FIND_BOW_03_07"); //No c�. Mimo wszystko dzi�ki za �uk.
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
