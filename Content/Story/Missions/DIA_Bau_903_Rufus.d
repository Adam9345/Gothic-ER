//poprawione i sprawdzone - Reflide

// ************************************************************
// 			  				   EXIT 
// ************************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynosz� ci wod�.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy�a mnie Lewus. Przynosz� ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dzi�ki, stary. W g�bie mi ju� zasch�o.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju� nie zosta�o. Tylko mi nie m�w, �e znowu wszyscy zd��yli si� napi� opr�cz mnie!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogo� innego, dobra? Ja tu tylko uprawiam ry�. Na innych rzeczach si� nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najch�tniej powiedzia�bym Ry�owemu Ksi�ciuniowi, �eby sam odwala� swoj� brudn� robot�!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz? ";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To si� zdarzy�o pierwszego dnia po moim przybyciu. Lewus, jeden z oprych�w pracuj�cych dla Ry�owego Ksi�cia, podszed� do mnie i spyta� czy nie m�g�bym im pom�c na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia�em "jasne". W ko�cu by�em tu nowy i zale�a�o mi na znalezieniu sobie przyjaci�.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nast�pnego dnia, kiedy ucina�em sobie drzemk�, facet znowu si� zjawi�.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia�: "Chyba nie chcesz, �eby twoi koledzy odwalali za ciebie ca�� robot�, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia�em mu, �e jestem wyczerpany wczorajsz� prac�, i �e potrzebuj� odpoczynku. Ale on mia� to gdzie�.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z�apa� mnie za ko�nierz i ZACI�GN�� z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka� na mnie na progu mojej chaty - dop�ki nie nauczy�em si� sam wychodzi� w pole. Nie chcia�em, �eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderc�w. Lepiej trzymaj si� od nich z daleka.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 0;
	description	= "Kim jest Ry�owy Ksi���?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello)) && (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry�owy Ksi���?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By� jednym z pierwszych ludzi, kt�rzy tutaj trafili. Pomaga� w zak�adaniu Obozu i rozpocz�� upraw� ry�u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dzi� jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T�usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rufus
// Rozdzia� 2
// Bunt zbieraczy
///////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
//		Rebel Started
//////////////////////////////////////////

