// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Chani_EXIT(C_INFO)
{
	npc             = Gur_1205_Chani;
	nr              = 999;
	condition	= DIA_Chani_EXIT_Condition;
	information	= DIA_Chani_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Chani_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Chani_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloChani
//========================================

INSTANCE DIA_Chani_HelloChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 1;
   condition    = DIA_Chani_HelloChani_Condition;
   information  = DIA_Chani_HelloChani_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Chani_HelloChani_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Chani_HelloChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_HelloChani_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Chani_HelloChani_03_02"); //Nazywam siê Chani i jestem jedn¹ z kobiet Jaœnie Oœwieconego.
    AI_Output (self, other ,"DIA_Chani_HelloChani_03_03"); //Tu, w Bractwie ¿yje nam siê naprawdê dobrze. Mamy wszystko zapewnione, a inni skazañcy traktuj¹ nas z szacunkiem.
};

//========================================
//-----------------> CampChani
//========================================

INSTANCE DIA_Chani_CampChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 1;
   condition    = DIA_Chani_CampChani_Condition;
   information  = DIA_Chani_CampChani_Info;
   permanent	= FALSE;
   description	= "Jak trafi³aœ do Bractwa?";
};

FUNC INT DIA_Chani_CampChani_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chani_HelloChani))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chani_CampChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_CampChani_15_01"); //Jak trafi³aœ do Bractwa?
    AI_Output (self, other ,"DIA_Chani_CampChani_03_02"); //To proste. Po prostu Gomezowi znudzi³a siê moja egzotyczna uroda. Zosta³am oddelegowana tutaj w prezencie.
    AI_Output (self, other ,"DIA_Chani_CampChani_03_03"); //Bractwo prowadzi intensywn¹ wymianê handlow¹ z Magnatami. Gomez nie tylko p³aci rud¹ i towarami z Zewnêtrznego Œwiata.
    AI_Output (self, other ,"DIA_Chani_CampChani_03_04"); //Czasami p³aci te¿ kobietami.
};

//========================================
//-----------------> ColonyChani
//========================================

INSTANCE DIA_Chani_ColonyChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 2;
   condition    = DIA_Chani_ColonyChani_Condition;
   information  = DIA_Chani_ColonyChani_Info;
   permanent	= FALSE;
   description	= "Jak trafi³aœ do Kolonii?";
};

FUNC INT DIA_Chani_ColonyChani_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chani_HelloChani))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chani_ColonyChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_01"); //Jak trafi³aœ do Kolonii?
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_02"); //Pochodzê z dalekiego po³udnia - z jednej z Wysp Po³udniowych.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_03"); //Moja wyspa w przeciwieñstwie do innych regionów, to jedna wielka d¿ungla us³ana ruinami.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_04"); //Tam te¿ siê wychowa³am. Nale¿a³am do tak zwanego plemienia Burzowych Kruków.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_05"); //W mojej rodzinie nie ma ¿adnych mê¿czyzn, tylko same kobiety. Jest nas naprawdê wiele.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_06"); //Atakujemy miasta portowe i wybrze¿a gêsto zaludnionych wysp, aby zdobyæ jak najwiêcej ³upów.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_07"); //Nazywaj¹ nas "Paniami Harpii" - dowodzimy tymi stworzeniami, i to my dziêki zaawansowanej magii przekszta³ci³yœmy nasze siostry w te stworzenia.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_08"); //Wiele harpii jednak uciek³o nam i teraz ten gatunek jest powszechny na ca³ym œwiecie.
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_09"); //To ciekawe... By³em ciekaw jednak...
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_10"); //Hej! Nie przerywaj mi!
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_11"); //Zaraz dojdê do tego, jak trafi³am za Barierê.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_12"); //Pewnej burzowej nocy postanowi³yœmy najechaæ Bakaresh - œwi¹tynne miasto po³o¿one w Varrancie.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_13"); //Okaza³o siê jednak, ¿e ca³a pustynia zosta³a w³¹czona do Myrtany i wszêdzie a¿ roi³o siê od stra¿ników królewskich.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_14"); //Podobno po klêsce Gellora i Lukkora podporz¹dkowali sobie ca³¹ pustynie, 
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_15"); //Gdy tylko przyby³yœmy do Bakareshu, armia paladynów i gwardzistów ju¿ na nas czeka³a.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_16"); //Zabili wiele moich sióstr i zatopili wszystkie nasze ³odzie. Tylko mi i paru moim siostrom uda³o siê prze¿yæ.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_17"); //Rzuci³am broñ i poprosi³am paladynów o litoœæ. Nie chcia³am skoñczyæ z konsekrowanym mieczem w brzuchu.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_18"); //Na szczêœcie ulegli mojemu urokowi i postanowili zabraæ mnie do stolicy pod os¹d Króla.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_19"); //Reszta moich sióstr tak¿e prze¿y³a. Zosta³y oddelegowane do innych varranckich miast jako prezent dla gubernatorów.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_20"); //Rhobar zamkn¹³ mnie w lochu, a po jakimœ miesi¹cu zdecydowa³ wys³aæ mnie do Khorinis, jako prezent dla Gomeza.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_21"); //Mówi³, ¿e moja egzotyczna uroda z pewnoœci¹ wywrze na Gomezie wra¿enie i bêdzie przysy³a³ wiêksze ³adunki rudy.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_22"); //Tak oto trafi³am tutaj.
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_23"); //Bardzo ciekawa historia.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_24"); //Tak, mam doœæ ciekaw¹ przesz³oœæ.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_25"); //Jednak tutaj nie ma ona znaczenia. W obozie na bagnie ka¿dy jest sobie równy w tych kwestiach.
};

