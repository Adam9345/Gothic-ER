//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Arnold_Exit (C_INFO)
{
	npc			= NON_40034_Arnold;
	nr			= 999;
	condition	= DIA_Arnold_Exit_Condition;
	information	= DIA_Arnold_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Arnold_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Arnold_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Arnold_Hello (C_INFO)
{
	npc				= NON_40034_Arnold;
	nr				= 2;
	condition		= DIA_Arnold_Hello_Condition;
	information		= DIA_Arnold_Hello_Info;
	permanent		= 0;
	description 	= "Cavalorn ma do ciebie pewn� spraw�.";
};

FUNC INT DIA_Arnold_Hello_Condition()
{	
		if (Npc_KnowsInfo(hero,DIA_Gilbert_Guy_Spokoj)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Arnold_Hello_Info()
{
	AI_Output (other, self,"DIA_Arnold_Hello_15_00"); //Cavalorn ma do ciebie pewn� spraw�.
	AI_Output (self, other,"DIA_Arnold_Hello_03_01"); //Tak, a czego chce?
	AI_Output (other, self,"DIA_Arnold_Hello_15_02"); //Tego nie powiedzia�.
	AI_Output (self, other,"DIA_Arnold_Hello_03_03"); //Mo�e ponownie chce zaproponowa� wsp�lne polowanie.
	AI_Output (other, self,"DIA_Arnold_Hello_15_04"); //Mo�liwe.
	AI_Output (self, other,"DIA_Arnold_Hello_03_05"); //Dobra. P�jd� do niego.
	AI_Output (other, self,"DIA_Arnold_Hello_15_06"); //W porz�dku.
	Npc_ExchangeRoutine(self,"Cavalorn");
	};


// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Arnold_AdOC (C_INFO)
{
	npc				= NON_40034_Arnold;
	nr				= 2;
	condition		= DIA_Arnold_AdOC_Condition;
	information		= DIA_Arnold_AdOC_Info;
	permanent		= 0;
	important    	= TRUE;
};

FUNC INT DIA_Arnold_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Arnold_Hello))
	&& (Npc_GetDistToWP(self,"OC_ROUND_21")<5000)
	{
		return 1;
	};
};

FUNC VOID DIA_Arnold_AdOC_Info()
{
	AI_Output (other, self,"DIA_Arnold_AdOC_15_00"); //Hej. Zatrzymaj si�.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_01"); //Czego jeszcze chcesz?
	AI_Output (other, self,"DIA_Arnold_AdOC_15_02"); //Zaraz si� dowiesz GASTON!
    AI_Output (self, other,"DIA_Arnold_AdOC_03_03"); //Co! Nie wiem o kim m�wisz..!
	AI_Output (other, self,"DIA_Arnold_AdOC_15_04"); //Twoja nerwowa reakcja to kolejny dow�d na to kim jeste�.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_05"); //Nie...
    AI_Output (other, self,"DIA_Arnold_AdOC_15_06"); //Jeste� zdrajc� bractwa. Ukrad�e� cenne prastare tablice i da�e� nog�.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_07"); //�eby� wiedzia�, �e cenne...
	AI_Output (other, self,"DIA_Arnold_AdOC_15_08"); //Koniec tego dobrego! Pora na ciebie.
    AI_Output (self, other,"DIA_Arnold_AdOC_03_09"); //Nie! Zaczekaj! Pozw�l, si� wyt�umaczy�!
	
	
	
	
	
	

	Info_ClearChoices(DIA_Arnold_AdOC);
	Info_AddChoice	 (DIA_Arnold_AdOC, "(pozw�l m�wi�)" ,DIA_Arnold_AdOC_BACK);
	Info_AddChoice	 (DIA_Arnold_AdOC, "Zamknij si� i walcz!",DIA_Arnold_AdOC_Warez);

};	

