//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_prin_EXIT(C_INFO)
{
	npc             = NON_2703_MYSLIWY;
	nr              = 999;
	condition	= DIA_prin_EXIT_Condition;
	information	= DIA_prin_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_prin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_prin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_prin_HELLO (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_HELLO_Condition;
	information  	= DIA_prin_HELLO_Info;
	permanent		= FALSE;
	description     = "Kim jeste�?";
};

FUNC INT DIA_prin_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_prin_HELLO_Info()
{
	AI_Output (other, self ,"DIA_prin_HELLO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_prin_HELLO_03_02"); //Nazywam si� Prin. Jestem �owc� ork�w. 
    AI_Output (other, self ,"DIA_prin_HELLO_15_03"); //Czym si� zajmujesz w obozie?
    AI_Output (self, other ,"DIA_prin_HELLO_03_04"); //Jestem traperem. Moim zadaniem s� zwiady, sprawdzanie terenu i tym podobne sprawy. 
};

//========================================
//-----------------> OrcLands
//========================================

INSTANCE DIA_prin_OrcLands (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_OrcLands_Condition;
	information  	= DIA_prin_OrcLands_Info;
	permanent		= FALSE;
	description   	= "Opowiedz mi o Ziemiach Ork�w.";
};

FUNC INT DIA_prin_OrcLands_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_OrcLands_Info()
{
    AI_Output (other, self ,"DIA_prin_OrcLands_15_01"); //Opowiedz mi o Ziemiach Ork�w.
    AI_Output (self, other ,"DIA_prin_OrcLands_03_02"); //To dosy� rozleg�y teren. 
    AI_Output (self, other ,"DIA_prin_OrcLands_03_03"); //Wsz�dzie kr�c� si� orkowe patrole, wypatruj�ce nie wiadomo czego. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_04"); //Najwi�cej ork�w jest w�a�nie tutaj, przy granicy. W g��bi nie pojawiaj� si� ju� tak licznie. Poza ich miastem, rzecz jasna.
	AI_Output (self, other ,"DIA_prin_OrcLands_03_05"); //Jednak...nie brakuje tam innych bestii - brzytw i k�saczy. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_06"); //Je�eli masz dobry pancerz, to k�sacze nie s� zbyt wielkim zagro�eniem. Brzytwy, to inna sprawa
	AI_Output (self, other ,"DIA_prin_OrcLands_03_07"); //Ich stado mo�e poszarpa� dobrego wojownika na kawa�eczki w kilka chwil. 
};

//========================================
//-----------------> SomeoneElse
//========================================

INSTANCE DIA_prin_SomeoneElse (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_SomeoneElse_Condition;
	information  	= DIA_prin_SomeoneElse_Info;
	permanent		= FALSE;
	description   	= "Czy mieszka tu kto� inny?";
};

FUNC INT DIA_prin_SomeoneElse_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_HELLO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_SomeoneElse_Info()
{
	AI_Output (other, self ,"DIA_prin_SomeoneElse_15_01"); //Czy mieszka tu kto� inny?
    	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_02"); //Na Ziemiach Ork�w? Z pewno�ci�! 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_03"); //Z tego co mi wiadomo, nieopodal Miasta Ork�w nie ma nic ciekawego. Jednak ko�o bagna jest jaskinia, w kt�rej mieszka pewien alchemik. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_04"); //Rozmawia�em z nim kiedy�. Powiedzia�, �e szuka jakich� kamieni przypominaj�cych kryszta�y, czy co� takiego.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_05"); //Rzekomo prowadzi nad nimi badania. Nie znam si� na tym, wi�c nie mia�em zamiaru mu pomaga�. Doradzi�em tylko, �eby uwa�a�. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_06"); //Jest jeszcze wielka wie�a. Trudno j� przeoczy�. W nocy s�ycha� stamt�d okropne d�wi�ki. Lepiej si� tam nie zapuszczaj. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_07"); //Na �rodku jeziora, w pobli�u cytadeli jest jeszcze jedna. Nigdy tam nie by�em, ale czu� stamt�d plugaw� magi� na kilometr.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_08"); //Tego miejsca r�wnie� radzi�bym ci unika�.
	B_GiveXP (100);
};

//========================================
//-----------------> Teleport
//========================================

INSTANCE DIA_prin_Teleport (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_Teleport_Condition;
	information  	= DIA_prin_Teleport_Info;
	permanent		= FALSE;
	description   	= "Czy istnieje jaka� runa teleportacji do tego miejsca?";
};