INSTANCE DIA_Rufus_Rebel (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Rebel_Condition;
   information  = DIA_Rufus_Rebel_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_Rebel_Condition()
{
    if (Mod_Story_RunRebelInNC == TRUE) && (MIS_BuntZbieraczy != LOG_SUCCESS) && (!Npc_KnowsInfo(hero, DIA_Lefty_AbouRebelion))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_Rebel_Info()
{
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_01"); //Dobrze ci� widzie�! Masz okazj� by� �wiadkiem wielkich zmian! Rewolucja!
    AI_Output (other, self ,"DIA_Rufus_Rebel_15_02"); //Co tutaj si� dzieje?
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_03"); //Nadszed� czas wyr�wna� rachunki i ukr�ci� ten wyzysk!
    AI_Output (self, other ,"DIA_Rufus_Rebel_03_04"); //Postanowili�my postawi� si� tyranii! Przy��cz si� do nas i przechyl szal� zwyci�stwa na nasz� korzy��.
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_05"); //W jaki spos�b mia�bym wam pom�c?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_06"); //Nie jestem jeszcze pewien czy mog� ci� wprowadzi� w szczeg�y. Sk�d mam wiedzie�, �e nie stoisz po stronie Lewusa?
	AI_Output (other, self ,"DIA_Rufus_Rebel_15_07"); //Za��my, �e nie jestem. Co mia�bym zrobi�, �eby ci to udowodni�?
	AI_Output (self, other ,"DIA_Rufus_Rebel_03_08"); //Poka�, �e masz jaja. Podejd� do Lewusa i powiedz mu jakim jest sukinsynem. Poka�, �e si� go nie boisz!
	
	Quest_GiveOffense = LOG_RUNNING;
	
	if (MIS_BuntZbieraczy != LOG_RUNNING) || (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	MIS_BuntZbieraczy = LOG_RUNNING;
	Log_CreateTopic     (CH1_BuntZbieraczy, LOG_MISSION);
    Log_SetTopicStatus  (CH1_BuntZbieraczy, LOG_RUNNING);
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa� mi, abym przy��czy� si� do rebelii po stronie buntownik�w. Aby udowodni� swoj� lojalno�� mam zwymy�la� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	}
	else if (MIS_BuntZbieraczy == LOG_RUNNING)
	{
	B_LogEntry    		(CH1_BuntZbieraczy,"Rufus zaproponowa� mi, abym przy��czy� si� do rebelii po stronie buntownik�w. Aby udowodni� swoj� lojalno�� mam zwymy�la� Lewusa. Wci�� jeszcze mog� wybra�, po kt�rej stronie konfliktu si� opowiem.");
	};
   
};

/////////////////////////////////////////////////
//		Got offence to Lefty
////////////////////////////////////////////////

INSTANCE DIA_Rufus_GotOffenceToLefty (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_GotOffenceToLefty_Condition;
   information  = DIA_Rufus_GotOffenceToLefty_Info;
   permanent	= FALSE;
   description	= "Wygarn��em Lewusowi.";
};

FUNC INT DIA_Rufus_GotOffenceToLefty_Condition()
{
    if (Quest_GiveOffense == LOG_SUCCESS) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_GotOffenceToLefty_Info()
{
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_01"); //Wygarn��em Lewusowi.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_02"); //S�ysza�em! Przez chwil� w og�le nie wiedzia� co ci odpowiedzie�.
	AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_03"); //Raczej nie zostaniecie ju� przyjaci�mi. Powiem ci wi�c co dalej.
    AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_03"); //Zamieniam si� w s�uch.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_04"); //Przysz�a kolej na sprawdzenie lojalno�ci naszych ludzi. Tak si� sk�ada, �e mam co do jednego z naszych pewne podejrzenia.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_05"); //Wszyscy wo�aj� na niego Mglisty. Widzia�em jak chwil� temu rozmawia� z jednym ze Szkodnik�w przy bramie. 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_06"); //Widzisz? Wci�� tam jest! Pozb�d� si� go. Nie mo�emy ryzykowa�.
	AI_Output (other, self ,"DIA_Rufus_GotOffenceToLefty_15_07"); //Mam go tak po prostu zabi� przy jego prawdopodobnych sojusznikach? 
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_07"); //Musisz mie� odpowiedni pretekst. Zanim go zaatakujesz krzyknij, �e mia� ci odda� d�ugi lub co� takiego.
    AI_Output (self, other ,"DIA_Rufus_GotOffenceToLefty_03_08"); //Ci mordercy jeszcze zaczn� ci klaska� za darmow� rozrywk�.
	
	Quest_ChceckLoyality = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus podejrzewa jednego ze Zbieraczy o zdrad�. Go�� nazywa si� Mglisty i mam si� go pozby�. Rozmawia teraz ze Szkodnikiem stoj�cym przy bramie do obozu.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////
//		Killed Foggy
////////////////////////////////////////////////

INSTANCE DIA_Rufus_KilledFoggy (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 2;
   condition    = DIA_Rufus_KilledFoggy_Condition;
   information  = DIA_Rufus_KilledFoggy_Info;
   permanent	= FALSE;
   description	= "Zabi�em Mglistego.";
};

FUNC INT DIA_Rufus_KilledFoggy_Condition()
{
    if (Quest_ChceckLoyality == LOG_SUCCESS) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_KilledFoggy_Info()
{
    AI_Output (other, self ,"DIA_Rufus_KilledFoggy_15_01"); //Zabi�em Mglistego.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_02"); //Wiem, jego �mier� by�a zb�dna. Jak mog�em si� tak pomyli�...
	AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_03"); //Musimy dzia�a� dalej. Swego czasu um�wi�em si� z pewnym Kretem z Wolnej Kopalni, �e b�dzie zbiera� dla nas bro�.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_04"); //Wiem. Bro� mia�a by� sk�adowana w skrzyni w jednej z chat w Kotle. Do skrzyni dwa klucze. Jeden mam przy sobie.
    AI_Output (self, other ,"DIA_Rufus_KilledFoggy_03_05"); //We� go, znajd� skrzyni� i przynie� nam bro�.
	
	Quest_GetWeaponsDelivery = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"W Kotle znajd� skrzyni� z broni�, kt�r� swego czasu zbiera� dla buntownik�w pewien Kret. Mam przynie�� wszystko, co tam znajd�.");

    B_GiveXP (150);
    CreateInvItems (self,ItMi_KeyFromRufus,1);
	B_GiveInvItems (self,hero, ItMi_KeyFromRufus,1);
};