func void DIA_Arnold_AdOC_BACK()
{
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_01"); //Wys�uchaj mnie. Prosz�... Wtedy wszystko zrozumiesz.
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_02"); //No to mnie o�wie�...
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_03"); //By�em dobrze zapowiadaj�cym si� Nowicjuszem w Obozie. Cieszy�em si� u Mistrz�w zaufaniem. Wr�ono mi �wietlist� �cie�k� rozwoju w Bractwie. M�g�bym zosta�...
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_04"); //Mo�esz przej�� do rzeczy? 
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_05"); //Dobrze... Studiowa�em staro�ytne pisma. Doszed�em w tym do mistrzostwa i to podoba�o si� moim nauczycielom. Wszystko by�o dobrze...
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_06"); //Do tamtego pami�tnego dnia...
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_07"); //Co si� sta�o?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_08"); //Baal Cadar wys�a� mnie w jakiej� sprawie do Cor Caloma. Ale akurat nikogo nie zasta�em w jego labolatorium.
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_09"); //Zauwa�y�em za to pewne prastare tablice. G��d wiedzy wzi�� g�r�...
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_10"); //Co by�o dalej?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_11"); //Odkry�em, �e tablice s� zapisane dziwnym pismem. Zorientowa�em si�, �e... To s� znaki Ork�w!
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_12"); //To ciekawe...
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_13"); //Nie jak to co z tego wyczyta�em...
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_14"); //Czy ja musz� wydusza� z Ciebie ka�de zdanie?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_15"); //To by�o jakie� proroctwo. Mo�na by�o wyczyta�, �e �ni�cy jest Demonem. Bractwo upadnie. A jeden z jego przyw�dc�w oka�� si� zdrajc� nie tylko Bractwa ale i ludzko�ci.  
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_16"); //Wtedy postanowi�em uda� si� z tablicami do Y'Beriona. Jednak w�w tym momencie wr�ci� Calom i zrozumia� co si� sta�o. Rozkaza� swemu Ochroniarzowi zabi� mnie.
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_17"); //Musia�em ucieka� �cigany ludzi Caloma i ukry�em si� tymczasowo w jakisni u Gilberta. A potem przysta�em do my�liwych pod fa�szywym imieniem Arnold.
	ZdrajcaGhaston1 = TRUE;
	
	
};
var int GhastonIsDead;
func void DIA_Arnold_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Arnold_AdOC_Warez_15_00"); //Zamknij si� i walcz!
	B_LogEntry          (PSI_Zdrajca,"Zabi�em Gastona, kt�ry ukrywa� si� jako Arnold. Musz� zabra� tablic� I da� je Baalowi Tondralowi.");
	GhastonIsDead = TRUE;
	NON_40034_Arnold.flags = 0;
	B_SetPermAttitude	(NON_40034_Arnold,	ATT_HOSTILE);
	AI_StopProcessInfos	(self);
};


// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Arnold_NoDeath (C_INFO)
{
	npc				= NON_40034_Arnold;
	nr				= 3;
	condition		= DIA_Arnold_NoDeath_Condition;
	information		= DIA_Arnold_NoDeath_Info;
	permanent		= 0;
	description 	= "Wierz� ci.";
};

FUNC INT DIA_Arnold_NoDeath_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Arnold_AdOC))
	&& (ZdrajcaGhaston1 == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Arnold_NoDeath_Info()
{
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_00"); //Wierz� ci.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_01"); //Dzi�kuj�. I co teraz?
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_02"); //Cor Calom jest teraz bardzo zaj�ty. Zosta�em wys�any przez Baala Tondrala. Przeka�� mu Twoje �wiadectwo. 
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_03"); //Lepiej jak si� o tym dowie, wtedy b�dziesz bezpieczny.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_04"); //To wci�� ryzykowne.
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_05"); //Obawiam si�, �e nie masz wyj�cia.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_06"); //Na to wygl�da.
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_07"); //Trzymaj si�.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_08"); //Do zobaczenia. Dzi�kuje Ci.
    Npc_ExchangeRoutine(self,"start");
	B_LogEntry               (PSI_Zdrajca,"Pozwoli�em wypowiedzie� si� Arnoldowi, czy jak kto woli Gastonowi. Okazuje si�, �e odkry� on niepokoj�ce zachowanie Cor Caloma i musia� zbiec z Bractwa w obawie o swoje �ycie. Na kamiennych tablicach spisano w j�zyku ork�w pewne z�owrogie proroctwo. Musz� pom�wi� z Baalem Tondralem.");

};	



// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Arnold_AdNC (C_INFO)
{
	npc				= NON_40034_Arnold;
	nr				= 3;
	condition		= DIA_Arnold_AdNC_Condition;
	information		= DIA_Arnold_AdNC_Info;
	permanent		= 0;
	description 		= "Rozmawia�em z Baalem Tondralem.";
};

FUNC INT DIA_Arnold_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_Ghaston_Live))
	
	{
		return 1;
	};
};

FUNC VOID DIA_Arnold_AdNC_Info()
{
	AI_Output (other, self,"DIA_Arnold_AdNC_15_00"); //Rozmawia�em z Baalem Tondralem.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_01"); //Tak? I co?
	AI_Output (other, self,"DIA_Arnold_AdNC_15_02"); //Wszystko zrozumia� i przyj��. Jeste� teraz bezpieczny.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_03"); //Jestem tak�e twoim d�u�nikiem.
	AI_Output (other, self,"DIA_Arnold_AdNC_15_04"); //Baal uzna�, �e lepiej b�dzie jak te tablice zostan� u ciebie.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_05"); //M�dry to cz�owiek. S�uszna decyzja. B�d� mia� na nie oko przez ca�y czas.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_06"); //Jeszcze raz dzi�ki.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_07"); //We� t� sk�r�, chocia� tyle mog� dla Ciebie zrobi�. Zapewne warta jest niez�� sumk�.
	B_GiveInvItems (self,other, ItAt_Shadow_01, 1);
	AI_Output (other, self,"DIA_Arnold_AdNC_15_08"); //Dzi�ki.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_09"); //Do zobaczenia.
	AI_Output (other, self,"DIA_Arnold_AdNC_15_10"); //Na razie.
	    B_LogEntry               (PSI_Zdrajca,"Powiedzia�em Gastonowi �e jest bezpieczny. On r�wnie� da� mi nagrod�. Wygl�da na to, �e ta historia dobieg�a szcz�liwego ko�ca.");
        Log_SetTopicStatus	(PSI_Zdrajca,	LOG_SUCCESS);
		B_GiveXP(500);
};	

//========================================
//-----------------> HI_AR
//========================================

INSTANCE DIA_Arnold_HI_AR (C_INFO)
{
   npc          = NON_40034_Arnold;
   nr           = 1;
   condition    = DIA_Arnold_HI_AR_Condition;
   information  = DIA_Arnold_HI_AR_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Arnold_HI_AR_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Arnold_HI_AR_Info()
{
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_02"); //Jestem Arnold. Jeden z my�liwych nale��cych do grupy Alexa.
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_03"); //D�ugo jeste� my�liwym?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_04"); //Nieszczeg�lnie. Ale lubi� ten fach i jest on do�� dochodowy. Uczy jak przetrwa� i wykorzystywa� naturalne zasoby.
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_05"); //Dlaczego zrzucono ci� do bariery?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_06"); //Pewien facet oszukiwa� w ko�ci. A ja jak narwany m�ody byk postanowi�em da� mu nauczk�.
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_07"); //Nagle rozbi� butelk� o kant sto�u I pr�bowa� mnie ni� zabi�. Chyba Beliar we mnie wst�pi��.
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_08"); //Wyrwa�em mu j� i przeci��empodci��em mu t�tnic�.
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_09"); //Gor�cy m�ody �eb i chwila upojenia alkoholowego kosztowa�a mnie wolno��.
};
var int Go_To_Bears;
var int IKnowArnold;
//========================================
//-----------------> NP_GoToMe
//========================================

INSTANCE DIA_Arnold_NP_GoToMe (C_INFO)
{
   npc          = NON_40034_Arnold;
   nr           = 1;
   condition    = DIA_Arnold_NP_GoToMe_Condition;
   information  = DIA_Arnold_NP_GoToMe_Info;
   permanent	= False;
   Important    = TRUE;
};

