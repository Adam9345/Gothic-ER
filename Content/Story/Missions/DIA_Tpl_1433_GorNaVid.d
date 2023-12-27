//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  Tpl_1433_GorNaVid_Exit (C_INFO)
{
	npc			= Tpl_1433_GorNaVid;
	nr			= 999;
	condition	= Tpl_1433_GorNaVid_Exit_Condition;
	information	= Tpl_1433_GorNaVid_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Niech nadejdzie przebudzenie Œni¹cego.
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_HEALTH (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebujê twojej pomocy."; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Potrzebujê twojej pomocy.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Szukam wydzieliny pe³zaczy dla Kaloma, i chyba wiem ju¿, gdzie znajduje siê gniazdo tych drapie¿ców.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Pomo¿esz mi po otwarciu przejœcia?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Walka z pe³zaczami to niebezpieczne zadanie. Przynieœ mi napój uzdrawiaj¹cy, wtedy ci pomogê.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam gniazda pe³zaczy."; 
};

FUNC int  Tpl_1433_GorNaVid_IAN_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING
	&&	!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

FUNC void  Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Szukam gniazda pe³zaczy.
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //W pobli¿u g³ównego szybu znajduje siê wiele jaskiñ, ale nie uda³o siê nam jeszcze odnaleŸæ gniazda.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj napój uzdrawiaj¹cy)"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1433_GorNaVid_HEALTH )) &&
		(Npc_HasItems (hero, Itfo_Potion_Health_01)  || 
		 Npc_HasItems (hero, Itfo_Potion_Health_02)  ||
		 Npc_HasItems (hero, Itfo_Potion_Health_03))	
	{
		return 1;
	};

};
FUNC void  Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Proszê, mo¿e to ci pomo¿e.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Dziêki. Mo¿esz na mnie liczyæ. Spotkamy siê na dole, u Asghana.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Bêdê czeka³.
	
	if Npc_HasItems (hero,Itfo_Potion_Health_01)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_01, 1);
	}
	else if Npc_HasItems (hero,Itfo_Potion_Health_02)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_02, 1);
	}	 
	else if Npc_HasItems (hero,Itfo_Potion_Health_03)
	{
	 	B_GiveInvItems (hero, self,Itfo_Potion_Health_03, 1);
	}
	else 
	{
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNMÖGLICH");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,	"Musia³em daæ Gor Na Vidowi napój uzdrawiaj¹cy, zanim zgodzi³ siê do³¹czyæ do oddzia³u przy bramie Asghana.");	

	AI_StopProcessInfos	(self);
};

//---------EIER GEFUNDEN------------------------------------------------------
instance  Tpl_1433_GorNavid_VICTORY (C_INFO)
{
	npc				= Tpl_1433_GorNavid;
	condition		= Tpl_1433_GorNavid_VICTORY_Condition;
	information		= Tpl_1433_GorNavid_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz³em gniazdo królowej!"; 
};

FUNC int  Tpl_1433_GorNavid_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Znalaz³em gniazdo królowej!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Dziêkujê ci w imieniu ca³ego Bractwa!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Oby Œni¹cy nigdy nie odwróci³ od ciebie swego przychylnego spojrzenia.
};     
 
//========================================
//-----------------> SZPIEG
//========================================
//edit by  

INSTANCE DIA_GorNaVid_SZPIEG (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 1;
   condition    = DIA_GorNaVid_SZPIEG_Condition;
   information  = DIA_GorNaVid_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Co wiesz o waszej wspó³pracy ze Stra¿nikami?";
};

FUNC INT DIA_GorNaVid_SZPIEG_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaVid_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_SZPIEG_15_01"); //Co wiesz o waszej wspó³pracy ze Stra¿nikami?
    AI_Output (self, other ,"DIA_GorNaVid_SZPIEG_03_02"); //Niezbyt wiele. Porozmawiaj z Gor Na Barem. On wie wiêcej. Przyszed³ do kopalni niedawno.
    B_LogEntry                     (CH1_PSIcampWORK,"Gor Na Bar mo¿e udzieliæ mi przydatnych informacji.");

    B_GiveXP (50);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaVid_HELLO1 (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 1;
   condition    = DIA_GorNaVid_HELLO1_Condition;
   information  = DIA_GorNaVid_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_GorNaVid_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaVid_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_HELLO1_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_02"); //Witaj, co ciê tu sprowadza? 
    AI_Output (other, self ,"DIA_GorNaVid_HELLO1_15_03"); //Mam kilka spraw do za³atwienia w Kopalni. A ty, czym siê zajmujesz?
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_04"); //Wszyscy Stra¿nicy Œwi¹tynni przebywaj¹cy w Kopalni poluj¹ na pe³zacze.
    AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_05"); //To niebezpieczne zadanie. Pe³zacze s¹ bardzo groŸne. Stra¿nicy Gomeza nie poradzili by sobie bez naszej pomocy.
	AI_Output (self, other ,"DIA_GorNaVid_HELLO1_03_06"); //Wydzielina pe³zaczy jest potrzebna Cor Kalomowi do badañ. 
};

//========================================
//-----------------> Mine
//========================================

INSTANCE DIA_GorNaVid_Mine (C_INFO)
{
   npc          = Tpl_1433_GorNaVid;
   nr           = 2;
   condition    = DIA_GorNaVid_Mine_Condition;
   information  = DIA_GorNaVid_Mine_Info;
   permanent	= FALSE;
   description	= "Co wiesz o dnie Kopalni?";
};

FUNC INT DIA_GorNaVid_Mine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaVid_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaVid_Mine_Info()
{
    AI_Output (other, self ,"DIA_GorNaVid_Mine_15_01"); //Co wiesz o dnie Kopalni?
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_02"); //Znajduje siê tu kilka istotnych dla ca³ego wydobycia rzeczy. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_03"); //Najwa¿niejsz¹ z nich jest piec hutniczy i rozdrabniacz. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_04"); //Widzisz tego orkowego niewolnika? Stra¿nicy nieŸle go poskromili. Jest spokojny jak baranek. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_05"); //Nieopodal jest tak¿e magazyn, którego strze¿e Draco. Nie wiem, co siê tam znajduje. To nie moja sprawa.
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_06"); //Za magazynem jest kolejny rozdrabniacz. Dalej nie ma nic ciekawego. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_07"); //Szyb jest zamkniêty, a przejœcia strze¿e Ashgan. Roi siê tam od pe³zaczy. 
    AI_Output (self, other ,"DIA_GorNaVid_Mine_03_08"); //Zreszt¹ okoliczne tunele te¿ wcale nie s¹ bezpieczne. Pe³no tu nie tylko pe³zaczy, ale te¿ trolli ziemnych. 
};

instance dia_gornavid_pickpocket(c_info) {
    npc = tpl_1433_gornavid;
    nr = 900;
    condition = dia_gornavid_pickpocket_condition;
    information = dia_gornavid_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornavid_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornavid_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornavid_pickpocket);
	info_addchoice(dia_gornavid_pickpocket, dialog_back, dia_gornavid_pickpocket_back);
	info_addchoice(dia_gornavid_pickpocket, dialog_pickpocket, dia_gornavid_pickpocket_doit);
};

func void dia_gornavid_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gornavid_pickpocket);
};

func void dia_gornavid_pickpocket_back() {
    info_clearchoices(dia_gornavid_pickpocket);
};