//poprawione i sprawdzone -  

// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Czeœæ! Dok¹d siê wybieracie?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Czeœæ! Dok¹d siê wybieracie?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Zabieramy wydzielinê pe³zaczy zdobyt¹ przez naszych braci w Starej Kopalni do Cor Kaloma.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Codziennie udajemy siê do kopalni po now¹ porcjê wydzieliny.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Co to za wydzielina?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Co to za wydzielina?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Pozyskujemy j¹ z wnêtrznoœci pe³zaczy. Przy odrobinie ostro¿noœci mo¿na wyci¹æ ich gruczo³y jadowe.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "Mo¿esz mnie nauczyæ pozyskiwaæ wydzielinê pe³zaczy?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Mo¿esz mnie nauczyæ pozyskiwaæ wydzielinê pe³zaczy?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Oczywiœcie! Natychmiast po zabiciu potwora wytnij jego gruczo³y jadowe. Tylko pod ¿adnym pozorem nie wolno ci ich uszkodziæ!
	
	PrintScreen	("Nowa umiejêtnoœæ: Wycinanie wnêtrznoœci pe³zaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Jak usuwaæ wnêtrznoœci pe³zaczy.");
};

// **************************************************
//			 	Wofür ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Po co Cor Kalomowi ta wydzielina?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Po co Cor Kalomowi ta wydzielina?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Z tego co wiem, przyrz¹dza z nich napój, który zwiêksza magiczne zdolnoœci Nowicjuszy.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Przygotowujemy siê teraz do wielkiego przyzwania, wiêc potrzebujemy jak najwiêcej tej wydzieliny.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Przy pomocy tego napoju Nowicjusze przywo³aj¹ Œni¹cego.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "Czy macie ju¿ wystarczaj¹co du¿o napoju, by przywo³aæ Œni¹cego?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Czy macie ju¿ wystarczaj¹co du¿o napoju, by przywo³aæ Œni¹cego?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Niestety! Nasi myœliwi poluj¹ na pe³zacze dniem i noc¹, ale wci¹¿ nie mamy doœæ wydzieliny.
};

//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_GorNaDrak_SZPIEG (C_INFO)
{
   npc          = Tpl_1439_GorNaDrak;
   nr           = 1;
   condition    = DIA_GorNaDrak_SZPIEG_Condition;
   information  = DIA_GorNaDrak_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Co wiesz o waszej wspó³pracy ze Stra¿nikami?";
};

FUNC INT DIA_GorNaDrak_SZPIEG_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaDrak_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_01"); //Co wiesz o waszej wspó³pracy ze Stra¿nikami?
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_02"); //Co? Nic o tym nie s³ysza³em. Ja tylko odbieram dostawy wydzieliny.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_03"); //Zaczekaj. Przypomnia³o mi siê, ¿e jeszcze kilka dni temu do kopalni uda³ siê pos³aniec z Bractwa.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_04"); //Zapyta³em go, jak¹ wiadomoœæ niesie. Odpowiedzia³, ¿e to jakieœ nowe postanowienie.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_05"); //Przypuszczam, ¿e by³a to wiadomoœæ do Iana.
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_06"); //Ta informacja by³a bardzo pomocna.
    AI_StopProcessInfos	(self);
};

//----------------------------------------------------------------1.6.1---------------------------------------

//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_GorNaDrak_BRAGO (C_INFO)
{
   npc          = Tpl_1439_GorNaDrak;
   nr           = 1;
   condition    = DIA_GorNaDrak_BRAGO_Condition;
   information  = DIA_GorNaDrak_BRAGO_Info;
   permanent	= FALSE;
   description	= "Podobno widzia³eœ Brago...";
};

