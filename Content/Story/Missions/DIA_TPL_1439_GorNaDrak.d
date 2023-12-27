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
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Cze��! Dok�d si� wybieracie?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Cze��! Dok�d si� wybieracie?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Zabieramy wydzielin� pe�zaczy zdobyt� przez naszych braci w Starej Kopalni do Cor Kaloma.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Codziennie udajemy si� do kopalni po now� porcj� wydzieliny.
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
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Pozyskujemy j� z wn�trzno�ci pe�zaczy. Przy odrobinie ostro�no�ci mo�na wyci�� ich gruczo�y jadowe.
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
	description  = "Mo�esz mnie nauczy� pozyskiwa� wydzielin� pe�zaczy?";
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
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Mo�esz mnie nauczy� pozyskiwa� wydzielin� pe�zaczy?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Oczywi�cie! Natychmiast po zabiciu potwora wytnij jego gruczo�y jadowe. Tylko pod �adnym pozorem nie wolno ci ich uszkodzi�!
	
	PrintScreen	("Nowa umiej�tno��: Wycinanie wn�trzno�ci pe�zaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Jak usuwa� wn�trzno�ci pe�zaczy.");
};

// **************************************************
//			 	Wof�r ist Sekret da?
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
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Z tego co wiem, przyrz�dza z nich nap�j, kt�ry zwi�ksza magiczne zdolno�ci Nowicjuszy.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Przygotowujemy si� teraz do wielkiego przyzwania, wi�c potrzebujemy jak najwi�cej tej wydzieliny.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Przy pomocy tego napoju Nowicjusze przywo�aj� �ni�cego.
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
	description  = "Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?";
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
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Niestety! Nasi my�liwi poluj� na pe�zacze dniem i noc�, ale wci�� nie mamy do�� wydzieliny.
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
   description	= "Co wiesz o waszej wsp�pracy ze Stra�nikami?";
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
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_01"); //Co wiesz o waszej wsp�pracy ze Stra�nikami?
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_02"); //Co? Nic o tym nie s�ysza�em. Ja tylko odbieram dostawy wydzieliny.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_03"); //Zaczekaj. Przypomnia�o mi si�, �e jeszcze kilka dni temu do kopalni uda� si� pos�aniec z Bractwa.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_04"); //Zapyta�em go, jak� wiadomo�� niesie. Odpowiedzia�, �e to jakie� nowe postanowienie.
    AI_Output (self, other ,"DIA_GorNaDrak_SZPIEG_03_05"); //Przypuszczam, �e by�a to wiadomo�� do Iana.
    AI_Output (other, self ,"DIA_GorNaDrak_SZPIEG_15_06"); //Ta informacja by�a bardzo pomocna.
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
   description	= "Podobno widzia�e� Brago...";
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
    AI_Output (other, self ,"DIA_GorNaDrak_BRAGO_15_01"); //Podobno widzia�e� Brago gdy opuszcza� Bractwo. Mo�e wiesz dok�d si� uda�.
    AI_Output (self, other ,"DIA_GorNaDrak_BRAGO_03_02"); //Na moje oko zmierza� w stron� Nowego Obozu. To miejsce pasuje dla tego zapijaczonego cwaniaka. 
    AI_Output (other, self ,"DIA_GorNaDrak_BRAGO_15_03"); //Dzi�ki, nawet nie wiesz jak bardzo mi pomog�e�.
	AI_Output (self, other ,"DIA_GorNaDrak_BRAGO_03_04"); //Niechaj �ni�cy ci� prowadzi.
	
	 B_LogEntry                     (ZlodziejskaWspolpraca,"Rozmawia�em z Gor Na Drakiem. Twierdzi, �e Brago pospiesznie zmierza� w stron� Nowego Obozu. Ten dra� na pewno si� tam ukrywa.");
	
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
   description	= "Witaj. Czy wracaj�c do obozu...";
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
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_01"); //Witaj. Czy wracaj�c do obozu mija�e� grup� nowicjuszy oddalaj�cych si� z obozu?
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_02"); //Tak. Co dziwne na m�j widok oraz towarzysz�cych mi stra�nik�w skr�cili w stron� lasu.
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_03"); //Wygl�dali na dziwnie sp�oszonych.
	AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_04"); //Bo to zwykli z�odzieje. Ukradli pewne cenne kryszta�y Baalowi Cadarowi.
	AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_05"); //Hmmm... To wszystko wyja�nia. 
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_06"); //S�dzisz, �e dalej tam s�?
    AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_07"); //By� mo�e. Zapewne czekaj� a� nadejdzie zmrok i przekradn� si� do starego obozu.
	AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_08"); //W porz�dku. Zatem wracam do Baala Cadara. Dzi�ki za informacje.
	AI_Output (self, other ,"DIA_GorNaDrak_Lepkie_Rece_03_09"); //Nie ma sprawy Baalu. Dopadnijcie tych gnojk�w i niech cierpi� za sw�j wyst�pek!
    AI_Output (other, self ,"DIA_GorNaDrak_Lepkie_Rece_15_10"); //Mo�esz na to liczy�. Do zobaczenia.  
	 B_LogEntry                     (LepkieReceNowicjuszy,"Gor Na Drak twierdzi, �e umykaj�cy Nowicjusze-z�odzieje na widok Stra�nik�w �wi�tynnych uciekli w stron� lasu. Je�li nie wytrzebi� ich mieszkaj�ce tam wilki to MY powinni�my to zrobi�. I oczywi�cie przy okazji odzyska� magiczne kryszta�y. Musz� pom�wi� z Baalem Cadarem.");
	
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
   description	= "Przys�a� mnie Gor Na Toth. Widz� �e zrobi�o si� nie za ciekawie...";
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
    AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_15_01"); //Przys�a� mnie Gor Na Toth. Widz� �e zrobi�o si� nie ciekawie...
    AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_03_02"); //Jeszcze troch� I by�oby po mnie.
    AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_15_03"); //Czy zdo�a�e� co� ustali�.
    AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_03_04"); //Jest ich wielu I maj� dow�dc�, kt�ry wszystko nadzoruje. S� trzy odzia�y.
	B_LogEntry               (Blokada,"Uda�o si�. Ocali�em �ycie Gor Na Drakowi I mog� wr�ci� z satysfakcj� do Gor Na Totha.");
	
	
    Info_ClearChoices   (DIA_GorNaDrak_BlokadaL);
    Info_AddChoice		(DIA_GorNaDrak_BlokadaL, "Wracajmy do obozu. Musz� rozm�wi� si� z Gor Na Tothem.", DIA_GorNaDrak_BlokadaL_Wracajmy);
    Info_AddChoice		(DIA_GorNaDrak_BlokadaL, "Gdzie znajd� tego dow�dc�?", DIA_GorNaDrak_BlokadaL_Dowodca);
	


};

FUNC VOID DIA_GorNaDrak_BlokadaL_Wracajmy()
{
AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_Wracajmy_15_01"); //Wracajmy do obozu. Musz� rozm�wi� si� z Gor Na Tothem.
Npc_ExchangeRoutine(TPL_1439_GorNaDrak,"FMTaken");
AI_StopProcessInfos	(self);
};

FUNC VOID DIA_GorNaDrak_BlokadaL_Dowodca()
{
AI_Output (other, self ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_01"); //Gdzie znajd� tego dow�dc�?
AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_02"); //Nie jestem pewny ale widzia�em jak dw�ch z nich skr�ca�o w stron� lasu, trzymaj�c si� blisko skalnej �ciany.
AI_Output (self, other ,"DIA_GorNaDrak_BlokadaL_Dowodca_15_03"); //Mo�e to jaki� trop...
B_LogEntry               (Blokada,"Gor Na Drak twierdzi �e widzia� dw�ch stra�nik�w id�cych w stron� lasu, trzymaj�c si� blisko skalnej �ciany. Mo�e to jaki� trop do ich dow�dcy...?"); 
};








