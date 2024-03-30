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
// Rozdzia³ 1
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
    AI_Output (self, other ,"DIA_Raeuber_STAN_03_02"); //NieŸle. Cisza, spokój. Ostatnio nikt tu nie zagl¹da.
    }
	else
	{
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_03"); //Jak leci?
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_04"); //Stra¿nicy coraz czêœciej podchodz¹ pod Obóz. Zaczynam siê obawiaæ potyczki. 
        AI_Output (other, self ,"DIA_Raeuber_STAN_15_05"); //Jednak w Obozie nie czuæ tego strachu.
        AI_Output (self, other ,"DIA_Raeuber_STAN_03_06"); //Bandyci nie wiedz¹ na co siê porywaj¹. Ludzi Gomeza jest wiêcej. Maj¹ lepsze uzbrojenie. To siê mo¿e dla nas Ÿle skoñczyæ.    
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ -
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
         AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_01"); // Ej coœ ty za jeden!
         AI_DrawWeapon (self);
		if (!Npc_KnowsInfo (hero, DIA_Drax_CAMPGO))
		{
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_02"); //Chcia³em tylko zobaczyæ co tutaj le¿y.
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_03"); //Bêdzie le¿eæ twoje œmierdz¹ce truch³o!
        AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_04"); //A gdzie ja jestem?
        AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_05"); //Niewa¿ne. Tu dla ciebie jest ju¿ koniec œwiata...
		Npc_SetPermAttitude (BAN_1613_Doyle, ATT_HOSTILE);
		Wld_InsertNpc		(BAN_40147_Smith,"LOCATION_11_01");
		DoyleSmithHostile();
		}
		else
		{
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_06"); //Przyprowadzi³ mnie tu Drax. Zda³em wszystkie jego sprawdziany I powiedzia³, ¿e móg³bym do was do³¹czyæ.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_07"); //Hmm... Niech ci bêdzie, zapraszam do œrodka. Ale nie radzê robiæ ¿adnych numerów!
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_08"); //Gdybyœ nie powo³a³ siê na Draxa musia³bym ciê ukatrupiæ.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_09"); //Wzi¹³byœ mnie za rzekomego zwiadowcê Gomeza?
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_10"); //W tej wrednej Kolonii zawsze trzeba braæ pod uwagê te najgorsze scenariusze.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_11"); //Inaczej ³atwo skoñczysz nafaszerowany cudz¹ stal¹ ch³opczê.
          AI_Output (other, self ,"DIA_Raeuber_WYPAD_15_12"); //Pouczaj¹ce. A teraz pozwól, ¿e wejdê do obozu.
          AI_Output (self, other ,"DIA_Raeuber_WYPAD_03_13"); //Tylko nie wywróæ go do góry nogami bo siê pogniewam I bêdê musia³ ciê sprz¹tn¹æ haha
		  self.aivar[AIV_PASSGATE]=TRUE;
		//log
        //B_LogEntry                     (CH1_BANDITOS_CAMP,"Doyle wpuœci³ mnie do Obozu. Mogê teraz spokojnie iœæ do Quentina. Prosi³ mnie te¿, abym przyszed³ do niego, gdy pogadam z szefem bandy.");
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
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_01"); //Oszuka³eœ nas i przy³¹czy³eœ siê do tych drani!
    AI_Output (self, other ,"DIA_Raeuber_Przejebane_03_02"); //OdejdŸ, póki mam cierpliwoœæ.
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
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_02"); //Uspokój siê. Mam tu kilka spraw do za³atwienia.
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_03"); //Taaa co ty nie powiesz. Niby czemu mamy ci ufaæ?
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_04"); //Nie jestem cz³onkiem Starego Obozu. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_05"); //Twoje szczêœcie inaczej w³aœnie stawa³byœ siê trupem!
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_06"); //Mi³o wiedzieæ....
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_07"); //Niby nie do³¹czy³eœ do naszych wrogów. Ale nie mamy gwarancji, ¿e siê z nimi nie zw¹cha³eœ.
    AI_Output (other, self ,"DIA_Raeuber_HelloNoGRD_15_08"); //Jeœli zaprzestacie kontaków ze wszystkimi pozosta³ymi obozami d³ugo nie poci¹gniecie. 
    AI_Output (self, other ,"DIA_Raeuber_HelloNoGRD_03_09"); //Wygadany. Piœnij s³ówko, któremuœ Stra¿nikowi a osobiœcie wypruje ci flaki!
	Info_ClearChoices	(DIA_Raeuber_HelloNoGRD);
	Info_AddChoice		(DIA_Raeuber_HelloNoGRD, "Spokojnie nie mam zamiaru.", DIA_Doyle_ItsOk);
	Info_AddChoice		(DIA_Raeuber_HelloNoGRD, "Thorus chêtnie sie dowie gdzie macie obóz...", DIA_Doyle_Hostile);
	
   // AI_StopProcessInfos	(self);
};
Func Void DIA_Doyle_ItsOk()
{
    AI_Output (other,self ,"DIA_Doyle_ItsOk_15_01"); //Spokojnie nie mam zamiaru.
    AI_Output (self,other ,"DIA_Doyle_ItsOk_03_02"); //Pamiêtaj ¿e mamy cie na oko.
    Info_ClearChoices		(DIA_Raeuber_HelloNoGRD);
};