FUNC INT DIA_prin_Teleport_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_SomeoneElse)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_Teleport_Info()
{
	AI_Output (other, self ,"DIA_prin_Teleport_15_01"); //Czy istnieje jaka� runa teleportacji do tego miejsca?
    	AI_Output (self, other ,"DIA_prin_Teleport_03_02"); //Ten alchemik, o kt�rym ci wspomina�em... Kiedy� wykonywa�em dla niego pewne zlecenie. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_03"); //W ramach nagrody, da� mi run� teleportacyjn�.
	AI_Output (self, other ,"DIA_prin_Teleport_03_04"); //Powiedzia�, �e mog� si� dzi�ki niemu bezpiecznie tu przenie��. Nigdy jednak z niego nie skorzysta�em... Ju� ci m�wi�em, �e nie param si� magi�.
	AI_Output (self, other ,"DIA_prin_Teleport_03_05"); //Je�li si� nie boisz, to ci go sprzedam za r�wnowarto�� mojego zlecenia. To b�dzie jakie�... 300 bry�ek rudy. Kupujesz?
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"�owca ork�w Prin mo�e mi sprzeda� run� teleportu do obozu �owc�w ork�w za cen� 300 bry�ek rudy.");
};

var int buy_teleprt_prin;
//========================================
//-----------------> BuyRune
//========================================

INSTANCE DIA_prin_BuyRune (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_prin_BuyRune_Condition;
	information  	= DIA_prin_BuyRune_Info;
	permanent		= TRUE;
	description   	= "Chc� od ciebie kupi� t� run� teleportacji.";
};

FUNC INT DIA_prin_BuyRune_Condition()
{
	if Npc_KnowsInfo (hero, DIA_prin_Teleport) && (buy_teleprt_prin == false)
	{
    return TRUE;
	};
};

FUNC VOID DIA_prin_BuyRune_Info()
{
	AI_Output (other, self ,"DIA_prin_BuyRune_15_01"); //Chc� od ciebie kupi� t� run� teleportacji.
	if (Npc_HasItems (hero, ItMiNugget)>=300)
	{
    AI_Output (self, other ,"DIA_prin_BuyRune_03_02"); //Oto ona. Uwa�aj tylko, �eby nie pu�ci� obozu z dymem!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_03"); //Runy teleportacji z regu�y nie siej� zniszczenia.
	AI_Output (self, other ,"DIA_prin_BuyRune_03_04"); //A co ty tam wiesz! Ostro�nie z tym!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_05"); //Dobra, dobra. 
	
	CreateInvItems (self, ItArRuneTeleport_OH, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_OH, 1);
	
	B_GiveInvItems (other, self, itminugget, 300);
	
	buy_teleprt_prin = true;
	DIA_prin_BuyRune.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_prin_BuyRune_03_06"); //Umawiali�my si� na TRZYSTA bry�ek. Nie zapominaj.
	};	
};

//**************************************************************************1.6.1***************************************************************************
//========================================
//-----------------> Przegrupowania Ork�w
//========================================

INSTANCE DIA_Prin_PrzegrupowaniaOrkow (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_Prin_PrzegrupowaniaOrkow_Condition;
	information  	= DIA_Prin_PrzegrupowaniaOrkow_Info;
	permanent		= FALSE;
	description     = "Zosta�em wys�any przez Wilsona. Mam si� dowiedzie� co ustali�e�.";
};

FUNC INT DIA_Prin_PrzegrupowaniaOrkow_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Wilson_Przegrupowania_Orkow)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Prin_PrzegrupowaniaOrkow_Info()
{

	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_01"); //Zosta�em wys�any przez Wilsona. Mam si� dowiedzie� co ustali�e�.
    	AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_02"); //Najwyra�niej ostatnie manewry Ork�w nie s� przypadkowe. Chyba szykuje si� co� wi�kszego.
	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_03"); //Inwazja?
	AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_04"); //Raczej mniejszy wypad, ale i tak to gro�na sprawa. Atak z zaskoczenia mo�e doprowadzi� do �mierci wielu ludzi.
	AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_05"); //Na czele przegrupowuj�cych si� oddzia��w zauwa�y�em trzech orkowych dow�dc�w. To oni nadzoruj� ca�� akcj�.
	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_06"); //Musz� przekaza� to Wilsonowi!
	Snd_Play ("$ORC_HAPPY01");
	Wld_InsertNpc		(OrcGeneral_Move_04_Map,"WP_ADD_OW");
	Wld_InsertNpc		(OrcElite_rest,"WP_ADD_OW1");
	Wld_InsertNpc		(OrcElite_rest,"WP_ADD_OW2");

	 Info_ClearChoices (DIA_Prin_PrzegrupowaniaOrkow);
	 Info_AddChoice    (DIA_Prin_PrzegrupowaniaOrkow,"Co to do cholery by�o?",DIA_Prin_PrzegrupowaniaOrkow_ADD);
	
};

