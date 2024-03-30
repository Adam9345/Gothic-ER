//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RaeuberDoyle_EXIT(C_INFO)
{
	npc             = BAN_1613_Doyle;
	nr              = 999;
	condition		= DIA_RaeuberDoyle_EXIT_Condition;
	information		= DIA_RaeuberDoyle_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_RaeuberDoyle_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RaeuberDoyle_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
func void DoyleSmithHostile()
{
    AI_StopProcessInfos	(hero);
	Npc_SetPermAttitude (BAN_40147_Smith, ATT_HOSTILE);
    Npc_SetTarget       (BAN_40147_Smith, hero);
    AI_StartState       (BAN_40147_Smith, ZS_ATTACK, 1, "");
	Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
    //Npc_SetTarget (BAN_1613_Doyle, hero);
    //AI_StartState (BAN_1613_Doyle, ZS_ATTACK, 1, "");
};
func void DoyleSmithHostileTwo()
{
    AI_StopProcessInfos	(hero);
	Npc_SetPermAttitude (BAN_40147_Smith, ATT_HOSTILE);
    Npc_SetTarget       (BAN_40147_Smith, hero);
    AI_StartState       (BAN_40147_Smith, ZS_ATTACK, 1, "");
	Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
    Npc_SetTarget (BAN_1613_Doyle, hero);
    AI_StartState (BAN_1613_Doyle, ZS_ATTACK, 1, "");
};
///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 1
// Pogaduchy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> STAN
//========================================

INSTANCE DIA_Raeuber_STAN (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_STAN_Condition;
   information  = DIA_Raeuber_STAN_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Raeuber_STAN_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_STAN_Info()
{
	if (Kapitel != 4)
    {
    AI_Output (other, self ,"DIA_Raeuber_STAN_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Raeuber_STAN_03_02"); //Nie�le. Cisza, spok�j. Ostatnio nikt tu nie zagl�da.
    }
	else
	{
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_03"); //Jak leci?
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_04"); //Stra�nicy coraz cz�ciej podchodz� pod Ob�z. Zaczynam si� obawia� potyczki. 
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_05"); //Jednak w Obozie nie czu� tego strachu.
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_06"); //Bandyci nie wiedz� na co si� porywaj�. Ludzi Gomeza jest wi�cej. Maj� lepsze uzbrojenie. To si� mo�e dla nas �le sko�czy�.    
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� -
// Warn
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WYPAD
//========================================

INSTANCE DIA_Raeuber_WYPAD (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_WYPAD_Condition;
   information  = DIA_Raeuber_WYPAD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_WYPAD_Condition()
{
	if (Kapitel < 4)
	&& (Npc_GetTrueGuild(other) == GIL_NONE) 
	{
    return TRUE;
};
};
FUNC VOID DIA_Raeuber_WYPAD_Info()
{
         AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_01"); // Ej co� ty za jeden!
         AI_DrawWeapon (self);
		if (!Npc_KnowsInfo (hero, DIA_Drax_CAMPGO))
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_02"); //Chcia�em tylko zobaczy� co tutaj le�y.
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_03"); //B�dzie le�e� twoje �mierdz�ce truch�o!
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_04"); //A gdzie ja jestem?
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_05"); //Niewa�ne. Tu dla ciebie jest ju� koniec �wiata...
		Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
		Wld_InsertNpc		(BAN_40147_Smith,"LOCATION_11_01");
		DoyleSmithHostile();
		}
		else
		{
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_06"); //Przyprowadzi� mnie tu Drax. Zda�em wszystkie jego sprawdziany I powiedzia�, �e m�g�bym do was do��czy�.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_07"); //Hmm... Niech ci b�dzie, zapraszam do �rodka. Ale nie radz� robi� �adnych numer�w!
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_08"); //Gdyby� nie powo�a� si� na Draxa musia�bym ci� ukatrupi�.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_09"); //Wzi��by� mnie za rzekomego zwiadowc� Gomeza?
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_10"); //W tej wrednej Kolonii zawsze trzeba bra� pod uwag� te najgorsze scenariusze.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_11"); //Inaczej �atwo sko�czysz nafaszerowany cudz� stal� ch�opcz�.
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_12"); //Pouczaj�ce. A teraz pozw�l, �e wejd� do obozu.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_13"); //Tylko nie wywr�� go do g�ry nogami bo si� pogniewam I b�d� musia� ci� sprz�tn�� haha
		  self.aivar[AIV_PASSGATE]=TRUE;
		//log
        //B_LogEntry                     (CH1_BANDITOS_CAMP,"Doyle wpu�ci� mnie do Obozu. Mog� teraz spokojnie i�� do Quentina. Prosi� mnie te�, abym przyszed� do niego, gdy pogadam z szefem bandy.");
		//exit
        AI_StopProcessInfos	(self);
        };
};

//========================================
//-----------------> Przejebane
//========================================

INSTANCE DIA_Raeuber_Przejebane (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_Przejebane_Condition;
   information  = DIA_Raeuber_Przejebane_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Przejebane_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_HahahaSpierdalaj))
    && C_NpcBelongsToOldCamp(hero)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Przejebane_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_01"); //Oszuka�e� nas i przy��czy�e� si� do tych drani!
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_02"); //Odejd�, p�ki mam cierpliwo��.
    wypierdalajBANDITOS = true;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloNoGRD
//========================================