/////////////////////////////////////////////////
//		Old Sword
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_OldSwords (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_OldSwords_Condition;
   information  = DIA_Rufus_OldSwords_Info;
   permanent	= FALSE;
   description	= "Mam bro� i notatk�.";
};

FUNC INT DIA_Rufus_OldSwords_Condition()
{
    if (Quest_GetWeaponsDelivery == LOG_RUNNING) && (MIS_BuntZbieraczy == LOG_RUNNING) && (Rebel_HerosBoss == Boss_Rufus) && (Npc_HasItems (hero,ItMi_NoteFromSenyan) == 1) && (Npc_HasItems (hero,ItMw_1H_Sword_Old_01) >= 8)  && (Npc_HasItems (hero,ItMwPickaxe) >= 5) && (Npc_HasItems (hero,ItMw_1H_Sledgehammer_01) >= 2) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_OldSwords_Info()
{
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_01"); //Mam bro� i notatk�.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_02"); //Doskonale. Ju� si� ba�em, �e nie uda ci si� znale�� skrzyni albo, �e kto� j� spl�druje.
    AI_Output (other, self ,"DIA_Rufus_OldSwords_15_03"); //Nie jestem pewien czy by�o w niej co� wartego spl�drowania.
    AI_Output (self, other ,"DIA_Rufus_OldSwords_03_04"); //C�, musimy wzi�� to co jest. Po�� to tutaj. Wkr�tce rozdam bro� buntownikom.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_05"); //Podczas twojej nieobecno�ci uknu�em pewn� intryg�.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_06"); //Chcia�bym, �eby� zdoby� dla nas kilka butelek specjalnego alkoholu od Jeremiasza.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_07"); //Tu� przed atakiem 'pocz�stujesz' nim Lewusa i jego ch�optasi�w.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_08"); //To powinno nam da� cie� szans. Gdy ju� b�dziesz mia� alkohol pogadaj ze Szkodnikami.
	AI_Output (self, other ,"DIA_Rufus_OldSwords_03_09"); //Gdyby o co� pytali powiedz, �e wyr�czasz Homera. To on zazwyczaj przynosi im ry��wk� z karczmy.
	
	Quest_GetWeaponsDelivery = LOG_SUCCESS;
	Quest_GetAlcoForBandits = LOG_RUNNING;
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Rufus wymy�li� sprytny plan. Chce upi� bandzior�w specjalnym trunkiem od Jeremiasza tu� przed samym atakiem. Mam nadziej�, �e Jeremiasz zgodzi si� na taki uk�ad.");

    B_GiveXP (200);
};

/////////////////////////////////////////////////
// 	Alco delivery
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_AlcoDelivery (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_AlcoDelivery_Condition;
   information  = DIA_Rufus_AlcoDelivery_Info;
   permanent	= FALSE;
   description	= "Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.";
};

FUNC INT DIA_Rufus_AlcoDelivery_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) 
	&& (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) 
	&& (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT))
	&& (Rebel_Consequences == LeftyAndLordDeath)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_AlcoDelivery_Info()
{
    AI_Output (other, self ,"DIA_Rufus_AlcoDelivery_15_01"); //Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_02"); //Doskonale! Czas wtajemniczy� ci� w dalsz� cz�� planu.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_03"); //Teraz zosta�o nam tylko obserwowa� bandzior�w i czeka� na odpowiedni moment. Wkr�tce wszystko si� zacznie.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery_03_04"); //To ty powiniene� zrobi� pierwszy krok. Zaatakuj Lewusa. My p�jdziemy za tob�.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Podarowanie alkoholu bandziorom to pestka. Jeste�my ju� prawie gotowi. To ja powinienem zaatakowa� Lewusa.");
	AI_StopProcessInfos (self);
	
	Quest_GetAlcoForBandits = LOG_SUCCESS;
	
	Quest_KillLefty = LOG_RUNNING;
};

