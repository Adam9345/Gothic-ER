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
	description = "Cze��! Jestem tu nowy!";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Nazywam si� Graham. Rysuj� mapy. Chyba si� jeszcze nie widzieli�my... Czego potrzebujesz?
	
	B_LogEntry( GE_TraderOC, "Kopacz Graham sprzedaje mapy. Mieszka na lewo od g��wnej bramy.");
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
	description = "Przysy�a mnie Diego. Mam dosta� od ciebie map� wskazuj�c� drog� do Starej Kopalni.";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Przysy�a mnie Diego. Mam dosta� od ciebie map� wskazuj�c� drog� do Starej Kopalni.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Nie ma sprawy. Jak dla ciebie... tylko 20 bry�ek rudy.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Wr�c� p�niej."							,DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Dobrze, zap�ac�. Oto ruda."	,DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Daj mi t� map�, albo sam j� sobie wezm�!"								,DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Diego powiedzia�, �e masz mi DA� t� map�. Nie zamierzam za ni� p�aci�!",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Wr�c� p�niej.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Dobrze, zap�ac�. Oto ruda.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //�wietnie. To prawdziwa okazja, mo�esz mi wierzy�.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Najpierw zdob�d� troch� rudy. Upoluj co�, albo pozbieraj grzyby. Mo�esz je sprzeda� w Obozie.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Daj mi t� map�, albo sam j� sobie wezm�!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Uspok�j si�, stary. Nie chc� tu �adnych k�opot�w. Masz, we� sobie t� map� i daj mi wreszcie spok�j!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Zaraz, Diego powiedzia�, �e masz mi DA� t� map�. Nie zamierzam za ni� p�aci�!
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //A co mnie to obchodzi?! Wiesz ile pracy wymaga sporz�dzenie takiej mapy?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 bry�ek to moja specjalna cena dla przyjaci� Diego. Zwykle bior� 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Chcia�bym kupi� map�.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Chcia�bym kupi� map�.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Jasne. Co ci� interesuje? Im wi�cej wida� na mapie, tym jest dro�sza.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_02"); //Mam w ofercie co� ciekawego! Map� kolonii z zaznaczonymi skr�tami. To cacko znacz�co przyspieszy ci podr�owanie.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_03"); //Tylko 200 bry�ek rudy!
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
   description	= "Przysy�a mnie Thorus.";
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
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_01"); //Przysy�a mnie Thorus.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_02"); //Tak? A czego ode mnie chce?
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_03"); //Mam zanie�� map� wskazuj�c� drog� do Obozu Bandyt�w Stra�nikom sprzed kopalni.
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_04"); //Mam te� dostarczy� notatki Tripa.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_05"); //A masz jaki� dow�d, �e przysy�a ci� Thorus?
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_06"); //Mam ten list.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_07"); //W porz�dku. We� t� map�.
    AI_Output (other, self ,"DIA_Graham_Spy_Map_Bandit_15_08"); //A notatki?
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_09"); //Notatek ju� nie mam. Zabrano je na plac wymian.
    AI_Output (self, other ,"DIA_Graham_Spy_Map_Bandit_03_10"); //Tamtejsi Stra�nicy mieli wzmocni� obron� placu. 
    B_LogEntry                     (CH1_DraxTest,"Graham da� mi map�, wskazuj�c� domniemane miejsce pobytu Bandyt�w. Notatki jednak zaniesiono do Stra�nik�w z placu wymian. ");
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
	description = "Przyszed�em po map� wskazuj�c� drog� do j�dra ognia.";
	
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
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_00"); //Przyszed�em po map� wskazuj�c� drog� do j�dra ognia.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_01"); //Eeee... jest pewien problem.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_02"); //Jaki?
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_03"); //Mam tylko kopi� tej mapy. 
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_04"); //A co z orygina�em?
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_05"); //Skradziono go. Sporz�dzi�em kopi� by Corristo nie by� rozw�cieczony.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_06"); //Chyba b�dzie mia� jeszcze okazj� do podenerwowania. Najwyra�niej kto� jeszcze pr�buje zdoby� to cacko.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_07"); //Wi�c sugeruje si� po�pieszy�.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_08"); //Daj mi t� map�.
	AI_Output (self, other,"DIA_Graham_JadroCorristo_02_09"); //Prosz�, oto ona. 
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_10"); //Dzi�kuje. Zatem wyruszam na zaznaczone na mapie miejsce.
	AI_Output (other, self,"DIA_Graham_JadroCorristo_15_11"); //Do zobaczenia.
    B_LogEntry                 (JadroOgnia ,"Kartograf Graham mia� z�e wie�ci. Kto� ukrad� map� prowadz�c� do j�dra ognia. Da� mi kopi� mapy. Musz� pr�dko uda� si� na miejsce bo najwyra�niej kto� �ciga si� ze mn� w drodze po ten artefakt.");
  
   
	
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