FUNC INT DIA_Arnold_NP_GoToMe_Condition()
{
   if (kapitel == 3)
    && (Knows_GetFur == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Arnold_NP_GoToMe_Info()
{


    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_01"); //Podejd� no bohaterze!
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_03"); //Podobno nadspodziewanie dobrze sobie radzisz. Tutaj w Kolonii to szczeg�lnie cenne.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_04"); //Od tak postanowi�e� mnie dzisiaj pochwali�?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_05"); //Nie. Mam do ciebie pewien intres. Mo�esz mi pom�c i dobrze te� zarobi�.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_06"); //A c� to zainteres?

    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_07"); //Proponuje polowanie na grubego zwierza. Ile� mo�na stercze� bez sensu w obozie?
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_08"); //Na co konkretnie chcesz polowa�?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_09"); //Na nied�wiedzie. Tylko utalentowani my�liwi si� tego podejmuj�. Wierz� w siebie. A i ty jeste� bystry.
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_10"); //We dw�ch mo�emy zapolowa� na wielkiego nied�wiedzia, mie� niez�� frajd� i bardzo dobrze zarobi� na trofeach.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_11"); //To nie b�dzie spacerek. By� mo�e sko�czy si� na trupie ale nie b�dzie to  martwy nied�wied�...
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_12"); //Wi�cej wiary! Jeste�my twardymi zawodnikami, a nie ��todziobami.
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_13"); //To jak b�dzie... Idziesz ze mn�, czy wymi�kszasz?
	IKnowArnold = TRUE;
	Info_ClearChoices(DIA_Arnold_NP_GoToMe);
	Info_AddChoice	 (DIA_Arnold_NP_GoToMe, "Nie. �ycie mi jeszcze mi�e." ,DIA_Arnold_NOILIKEBEARS);
	Info_AddChoice	 (DIA_Arnold_NP_GoToMe, "Liczba misi�w w Kolonii ulegnie redukcji.",DIA_Arnold_KILLBEARS);

	
};

FUNC VOID DIA_Arnold_NOILIKEBEARS()
{
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_01"); //Nie. �ycie mi jeszcze mi�e.
    AI_Output (self, other ,"DIA_Arnold_NOILIKEBEARS_03_02"); //C�, zachowawczo i tch�rzliwie. My�la�em, �e odwa�ny z ciebie cz�owiek. Zawiod�em si� na tobie.
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_03"); //Wol� ci� zawie�� ni� zgin�� b�d�c rozszarpany przez pot�zne w�ochate bydle.
    AI_Output (self, other ,"DIA_Arnold_NOILIKEBEARS_03_04"); //Ee... B�jdupa... C� zapoluje z kim� innym. Bywaj panie odwa�ny inaczej...
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_05"); //Przynajmniej jeszcze troch� po�yje. Trzymaj si�.
	 Info_ClearChoices(DIA_Arnold_NP_GoToMe);
	Go_To_Bears = FALSE;
    AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Arnold_KILLBEARS()
{
    AI_Output (other, self ,"DIA_Arnold_KILLBEARS_15_01"); //Liczba misi�w w Kolonii ulegnie redukcji.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_02"); //No i �wietnie! Takie podej�cie mi si� podoba.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_03"); //�mia�o�� i odwaga! Chocia� kiedy� mnie to zawiod�o... Ale mniejsza z tym.
    AI_Output (other, self ,"DIA_Arnold_KILLBEARS_15_04"); //No i co teraz?
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_05"); //Wiem mniej wiecej gdzie ten nied�wied� �eruje.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_06"); //To b�dzie trudne, ale takie wyzwania w my�listwie do czysta andrenalina.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_07"); //No i pieni�dze za trofea te� zach�caj�.

	Log_CreateTopic		(NiedzwiedziaPrzysluga,	LOG_MISSION);
	Log_SetTopicStatus	(NiedzwiedziaPrzysluga, LOG_RUNNING);
		B_LogEntry          (NiedzwiedziaPrzysluga,"My�liwy Arnold nam�wi� mnie na polowanie na nied�wiedzia. Szykuje si� trudne my�liwskie wyzwanie. Arnold ma mi pokaza� �erwisko zwierz�cia i gdy si� rozeznamy w sytuacji to uderzymy.");
	Go_To_Bears = TRUE;
	 Info_ClearChoices(DIA_Arnold_NP_GoToMe);
};