/////////////////////////////////////////////////
// 	Lefty Killed by Hero
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LeftyKilledByHero (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LeftyKilledByHero_Condition;
   information  = DIA_Rufus_LeftyKilledByHero_Info;
   permanent	= FALSE;
   description	= "Lewus nie �yje.";
};

FUNC INT DIA_Rufus_LeftyKilledByHero_Condition()
{
    if (Quest_KillLefty == LOG_SUCCESS) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LeftyKilledByHero_Info()
{
    AI_Output (other, self ,"DIA_Rufus_LeftyKilledByHero_15_01"); //Lewus nie �yje.
    AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_03"); //A wi�c to koniec tyranii.
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_04"); //Najwidoczniej tak.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_05"); //Kto teraz b�dzie zarz�dza� tym wszystkim?
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_06"); //Chyba pora na ciebie.
	AI_Output (self, other ,"DIA_Rufus_LeftyKilledByHero_03_02"); //My�l�, �e temu podo�am. Nie zawiod� si� na mnie.
	AI_Output (other, self ,"DIA_Rufus_LeftyKilledByHero_15_03"); //A wi�c, powodzenia.
	AI_Output (self, other ,"DIA_Rufus_LeftyKilledByHero_03_04"); //Tobie r�wnie�, trzymaj si�!
	
	AI_StopProcessInfos (self);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry          (CH1_BuntZbieraczy,"Lewus nie �yje. Zbieraczami zajmie si� Rufus. Wszystko chyba potoczy�o si� dobrze.");

	B_Story_AfterBauRebellion ();
	
	B_GiveXP (800);
	
	var c_npc rufus; rufus = Hlp_GetNpc (Bau_903_Rufus);
	Npc_ExchangeRoutine (rufus,"boss");
};

/////////////////////////////////////////////////
// 	Alco delivery 2 
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_AlcoDelivery2 (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_AlcoDelivery2_Condition;
   information  = DIA_Rufus_AlcoDelivery2_Info;
   permanent	= FALSE;
   description	= "Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.";
};

FUNC INT DIA_Rufus_AlcoDelivery2_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_VODKA)) 
	&& (Npc_KnowsInfo (hero, DIA_Schlaeger_ALCO)) 
	&& (Npc_KnowsInfo (hero, DIA_Ricelord_ALCO_BUNT)) 
	&& (Npc_KnowsInfo (hero, DIA_Lefty_ALCO_BUNT))
	&& (Rebel_Consequences == LeftyDeath)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_AlcoDelivery2_Info()
{
    AI_Output (other, self ,"DIA_Rufus_AlcoDelivery2_15_01"); //Rozda�em czysty alkohol Ry�owemu Ksi�ciu i jego oprychom.
    AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_02"); //Doskonale! My�l�, �e wkr�tce dojdzie do ostatecznej konfrontacji.
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_03"); //Zanim jednak to si� stanie, Horacy chce z tob� porozmawia�. 
	AI_Output (self, other ,"DIA_Rufus_AlcoDelivery2_03_04"); //Powiedzia�, �e to pilne i �eby� nie robi� nic zanim z nim nie pogadasz.
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rozda�em alkohol bandziorom. Rufus powiedzia� mi, �e Horacy chce pilnie ze mn� porozmawia�. Ciekawe o co mu chodzi.");
	AI_StopProcessInfos (self);
	
	Quest_GetAlcoForBandits = LOG_SUCCESS;
	
	Quest_TalkWithHoratio = LOG_RUNNING;
	
	Quest_KillLefty = LOG_FAILED;
};

/////////////////////////////////////////////////
// 	Hoartio Do Everything
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_HoratioDoEverything (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_HoratioDoEverything_Condition;
   information  = DIA_Rufus_HoratioDoEverything_Info;
   permanent	= FALSE;
   description	= "Horacy wszystkim si� zajmie.";
};

