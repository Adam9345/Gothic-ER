// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Roger_EXIT(C_INFO)
{
	npc             = SFB_1040_Schuerfer;
	nr              = 999;
	condition	= DIA_Roger_EXIT_Condition;
	information	= DIA_Roger_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Roger_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Roger_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Roger_HELLO1 (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 1;
   condition    = DIA_Roger_HELLO1_Condition;
   information  = DIA_Roger_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Roger_HELLO1_Condition()
{
 if (Npc_GetTrueGuild(hero) == GIL_SFB)
{
    return TRUE;
};
};
FUNC VOID DIA_Roger_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_01"); //No prosz� jeste� Kretem.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_02"); //Istotnie.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_03"); //�redni wyb�r ale s� I jego dobre strony. 
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_04"); //Po ci�kiej pracy wpadnij do karczmy Silasa. Spotkasz tam inne Krety.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_05"); //Wypijecie troch� piwa I zjecie jak ludzie. Mo�e nawet, kt�ry� z ch�opak�w b�dzie mie� dla ciebie jak�� fuch�.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_06"); //Jasne zajrz� tam.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_07"); //S�usznie. Tylko nie zapominaj o robocie.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_08"); //Postaram si�.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Roger_HELLO2 (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 2;
   condition    = DIA_Roger_HELLO2_Condition;
   information  = DIA_Roger_HELLO2_Info;
   permanent	= FALSE;
   description	= "Co� ty za jeden?";
};

FUNC INT DIA_Roger_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Roger_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_01"); //Co� ty za jeden?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_02"); //Kret. Jak wi�kszo�� ,,szcz�liwc�w� pracuj�cych tutaj, to znaczy w Kotle, jak potocznie si� m�wi.
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_03"); //S�ysza�em, �e lepiej ry� za rud� w ziemi tu ni� w kopalni Gomeza ale pewnie r�nica jest niewielka.
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_04"); //Warto zosta� Kretem?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_05"); //Hahah. Nie znam ci� m�ody, ale masz �wietne poczucie humoru. 
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_06"); //Tutaj czeka ci� tylko ci�ka har�wka, z kt�rej i tak po�ytek b�d� mie� inni. 
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_07"); //Mianowicie?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_08"); //Najemnicy i Magowie. No i Szkodnicy je�li ich wcze�niej okradn�, hehe.
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_09"); //Co dzieje si� z ca�� rud�, kt�r� tu wydobywacie?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_10"); //Trafia do Obozu. Magowie wymy�lili sobie jaki� plan by rzekomo unicestwi� Barier�, i potrzebuj� do tego mn�stwa rudy.
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_11"); //Ale ja m�wi�, �e oni i Najemnicy chc� si� tylko dobrze ustawi� kosztem zwyk�ych ludzi. A ten ca�y plan to brednie...
};
//========================================
//-----------------> MINE
//========================================

INSTANCE DIA_Schuerfer_MINE (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 1;
   condition    = DIA_Schuerfer_MINE_Condition;
   information  = DIA_Schuerfer_MINE_Info;
   permanent	= FALSE;
   description	= "Mog� wej�� do waszej kopalni?";
};

FUNC INT DIA_Schuerfer_MINE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Roger_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_Schuerfer_MINE_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_MINE_15_01"); //Mog� wej�� do waszej kopalni?
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_02"); //To r�wnie prawdopodobne jak to, �e Bariera upadnie w tym tygodniu. Do Wolnej Kopalni mog� wchodzi� tylko ludzie z najwy�szym zaufaniem u Okyla a cz�sto i samego Lee.
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_03"); //Najemnicy nie chc� pozwoli� by jacy� ukryci szpiedzy Gomeza wdarli si� do �rodka i poczynili jakie� szkody lub starali si� wyw�szy� co� co mog�oby nam zaszkodzi�. A tak ju� bywa�o.
    AI_Output (other, self ,"DIA_Schuerfer_MINE_15_04"); //Jakie wa�ne osoby przebywaj� w Kotle?
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_05"); //Wiesz co, akurat nie mam �adnej butelki ry��wki przy sobie. Mo�esz mnie poratowa� z tej trudnej sytuacji?
};
//========================================
//-----------------> Booze
//========================================

INSTANCE DIA_Schuerfer_Booze (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 2;
   condition    = DIA_Schuerfer_Booze_Condition;
   information  = DIA_Schuerfer_Booze_Info;
   permanent	= FALSE;
   description	= "Prosz�, nie ma to jak ,,wykwintny� trunek.";
};

FUNC INT DIA_Schuerfer_Booze_Condition()
{
 if (Npc_HasItems (other, ItFoBooze) >=1)
 &&	(Npc_KnowsInfo(hero,DIA_Schuerfer_MINE))
{
    return TRUE;
};
};
FUNC VOID DIA_Schuerfer_Booze_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_01"); //Prosz�, nie ma to jak ,,wykwintny� trunek.
	Ai_StandUp(self);
	B_GiveInvItems (other,self, ItFoBooze, 1);
	AI_UseItem (self, ItFoBooze);

    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_02"); //Dzi�ki. Tutaj wszystkim rz�dzi Okyl. To szef ochrony Wolnej Kopalni, niezbyt mi�y ale Lee ceni go za lojalno��.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_03"); //Na czele Kret�w stoi Swiney. Niegdy� zdolny in�ynier ale teraz jest jak stary skr�t... Wypalony.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_04"); //A i wreszcie jest nasza pere�ka. Baloro. Je�li jeszcze go nie pozna�e� to lepiej tego nie zmieniaj. On uwielbia wykorzystywa� nowych.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_05"); //Udaje przyjaznego ale chc� si� tylko wzbogaci� czyim� kosztem. Kiedy� obieca� komu� wspania�y pancerz, oczywi�cie op�acony z g�ry. 
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_06"); //Ale za�atwi� jakie� brudne �achmany. A gdy jego klient si� w�ciek� to ten jeszcze obi� mu pysk.
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_07"); //Sympatyczny go��...
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_08"); //Pewnie w Kolonii jest wi�cej takich filantrop�w.
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_09"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_10"); //Poprzez wydobywanie rudy wyrobi�em krzep�. Mog� ci da� wskaz�wk� jak dodatkowo zwi�kszy� si��.
};
//========================================
//-----------------> RaiseATT
//========================================

