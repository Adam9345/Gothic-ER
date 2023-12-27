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
	description 	= "Cavalorn ma do ciebie pewn¹ sprawê.";
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
	AI_Output (other, self,"DIA_Arnold_Hello_15_00"); //Cavalorn ma do ciebie pewn¹ sprawê.
	AI_Output (self, other,"DIA_Arnold_Hello_03_01"); //Tak a czego chce?
	AI_Output (other, self,"DIA_Arnold_Hello_15_02"); //Tego nie powiedzia³.
	AI_Output (self, other,"DIA_Arnold_Hello_03_03"); //Kiedyœ polowaliœmy razem. Mo¿e zachcia³o mu siê powtórki.
	AI_Output (other, self,"DIA_Arnold_Hello_15_04"); //Mo¿liwe.
	AI_Output (self, other,"DIA_Arnold_Hello_03_05"); //Pójdê do niego.
	AI_Output (other, self,"DIA_Arnold_Hello_15_06"); //W porz¹dku.
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
	AI_Output (other, self,"DIA_Arnold_AdOC_15_00"); //Hej. Zatrzymaj siê.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_01"); //Czego jeszcze chcesz?
	AI_Output (other, self,"DIA_Arnold_AdOC_15_02"); //Zaraz siê dowiesz GASTON!
    AI_Output (self, other,"DIA_Arnold_AdOC_03_03"); //Co! Nie wiem o kim mówisz!
	AI_Output (other, self,"DIA_Arnold_AdOC_15_04"); //Twoja nerwowa reakcja to kolejny dowód na to kim jesteœ.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_05"); //Nie...
    AI_Output (other, self,"DIA_Arnold_AdOC_15_06"); //Jesteœ zdrajc¹ bractwa. Cz³owiekiem, który ukrad³ cenne prastare tablice i da³ nogê.
	AI_Output (self, other,"DIA_Arnold_AdOC_03_07"); //¯ebyœ wiedzia³, ¿e cenne...
	AI_Output (other, self,"DIA_Arnold_AdOC_15_08"); //Koniec tego dobrego! Pora na ciebie.
    AI_Output (self, other,"DIA_Arnold_AdOC_03_09"); //Nie zaczekaj!
	
	
	
	
	
	

	Info_ClearChoices(DIA_Arnold_AdOC);
	Info_AddChoice	 (DIA_Arnold_AdOC, "I co mi teraz niby powiesz?" ,DIA_Arnold_AdOC_BACK);
	Info_AddChoice	 (DIA_Arnold_AdOC, "Zamknij siê i walcz!",DIA_Arnold_AdOC_Warez);

};	

