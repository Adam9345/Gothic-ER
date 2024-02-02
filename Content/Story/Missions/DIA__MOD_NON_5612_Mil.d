// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Mil_EXIT(C_INFO)
{
	npc             = NON_5612_Mil;
	nr              = 999;
	condition	= DIA_Mil_EXIT_Condition;
	information	= DIA_Mil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Mil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Mil_HELLO1 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_HELLO1_Condition;
   information  = DIA_Mil_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Mil_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mil_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_01"); //Witaj, wêdrowcze. Nazywam siê Mil i jestem handlarzem.
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_02"); //Sprzedajê ró¿ne trofea i narzêdzia. Zapraszam.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
    B_LogEntry      (GE_TraderOW,"Mil w obozie myœliwych sprzedaje trofea zwierzêce i narzêdzia dla myœliwych.");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Mil_HELLO2 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 2;
   condition    = DIA_Mil_HELLO2_Condition;
   information  = DIA_Mil_HELLO2_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Mil_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mil_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Mil_HELLO2_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Mil_HELLO2_03_02"); //Jasne!
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Mil_HELLO3 (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 3;
   condition    = DIA_Mil_HELLO3_Condition;
   information  = DIA_Mil_HELLO3_Info;
   permanent	= FALSE;
   description	= "Szukasz czegoœ konkretnego? ";
};

FUNC INT DIA_Mil_HELLO3_Condition()
{
	if (Kapitel < 4) 
	{
    return TRUE;
	};
};
FUNC VOID DIA_Mil_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_01"); //Szukasz czegoœ konkretnego? 
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_02"); //S³ysza³em, ¿e w Kolonii mo¿na spotkaæ bia³e wilki. S¹ niezwykle rzadkie. Gdybyœ przyniós³ mi jedn¹ skórê, to by³bym wdziêczny.
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_03"); //Gdzie znajdê te bia³e wilki?
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_04"); //Szukaj na wy¿ynach.
    MIS_FindWhiteSkin = LOG_RUNNING;

    Log_CreateTopic          (CH1_FindWhiteSkin, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_RUNNING);
    B_LogEntry               (CH1_FindWhiteSkin,"Mam upolowaæ bia³ego wilka i przynieœæ jego skórê Milowi. Zwierz¹t powinienem szukaæ na wy¿ynach.");
};

//========================================
//-----------------> Skin
//========================================

INSTANCE DIA_Mil_Skin (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_Skin_Condition;
   information  = DIA_Mil_Skin_Info;
   permanent	= FALSE;
   description	= "Mam skórê.";
};

