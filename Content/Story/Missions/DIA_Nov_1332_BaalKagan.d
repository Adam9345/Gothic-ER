// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Jeste� z obozu Sekty, nieprawda�?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Jeste� z obozu Sekty, nieprawda�?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Jeste�my Bractwem �ni�cego, ale tak - pochodz� z obozu na bagnie.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Jestem Baal Kagan. Niech �ni�cy zawsze b�dzie z tob�.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tu robisz?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Pocz�tkowo przyby�em tutaj, by werbowa� nowych ludzi do naszego Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ale ci barbarzy�cy maj� w nosie swoje duchowe zbawienie. Dlatego teraz zajmuj� si� wy��cznie sprzeda�� ziela.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Palenie ziela to do�� popularne zaj�cie w tych stronach. Mo�e nawet zbyt popularne. Ledwie nad��am z kolejnymi dostawami.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Baal Kagan sprzedaje ma�e porcje ziela Szkodnikom i Najemnikom z Nowego Obozu.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Poka� mi co masz do zaoferowania.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Poka� mi co masz do zaoferowania.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak sobie �yczysz.
	B_ClearTreaderAmmo(self);
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Dlaczego nie przy�l� ci tu kogo� do pomocy?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Dlaczego nie przy�l� ci tu kogo� do pomocy?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Mia� mi pomaga� Baal Isidro, ale on woli sp�dza� ca�e dnie w karczmie na jeziorze i wymienia� swoje ziele na ry��wk�.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Obawiam si�, �e uzale�ni� si� od alkoholu. Nie mog� raczej liczy� na jego pomoc.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,	"Baal Isidro przesiaduje w karczmie na jeziorze.");	
	};
};

// ************************************************************
// 					Ich k�nnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "M�g�bym ci pom�c w sprzeda�y ziela...";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //M�g�bym ci pom�c w sprzeda�y ziela...
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Tak du�e �adunki ziela mog� powierzy� tylko innym cz�onkom Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Ale m�g�by� pom�c mi w rozdzielaniu prezent�w.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Jeszcze ca�kiem spora grupa ludzi nie mia�a okazji skosztowa� mojego towaru. Gdyby spr�bowali, chcieliby kupowa� wi�cej, czyli zyski ze sprzeda�y mog�yby wzrosn��.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //My�la�em, �e i bez tego ledwie sobie radzisz w pracy!
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Zaj��em si� ju� problemem Baala Isidro. Wys�a�em wiadomo�� do Cor Kaloma.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Co b�d� z tego mia�, je�li zgodz� si� rozdawa� twoje 'prezenty'?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Co b�d� z tego mia�, je�li zgodz� si� rozdawa� twoje "prezenty"?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Mog� ci� wynagrodzi� na kilka r�nych sposob�w.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Mog� ci podarowa� zwoje z magicznymi zakl�ciami �ni�cego.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Albo mog� pom�c ci zosta� jednym z nas, je�li zechcesz. Utrzymuj� dobre kontakty z Cor Kalomem i Baal Tyonem.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //To bliscy przyjaciele samego Y'Beriona, naszego wielkiego mistrza.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Wreszcie mog� ci zap�aci� rud�, je�li tak wolisz. 100 bry�ek powinno wystarczy�, czy� nie?
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Dobrze, daj mi to ziele. Komu mam je rozdawa�?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobrze, daj mi to ziele. Komu mam je rozdawa�?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Na pewno znajdzie si� wielu ch�tnych. Porozmawiaj z lud�mi. Tylko ka�demu z nich dawaj JEDN� porcj�.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //I jeszcze co�: je�li pozwolisz, by kto� odebra� ci ziele, albo sam je wypalisz, nasz� umow� uznam za niewa�n�.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Oczywi�cie.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints, "Nowicjusz Baal Kagan da� mi 10 porcji ziela, kt�re mam rozprowadzi� w Nowym Obozie.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Rozda�em ju� ca�e ziele.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozda�em ju� ca�e ziele.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Pierwsi klienci zacz�li si� ju� do mnie zg�asza�. Wykona�e� kawa� dobrej roboty.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Co chcesz dosta� jako wynagrodzenie?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Daj mi rud�."	,DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS, "Pom� mi dosta� si� do Bractwa."	,DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS, "Jakie zakl�cia zawieraj� te zwoje?"	,DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints, "Baal Kagan zyska� nowych klient�w, a ja dosta�em moj� nagrod�.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Nie przyszli do mnie jeszcze �adni nowi klienci. Musisz rozdzieli� jeszcze troch� ziela.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Te zwoje magiczne wydaj� si� ca�kiem interesuj�ce - jakie zakl�cia zawieraj�?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Uderzenie wiatru, Urok, Telekinez�, Pirokinez� i Sen. Mo�esz sobie wybra� trzy z nich.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Wezm� te zwoje z zakl�ciami."	,DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pom� mi dosta� si� do Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Twoja pro�ba jest bardzo skromna. Pomog� ci, tylko s�uchaj uwa�nie. Baal Tyon jest jednym z m�odszych Guru, tak jak ja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion uczyni� z niego swojego osobistego doradc�. Obawiam si�, �e to nie by�a najlepsza decyzja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Tyon sta� si� przez to tak zarozumia�y, �e nie chce ju� pomaga� nikomu opr�cz swoich uczni�w.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Daj mu to, je�li chcesz mu rozwi�za� j�zyk.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Baal Kagan da� mi specjalny Zew Nocy dla Baala Tyona. Ma mi on pom�c w dostaniu si� do Bractwa.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Wezm� 100 bry�ek rudy.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Prosz� bardzo.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Wezm� te zwoje z zakl�ciami.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //M�dra decyzja. Wybierz trzy.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Uderzenie wiatru."	,DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	AFIP_SetChoiceItem(DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust, ItArScrollWindfist);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Telekineza."	,DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	AFIP_SetChoiceItem(DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese, ItArScrollTelekinesis);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Pirokineza."	,DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	AFIP_SetChoiceItem(DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese, ItArScrollPyrokinesis);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Sen."		,DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	AFIP_SetChoiceItem(DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf, ItArScrollSleep);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Urok."		,DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
	AFIP_SetChoiceItem(DIA_BaalKagan_SUCCESS_TakeScrolls_Charme, ItArScrollCharm);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	var int AFIP_ShowItem;
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	var int AFIP_ShowItem;
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	var int AFIP_ShowItem;
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	var int AFIP_ShowItem;
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	var int AFIP_ShowItem;
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};


