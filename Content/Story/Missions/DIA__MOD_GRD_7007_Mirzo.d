//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Mirzo_EXIT(C_INFO)
{
	npc             	= GRD_7007_Mirzo;
	nr              	= 999;
	condition		= DIA_Mirzo_EXIT_Condition;
	information	= DIA_Mirzo_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Mirzo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mirzo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IamGardist
//========================================

INSTANCE DIA_Mirzo_IamGardist (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_IamGardist_Condition;
   information  = DIA_Mirzo_IamGardist_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Mirzo_IamGardist_Condition()
{
	if  (MIS_FoodForOldMine != LOG_SUCCESS) && !Npc_KnowsInfo (hero,DIA_Mirzo_Caught) 
	{ 
    return TRUE; 
	};
};

FUNC VOID DIA_Mirzo_IamGardist_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_IamGardist_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Mirzo_IamGardist_03_02"); //A co ci� to obchodzi, przyb��do? Jestem Mirzo i je�li chcesz, to mo�esz postawi� mi piwo.
};

//========================================
//-----------------> GiveBeer
//========================================

INSTANCE DIA_Mirzo_GiveBeer (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 2;
   condition    = DIA_Mirzo_GiveBeer_Condition;
   information  = DIA_Mirzo_GiveBeer_Info;
   permanent	= FALSE;
   description	= "Napij si�.";
};

FUNC INT DIA_Mirzo_GiveBeer_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_IamGardist))
    && (Npc_HasItems (other, ItFoBeer) >=1)
	&& (MIS_FoodForOldMine != LOG_SUCCESS) && !Npc_KnowsInfo (hero,DIA_Mirzo_Caught)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_GiveBeer_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_01"); //Napij si�.
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_02"); //Dzi�ki. Nie jeste� wcale taki bezu�yteczny na jakiego mi si� z pocz�tku wydawa�e�. 
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_03"); //Czym si� tutaj zajmujesz? 
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_04"); //A czym mo�e si� zajmowa� Stra�nik? Pilnuj� rudy, kt�rej mamy tu pe�no. W skrzyniach, w wagonach, na w�zku...
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_05"); //Bandyci raczej si� tu nie zjawi�, ale niekt�rym cwaniaczkom wydaje si�, �e mog� sobie tak po prostu co� st�d zabra�.
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_06"); //W�a�nie przez takich z�odziejaszk�w tu jestem. Ca�y dzie� pilnuj�...
    AI_Output (other, self ,"DIA_Mirzo_GiveBeer_15_07"); //Z pewno�ci� to bardzo wyczerpuj�ce.
    AI_Output (self, other ,"DIA_Mirzo_GiveBeer_03_08"); //A co ty o tym mo�esz wiedzie�? Jeste� przecie� ��todziobem! 
};

//========================================
//-----------------> QuestIan
//========================================

INSTANCE DIA_Mirzo_QuestIan (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_QuestIan_Condition;
   information  = DIA_Mirzo_QuestIan_Info;
   permanent	= FALSE;
   description	= "Ludzie ze Starej Kopalni dostaj� mniej �ywno�ci, ni� zamawiaj�.";
};

FUNC INT DIA_Mirzo_QuestIan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artch_ianQuest_Spy))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_QuestIan_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_QuestIan_15_01"); //Ludzie ze Starej Kopalni dostaj� mniej �ywno�ci, ni� zamawiaj�.
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_02"); //Tak, a ja jestem panienk� Gomeza.
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_03"); //�arty sobie stroisz, ch�opcze?
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_04"); //Przecie� pilnujemy z Artchem, by wszystko si� zgadza�o.
    AI_Output (other, self ,"DIA_Mirzo_QuestIan_15_05"); //Mo�e zapytaj Iana?
    AI_Output (self, other ,"DIA_Mirzo_QuestIan_03_06"); //Pewnie �le policzy�. Z naszej strony praca przebiega sprawnie.
    B_LogEntry                     (CH1_FoodForOldMine,"Mirzo uwa�a, �e dobrze wykonuje swoj� prac�. Co� mi tu jednak �mierdzi, popytam jeszcze innych mieszka�c�w obozu.");

    //B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Caught
//========================================

INSTANCE DIA_Mirzo_Caught (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_Caught_Condition;
   information  = DIA_Mirzo_Caught_Info;
   permanent	= FALSE;
   description	= "hs@FF0000 Mam ci�!";
};

