//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  GRD_271_ULBERT_Exit (C_INFO)
{
	npc			=  GRD_271_ULBERT;
	nr			=  999;
	condition	=  GRD_271_ULBERT_Exit_Condition;
	information	=  GRD_271_ULBERT_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************
instance  GRD_271_ULBERT_KEY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_KEY_Condition;
	information		= GRD_271_ULBERT_KEY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co si� znajduje w sk�adowisku?"; 
};

FUNC int  GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};


FUNC void  GRD_271_ULBERT_KEY_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_KEY_Info_15_01"); //Co si� znajduje w sk�adowisku?
	AI_Output			(self, other,"GRD_271_ULBERT_KEY_Info_07_02"); //Nie tw�j interes!
};  
// ***************** Infos *****************************

instance  GRD_271_ULBERT_TRICK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_TRICK_Condition;
	information		= GRD_271_ULBERT_TRICK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Za�o�� si�, �e zasch�o ci w ustach od tej ci�kiej pracy."; 
};

FUNC int  GRD_271_ULBERT_TRICK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_KEY))
	{	
		return 1;
	};
};


FUNC void  GRD_271_ULBERT_TRICK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_TRICK_Info_15_01"); //Za�o�� si�, �e zasch�o ci w ustach od tej ci�kiej pracy.
	AI_Output			(self, other,"GRD_271_ULBERT_TRICK_Info_07_02"); //Jeszcze jak! Ch�tnie bym si� czego� napi�. Mo�e m�g�by� mnie czym� pocz�stowa�, co?

	Log_CreateTopic		(CH2_StorageShed,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_RUNNING);
	B_LogEntry		(CH2_StorageShed,	"Ulbert pilnuje sk�adowiska w Starej Kopalni. Musz� mu przynie�� co� do picia."); 
};  

// ***************** Infos *****************************

instance  GRD_271_ULBERT_DRINK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRINK_Condition;
	information		= GRD_271_ULBERT_DRINK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj co� do picia)"; 
};

FUNC int  GRD_271_ULBERT_DRINK_Condition()
{	
	if  (Npc_KnowsInfo ( hero, GRD_271_ULBERT_TRICK) ) &&	(Npc_HasItems (hero, ItFobeer )|| 
															 Npc_HasItems (hero, ItFoWine )||
															 Npc_HasItems (hero, ItFoBooze)  )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRINK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRINK_Info_15_01"); //Prosz� bardzo, na zdrowie!
	AI_Output			(self, other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Dzi�ki.
	
	if 		(Npc_HasItems (hero, ItFobeer ))
	{
		B_GiveInvItems  	(hero, self, ItFobeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		(self,	ItFobeer);
	}
	else if (Npc_HasItems (hero, ItFowine ))
	{
		B_GiveInvItems	    (hero, self, ItFowine, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoWine);
	}
	else if (Npc_HasItems (hero, ItFoBooze))
	{
		B_GiveInvItems	(hero, self, ItFoBooze, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoBooze);
	};
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_DRUNK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRUNK_Condition;
	information		= GRD_271_ULBERT_DRUNK_Info;
	important		= 0;
	permanent		= 0;
	description		= "To jak z tym sk�adowiskiem? Jest tam co� ciekawego?"; 
};

FUNC int  GRD_271_ULBERT_DRUNK_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRINK) )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //To jak z tym sk�adowiskiem? Jest tam co� ciekawego?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Kilka skrzy�, w kt�rych przechowujemy zapasy. Niestety, gdzie� si� nam zapodzia� klucz.
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //Zapodzia�?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //Za�o�� si�, �e to sprawka Alepha. Temu cz�owiekowi nie mo�na ufa�.

	B_LogEntry		(CH2_StorageShed,	"Pocz�stowany trunkiem Ulbert powiedzia� mi, �e zgubi� gdzie� klucz do skrzy�. Pono� jeden z Kopaczy imieniem Aleph mia� z tym co� wsp�lnego!");
};  

// ***************** Infos *****************************
instance  GRD_271_ULBERT_LOCK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_LOCK_Condition;
	information		= GRD_271_ULBERT_LOCK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(odci�gnij Ulberta)"; 
};

FUNC int  GRD_271_ULBERT_LOCK_Condition()
{
	if ( Npc_KnowsInfo (hero ,GRD_271_ULBERT_DRUNK)) //||  ( Npc_KnowsInfo (hero ,DIA_ULBERT_BLACKORE))
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_LOCK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_LOCK_Info_15_01"); //S�uchaj, Ian i pozostali siedz� teraz na dole i zajadaj� si� pieczonym mi�sem.
	AI_Output			(self, other,"GRD_271_ULBERT_LOCK_Info_07_02"); //Co? Beze mnie? No nie! Ju� ja im poka��!
	
	B_LogEntry		(CH2_StorageShed,	"Odci�gni�cie Ulberta od sk�adowiska nie by�o zbyt trudne. Nie jest to szczeg�lnie inteligentny cz�owiek.");

	Npc_ExchangeRoutine	(self,	"away");
	AI_StopProcessInfos	(self);
};

// ***************** Ulbert ist sauer *****************************
instance  GRD_271_ULBERT_ANGRY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_ANGRY_Condition;
	information		= GRD_271_ULBERT_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_271_ULBERT_ANGRY_Condition()
{
	if	Npc_KnowsInfo(hero,GRD_271_ULBERT_LOCK)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_49") < 600)
	{
		return TRUE;
	};

};
FUNC void  GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output			(self, other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //Hej, ty! Tam nie by�o �adnego pieczonego mi�sa!
	AI_Output			(other, self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Eee... C�, widocznie si� pomyli�em. �ycz� mi�ego dnia!

	B_GiveXP			(XP_LureUlbertAway);
	
	B_LogEntry		(CH2_StorageShed,	"Spotka�em ponownie Ulberta. Ten g�upol nie zorientowa� si� nawet, �e wystrychn��em go na dudka!");
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_SUCCESS);

	Npc_ExchangeRoutine	(self,	"start");
	AI_StopProcessInfos	(self);
};