//========================================
//-----------------> SellZiele
//========================================

INSTANCE DIA_BaalKagan_SellZiele (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 1;
   condition    = DIA_BaalKagan_SellZiele_Condition;
   information  = DIA_BaalKagan_SellZiele_Info;
   permanent	= FALSE;
   description	= "Chcesz mo�e kupi� ziele?";
};

FUNC INT DIA_BaalKagan_SellZiele_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_Quest123))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_SellZiele_Info()
{
    AI_Output (other, self ,"DIA_BaalKagan_SellZiele_15_01"); //Chcesz mo�e kupi� ziele?
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_02"); //Ziele? Jakie?
    AI_Output (other, self ,"DIA_BaalKagan_SellZiele_15_03"); //Ten towar opracowali Nowicjusze z obozu na bagnie.
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_04"); //W takim razie: nie!
    AI_Output (other, self ,"DIA_BaalKagan_SellZiele_15_05"); //Niby czemu?
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_06"); //Ju� ja znam te ich eksperymenty z zielem i siark�.
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_07"); //Wytruj� mi po�ow� klient�w.
    AI_Output (other, self ,"DIA_BaalKagan_SellZiele_15_08"); //Ale to ziele jest inne.
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_09"); //Nie chc� s�ucha� tych bajeczek.
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_10"); //Mam swoje ziele, kt�re trzymam w szczelnie zamkni�tej skrzyni.
    AI_Output (self, other ,"DIA_BaalKagan_SellZiele_03_11"); //Nie potrzebuj� waszych wynalazk�w.
	
	B_LogEntry                     (CH1_NewWeed,"Baal Kagan nie chce kupi� ziela, gdy� woli sprzedawa� stare, kt�re przetrzymuje w skrzyni.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> nfosKey
//========================================

INSTANCE DIA_BaalKagan_nfosKey (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 2;
   condition    = DIA_BaalKagan_nfosKey_Condition;
   information  = DIA_BaalKagan_nfosKey_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalKagan_nfosKey_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_SellZiele))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_nfosKey_Info()
{
    AI_Output (self, other ,"DIA_BaalKagan_nfosKey_03_01"); //Skoro ju� tu jeste� i si� tu kr�cisz, poszukaj mojego klucza.
    AI_Output (self, other ,"DIA_BaalKagan_nfosKey_03_02"); //Przypuszczam, �e ukrad� go jeden z tych pod�ych Szkodnik�w.
    AI_Output (other, self ,"DIA_BaalKagan_nfosKey_15_03"); //Rozejrz� si� za nim.
    MIS_KeyKagan = LOG_RUNNING;

    Log_CreateTopic          (CH1_KeyKagan, LOG_MISSION);
    Log_SetTopicStatus       (CH1_KeyKagan, LOG_RUNNING);
    B_LogEntry               (CH1_KeyKagan,"Baal Kagan zgubi� gdzie� w obozie sw�j klucz do skrzyni z zielem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KeyGive
//========================================

INSTANCE DIA_BaalKagan_KeyGive (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 1;
   condition    = DIA_BaalKagan_KeyGive_Condition;
   information  = DIA_BaalKagan_KeyGive_Info;
   permanent	= FALSE;
   description	= "Mam tw�j klucz!";
};

FUNC INT DIA_BaalKagan_KeyGive_Condition()
{
    if (MIS_KeyKagan == LOG_RUNNING)
    && (Npc_HasItems (other, ItKe_Ncbaal) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_KeyGive_Info()
{
    AI_Output (other, self ,"DIA_BaalKagan_KeyGive_15_01"); //Mam tw�j klucz!
    AI_Output (self, other ,"DIA_BaalKagan_KeyGive_03_02"); //�wietnie! Kto go mia�?
    AI_Output (other, self ,"DIA_BaalKagan_KeyGive_15_03"); //Znalaz�em go na ziemi.
    AI_Output (self, other ,"DIA_BaalKagan_KeyGive_03_04"); //Co� nie mog� w to uwierzy�, ale niech ci b�dzie.
    B_LogEntry                     (CH1_KeyKagan,"Odda�em klucz w�a�cicielowi.");
    Log_SetTopicStatus       (CH1_KeyKagan, LOG_SUCCESS);
    MIS_KeyKagan = LOG_SUCCESS;
	B_GiveInvItems (other, self, ItKe_Ncbaal, 1);
	Npc_RemoveInvItems (self, ItKe_Ncbaal,1);
    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 40);
    B_GiveInvItems (self, other, ItMiNugget, 40);
};

//========================================
//-----------------> SkrzynaPelna
//========================================

INSTANCE DIA_BaalKagan_SkrzynaPelna (C_INFO)
{
   npc          = Nov_1332_BaalKagan;
   nr           = 1;
   condition    = DIA_BaalKagan_SkrzynaPelna_Condition;
   information  = DIA_BaalKagan_SkrzynaPelna_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalKagan_SkrzynaPelna_Condition()
{
    if ((Mob_HasItems ("NC_CHESTBAL", MegaJoint)) >= 1)
	&& (Npc_KnowsInfo (hero, DIA_BaalKagan_KeyGive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalKagan_SkrzynaPelna_Info()
{
    AI_Output (self, other ,"DIA_BaalKagan_SkrzynaPelna_03_01"); //Czy ty czasem nie grzeba�e� w mojej skrzyni?
    AI_Output (self, other ,"DIA_BaalKagan_SkrzynaPelna_03_02"); //Podmieni�e� te� ziele, kt�re przez przypadek wypali�em.
    AI_Output (other, self ,"DIA_BaalKagan_SkrzynaPelna_15_03"); //Eeee...
    AI_Output (self, other ,"DIA_BaalKagan_SkrzynaPelna_03_04"); //Spokojnie. Jest �wietne!
    AI_Output (self, other ,"DIA_BaalKagan_SkrzynaPelna_03_05"); //Tym razem Nowicjuszom si� uda�o.
    AI_Output (self, other ,"DIA_BaalKagan_SkrzynaPelna_03_06"); //Powiedz im, �e b�d� skupywa� ich ziele za 35 bry�ek rudy.
    B_LogEntry                     (CH1_NewWeed,"Podmieni�em ziele w skrzyni Kagana. Przez przypadek je wypali�. By� bardzo zadowolony. Mog� to przekaza� Davsonowi.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

instance dia_baalkagan_pickpocket(c_info) {
    npc = nov_1332_baalkagan;
    nr = 900;
    condition = dia_baalkagan_pickpocket_condition;
    information = dia_baalkagan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalkagan_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalkagan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalkagan_pickpocket);
	info_addchoice(dia_baalkagan_pickpocket, dialog_back, dia_baalkagan_pickpocket_back);
	info_addchoice(dia_baalkagan_pickpocket, dialog_pickpocket, dia_baalkagan_pickpocket_doit);
};

func void dia_baalkagan_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_baalkagan_pickpocket);
};

func void dia_baalkagan_pickpocket_back() {
    info_clearchoices(dia_baalkagan_pickpocket);
};
