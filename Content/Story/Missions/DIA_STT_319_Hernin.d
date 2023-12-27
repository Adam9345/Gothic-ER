// **************************************************
//						 EXIT 
// **************************************************

instance DIA_319_Hernin_Exit (C_INFO)
{
	npc				= STT_319_Schatten;
	nr				= 999;
	condition		= DIA_319_Hernin_Exit_Condition;
	information		= DIA_319_Hernin_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_319_Hernin_Exit_Condition()
{
	return 1;
};

func VOID DIA_319_Hernin_Exit_Info()
{
	AI_StopProcessInfos(self);
};

 //OCR_OUTSIDE_HUT_47_SMALT1 PARVEZ_ENEMY1
instance DIA_319_Schatten_Caught(C_INFO)
{
	npc				= STT_319_Schatten;
	nr				= 1;
	condition		= DIA_319_Schatten_Caught_Condition;
	information		= DIA_319_Schatten_Caught_Info;
	important 		= TRUE;
	permanent		= 0;
};                       

FUNC INT DIA_319_Schatten_Caught_Condition()
{
	if Npc_KnowsInfo (hero, DIA_BaalParvez_RumorAnnounced) && (MIS_ParvezInTroubles == LOG_RUNNING)  && (Npc_GetDistToWP (self, "PARVEZ_ENEMY1") < 500)  && (Wld_IsTime     (23,30,03,30))
	{
	return 1;
	};
};

func VOID DIA_319_Schatten_Caught_Info()
{
	AI_Output(self, other, "DIA_319_Schatten_Caught_04_00"); //Patrzcie, kolejny nawiedzony sekciarz. Jeœli nie chcesz, byœmy obili te twoj¹ oœwiecon¹ g³ówkê, to odsuñ siê!
	AI_Output(other, self, "DIA_319_Schatten_Caught_15_01"); //£apy precz od tego kufra!
	AI_Output(self, other, "DIA_319_Schatten_Caught_04_02"); //A wiêc chcesz oberwaæ?! Oœwiecony prosi to oœwiecony dostanie. Braæ go!
	CreateInvItems (self, ItMi_Bloodwyns_Order, 1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");
	
	Npc_SetTarget(VLK_576_Buddler, other);
	AI_StartState(VLK_576_Buddler, ZS_Attack, 1, "");
	
	Npc_SetTarget(VLK_510_Buddler, other);
	AI_StartState(VLK_510_Buddler, ZS_Attack, 1, "");
};

instance DIA_319_Schatten_WasDefeatByHero(C_INFO)
{
	npc			= STT_319_Schatten;
	nr			= 3;
	condition	= DIA_319_Schatten_WasDefeatByHero_Condition;
	information	= DIA_319_Schatten_WasDefeatByHero_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_319_Schatten_WasDefeatByHero_Condition()
{
	VAR C_NPC shadow;
	shadow = Hlp_GetNpc(STT_319_Schatten);
	
	if ((shadow.aivar[AIV_WASDEFEATEDBYSC] >= 1) && Npc_HasItems(other, ItMi_Bloodwyns_Order))
	{
		return 1;
	};
};

FUNC VOID DIA_319_Schatten_WasDefeatByHero_Info()
{
	AI_Output(other, self, "DIA_319_Schatten_WasDefeatByHero_15_00"); //A teraz precz st¹d!
	AI_Output(self, other, "DIA_319_Schatten_WasDefeatByHero_04_01"); //Aaa... My tylko wykonywaliœmy rozkazy.
	AI_Output(other, self, "DIA_319_Schatten_WasDefeatByHero_15_02"); //Dziêki twojej karteczce dowiem siê wszystkiego, czego chcia³em.
	
	AI_StopProcessInfos(self);
	
	B_LogEntry(CH1_ParvezInTroubles, "Pokona³em z³odziejaszków i znalaz³em kartkê z rozkazami od jakiegoœ Stra¿nika.");
	
	Npc_ExchangeRoutine (STT_319_Schatten,"start");
	Npc_ExchangeRoutine (VLK_576_Buddler,"start");
	Npc_ExchangeRoutine (VLK_510_Buddler,"start");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_319_Hernin_HELLO1 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 1;
   condition    = DIA_319_Hernin_HELLO1_Condition;
   information  = DIA_319_Hernin_HELLO1_Info;
   permanent	= FALSE;
   description	= "Coœ ty za jeden?";
};

FUNC INT DIA_319_Hernin_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_319_Hernin_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO1_15_01"); //Coœ ty za jeden?
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_02"); //Jestem Hernin. Zanim tu trafi³em, by³em ¿o³nierzem, a raczej dezerterem. Mi i moim kumplom niezbyt uœmiecha³o walczyæ w œniegu z zielonoskórymi, wiêc opuœciliœmy oddzia³. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_03"); //Jako zbiegowie z armii nie mogliœmy powróciæ do domów. Przez kilka miesiêcy w³óczyliœmy siê po lasach, korzystaj¹c z hojnoœci kupców, którzy posk¹pili na porz¹dn¹ eskortê. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_04"); //W koñcu jednak stra¿ nas namierzy³a. Pewnie i tak prêdzej, czy póŸniej trafi³bym do Kolonii, bo nasz wspania³y król na potrzeby wojny postanowi³ zape³niæ tutejsze kopalnie zes³anymi za b³ahostki skazañcami. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO1_03_05"); //Dziêki przygodom z kupcami, nabra³em nieco doœwiadczenia. Gdyby nie to, w Kolonii by³bym pewnie Kopaczem, czy innym ³achmyt¹. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_319_Hernin_HELLO2 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 2;
   condition    = DIA_319_Hernin_HELLO2_Condition;
   information  = DIA_319_Hernin_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chcê zostaæ Cieniem.";
};

FUNC INT DIA_319_Hernin_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO1))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO2_15_01"); //Chcê zostaæ Cieniem.
    AI_Output (self, other ,"DIA_319_Hernin_HELLO2_03_02"); //I pewnie bêdziesz chcia³ ¿ebym ciê popar³? Ka¿dy Cieñ powinien znaæ siê na pewnych rzeczach - to kwestia honoru Cienia. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_319_Hernin_HELLO3 (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 3;
   condition    = DIA_319_Hernin_HELLO3_Condition;
   information  = DIA_319_Hernin_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ? ";
};