INSTANCE DIA_Raeuber_HelloNoGRD (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_HelloNoGRD_Condition;
   information  = DIA_Raeuber_HelloNoGRD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_HelloNoGRD_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_NOV)
    || (Npc_GetTrueGuild(other) == GIL_ORG)
    || (Npc_GetTrueGuild(other) == GIL_SLD)
    || (Npc_GetTrueGuild(other) == GIL_TPL)
   
    || (Npc_GetTrueGuild(other) == GIL_SFB)
  

	&& (kapitel <=3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_HelloNoGRD_Info()
{
   
	AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_01"); //Czego tu?
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_02"); //Uspok�j si�. Mam tu kilka spraw do za�atwienia.
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_03"); //Taaa co ty nie powiesz. Niby czemu mamy ci ufa�?
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_04"); //Nie jestem cz�onkiem Starego Obozu. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_05"); //Twoje szcz�cie inaczej w�a�nie stawa�by� si� trupem!
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_06"); //Mi�o wiedzie�....
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_07"); //Niby nie do��czy�e� do naszych wrog�w. Ale nie mamy gwarancji, �e si� z nimi nie zw�cha�e�.
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_08"); //Je�li zaprzestacie kontak�w ze wszystkimi pozosta�ymi obozami d�ugo nie poci�gniecie. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_09"); //Wygadany. Pi�nij s��wko, kt�remu� Stra�nikowi a osobi�cie wypruje ci flaki!
	Info_ClearChoices	(DIA_Raeuber_HelloNoGRD);
	Info_AddChoice		(DIA_Raeuber_HelloNoGRD, "Spokojnie nie mam zamiaru.", DIA_Doyle_ItsOk);
	Info_AddChoice		(DIA_Raeuber_HelloNoGRD, "Thorus ch�tnie sie dowie gdzie macie ob�z...", DIA_Doyle_Hostile);
	
   // AI_StopProcessInfos	(self);
};
Func Void DIA_Doyle_ItsOk()
{
    AI_Output (other,self ,"DIA_Doyle_ItsOk_15_01"); //Spokojnie nie mam zamiaru.
    AI_Output (self,other ,"DIA_Doyle_ItsOk_03_02"); //Pami�taj �e mamy cie na oko.
    Info_ClearChoices		(DIA_Raeuber_HelloNoGRD);
};


Func Void DIA_Doyle_Hostile()
{

     
    AI_Output (other,self,"DIA_Doyle_Hostile_15_01"); //Thorus ch�tnie sie dowie gdzie macie ob�z...
    AI_Output (self,other,"DIA_Doyle_Hostile_03_02"); //Nie by� bym tego taki pewny.
	Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
	Wld_InsertNpc		(BAN_40147_Smith,"LOCATION_11_01");
	Info_ClearChoices	(DIA_Raeuber_HelloNoGRD);
	AI_StopProcessInfos	(self);
	
	DoyleSmithHostile();
    
	

	
};


//========================================
//-----------------> HeroIs_GRD
//========================================

INSTANCE DIA_Doyle_HeroIs_GRD (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 2;
   condition    = DIA_Doyle_HeroIs_GRD_Condition;
   information  = DIA_Doyle_HeroIs_GRD_Info;
   permanent	= FALSE;
   important = true;
};

FUNC INT DIA_Doyle_HeroIs_GRD_Condition()
{

    if ((Npc_GetTrueGuild(other) == GIL_STT)   || (Npc_GetTrueGuild(other) == GIL_VLK) || (Npc_GetTrueGuild(other) == GIL_GRD))
{
    return TRUE;
};
};
FUNC VOID DIA_Doyle_HeroIs_GRD_Info()
{
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_01"); //No prosz� kolega ze Starego Obozu?
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_02"); //Nooo...
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_03"); //Jak mi�o!
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_04"); //Chcia�em si� tylko troch� rozejrze�.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_05"); //A ja rozerwa� bo bol� mnie giry od ci�g�ego stania w miejscu. No i prosz�!
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_06"); //To jest ten moment w, kt�rym powinienem zawr�ci�.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_07"); // Ty sukinsynu! Wypaplasz wszystko Magnatom a my b�dziemy mie� k�opoty.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_08"); //Ju� nie napijesz si� piwka z kumplami w Starym Obozie. Gi�!
	Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
	Wld_InsertNpc	    (BAN_40147_Smith,"LOCATION_11_01");
	AI_StopProcessInfos	(self);
	DoyleSmithHostileTwo();

};



//========================================
//-----------------> OhGURU
//========================================

INSTANCE DIA_Raeuber_OhGURU (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 2;
   condition    = DIA_Raeuber_OhGURU_Condition;
   information  = DIA_Raeuber_OhGURU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_OhGURU_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_GUR) && (kapitel <=3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_OhGURU_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_01"); //Guru w Obozie Bandyt�w? Tego jeszcze nie by�o. 
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_02"); //Prosz�, wchod�. Zapewne masz jakie� sprawy do za�atwienia z naszym przyw�dc�. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OhKDW
//========================================

INSTANCE DIA_Raeuber_OhKDW (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 3;
   condition    = DIA_Raeuber_OhKDW_Condition;
   information  = DIA_Raeuber_OhKDW_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_OhKDW_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_KDW)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_OhKDW_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_01"); //Witaj, Magu! Co ci� tu sprowadza? 
    AI_Output (other, self ,"DIA_Raeuber_OhKDW_15_02"); //Mam tu kilka spraw do za�atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_03"); //Nie licz na dodatkowy szacunek z racji pe�nionej funkcji. Wi�kszo�� z nas ma bog�w tam, gdzie �wiat�o nie dochodzi.
    AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

var int robotaPALISADA;
//========================================
//-----------------> WORK
//========================================

INSTANCE DIA_Raeuber_WORK (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 3;
   condition    = DIA_Raeuber_WORK_Condition;
   information  = DIA_Raeuber_WORK_Info;
   permanent	= FALSE;
   description	= "Jak� masz dla mnie prac�?";
};

FUNC INT DIA_Raeuber_WORK_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)  && (wypierdalajBANDITOS == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_WORK_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_15_01"); //Wspomina�e� co� o jakiej� robocie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_02"); //A, tak! Potrzebuj� ��todzioba, kt�ry naprawi palisad�. Oczywi�cie dostaniesz troch� rudy.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_03"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Raeuber_WORK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Jasne.", DIA_Raeuber_WORK_TAK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Raczej nie.", DIA_Raeuber_WORK_NIE);
};

