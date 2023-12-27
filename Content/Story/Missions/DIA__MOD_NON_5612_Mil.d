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
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_01"); //Witaj, w�drowcze. Nazywam si� Mil i jestem handlarzem.
    AI_Output (self, other ,"DIA_Mil_HELLO1_03_02"); //Sprzedaj� r�ne trofea i narz�dzia. Zapraszam.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
    B_LogEntry      (GE_TraderOW,"Mil w obozie my�liwych sprzedaje trofea zwierz�ce i narz�dzia dla my�liwych.");
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
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Mil_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mil_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Mil_HELLO2_15_01"); //Chc� co� kupi�.
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
   description	= "Szukasz czego� konkretnego? ";
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
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_01"); //Szukasz czego� konkretnego? 
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_02"); //S�ysza�em, �e w Kolonii mo�na spotka� bia�e wilki. S� niezwykle rzadkie. Gdyby� przyni�s� mi jedn� sk�r�, to by�bym wdzi�czny.
    AI_Output (other, self ,"DIA_Mil_HELLO3_15_03"); //Gdzie znajd� te bia�e wilki?
    AI_Output (self, other ,"DIA_Mil_HELLO3_03_04"); //Szukaj na wy�ynach.
    MIS_FindWhiteSkin = LOG_RUNNING;

    Log_CreateTopic          (CH1_FindWhiteSkin, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_RUNNING);
    B_LogEntry               (CH1_FindWhiteSkin,"Mam upolowa� bia�ego wilka i przynie�� jego sk�r� Milowi. Zwierz�t powinienem szuka� na wy�ynach.");
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
   description	= "Mam sk�r�.";
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
    AI_Output (other, self ,"DIA_Mil_Skin_15_01"); //Mam sk�r�.
    AI_Output (self, other ,"DIA_Mil_Skin_03_02"); //Dobra robota, Zabierz j� teraz do Stanleya i powiedz, �eby wykona� p�aszcz, kt�ry mi obieca�. 
    AI_Output (other, self ,"DIA_Mil_Skin_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Mil_Skin_03_04"); //Masz tu co� za fatyg�. Tylko wr�� do mnie z p�aszczem.
    B_LogEntry                     (CH1_FindWhiteSkin,"Sk�ra ma trafi� do Stanleya. My�liwy ma przygotowa� z niej p�aszcz. ");
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
   description	= "P�aszcz gotowy.";
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
    AI_Output (other, self ,"DIA_Mil_PlaszczOK_15_01"); //P�aszcz gotowy.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_02"); //Dobra robota. 
	Log_SetTopicStatus       (CH1_FindWhiteSkin, LOG_SUCCESS);
    MIS_FindWhiteSkin = LOG_SUCCESS;
	if (Kapitel < 4) && ((Npc_GetTrueGuild(other) != GIL_STT) || (Npc_GetTrueGuild(other) != GIL_GRD))
	{
	AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_03"); //Mam dla ciebie jeszcze jedno zlecenie.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_04"); //Id� do Starego Obozu i znajd� mi pasera, kt�ry dopilnuje, �eby ten p�aszcz trafi� w r�ce Magnata Blizny.
    AI_Output (self, other ,"DIA_Mil_PlaszczOK_03_05"); //Zr�b to szybko. Gdy p�aszcz b�dzie jego, wr�� do mnie.  
    MIS_ScarMurder = LOG_RUNNING;
    Log_CreateTopic          (CH3_ScarMurder, LOG_MISSION);
    Log_SetTopicStatus       (CH3_ScarMurder, LOG_RUNNING);
    B_LogEntry               (CH3_ScarMurder,"Mam znale�� kogo�, kto sprzeda p�aszcz ze sk�ry wilka Magnatowi imieniem Blizna. Musz� szuka� w�r�d handlarzy ze Starego Obozu.");
	}
	else
	{
	B_GiveInvItems (hero, self, ItMi_PancerzMil, 1);
	};
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BliznaDed
//========================================

INSTANCE DIA_Mil_BliznaDed (C_INFO)
{
   npc          = NON_5612_Mil;
   nr           = 1;
   condition    = DIA_Mil_BliznaDed_Condition;
   information  = DIA_Mil_BliznaDed_Info;
   permanent	= FALSE;
   description	= "P�aszcz trafi w r�ce Blizny.";
};

