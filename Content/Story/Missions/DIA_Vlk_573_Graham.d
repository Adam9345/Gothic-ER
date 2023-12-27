//poprawione i sprawdzone - Reflide

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Graham_EXIT(C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 999;
	condition	= Info_Graham_EXIT_Condition;
	information	= Info_Graham_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Graham_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Graham_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Was machst du?
// ************************************************************

INSTANCE DIA_Graham_Hello (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 3;
	condition	= DIA_Graham_Hello_Condition;
	information	= DIA_Graham_Hello_Info;
	permanent	= 0;
	description = "Czeœæ! Jestem tu nowy!";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Nazywam siê Graham. Rysujê mapy. Chyba siê jeszcze nie widzieliœmy... Czego potrzebujesz?
	
	B_LogEntry( GE_TraderOC, "Kopacz Graham sprzedaje mapy. Mieszka na lewo od g³ównej bramy.");
};

// ************************************************************
// 						Sell Map
// ************************************************************
	var int Graham_OMKarteVerkauft;
	var int Graham_OMKarteErpresst;
// ************************************************************

INSTANCE DIA_Graham_SellMap (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 3;
	condition	= DIA_Graham_SellMap_Condition;
	information	= DIA_Graham_SellMap_Info;
	permanent	= 1;
	description = "Przysy³a mnie Diego. Mam dostaæ od ciebie mapê wskazuj¹c¹ drogê do Starej Kopalni.";
};                       

FUNC INT DIA_Graham_SellMap_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Graham_Hello) && Npc_KnowsInfo(hero,Info_Diego_MapToOldMine) && (Graham_OMKarteVerkauft==FALSE) && (Graham_OMKarteErpresst==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Graham_SellMap_Info()
{	
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Przysy³a mnie Diego. Mam dostaæ od ciebie mapê wskazuj¹c¹ drogê do Starej Kopalni.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Nie ma sprawy. Jak dla ciebie... tylko 20 bry³ek rudy.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Wrócê póŸniej."							,DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Dobrze, zap³acê. Oto ruda."	,DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Daj mi tê mapê, albo sam j¹ sobie wezmê!"								,DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Diego powiedzia³, ¿e masz mi DAÆ tê mapê. Nie zamierzam za ni¹ p³aciæ!",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Wrócê póŸniej.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Dobrze, zap³acê. Oto ruda.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Œwietnie. To prawdziwa okazja, mo¿esz mi wierzyæ.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Najpierw zdob¹dŸ trochê rudy. Upoluj coœ, albo pozbieraj grzyby. Mo¿esz je sprzedaæ w Obozie.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Daj mi tê mapê, albo sam j¹ sobie wezmê!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Uspokój siê, stary. Nie chcê tu ¿adnych k³opotów. Masz, weŸ sobie tê mapê i daj mi wreszcie spokój!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Zaraz, Diego powiedzia³, ¿e masz mi DAÆ tê mapê. Nie zamierzam za ni¹ p³aciæ!
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //A co mnie to obchodzi?! Wiesz ile pracy wymaga sporz¹dzenie takiej mapy?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 bry³ek to moja specjalna cena dla przyjació³ Diego. Zwykle biorê 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Chcia³bym kupiæ mapê.";
	Trade 		= 1;
};                       

FUNC INT DIA_Graham_BuyMaps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Graham_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Graham_BuyMaps_Info()
{	
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Chcia³bym kupiæ mapê.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Jasne. Co ciê interesuje? Im wiêcej widaæ na mapie, tym jest dro¿sza.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_02"); //Mam w ofercie coœ ciekawego! Mapê kolonii z zaznaczonymi skrótami. To cacko znacz¹co przyspieszy ci podró¿owanie.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_03"); //Tylko 200 bry³ek rudy!
	B_ClearTreaderAmmo(self);
};


//========================================
//-----------------> Spy_Map_Bandit
//========================================

INSTANCE DIA_Graham_Spy_Map_Bandit (C_INFO)
{
   npc          = Vlk_573_Graham;
   nr           = 1;
   condition    = DIA_Graham_Spy_Map_Bandit_Condition;
   information  = DIA_Graham_Spy_Map_Bandit_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Thorus.";
};

FUNC INT DIA_Graham_Spy_Map_Bandit_Condition()
{
	var C_Item obecny_pancerz;
	obecny_pancerz = Npc_GetEquippedArmor(hero);
    if (Npc_KnowsInfo (hero, DIA_Bandyta_BuddlerEQ))
    && (Npc_HasItems (other, ItMis_Thorus_Safe_conduct) >=1)
	&& ((Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_L)) ||  (Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_M)) ||  (Hlp_GetInstanceID(obecny_pancerz)==Hlp_GetInstanceID(VLK_ARMOR_H)))
    {
    return TRUE;
};
};