func void DIA_Arnold_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_00"); //I co mi teraz niby powiesz?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_01"); //Wys³uchaj mnie. Proszê... Wtedy wszystko zrozumiesz.
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_02"); //No to mnie oœwieæ...
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_03"); //By³em czo³owym Nowicjuszem w Obozie. Wró¿ono mi rych³y awans na Guru. Byli ze mnie bardzo zadowoleni. Widzia³em, ¿e mi ufaj¹.
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_04"); //Mo¿esz przejœæ do rzeczy? 
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_05"); //Dobrze... Studiowa³em staro¿ytne pisma. Doszed³em w tym do mistrzostwa i to podoba³o siê moim zwierzchnikom. I wszystko by³o dobrze...
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_06"); //Do tamtego dnia. 
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_07"); //Co siê sta³o?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_08"); //Baal Cadar wys³a³ mnie po coœ do Cor Caloma. Ale nikogo akurat nie zasta³em.
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_09"); //Zauwa¿y³em za to pewne prastare tablice. G³ód wiedzy wzi¹³ górê...
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_10"); //Co by³o dalej?
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_11"); //Odkry³em, ¿e tablice s¹ zapisane dziwnym pismem. Zorientowa³em siê, ¿e... To s¹ znaki Orków!
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_12"); //Zaskakuj¹ce!
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_13"); //Nie jak to co z tego wyczyta³em.
	AI_Output (other, self,"DIA_Arnold_AdOC_BACK_15_14"); //Co tam by³o napisane.
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_15"); //To by³o jakieœ proroctwo. Mo¿na by³o wyczytaæ, ¿e Œni¹cy jest Demonem. Bractwo upadnie. A jeden z jego przywódców oka¿ê siê zdrajc¹ nie tylko Bractwa ale i ludzkoœci.  
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_16"); //Wtedy postanowi³em udaæ siê z tablicami do Y'Beriona. Jednak w³aœnie wróci³ Calom i zrozumia³ co siê sta³o. Natychmiast nakaza³ swemu Ochroniarzowi zg³adzenie mnie.
	AI_Output (self, other,"DIA_Arnold_AdOC_BACK_03_17"); //Zbieg³em œcigany przez ludzi Caloma i ukry³em siê tymczasowo u Gilberta. A potem przysta³em do myœliwych i przedstawi³em siê jako Arnold.
    Info_ClearChoices(DIA_Arnold_AdOC);
	ZdrajcaGhaston1 = TRUE;
	
	
};
var int GhastonIsDead;
func void DIA_Arnold_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Arnold_AdOC_Warez_15_00"); //Zamknij siê i walcz!
	B_LogEntry          (PSI_Zdrajca,"Zabi³em Gastona, który ukrywa³ siê jako Arnold. Muszê zabraæ tablicê I daæ je Baalowi Tondralowi.");
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
	description 	= "Wierzê ci.";
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
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_00"); //Wierzê ci.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_01"); //Co teraz?
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_02"); //Cor Calom jest bardzo zajêty. Wys³a³ mnie Baal Tondral. Opowiem mu co siê sta³o. Lepiej jak siê o tym dowie, wtedy bêdziesz bezpieczny.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_03"); //To wci¹¿ ryzykowne.
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_04"); //Bêdzie dobrze.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_05"); //Mam nadzieje.
	AI_Output (other, self,"DIA_Arnold_NoDeath_15_06"); //Trzymaj siê.
	AI_Output (self, other,"DIA_Arnold_NoDeath_03_07"); //Do zobaczenia.
    Npc_ExchangeRoutine(self,"start");
	B_LogEntry               (PSI_Zdrajca,"Pozwoli³em wypowiedzieæ siê Arnoldowi, czy jak kto woli Gastonowi. Okazuje siê, ¿e odkry³ on niepokoj¹ce zachowanie Cor Caloma i musia³ zbiec z Bractwa w obawie o swoje ¿ycie. Na kamiennych tablicach spisano w jêzyku orków pewne z³owrogie proroctwo. Muszê pomówiæ z Baalem Tondralem.");

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
	description 		= "Rozmawia³em z Baalem Tondralem.";
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
	AI_Output (other, self,"DIA_Arnold_AdNC_15_00"); //Rozmawia³em z Baalem Tondralem.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_01"); //Tak? I jaki jest tego rezultat?
	AI_Output (other, self,"DIA_Arnold_AdNC_15_02"); //Wszystko zrozumia³. Jesteœ bezpieczny.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_03"); //Jestem twoim d³u¿nikiem.
	AI_Output (other, self,"DIA_Arnold_AdNC_15_04"); //Baal uzna³, ¿e lepiej bêdzie jak te tablice zostan¹ u ciebie.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_05"); //S³uszna decyzja. Bêdê mia³ na nie oko przez ca³y czas.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_06"); //Jeszcze raz dziêki.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_07"); //WeŸ tê skórê, Na pewno dostaniesz za ni¹ niez³¹ sumkê.
	B_GiveInvItems (self,other, ItAt_Shadow_01, 1);
	AI_Output (other, self,"DIA_Arnold_AdNC_15_08"); //Dziêki.
	AI_Output (self, other,"DIA_Arnold_AdNC_03_09"); //Do zobaczenia.
	AI_Output (other, self,"DIA_Arnold_AdNC_15_10"); //Na razie.
	    B_LogEntry               (PSI_Zdrajca,"Powiedzia³em Gastonowi ¿e jest bezpieczny. On równie¿ da³ mi nagrodê. Wygl¹da na to, ¿e ta historia dobieg³a szczêœliwego koñca.");
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Arnold_HI_AR_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Arnold_HI_AR_Info()
{
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_02"); //Jestem Arnold. Jeden z myœliwych nale¿¹cych do grupy Alexa.
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_03"); //D³ugo jesteœ myœliwym?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_04"); //Nieszczególnie. Ale lubiê ten fach I mam z tego profity. Przede wszystkim ci¹gle uczê siê jak przetrwaæ I lepiej wykorzystaæ naturalne zasoby.
    AI_Output (other, self ,"DIA_Arnold_HI_AR_15_05"); //Dlaczego zrzucono ciê pod barierê?
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_06"); //Pewien facet oszukiwa³ w koœci. A ja m³ody byczek postanowi³em daæ mu nauczkê.
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_07"); //Nagle rozbi³ butelkê o kant sto³u I próbowa³ mnie ni¹ zraniæ. Chyba Beliar we mnie wst¹pi³….
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_08"); //Wyrwa³em mu rozbit¹ butelkê I przeci¹³em ni¹ szyje.
    AI_Output (self, other ,"DIA_Arnold_HI_AR_03_09"); //Na chwilê pod wp³ywem alkoholu I g³upiej m³odoœci straci³em rozum I to kosztowa³o mnie wolnoœæ.
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


    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_01"); //PodejdŸ no bohaterze!
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_03"); //Podobno nadspodziewanie dobrze sobie radzisz. Tutaj w Kolonii to szczególnie cenne.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_04"); //Od tak postanowi³eœ mnie dzisiaj pochwaliæ?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_05"); //Nie. Mam do ciebie pewien intres. Pomo¿esz mi i zarobisz.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_06"); //Jaki¿ to interes chcesz ubiæ.

    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_07"); //Proponuje polowanie na grubego zwierza. Ile mo¿na sterczeæ bez sensu w obozie?
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_08"); //Na co konkretnie chcesz polowaæ?
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_09"); //Na niedŸwiedzie. Tylko utalentowani myœliwi siê tego podejmuj¹. A ja wierzê w siebie. A i ty ponoæ szybko ³apiesz o co chodzi.
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_10"); //We dwóch mo¿emy upolowaæ wielkiego niedŸwiedzia, mieæ frajdê i nieŸle zarobiæ na trofeach myœliwskich.
    AI_Output (other, self ,"DIA_Arnold_NP_GoToMe_15_11"); //To nie bêdzie spacerek. Byæ mo¿e skoñczy siê na trupie ale nie bêdzie to  martwy niedŸwiedŸ...
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_12"); //Wiêcej wiary! To nie bêdzie potulny miœ do przytulania ale jesteœmy twardymi facetami a nie dzieciakami...
    AI_Output (self, other ,"DIA_Arnold_NP_GoToMe_03_13"); //Wiêc krótkie pytanie... Idziesz ze mn¹ zapolowaæ?
	IKnowArnold = TRUE;
	Info_ClearChoices(DIA_Arnold_NP_GoToMe);
	Info_AddChoice	 (DIA_Arnold_NP_GoToMe, "Nie. ¯ycie mi jeszcze mi³e." ,DIA_Arnold_NOILIKEBEARS);
	Info_AddChoice	 (DIA_Arnold_NP_GoToMe, "Liczba misów w Kolonii ulegnie redukcji.",DIA_Arnold_KILLBEARS);

	
};

