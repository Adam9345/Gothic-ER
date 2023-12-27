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
	description     = "Kim jesteœ?";
};

FUNC INT DIA_prin_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_prin_HELLO_Info()
{
	AI_Output (other, self ,"DIA_prin_HELLO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_prin_HELLO_03_02"); //Nazywam siê Prin. Jestem ³owc¹ orków. 
    AI_Output (other, self ,"DIA_prin_HELLO_15_03"); //Jaka jest twoja specjalizacja? Czym siê zajmujesz w obozie?
    AI_Output (self, other ,"DIA_prin_HELLO_03_04"); //Jestem traperem. Moim zadaniem s¹ zwiady, sprawdzanie terenu i tym podobne sprawy. 
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
	description   	= "Opowiedz mi o Ziemiach Orków.";
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
    AI_Output (other, self ,"DIA_prin_OrcLands_15_01"); //Opowiedz mi o Ziemiach Orków.
    AI_Output (self, other ,"DIA_prin_OrcLands_03_02"); //To dosyæ rozleg³y teren. 
    AI_Output (other, self ,"DIA_prin_OrcLands_15_03"); //Dlaczego jest tam tak niebezpiecznie?
    AI_Output (self, other ,"DIA_prin_OrcLands_03_04"); //Wszêdzie krêc¹ siê orkowe patrole, wypatruj¹ce nie wiadomo czego. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_05"); //Najwiêcej orków jest w³aœnie tutaj, przy granicy. W g³êbi nie pojawiaj¹ siê ju¿ tak licznie. Poza ich miastem, rzecz jasna.
	AI_Output (self, other ,"DIA_prin_OrcLands_03_06"); //Nie brakuje tam jednak innych bestii - brzytw i k¹saczy. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_07"); //Je¿eli mamy dobry pancerz, to k¹sacze nie s¹ zbyt wielkim zagro¿eniem. Jednak na brzytwy nale¿y szczególnie uwa¿aæ. 
	AI_Output (self, other ,"DIA_prin_OrcLands_03_08"); //Ich stado mo¿e poszarpaæ dobrego wojownika na kawa³eczki w kilka chwil. 
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
	description   	= "Czy mieszka tu ktoœ inny?";
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
	AI_Output (other, self ,"DIA_prin_SomeoneElse_15_01"); //Czy mieszka tu ktoœ inny?
    AI_Output (self, other ,"DIA_prin_SomeoneElse_03_02"); //Na Ziemiach Orków? Z pewnoœci¹! 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_03"); //Z tego co mi wiadomo nieopodal Miasta Orków nie ma nic ciekawego. Jednak ko³o bagna jest jaskinia, w której mieszka pewien Mag Ognia. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_04"); //Rozmawia³em z nim kiedyœ. Powiedzia³, ¿e szuka jakichœ kamieni przypominaj¹cych kryszta³y, czy coœ takiego.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_05"); //Rzekomo prowadzi nad nimi badania. Nie znam siê na tym, wiêc nie mia³em zamiaru mu pomagaæ. Doradzi³em tylko, ¿eby uwa¿a³. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_06"); //Jest jeszcze wielka wie¿a. Trudno j¹ przeoczyæ. W nocy s³ychaæ stamt¹d okropne dŸwiêki. Lepiej siê tam nie zapuszczaj. 
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_07"); //Ciekawym miejscem jest te¿ jezioro w pobli¿u Cytadeli. Na jego œrodku znajduje siê stara, zatopiona wie¿a. Nigdy tam nie by³em, ale czuæ stamt¹d plugaw¹ magi¹ na kilometr.
	AI_Output (self, other ,"DIA_prin_SomeoneElse_03_08"); //Tego miejsca równie¿ radzi³bym ci unikaæ.
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
	description   	= "Czy istnieje jakaœ runa teleportacji do tego miejsca?";
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
	AI_Output (other, self ,"DIA_prin_Teleport_15_01"); //Czy istnieje jakaœ runa teleportacji do tego miejsca?
    AI_Output (self, other ,"DIA_prin_Teleport_03_02"); //Ten Mag Ognia, o którym ci wspomina³em... Kiedyœ wykonywa³em dla niego pewne zlecenie. Mia³em pozbyæ siê stada brzytw, które zapêdzi³y siê w okolice jego jaskini.
	AI_Output (self, other ,"DIA_prin_Teleport_03_03"); //Gdy wykona³em zadanie, powiedzia³, ¿e nie ma dla mnie rudy. Zapyta³em wiêc, czy jest w stanie mi siê odwdziêczyæ w jakiœ inny sposób.
	AI_Output (self, other ,"DIA_prin_Teleport_03_04"); //Poprosi³em go o zbadanie dla mnie tej tajemniczej p³yty znajduj¹cej siê nad naszym obozem. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_05"); //Wiesz, jestem uczulony na sprawy magii... Chcia³em, ¿eby ktoœ obeznany sprawdzi³, czy to staro¿ytne coœ nie stanowi dla nas zagro¿enia. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_06"); //Okaza³o siê, ¿e w tym miejscu kiedyœ zogniskowano moc magiczn¹... Czy jakoœ tak... Nie znam siê na tym!
	AI_Output (self, other ,"DIA_prin_Teleport_03_07"); //W ka¿dym b¹dŸ razie mag stwierdzi³, ¿e nie stanowi to dla nas niebezpieczeñstwa. W ramach zap³aty za zlecenie przygotowa³ dla mnie kamieñ teleportacji. 
	AI_Output (self, other ,"DIA_prin_Teleport_03_08"); //Powiedzia³, ¿e mogê siê dziêki niemu bezpiecznie tu przenieœæ. Nigdy jednak z niego nie skorzysta³em... Ju¿ ci mówi³em, ¿e nie param siê magi¹.
	AI_Output (self, other ,"DIA_prin_Teleport_03_09"); //Jeœli siê nie boisz, to ci go sprzedam za równowartoœæ mojego zlecenia. To bêdzie jakieœ... 300 bry³ek rudy. Kupujesz?
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"£owca orków Prin mo¿e mi sprzedaæ runê teleportu do obozu ³owców orków za cenê 300 bry³ek rudy.");
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
	description   	= "Chcê od ciebie kupiæ tê runê teleportacji.";
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
	AI_Output (other, self ,"DIA_prin_BuyRune_15_01"); //Chcê od ciebie kupiæ tê runê teleportacji.
	if (Npc_HasItems (hero, ItMiNugget)>=300)
	{
    AI_Output (self, other ,"DIA_prin_BuyRune_03_02"); //Oto ona. Uwa¿aj tylko, ¿eby nie puœciæ obozu z dymem!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_03"); //Runy teleportacji z regu³y nie siej¹ zniszczenia.
	AI_Output (self, other ,"DIA_prin_BuyRune_03_04"); //A co ty tam wiesz! Ostro¿nie z tym!
	AI_Output (other, self ,"DIA_prin_BuyRune_15_05"); //Dobra, dobra. 
	
	CreateInvItems (self, ItArRuneTeleport_OH, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport_OH, 1);
	
	B_GiveInvItems (other, self, itminugget, 300);
	
	buy_teleprt_prin = true;
	DIA_prin_BuyRune.permanent = false;
	}
	else
	{
	AI_Output (self, other ,"DIA_prin_BuyRune_03_06"); //Umawialiœmy siê na TRZYSTA bry³ek. Nie zapominaj.
	};	
};

