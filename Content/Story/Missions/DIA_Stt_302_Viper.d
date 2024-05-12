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
	description		= "Podobno jeste� hutnikiem."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
if (kapitel < 4) {
	return 1; };
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Podobno jeste� hutnikiem.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Widz�, �e bystry z ciebie ch�opak.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno przetapiasz tutaj cz�� wydobytej rudy."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Podobno przetapiasz tutaj cz�� wydobytej rudy.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Kiedy� przetapiali�my tutaj ca�y urobek. Ale Gomezowi i Magom nie bardzo si� to podoba�o.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Siedzieli tu tygodniami, badaj�c rud� i wszystko dooko�a.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //W�szyli wsz�dzie i wtykali swoje szlachetne nochale w rzeczy, o kt�rych nie mieli poj�cia.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //W ko�cu poprzestali�my na przetapianiu cz�ci urobku. Magowie wi�cej si� tu nie pojawili.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo�esz mi da� troch� rudy?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Mo�esz mi da� troch� rudy?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Je�li dasz mi co� w zamian.
	B_ClearTreaderAmmo(self);
	var int log_vipertrade;
	if (log_vipertrade == FALSE)
	{
		Log_CreateTopic (GE_TraderOM,LOG_NOTE);
		B_LogEntry		(GE_TraderOM,"W�� wymieni towary na rud�. My�l�, �e mog� u niego zostawi� m�j stary ekwipunek.");
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
   description	= "Jak to jest przetapia� rud� w kopalni?";
};

FUNC INT DIA_Viper_ORE_TALKING_Condition()
{
if  (kapitel < 4) {
    return TRUE; };
};

FUNC VOID DIA_Viper_ORE_TALKING_Info()
{
    AI_Output (other, self ,"DIA_Viper_ORE_TALKING_15_01"); //Jak to jest przetapia� rud� w kopalni?
    AI_Output (self, other ,"DIA_Viper_ORE_TALKING_03_02"); //No wiesz, niezbyt �atwa robota. Na szcz�cie Stra�nicy nieco mnie odci��yli przydzielaj�c mi zniewolonego orka do pomocy.
	AI_Output (self, other ,"DIA_Viper_ORE_TALKING_03_03"); //Teraz ten sukinsyn odwala za mnie wi�kszo�� roboty, haha....
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
   description	= "Co mo�esz mi powiedzie� o kopalni?";
};

FUNC INT DIA_Viper_INFOS_2_TALK_Condition()
{
if (kapitel < 4)
{
    return TRUE; };
};