INSTANCE DIA_Schuerfer_RaiseATT (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 3;
   condition    = DIA_Schuerfer_RaiseATT_Condition;
   information  = DIA_Schuerfer_RaiseATT_Info;
   permanent	= FALSE;
   description	= "Co to za wskaz�wka?";
};

FUNC INT DIA_Schuerfer_RaiseATT_Condition()
{
if	(Npc_KnowsInfo(hero,DIA_Schuerfer_Booze))
{
    return TRUE;
};
};
FUNC VOID DIA_Schuerfer_RaiseATT_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_RaiseATT_15_01"); //Co to za wskaz�wka?
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_02"); //Na przyk�adzie specyfiki mojej pracy znam doby trening fizyczny. Chodzi o racjonowanie swoich si� i wybieranie cel�w.
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_03"); //Przy pracy fizycznej lepiej zaczyna� od mniejszych zada� w ramach rozgrzewki. 
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_04"); //To pozwoli ci zachowa� optimum si� na cel g��wny. Gdzie ka�dorazowo staraj si� wykrzesa� z siebie odrobin� wi�cej.
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_05"); //Tak stopniowo b�dziesz przekracza� swoje dotychczasowe g�rne limity i stawa� si� bardziej wydajny.
    AI_Output (other, self ,"DIA_Schuerfer_RaiseATT_15_06"); //Wielkie dzi�ki za te rady.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
    PrintS_Ext ("Si�a + 1",COL_Lime) ;
};

//========================================
//-----------------> Grabarz
//========================================

INSTANCE DIA_Schuerfer_Grabarz (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 1;
   condition    = DIA_Schuerfer_Grabarz_Condition;
   information  = DIA_Schuerfer_Grabarz_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi powiedzie� z kim trzyma Grabarz?";
};

FUNC INT DIA_Schuerfer_Grabarz_Condition()
{
if (Npc_KnowsInfo(hero,DIA_SWINEY_CIENWMR))
{
    return TRUE;
};
};
FUNC VOID DIA_Schuerfer_Grabarz_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_Grabarz_15_01"); //Mo�esz mi powiedzie� z kim trzyma Grabarz?
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_02"); //Ciii...Chod�my kawa�ek dalej m�ody.
    AI_GotoWP(hero, "FMC_PATH08" );
    AI_GotoWP(SFB_1040_Schuerfer,"FMC_PATH08" );   
	AI_TurnToNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_03"); //To by�oby samob�jstwo gdybym ujawnia� informacje o Grabarzu pod jego nosem.
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_04"); // Bo wtedy m�j nos by�by z�amany. I kikuty r�wnie�....
    AI_Output (other, self ,"DIA_Schuerfer_Grabarz_15_05"); //Powiesz mi kto jest jego kumplem?
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_06"); //Znam kogo� kto b�dzie wiedzia� wi�cej.
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_07"); //Daj mi 30 bry�ek to ujawni� jego imi�.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Schuerfer_HELLO2 (C_INFO)
{
   npc          = SFB_1040_Schuerfer;
   nr           = 2;
   condition    = DIA_Schuerfer_HELLO2_Condition;
   information  = DIA_Schuerfer_HELLO2_Info;
   permanent	= FALSE;
   description	= "We� t� rud� wobec tego.";
};

FUNC INT DIA_Schuerfer_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Schuerfer_Grabarz))
&& (Npc_HasItems (other, ItMiNugget) >=30)
{
    return TRUE;
};
};
FUNC VOID DIA_Schuerfer_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Schuerfer_HELLO2_15_01"); //We� t� rud� wobec tego.
	B_GiveInvItems (other,self, itminugget, 30);
    AI_Output (self, other ,"DIA_Schuerfer_HELLO2_03_02"); //Niedawno zamieni�em si� miejscami w Kotle z Casprem. To Kret pracuje ni�ej - nieopodal wej�cia do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Schuerfer_HELLO2_03_03"); //Stercza� nieopodal Grabarza znacznie d�u�ej ode mnie i zapewne wie z kim ten cham przechyla flasz�. 
    AI_Output (other, self ,"DIA_Schuerfer_HELLO2_15_04"); //Dzi�ki. W takim razie musz� z nim zamieni� s�owo.
	B_LogEntry               (Cienwboku,"Kret Roger powiedzia� mi, �e jego kumpel po fachu imieniem Casper powinien wiedzie� wiele o Grabarzu. Znajd� go nieopodal bramy g��wnej do Wolnej Kopalni gdzie obecnie znajduje si� jego przydzia�.");
	
};