FUNC VOID DIA_Raeuber_WORK_TAK()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_02"); //To �wietnie. B�d� ci bardzo wdzi�czny. 
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_03"); //Tylko uwa�aj na zwierzaki z lasu.
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_04"); //Dobra.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_05"); //We� ten m�otek.
    robotaPALISADA = true;
    CreateInvItems (self, ItMiHammer, 1);
    B_GiveInvItems (self, other, ItMiHammer, 1);
    Palisada = LOG_RUNNING;
    Log_CreateTopic            		(CH1_Palisada, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_Palisada, LOG_RUNNING);
    B_LogEntry                    	(CH1_Palisada,"Doyle kaza� mi naprawi� palisad� przy wej�ciu do Obozu Bandyt�w.");

	Npc_ExchangeRoutine (self,"FAJRANT");
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_WORK_NIE()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_NIE_15_01"); //Raczej nie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_NIE_03_02"); //Na twoim miejscu bardziej stara�bym si� o opini� w Obozie.
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);	
};

//========================================
//-----------------> END_WORK
//========================================

INSTANCE DIA_Raeuber_END_WORK (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 4;
   condition    = DIA_Raeuber_END_WORK_Condition;
   information  = DIA_Raeuber_END_WORK_Info;
   permanent	= FALSE;
   description	= "Sko�czy�em robot�.";
};

FUNC INT DIA_Raeuber_END_WORK_Condition()
{
    if (Palisada == LOG_RUNNING)
	&& naprawiono_P1 == true
	&& naprawiono_P2 == true
	&& naprawiono_P3 == true
	&& naprawiono_P4 == true
	&& naprawiono_P5 == true
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_END_WORK_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_END_WORK_15_01"); //Sko�czy�em robot�.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_02"); //To �wietnie. Dobrze si� spisa�e�.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_03"); //Masz tu wynagrodzenie.
    B_LogEntry                     (CH1_Palisada,"Naprawi�em palisad�. Doyle wydawa� si� by� zadowolony.");
    Log_SetTopicStatus       (CH1_Palisada, LOG_SUCCESS);
    Palisada = LOG_SUCCESS;

    B_GiveXP (XP_NaprawaPaliasady);
    CreateInvItems (self, ItAmArrow, 25);
    B_GiveInvItems (self, other, ItAmArrow, 25);
    CreateInvItems (self, ItMiNugget, 20);
    B_GiveInvItems (self, other, ItMiNugget, 20);
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};

var int payforteleport_to_banditcamp;
//========================================
//-----------------> TELEPORT
//========================================

INSTANCE DIA_Raeuber_TELEPORT (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_TELEPORT_Condition;
   information  = DIA_Raeuber_TELEPORT_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o budowli znajduj�cej si� niedaleko za twoimi plecami?";
};

FUNC INT DIA_Raeuber_TELEPORT_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_TELEPORT_Info()
{

    AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_01"); //Wiesz co� o budowli znajduj�cej si� niedaleko za twoimi plecami?
    AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_02"); //M�wisz o naszej chacie? 
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_03"); //Pewnie, �e nie! Ju� wiem o co ci chodzi.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_04"); //Jedyne co wiem o tej rzeczy to to, �e jest bardzo stara. Gdy si� tu osiedlali�my znalaz�em t� run�.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_05"); //To mo�e by� teleport.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_06"); //Nawet je�li, to w�tpi� �eby jeszcze dzia�a�. Wszystko jest nie�le rozwalone.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_07"); //Mo�esz mi da� ten teleport?
	if (Palisada == LOG_SUCCESS)
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_08"); //W sumie... Bierz go. Na nic mi si� nie przyda, a ty pomog�e� mi wtedy przy palisadzie.
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_09"); //Nie pomog�e� mi, gdy ci� prosi�em, wi�c nie jestem ci nic winien. Chc� za niego 100 bry�ek rudy.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_10"); //Przecie� nawet nie wiesz czy dzia�a.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_11"); //Nie chcesz, nie kupuj. Moja cena to 100 bry�ek rudy.
	payforteleport_to_banditcamp = true;
	};
};

//========================================
//-----------------> BUYTELEPORT
//========================================

INSTANCE DIA_Raeuber_BUYTELEPORT (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_BUYTELEPORT_Condition;
   information  = DIA_Raeuber_BUYTELEPORT_Info;
   permanent	= TRUE;
   description	= "Dawaj ju� ten teleport. (100 bry�ek rudy)";
};

FUNC INT DIA_Raeuber_BUYTELEPORT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_TELEPORT)) && (payforteleport_to_banditcamp == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_BUYTELEPORT_Info()
{

    AI_Output (other, self ,"DIA_Raeuber_BUYTELEPORT_15_01"); //Dawaj ju� ten teleport.
	if (Npc_HasItems(other,itminugget)>=100)
	{
    AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_02"); //Jest tw�j!
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	
	B_GiveInvItems (other, self, itminugget,100);
	
	payforteleport_to_banditcamp = false;
	DIA_Raeuber_BUYTELEPORT.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_03"); //No a gdzie jest ruda?!
	};
};
//========================================
//-----------------> NAPASC
//========================================

INSTANCE DIA_Raeuber_NAPASC (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 5;
   condition    = DIA_Raeuber_NAPASC_Condition;
   information  = DIA_Raeuber_NAPASC_Info;
   permanent	= False;
   description	= "Szykuje si� robota.";
};

FUNC INT DIA_Raeuber_NAPASC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_QUEST4)) && (HeroANPWDoyle == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_NAPASC_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_01"); //Szykuje si� robota. Mamy napa�� na plac wymian.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_02"); //A, tak. S�ysza�em. Quentin m�wi� ci o dokumentach? 
	AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_03"); //Co� tam wspomina�...
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_04"); //Trzeba zwraca� na nie uwag� i przeszukiwa� skrzynie. Pomagaj� nam organizowa� kolejne napady. Ostatnim razem znalaz�em tylko dwa, ale teraz powinno by� wi�cej.
	AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_05"); //Wyruszymy Wieczorem. 
	B_LogEntry               (CH1_Rozpierdol1,"Mam przyj�� do Doyle'a wieczorem, wtedy wyruszymy na plac wymian.");
	
};
func void AttackExchangeSquare()
{


	Npc_ExchangeRoutine (GRD_2001_Stra�nik,"bijacz");
	Npc_ExchangeRoutine (GRD_2002_Stra�nik,"bijacz");
	Npc_ExchangeRoutine (GRD_254_Orry,"OMFull");
	Npc_ExchangeRoutine (GRD_281_Gardist,"start2");
	
	
	
	
	
	B_ChangeGuild    (GRD_2002_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2001_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2003_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2005_Stra�nik,GIL_DMB);  
	B_ChangeGuild    (VLK_2004_Robotnik,GIL_DMB);  
	B_ChangeGuild    (GRD_254_Orry,GIL_DMB);  
	B_ChangeGuild    (GRD_281_Gardist,GIL_DMB);  
	B_ChangeGuild    (GRD_5099_Kwatermistrz,GIL_DMB);  
	
	
	
	CreateInvItem    (GRD_5099_Kwatermistrz,itmi_plac_doc4);
	CreateInvItem    (GRD_2002_Stra�nik,itmi_grd2002_key);
	CreateInvItem    (GRD_2001_Stra�nik,itmi_plac_doc1);
	CreateInvItem    (GRD_254_Orry,itmi_plac_doc3);
	
    DIA_Raeuber_NAPASC.permanent = false;
    BAN_1613_Doyle.aivar[AIV_PARTYMEMBER] = TRUE;
};