FUNC INT DIA_Mil_BliznaDed_Condition()
{
    if (MIS_ScarMurder == LOG_RUNNING) 
	&& ((oferta_fiska == true)
    || (Npc_KnowsInfo (hero, DIA_Whistler_SellPlaszcz))
   || (Npc_KnowsInfo (hero, DIA_Gravo_GiveItemPlaszcz)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Mil_BliznaDed_Info()
{
    AI_Output (other, self ,"DIA_Mil_BliznaDed_15_01"); //P�aszcz trafi w r�ce Blizny.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_02"); //Dobra robota. Je�eli uda�o ci si� co� przy tym zarobi�, to mo�esz zachowa� to dla siebie.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_03"); //Ja otrzyma�em ju� swoj� cz�� dzia�ki wcze�niej.
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_04"); //Je�eli masz ch�� na wi�cej, to id� do Nowego Obozu i znajd� Kos�.
    AI_Output (other, self ,"DIA_Mil_BliznaDed_15_05"); //Kos�? Czy on jest w to wszystko wmieszany? Dlaczego p�aszcz mia� trafi� do Blizny?
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_06"); //Pytania p�niej. Powt�rz�, je�li chcesz dorobi�, to id� do Kosy. 
    AI_Output (self, other ,"DIA_Mil_BliznaDed_03_07"); //No, ju�. Nie zawracaj mi g�owy.
    B_LogEntry                     (CH3_ScarMurder,"Dziwne... Mil zachowywa� si� podejrzanie. Powiedzia�, �e je�eli chc� dorobi� musz� pogada� z Kos�. Mo�e od niego dowiem si�, dlaczego p�aszcz mia� trafi� do Blizny.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
	
	var c_npc blizna; blizna = Hlp_GetNpc (EBR_101_Scar);
	Npc_RemoveInvItems (blizna, EBR_ARMOR_H2, 1);
	CreateInvItems 	(blizna, BLIZNA_ARMOR_H,1);
	AI_EquipBestArmor (blizna);
	Mdl_SetVisualBody (blizna,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 79,  1, BLIZNA_ARMOR_H);
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
   description	= "Alex zosta� porwany.";
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
    AI_Output (other, self ,"DIA_Mil_AlexPrisoner_15_01"); //Alex zosta� porwany.
    AI_Output (self, other ,"DIA_Mil_AlexPrisoner_03_02"); //Wiem, wiem. Jakie� post�py w tej sprawie?
    AI_Output (other, self ,"DIA_Mil_AlexPrisoner_15_03"); //Potrzebujemy 1000 bry�ek rudy na okup. 
    AI_Output (self, other ,"DIA_Mil_AlexPrisoner_03_04"); //Przekl�ty Gomez! Masz tu m�j ostatni utarg. 
   
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
    AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_01"); //Widzia�em jak zabi�e� Arnolda!
    AI_Output (other, self ,"DIA_Mil_Ghaston_Dead_15_02"); //Ja... Sk�d�e.
    AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_03"); //Je�li mi nie zap�acisz to donios� o tym Alexowi.
    AI_Output (other, self ,"DIA_Mil_Ghaston_Dead_15_04"); //Ile chcesz?
	AI_Output (self, other ,"DIA_Mil_Ghaston_Dead_03_05"); //200 bry�ek rudy.
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
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice1_15_03"); //�egnam.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice1_03_04"); //Tylko nikogo wi�cej nie zabijaj...

    AI_StopProcessInfos	( self );
   };
};



FUNC VOID DIA_Gilbert_Gaston_Add_Choice2()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice2_15_01"); //Poca�uj mnie w dupe.
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
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_01"); //Ej Arnold m�wi�, �e ma dla ciebie jak�� dobr� fuch� ale musisz umie� pozyskiwa� futra.
    AI_Output (other, self ,"DIA_Mil_ArnoldBearsFur_15_02"); //Dobrze wiedzie�. 
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_03"); //Je�li nie zapomni jak zwykle ma to w zwyczaju to pewnie o tym wspomni.
    AI_Output (self, other ,"DIA_Mil_ArnoldBearsFur_03_04"); //Jak nie umiesz �ci�ga� futer to si� naucz. Mo�na zarobi� sporo rudy.
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