FUNC INT DIA_Mirzo_Caught_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_IanQuest))
    && (Npc_GetDistToWP (self, "MIRZO_SPISEK") < 1500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_Caught_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_Caught_15_01"); //Mam ci�!
    AI_Output (self, other ,"DIA_Mirzo_Caught_03_02"); //Czemu za mn� �azisz? Masz jaki� problem?
    AI_Output (other, self ,"DIA_Mirzo_Caught_15_03"); //Ian ma. A wi�c to tutaj wszystko sprzedajesz.
    AI_Output (self, other ,"DIA_Mirzo_Caught_03_04"); //Dopilnuj�, by� nikomu nie przekaza� tej informacji.
   
	//Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek2");
    AI_StopProcessInfos	(self);
    //self.flags = 2;
	//AI_Wait 	(self, 3);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    B_LogEntry    (CH1_FoodForOldMine,"Nakry�em Mirzo, jak robi� interesy w Nowym Obozie. Stra�nik rzuci� si� na mnie. Musz� powiedzie� o wszystkim Artegrowi.");
  
};

///////////////////////////////////////////////////////////////////////////////
// TA CZʌ� SKRYPT�W PRAWDOPODOBNIE ZOSTA�A WY��CZONA
// GOTHIC1210 STY 2016
///////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> PIWA
//========================================

INSTANCE DIA_Mirzo_PIWA (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_PIWA_Condition;
   information  = DIA_Mirzo_PIWA_Info;
   permanent	= FALSE;
   description	= "Ile tych piw mam przynie��?";
};

FUNC INT DIA_Mirzo_PIWA_Condition()
{
    if (browce == true) 
//dopisz gil - 0
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_PIWA_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_PIWA_15_01"); //Ile tych piw mam przynie��?
    AI_Output (self, other ,"DIA_Mirzo_PIWA_03_02"); //Ach, chcesz si� dosta� do kopalni?
    AI_Output (other, self ,"DIA_Mirzo_PIWA_15_03"); //Tak.
    AI_Output (self, other ,"DIA_Mirzo_PIWA_03_04"); //Przynie� nam osiem piw.
    B_LogEntry                     (CH1_MineEnter,"Mirzo kaza� mi przynie�� osiem piw.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ALKO
//========================================

INSTANCE DIA_Mirzo_ALKO (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 2;
   condition    = DIA_Mirzo_ALKO_Condition;
   information  = DIA_Mirzo_ALKO_Info;
   permanent	= FALSE;
   description	= "Mam wasze piwa.";
};

FUNC INT DIA_Mirzo_ALKO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_PIWA))
    && (Npc_HasItems (other, ItFoBeer) >=8)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mirzo_ALKO_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_ALKO_15_01"); //Mam wasze piwa.
    AI_Output (self, other ,"DIA_Mirzo_ALKO_03_02"); //�wietnie. Mi�ego pobytu w kopalni.
    B_LogEntry                     (CH1_MineEnter,"Odda�em napoje Mirzowi.");

    B_GiveXP (20);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Lochy
//========================================

INSTANCE DIA_Mirzo_Lochy (C_INFO)
{
   npc          = GRD_7007_Mirzo;
   nr           = 1;
   condition    = DIA_Mirzo_Lochy_Condition;
   information  = DIA_Mirzo_Lochy_Info;
   permanent	= FALSE;
   description	= "Jednak nie ca�kiem zgni�e� w lochu. Widz�, �e jeszcze dychasz odrobin�.";
};

FUNC INT DIA_Mirzo_Lochy_Condition()
{
 if (Mirzo_Lochy == TRUE)
 
{
    return TRUE;
};
};
FUNC VOID DIA_Mirzo_Lochy_Info()
{
    AI_Output (other, self ,"DIA_Mirzo_Lochy_15_01"); //Jednak nie ca�kiem zgni�e� w lochu. Widz�, �e jeszcze dychasz.
    AI_Output (self, other ,"DIA_Mirzo_Lochy_03_02"); // Ty parchu... Przez ciebie tutaj wyl�dowa�em i poprzysi�g�em, �e si� za to odegram!
    AI_Output (other, self ,"DIA_Mirzo_Lochy_15_03"); //Delikatnie m�wi� �rednio obecnie widz� taki scenariusz...
    AI_Output (self, other ,"DIA_Mirzo_Lochy_03_04"); //Wszystko si� zmieni. I sko�czysz marnie. Zdech�y, zakrwawiony i olany uryn�. 
    AI_StopProcessInfos	(self);
};

instance dia_mirzo_pickpocket(c_info) {
    npc = grd_7007_mirzo;
    nr = 900;
    condition = dia_mirzo_pickpocket_condition;
    information = dia_mirzo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mirzo_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_mirzo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mirzo_pickpocket);
	info_addchoice(dia_mirzo_pickpocket, dialog_back, dia_mirzo_pickpocket_back);
	info_addchoice(dia_mirzo_pickpocket, dialog_pickpocket, dia_mirzo_pickpocket_doit);
};

func void dia_mirzo_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_mirzo_pickpocket);
};

func void dia_mirzo_pickpocket_back() {
    info_clearchoices(dia_mirzo_pickpocket);
};