//========================================
//-----------------> Attack_ExchangeSquare
//========================================

INSTANCE DIA_Doyle_Attack_ExchangeSquare (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Doyle_Attack_ExchangeSquare_Condition;
   information  = DIA_Doyle_Attack_ExchangeSquare_Info;
   permanent	= FALSE;
   description	= "Ju� pora. Chod�my.";
};

FUNC INT DIA_Doyle_Attack_ExchangeSquare_Condition()
{
   if (Wld_IsTime(18,00,04,00))
   && (Npc_KnowsInfo (hero, DIA_Raeuber_NAPASC))
{
    return TRUE;
};
};
FUNC VOID DIA_Doyle_Attack_ExchangeSquare_Info()
{
    AI_Output (other, self ,"DIA_Doyle_Attack_ExchangeSquare_15_01"); //Ju� pora. Chod�my.
    AI_Output (self, other ,"DIA_Doyle_Attack_ExchangeSquare_03_02"); //Dobra, pod��aj za mn�.
	Info_ClearChoices	(DIA_Doyle_Attack_ExchangeSquare);
	Info_AddChoice		(DIA_Doyle_Attack_ExchangeSquare, "(Szybka podr�)", DIA_Doyle_AES_GO);
	
};


FUNC VOID DIA_Doyle_AES_GO()
{
  
	Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    Npc_ExchangeRoutine (BAN_1613_Doyle,"AttackExchangeSquare");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(BAN_1613_Doyle,"OW_PATH_1_14");
	AI_Teleport(hero,"OW_PATH_1_14");
	
	AttackExchangeSquare();
	
	HeroANPWDoyle = false;
};
//========================================
//-----------------> UWAGA
//========================================

INSTANCE DIA_Raeuber_UWAGA (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 6;
   condition    = DIA_Raeuber_UWAGA_Condition;
   information  = DIA_Raeuber_UWAGA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_UWAGA_Condition()
{
    if (Npc_GetDistToWP (hero, "OW_PATH_1_14") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Doyle_Attack_ExchangeSquare))
	&& (MIS_AttackOnPlace == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_UWAGA_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_01"); //Uwa�aj na kusznik�w. I przygotuj bro�.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_02"); //Zaskoczymy ich.
	Npc_ExchangeRoutine (BAN_1613_Doyle,"atak1");
};

//========================================
//-----------------> PIERWSZY_POSTERUNEK
//========================================

INSTANCE DIA_Raeuber_PIERWSZY_POSTERUNEK (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 6;
   condition    = DIA_Raeuber_PIERWSZY_POSTERUNEK_Condition;
   information  = DIA_Raeuber_PIERWSZY_POSTERUNEK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PIERWSZY_POSTERUNEK_Condition()
{
    if (Npc_GetDistToWP (hero, "XXX") < 1500)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_UWAGA))
	&& (MIS_AttackOnPlace == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PIERWSZY_POSTERUNEK_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_01"); //Dobrze, cz�� tych sukinsyn�w gryzie piach. Przeszukaj ich cia�a. Pami�taj, �eby zwraca� uwag� na dokumenty! Potem ruszymy dalej. 
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_02"); //Chwila! Zamkn�li bram�! Musisz jako� wspi�� si� po skale i j� otworzy�. 
};



//========================================
//-----------------> SPADAMY
//========================================