//========================================
//-----------------> DWMN_BEER
//========================================

INSTANCE DIA_ULBERT_DWMN_BEER (C_INFO)
{
   npc          = GRD_271_ULBERT;
   nr           = 1;
   condition    = DIA_ULBERT_DWMN_BEER_Condition;
   information  = DIA_ULBERT_DWMN_BEER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_ULBERT_DWMN_BEER_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Glen_DWMN_MAMCIE))
{
    return TRUE;
};
};
FUNC VOID DIA_ULBERT_DWMN_BEER_Info()
{
    AI_Output (self, other ,"DIA_ULBERT_DWMN_BEER_03_01"); //Ej ty dasz mi mo�e piwo? Zasch�o mi w gardle!
    AI_Output (other, self ,"DIA_ULBERT_DWMN_BEER_15_02"); //Mam spraw�.
    AI_Output (self, other ,"DIA_ULBERT_DWMN_BEER_03_03"); //Jak�?
    AI_Output (other, self ,"DIA_ULBERT_DWMN_BEER_15_04"); //Dlaczego n�kasz Glena I zmuszasz by niszczy� r�ne rzeczy w kopalni?
    AI_Output (self, other ,"DIA_ULBERT_DWMN_BEER_03_05"); //Nic nie wiem. Nic nie powiem.
    AI_Output (other, self ,"DIA_ULBERT_DWMN_BEER_15_06"); //Mo�e jednak chcesz to piwo?
    AI_Output (self, other ,"DIA_ULBERT_DWMN_BEER_03_07"); //Pewnie!
	B_LogEntry               (Dywersant,"Ulbert nie chc� gada�. Mo�e piwo rozwi��e mu j�zyk?");
};

//========================================
//-----------------> DWMN_B1
//========================================

INSTANCE DIA_ULBERT_DWMN_B1 (C_INFO)
{
   npc          = GRD_271_ULBERT;
   nr           = 2;
   condition    = DIA_ULBERT_DWMN_B1_Condition;
   information  = DIA_ULBERT_DWMN_B1_Info;
   permanent	= FALSE;
   description	= "Masz.";
};

FUNC INT DIA_ULBERT_DWMN_B1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_ULBERT_DWMN_BEER))
&& (Npc_HasItems (other, ItFobeer) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_ULBERT_DWMN_B1_Info()
{
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B1_15_01"); //Masz.
	B_GiveInvItems (other,self, itfobeer, 1);
	 AI_UseItem(self, itfobeer );
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B1_03_02"); //Uuuu dzi�ki.
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B1_03_03"); //Tego mi by�o trzeba. Zwykle straszna nuda jest wiesz, dobrze, �e przynajmniej ostatnio mia�em co robi�.
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B1_15_04"); //A co takiego robi�e�?
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B1_03_05"); //Niewa�ne. Masz mo�e jeszcze ry��wk�?
	B_LogEntry               (Dywersant,"Ulbert chce ry��wki. Niech strac�.");
};

//========================================
//-----------------> DWMN_B2
//========================================

INSTANCE DIA_ULBERT_DWMN_B2 (C_INFO)
{
   npc          = GRD_271_ULBERT;
   nr           = 3;
   condition    = DIA_ULBERT_DWMN_B2_Condition;
   information  = DIA_ULBERT_DWMN_B2_Info;
   permanent	= FALSE;
   description	= "Mam.";
};

FUNC INT DIA_ULBERT_DWMN_B2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_ULBERT_DWMN_B1))
&& (Npc_HasItems (other, ItFoBooze) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_ULBERT_DWMN_B2_Info()
{
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B2_15_01"); //Mam.
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B2_03_02"); //To daj mi.
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B2_15_03"); //Prosz�.
	B_GiveInvItems (other,self, ItFoBooze, 1);
	 AI_UseItem(self, ItFoBooze );
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B2_03_04"); //Dzi�ki, r�wny z Ciebie go��
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B2_15_05"); //No wi�c jak z tym Glenem?
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B2_03_06"); //Wiesz jaa nie powiem nic co zaszkodzi mojemu sstryjowi.
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B2_15_07"); //Stryjowi?
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B2_03_08"); //Taaak... Ale poo co ja to pooowiedzia�em?
    AI_Output (other, self ,"DIA_ULBERT_DWMN_B2_15_09"); //S�ysza�e�? Chyba kto� mnie wo�a... Na razie...
    AI_Output (self, other ,"DIA_ULBERT_DWMN_B2_03_10"); //Ale...
	B_LogEntry               (Dywersant,"Ulbert upi� si� I wygada� si�, �e chodzi o jego stryja. Musz� czym pr�dzej wr�ci� do Iana.");
    AI_StopProcessInfos	(self);
};

instance dia_ulbert_pickpocket(c_info) {
    npc = grd_271_ulbert;
    nr = 900;
    condition = dia_ulbert_pickpocket_condition;
    information = dia_ulbert_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ulbert_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_ulbert_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ulbert_pickpocket);
	info_addchoice(dia_ulbert_pickpocket, dialog_back, dia_ulbert_pickpocket_back);
	info_addchoice(dia_ulbert_pickpocket, dialog_pickpocket, dia_ulbert_pickpocket_doit);
};

func void dia_ulbert_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_ulbert_pickpocket);
};

func void dia_ulbert_pickpocket_back() {
    info_clearchoices(dia_ulbert_pickpocket);
};