FUNC VOID DIA_Arnold_NOILIKEBEARS()
{
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_01"); //Nie. ¯ycie mi jeszcze mi³e.
    AI_Output (self, other ,"DIA_Arnold_NOILIKEBEARS_03_02"); //Có¿, zachowawczo i tchórzliwie. Myœla³em, ¿e odwa¿ny z ciebie cz³owiek. Zawiod³eœ mnie.
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_03"); //Lepiej ciê zawieœæ ni¿ zgin¹æ zat³uczony ciosami wielkiego i cholernie silnego niedŸwidzia.
    AI_Output (self, other ,"DIA_Arnold_NOILIKEBEARS_03_04"); //Pesymista. Có¿ zapoluje z kimœ innym. Bywaj panie odwa¿ny inaczej...
    AI_Output (other, self ,"DIA_Arnold_NOILIKEBEARS_15_05"); //Przynajmniej jeszcze trochê po¿yje. Trzymaj siê.
	 Info_ClearChoices(DIA_Arnold_NP_GoToMe);
	Go_To_Bears = FALSE;
    AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Arnold_KILLBEARS()
{
    AI_Output (other, self ,"DIA_Arnold_KILLBEARS_15_01"); //Liczba misów w Kolonii ulegnie redukcji.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_02"); //No i œwietnie! Podoba mi siê takie podejœcie.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_03"); //Œmia³oœæ i odwaga! Choæ kiedyœ mnie to zawiod³o... Ale mniejsza z tym.
    AI_Output (other, self ,"DIA_Arnold_KILLBEARS_15_04"); //No i co teraz?
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_05"); //Wiem gdzie mniej wiecej ¿eruje niedŸwiedŸ - wielki samiec. 
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_06"); //Bêdzie nam ciê¿ko. Ale nie ma nic lepszego od wygrywania takich pojedynków z natur¹.
    AI_Output (self, other ,"DIA_Arnold_KILLBEARS_03_07"); //A potencjalne trofea bardzo zachêcaj¹.

	Log_CreateTopic		(NiedzwiedziaPrzysluga,	LOG_MISSION);
	Log_SetTopicStatus	(NiedzwiedziaPrzysluga, LOG_RUNNING);
		B_LogEntry          (NiedzwiedziaPrzysluga,"Myœliwy Arnold namówi³ mnie na polowanie na niedŸwiedzia. Szykuje siê trudne myœliwskie wyzwanie. Arnold ma mi pokazaæ ¿erwisko zwierzêcia i gdy siê rozeznamy w sytuacji to uderzymy.");
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
   description	= "ChodŸmy zapolowaæ. Ty prowadzisz.";
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
    AI_Output (other, self ,"DIA_Arnold_Where_You_Bear_15_01"); //ChodŸmy zapolowaæ. Ty prowadzisz.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_02"); //Dobra skoro naprawdê jesteœ na to gotowy to mo¿emy iœæ na polowanie.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_03"); //I pamiêtaj.... Na pocz¹tku na miejscu zrobimy ogólne rozeznanie sytuacji.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_04"); //Dopiero wtedy uderzymy na zwierza. Nie mo¿na dzia³aæ bezmyœlnie.
    AI_Output (other, self ,"DIA_Arnold_Where_You_Bear_15_05"); //Zgoda. Frontalny atak natychmiast to dobry sposób na ³atw¹ œmieræ.
    AI_Output (self, other ,"DIA_Arnold_Where_You_Bear_03_06"); //A wiêc w drogê.
	
	Info_ClearChoices	(DIA_Arnold_Where_You_Bear);
     Info_AddChoice		(DIA_Arnold_Where_You_Bear, "(Szybka podró¿)", DIA_ArnoldFTB);
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
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_01"); //O cholera. Wielkie bydle ale... Wygl¹da na to, ¿e nasz jurny kolega znalaz³ sobie kole¿ankê...
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_02"); //Dwa niedŸwiedzie naraz. NieŸle.
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_03"); //Nie poddam siê. Musimy odci¹gn¹æ jednego a potem uderzymy na drugiego.
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_04"); //Inaczej rozerw¹ nas na strzêpy.
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_05"); //Dobra spróbuje sprowokowaæ pierwszego. 
    AI_Output (self, other ,"DIA_Arnold_I_SEE_BEAR_03_06"); //Jak tylko padnie za³atwimy drugiego do pary. 
    AI_Output (other, self ,"DIA_Arnold_I_SEE_BEAR_15_07"); //W porz¹dku.
	 Npc_ExchangeRoutine(NON_40034_Arnold,"BearsAttack");
	 B_LogEntry               (NiedzwiedziaPrzysluga," Dotarliœmy na miejsce. Zamiast jednego niedŸwiedzia s¹ dwie sztuki. Nasz niedŸwiedŸ chyba za³atwi³ sobie partnerkê i bilet na tamten œwiat. Pytanie czy dla nas czy dla siebie. Pora mo¿liwie pojedynczo upolowaæ te wielkie zwierzêta i oskurowaæ. Nie bêdzie ³atwo ale damy radê. Dwa niedŸwiedzie zostan¹ upolowane. Bêdê musia³ z odpowiedni¹ precyzj¹ œci¹gn¹æ z nich futra. W koñcu chce to sprzedaæ w dobrej cenie.");
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
   description	= "NiedŸwiedzie s¹ martwe.";
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
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_01"); //NiedŸwiedzie s¹ martwe.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_02"); //Masz ich skóry?
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_03"); //Mam. 
	B_GiveInvItems (other,self, ItAt_BearFur, 1);
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_04"); //Prosty podzia³. Jedna skóra na g³owê. 
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_05"); //Miêso i sad³o mo¿esz zachowaæ.
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_06"); //WeŸ t¹ skórê.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_07"); //Dziêki. Teraz mo¿emy je odsprzedaæ z zyskiem
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_08"); //Có¿ od czasu do czasu fajnie zapolowaæ.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_09"); //Pewnie nie lubisz rutyny... Myœliwy sporo podró¿uje za zwierzyn¹ ale Kolonia to stefa zamkniêta.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_10"); //Wiêc czasami wkrada siê nuda. Pewnie chcesz ruszaæ dalej. Nie bêdê ciê d³u¿ej zatrzymywa³. A koñcz¹c sprawê...  Handlarz Gavilan w Kotle nieŸle ci zap³aci za t¹ skórê. Sam te¿ muszê do niego zagl¹dn¹æ.
    AI_Output (self, other ,"DIA_Arnold_Bears_Are_Die_03_11"); //Dziêki za dobre polowanie stary!
    AI_Output (other, self ,"DIA_Arnold_Bears_Are_Die_15_12"); //W porz¹dku. Teraz niedŸwiedŸ mocno œpi... Wiecznym snem.
	Npc_ExchangeRoutine(NON_40034_Arnold,"start");
	B_LogEntry               (NiedzwiedziaPrzysluga,"Po polowaniu rozmówi³em siê z Arnoldem. Zgodnie z logik¹ ka¿dy zgarn¹³ jedn¹ skórê dla siebie. Usatyskacjonowany ³owami myœliwy poleci³ mi bym sprzeda³ j¹ Gavilanowi w Kotle pod Woln¹ Kopalni¹. Ponoæ mo¿na przyzwoicie zarobiæ.");
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