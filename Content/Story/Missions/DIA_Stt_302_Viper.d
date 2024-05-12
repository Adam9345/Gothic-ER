//poprawione i sprawdzone - Reflide

// ************************ EXIT **************************

instance  Stt_302_Viper_Exit (C_INFO)
{
	npc			=  Stt_302_Viper;
	nr			=  999;
	condition	=  Stt_302_Viper_Exit_Condition;
	information	=  Stt_302_Viper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Stt_302_Viper_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Stt_302_Viper_GREET (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_GREET_Condition;
	information		= Stt_302_Viper_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno jesteœ hutnikiem."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
if (kapitel < 4) {
	return 1; };
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Podobno jesteœ hutnikiem.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Widzê, ¿e bystry z ciebie ch³opak.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno przetapiasz tutaj czêœæ wydobytej rudy."; 
};

FUNC int  Stt_302_Viper_MELT_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET) && Npc_KnowsInfo (hero,Grd_260_Drake_Mine_Mehr) && (kapitel < 4)
	{
		return 1;
	};

};
FUNC void  Stt_302_Viper_MELT_Info()
{
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Podobno przetapiasz tutaj czêœæ wydobytej rudy.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Kiedyœ przetapialiœmy tutaj ca³y urobek. Ale Gomezowi i Magom nie bardzo siê to podoba³o.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Siedzieli tu tygodniami, badaj¹c rudê i wszystko dooko³a.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Wêszyli wszêdzie i wtykali swoje szlachetne nochale w rzeczy, o których nie mieli pojêcia.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //W koñcu poprzestaliœmy na przetapianiu czêœci urobku. Magowie wiêcej siê tu nie pojawili.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mi daæ trochê rudy?"; 
	trade           = 1;
};

FUNC int  Stt_302_Viper_BUY_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET) && (kapitel < 4)
	{ 
		return 1;
	};

};
FUNC void  Stt_302_Viper_BUY_Info()
{
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Mo¿esz mi daæ trochê rudy?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Jeœli dasz mi coœ w zamian.
	B_ClearTreaderAmmo(self);
	var int log_vipertrade;
	if (log_vipertrade == FALSE)
	{
		Log_CreateTopic (GE_TraderOM,LOG_NOTE);
		B_LogEntry		(GE_TraderOM,"W¹¿ wymieni towary na rudê. Myœlê, ¿e mogê u niego zostawiæ mój stary ekwipunek.");
		log_vipertrade = TRUE;
	};
};

//========================================
//-----------------> ORE_TALKING
//========================================

INSTANCE DIA_Viper_ORE_TALKING (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 1;
   condition    = DIA_Viper_ORE_TALKING_Condition;
   information  = DIA_Viper_ORE_TALKING_Info;
   permanent	= FALSE;
   description	= "Jak to jest przetapiaæ rudê w kopalni?";
};