//========================================
//-----------------> Where_You_Bear
//========================================

INSTANCE DIA_Arnold_Where_You_Bear (C_INFO)
{
   npc          = NON_40034_Arnold;
   nr           = 4;
   condition    = DIA_Arnold_Where_You_Bear_Condition;
   information  = DIA_Arnold_Where_You_Bear_Info;
   permanent	= FALSE;
   description	= "Chod�my zapolowa�. Ty prowadzisz.";
};

FUNC INT DIA_Arnold_Where_You_Bear_Condition()
{
   if (Go_To_Bears == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Arnold_Where_You_Bear_Info()
{
    AI_Output (other, self ,"DIA_Arnold_Where_You_Bear_15_01"); //Chod�my zapolowa�. Ty prowadzisz.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_02"); //Dobra je�li naprawd� jeste� na to gotowy to mo�emy i��.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_03"); //I pami�taj.... Na pocz�tku zrobimy rekonesans.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_04"); //Dopiero wtedy uderzymy na zwierza. Nie mo�emy dzia�a� bezmy�lnie.
    AI_Output (other, self ,"DIA_Arnold_Where_You_Bear_15_05"); //Zgoda. Frontalny atak to �wietny spos�b na szybk� �mier�.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_06"); //A zatem w drog�.
	
	Info_ClearChoices	(DIA_Arnold_Where_You_Bear);
     Info_AddChoice		(DIA_Arnold_Where_You_Bear, "(Szybka podr�)", DIA_ArnoldFTB);
    //AI_StopProcessInfos	(self);
};
var int GotoBear;
FUNC VOID DIA_ArnoldFTB()
{
 
	 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
     Npc_ExchangeRoutine(NON_40034_Arnold,"Bears");

   GotoBear = TRUE;
    AI_StopProcessInfos	(self);
	AI_Teleport(NON_40034_Arnold,"WP_ARNOLD_ABEARS");
	AI_Teleport(hero,"WP_HERO_ABEARS");
		Wld_InsertNpc 	(BearArnold1,          "WP_ARNOLD_BEAR1");
		Wld_InsertNpc 	(BearArnold2,          "WP_ARNOLD_BEAR2");
   
};

//========================================
//-----------------> I_SEE_BEAR
//========================================

INSTANCE DIA_Arnold_I_SEE_BEAR (C_INFO)
{
   npc          = NON_40034_Arnold;
   nr           = 5;
   condition    = DIA_Arnold_I_SEE_BEAR_Condition;
   information  = DIA_Arnold_I_SEE_BEAR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arnold_I_SEE_BEAR_Condition()
{
if (GotoBear == TRUE)
//&& (Npc_KnowsInfo(hero,DIA_Arnold_Where_You_Bear))
{
    return TRUE;
};
};
FUNC VOID DIA_Arnold_I_SEE_BEAR_Info()
{
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_01"); //O cholera. Wielkie bydle ale... Wygl�da na to, �e nasz jurny kolega znalaz� sobie kole�ank�...
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_02"); //Dwa nied�wiedzie naraz. No nie�le.
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_03"); //Nie poddam si�. Musimy odci�gn�� jednego, a potem uderzymy na drugiego.
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_04"); //Inaczej rozerw� nas na strz�py.
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_05"); //Dobra spr�buje sprowokowa� pierwszego. 
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_06"); //Jak tylko padnie za�atwimy drugiego do pary. 
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_07"); //W porz�dku.
	self.aivar[AIV_PARTYMEMBER] = true;
	 Npc_ExchangeRoutine(NON_40034_Arnold,"BearsAttack");
	 B_LogEntry               (NiedzwiedziaPrzysluga," Dotarli�my na miejsce. Zamiast jednego nied�wiedzia s� dwie sztuki. Nasz nied�wied� chyba za�atwi� sobie partnerk� i bilet na tamten �wiat. Pytanie czy dla nas czy dla siebie. Pora mo�liwie pojedynczo upolowa� te wielkie zwierz�ta i oskurowa�. Nie b�dzie �atwo ale damy rad�. Dwa nied�wiedzie zostan� upolowane. B�d� musia� z odpowiedni� precyzj� �ci�gn�� z nich futra. W ko�cu chce to sprzeda� w dobrej cenie.");
};

//========================================
//-----------------> Bears_Are_Die
//========================================

INSTANCE DIA_Arnold_Bears_Are_Die (C_INFO)
{
   npc          = NON_40034_Arnold;
   nr           = 6;
   condition    = DIA_Arnold_Bears_Are_Die_Condition;
   information  = DIA_Arnold_Bears_Are_Die_Info;
   permanent	= FALSE;
   description	= "Nied�wiedzie s� martwe.";
};

FUNC INT DIA_Arnold_Bears_Are_Die_Condition()
{
if (Npc_IsDead (BearArnold1))
&& (Npc_IsDead (BearArnold2))
&& (Npc_KnowsInfo(hero,DIA_Arnold_I_SEE_BEAR))
&& (Npc_HasItems (other, ItAt_BearFur) >=2)
{
    return TRUE;
};
};
FUNC VOID DIA_Arnold_Bears_Are_Die_Info()
{
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_01"); //Nied�wiedzie s� martwe.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_02"); //Masz ich sk�ry?
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_03"); //Mam. 
	B_GiveInvItems (other,self, ItAt_BearFur, 1);
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_04"); //Prosty podzia�. Po jednej sk�ze na �eb. 
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_05"); //Mi�so i sad�o mo�esz zachowa�.
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_06"); //We� t� sk�r�.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_07"); //Dzi�ki. TerazTo warto�ciowy kawa� sk�ry.
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_08"); //Mia�e� racj�, takie wyzwania to czysta andrenalina.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_09"); //Pewnie nie lubisz rutyny... My�liwy zwykle d�ugo pod��a za zwierzyn�, ale Kolonia to ograniczony teren.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_10"); //Wi�c czasami wkrada si� nuda. Pewnie chcesz rusza� dalej. Nie b�d� ci� d�u�ej zatrzymywa�. A ko�cz�c spraw�...
	AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_11"); //Handlarz Gavilan w Kotle nie�le ci zap�aci za t� sk�r�. Sam te� musz� do niego zagl�dn��.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_12"); //Dzi�ki za pomoc.
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_13"); //Polecam si� na przysz�o��.
	Npc_ExchangeRoutine(NON_40034_Arnold,"start");
	self.aivar[AIV_PARTYMEMBER] = false;
	B_LogEntry               (NiedzwiedziaPrzysluga,"Po polowaniu rozm�wi�em si� z Arnoldem. Zgodnie z logik� ka�dy zgarn�� jedn� sk�r� dla siebie. Usatyskacjonowany �owami my�liwy poleci� mi bym sprzeda� j� Gavilanowi w Kotle pod Woln� Kopalni�. Pono� mo�na przyzwoicie zarobi�.");
    AI_StopProcessInfos	(self);
};

instance dia_arnold_pickpocket(c_info) {
    npc = non_40034_arnold;
    nr = 900;
    condition = dia_arnold_pickpocket_condition;
    information = dia_arnold_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_arnold_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_arnold_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_arnold_pickpocket);
	info_addchoice(dia_arnold_pickpocket, dialog_back, dia_arnold_pickpocket_back);
	info_addchoice(dia_arnold_pickpocket, dialog_pickpocket, dia_arnold_pickpocket_doit);
};

func void dia_arnold_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_arnold_pickpocket);
};

func void dia_arnold_pickpocket_back() {
    info_clearchoices(dia_arnold_pickpocket);
};