//**************************************************************************1.6.1***************************************************************************
//========================================
//-----------------> Przegrupowania Orków
//========================================

INSTANCE DIA_Prin_PrzegrupowaniaOrkow (C_INFO)
{
	npc          	= NON_2703_MYSLIWY;
	nr           	= 1;
	condition    	= DIA_Prin_PrzegrupowaniaOrkow_Condition;
	information  	= DIA_Prin_PrzegrupowaniaOrkow_Info;
	permanent		= FALSE;
	description     = "Zosta³em wys³any przez Wilsona. Mam siê dowiedzieæ co ustali³eœ.";
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

	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_01"); //Zosta³em wys³any przez Wilsona. Mam siê dowiedzieæ co ustali³eœ.
    AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_02"); //NajwyraŸniej ostatnie manewry Orków nie s¹ przypadkowe. Chyba szykuje siê coœ wiêkszego.
	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_03"); //Inwazja?
	AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_04"); //Raczej mniejszy wypad ale i tak to groŸna sprawa. Atak z zaskoczenia mo¿e doprowadziæ do œmierci wielu ludzi.
	AI_Output (self, other ,"DIA_Prin_PrzegrupowaniaOrkow_03_05"); //Na czele przegrupowuj¹cych siê oddzia³ów zauwa¿y³em trzech orkowych dowódców. To oni nadzoruj¹ ca³¹ akcjê.
	AI_Output (other, self ,"DIA_Prin_PrzegrupowaniaOrkow_15_06"); //Muszê przekazaæ to Wilsonowi!
	Snd_Play ("$ORC_HAPPY01");
	Wld_InsertNpc		(OrcGeneral_Move_04_Map,"WP_ADD_OW");
	Wld_InsertNpc		(OrcElite_rest,"WP_ADD_OW1");
	Wld_InsertNpc		(OrcElite_rest,"WP_ADD_OW2");

	 Info_ClearChoices (DIA_Prin_PrzegrupowaniaOrkow);
	 Info_AddChoice    (DIA_Prin_PrzegrupowaniaOrkow,"Co to do cholery by³o?",DIA_Prin_PrzegrupowaniaOrkow_ADD);
	
};

