//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Emanuel_EXIT(C_INFO)
{
	npc         = BAN_1602_Emanuel;
	nr          = 999;
	condition	= DIA_Emanuel_EXIT_Condition;
	information	= DIA_Emanuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Emanuel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Emanuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Emanuel_HELLO (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 1;
   condition    = DIA_Emanuel_HELLO_Condition;
   information  = DIA_Emanuel_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Emanuel_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Emanuel_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_02"); //Nazywam si� Emanuel i jestem obozowym kucharzem.
    AI_Output (other, self ,"DIA_Emanuel_HELLO_15_03"); //To pewnie jeste� szanowany w Obozie...
    AI_Output (self, other ,"DIA_Emanuel_HELLO_03_04"); //Sprzedaj� tak�e �ywno��. Interesuje ci� co�?
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Kucharz Emanuel mo�e mi sprzeda� troch� jedzenia.");
};

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Emanuel_QUEST1 (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 2;
   condition    = DIA_Emanuel_QUEST1_Condition;
   information  = DIA_Emanuel_QUEST1_Info;
   permanent	= FALSE;
   description	= "Szukam prostego zlecenia.";
};

FUNC INT DIA_Emanuel_QUEST1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Emanuel_HELLO)) && (kapitel <= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_01"); //Szukam �atwej roboty.
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_02"); //Co� na pocz�tek, tak? Wiesz, chyba mi si� przydasz...
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_03"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_04"); //Id� do Draxa i odbierz dostaw� mi�sa i zi�. Postaraj si� nie pogubi� wszystkiego po drodze. Jasne?
    AI_Output (other, self ,"DIA_Emanuel_QUEST1_15_05"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_06"); //Z niczym bardziej skomplikowanym sobie nie poradzisz.
	if (Npc_GetTrueGuild(other)!=GIL_BAU)
	{
    AI_Output (self, other ,"DIA_Emanuel_QUEST1_03_07"); //Poza tym nie jeste� jednym z Bandyt�w, �eby m�c miesza� si� w moje interesy.
	};
    MIS_EmanuelDelivery = LOG_RUNNING;

    Log_CreateTopic          (CH1_EmanuelDelivery, LOG_MISSION);
    Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_RUNNING);
    B_LogEntry               (CH1_EmanuelDelivery,"Emanuel kaza� mi przynie�� zio�a i mi�so od my�liwego Draxa.");
};

//========================================
//-----------------> MAMZIOLA
//========================================

INSTANCE DIA_Emanuel_MAMZIOLA (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 3;
   condition    = DIA_Emanuel_MAMZIOLA_Condition;
   information  = DIA_Emanuel_MAMZIOLA_Info;
   permanent	= FALSE;
   description	= "Mam zio�a i mi�so.";
};

FUNC INT DIA_Emanuel_MAMZIOLA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_ZIOLA))
    && (Npc_HasItems (other, ItFo_Plants_mushroom_01) >=10)
    && (Npc_HasItems (other, ItFo_Plants_RavenHerb_01) >=2)
    && (Npc_HasItems (other, ItAt_Meatbug_01) >=5)
    && (Npc_HasItems (other, ItFoMuttonRaw) >=13)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_MAMZIOLA_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_MAMZIOLA_15_01"); //Mam zio�a i mi�so.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_02"); //�wietnie.
    AI_Output (self, other ,"DIA_Emanuel_MAMZIOLA_03_03"); //To nie by�o zbyt trudne. Masz tu 10 bry�ek rudy za fatyg�.
	Npc_RemoveInvItems (other,ItFo_Plants_mushroom_01, 10);
	Npc_RemoveInvItems (other,ItFo_Plants_RavenHerb_01, 2);
	Npc_RemoveInvItems (other,ItAt_Meatbug_01, 5);
	Npc_RemoveInvItems (other,ItFoMuttonRaw, 13);
	// eee fixed? 1.3
	CreateInvItems (hero, ItFoMuttonRaw, 30);
	B_GiveInvItems (hero, self, ItFoMuttonRaw, 30);
	
	CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);
    B_LogEntry                     (CH1_EmanuelDelivery,"Dostarczy�em �ywno�� Emanuelowi. Dosta�em 10 bry�ek rudy.");
    Log_SetTopicStatus       (CH1_EmanuelDelivery, LOG_SUCCESS);
    MIS_EmanuelDelivery = LOG_SUCCESS;

    B_GiveXP (XP_EmanuelDelivery);
};

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Emanuel_RAYAN (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 2;
   condition    = DIA_Emanuel_RAYAN_Condition;
   information  = DIA_Emanuel_RAYAN_Info;
   permanent	= FALSE;
   description	= "Wiesz co� na temat �mierci Rayana?";
};

FUNC INT DIA_Emanuel_RAYAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Emanuel_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_01"); //Wiesz co� na temat �mierci Rayana?
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_02"); //Nic konkretnego. Wyszed� pewnego wieczoru, a nast�pnego dnia znaleziono go z drobnymi obra�eniami.
	AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_03"); //Nie zosta� rozszarpany ani po�arty, wi�c pojawi�o si� przypuszczenie, �e mog�o to by� zab�jstwo. 
    AI_Output (other, self ,"DIA_Emanuel_RAYAN_15_04"); //My�lisz, �e Kereth m�g� by� z tym zwi�zany? 
    AI_Output (self, other ,"DIA_Emanuel_RAYAN_03_05"); //Kereth? Przecie� to jego brat! Ta �mier� bardzo go dotkn�a. Mo�e wygl�da� jakby co� kombinowa�, ale pewnie jest tylko sko�owany po tym wszystkim. 
};



//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Emanuel_Trade (C_INFO)
{
   npc          = BAN_1602_Emanuel;
   nr           = 888;
   condition    = DIA_Emanuel_Trade_Condition;
   information  = DIA_Emanuel_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Sprzedasz mi troch� �ywno�ci?";
};

FUNC INT DIA_Emanuel_Trade_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Emanuel_HELLO))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Emanuel_Trade_Info()
{
    AI_Output (other, self ,"DIA_Emanuel_Trade_15_01"); //Sprzedasz mi troch� �ywno�ci?
    AI_Output (self, other ,"DIA_Emanuel_Trade_03_02"); //Czemu nie?
	B_ClearTreaderAmmo(self);
};

instance dia_emanuel_pickpocket(c_info) {
    npc = ban_1602_emanuel;
    nr = 900;
    condition = dia_emanuel_pickpocket_condition;
    information = dia_emanuel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_emanuel_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_emanuel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_emanuel_pickpocket);
	info_addchoice(dia_emanuel_pickpocket, dialog_back, dia_emanuel_pickpocket_back);
	info_addchoice(dia_emanuel_pickpocket, dialog_pickpocket, dia_emanuel_pickpocket_doit);
};

func void dia_emanuel_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_emanuel_pickpocket);
};

func void dia_emanuel_pickpocket_back() {
    info_clearchoices(dia_emanuel_pickpocket);
};