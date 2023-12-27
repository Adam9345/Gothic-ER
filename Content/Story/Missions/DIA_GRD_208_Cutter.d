//poprawione i sprawdzone - Reflide

//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> DISS_BANDIT
//========================================

INSTANCE DIA_Cutter_DISS_BANDIT (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_DISS_BANDIT_Condition;
   information  = DIA_Cutter_DISS_BANDIT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_DISS_BANDIT_Condition()
{
var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)     {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_DISS_BANDIT_Info()
{
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_01"); //Masz sporo odwagi, ¿eby siê tu pokazywaæ.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_02"); //Ca³y Obóz chce ciê dorwaæ. 
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_03"); //Pos³uchaj, to nie tak jak myœlisz...
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_04"); //Wszyscy w kó³ko powtarzaj¹ twoj¹ wymówkê, znam ju¿ j¹. Nie musisz mi powtarzaæ.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_05"); //Niektórzy w ni¹ wierz¹. Có¿, ja potrafiê wyczuæ k³amstwo z odleg³oœci mili. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_06"); //Nie nabierzesz mnie, ch³opcze.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_07"); //Czego wiêc chcesz?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_08"); //Przypuszczam, ¿e masz ju¿ doœæ tych przeœladowañ. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_09"); //Mogê byæ twoim najgorszym koszmarem, ale mogê tak¿e daæ ci spokój.
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_15_10"); //Ile to mnie bêdzie kosztowaæ?
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_11"); //400 bry³ek rudy. Przyznasz, ¿e to niewiele, jak na cenê spokoju. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_12"); //Pamiêtaj, ¿e to co ja mogê ci zrobiæ, bêdzie piek³em.
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_03_13"); //To jak? Dogadamy siê?

    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Masz tê rudê i daj mi spokój.", DIA_Cutter_DISS_BANDIT_GIVE_ORE);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Nie mam tyle rudy. ", DIA_Cutter_DISS_BANDIT_NIE_MAM);
    Info_AddChoice		(DIA_Cutter_DISS_BANDIT, "Zapomnij. Nie uda ci siê mnie zastraszyæ!", DIA_Cutter_DISS_BANDIT_ZAPOMNIJ);
};

FUNC VOID DIA_Cutter_DISS_BANDIT_GIVE_ORE()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_15_01"); //Masz tê rudê i daj mi spokój.
    if (Npc_HasItems (hero, ItMiNugget)>=400)
    {
        B_GiveInvItems (other, self, ItMiNugget, 400);
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_02"); //Œwietnie. Ju¿ nigdy o mnie nie us³yszysz. 
        Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
        AI_StopProcessInfos	(self);
    }
    else
    {
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_03"); //Masz jeszcze czelnoœæ mnie oszukiwaæ?! 
        AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_GIVE_ORE_03_04"); //Zmów ostatni¹ modlitwê do Innosa. 
		GRD_208_Cutter.guild = GIL_NONE;
		Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
		Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
        AI_StopProcessInfos	(self);
        Npc_SetTarget (self, other);
        AI_StartState (self, ZS_ATTACK, 1, "");
    };
};

FUNC VOID DIA_Cutter_DISS_BANDIT_NIE_MAM()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_NIE_MAM_15_01"); //Nie mam tyle rudy. 
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_NIE_MAM_03_02"); //A wiêc nie masz te¿ ¿ycia w tym Obozie!
	GRD_208_Cutter.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