FUNC VOID DIA_Prin_PrzegrupowaniaOrkow_ADD()
  {
	AI_Output (other,self ,"DIA_Prin_PrzegrupowaniaOrkow_ADD_15_00");  //Co to do cholery by³o?
	AI_Quicklook(NON_2703_MYSLIWY,OrcGeneral_Move_04_Map);
	AI_Output (self ,other,"DIA_Prin_PrzegrupowaniaOrkow_ADD_11_01");  //Jak to co?! Orkowie! Chyba jakaœ grupa opóœci³a miasto. 
	AI_Output (other,self ,"DIA_Prin_PrzegrupowaniaOrkow_ADD_15_02");  //Bêdziemy z nimi walczyæ?
    AI_Output (self ,other,"DIA_Prin_PrzegrupowaniaOrkow_ADD_11_03");  //A mamy jakieœ inne wyjœcie?
	B_LogEntry               (PrzegrupowaniaOrkow,"Prin powiedzia³, ¿e Orkowie najprawdopodobniej szykuj¹ siê do wypadu na ziemiê ludzi. Na ich czele stoi trzech wodzów... Podczas naszej rozmowy miasto opuœci³y elity orków i genra³.");
    NON_2703_MYSLIWY.flags = NPC_FLAG_IMMORTAL;
	//B_SetPermAttitude	(OrcGeneral_Move_04_Map,	ATT_HOSTILE);
    AI_StopProcessInfos	     (self); 
  
};




//========================================
//-----------------> Przegrupowania Orków
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

	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_00"); //Twarde sztuki, ten jeden wygl¹da mi na orkowego genera³a. Znalaz³eœ coœ przy nim?

    AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_01"); //Tak, mia³ przy sobie jak¹œ mapê...
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_02"); //Poka¿ mi j¹.
	
	
	B_GiveInvItems (other,self,ItWr_Map_Przegrupowania,1);
	B_UseFakeScroll();
	
	
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_03"); //Ahh tak... Nie wygl¹da to zbyt dobrze... Wspomina³em wczeœniej o 3 przegrupowywuj¹cych siê oddzia³ach.
	
	AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_04"); //I?
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_05"); //Na mapie s¹ zaznaczone trzy punkty, chyba wiesz co mam na myœli... WeŸ j¹ i poka¿ Wilsonowi.
	B_GiveInvItems (self,other,ItWr_Map_Przegrupowania,1);
    AI_Output (other, self ,"DIA_Prin_PO_Mapa_15_06"); //Niech bêdzie, do zobaczenia w obozie.
	AI_Output (self, other ,"DIA_Prin_PO_Mapa_03_07"); //Nie daj siê zabiæ.

     B_LogEntry               (PrzegrupowaniaOrkow,"Przy jednym z orków znalaz³em jak¹œ mapê. Prin powiedzia³ ¿e to najprawdopodobniej punkty w których zosta³y rozmieszczone hordy orków. Muszê jak najszybciej powiadomiæ Wilsona...");
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