Func Void DIA_Doyle_Hostile()
{

     
    AI_Output (other,self,"DIA_Doyle_Hostile_15_01"); //Thorus chêtnie sie dowie gdzie macie obóz...
    AI_Output (self,other,"DIA_Doyle_Hostile_03_02"); //Nie by³ bym tego taki pewny.
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
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_01"); //No proszê kolega ze Starego Obozu?
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_02"); //Nooo...
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_03"); //Jak mi³o!
    AI_DrawWeapon (self);
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_04"); //Chcia³em siê tylko trochê rozejrzeæ.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_05"); //A ja rozerwaæ bo bol¹ mnie giry od ci¹g³ego stania w miejscu. No i proszê!
    AI_Output (other, self ,"DIA_Doyle_HeroIs_GRD_15_06"); //To jest ten moment w, którym powinienem zawróciæ.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_07"); // Ty sukinsynu! Wypaplasz wszystko Magnatom a my bêdziemy mieæ k³opoty.
    AI_Output (self, other ,"DIA_Doyle_HeroIs_GRD_03_08"); //Ju¿ nie napijesz siê piwka z kumplami w Starym Obozie. Giñ!
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
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_01"); //Guru w Obozie Bandytów? Tego jeszcze nie by³o. 
    AI_Output (self, other ,"DIA_Raeuber_OhGURU_03_02"); //Proszê, wchodŸ. Zapewne masz jakieœ sprawy do za³atwienia z naszym przywódc¹. 
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
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_01"); //Witaj, Magu! Co ciê tu sprowadza? 
    AI_Output (other, self ,"DIA_Raeuber_OhKDW_15_02"); //Mam tu kilka spraw do za³atwienia. 
    AI_Output (self, other ,"DIA_Raeuber_OhKDW_03_03"); //Nie licz na dodatkowy szacunek z racji pe³nionej funkcji. Wiêkszoœæ z nas ma bogów tam, gdzie œwiat³o nie dochodzi.
    AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 1
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
   description	= "Jak¹ masz dla mnie pracê?";
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
    AI_Output (other, self ,"DIA_Raeuber_WORK_15_01"); //Wspomina³eœ coœ o jakiejœ robocie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_02"); //A, tak! Potrzebujê ¿ó³todzioba, który naprawi palisadê. Oczywiœcie dostaniesz trochê rudy.
    AI_Output (self, other ,"DIA_Raeuber_WORK_03_03"); //Wchodzisz w to?

    Info_ClearChoices		(DIA_Raeuber_WORK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Jasne.", DIA_Raeuber_WORK_TAK);
    Info_AddChoice		(DIA_Raeuber_WORK, "Raczej nie.", DIA_Raeuber_WORK_NIE);
};