FUNC INT DIA_Viper_ORE_TALKING_Condition()
{
if  (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_Viper_ORE_TALKING_Info()
{
    AI_Output (other, self ,"DIA_Viper_ORE_TALKING_15_01"); //Jak to jest przetapiaæ rudê w kopalni?
    AI_Output (self, other ,"DIA_Viper_ORE_TALKING_03_02"); //No wiesz, niezbyt ³atwa robota. Na szczêœcie Stra¿nicy nieco mnie odci¹¿yli przydzielaj¹c mi zniewolonego orka do pomocy.
	AI_Output (self, other ,"DIA_Viper_ORE_TALKING_03_03"); //Teraz ten sukinsyn odwala za mnie wiêkszoœæ roboty, haha....
};

//========================================
//-----------------> INFOS_2_TALK
//========================================

INSTANCE DIA_Viper_INFOS_2_TALK (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 2;
   condition    = DIA_Viper_INFOS_2_TALK_Condition;
   information  = DIA_Viper_INFOS_2_TALK_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o kopalni?";
};

FUNC INT DIA_Viper_INFOS_2_TALK_Condition()
{
if (kapitel < 4)
{
    return TRUE; };
};

FUNC VOID DIA_Viper_INFOS_2_TALK_Info()
{
    AI_Output (other, self ,"DIA_Viper_INFOS_2_TALK_15_01"); //Co mo¿esz mi powiedzieæ o kopalni?
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_02"); //Przede wszystkim uwa¿aj na pe³zacze. A¿ siê od nich roi w bocznych tunelach. 
	AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_03"); //Gdy siê na nie natkniesz, idŸ do Œwi¹tynnych Stra¿ników i im o tym zamelduj, zrobi¹ z nimi porz¹dek raz dwa.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_04"); //Nie próbuj okradaæ magazynów w kopalni, bo Stra¿nicy porachuj¹ ci koœci. Oczywiœcie mo¿esz ich wykiwaæ i wtedy oskubaæ, tak jak to robi mój przyjaciel na górze, Snipes.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_05"); //Niektórzy z nich s¹ naprawdê têpi, jak choæby Ulbert. Wystarczy mu wspomnieæ o ¿arciu, a opuœci swoje stanowisko, ha ha ha. 
    AI_Output (other, self ,"DIA_Viper_INFOS_2_TALK_15_06"); //Dziêki za radê.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_07"); //Nie ma sprawy.

    B_LogEntry		(CH2_StorageShed,	"W¹¿ powiedzia³ mi w jaki sposób mogê odci¹gn¹æ Ulberta. Wystarczy, ¿e wspomnê mu o jedzeniu.");
};

//========================================
//-----------------> KAPITEL4_WARN
//========================================

INSTANCE DIA_Viper_KAPITEL4_WARN (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 1;
   condition    = DIA_Viper_KAPITEL4_WARN_Condition;
   information  = DIA_Viper_KAPITEL4_WARN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Viper_KAPITEL4_WARN_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Viper_KAPITEL4_WARN_Info()
{
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_01"); //Hej! Co tu robisz? Jesteœ jednym z ludzi Gomeza?
    AI_Output (other, self ,"DIA_Viper_KAPITEL4_WARN_03_02"); //Gdybym by³ jednym z jego siepaczy, to byœmy nie rozmawiali, od razu bym ciê zabi³.
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_03"); //Hmm... Masz racjê. Czego chcesz?
    AI_Output (other, self ,"DIA_Viper_KAPITEL4_WARN_15_04"); //Tak sobie zwiedza³em okolice. Widzê jednak, ¿e niektórym uda³o siê uciec ze Starej Kopalni. Myœla³em, ¿e wszyscy tam zginêli.
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_05"); //Nie, nie wszyscy. Nas i tak ominê³o to ca³e zajœcie, w porê opuœciliœmy kopalnie. 
};

//========================================
//-----------------> MINE_INFOS_K4
//========================================

INSTANCE DIA_Viper_MINE_INFOS_K4 (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 2;
   condition    = DIA_Viper_MINE_INFOS_K4_Condition;
   information  = DIA_Viper_MINE_INFOS_K4_Info;
   permanent	= FALSE;
   description	= "Jak to?";
};

FUNC INT DIA_Viper_MINE_INFOS_K4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Viper_KAPITEL4_WARN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Viper_MINE_INFOS_K4_Info()
{
    AI_Output (other, self ,"DIA_Viper_MINE_INFOS_K4_15_01"); //Jak to?
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_02"); //Chwilê przed upadkiem kopalni Ian potrzebowa³ ludzi, którzy przetransportuj¹ konwój rudy do Starego Obozu. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_03"); //Jako ¿e ja, Aleph i Snipes chcieliœmy daæ nogê, zg³osiliœmy siê na ochotników. Asghan przydzieli³ nam kilku Stra¿ników. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_04"); //Gdy ju¿ opuszczaliœmy kopalniê, zaczê³a siê ta ca³a jatka. Podpory zaczê³y pêkaæ, a do ca³ej kopalni wdar³a siê woda.
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_05"); //Myœla³em, ¿e sam Beliar tam wtargn¹³, ¿eby ukaraæ Gomeza za jego wystêpki. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_06"); //Po chwili z sufitu zaczê³y spadaæ kamienie, które zabi³y Stra¿ników. Staliœmy jak wryci, ale po chwili ocknêliœmy siê i daliœmy dyla.
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_07"); //Od tej pory siedzimy tutaj wraz z konwojem. Zastanawiamy siê, czy nie opyliæ rudy Magom Wody w Nowym Obozie.
};

//========================================
//-----------------> NEXT_K4
//========================================

INSTANCE DIA_Viper_NEXT_K4 (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 3;
   condition    = DIA_Viper_NEXT_K4_Condition;
   information  = DIA_Viper_NEXT_K4_Info;
   permanent	= FALSE;
   description	= "Co zamierzacie robiæ dalej?";
};