INSTANCE DIA_Raeuber_SPADAMY (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 7;
   condition    = DIA_Raeuber_SPADAMY_Condition;
   information  = DIA_Raeuber_SPADAMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_SPADAMY_Condition()
{
    if  (Npc_GetDistToWP (self, "PLAC3") < 1000)
	&& (MIS_AttackOnPlace == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_SPADAMY_Info()
{
	AI_GotoNpc(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_01"); //Po zabawie. Wracamy, zanim kto� si� tu zjawi.
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_02"); //Zabieraj co mo�esz i chod�.
	AI_GotoNpc(self,hero);
    B_LogEntry(CH1_Rozpierdol1,"Mam zabra� wszystkie �upy i dokumenty po czym wr�ci� do Obozu i donie�� o wszystkim Quentinowi.");

    B_GiveXP (XP_AtakNaplacWymian);

    self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RayansDie
//========================================

INSTANCE DIA_Raeuber_RayansDie (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_RayansDie_Condition;
   information  = DIA_Raeuber_RayansDie_Info;
   permanent	= FALSE;
   description	= "Chcia�bym zapyta� o �mier� Rayana.";
};

FUNC INT DIA_Raeuber_RayansDie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_YourSwordPieces))
    && (JensIsVictimOfKereth == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_RayansDie_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_01"); //Chcia�bym zapyta� o �mier� Rayana.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_02"); //Nic o tym nie wiem. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_03"); //A mo�e jednak co� widzia�e�? Kereth oskar�a o to zab�jstwo Jensa. Widzia�e� go mo�e tego dnia?
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_04"); //Hmm... O ile dobrze pami�tam to nie. Jens nie wychodzi� wtedy z Obozu. Nawet w wychodku nie by�! 
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_05"); //Za Rayanem wychodzili tylko Ratford i Drax, ale oni s� czy�ci. R�cz� za nich. Mo�liwe, �e by�a z nimi jeszcze trzecia osoba.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_06"); //Nie zwr�ci�em wtedy na to uwagi. No, ale co do Jensa to jest czysty. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_07"); //Dzi�ki.
    B_LogEntry                     (CH1_DestroyedGrave,"Doyle po�wiadczy�, �e w dniu zab�jstwa Rayana Jens na pewno nie opuszcza� Obozu. ");
    AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 3
// Polowanie
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> PolowanieNaZebacze
//========================================

INSTANCE DIA_Raeuber_PolowanieNaZebacze (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_PolowanieNaZebacze_Condition;
   information  = DIA_Raeuber_PolowanieNaZebacze_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PolowanieNaZebacze_Condition()
{
    if (Kapitel == 3)
    && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_01"); //Hej. Idziesz ze mn� na polowanie?
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_15_02"); //Na co chcesz zapolowa�?
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_03"); //Na z�bacze. Ostatnio troch� ich tu za du�o.

    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Idziemy!", DIA_Raeuber_PolowanieNaZebacze_Go);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Nie mam czasu.", DIA_Raeuber_PolowanieNaZebacze_NotTime);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Go()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_Go_15_01"); //Idziemy!
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_Go_03_02"); //Dobra. Zg�o� si� jak b�dziesz got�w.
    MIS_HuntingWithDoyle = LOG_RUNNING;

    Log_CreateTopic            (CH3_HuntingWithDoyle, LOG_MISSION);
    Log_SetTopicStatus       (CH3_HuntingWithDoyle, LOG_RUNNING);
    B_LogEntry                     (CH3_HuntingWithDoyle,"Doyle zaproponowa� mi wsp�lne polowanie na z�bacze.");
    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_NotTime()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_NotTime_15_01"); //Nie mam czasu.
    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Letsgo256
//========================================

INSTANCE DIA_Raeuber_Letsgo256 (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 2;
   condition    = DIA_Raeuber_Letsgo256_Condition;
   information  = DIA_Raeuber_Letsgo256_Info;
   permanent	= FALSE;
   description	= "Dobra. Chod�my.";
};

FUNC INT DIA_Raeuber_Letsgo256_Condition()
{
    if (MIS_HuntingWithDoyle == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Letsgo256_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Letsgo256_15_01"); //Dobra. Chod�my.
    AI_Output (self, other ,"DIA_Raeuber_Letsgo256_03_02"); //Id� za mn�. P�jdziemy do jaskini przy lesie.
	
    Wld_InsertNpc				(Snapper,"WP_ADD_SNA_05");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_06");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_07");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_08");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_09");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_10");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_11");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_12");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_13");
	Wld_InsertNpc				(Snapper,"WP_ADD_SNA_14");
	Wld_InsertNpc				(Razor,"WP_ADD_SNA_15");
	
    AI_StopProcessInfos	(self);
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (BAN_1613_Doyle,"lasek");
};

//========================================
//-----------------> Bezpiecznie
//========================================

INSTANCE DIA_Raeuber_Bezpiecznie (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 3;
   condition    = DIA_Raeuber_Bezpiecznie_Condition;
   information  = DIA_Raeuber_Bezpiecznie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Bezpiecznie_Condition()
{
    if (Npc_GetDistToWP (self, "SPAWN_OW_SNAPPER_WOOD05_05") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_Letsgo256))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Bezpiecznie_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_01"); //Wreszcie pozbyli�my si� tych cholernych z�baczy,
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_02"); //W jaskini poza trupami w�drowc�w chyba nic nie ma.
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_03"); //Ja wracam do Obozu. B�d� ostro�ny.
    B_LogEntry                     (CH3_HuntingWithDoyle,"Wybili�my z�bacze z jaskini. Mog� wraca� do Obozu.");
    Log_SetTopicStatus       (CH3_HuntingWithDoyle, LOG_SUCCESS);
    MIS_HuntingWithDoyle = LOG_SUCCESS;

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 4
// W�tek g��wny 
///////////////////////////////////////////////////////////////////////////////////////////



//========================================
//-----------------> Corobisz
//========================================

INSTANCE DIA_Raeuber_Corobisz (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_Corobisz_Condition;
   information  = DIA_Raeuber_Corobisz_Info;
   permanent	= FALSE;
   description	= "Co tu do cholery robisz?";
};

FUNC INT DIA_Raeuber_Corobisz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_AkcjaUkonczona))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Corobisz_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_01"); //Co tu do cholery robisz?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_02"); //Nawet nie wiesz jak si� ciesz�, �e ci� widz�!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_03"); //Postanowi�em wybra� si� do Nowego Obozu i pom�c Najemnikom.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_04"); //Sk�d taki pomys�?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_05"); //Przyby� do mnie pewien Szkodnik i powiedzia�, �e Torlof mnie potrzebuje.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_06"); //Stwierdzi�em, �e Rocky poradzi sobie z ogarni�ciem Obozu i wyruszy�em.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_07"); //Niewa�ne... Podczas twojej nieobecno�ci wiele si� dzia�o.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_08"); //Wr�cili�my po ataku do Obozu i okaza�o si�, �e zosta� zaj�ty przez Stra�nik�w.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_09"); //Co?!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_10"); //Naprawd� du�o mnie omin�o.
	
	B_GiveXP (200);
};

//========================================
//-----------------> FindFriend2
//========================================

INSTANCE DIA_Raeuber_FindFriend2 (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 2;
   condition    = DIA_Raeuber_FindFriend2_Condition;
   information  = DIA_Raeuber_FindFriend2_Info;
   permanent	= FALSE;
   description	= "W ka�dym razie Quentin ci� szuka.";
};