FUNC VOID DIA_Raeuber_WORK_TAK()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_01"); //Jasne.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_02"); //To œwietnie. Bêdê ci bardzo wdziêczny. 
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_03"); //Tylko uwa¿aj na zwierzaki z lasu.
    AI_Output (other, self ,"DIA_Raeuber_WORK_TAK_15_04"); //Dobra.
    AI_Output (self, other ,"DIA_Raeuber_WORK_TAK_03_05"); //WeŸ ten m³otek.
    robotaPALISADA = true;
    CreateInvItems (self, ItMiHammer, 1);
    B_GiveInvItems (self, other, ItMiHammer, 1);
    Palisada = LOG_RUNNING;
    Log_CreateTopic            		(CH1_Palisada, LOG_MISSION);
    Log_SetTopicStatus       		(CH1_Palisada, LOG_RUNNING);
    B_LogEntry                    	(CH1_Palisada,"Doyle kaza³ mi naprawiæ palisadê przy wejœciu do Obozu Bandytów.");

	Npc_ExchangeRoutine (self,"FAJRANT");
    Info_ClearChoices		(DIA_Raeuber_WORK);
	AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Raeuber_WORK_NIE()
{
    AI_Output (other, self ,"DIA_Raeuber_WORK_NIE_15_01"); //Raczej nie.
    AI_Output (self, other ,"DIA_Raeuber_WORK_NIE_03_02"); //Na twoim miejscu bardziej stara³bym siê o opiniê w Obozie.
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
   description	= "Skoñczy³em robotê.";
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
    AI_Output (other, self ,"DIA_Raeuber_END_WORK_15_01"); //Skoñczy³em robotê.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_02"); //To œwietnie. Dobrze siê spisa³eœ.
    AI_Output (self, other ,"DIA_Raeuber_END_WORK_03_03"); //Masz tu wynagrodzenie.
    B_LogEntry                     (CH1_Palisada,"Naprawi³em palisadê. Doyle wydawa³ siê byæ zadowolony.");
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
   description	= "Wiesz coœ o budowli znajduj¹cej siê niedaleko za twoimi plecami?";
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

    AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_01"); //Wiesz coœ o budowli znajduj¹cej siê niedaleko za twoimi plecami?
    AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_02"); //Mówisz o naszej chacie? 
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_03"); //Pewnie, ¿e nie! Ju¿ wiem o co ci chodzi.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_04"); //Jedyne co wiem o tej rzeczy to to, ¿e jest bardzo stara. Gdy siê tu osiedlaliœmy znalaz³em tê runê.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_05"); //To mo¿e byæ teleport.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_06"); //Nawet jeœli, to w¹tpiê ¿eby jeszcze dzia³a³. Wszystko jest nieŸle rozwalone.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_07"); //Mo¿esz mi daæ ten teleport?
	if (Palisada == LOG_SUCCESS)
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_08"); //W sumie... Bierz go. Na nic mi siê nie przyda, a ty pomog³eœ mi wtedy przy palisadzie.
	CreateInvItems (self, ItArRuneTeleport_BC, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_BC,1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_09"); //Nie pomog³eœ mi, gdy ciê prosi³em, wiêc nie jestem ci nic winien. Chcê za niego 100 bry³ek rudy.
	AI_Output (other, self ,"DIA_Raeuber_TELEPORT_15_10"); //Przecie¿ nawet nie wiesz czy dzia³a.
	AI_Output (self, other ,"DIA_Raeuber_TELEPORT_03_11"); //Nie chcesz, nie kupuj. Moja cena to 100 bry³ek rudy.
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
   description	= "Dawaj ju¿ ten teleport. (100 bry³ek rudy)";
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

    AI_Output (other, self ,"DIA_Raeuber_BUYTELEPORT_15_01"); //Dawaj ju¿ ten teleport.
	if (Npc_HasItems(other,itminugget)>=100)
	{
    AI_Output (self, other ,"DIA_Raeuber_BUYTELEPORT_03_02"); //Jest twój!
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
   description	= "Szykuje siê robota.";
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
    AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_01"); //Szykuje siê robota. Mamy napaœæ na plac wymian.
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_02"); //A, tak. S³ysza³em. Quentin mówi³ ci o dokumentach? 
	AI_Output (other, self ,"DIA_Raeuber_NAPASC_15_03"); //Coœ tam wspomina³...
    AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_04"); //Trzeba zwracaæ na nie uwagê i przeszukiwaæ skrzynie. Pomagaj¹ nam organizowaæ kolejne napady. Ostatnim razem znalaz³em tylko dwa, ale teraz powinno byæ wiêcej.
	AI_Output (self, other ,"DIA_Raeuber_NAPASC_03_05"); //Wyruszymy Wieczorem. 
	B_LogEntry               (CH1_Rozpierdol1,"Mam przyjœæ do Doyle'a wieczorem, wtedy wyruszymy na plac wymian.");
	
};
func void AttackExchangeSquare()
{


	Npc_ExchangeRoutine (GRD_2001_Stra¿nik,"bijacz");
	Npc_ExchangeRoutine (GRD_2002_Stra¿nik,"bijacz");
	Npc_ExchangeRoutine (GRD_254_Orry,"OMFull");
	Npc_ExchangeRoutine (GRD_281_Gardist,"start2");
	
	
	
	
	
	B_ChangeGuild    (GRD_2002_Stra¿nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2001_Stra¿nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2003_Stra¿nik,GIL_DMB);  
	B_ChangeGuild    (GRD_2005_Stra¿nik,GIL_DMB);  
	B_ChangeGuild    (VLK_2004_Robotnik,GIL_DMB);  
	B_ChangeGuild    (GRD_254_Orry,GIL_DMB);  
	B_ChangeGuild    (GRD_281_Gardist,GIL_DMB);  
	B_ChangeGuild    (GRD_5099_Kwatermistrz,GIL_DMB);  
	
	
	
	CreateInvItem    (GRD_5099_Kwatermistrz,itmi_plac_doc4);
	CreateInvItem    (GRD_2002_Stra¿nik,itmi_grd2002_key);
	CreateInvItem    (GRD_2001_Stra¿nik,itmi_plac_doc1);
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
   description	= "Ju¿ pora. ChodŸmy.";
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
    AI_Output (other, self ,"DIA_Doyle_Attack_ExchangeSquare_15_01"); //Ju¿ pora. ChodŸmy.
    AI_Output (self, other ,"DIA_Doyle_Attack_ExchangeSquare_03_02"); //Dobra, pod¹¿aj za mn¹.
	Info_ClearChoices	(DIA_Doyle_Attack_ExchangeSquare);
	Info_AddChoice		(DIA_Doyle_Attack_ExchangeSquare, "(Szybka podró¿)", DIA_Doyle_AES_GO);
	
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
    AI_Output (self, other ,"DIA_Raeuber_UWAGA_03_01"); //Uwa¿aj na kuszników. I przygotuj broñ.
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
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_01"); //Dobrze, czêœæ tych sukinsynów gryzie piach. Przeszukaj ich cia³a. Pamiêtaj, ¿eby zwracaæ uwagê na dokumenty! Potem ruszymy dalej. 
    AI_Output (self, other ,"DIA_Raeuber_PIERWSZY_POSTERUNEK_03_02"); //Chwila! Zamknêli bramê! Musisz jakoœ wspi¹æ siê po skale i j¹ otworzyæ. 
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
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_01"); //Po zabawie. Wracamy, zanim ktoœ siê tu zjawi.
    AI_Output (self, other ,"DIA_Raeuber_SPADAMY_03_02"); //Zabieraj co mo¿esz i chodŸ.
	AI_GotoNpc(self,hero);
    B_LogEntry(CH1_Rozpierdol1,"Mam zabraæ wszystkie ³upy i dokumenty po czym wróciæ do Obozu i donieœæ o wszystkim Quentinowi.");

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
   description	= "Chcia³bym zapytaæ o œmieræ Rayana.";
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
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_01"); //Chcia³bym zapytaæ o œmieræ Rayana.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_02"); //Nic o tym nie wiem. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_03"); //A mo¿e jednak coœ widzia³eœ? Kereth oskar¿a o to zabójstwo Jensa. Widzia³eœ go mo¿e tego dnia?
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_04"); //Hmm... O ile dobrze pamiêtam to nie. Jens nie wychodzi³ wtedy z Obozu. Nawet w wychodku nie by³! 
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_05"); //Za Rayanem wychodzili tylko Ratford i Drax, ale oni s¹ czyœci. Rêczê za nich. Mo¿liwe, ¿e by³a z nimi jeszcze trzecia osoba.
    AI_Output (self, other ,"DIA_Raeuber_RayansDie_03_06"); //Nie zwróci³em wtedy na to uwagi. No, ale co do Jensa to jest czysty. 
    AI_Output (other, self ,"DIA_Raeuber_RayansDie_15_07"); //Dziêki.
    B_LogEntry                     (CH1_DestroyedGrave,"Doyle poœwiadczy³, ¿e w dniu zabójstwa Rayana Jens na pewno nie opuszcza³ Obozu. ");
    AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 3
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
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_01"); //Hej. Idziesz ze mn¹ na polowanie?
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_15_02"); //Na co chcesz zapolowaæ?
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_03_03"); //Na zêbacze. Ostatnio trochê ich tu za du¿o.

    Info_ClearChoices		(DIA_Raeuber_PolowanieNaZebacze);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Idziemy!", DIA_Raeuber_PolowanieNaZebacze_Go);
    Info_AddChoice		(DIA_Raeuber_PolowanieNaZebacze, "Nie mam czasu.", DIA_Raeuber_PolowanieNaZebacze_NotTime);
};