FUNC VOID DIA_Cutter_DISS_BANDIT_ZAPOMNIJ()
{
    AI_Output (other, self ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_15_01"); //Zapomnij. Nie uda ci siê mnie zastraszyæ!
    AI_Output (self, other ,"DIA_Cutter_DISS_BANDIT_ZAPOMNIJ_03_02"); //Zobaczymy! Zmów ostatni¹ modlitwê do Innosa!
	GRD_208_Cutter.guild = GIL_NONE;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_NONE);
    Info_ClearChoices		(DIA_Cutter_DISS_BANDIT);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> AFTER_FIGHT
//========================================

INSTANCE DIA_Cutter_AFTER_FIGHT (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_AFTER_FIGHT_Condition;
   information  = DIA_Cutter_AFTER_FIGHT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_AFTER_FIGHT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_DISS_BANDIT))
    && (GRD_208_Cutter.aivar[AIV_HASDEFEATEDSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_AFTER_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_03_01"); //Nie masz ¿ycia w tym Obozie! 
	GRD_208_Cutter.guild = GIL_GRD;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_GRD);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AFTER_FIGHT_WIN
//========================================

INSTANCE DIA_Cutter_AFTER_FIGHT_WIN (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 2;
   condition    = DIA_Cutter_AFTER_FIGHT_WIN_Condition;
   information  = DIA_Cutter_AFTER_FIGHT_WIN_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Cutter_AFTER_FIGHT_WIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_DISS_BANDIT))
    && (GRD_208_Cutter.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_AFTER_FIGHT_WIN_Info()
{
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_01"); //To niemo¿liwe. Jestem jednym z najlepszych wojowników w ca³ym Starym Obozie. 
    AI_Output (other, self ,"DIA_Cutter_AFTER_FIGHT_WIN_15_02"); //Treningi u Bandytów potrafi¹ zdzia³aæ cuda.
    AI_Output (self, other ,"DIA_Cutter_AFTER_FIGHT_WIN_03_03"); //OdejdŸ st¹d! Nie chcê ciê tu widzieæ!
    AI_StopProcessInfos	(self);
	GRD_208_Cutter.guild = GIL_GRD;
	Npc_SetTrueGuild (GRD_208_Cutter,GIL_GRD);
};


//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Wasz zamek jest bardzo du¿y.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Wasz zamek jest bardzo du¿y.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba ciê jeszcze tutaj nie widzia³em. Kim jesteœ?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jestem tu nowy. Chcia³em siê trochê rozejrzeæ.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 0;
	description = "Mo¿esz mi opowiedzieæ o tym zamku?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo¿esz mi opowiedzieæ o tym zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu du¿o mówiæ: Gomez i jego ludzie zajêli go po wielkim buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz¹tku wiedzia³em, ¿e warto bêdzie stan¹æ po jego stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wiêŸniowie zamkniêci w lochach lub zmuszani do pracy w kopalni, uznawa³o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj¹ siê pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz œwiec¹ pustk¹. Nikt tam nie schodzi³ od czasu wielkiego buntu.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Jak wygl¹da ¿ycie Stra¿nika?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl¹da ¿ycie Stra¿nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jesteœmy najwiêkszym i najsilniejszym Obozem w Kolonii. Nikt nie œmie nas zaczepiaæ.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Rozumiem.
	AI_StopProcessInfos	(self);
};

	

//========================================
//-----------------> SzukaszBulita
//========================================

INSTANCE DIA_Cutter_SzukaszBulita (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_SzukaszBulita_Condition;
   information  = DIA_Cutter_SzukaszBulita_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_SzukaszBulita_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_QuestGRD1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_SzukaszBulita_Info()
{
    AI_Output (self, other ,"DIA_Cutter_SzukaszBulita_03_01"); //Szukasz Bullita?
    AI_Output (other, self ,"DIA_Cutter_SzukaszBulita_15_02"); //Mo¿liwe.
    AI_Output (self, other ,"DIA_Cutter_SzukaszBulita_03_03"); //Poszed³ w³aœnie na plac wymian. Podobno zrzucili kogoœ nowego.
    B_LogEntry                     (CH2_BullitBadass,"Bullit poszed³ na plac wymian. Teraz mam szansê zdobyæ jakiœ dowód na niego.");
    AI_StopProcessInfos	(self);
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dokona³eœ w³aœciwego wyboru. Spodoba ci siê bycie Stra¿nikiem!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PorwanieMysliwego
//========================================

INSTANCE DIA_Cutter_PorwanieMysliwego (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_PorwanieMysliwego_Condition;
   information  = DIA_Cutter_PorwanieMysliwego_Info;
   permanent	= FALSE;
   description	= "Podobno porwaliœcie myœliwego.";
};

FUNC INT DIA_Cutter_PorwanieMysliwego_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_Porwanie))
    && (MIS_Kidnapping == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_PorwanieMysliwego_Info()
{
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_01"); //Podobno porwaliœcie myœliwego.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_02"); //Mo¿liwe.
    AI_Output (other, self ,"DIA_Cutter_PorwanieMysliwego_15_03"); //Dlaczego to zrobiliœcie?
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_04"); //O to musisz ju¿ spytaæ Kruka.
    AI_Output (self, other ,"DIA_Cutter_PorwanieMysliwego_03_05"); //To on zleci³ nam to zadanie.
    B_LogEntry                     (CH3_Kidnapping,"Za porwaniem Alexa stoi Kruk. Muszê z nim porozmawiaæ.");

   // B_GiveXP (150);
};