FUNC INT DIA_319_Hernin_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HELLO3_15_01"); //Mo¿esz mnie czegoœ nauczyæ? 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_02"); //Dlaczego nie? Móg³bym ciê nauczyæ umiejêtnoœci z³odziejskich.
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_03"); //Wbrew pozorom okradanie innych nie jest wcale takie skomplikowane. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_04"); //Je¿eli chcesz kogoœ okraœæ, to uderzasz go w ³eb, a potem okradasz. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_05"); //Nad¹¿asz? 
    AI_Output (other, self ,"DIA_319_Hernin_HELLO3_15_06"); //Tak, ale no nie wiem. Myœla³em, ¿e nauczysz mnie bardziej finezyjnych sztuczek. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_07"); //Ciesz siê, bo to by³a ostatnia rzecz jak¹ dosta³eœ w Kolonii Górniczej za darmo. 
    AI_Output (self, other ,"DIA_319_Hernin_HELLO3_03_08"); //Tutaj wszystko ma swoj¹ cenê. 
};

//========================================
//-----------------> Diego
//========================================

INSTANCE DIA_319_Hernin_Diego (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 1;
   condition    = DIA_319_Hernin_Diego_Condition;
   information  = DIA_319_Hernin_Diego_Info;
   permanent	= FALSE;
   description	= "Czy mogê liczyæ na twoje poparcie u Diega?";
};

FUNC INT DIA_319_Hernin_Diego_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_319_Hernin_HELLO2))
    && (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_319_Hernin_Diego_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_Diego_15_01"); //Czy mogê liczyæ na twoje poparcie u Diega?
    AI_Output (self, other ,"DIA_319_Hernin_Diego_03_02"); //Czy naprawdê niczego siê nie nauczy³eœ?
    AI_Output (self, other ,"DIA_319_Hernin_Diego_03_03"); //Widaæ Ÿle ciê oceni³em...
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_319_Hernin_HowAreYou (C_INFO)
{
   npc          = STT_319_Schatten;
   nr           = 2;
   condition    = DIA_319_Hernin_HowAreYou_Condition;
   information  = DIA_319_Hernin_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_319_Hernin_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_319_Hernin_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_319_Hernin_HowAreYou_15_01"); //Co s³ychaæ?
	
    if (Npc_KnowsInfo (hero, DIA_319_Schatten_WasDefeatByHero))
	{
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_02"); //Mam nadziejê, ¿e zapomnia³eœ ju¿ o naszej ma³ej sprzeczce. 
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_03"); //Bloodwyn nieŸle siê wtedy wœciek³. Nie chcê k³opotów.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_BAU) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD)
    {
     AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_04"); //Myœlisz, ¿e nie wiem kim jesteœ? Wracaj do swoich kole¿ków. 
    }
    else if (Npc_GetTrueGuild(hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_05"); //Widzê, ¿e jednak czegoœ siê tu nauczy³eœ. To dobrze, potrzebujemy ludzi, którzy maj¹ g³owê na w³aœciwym miejscu. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_06"); //Witaj wœród nas, przyjacielu!
    }
    else if (Npc_GetTrueGuild(hero) == GIL_GRD)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_07"); //S³u¿ba wœród Cieni to dobra szko³a ¿ycia. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_08"); //Ale teraz zosta³eœ Stra¿nikiem, lecz mam nadziejê, ¿e nie zapomnisz kim by³eœ wczeœniej. 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_09"); //Powodzenia, kolego. 
    }
    else if (Npc_GetTrueGuild(hero) == GIL_KDF)
    {
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_10"); //Zosta³eœ Magiem Ognia? (œmiech) 
        AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_11"); //Wygl¹da na to, ¿e kap³ani Innosa nawet wœród skazañców potrafi¹ znaleŸæ œwiêtoszków.
    }
	else 
	{
	AI_Output (self, other ,"DIA_319_Hernin_HowAreYou_03_12"); //To zale¿y gdzie przy³o¿yæ ucho. Na razie panuje wzglêdny spokój.
	};
};