FUNC VOID DIA_Raeuber_PolowanieNaZebacze_Go()
{
    AI_Output (other, self ,"DIA_Raeuber_PolowanieNaZebacze_Go_15_01"); //Idziemy!
    AI_Output (self, other ,"DIA_Raeuber_PolowanieNaZebacze_Go_03_02"); //Dobra. Zg³oœ siê jak bêdziesz gotów.
    MIS_HuntingWithDoyle = LOG_RUNNING;

    Log_CreateTopic            (CH3_HuntingWithDoyle, LOG_MISSION);
    Log_SetTopicStatus       (CH3_HuntingWithDoyle, LOG_RUNNING);
    B_LogEntry                     (CH3_HuntingWithDoyle,"Doyle zaproponowa³ mi wspólne polowanie na zêbacze.");
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
   description	= "Dobra. ChodŸmy.";
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
    AI_Output (other, self ,"DIA_Raeuber_Letsgo256_15_01"); //Dobra. ChodŸmy.
    AI_Output (self, other ,"DIA_Raeuber_Letsgo256_03_02"); //IdŸ za mn¹. Pójdziemy do jaskini przy lesie.
	
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
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_01"); //Wreszcie pozbyliœmy siê tych cholernych zêbaczy,
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_02"); //W jaskini poza trupami wêdrowców chyba nic nie ma.
    AI_Output (self, other ,"DIA_Raeuber_Bezpiecznie_03_03"); //Ja wracam do Obozu. B¹dŸ ostro¿ny.
    B_LogEntry                     (CH3_HuntingWithDoyle,"Wybiliœmy zêbacze z jaskini. Mogê wracaæ do Obozu.");
    Log_SetTopicStatus       (CH3_HuntingWithDoyle, LOG_SUCCESS);
    MIS_HuntingWithDoyle = LOG_SUCCESS;

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self,"start");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 4
// W¹tek g³ówny 
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
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_02"); //Nawet nie wiesz jak siê cieszê, ¿e ciê widzê!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_03"); //Postanowi³em wybraæ siê do Nowego Obozu i pomóc Najemnikom.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_04"); //Sk¹d taki pomys³?
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_05"); //Przyby³ do mnie pewien Szkodnik i powiedzia³, ¿e Torlof mnie potrzebuje.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_06"); //Stwierdzi³em, ¿e Rocky poradzi sobie z ogarniêciem Obozu i wyruszy³em.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_07"); //Niewa¿ne... Podczas twojej nieobecnoœci wiele siê dzia³o.
    AI_Output (other, self ,"DIA_Raeuber_Corobisz_15_08"); //Wróciliœmy po ataku do Obozu i okaza³o siê, ¿e zosta³ zajêty przez Stra¿ników.
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_09"); //Co?!
    AI_Output (self, other ,"DIA_Raeuber_Corobisz_03_10"); //Naprawdê du¿o mnie ominê³o.
	
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
   description	= "W ka¿dym razie Quentin ciê szuka.";
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
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_01"); //W ka¿dym razie Quentin ciê szuka.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_02"); //Uda³o nam siê odbiæ Obóz bez wiêkszych strat. Jesteœ nam potrzebny.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_03"); //Dobrze, dobrze, ale mam tu jeszcze jedn¹ sprawê do za³atwienia. Zobowi¹za³em siê pomóc.
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_04"); //Nowy Obóz prowadzi za¿arty i otwarty konflikt z Gomezem. Ta grupka Najemników chce pozbyæ siê Stra¿ników z doliny obok. 
    AI_Output (self, other ,"DIA_Raeuber_FindFriend2_03_05"); //Przy³¹cz siê do nich i pomó¿ nam. Potem wrócimy do Obozu.
    AI_Output (other, self ,"DIA_Raeuber_FindFriend2_15_06"); //Nie ma problemu.
	
	//log jest u Torlofa
    //MIS_helpSld1 = LOG_RUNNING;

    //Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    //Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    //B_LogEntry               (CH1_helpSld1,"Doyle prosi³ mnie bym pomóg³ Najemnikom odbiæ dolinê pomiêdzy Starym, a Nowym Obozem. Dowódcz¹ wyprawy jest Torlof.");

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
   description	= "Mo¿emy ju¿ wracaæ?";
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
    AI_Output (other, self ,"DIA_Raeuber_backtoCamp_15_01"); //Mo¿emy ju¿ wracaæ?
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_02"); //Pewnie. Jak chcesz, to mo¿esz iœæ sam.
    AI_Output (self, other ,"DIA_Raeuber_backtoCamp_03_03"); //Jakoœ sobie poradzê.
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
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_01"); //Ty! Tak, to o tobie wszyscy gadaj¹!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_03"); //Nazywam siê Doyle, jestem Bandyt¹ z Obozu Quentina. 
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_04"); //Pos³uchaj, potrzebujê twojej pomocy!
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_05"); //O co chodzi?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_06"); //Kilku naszych ludzi uda³o siê w okolice Starego Obozu. Chcieli pozbyæ siê krêc¹cych siê tam patroli Stra¿ników.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_07"); //I?
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_08"); //To przez Draxa. Bardzo siê przej¹³ œmierci¹ Ratforda i opracowa³ ca³y ten plan.
    AI_Output (other, self ,"DIA_Raeuber_ZNANY_NAJEMNIK_15_09"); //Wiem o tym.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_10"); //Ja, razem z Rockym mia³em pilnowaæ obozu, jednak przyszed³em tutaj. Torlof mnie potrzebowa³.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_11"); //Chcia³bym dowiedzieæ siê, co siê tam dzieje i czy moi towarzysze ju¿ wrócili.
    AI_Output (self, other ,"DIA_Raeuber_ZNANY_NAJEMNIK_03_12"); //By³bym ci bardzo wdziêczny, gdybyœ sprawdzi³ co i jak, a w razie czego powiedzia³, ¿e wkrótce wrócê. Tymczasem zaczekam na ciebie u myœliwych.
    MIS_BanditsInTroubles = LOG_RUNNING;
    Npc_ExchangeRoutine (BAN_1614_Drax, "ded");
	CreateInvItems (BAN_1614_Drax, ItMi_Listdraxa,1);
	B_KillNpc (BAN_1614_Drax);
	
    Log_CreateTopic          (CH4_BanditsInTroubles, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_RUNNING);
    B_LogEntry               (CH4_BanditsInTroubles,"Bandyta Doyle poprosi³ mnie, abym sprawdzi³, co dzieje siê w jego Obozie, poniewa¿ on zobowi¹za³ sie pomóc ludziom Torlofa.");
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
   description	= "Mam dobre wieœci.";
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
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_01"); //Mam dobre wieœci. Wszyscy wrócili, jednak Stra¿nicy odnaleŸli i zajêli wasz Obóz.
    AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_02"); //Na szczêœcie Quentinowi uda³o siê odzyskaæ Obóz. By³ jednak na ciebie nie lada wœciek³y.
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_03"); //Cholera... Niewa¿ne. Najwa¿niejsze, ¿e nic z³ego siê nie sta³o.
    if (MIS_helpSld1 == LOG_SUCCESS)
    {
    AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_04"); //Mogê ju¿ wracaæ do Obozu. Dziêkujê za wszystko, przyjacielu. Jakbyœ potrzebowa³ kiedyœ pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry                     (CH4_BanditsInTroubles,"Wróci³em z poleceniem Quentina do Doyle'a. Natychmiast ruszy³ w drogê.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS;
    }
    else
    {
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_05"); //Móg³bym ju¿ wróciæ do Obozu, ale obieca³em Torlofowi, ¿e mu pomogê. 
        AI_Output (self, other ,"DIA_Raeuber_BANDYCI_ZYJA_03_06"); //Do³¹czysz do nas? Potrzebna nam pomoc.
        AI_Output (other, self ,"DIA_Raeuber_BANDYCI_ZYJA_15_07"); //Jasne.
		B_LogEntry                     (CH4_BanditsInTroubles,"Wróci³em z poleceniem Quentina do Doyle'a. Zanim jednak wróci do Obozu bêdê musia³ pomóc jemu i Torlofowi pozbyæ siê Stra¿ników z doliny.");
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
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_01"); //Œwietnie. Mogê wracaæ do Obozu.
    AI_Output (self, other ,"DIA_Raeuber_MOGE_WRACAC_03_02"); //Dziêkujê za wszystko, przyjacielu. Jakbyœ potrzebowa³ kiedyœ pomocy, to daj znak.
	Npc_ExchangeRoutine (self,"afterstart");
    B_givexp (750);  
	B_LogEntry               (CH4_BanditsInTroubles,"Po rozwi¹zaniu sprawy ze Stra¿nikami Doyle wróci³ do Obozu.");
    Log_SetTopicStatus       (CH4_BanditsInTroubles, LOG_SUCCESS);
    MIS_BanditsInTroubles = LOG_SUCCESS; 
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Doyle
// Rozdzia³ 4
// W¹tek g³ówny  -kopalnia
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
   description	= "Idziesz ze mn¹ do Opuszczonej Kopalni?";
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
    AI_Output (other, self ,"DIA_Raeuber_GoL_15_01"); //Idziesz ze mn¹ do Opuszczonej Kopalni?
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_02"); //No pewnie, przyjacielu. 
    AI_Output (self, other ,"DIA_Raeuber_GoL_03_03"); //ChodŸmy wiêc. Musimy uwa¿aæ na Stra¿ników. 
	AI_Output (self, other ,"DIA_Raeuber_GoL_03_04"); //Poczekaj. WeŸmy ze sob¹ jeszcze kogoœ. IdŸ po Chrisa i Rockiego. Chyba nie maj¹ nic do roboty. 
	//  self.aivar[AIV_PARTYMEMBER] = TRUE;
	// Npc_ExchangeRoutine (self,"pomoc");
	RockyRobiZaDoyle  = false;
    B_LogEntry                     (CH4_BanditsInAbadonedMine,"Doyle doradzi³ mi, ¿ebym poszed³ jeszcze po Chrisa i Rockiego. Mog¹ nam siê przydaæ. ");
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
   description	= "Jesteœmy gotowi!";
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
    AI_Output (other, self ,"DIA_Raeuber_Ready_15_01"); //Jesteœmy gotowi! 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_02"); //Œwietnie. Trzech ludzi powinno wystarczyæ. 
    AI_Output (self, other ,"DIA_Raeuber_Ready_03_03"); //Mo¿esz prowadziæ. Pójdziemy za tob¹. Tylko b¹dŸ ostro¿ny!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
 
    //AI_StopProcessInfos	(self);
	
	
	
	Info_AddChoice		(DIA_Raeuber_Ready, "(Szybka podró¿)", Dia_Doyle_ABMine_FastTravel);
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
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_01"); //O nie! Ja dalej nie wchodzê. To miejsce jest przeklête!
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_02"); //Jak sobie chcesz. Pewnie bêdê siê tam dobrze bawi³.
    AI_Output (self, other ,"DIA_Raeuber_Spiepszam_03_03"); //No to ¿yczê powodzenia. Bêdê pilnowa³ wejœcia.
    AI_Output (other, self ,"DIA_Raeuber_Spiepszam_15_05"); //W porz¹dku.
    B_LogEntry          (CH4_BanditsInAbadonedMine,"Dotarliœmy na miejsce. Wokó³ wejœcia do kopalni roi³o siê od Stra¿ników i nieumar³ych. Pod ziemiê bêdê musia³ zejœæ sam. Doyle, ani pozostali Bandyci nie s¹ sk³onni mi pomóc.");
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
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_01"); //No nareszcie jesteœ. Ju¿ myœleliœmy, ¿e te potwory rozerwa³y ciê na strzêpy.
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_02"); //Spokojnie. Nie tak ³atwo mnie zabiæ.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_03"); //Co widzia³eœ w kopalni?
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_04"); //Nic konkretnego. Grupa Stra¿ników zosta³a zaskoczona przez o¿ywieñców. W okolicy krêci³o siê te¿ kilka innych utrapieñ, ale jakoœ sobie poradzi³em.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_05"); //Dobra nasza! Czyli mo¿emy zaj¹æ kopalniê?
 
    AI_Output (other, self ,"DIA_Raeuber_NoNareszcie_15_06"); //Tak.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_07"); //To œwietnie. Przeka¿ Quentinowi dobre informacje. Pewnie ma dla ciebie wynagrodzenie.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_08"); //My tutaj zostaniemy i bêdziemy pilnowaæ wejœcia.
    AI_Output (self, other ,"DIA_Raeuber_NoNareszcie_03_09"); //IdŸ ju¿.
    B_LogEntry                     (CH4_BanditsInAbadonedMine,"Kopalnia jest czysta. Doyle kaza³ mi udaæ siê z dobrymi wieœciami do Quentina. Wraz z Rockym i Chrisem postanowi³ pozostaæ tymczasowo na stra¿y.");
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
    AI_Output (self, other ,"DIA_Raeuber_PowrotzKopalni_03_01"); //Quentin wys³a³ do kopalni nowych ludzi. Postanowiliœmy wiêc wróciæ.
    AI_Output (other, self ,"DIA_Raeuber_PowrotzKopalni_15_02"); //Nie ma sprawy. Jeszcze raz dziêki za pomoc. 
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
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_02"); //Czy to strój pirata?
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_03"); //Zgada³eœ siê z jakimiœ?
    AI_Output (other, self ,"DIA_Raeuber_PiratArmorDoyle_15_04"); //Mo¿na tak powiedzieæ.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_05"); //Ca³kiem niez³y taki strój.
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_06"); //Podobno Quentin mia³ kiedyœ kontakt z piratami. 
    AI_Output (self, other ,"DIA_Raeuber_PiratArmorDoyle_03_07"); //Powinieneœ z nim pogadaæ.
    AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  ORG_867_Doyle_TEACH_2H (C_INFO)
{
	npc				= BAN_1613_Doyle;
	condition		= ORG_867_Doyle_TEACH_2H_Condition;
	information		= ORG_867_Doyle_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ broni¹ dwurêczn¹?"; 
};
//
FUNC int  ORG_867_Doyle_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  ORG_867_Doyle_TEACH_2H_Info()
{
	AI_Output (other, self,"ORG_867_Doyle_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ broni¹ dwurêczn¹?
	AI_Output (self, other,"ORG_867_Doyle_TEACH_2H_Info_09_02"); //Szkolê tylko i wy³¹cznie ludzi Quentina. Do tego nie za darmo. 

	if (log_Doylefight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Doyle mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko zostanê cz³onkiem Bandy Quentina.");
		log_Doylefight = TRUE;
	};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
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
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,"Wróæ",DIA_Doyle_START_TRAIN_BACK);
	
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);
	

};