FUNC VOID DIA_Graham_Spy_Map_Bandit_Info()
{
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_01"); //Przysy³a mnie Thorus.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_02"); //Tak? A czego ode mnie chce?
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_03"); //Mam zanieœæ mapê wskazuj¹c¹ drogê do Obozu Bandytów Stra¿nikom sprzed kopalni.
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_04"); //Mam te¿ dostarczyæ notatki Tripa.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_05"); //A masz jakiœ dowód, ¿e przysy³a ciê Thorus?
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_06"); //Mam ten list.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_07"); //W porz¹dku. WeŸ tê mapê.
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_08"); //A notatki?
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_09"); //Notatek ju¿ nie mam. Zabrano je na plac wymian.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_10"); //Tamtejsi Stra¿nicy mieli wzmocniæ obronê placu. 
    B_LogEntry                     (CH1_DraxTest,"Graham da³ mi mapê, wskazuj¹c¹ domniemane miejsce pobytu Bandytów. Notatki jednak zaniesiono do Stra¿ników z placu wymian. ");
	CreateInvItems (self, ItMis_TripMap, 1);
    B_GiveInvItems (self, other, ItMis_TripMap, 1);
	B_GiveInvItems (other, self, ItMis_Thorus_Safe_conduct, 1);
    B_GiveXP (75);
    AI_StopProcessInfos	(self);
    
};


//-===================================================================================================SUBMOD==========================================================================

func void jadro_ognia()
{


    Wld_InsertNpc                (NON_40007_Rabus,"WP_BDT_CORR1");
    Wld_InsertNpc                (NON_40008_Rabus,"WP_BDT_CORR2");
    Wld_InsertNpc                (NON_40006_Przywodca,"WP_BDT_CORR3");
	
	Wld_InsertNpc                (Bloodhound,"WP_JADRO3");
    Wld_InsertItem			     (ItMi_Focus_Corristo,"PSI_LOCATION_JADROOGNIA");

};
INSTANCE DIA_Graham_JadroCorristo (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_JadroCorristo_Condition;
	information	= DIA_Graham_JadroCorristo_Info;
	permanent	= 0;
	description = "Przyszed³em po mapê wskazuj¹c¹ drogê do j¹dra ognia.";
	
};                       

FUNC INT DIA_Graham_JadroCorristo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PC_MAGE_JADRO))
	{
		return 1;
	};
};

FUNC VOID DIA_Graham_JadroCorristo_Info()
{	
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_00"); //Przyszed³em po mapê wskazuj¹c¹ drogê do j¹dra ognia.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_01"); //Eeee... jest pewien problem.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_02"); //Jaki?
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_03"); //Mam tylko kopiê tej mapy. 
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_04"); //A co z orygina³em?
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_05"); //Skradziono go. Sporz¹dzi³em kopiê by Corristo nie by³ rozwœcieczony.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_06"); //Chyba bêdzie mia³ jeszcze okazjê do podenerwowania. NajwyraŸniej ktoœ jeszcze próbuje zdobyæ to cacko.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_07"); //Wiêc sugeruje siê poœpieszyæ.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_08"); //Daj mi tê mapê.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_09"); //Proszê, oto ona. 
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_10"); //Dziêkuje. Zatem wyruszam na zaznaczone na mapie miejsce.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_11"); //Do zobaczenia.
    B_LogEntry                 (JadroOgnia ,"Kartograf Graham mia³ z³e wieœci. Ktoœ ukrad³ mapê prowadz¹c¹ do j¹dra ognia. Da³ mi kopiê mapy. Muszê prêdko udaæ siê na miejsce bo najwyraŸniej ktoœ œciga siê ze mn¹ w drodze po ten artefakt.");
  
   
	
	B_GiveInvItems (self, other, ItWrMapCorristo, 1);
    AI_StopProcessInfos	     (self);
	jadro_ognia();
};

instance dia_graham_pickpocket(c_info) {
    npc = vlk_573_graham;
    nr = 900;
    condition = dia_graham_pickpocket_condition;
    information = dia_graham_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_graham_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_graham_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_graham_pickpocket);
	info_addchoice(dia_graham_pickpocket, dialog_back, dia_graham_pickpocket_back);
	info_addchoice(dia_graham_pickpocket, dialog_pickpocket, dia_graham_pickpocket_doit);
};

func void dia_graham_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_graham_pickpocket);
};

func void dia_graham_pickpocket_back() {
    info_clearchoices(dia_graham_pickpocket);
};