//--------------------------------------------------------------------------1.6.1----------------------------------------------------------------


//========================================
//-----------------> PorwanieMysliwego
//========================================

INSTANCE DIA_Cutter_Bramus (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_Bramus_Condition;
   information  = DIA_Cutter_Bramus_Info;
   permanent	= FALSE;
   description	= "Pora zaj¹æ siê besti¹ grasuj¹c¹ nieopodal placu wymian.";
};

FUNC INT DIA_Cutter_Bramus_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Thorus_Potwor_Joel))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_Bramus_Info()
{
    AI_Output (other, self ,"DIA_Cutter_Bramus_15_01"); //Pora zaj¹æ siê besti¹ grasuj¹c¹ nieopodal placu wymian. Thorus powiedzia³ mi, ¿e masz wzi¹æ udzia³ w tym zadaniu. Wyruszymy wieczorn¹ por¹.
    AI_Output (self, other ,"DIA_Cutter_Bramus_03_02"); //Niech bêdzie. I tak nie zacz¹³em siê ju¿ nieco nudziæ. Tak przynajmniej bêdê móg³ siê trochê rozruszaæ jak za dawnych czasów.
	AI_Output (self, other ,"DIA_Cutter_Bramus_03_03"); //Daj znaæ jak bêdziemy udawali siê w drogê. Bêdê na ciebie czeka³ przed obozem. 
    Npc_ExchangeRoutine(self,"OC1");
	B_LogEntry                     (PotworBramus,"Pogada³em z Siekaczem. Odniós³ siê on z entuzjazmem co do otrzymanego zadania. Oczekuje on rozrywki choæ mi wydaje siê, ¿e czeka nas bardzo niebezpieczna przygoda. Zaczeka na mnie przed obozem.");
};

//========================================
//-----------------> PorwanieMysliwego
//========================================

INSTANCE DIA_Cutter_Bramus_droga (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_Bramus_droga_Condition;
   information  = DIA_Cutter_Bramus_droga_Info;
   permanent	= FALSE;
   description	= "Ruszamy.";
};