FUNC INT DIA_Mil_Skin_Condition()
{
    if (MIS_FindWhiteSkin == LOG_RUNNING)
    && (Npc_HasItems (hero, ItAt_WolfWhite_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_Skin_Info()
{
    AI_Output (other, self ,"DIA_Mil_Skin_15_01"); //Mam skórê.
    AI_Output (self, other ,"DIA_Mil_Skin_03_02"); //Dobra robota, Zabierz j¹ teraz do Stanleya i powiedz, ¿eby wykona³ p³aszcz, który mi obieca³. 
    AI_Output (other, self ,"DIA_Mil_Skin_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Mil_Skin_03_04"); //Masz tu coœ za fatygê. Tylko wróæ do mnie z p³aszczem.
    B_LogEntry                     (CH1_FindWhiteSkin,"Skóra ma trafiæ do Stanleya. Myœliwy ma przygotowaæ z niej p³aszcz. ");
    B_GiveXP (150);
};
//========================================
//-----------------> PlaszczOK
//========================================

INSTANCE DIA_Mil_PlaszczOK (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_PlaszczOK_Condition;
   information  = DIA_Mil_PlaszczOK_Info;
   permanent	= FALSE;
   description	= "P³aszcz gotowy.";
};

FUNC INT DIA_Mil_PlaszczOK_Condition()
{
    if (MIS_FindWhiteSkin == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_PancerzMil) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_PlaszczOK_Info()
{
    AI_Output (other, self ,"DIA_Mil_PlaszczOK_15_01"); //P³aszcz gotowy.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_02"); //Dobra robota. 
	B_GiveInvItems (other,self, ItMi_PancerzMil, 1);
	B_GiveInvItems (self,other, ItAt_BearFur, 2);
	B_LogEntry                     (CH1_FindWhiteSkin,"Mil dosta³ p³aszcz, i otrzyma³em od niego ma³¹ nagrodê.");
	Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_SUCCESS);
	B_GiveXP(150);
    MIS_FindWhiteSkin = LOG_SUCCESS;
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////
// Help Alex
///////////////////////////////////////////////////

INSTANCE DIA_Mil_AlexPrisoner (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 3;
   condition    = DIA_Mil_AlexPrisoner_Condition;
   information  = DIA_Mil_AlexPrisoner_Info;
   permanent	= FALSE;
   description	= "Alex zosta³ porwany.";
};

FUNC INT DIA_Mil_AlexPrisoner_Condition()
{
	if (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (!Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
    {
    return TRUE;
    };
};
FUNC VOID DIA_Mil_AlexPrisoner_Info()
{
    AI_Output (other, self ,"DIA_Mil_AlexPrisoner_15_01"); //Alex zosta³ porwany.
    AI_Output (self, other ,"DIA_Mil_AlexPrisoner_03_02"); //Wiem, wiem. Jakieœ postêpy w tej sprawie?
    AI_Output (other, self ,"DIA_Mil_AlexPrisoner_15_03"); //Potrzebujemy 1000 bry³ek rudy na okup. 
    AI_Output (self, other ,"DIA_Mil_AlexPrisoner_03_04"); //Przeklêty Gomez! Masz tu mój ostatni utarg. 
   
	CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	
	getmoneyfor_Mil = true;
};



///////////////////////////////////////////////////
// Help Alex
///////////////////////////////////////////////////

INSTANCE DIA_Mil_Ghaston_Dead (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 3;
   condition    = DIA_Mil_Ghaston_Dead_Condition;
   information  = DIA_Mil_Ghaston_Dead_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Mil_Ghaston_Dead_Condition()
{
	if (Npc_IsDead (NON_40034_Arnold))

    {
    return TRUE;
    };
};
FUNC VOID DIA_Mil_Ghaston_Dead_Info()
{
    AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_01"); //Widzia³em jak zabi³eœ Arnolda!
    AI_Output (other, self ,"DIA_Mil_Ghaston_Dead_15_02"); //Ja... Sk¹d¿e.
    AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_03"); //Jeœli mi nie zap³acisz to doniosê o tym Alexowi.
    AI_Output (other, self ,"DIA_Mil_Ghaston_Dead_15_04"); //Ile chcesz?
	AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_05"); //200 bry³ek rudy.
	Info_ClearChoices	(DIA_Mil_Ghaston_Dead);
	Info_AddChoice		(DIA_Mil_Ghaston_Dead, "Co to znaczy?", DIA_Gilbert_Gaston_Add_Choice2);
	Info_AddChoice		(DIA_Mil_Ghaston_Dead, "Masz.", DIA_Gilbert_Gaston_Add_Choice1);

};



FUNC VOID DIA_Gilbert_Gaston_Add_Choice1()
{
   if(Npc_HasItems (other, ItMiNugget) >= 200)
   {
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice1_15_01"); //Masz. 
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice1_03_02"); //Noo... To tyle.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice1_15_03"); //¯egnam.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice1_03_04"); //Tylko nikogo wiêcej nie zabijaj...

    AI_StopProcessInfos	( self );
   };
};



FUNC VOID DIA_Gilbert_Gaston_Add_Choice2()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice2_15_01"); //Poca³uj mnie w dupe.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice2_03_02"); //Jak sobie chcesz kolego...
    MilKissMyAss = TRUE;

    AI_StopProcessInfos	( self );

};







//========================================
//-----------------> ArnoldBearsFur
//========================================

INSTANCE DIA_Mil_ArnoldBearsFur (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_ArnoldBearsFur_Condition;
   information  = DIA_Mil_ArnoldBearsFur_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Mil_ArnoldBearsFur_Condition()
{
if (kapitel == 3)
{
    return TRUE;
};
};
FUNC VOID DIA_Mil_ArnoldBearsFur_Info()
{
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_01"); //Ej Arnold mówi³, ¿e ma dla ciebie jak¹œ dobr¹ fuchê ale musisz umieæ pozyskiwaæ futra.
    AI_Output (other, self ,"DIA_Mil_ArnoldBearsFur_15_02"); //Dobrze wiedzieæ. 
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_03"); //Jeœli nie zapomni jak zwykle ma to w zwyczaju to pewnie o tym wspomni.
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_04"); //Jak nie umiesz œci¹gaæ futer to siê naucz. Mo¿na zarobiæ sporo rudy.
};

instance dia_mil_pickpocket(c_info) {
    npc = non_5612_mil;
    nr = 900;
    condition = dia_mil_pickpocket_condition;
    information = dia_mil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mil_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_mil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mil_pickpocket);
	info_addchoice(dia_mil_pickpocket, dialog_back, dia_mil_pickpocket_back);
	info_addchoice(dia_mil_pickpocket, dialog_pickpocket, dia_mil_pickpocket_doit);
};

func void dia_mil_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_mil_pickpocket);
};

func void dia_mil_pickpocket_back() {
    info_clearchoices(dia_mil_pickpocket);
};