FUNC INT DIA_Rufus_HoratioDoEverything_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Horatio_KillBoth))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_HoratioDoEverything_Info()
{
    AI_Output (other, self ,"DIA_Rufus_HoratioDoEverything_15_01"); //Horacy wszystkim si� zajmie.
    AI_Output (self, other ,"DIA_Rufus_HoratioDoEverything_03_02"); //Sp�jrz! Co� zaczyna si� dzia�!
	//AI_Output (other, self ,"DIA_Rufus_HoratioDoEverything_15_03"); //Mamy pewien plan. Je�li dobrze p�jdzie, bandziory pozb�d� si� Lewusa i Ksi�cia za nas.
	//AI_Output (self, other ,"DIA_Rufus_HoratioDoEverything_03_04"); //
	
	AI_StopProcessInfos (self);
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Gdy rozmawia�em z Rufusem, zacz�o si� co� dzia�...");
	
	Npc_SetTarget (Org_846_Schlaeger, Bau_900_Ricelord);
    AI_StartState (Org_846_Schlaeger, ZS_ATTACK, 1, "");
	
	Npc_SetTarget (Org_845_Schlaeger, Org_844_Lefty);
    AI_StartState (Org_845_Schlaeger, ZS_ATTACK, 1, "");
	
	B_ChangeGuild (BAU_900_Ricelord, GIL_BDT);
	B_ChangeGuild (Org_844_Lefty, GIL_BDT);
};

/////////////////////////////////////////////////
// 	Lefty Die
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LeftyDie (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LeftyDie_Condition;
   information  = DIA_Rufus_LeftyDie_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LeftyDie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rufus_HoratioDoEverything)) && (Npc_IsDead (Org_844_Lefty)) && (Npc_IsDead (BAU_900_Ricelord))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LeftyDie_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_01"); //Nie �yj�...
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_02"); //Plan Horacego si� powi�d�. 
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_03"); //A wi�c to koniec tyranii.
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_04"); //Najwidoczniej tak.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_05"); //Kto teraz b�dzie zarz�dza� tym wszystkim?
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_06"); //Chyba pora na ciebie.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_07"); //Horacy... On powinien si� tym wszystkim zaj��. Tak b�dzie najlepiej.
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_08"); //Nie wiem jak ci dzi�kowa�. Od teraz wszystko b�dzie inaczej!
	AI_Output (other, self ,"DIA_Rufus_LeftyDie_15_09"); //Wszystko b�dzie w porz�dku...
	AI_Output (self, other ,"DIA_Rufus_LeftyDie_03_10"); //Dok�adnie! Porozmawiamy p�niej.
	
	AI_StopProcessInfos (self);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Ry�owy Ksi��� i Lewus nie �yj�. Zostali zamordowani przez w�asnych siepaczy. Plan Horacego si� powi�d�. To on zostanie nowym naczelnikiem magazynu. Rufus zrezygnowa� z przyw�dztwa. Chyba chce zn�w wr�ci� do spokojnej pracy.");

	B_Story_AfterBauRebellion ();
	
	Npc_ExchangeRoutine (BAU_901_Horatio, "boss");
	
	B_GiveXP (750);
};

/////////////////////////////////////////////////
// 	Lefty Die, Ricelord stay alive
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LeftyDieRicelordAlive (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LeftyDieRicelordAlive_Condition;
   information  = DIA_Rufus_LeftyDieRicelordAlive_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LeftyDieRicelordAlive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ricelord_Peace))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LeftyDieRicelordAlive_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_01"); //Lewus nie �yje.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_02"); //Ale Ry�owy Ksi��� tak. I przysta� na wasze warunki.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_03"); //A wi�c to koniec tyranii?
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_04"); //My�l�, �e tak. Przynajmniej na jaki� czas.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_05"); //Pozosta�o nam wraca� do pracy i liczy� na lepsze jutro.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_06"); //Ry�owy Ksi��� te� chyba wyci�gn�� z tego wszystkiego jak�� nauczk�.
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_07"); //Niech tak b�dzie. Zaraz ka�� wszystkim wr�ci� na pola. 
	AI_Output (self, other ,"DIA_Rufus_LeftyDieRicelordAlive_03_08"); //My�lisz, �e by�bym w stanie zast�pi� Lewusa.
	AI_Output (other, self ,"DIA_Rufus_LeftyDieRicelordAlive_15_09"); //My�l�, �e tak. Wszystko b�dzie w porz�dku.
	
	AI_StopProcessInfos (self);
	
	MIS_BuntZbieraczy = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_BuntZbieraczy,	LOG_SUCCESS);
	B_LogEntry                     (CH1_BuntZbieraczy,"Lewus nie �yje. Ry�owy Ksi��� wr�ci� do pracy w magazynie, a Zbieraczami zajmie si� Rufus. Wszystko chyba potoczy�o si� dobrze.");

	B_Story_AfterBauRebellion ();
	
	B_GiveXP (1000);
	
	var c_npc rufus; rufus = Hlp_GetNpc (Bau_903_Rufus);
	Npc_ExchangeRoutine (rufus,"boss");
};