FUNC INT DIA_Cutter_Bramus_droga_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Cutter_Bramus))
    && (Wld_IsTime (19,00,05,00) == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_Bramus_droga_Info()
{
    AI_Output (other, self ,"DIA_Cutter_Bramus_droga_15_01"); //Ruszamy.
    AI_Output (self, other ,"DIA_Cutter_Bramus_droga_03_02"); //Niech bêdzie
	Npc_ExchangeRoutine            (GRD_208_Cutter,"bramus");
};

//========================================
//-----------------> PorwanieMysliwego
//========================================

INSTANCE DIA_Cutter_Bramus_Potwor (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_Bramus_Potwor_Condition;
   information  = DIA_Cutter_Bramus_Potwor_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Cutter_Bramus_Potwor_Condition()
{
    if (Npc_IsDead(HugeSnapper)) 
    &&(Npc_KnowsInfo (hero,DIA_Thorus_Potwor_Joel))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cutter_Bramus_Potwor_Info()
{
     AI_Output (self, other ,"DIA_Cutter_Bramus_Potwor_03_01");//Wredna bestia gryzie piach, pora wracaæ do obozu. Ty poinformuj o tym Thorusa.
     AI_Output (other, self ,"DIA_Cutter_Bramus_Potwor_15_02");//Racja. Wreszcie ten teren zyska na bezpieczeñstwie.
	 
	 B_LogEntry                     (PotworBramus,"Po trudnej walce pokonaliœmy wielkiego gada. Teraz pora wróciæ do obozu i zdaæ raport Thorusowi.");
	 Npc_ExchangeRoutine            (GRD_208_Cutter,"start");
	 Npc_ExchangeRoutine            (Grd_255_Fletcher,"start");
};




//========================================
//-----------------> Blachostka
//========================================

INSTANCE DIA_Cutter_Blachostka (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 1;
   condition    = DIA_Cutter_Blachostka_Condition;
   information  = DIA_Cutter_Blachostka_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cutter_Blachostka_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Corristo_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Cutter_Blachostka_Info()
{
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_01"); //Po co by³eœ w siedzibie Magów Ognia?
    AI_Output (other, self ,"DIA_Cutter_Blachostka_15_02"); //To moja sprawa.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_03"); //Wiem jacy s¹ Magowie. 
    AI_Output (other, self ,"DIA_Cutter_Blachostka_15_04"); //Niby jacy?
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_05"); //Trudni w obyciu. 
    AI_Output (other, self ,"DIA_Cutter_Blachostka_15_06"); //¯ebyœ wiedzia³.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_07"); //Wiêc o co tu chodzi?
    AI_Output (other, self ,"DIA_Cutter_Blachostka_15_08"); //Nie chc¹ mi sprzedaæ pewnego cennego zaklêcia.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_09"); //Nic dziwnego. Skoro jest takie drogocenne to musi im na nim zale¿eæ.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_10"); //Takie przedmioty s¹ dobrze ukryte. O ile siê nie mylê to Magowie maj¹ magazynek w zamkowej wie¿y.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_03_11"); //Czêsto wysy³aj¹ tam swojego kuriera. On powinien mieæ klucz.
};

//========================================
//-----------------> Blachostka_W
//========================================

INSTANCE DIA_Cutter_Blachostka_W (C_INFO)
{
   npc          = GRD_208_Cutter;
   nr           = 2;
   condition    = DIA_Cutter_Blachostka_W_Condition;
   information  = DIA_Cutter_Blachostka_W_Info;
   permanent	= FALSE;
   description	= "Dlaczego mi pomagasz?";
};

FUNC INT DIA_Cutter_Blachostka_W_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Blachostka))
{
    return TRUE;
};
};
FUNC VOID DIA_Cutter_Blachostka_W_Info()
{
    AI_Output (other, self ,"DIA_Cutter_Blachostka_W_15_01"); //Dlaczego mi pomagasz?
    AI_Output (self, other ,"DIA_Cutter_Blachostka_W_03_02"); //Wygl¹dasz mi na równego goœcia. A tutaj rzadko to siê zdarza.
    AI_Output (other, self ,"DIA_Cutter_Blachostka_W_15_03"); //W¹tpiê by by³a to twoja prawdziwa motywacja. Wydajesz mi siê œrednio wiarygodny.
    AI_Output (self, other ,"DIA_Cutter_Blachostka_W_03_04"); //To tylko twoje œlepe przypuszczenia ch³opcze.
    AI_Output (other, self ,"DIA_Cutter_Blachostka_W_15_05"); //Akurat. W ka¿dym razie pogadam z tym kurierem.
	Npc_ExchangeRoutine(GRD_208_Cutter,"Start");
	B_LogEntry               (Blachostka,"Zaczepi³ mnie Siekacz. Powiedzia³, ¿e Magowie Ognia wysy³aj¹ po ró¿ne rzeczy swojego kuriera. Cenne rzeczy maj¹ ukryte w zamkowej wie¿y a on ma do nich klucz. Muszê z nim jakoœ pogadaæ by dowiedzieæ siê czegoœ co pomo¿e mi go rozpracowaæ.");
    AI_StopProcessInfos	(self);
};