FUNC VOID DIA_Viper_INFOS_2_TALK_Info()
{
    AI_Output (other, self ,"DIA_Viper_INFOS_2_TALK_15_01"); //Co mo�esz mi powiedzie� o kopalni?
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_02"); //Przede wszystkim uwa�aj na pe�zacze. A� si� od nich roi w bocznych tunelach. 
	AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_03"); //Gdy si� na nie natkniesz, id� do �wi�tynnych Stra�nik�w i im o tym zamelduj, zrobi� z nimi porz�dek raz dwa.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_04"); //Nie pr�buj okrada� magazyn�w w kopalni, bo Stra�nicy porachuj� ci ko�ci. Oczywi�cie mo�esz ich wykiwa� i wtedy oskuba�, tak jak to robi m�j przyjaciel na g�rze, Snipes.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_05"); //Niekt�rzy z nich s� naprawd� t�pi, jak cho�by Ulbert. Wystarczy mu wspomnie� o �arciu, a opu�ci swoje stanowisko, ha ha ha. 
    AI_Output (other, self ,"DIA_Viper_INFOS_2_TALK_15_06"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_Viper_INFOS_2_TALK_03_07"); //Nie ma sprawy.

    B_LogEntry		(CH2_StorageShed,	"W�� powiedzia� mi w jaki spos�b mog� odci�gn�� Ulberta. Wystarczy, �e wspomn� mu o jedzeniu.");
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
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_01"); //Hej! Co tu robisz? Jeste� jednym z ludzi Gomeza?
    AI_Output (other, self ,"DIA_Viper_KAPITEL4_WARN_03_02"); //Gdybym by� jednym z jego siepaczy, to by�my nie rozmawiali, od razu bym ci� zabi�.
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_03"); //Hmm... Masz racj�. Czego chcesz?
    AI_Output (other, self ,"DIA_Viper_KAPITEL4_WARN_15_04"); //Tak sobie zwiedza�em okolice. Widz� jednak, �e niekt�rym uda�o si� uciec ze Starej Kopalni. My�la�em, �e wszyscy tam zgin�li.
    AI_Output (self, other ,"DIA_Viper_KAPITEL4_WARN_03_05"); //Nie, nie wszyscy. Nas i tak omin�o to ca�e zaj�cie, w por� opu�cili�my kopalnie. 
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
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_02"); //Chwil� przed upadkiem kopalni Ian potrzebowa� ludzi, kt�rzy przetransportuj� konw�j rudy do Starego Obozu. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_03"); //Jako �e ja, Aleph i Snipes chcieli�my da� nog�, zg�osili�my si� na ochotnik�w. Asghan przydzieli� nam kilku Stra�nik�w. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_04"); //Gdy ju� opuszczali�my kopalni�, zacz�a si� ta ca�a jatka. Podpory zacz�y p�ka�, a do ca�ej kopalni wdar�a si� woda.
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_05"); //My�la�em, �e sam Beliar tam wtargn��, �eby ukara� Gomeza za jego wyst�pki. 
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_06"); //Po chwili z sufitu zacz�y spada� kamienie, kt�re zabi�y Stra�nik�w. Stali�my jak wryci, ale po chwili ockn�li�my si� i dali�my dyla.
    AI_Output (self, other ,"DIA_Viper_MINE_INFOS_K4_03_07"); //Od tej pory siedzimy tutaj wraz z konwojem. Zastanawiamy si�, czy nie opyli� rudy Magom Wody w Nowym Obozie.
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
   description	= "Co zamierzacie robi� dalej?";
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
    AI_Output (other, self ,"DIA_Viper_NEXT_K4_15_01"); //Co zamierzacie robi� dalej?
    AI_Output (self, other ,"DIA_Viper_NEXT_K4_03_02"); //Nie wiem. My�l�, �e odczekamy kilka dni w ukryciu, dop�ki po okolicy b�dzie si� kr�ci�o mniej patroli ze Starego Obozu.
    AI_Output (self, other ,"DIA_Viper_NEXT_K4_03_03"); //P�niej udamy si� do Nowego Obozu. 
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
   description	= "S�ysza�em, �e w kopalni wydobyto srebrny grom...";
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
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_01"); //S�ysza�em, �e w kopalni wydobyto rzadki minera� o nazwie srebrny grom. Wiesz co� na ten temat?
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_02"); //Niewiele, ci�gle pracuje i nie mam czasu na zajmowanie si� takimi nowinkami. Ale wiem, �e tego minera�u by�o bardzo niedu�o.
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_03"); //Pewnie raptem kilkadziesi�t bry�ek.
	AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_04"); //Hmmm... Gdzie powinienem szuka� dalszych informacji?
    AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_05"); //Popytaj w�r�d kopaczy. Niekt�rzy z nich na pewno wiedz� wi�cej na ten temat. W ko�cu to oni odkryli to z�o�e.
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_06"); //Zatem pom�wi� z nimi. 
	AI_Output (self, other ,"DIA_Viper_BOBA_SWORD_03_07"); //A ja wracam do swojej roboty.
    AI_Output (other, self ,"DIA_Viper_BOBA_SWORD_15_08"); //Trzymaj si�.
	B_LogEntry               (MieczGorBoby,"Hutnik W�� powiedzia�, �e odkryto z�o�e ,, srebrnego gromu� na raptem kilkadziesi�t bry�ek. Poleci� mi pom�wi� z Kopaczami na ten temat. Chyba pora odwiedzi� starego Grimesa...");
	
	
	
	
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
   description	= "Pono� zg�asza�e� jaki� problem.";
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
    AI_Output (other, self ,"DIA_Viper_DWNS_15_01"); //Pono� zg�asza�e� jaki� problem.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_02"); //Kto� pr�bowa� uszkodzi� m�j piec hutniczy. 
    AI_Output (other, self ,"DIA_Viper_DWNS_15_03"); //Kto� si� nie�le zawzi��.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_04"); //Trzeba go wy�ledzi� jak najszybciej. Nim dokona wi�cej szk�d.
    AI_Output (other, self ,"DIA_Viper_DWNS_15_05"); //Wracam do Iana.
    AI_Output (self, other ,"DIA_Viper_DWNS_03_06"); //Pospiesz si�...
	B_LogEntry               (Dywersant,"W�� powiedzia�, �e kto� pr�bowa� uszkodzi� jego piec hutniczy. Musz� donie�� o tym Ianowi.");
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