FUNC INT DIA_Viper_NEXT_K4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Viper_MINE_INFOS_K4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Viper_NEXT_K4_Info()
{
    AI_Output (other, self ,"DIA_Viper_NEXT_K4_15_01"); //Co zamierzacie robiæ dalej?
    AI_Output (self, other ,"DIA_Viper_NEXT_K4_03_02"); //Nie wiem. Myœlê, ¿e odczekamy kilka dni w ukryciu, dopóki po okolicy bêdzie siê krêci³o mniej patroli ze Starego Obozu.
    AI_Output (self, other ,"DIA_Viper_NEXT_K4_03_03"); //PóŸniej udamy siê do Nowego Obozu. 
};


//========================================
//-----------------> NEXT_K4
//========================================

INSTANCE DIA_Viper_BOBA_SWORD (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 3;
   condition    = DIA_Viper_BOBA_SWORD_Condition;
   information  = DIA_Viper_BOBA_SWORD_Info;
   permanent	= FALSE;
   description	= "S³ysza³em, ¿e w kopalni wydobyto srebrny grom...";
};

FUNC INT DIA_Viper_BOBA_SWORD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_SWORD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Viper_BOBA_SWORD_Info()
{
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_01"); //S³ysza³em, ¿e w kopalni wydobyto rzadki minera³ o nazwie srebrny grom. Wiesz coœ na ten temat?
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_02"); //Niewiele, ci¹gle pracuje i nie mam czasu na zajmowanie siê takimi nowinkami. Ale wiem, ¿e tego minera³u by³o bardzo niedu¿o.
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_03"); //Pewnie raptem kilkadziesi¹t bry³ek.
	AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_04"); //Hmmm... Gdzie powinienem szukaæ dalszych informacji?
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_05"); //Popytaj wœród kopaczy. Niektórzy z nich na pewno wiedz¹ wiêcej na ten temat. W koñcu to oni odkryli to z³o¿e.
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_06"); //Zatem pomówiê z nimi. 
	AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_07"); //A ja wracam do swojej roboty.
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_08"); //Trzymaj siê.
	B_LogEntry               (MieczGorBoby,"Hutnik W¹¿ powiedzia³, ¿e odkryto z³o¿e ,, srebrnego gromu” na raptem kilkadziesi¹t bry³ek. Poleci³ mi pomówiæ z Kopaczami na ten temat. Chyba pora odwiedziæ starego Grimesa...");
	
	
	
	
};

//========================================
//-----------------> DWNS
//========================================

INSTANCE DIA_Viper_DWNS (C_INFO)
{
   npc          = Stt_302_Viper;
   nr           = 1;
   condition    = DIA_Viper_DWNS_Condition;
   information  = DIA_Viper_DWNS_Info;
   permanent	= FALSE;
   description	= "Ponoæ zg³asza³eœ jakiœ problem.";
};

FUNC INT DIA_Viper_DWNS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_IAN_DWNS))
{
    return TRUE;
};
};
FUNC VOID DIA_Viper_DWNS_Info()
{
    AI_Output (other, self ,"DIA_Viper_DWNS_15_01"); //Ponoæ zg³asza³eœ jakiœ problem.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_02"); //Ktoœ próbowa³ uszkodziæ mój piec hutniczy. 
    AI_Output (other, self ,"DIA_Viper_DWNS_15_03"); //Ktoœ siê nieŸle zawzi¹³.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_04"); //Trzeba go wyœledziæ jak najszybciej. Nim dokona wiêcej szkód.
    AI_Output (other, self ,"DIA_Viper_DWNS_15_05"); //Wracam do Iana.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_06"); //Pospiesz siê...
	B_LogEntry               (Dywersant,"W¹¿ powiedzia³, ¿e ktoœ próbowa³ uszkodziæ jego piec hutniczy. Muszê donieœæ o tym Ianowi.");
    AI_StopProcessInfos	(self);
};

instance dia_viper_pickpocket(c_info) {
    npc = stt_302_viper;
    nr = 900;
    condition = dia_viper_pickpocket_condition;
    information = dia_viper_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_viper_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_viper_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_viper_pickpocket);
	info_addchoice(dia_viper_pickpocket, dialog_back, dia_viper_pickpocket_back);
	info_addchoice(dia_viper_pickpocket, dialog_pickpocket, dia_viper_pickpocket_doit);
};

func void dia_viper_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_viper_pickpocket);
};

func void dia_viper_pickpocket_back() {
    info_clearchoices(dia_viper_pickpocket);
};