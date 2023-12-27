//***poprawione przez g1210
//rutyna dodana, wp w œwiecie te¿

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Karl_EXIT(C_INFO)
{
	npc             = NON_3921_Wiezien;
	nr              = 999;
	condition	= DIA_Karl_EXIT_Condition;
	information	= DIA_Karl_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Karl_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Karl_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> WELCOME
//========================================

INSTANCE DIA_Karl_WELCOME (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 1;
   condition    = DIA_Karl_WELCOME_Condition;
   information  = DIA_Karl_WELCOME_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Karl_WELCOME_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Karl_WELCOME_Info()
{
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_01"); //Czego tu szukasz? Myœla³em, ¿e nikt tu nie schodzi, oprócz Bullita.
    AI_Output (other, self ,"DIA_Karl_WELCOME_15_02"); //Jestem...
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_03"); //To nieistotne. Powiedz mi lepiej, co ty tu robisz.
    AI_Output (other, self ,"DIA_Karl_WELCOME_15_04"); //Tylko siê rozgl¹dam. S³ysza³em, ¿e pod zamkiem znajduj¹ siê opuszczone lochy, nieu¿ywane od czasów powstania Bariery.
    AI_Output (self, other ,"DIA_Karl_WELCOME_03_05"); //Te szumowiny mówi¹ to ka¿demu, bo nie chc¹, aby ktoœ siê tu pa³êta³.
	AI_Output (self, other ,"DIA_Karl_WELCOME_03_06"); //Jestem Karl i jestem w tym przeklêtym miejscu od niedawna. 
	AI_Output (self, other ,"DIA_Karl_WELCOME_03_07"); //Wiesz, zanim siê tu znalaz³em by³em Najemnikiem w Nowym Obozie, a dawniej stra¿nikiem królewskim nadzoruj¹cym wiêŸniów. Có¿ za ironia, nie?
};
/*
//========================================
//-----------------> STORY
//========================================

INSTANCE DIA_Karl_STORY (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 2;
   condition    = DIA_Karl_STORY_Condition;
   information  = DIA_Karl_STORY_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o tym.";
};

FUNC INT DIA_Karl_STORY_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Karl_WELCOME)) {
    return TRUE; };
};

FUNC VOID DIA_Karl_STORY_Info()
{
    AI_Output (other, self ,"DIA_Karl_STORY_15_01"); //Opowiedz mi o tym.
    AI_Output (self, other ,"DIA_Karl_STORY_03_02"); //No wiêc zanim wybuch³ wielki bunt, nadzorowa³em skazañców w kopalni nieopodal placu wymian, nale¿¹cej do miejscowego Lorda Bergmara. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_03"); //Pilnowa³em wszystkich sukinsynów, którzy teraz op³ywaj¹ tu w luksusach, dziêki umowie z królem. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_04"); //Pewnego dnia, Król Rhobar wyda³ edykt, który g³osi³ ¿e Górnicza Dolina zostanie otoczona Magiczn¹ Barier¹.
    AI_Output (self, other ,"DIA_Karl_STORY_03_05"); //Zdajê siê, ¿e chodzi³o o to, aby uniemo¿liwiæ wiêŸniom ucieczkê. Powo³a³ on dwunastu magów, pod wodz¹ Xardasa, aby odprawili rytua³. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_06"); //Magowie byli naszymi goœæmi w zamku przez pewien czas i nasz dowódca nakaza³ nam spe³niaæ wszelkie ich zachcianki. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_07"); //Po d³ugich przygotowaniach do rytua³u Magowie byli gotowi utworzyæ Barierê. Udali siê wiêc w kluczowe miejsca.
    AI_Output (self, other ,"DIA_Karl_STORY_03_08"); //Mia³em z³e przeczucia co do tego wszystkiego. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_09"); //By³em wtedy na patrolu w Zewnêtrznym Pierœcieniu, gdzie swoje chaty mieli nasi wiêŸniowie, gdy dostrzeg³em potê¿ne b³yski œwiat³a z szeœciu ró¿nych miejsc Doliny. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_10"); //Œwiat³o uformowa³o siê w ogromn¹ Magiczn¹ Barierê, która okaza³a siê o wiele wiêksza ni¿ zapewnia³ nas Xardas.
    AI_Output (self, other ,"DIA_Karl_STORY_03_11"); //Gdy tylko Bariera powsta³a, w ca³ym Obozie powsta³ ogromny chaos. Okaza³o siê, ¿e wiêŸniowie od jakiegoœ czasu planowali bunt.
	AI_Output (self, other ,"DIA_Karl_STORY_03_12"); //Ich dowódc¹ by³ Gomez, najbardziej wp³ywowy Kopacz w Obozie. Skazañcy mieli przewagê liczebn¹ i zdobyli broñ po naszych ¿o³nierzach.
	AI_Output (self, other ,"DIA_Karl_STORY_03_13"); //Wiedzia³em, ¿e to nie skoñczy siê dla nas dobrze, wiêc da³em nogê z Obozu.
    AI_Output (self, other ,"DIA_Karl_STORY_03_14"); //Przez doœæ d³ugi czas ukrywa³em siê w jaskini, w lesie przy drodze z zamku na plac wymian. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_15"); //Pewnego dnia zosta³em jednak zauwa¿ony przez ludzi w niebieskich zbrojach. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_16"); //Jeden z nich, goœæ o imieniu Cord zapyta³ mnie kim jestem i co tu robiê. Wyjaœni³em mu wiêc wszystko, bo nie wygl¹da³ na jednego z ludzi Gomeza.
    AI_Output (self, other ,"DIA_Karl_STORY_03_17"); //Gdy dowiedzia³ siê, ¿e by³em stra¿nikiem królewskim opowiedzia³ mi o Nowym Obozie, szeœciu Magach Wody oraz Lee, by³ym generale samego Rhobara II. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_18"); //Postanowi³em opuœciæ kryjówkê i do³¹czyæ do ludzi Lee. Dowódca Najemników pozna³ mnie od razu. Zanim s³u¿y³em jako stra¿nik w Górniczej Dolinie, by³em stra¿nikiem w Vengardzie.
    AI_Output (self, other ,"DIA_Karl_STORY_03_19"); //I tak trafi³em do Najemników. Jednak kilka tygodni temu dowiedzieliœmy siê, ¿e kilku Stra¿ników Gomeza krêci³o siê nieopodal rybackich chat w pobli¿u Nowego Obozu. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_20"); //Wyszliœmy wiêc im na spotkanie razem z dwoma innymi Najemnikami.
    AI_Output (self, other ,"DIA_Karl_STORY_03_21"); //Niestety, przegraliœmy t¹ potyczkê. Moi towarzysze zginêli, a ja trafi³em do niewoli, gdy¿ jeden ze Stra¿ników, Siekacz, rozpozna³ mnie. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_22"); //Siekacz by³ jednym z naj¿arliwszych popleczników Gomeza przed powstaniem Bariery. Zosta³em zawleczony do zamku i wrzucony do lochu, którego sam kiedyœ nieraz strzeg³em.
    AI_Output (self, other ,"DIA_Karl_STORY_03_23"); //Od tej pory widzia³em tylko Bullita, jednego ze Stra¿ników, który przynosi³ mi jedzenie i kopa³ za ka¿dym razem. 
	AI_Output (self, other ,"DIA_Karl_STORY_03_24"); //Innos œwiadkiem, ¿e gdy wyjdê st¹d ¿ywy i uda mi siê poinformowaæ o wszystkim Lee, te sukinsyny zgin¹ w straszliwych mêczarniach.
};

//========================================
//-----------------> GOMEZDIE
//========================================

INSTANCE DIA_Karl_GOMEZDIE (C_INFO)
{
   npc          = NON_3921_Wiezien;
   nr           = 3;
   condition    = DIA_Karl_GOMEZDIE_Condition;
   information  = DIA_Karl_GOMEZDIE_Info;
   permanent	= FALSE;
   description	= "Jesteœ wolny.";
};

FUNC INT DIA_Karl_GOMEZDIE_Info()
{
	var C_NPC Gomez; 	Gomez = Hlp_GetNpc(Ebr_100_Gomez);
    if (Npc_IsDead(Gomez))
	{
    return TRUE;
	};
	};
	
FUNC INT DIA_Karl_GOMEZDIE_Condition()
{
    AI_Output (other, self ,"DIA_Karl_GOMEZDIE_15_01"); //Jesteœ wolny. Gomez gryzie ziemiê, tak samo jak reszta jego przyjació³ w zamku.
    AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_02"); //Niewiarygodne. Ten sukinsyn dosta³ to, na co zas³uguje, gdybym mia³ cokolwiek wartoœciowego, wynagrodzi³bym ciê. 
	AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_03"); //Wracam czym prêdzej do Nowego Obozu, ktoœ musi poinformowaæ Lee o ca³ej sytuacji.
    AI_Output (self, other ,"DIA_Karl_GOMEZDIE_03_04"); //Myœlê, ¿e po zabiciu Magnatów zajêcie Starego Obozu to bêdzie bu³ka z mas³em.
	Npc_ExchangeRoutine	(NON_3921_Wiezien, "newcamp");
	NON_3921_Wiezien.flags = 2;
	AI_StopProcessInfos (self);
};
*/