FUNC INT DIA_Raeuber_FindFriend2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_Corobisz))
    && (Npc_KnowsInfo (hero, DIA_Quentin_findFriends))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_FindFriend2_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_01"); //W ka�dym razie Quentin ci� szuka.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_02"); //Uda�o nam si� odbi� Ob�z bez wi�kszych strat. Jeste� nam potrzebny.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_03"); //Dobrze, dobrze, ale mam tu jeszcze jedn� spraw� do za�atwienia. Zobowi�za�em si� pom�c.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_04"); //Nowy Ob�z prowadzi za�arty i otwarty konflikt z Gomezem. Ta grupka Najemnik�w chce pozby� si� Stra�nik�w z doliny obok. 
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_05"); //Przy��cz si� do nich i pom� nam. Potem wr�cimy do Obozu.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_06"); //Nie ma problemu.
	
	//log jest u Torlofa
    //MIS_helpSld1 = LOG_RUNNING;

    //Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    //B_LogEntry               (CH1_helpSld1,"Doyle prosi� mnie bym pom�g� Najemnikom odbi� dolin� pomi�dzy Starym, a Nowym Obozem. Dow�dcz� wyprawy jest Torlof.");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> backtoCamp
//========================================

INSTANCE DIA_Raeuber_backtoCamp (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_backtoCamp_Condition;
   information  = DIA_Raeuber_backtoCamp_Info;
   permanent	= FALSE;
   description	= "Mo�emy ju� wraca�?";
};