func void DIA_Doyle_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,Dialog_Back,DIA_Doyle_START_TRAIN_BACK);
	
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);

};



func void DIA_Doyle_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(ORG_867_Doyle_TEACH_2H_START);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,Dialog_Back,DIA_Doyle_START_TRAIN_BACK);

	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Doyle_START_TRAIN_2H_1);
	Info_AddChoice(ORG_867_Doyle_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Doyle_START_TRAIN_2H_5);


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
   description	= "Wiesz coœ o znikaj¹cych ludziach?";
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
    AI_Output (other, self ,"DIA_Doyle_ZL_15_01"); //Wiesz coœ o znikaj¹cych ludziach?
    AI_Output (self, other ,"DIA_Doyle_ZL_03_02"); //Hmm... zapewne Quentin jest coraz bardziej zaniepokojony t¹ sytuacj¹ z naszymi ludŸmi...
    AI_Output (self, other ,"DIA_Doyle_ZL_03_03"); //Có¿, jak Na razie nie uda³o mi siê nic ustaliæ. Mo¿e porozmawiaj z tamtym na ³awce. Nazywa siê Victor.
    AI_Output (self, other ,"DIA_Doyle_ZL_03_04"); //Czasem opuszcza nasz obóz by coœ upolowaæ, mo¿e on widzia³ coœ niepokoj¹cego...
    AI_Output (other, self ,"DIA_Doyle_ZL_15_05"); //Pogadam z nim.
	B_LogEntry               (ZnikajacyLudzie,"Doyle nie powiedzia³ mi nic ciekawego, poleci³ mi jednak bym porozmawia³ z Victorem, ten co jakiœ czas opuszcza obóz i móg³ zauwa¿yæ coœ niepokoj¹cego.");
};

