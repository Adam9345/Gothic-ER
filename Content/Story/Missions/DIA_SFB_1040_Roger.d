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
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_01"); //No proszê jesteœ Kretem.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_02"); //Istotnie.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_03"); //Œredni wybór ale s¹ I jego dobre strony. 
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_04"); //Po ciê¿kiej pracy wpadnij do karczmy Silasa. Spotkasz tam inne Krety.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_05"); //Wypijecie trochê piwa I zjecie jak ludzie. Mo¿e nawet, któryœ z ch³opaków bêdzie mieæ dla ciebie jak¹œ fuchê.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_06"); //Jasne zajrzê tam.
    AI_Output (self, other ,"DIA_Roger_HELLO1_03_07"); //S³usznie. Tylko nie zapominaj o robocie.
    AI_Output (other, self ,"DIA_Roger_HELLO1_15_08"); //Postaram siê.
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
   description	= "Coœ ty za jeden?";
};

FUNC INT DIA_Roger_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Roger_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_01"); //Coœ ty za jeden?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_02"); //Kret. Jak wiêkszoœæ ,,szczêœliwców” pracuj¹cych tutaj, to znaczy w Kotle, jak potocznie siê mówi.
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_03"); //S³ysza³em, ¿e lepiej ryæ za rud¹ w ziemi tu ni¿ w kopalni Gomeza ale pewnie ró¿nica jest niewielka.
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_04"); //Warto zostaæ Kretem?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_05"); //Hahah. Nie znam ciê m³ody, ale masz œwietne poczucie humoru. 
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_06"); //Tutaj czeka ciê tylko ciê¿ka harówka, z której i tak po¿ytek bêd¹ mieæ inni. 
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_07"); //Mianowicie?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_08"); //Najemnicy i Magowie. No i Szkodnicy jeœli ich wczeœniej okradn¹, hehe.
    AI_Output (other, self ,"DIA_Roger_HELLO2_15_09"); //Co dzieje siê z ca³¹ rud¹, któr¹ tu wydobywacie?
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_10"); //Trafia do Obozu. Magowie wymyœlili sobie jakiœ plan by rzekomo unicestwiæ Barierê, i potrzebuj¹ do tego mnóstwa rudy.
    AI_Output (self, other ,"DIA_Roger_HELLO2_03_11"); //Ale ja mówiê, ¿e oni i Najemnicy chc¹ siê tylko dobrze ustawiæ kosztem zwyk³ych ludzi. A ten ca³y plan to brednie...
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
   description	= "Mogê wejœæ do waszej kopalni?";
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
    AI_Output (other, self ,"DIA_Schuerfer_MINE_15_01"); //Mogê wejœæ do waszej kopalni?
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_02"); //To równie prawdopodobne jak to, ¿e Bariera upadnie w tym tygodniu. Do Wolnej Kopalni mog¹ wchodziæ tylko ludzie z najwy¿szym zaufaniem u Okyla a czêsto i samego Lee.
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_03"); //Najemnicy nie chc¹ pozwoliæ by jacyœ ukryci szpiedzy Gomeza wdarli siê do œrodka i poczynili jakieœ szkody lub starali siê wywêszyæ coœ co mog³oby nam zaszkodziæ. A tak ju¿ bywa³o.
    AI_Output (other, self ,"DIA_Schuerfer_MINE_15_04"); //Jakie wa¿ne osoby przebywaj¹ w Kotle?
    AI_Output (self, other ,"DIA_Schuerfer_MINE_03_05"); //Wiesz co, akurat nie mam ¿adnej butelki ry¿ówki przy sobie. Mo¿esz mnie poratowaæ z tej trudnej sytuacji?
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
   description	= "Proszê, nie ma to jak ,,wykwintny” trunek.";
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
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_01"); //Proszê, nie ma to jak ,,wykwintny” trunek.
	Ai_StandUp(self);
	B_GiveInvItems (other,self, ItFoBooze, 1);
	AI_UseItem (self, ItFoBooze);

    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_02"); //Dziêki. Tutaj wszystkim rz¹dzi Okyl. To szef ochrony Wolnej Kopalni, niezbyt mi³y ale Lee ceni go za lojalnoœæ.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_03"); //Na czele Kretów stoi Swiney. Niegdyœ zdolny in¿ynier ale teraz jest jak stary skrêt... Wypalony.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_04"); //A i wreszcie jest nasza pere³ka. Baloro. Jeœli jeszcze go nie pozna³eœ to lepiej tego nie zmieniaj. On uwielbia wykorzystywaæ nowych.
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_05"); //Udaje przyjaznego ale chcê siê tylko wzbogaciæ czyimœ kosztem. Kiedyœ obieca³ komuœ wspania³y pancerz, oczywiœcie op³acony z góry. 
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_06"); //Ale za³atwi³ jakieœ brudne ³achmany. A gdy jego klient siê wœciek³ to ten jeszcze obi³ mu pysk.
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_07"); //Sympatyczny goœæ...
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_08"); //Pewnie w Kolonii jest wiêcej takich filantropów.
    AI_Output (other, self ,"DIA_Schuerfer_Booze_15_09"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Schuerfer_Booze_03_10"); //Poprzez wydobywanie rudy wyrobi³em krzepê. Mogê ci daæ wskazówkê jak dodatkowo zwiêkszyæ si³ê.
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
   description	= "Co to za wskazówka?";
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
    AI_Output (other, self ,"DIA_Schuerfer_RaiseATT_15_01"); //Co to za wskazówka?
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_02"); //Na przyk³adzie specyfiki mojej pracy znam doby trening fizyczny. Chodzi o racjonowanie swoich si³ i wybieranie celów.
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_03"); //Przy pracy fizycznej lepiej zaczynaæ od mniejszych zadañ w ramach rozgrzewki. 
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_04"); //To pozwoli ci zachowaæ optimum si³ na cel g³ówny. Gdzie ka¿dorazowo staraj siê wykrzesaæ z siebie odrobinê wiêcej.
    AI_Output (self, other ,"DIA_Schuerfer_RaiseATT_03_05"); //Tak stopniowo bêdziesz przekracza³ swoje dotychczasowe górne limity i stawa³ siê bardziej wydajny.
    AI_Output (other, self ,"DIA_Schuerfer_RaiseATT_15_06"); //Wielkie dziêki za te rady.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
    PrintS_Ext ("Si³a + 1",COL_Lime) ;
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
   description	= "Mo¿esz mi powiedzieæ z kim trzyma Grabarz?";
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
    AI_Output (other, self ,"DIA_Schuerfer_Grabarz_15_01"); //Mo¿esz mi powiedzieæ z kim trzyma Grabarz?
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_02"); //Ciii...ChodŸmy kawa³ek dalej m³ody.
    AI_GotoWP(hero, "FMC_PATH08" );
    AI_GotoWP(SFB_1040_Schuerfer,"FMC_PATH08" );   
	AI_TurnToNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_03"); //To by³oby samobójstwo gdybym ujawnia³ informacje o Grabarzu pod jego nosem.
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_04"); // Bo wtedy mój nos by³by z³amany. I kikuty równie¿....
    AI_Output (other, self ,"DIA_Schuerfer_Grabarz_15_05"); //Powiesz mi kto jest jego kumplem?
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_06"); //Znam kogoœ kto bêdzie wiedzia³ wiêcej.
    AI_Output (self, other ,"DIA_Schuerfer_Grabarz_03_07"); //Daj mi 30 bry³ek to ujawniê jego imiê.
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
   description	= "WeŸ tê rudê wobec tego.";
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
    AI_Output (other, self ,"DIA_Schuerfer_HELLO2_15_01"); //WeŸ tê rudê wobec tego.
	B_GiveInvItems (other,self, itminugget, 30);
    AI_Output (self, other ,"DIA_Schuerfer_HELLO2_03_02"); //Niedawno zamieni³em siê miejscami w Kotle z Casprem. To Kret pracuje ni¿ej - nieopodal wejœcia do Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Schuerfer_HELLO2_03_03"); //Stercza³ nieopodal Grabarza znacznie d³u¿ej ode mnie i zapewne wie z kim ten cham przechyla flaszê. 
    AI_Output (other, self ,"DIA_Schuerfer_HELLO2_15_04"); //Dziêki. W takim razie muszê z nim zamieniæ s³owo.
	B_LogEntry               (Cienwboku,"Kret Roger powiedzia³ mi, ¿e jego kumpel po fachu imieniem Casper powinien wiedzieæ wiele o Grabarzu. Znajdê go nieopodal bramy g³ównej do Wolnej Kopalni gdzie obecnie znajduje siê jego przydzia³.");
	
};