FUNC VOID DIA_Prin_PrzegrupowaniaOrkow_ADD()
  {
	AI_Output (other,self ,"DIA_Prin_PrzegrupowaniaOrkow_ADD_15_00");  //Co to do cholery by�o?
	AI_Quicklook(NON_2703_MYSLIWY,OrcGeneral_Move_04_Map);
	AI_Output (self ,other,"DIA_Prin_PrzegrupowaniaOrkow_ADD_11_01");  //Jak to co?! Orkowie! Chyba jaka� grupa op�ci�a miasto. 
	AI_Output (other,self ,"DIA_Prin_PrzegrupowaniaOrkow_ADD_15_02");  //B�dziemy z nimi walczy�?
    AI_Output (self ,other,"DIA_Prin_PrzegrupowaniaOrkow_ADD_11_03");  //A mamy jakie� inne wyj�cie?
	B_LogEntry               (PrzegrupowaniaOrkow,"Prin powiedzia�, �e Orkowie najprawdopodobniej szykuj� si� do wypadu na ziemi� ludzi. Na ich czele stoi trzech wodz�w... Podczas naszej rozmowy miasto opu�ci�y elity ork�w i genra�.");
    NON_2703_MYSLIWY.flags = NPC_FLAG_IMMORTAL;
	//B_SetPermAttitude	(OrcGeneral_Move_04_Map,	ATT_HOSTILE);
    AI_StopProcessInfos	     (self); 
  
};




//========================================
//-----------------> Przegrupowania Ork�w
//========================================

INSTANCE DIA_Prin_PO_Mapa (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_Prin_PO_Mapa_Condition;
	information  	= DIA_Prin_PO_Mapa_Info;
	permanent		= FALSE;
	important       = TRUE;
};

FUNC INT DIA_Prin_PO_Mapa_Condition()
{
	if (Npc_IsDead (OrcGeneral_Move_04_Map)) 
	&& (Npc_KnowsInfo (hero, DIA_Prin_PrzegrupowaniaOrkow)) 
	&& (Npc_HasItems  (other, ItWr_Map_Przegrupowania) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Prin_PO_Mapa_Info()
{

	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_00"); //Twarde sztuki, ten jeden wygl�da mi na orkowego genera�a. Znalaz�e� co� przy nim?

    AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_01"); //Tak, mia� przy sobie jak�� map�...
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_02"); //Poka� mi j�.
	
	
	B_GiveInvItems (other,self,ItWr_Map_Przegrupowania,1);
	B_UseFakeScroll();
	
	
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_03"); //Ahh tak... Nie wygl�da to zbyt dobrze... Wspomina�em wcze�niej o 3 przegrupowywuj�cych si� oddzia�ach.
	
	AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_04"); //I?
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_05"); //Na mapie s� zaznaczone trzy punkty, chyba wiesz co mam na my�li... We� j� i poka� Wilsonowi.
	B_GiveInvItems (self,other,ItWr_Map_Przegrupowania,1);
    AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_06"); //Niech b�dzie, do zobaczenia w obozie.
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_07"); //Nie daj si� zabi�.

     B_LogEntry               (PrzegrupowaniaOrkow,"Przy jednym z ork�w znalaz�em jak�� map�. Prin powiedzia�, �e to najprawdopodobniej punkty w kt�rych zosta�y rozmieszczone hordy ork�w. Musz� jak najszybciej powiadomi� Wilsona...");
	 Npc_ExchangeRoutine(NON_2703_MYSLIWY,"Start");
	 AI_StopProcessInfos	     (self); 
};

instance dia_prin_pickpocket(c_info) {
    npc = non_2703_mysliwy;
    nr = 900;
    condition = dia_prin_pickpocket_condition;
    information = dia_prin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_prin_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_prin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_prin_pickpocket);
	info_addchoice(dia_prin_pickpocket, dialog_back, dia_prin_pickpocket_back);
	info_addchoice(dia_prin_pickpocket, dialog_pickpocket, dia_prin_pickpocket_doit);
};

func void dia_prin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_prin_pickpocket);
};

func void dia_prin_pickpocket_back() {
    info_clearchoices(dia_prin_pickpocket);
};