FUNC INT DIA_Raeuber_backtoCamp_Condition()
{
    if (MIS_helpSld1 == LOG_SUCCESS) && (Npc_KnowsInfo (hero, DIA_Raeuber_FindFriend2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_backtoCamp_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_backtoCamp_15_01"); //Mo�emy ju� wraca�?
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_02"); //Pewnie. Jak chcesz, to mo�esz i�� sam.
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_03"); //Jako� sobie poradz�.
    Npc_ExchangeRoutine (self,"start");
    B_givexp (100);   
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZNANY_NAJEMNIK
//========================================

INSTANCE DIA_Raeuber_ZNANY_NAJEMNIK (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_ZNANY_NAJEMNIK_Condition;
   information  = DIA_Raeuber_ZNANY_NAJEMNIK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_ZNANY_NAJEMNIK_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_RUNNING) || (MIS_TorlofNeedHelp == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_ZNANY_NAJEMNIK_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_01"); //Ty! Tak, to o tobie wszyscy gadaj�!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_03"); //Nazywam si� Doyle, jestem Bandyt� z Obozu Quentina. 
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_04"); //Pos�uchaj, potrzebuj� twojej pomocy!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_05"); //O co chodzi?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_06"); //Kilku naszych ludzi uda�o si� w okolice Starego Obozu. Chcieli pozby� si� kr�c�cych si� tam patroli Stra�nik�w.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_07"); //I?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_08"); //To przez Draxa. Bardzo si� przej�� �mierci� Ratforda i opracowa� ca�y ten plan.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_09"); //Wiem o tym.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_10"); //Ja, razem z Rockym mia�em pilnowa� obozu, jednak przyszed�em tutaj. Torlof mnie potrzebowa�.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_11"); //Chcia�bym dowiedzie� si�, co si� tam dzieje i czy moi towarzysze ju� wr�cili.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_12"); //By�bym ci bardzo wdzi�czny, gdyby� sprawdzi� co i jak, a w razie czego powiedzia�, �e wkr�tce wr�c�. Tymczasem zaczekam na ciebie u my�liwych.
    MIS_BanditsInTroubles = LOG_RUNNING;
    Npc_ExchangeRoutine (BAN_1614_Drax, "ded");
	CreateInvItems (BAN_1614_Drax, ItMi_Listdraxa,1);
	B_KillNpc (BAN_1614_Drax);
	
    Log_CreateTopic          (CH4_BanditsInTroubles, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_RUNNING);
    B_LogEntry               (CH4_BanditsInTroubles,"Bandyta Doyle poprosi� mnie, abym sprawdzi�, co dzieje si� w jego Obozie, poniewa� on zobowi�za� sie pom�c ludziom Torlofa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BANDYCI_ZYJA
//========================================

INSTANCE DIA_Raeuber_BANDYCI_ZYJA (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_BANDYCI_ZYJA_Condition;
   information  = DIA_Raeuber_BANDYCI_ZYJA_Info;
   permanent	= FALSE;
   description	= "Mam dobre wie�ci.";
};

FUNC INT DIA_Raeuber_BANDYCI_ZYJA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_CO_TY_TU_NAJMENIKU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_BANDYCI_ZYJA_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_01"); //Mam dobre wie�ci. Wszyscy wr�cili, jednak Stra�nicy odnale�li i zaj�li wasz Ob�z.
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_02"); //Na szcz�cie Quentinowi uda�o si� odzyska� Ob�z. By� jednak na ciebie nie lada w�ciek�y.
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_03"); //Cholera... Niewa�ne. Najwa�niejsze, �e nic z�ego si� nie sta�o.
    if (MIS_helpSld1 == LOG_SUCCESS)
    {
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_04"); //Mog� ju� wraca� do Obozu. Dzi�kuj� za wszystko, przyjacielu. Jakby� potrzebowa� kiedy� pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry                     (CH4_BanditsInTroubles,"Wr�ci�em z poleceniem Quentina do Doyle'a. Natychmiast ruszy� w drog�.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS;
    }
    else
    {
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_05"); //M�g�bym ju� wr�ci� do Obozu, ale obieca�em Torlofowi, �e mu pomog�. 
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_06"); //Do��czysz do nas? Potrzebna nam pomoc.
        AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_07"); //Jasne.
		B_LogEntry                     (CH4_BanditsInTroubles,"Wr�ci�em z poleceniem Quentina do Doyle'a. Zanim jednak wr�ci do Obozu b�d� musia� pom�c jemu i Torlofowi pozby� si� Stra�nik�w z doliny.");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MOGE_WRACAC
//========================================

INSTANCE DIA_Raeuber_MOGE_WRACAC (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 2;
   condition    = DIA_Raeuber_MOGE_WRACAC_Condition;
   information  = DIA_Raeuber_MOGE_WRACAC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_MOGE_WRACAC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_BANDYCI_ZYJA))
    && (MIS_BanditsInTroubles == LOG_RUNNING)
    && (MIS_helpSld1 == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_MOGE_WRACAC_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_01"); //�wietnie. Mog� wraca� do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_02"); //Dzi�kuj� za wszystko, przyjacielu. Jakby� potrzebowa� kiedy� pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry               (CH4_BanditsInTroubles,"Po rozwi�zaniu sprawy ze Stra�nikami Doyle wr�ci� do Obozu.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS; 
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia� 4
// W�tek g��wny  -kopalnia
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> GoL
//========================================

INSTANCE DIA_Raeuber_GoL (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_GoL_Condition;
   information  = DIA_Raeuber_GoL_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn� do Opuszczonej Kopalni?";
};

FUNC INT DIA_Raeuber_GoL_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_RUNNING)
    //&& (Npc_KnowsInfo (hero, DIA_Raeuber_backtoCamp)) niepotrzebne
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_GoL_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_GoL_15_01"); //Idziesz ze mn� do Opuszczonej Kopalni?
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_02"); //No pewnie, przyjacielu. 
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_03"); //Chod�my wi�c. Musimy uwa�a� na Stra�nik�w. 
	AI_Output (self, other ,"DIA_Raeuber_GoL_03_04"); //Poczekaj. We�my ze sob� jeszcze kogo�. Id� po Chrisa i Rockiego. Chyba nie maj� nic do roboty. 
	//  self.aivar[AIV_PARTYMEMBER] = TRUE;
	// Npc_ExchangeRoutine (self,"pomoc");
	RockyRobiZaDoyle  = false;
    B_LogEntry                     (CH4_BanditsInAbadonedMine,"Doyle doradzi� mi, �ebym poszed� jeszcze po Chrisa i Rockiego. Mog� nam si� przyda�. ");
    AI_StopProcessInfos	(self);
};
Func void Bandits_ABMine()
{
    AI_Teleport(BAN_1613_Doyle,"OW_PATH_1_14");
	AI_Teleport(hero,"OW_PATH_1_14");

    Wld_InsertNpc				(GRD_2650_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2651_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2652_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2653_Gardist,"OC1");	
	Wld_InsertNpc				(GRD_2654_Gardist,"OC1");	


     	Wld_SendTrigger("KOPALNIAEXIT");
};

//1.4
//========================================
//-----------------> Ready
//========================================

INSTANCE DIA_Raeuber_Ready (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_Ready_Condition;
   information  = DIA_Raeuber_Ready_Info;
   permanent	= FALSE;
   description	= "Jeste�my gotowi!";
};

FUNC INT DIA_Raeuber_Ready_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chris_GoToAbMine))
    && (Npc_KnowsInfo (hero, DIA_Rocky_Follow))
    && (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Ready_Info()
{
    AI_Output (other, self ,"DIA_Raeuber_Ready_15_01"); //Jeste�my gotowi! 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_02"); //�wietnie. Trzech ludzi powinno wystarczy�. 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_03"); //Mo�esz prowadzi�. P�jdziemy za tob�. Tylko b�d� ostro�ny!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
 
    //AI_StopProcessInfos	(self);
	
	
	
	Info_AddChoice		(DIA_Raeuber_Ready, "(Szybka podr�)", Dia_Doyle_ABMine_FastTravel);
};

Func void Dia_Doyle_ABMine_FastTravel()
{

    Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
     Npc_ExchangeRoutine (BAN_1613_Doyle,"pomoc");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(BAN_1613_Doyle,"OW_PATH_1_14");
	AI_Teleport(hero,"OW_PATH_1_14");
	AI_Teleport(BAN_1607_Chris,"OW_PATH_1_14");
	AI_Teleport(BAN_1605_Rocky,"OW_PATH_1_14");
	
	
	

	Bandits_ABMine();
};
//========================================
//-----------------> Spiepszam
//========================================

INSTANCE DIA_Raeuber_Spiepszam (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_Spiepszam_Condition;
   information  = DIA_Raeuber_Spiepszam_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_Spiepszam_Condition()
{
    if (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 1000)
	&& (Npc_KnowsInfo (hero, DIA_Raeuber_Ready))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_Spiepszam_Info()
{
	AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_01"); //O nie! Ja dalej nie wchodz�. To miejsce jest przekl�te!
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_02"); //Jak sobie chcesz. Pewnie b�d� si� tam dobrze bawi�.
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_03"); //No to �ycz� powodzenia. B�d� pilnowa� wej�cia.
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_05"); //W porz�dku.
    B_LogEntry          (CH4_BanditsInAbadonedMine,"Dotarli�my na miejsce. Wok� wej�cia do kopalni roi�o si� od Stra�nik�w i nieumar�ych. Pod ziemi� b�d� musia� zej�� sam. Doyle, ani pozostali Bandyci nie s� sk�onni mi pom�c.");
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"kopalnia");
	Npc_ExchangeRoutine (BAN_1607_Chris,"kopalnia");
	Npc_ExchangeRoutine (BAN_1605_Rocky,"mine");
};

//========================================
//-----------------> NoNareszcie
//========================================

INSTANCE DIA_Raeuber_NoNareszcie (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_NoNareszcie_Condition;
   information  = DIA_Raeuber_NoNareszcie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_NoNareszcie_Condition()
{
    if (Npc_HasItems (hero, ItMi_Black_Crystal_ABM) >=1)
	&& (Npc_KnowsInfo (hero, DIA_Raeuber_Spiepszam)) 
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_NoNareszcie_Info()
{
Ai_GotoNpc(BAN_1613_Doyle,hero);
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_01"); //No nareszcie jeste�. Ju� my�leli�my, �e te potwory rozerwa�y ci� na strz�py.
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_02"); //Spokojnie. Nie tak �atwo mnie zabi�.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_03"); //Co widzia�e� w kopalni?
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_04"); //Nic konkretnego. Grupa Stra�nik�w zosta�a zaskoczona przez o�ywie�c�w. W okolicy kr�ci�o si� te� kilka innych utrapie�, ale jako� sobie poradzi�em.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_05"); //Dobra nasza! Czyli mo�emy zaj�� kopalni�?
 
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_06"); //Tak.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_07"); //To �wietnie. Przeka� Quentinowi dobre informacje. Pewnie ma dla ciebie wynagrodzenie.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_08"); //My tutaj zostaniemy i b�dziemy pilnowa� wej�cia.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_09"); //Id� ju�.
    B_LogEntry                     (CH4_BanditsInAbadonedMine,"Kopalnia jest czysta. Doyle kaza� mi uda� si� z dobrymi wie�ciami do Quentina. Wraz z Rockym i Chrisem postanowi� pozosta� tymczasowo na stra�y.");
	HeroMaArtefakt = false;
    B_GiveXP (2000);
};
//========================================
//-----------------> PowrotzKopalni
//========================================

INSTANCE DIA_Raeuber_PowrotzKopalni (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_PowrotzKopalni_Condition;
   information  = DIA_Raeuber_PowrotzKopalni_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PowrotzKopalni_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_MineIsClean))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PowrotzKopalni_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PowrotzKopalni_03_01"); //Quentin wys�a� do kopalni nowych ludzi. Postanowili�my wi�c wr�ci�.
    AI_Output (other, self ,"DIA_Raeuber_PowrotzKopalni_15_02"); //Nie ma sprawy. Jeszcze raz dzi�ki za pomoc. 
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> PiratArmorDoyle
//========================================