/////////////////////////////////////////////////
// 	Wanna Talk
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_WannaTalk (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_WannaTalk_Condition;
   information  = DIA_Rufus_WannaTalk_Info;
   permanent	= FALSE;
   description	= "Lewus chce pertraktowa�.";
};

FUNC INT DIA_Rufus_WannaTalk_Condition()
{
    if (Quest_TalkWithRufus == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_WannaTalk_Info()
{
    AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_01"); //Lewus chce pertraktowa�.
    AI_Output (self, other ,"DIA_Rufus_WannaTalk_03_02"); //Hmm? Przystanie na warunki?
	AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_03"); //Proponuje ugod�. Dostaniecie dodatkow� porcj� mi�sa tygodniowo i nie wyci�gniemy �adnych konsekwencji od buntownik�w.
	AI_Output (other, self ,"DIA_Rufus_WannaTalk_15_04"); //Wszystko wr�ci do normy.
	AI_Output (self, other ,"DIA_Rufus_WannaTalk_03_04"); //Tfu. Nigdy!
	
	AI_StopProcessInfos (self);
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rufus odrzuci� propozycj� pokojow� Lewusa. To nie brzmi za dobrze.");
	
	Quest_TalkWithRufus = LOG_SUCCESS;
	
	Rebel_HerosBoss = Boss_Lefty;
};

/////////////////////////////////////////////////
// 	Last Fight
/////////////////////////////////////////////////

INSTANCE DIA_Rufus_LastFight (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_LastFight_Condition;
   information  = DIA_Rufus_LastFight_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rufus_LastFight_Condition()
{
    if (Quest_KillRufus == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rufus_LastFight_Info()
{
    AI_Output (self, other ,"DIA_Rufus_LastFight_03_01"); //To ty zniszczy�e� wszystko, co budowa�em! Ty pogr��y�e� wszystkich Zbieraczy!
	AI_Output (self, other ,"DIA_Rufus_LastFight_03_02"); //Ju� po tobie!
	
	self.flags = 0;
	AI_StopProcessInfos (self);
	B_ChangeGuild    (self,GIL_NONE);  
	self.guild = GIL_NONE;
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Rufus mnie zaatakowa�. C�, musz� wykona� polecenie Lewusa. To jedyne wyj�cie.");
};


//----------------------------------------------------------------------1.6.1--------------------------------------------------------------

//========================================
//-----------------> Plaga
//========================================

INSTANCE DIA_Rufus_Plaga (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Plaga_Condition;
   information  = DIA_Rufus_Plaga_Info;
   permanent	= FALSE;
   description	= "Ry�owy Ksi��e,  potrzebuje cz�owieka do pilnowania magazynu...";
};

FUNC INT DIA_Rufus_Plaga_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Ricelord_POTION_P))
&& !(Pock_Paga_Guard == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Rufus_Plaga_Info()
{
    AI_Output (other, self ,"DIA_Rufus_Plaga_15_01"); //Ry�owy Ksi��e, potrzebuje cz�owieka do pilnowania magazynu przed szczurami.
    AI_Output (self, other ,"DIA_Rufus_Plaga_03_02"); //I co z tego? Je�li mam wybiera� mi�dzy prac� na polu ry�owym a u�eraniu si� ze szczurami to wybieram pole ry�u!
    AI_Output (other, self ,"DIA_Rufus_Plaga_15_03"); // Na pewno nie dasz si� przekona�? Ry�owy Ksi��e zap�aci ci za pomoc.
    AI_Output (self, other ,"DIA_Rufus_Plaga_03_04"); //Nie ufam tej �mij. Niech sam sobie lata za szczurzyskami. 
    AI_Output (other, self ,"DIA_Rufus_Plaga_15_05"); //W takim razie pogadam z kim� innym.
	B_LogEntry               (Plaga,"Rufus woli swoj� obecn� prac� na polu ry�u. Nie b�dzie pilnowa� magazynu Ry�owego Ksi�cia.");
};

//========================================
//-----------------> Poszkodowani
//========================================

INSTANCE DIA_Rufus_Poszkodowani (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_Poszkodowani_Condition;
   information  = DIA_Rufus_Poszkodowani_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rufus_Poszkodowani_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_ORG)
{
    return TRUE;
};
};
FUNC VOID DIA_Rufus_Poszkodowani_Info()
{
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_02"); //Witaj nowy. Mo�e �wie�a krew pomo�e...
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_05"); //Jaka �wie�a krew? Do czego zmierzasz?
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_03"); //Mo�e ty znajdziesz spos�b na rozwik�anie naszej sprawy.
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_04"); //Nie do��, �e jeste�my uciskani przez Lewusa i Ry�owego Ksi�cia to mamy jeszcze jeden problem.
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_05"); //Jaki?
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_06"); //Kto� systematycznie nas okrada. Znika ruda, jedzenie i wszystko co ma jak�kolwiek warto��.
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_07"); //Co z wasz� czujno�ci�? Dajcie si� tak �atwo podej��.
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_08"); //Cz�owieku mamy mn�stwo pracy na g�owie. Ma�o czasu dla siebie. Zwykle praca i sen. Wi�c to nie nasza wina, �e jeste�my �atwym celem.
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_09"); //Co mam zrobi� z waszym problemem?
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_10"); //Popytaj ludzi na polach ry�owych o kradzie�e i og�em o ostanie wydarzenia.
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_11"); //Na pewno dowiesz si� czego� co b�dzie przydatne.
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_12"); //Dobrze ale nie za darmo.
    AI_Output (self, other ,"DIA_Rufus_Poszkodowani_03_13"); //Dostaniesz stosown� zap�at�.
    AI_Output (other, self ,"DIA_Rufus_Poszkodowani_15_14"); //No ja my�l�. Na razie.
	Log_CreateTopic		(PoszkodowaniZbieracze,	LOG_MISSION);
	Log_SetTopicStatus	(PoszkodowaniZbieracze, LOG_RUNNING);
	B_LogEntry          (PoszkodowaniZbieracze,"Rufus powiedzia� mi o kradzie�ach, kt�rych ofiar� padaj� zbieracze. Mog� odp�atnie mu pom�c. Poleci� mi bym popyta� zbieraczy o t� spraw�. Zaczn� od Horacego.");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZ_ENDE
//========================================

INSTANCE DIA_Rufus_PZ_ENDE (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_PZ_ENDE_Condition;
   information  = DIA_Rufus_PZ_ENDE_Info;
   permanent	= FALSE;
   description	= "Nie b�dziecie ju� okradani.";
};

FUNC INT DIA_Rufus_PZ_ENDE_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Lee_PZ_ENDED))
{
    return TRUE;
};
};
FUNC VOID DIA_Rufus_PZ_ENDE_Info()
{
    AI_Output (other, self ,"DIA_Rufus_PZ_ENDE_15_01"); //Nie b�dziecie ju� okradani.
    AI_Output (self, other ,"DIA_Rufus_PZ_ENDE_03_02"); //Rozwi�za�e� t� spraw�?
    AI_Output (other, self ,"DIA_Rufus_PZ_ENDE_15_03"); //Foster trzyma� z rozb�jnikami. Potem chcia� z tym sko�czy� ale oni go szanta�owali.
    AI_Output (other, self ,"DIA_Rufus_PZ_ENDE_15_04"); //Chcieli nawet by okrad� Homera zabieraj�c mu wa�ne plany fortyfikacji obozu.
    AI_Output (other, self ,"DIA_Rufus_PZ_ENDE_15_05"); //Ale wyeliminowa�em t� szajke. Ju� nikogo nie okradn�.
    AI_Output (self, other ,"DIA_Rufus_PZ_ENDE_03_06"); //Foster by� taki naiwny? Hmm mimo wszystko i tak mi go szkoda. M�ody i do piachu.
    AI_Output (self, other ,"DIA_Rufus_PZ_ENDE_03_07"); //A ty zas�u�u�e� na nagrod�. W ko�cu ci zb�jce mogli dalej pr�bowa� nas okrada�.
    AI_Output (self, other ,"DIA_Rufus_PZ_ENDE_03_08"); //We� w nagrod� te szkatu�ki. Ka�dy z nas przygotowa� co� dla osoby kt�ra rozwi��e t� spraw�.
    AI_Output (other, self ,"DIA_Rufus_PZ_ENDE_15_09"); //Dzi�ki.
	B_LogEntry           (PoszkodowaniZbieracze,"Powiedzia�em Rufusowi o Fosterze i rozb�jnikach. Zbieracz da� mi stosown� zap�at� i by� wdzi�czny za okazan� pomoc.");
	Log_SetTopicStatus	 (PoszkodowaniZbieracze, LOG_SUCCESS);
	B_GiveXP(250);
	B_GiveInvItems (self,other, ItMi_JeweleryChest_01, 6);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZEEEND
//========================================

INSTANCE DIA_Rufus_PZEEEND (C_INFO)
{
   npc          = Bau_903_Rufus;
   nr           = 1;
   condition    = DIA_Rufus_PZEEEND_Condition;
   information  = DIA_Rufus_PZEEEND_Info;
   permanent	= FALSE;
   description	= "Rozwi�za�em spraw� kradzie�y.";
};

FUNC INT DIA_Rufus_PZEEEND_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Foster_YouOldFriends))
{
    return TRUE;
};
};
FUNC VOID DIA_Rufus_PZEEEND_Info()
{
    AI_Output (other, self ,"DIA_Rufus_PZEEEND_15_01"); //Rozwi�za�em spraw� kradzie�y.
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_02"); //Niby jak?
    AI_Output (other, self ,"DIA_Rufus_PZEEEND_15_03"); //Odkry�em, �e okradali was rozb�jnicy. Razem z Gornem pozbyli�my si� ich na dobre.
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_04"); //Gorn to r�wny go�� wi�c nie bra�by udzia� w jakim� szwindlu. 
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_05"); //Skoro pozbyli�cie si� naszego problemu to powiniene� zosta� wynagrodzony. 
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_06"); //We� w nagrod� te szkatu�ki. Ka�dy z nas przygotowa� co� dla osoby kt�ra rozwi��e t� spraw�.
    B_GiveInvItems (self,other, ItMi_JeweleryChest_01, 8);    
	AI_Output (other, self ,"DIA_Rufus_PZEEEND_15_07"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_08"); //Swoj� drog� to dziwne...Nie widzia�em jaki� nowych ludzi, kt�rzy kr�cili sie wok� zbieraczy...
    AI_Output (other, self ,"DIA_Rufus_PZEEEND_15_09"); //Mo�e sami si� za nich przebrali albo za Szkodnik�w... W ka�dym razie ich z�odziejski proceder w�a�nie si� sko�czy�.
    AI_Output (self, other ,"DIA_Rufus_PZEEEND_03_10"); //I bardzo dobrze. Jeszcze raz dzi�ki.
	B_LogEntry           (PoszkodowaniZbieracze,"Pogada�em z Rufusem. Da� mi nagrod� chod� wyda�o mu si� dziwne, �e zb�je bezpo�rednio okradali Kopaczy. Wa�ne jednak, �e uzna�, �e ostatecznie to mo�liwe i przyzna� mi nagrod�. ");
	
	
    AI_StopProcessInfos	(self);
};

instance dia_rufus_pickpocket(c_info) {
    npc = bau_903_rufus;
    nr = 900;
    condition = dia_rufus_pickpocket_condition;
    information = dia_rufus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rufus_pickpocket_condition() {
	e_beklauen(baseThfChanceBAU, 18);
};

func void dia_rufus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rufus_pickpocket);
	info_addchoice(dia_rufus_pickpocket, dialog_back, dia_rufus_pickpocket_back);
	info_addchoice(dia_rufus_pickpocket, dialog_pickpocket, dia_rufus_pickpocket_doit);
};

func void dia_rufus_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_rufus_pickpocket);
};

func void dia_rufus_pickpocket_back() {
    info_clearchoices(dia_rufus_pickpocket);
};