FUNC INT DIA_GorNaDrak_BRAGO_Condition()
{
   if (NAMIB_MOSULKILL == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaDrak_BRAGO_Info()
{
    AI_Output (other, self ,"DIA_GorNaDrak_BRAGO_15_01"); //Podobno widzia³eœ Brago gdy opuszcza³ Bractwo. Mo¿e wiesz dok¹d siê uda³.
    AI_Output (self, other ,"DIA_GorNaDrak_BRAGO_03_02"); //Na moje oko zmierza³ w stronê Nowego Obozu. To miejsce pasuje dla tego zapijaczonego cwaniaka. 
    AI_Output (other, self ,"DIA_GorNaDrak_BRAGO_15_03"); //Dziêki, nawet nie wiesz jak bardzo mi pomog³eœ.
	AI_Output (self, other ,"DIA_GorNaDrak_BRAGO_03_04"); //Niechaj Œni¹cy ciê prowadzi.
	
	 B_LogEntry                     (ZlodziejskaWspolpraca,"Rozmawia³em z Gor Na Drakiem. Twierdzi, ¿e Brago pospiesznie zmierza³ w stronê Nowego Obozu. Ten drañ na pewno siê tam ukrywa.");
	
    AI_StopProcessInfos	(self);
};





//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_GorNaDrak_Lepkie_Rece (C_INFO)
{
   npc          = Tpl_1439_GorNaDrak;
   nr           = 1;
   condition    = DIA_GorNaDrak_Lepkie_Rece_Condition;
   information  = DIA_GorNaDrak_Lepkie_Rece_Info;
   permanent	= FALSE;
   description	= "Witaj. Czy wracaj¹c do obozu...";
};

FUNC INT DIA_GorNaDrak_Lepkie_Rece_Condition()
{
     if (Npc_KnowsInfo (hero, DIA_BaalCadar_LepkieRece_ONED))  
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaDrak_Lepkie_Rece_Info()
{
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_01"); //Witaj. Czy wracaj¹c do obozu mija³eœ grupê nowicjuszy oddalaj¹cych siê z obozu?
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_02"); //Tak. Co dziwne na mój widok oraz towarzysz¹cych mi stra¿ników skrêcili w stronê lasu.
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_03"); //Wygl¹dali na dziwnie sp³oszonych.
	AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_04"); //Bo to zwykli z³odzieje. Ukradli pewne cenne kryszta³y Baalowi Cadarowi.
	AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_05"); //Hmmm... To wszystko wyjaœnia. 
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_06"); //S¹dzisz, ¿e dalej tam s¹?
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_07"); //Byæ mo¿e. Zapewne czekaj¹ a¿ nadejdzie zmrok i przekradn¹ siê do starego obozu.
	AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_08"); //W porz¹dku. Zatem wracam do Baala Cadara. Dziêki za informacje.
	AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_09"); //Nie ma sprawy Baalu. Dopadnijcie tych gnojków i niech cierpi¹ za swój wystêpek!
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_10"); //Mo¿esz na to liczyæ. Do zobaczenia.  
	 B_LogEntry                     (LepkieReceNowicjuszy,"Gor Na Drak twierdzi, ¿e umykaj¹cy Nowicjusze-z³odzieje na widok Stra¿ników Œwi¹tynnych uciekli w stronê lasu. Jeœli nie wytrzebi¹ ich mieszkaj¹ce tam wilki to MY powinniœmy to zrobiæ. I oczywiœcie przy okazji odzyskaæ magiczne kryszta³y. Muszê pomówiæ z Baalem Cadarem.");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BlokadaL
//========================================

INSTANCE DIA_GorNaDrak_BlokadaL (C_INFO)
{
   npc          = Tpl_1439_GorNaDrak;
   nr           = 1;
   condition    = DIA_GorNaDrak_BlokadaL_Condition;
   information  = DIA_GorNaDrak_BlokadaL_Info;
   permanent	= FALSE;
   description	= "Przys³a³ mnie Gor Na Toth. Widzê ¿e zrobi³o siê nie za ciekawie...";
};

FUNC INT DIA_GorNaDrak_BlokadaL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaS))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaDrak_BlokadaL_Info()
{
    AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_15_01"); //Przys³a³ mnie Gor Na Toth. Widzê ¿e zrobi³o siê nie ciekawie...
    AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_03_02"); //Jeszcze trochê I by³oby po mnie.
    AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_15_03"); //Czy zdo³a³eœ coœ ustaliæ.
    AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_03_04"); //Jest ich wielu I maj¹ dowódcê, który wszystko nadzoruje. S¹ trzy odzia³y.
	B_LogEntry               (Blokada,"Uda³o siê. Ocali³em ¿ycie Gor Na Drakowi I mogê wróciæ z satysfakcj¹ do Gor Na Totha.");
	
	
    Info_ClearChoices   (DIA_GorNaDrak_BlokadaL);
    Info_AddChoice		(DIA_GorNaDrak_BlokadaL, "Wracajmy do obozu. Muszê rozmówiæ siê z Gor Na Tothem.", DIA_GorNaDrak_BlokadaL_Wracajmy);
    Info_AddChoice		(DIA_GorNaDrak_BlokadaL, "Gdzie znajdê tego dowódcê?", DIA_GorNaDrak_BlokadaL_Dowodca);
	


};

FUNC VOID DIA_GorNaDrak_BlokadaL_Wracajmy()
{
AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_Wracajmy_15_01"); //Wracajmy do obozu. Muszê rozmówiæ siê z Gor Na Tothem.
Npc_ExchangeRoutine(TPL_1439_GorNaDrak,"FMTaken");
AI_StopProcessInfos	(self);
};

FUNC VOID DIA_GorNaDrak_BlokadaL_Dowodca()
{
AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_01"); //Gdzie znajdê tego dowódcê?
AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_02"); //Nie jestem pewny ale widzia³em jak dwóch z nich skrêca³o w stronê lasu, trzymaj¹c siê blisko skalnej œciany.
AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_03"); //Mo¿e to jakiœ trop...
B_LogEntry               (Blokada,"Gor Na Drak twierdzi ¿e widzia³ dwóch stra¿ników id¹cych w stronê lasu, trzymaj¹c siê blisko skalnej œciany. Mo¿e to jakiœ trop do ich dowódcy...?"); 
};