INSTANCE DIA_Raeuber_PiratArmorDoyle (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 1;
   condition    = DIA_Raeuber_PiratArmorDoyle_Condition;
   information  = DIA_Raeuber_PiratArmorDoyle_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raeuber_PiratArmorDoyle_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_iFindDoyle)) && (Npc_HasItems (other, PiratArmor) >=1)  || (Npc_HasItems (other, Pirat2Armor) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raeuber_PiratArmorDoyle_Info()
{
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_01"); //Co tam masz przy sobie?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_02"); //Czy to str�j pirata?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_03"); //Zgada�e� si� z jakimi�?
    AI_Output (other, self ,"DIA_Raeuber_PiratArmorDoyle_15_04"); //Mo�na tak powiedzie�.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_05"); //Ca�kiem niez�y taki str�j.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_06"); //Podobno Quentin mia� kiedy� kontakt z piratami. 
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_07"); //Powiniene� z nim pogada�.
    AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H (C_INFO)
{
	npc				= BAN_1613_Doyle;
	condition		= ORG_867_Doyle_TEACH_2H_Condition;
	information		= ORG_867_Doyle_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy� broni� dwur�czn�?"; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  ORG_867_Doyle_TEACH_2H_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy� broni� dwur�czn�?
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_Info_09_02"); //Szkol� tylko i wy��cznie ludzi Quentina. Do tego nie za darmo. 

	if (log_Doylefight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Doyle mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko zostan� cz�onkiem Bandy Quentina.");
		log_Doylefight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H_START (C_INFO)
{
	npc				= BAN_1613_Doyle;
	condition		= ORG_867_Doyle_TEACH_2H_START_Condition;
	information		= ORG_867_Doyle_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_START_Condition()
{	
	if (Npc_KnowsInfo (hero, ORG_867_Doyle_TEACH_2H))
	&& ((Npc_GetTrueGuild    (hero) == GIL_BAU))
	{
	return TRUE;
	};
};

FUNC void  ORG_867_Doyle_TEACH_2H_START_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_START_Info_09_02"); //No dobra.

    Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,"Wr��",DIA_Doyle_START_TRAIN_BACK);
	
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);
	

};

func void DIA_Doyle_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,Dialog_Back,DIA_Doyle_START_TRAIN_BACK);
	
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);

};



func void DIA_Doyle_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,Dialog_Back,DIA_Doyle_START_TRAIN_BACK);

	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);


};



func void DIA_Doyle_START_TRAIN_BACK()
{
	Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
};

//---------------------------------------------------------------1.6.1---------------------------------------------------

//========================================
//-----------------> ZL
//========================================

INSTANCE DIA_Doyle_ZL (C_INFO)
{
   npc          = BAN_1613_Doyle;
   nr           = 10;
   condition    = DIA_Doyle_ZL_Condition;
   information  = DIA_Doyle_ZL_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o znikaj�cych ludziach?";
};

FUNC INT DIA_Doyle_ZL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_ZL))
{
    return TRUE;
};
};
FUNC VOID DIA_Doyle_ZL_Info()
{
    AI_Output (other, self ,"DIA_Doyle_ZL_15_01"); //Wiesz co� o znikaj�cych ludziach?
    AI_Output (self, other ,"DIA_Doyle_ZL_03_02"); //Hmm... zapewne Quentin jest coraz bardziej zaniepokojony t� sytuacj� z naszymi lud�mi...
    AI_Output (self, other ,"DIA_Doyle_ZL_03_03"); //C�, jak Na razie nie uda�o mi si� nic ustali�. Mo�e porozmawiaj z tamtym na �awce. Nazywa si� Victor.
    AI_Output (self, other ,"DIA_Doyle_ZL_03_04"); //Czasem opuszcza nasz ob�z by co� upolowa�, mo�e on widzia� co� niepokoj�cego...
    AI_Output (other, self ,"DIA_Doyle_ZL_15_05"); //Pogadam z nim.
	B_LogEntry               (ZnikajacyLudzie,"Doyle nie powiedzia� mi nic ciekawego, poleci� mi jednak bym porozmawia� z Victorem, ten co jaki� czas opuszcza ob�z i m�g� zauwa�y� co� niepokoj�cego.");
};

