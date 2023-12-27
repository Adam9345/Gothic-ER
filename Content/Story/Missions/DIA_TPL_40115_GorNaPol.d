//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorNaPol_EXIT(C_INFO)
{
	npc             = TPL_40115_GorNaPol;
	nr              = 999;
	condition	= DIA_GorNaPol_EXIT_Condition;
	information	= DIA_GorNaPol_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_GorNaPol_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorNaPol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WHO_YOU
//========================================

INSTANCE DIA_GorNaPol_WHO_YOU (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_GorNaPol_WHO_YOU_Condition;
   information  = DIA_GorNaPol_WHO_YOU_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_GorNaPol_WHO_YOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaPol_WHO_YOU_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_WHO_YOU_15_01"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_GorNaPol_WHO_YOU_03_02"); //Przynieœ mi skrêt "zew nocy" to chêtnie Ci opowiem.
    AI_Output (other, self ,"DIA_GorNaPol_WHO_YOU_15_03"); //Niech bêdzie. 
};

//========================================
//-----------------> JOI
//========================================

INSTANCE DIA_GorNaPol_JOI (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 2;
   condition    = DIA_GorNaPol_JOI_Condition;
   information  = DIA_GorNaPol_JOI_Info;
   permanent	= FALSE;
   description	= "Masz tu skrêta.";
};

FUNC INT DIA_GorNaPol_JOI_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_GorNaPol_WHO_YOU))
   && (Npc_HasItems (other, ItMiJoint_3) >=1)
	
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_JOI_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_01"); //Masz tu skrêta.
	B_GiveInvItems (other,self, ItMiJoint_3, 1);
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_02"); //Dziêki.
	AI_UseItem(TPL_40115_GorNaPol,ItMiJoint_3);   
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_03"); //Opowiesz mi teraz czym na co dzieñ siê parasz?
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_04"); //Tak. Zajmuje siê b¹dŸ zajmowa³em wszystkim co jest pisane Stra¿nikowi Œwi¹tynnemu.
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_05"); //Polowa³em na Pe³zacze w kopalni, pilnowa³em porz¹dku I bezpieczeñstwa na terenie Bractwa czy doskonali³em siê jako wojownik pod okiem tutejszych mistrzów orê¿a.
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_06"); //No I oprócz tego czasem udaje siê na polowanie. 
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_07"); //Czy w obozie nie ma innych myœliwych?
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_08"); //Jest Sakhar. Ale nie mamy najlepszych relacji. Cud, ¿e nie skoñczy³o siê na rêkoczynach ale widocznie wszystko przed nami...
};

//========================================
//-----------------> WHAT_HU
//========================================

INSTANCE DIA_GorNaPol_WHAT_HU (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 3;
   condition    = DIA_GorNaPol_WHAT_HU_Condition;
   information  = DIA_GorNaPol_WHAT_HU_Info;
   permanent	= FALSE;
   description	= "Na co polujesz?";
};

FUNC INT DIA_GorNaPol_WHAT_HU_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_GorNaPol_JOI))
   
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_WHAT_HU_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_WHAT_HU_15_01"); //Na co polujesz?
    AI_Output (self, other ,"DIA_GorNaPol_WHAT_HU_03_02"); //Na bagienne golemy. Kiedy trzeba bo te bestie s¹ bardzo zuchwa³e.
    AI_Output (other, self ,"DIA_GorNaPol_WHAT_HU_15_03"); //Co mo¿na pozyskaæ z tych bestii?
    AI_Output (self, other ,"DIA_GorNaPol_WHAT_HU_03_04"); //Ich przepe³nione zapachem torfu I b³ota serca.
};


//========================================
//-----------------> BG
//========================================

INSTANCE DIA_Templer_BG (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_Templer_BG_Condition;
   information  = DIA_Templer_BG_Info;
   permanent	= FALSE;
   description	= "Dosz³y mnie s³uchy, ¿e bagienne golemy zagra¿aj¹ naszym ludziom.";
};

FUNC INT DIA_Templer_BG_Condition()
{
if (Npc_KnowsInfo(hero,DIA_PC_Psionic_BG))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_BG_Info()
{
    AI_Output (other, self ,"DIA_Templer_BG_15_01"); //Dosz³y mnie s³uchy, ¿e bagienne golemy zagra¿aj¹ naszym ludziom.
    AI_Output (self, other ,"DIA_Templer_BG_03_02"); //Te¿ co nieco s³ysza³em na ten temat.
    AI_Output (other, self ,"DIA_Templer_BG_15_03"); //Dlaczego wiêc nic z tym nie robisz? S³ysza³em, ¿e umiesz niezwykle sprawnie ubijaæ bagienne stwory.
    AI_Output (self, other ,"DIA_Templer_BG_03_04"); //Nie chwal¹c siê wys³a³em do piekie³ mnóstwo bestii z bagna ku chwale Œni¹cego.
    AI_Output (self, other ,"DIA_Templer_BG_03_05"); //Ale skupi³em siê na innych rzeczach. Widocznie w miêdzy czasie stwory znowu siê rozpleni³y niczym truj¹ce kwiaty, które okalaj¹ teraz mrocznie nasz obóz.
    AI_Output (other, self ,"DIA_Templer_BG_15_06"); //Poetycko ale w ten sposób dalej bêdziemy traciæ ludzi. Musisz zaj¹æ siê bagiennymi golemami.
    AI_Output (self, other ,"DIA_Templer_BG_03_07"); //Mam coœ na g³owie. Chodzi o Nowicjusza Ghorana. Jego towary s¹ okradane.
	B_LogEntry               (BagienneGolemy,"Gor Na Pol ma na g³owie inny problem ni¿ bagienne golemy. Chodzi o kradzie¿y, których ktoœ dopuszcza siê na Ghoranie. Widocznie najpierw tym bêdê musia³ siê zaj¹æ.");
};

//========================================
//-----------------> BG_Ghoran
//========================================

INSTANCE DIA_Templer_BG_Ghoran (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 2;
   condition    = DIA_Templer_BG_Ghoran_Condition;
   information  = DIA_Templer_BG_Ghoran_Info;
   permanent	= FALSE;
   description	= "Co ustali³eœ?";
};

FUNC INT DIA_Templer_BG_Ghoran_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Templer_BG))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_BG_Ghoran_Info()
{
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_01"); //Co ustali³eœ?
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_02"); //Z³odziej nie jest osob¹ stroni¹c¹ od na³ogów I zostawia po sobie œlady. Jednak nie uda³o mi siê jeszcze ustaliæ dok¹d prowadz¹.
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_03"); //Czy gdybym pomóg³ ci w tej sprawie to zaj¹³byœ siê potem bagiennymi golemami?
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_04"); //Oczywiœcie. W takim wypadku by³by to mój obowi¹zek by wykazaæ siê swoimi umiejêtnoœciami by dostrzeg³ to Œni¹cy.
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_05"); //Pomówiê z Ghoranem.
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_06"); //Wiesz co, pójdê z tob¹.
	Npc_ExchangeRoutine(self,"Ghoran");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BG_CLOTH
//========================================

INSTANCE DIA_Templer_BG_CLOTH (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_Templer_BG_CLOTH_Condition;
   information  = DIA_Templer_BG_CLOTH_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_BG_CLOTH_Condition()
{
 if (Npc_HasItems (other, ItMi_Cloth_BG) >=1)
 &&  (Npc_KnowsInfo(hero,DIA_Templer_BG_Ghoran))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_BG_CLOTH_Info()
{
    AI_Output (self, other ,"DIA_Templer_BG_CLOTH_03_01"); //Znalaz³eœ coœ?
    AI_Output (other, self ,"DIA_Templer_BG_CLOTH_15_02"); //Isotnie, to jakiœ fragment odzienia. Cuchnie jak stary troll albo I gorzej.
    AI_Output (self, other ,"DIA_Templer_BG_CLOTH_03_03"); //Ohooo czuje a¿ tutaj ale daj mi to.
};

//========================================
//-----------------> BG_CLOTHG
//========================================

INSTANCE DIA_Templer_BG_CLOTHG (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 2;
   condition    = DIA_Templer_BG_CLOTHG_Condition;
   information  = DIA_Templer_BG_CLOTHG_Info;
   permanent	= FALSE;
   description	= "Skoro chcesz...";
};

FUNC INT DIA_Templer_BG_CLOTHG_Condition()
{
if  (Npc_KnowsInfo(hero,DIA_Templer_BG_CLOTH))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_BG_CLOTHG_Info()
{
    AI_Output (other, self ,"DIA_Templer_BG_CLOTHG_15_01"); //Skoro chcesz...
	AI_UseItem(other,ItMi_Cloth_BG);
	B_GiveInvItems (other,self, ItMi_Cloth_BG, 1);
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_02"); //O Œni¹cy! Faktycznie cuchnie tak jak rzek³eœ.
    AI_Output (other, self ,"DIA_Templer_BG_CLOTHG_15_03"); //Jak dla mnie to mieszanina potu, brudu i mocnego alkoholu o s³abej jakoœci.
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_04"); //Cuchnie jak szczyny, które pij¹ Kopacze ze Starego Obozu.
    AI_Output (other,self  ,"DIA_Templer_BG_CLOTHG_25_05"); //Trzeba pogadaæ z kimœ kto... 
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_06"); //Melvin! ChodŸmy do niego.
	B_GiveInvItems (self,other, ItMi_Cloth_BG, 1);
	B_LogEntry               (BagienneGolemy,"Znalaz³em jak¹œ cuchn¹c¹ chustê. Cuchnie alkoholem, który popijaj¹ kopacze ze Starego Obozu. Wygl¹da na to ¿e œlad prowadzi do Melvina...");
};


//========================================
//-----------------> BG_ITEMS
//========================================

INSTANCE DIA_GorNaPol_BG_ITEMS (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_GorNaPol_BG_ITEMS_Condition;
   information  = DIA_GorNaPol_BG_ITEMS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaPol_BG_ITEMS_Condition()
{
    if (Npc_IsDead (NON_40112_Herszt))
    && (Npc_KnowsInfo(hero,DIA_Melvin_BG_BDT))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_ITEMS_Info()
{
    AI_Output (self, other ,"DIA_GorNaPol_BG_ITEMS_03_01"); //Przeszukaj ich kryjówkê dok³adnie. W szczególnoœci zbierz rzeczy Ghorana.
    AI_Output (self, other ,"DIA_GorNaPol_BG_ITEMS_03_02"); //Ja stanê na czatach.
    AI_Output (other, self ,"DIA_GorNaPol_BG_ITEMS_15_03"); //W porz¹dku.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BG_IHAVEIT
//========================================

INSTANCE DIA_GorNaPol_BG_IHAVEIT (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 2;
   condition    = DIA_GorNaPol_BG_IHAVEIT_Condition;
   information  = DIA_GorNaPol_BG_IHAVEIT_Info;
   permanent	= FALSE;
   description	= "Mam rzeczy Ghorana.";
};

FUNC INT DIA_GorNaPol_BG_IHAVEIT_Condition()
{
    if (Npc_HasItems (other, ItMi_Items_BG) >=5)
	&& (Npc_KnowsInfo(hero,DIA_Melvin_BG_BDT))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_IHAVEIT_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_BG_IHAVEIT_15_01"); //Mam rzeczy Ghorana.
    AI_Output (self, other ,"DIA_GorNaPol_BG_IHAVEIT_03_02"); //Œwietnie. IdŸ do niego. Ja wracam do siebie. PrzyjdŸ do mnie jutro ko³o po³udnia Zajmiemy siê wreszcie golemami.
    AI_Output (other, self ,"DIA_GorNaPol_BG_IHAVEIT_15_03"); //Niech bêdzie.
	B_LogEntry               (BagienneGolemy,"Pokonaliœmy z Gor Na Polem rozbójników. Odzyskaliœmy towary Ghorana. Trzeba mu je oddaæ. Mam pogadaæ z Gor Na Polem kolejnego dnia w po³udnie, wczeœniej powinienem pogadaæ z Ghoranem");
	Npc_ExchangeRoutine(TPL_40115_GorNaPol,"Start");
	BG_Pol_Day = Wld_GetDay();
};

//========================================
//-----------------> BG_GOLEMS
//========================================

INSTANCE DIA_GorNaPol_BG_GOLEMS (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 3;
   condition    = DIA_GorNaPol_BG_GOLEMS_Condition;
   information  = DIA_GorNaPol_BG_GOLEMS_Info;
   permanent	= FALSE;
   description	= "Jestem.";
};

FUNC INT DIA_GorNaPol_BG_GOLEMS_Condition()
{
if (BG_Pol_Day != Wld_GetDay())
&& (Npc_KnowsInfo(hero, DIA_Ghoran_BG_GHOGET))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_GOLEMS_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOLEMS_15_01"); //Jestem.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOLEMS_03_02"); //Przygotowa³em siê do polowania. Nie bêdzie to spacerek ale wierzê, ¿e Œni¹cy nas ochroni.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOLEMS_03_03"); //Nim wyruszmy zg³oœ siê do Caine’a. Coœ od ciebie chcia³. Ja poczekam tutaj.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOLEMS_15_04"); //W takim razie daj mi chwilê.
	B_LogEntry               (BagienneGolemy,"Gor Na Pol powiedzia³, ¿e przed pójœciem na walkê z golemami mam iœæ co Caine’a. Ponoæ chcê on czegoœ ode mnie.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BG_GOL_GO
//========================================

INSTANCE DIA_GorNaPol_BG_GOL_GO (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 4;
   condition    = DIA_GorNaPol_BG_GOL_GO_Condition;
   information  = DIA_GorNaPol_BG_GOL_GO_Info;
   permanent	= FALSE;
   description	= "Jestem gotowy na polowanie.";
};

FUNC INT DIA_GorNaPol_BG_GOL_GO_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Caine_BG_HEART))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_GOL_GO_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_01"); //Jestem gotowy na polowanie.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOL_GO_03_02"); //Czego chcia³ nasz obozowy j¹ka³a?
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_03"); //Mam zgarn¹æ dla niego pó³ tuzina serc bagiennego golema.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_04"); //Ponoæ potrzebne do jakiegoœ eksperymentu.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOL_GO_03_05"); //Mniejsza o to. ChodŸmy ju¿ bo szykuje siê trudny bój.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_06"); //ProwadŸ do tych golemów. 
	B_LogEntry               (BagienneGolemy,"Ja I Gor Na Pol ruszyliœmy na Bagienne golemy. Nareszcie. Obyœmy obaj wyszli z tego ¿ywi.");
	Npc_ExchangeRoutine(self,"GuideGOL");
    AI_StopProcessInfos	(self);
	Wld_InsertNpc				(SwampGolemBG1,"WP_BG_01");
	Wld_InsertNpc				(SwampGolemBG2,"WP_BG_02");
	Wld_InsertNpc				(SwampGolemBG3,"WP_BG_03");
	Wld_InsertNpc				(SwampGolemBG4,"PATH_AROUND_PSI10");
	Wld_InsertNpc				(SwampGolemBG5,"PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc				(SwampGolemBG6,"PATH_TAKE_HERB_MOVEMENT2");
};

//========================================
//-----------------> BG_PICK
//========================================

INSTANCE DIA_GorNaPol_BG_PICK (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 5;
   condition    = DIA_GorNaPol_BG_PICK_Condition;
   information  = DIA_GorNaPol_BG_PICK_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaPol_BG_PICK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_GOL_GO))
&& (Npc_GetDistToWP(self,"PATH_AROUND_PSI09")<3000)
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_PICK_Info()
{
    AI_Output (self, other ,"DIA_GorNaPol_BG_PICK_03_01"); //Oho...
	AI_PlayAni (self,"T_PLUNDER");
    AI_Output (self, other ,"DIA_GorNaPol_BG_PICK_03_02"); //To œlady golemów. S¹ blisko. Gdy szliœmy têdy z Melvinem nie zauwa¿y³em nic niepokoj¹cego.
    AI_Output (self, other ,"DIA_GorNaPol_BG_PICK_03_03"); //Mo¿liwe ¿e zachcia³o im siê pospacerowaæ. ChodŸmy.
	Npc_ExchangeRoutine(self,"FollowGOL");
	B_LogEntry               (BagienneGolemy,"Gor Na Pol odnalaz³ tropy. Œlady te zosta³y pozostawione przez bagienne golemy. Jesteœmy ju¿ blisko.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> BG_END
//========================================

INSTANCE DIA_GorNaPol_BG_END (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_GorNaPol_BG_END_Condition;
   information  = DIA_GorNaPol_BG_END_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaPol_BG_END_Condition()
{
 if (Npc_IsDead (SwampGolemBG1))
 && (Npc_IsDead (SwampGolemBG2))
 && (Npc_IsDead (SwampGolemBG3))
 && (Npc_IsDead (SwampGolemBG4))
 && (Npc_IsDead (SwampGolemBG5))
 && (Npc_IsDead (SwampGolemBG6))
 && (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_PICK))
 
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_BG_END_Info()
{
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_01"); //To by by³o na tyle.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_02"); //D³ugo minie nim znów bêd¹ stanowiæ jakieœ zagro¿enie.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_03"); //Wykaza³eœ siê odwag¹ oraz spyrtem w sprawie Melvina i rozbójników, a teraz w walce z golemami.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_04"); //Oddaj serca pokonanych golemów Caine’owi a potem pomów z Baalem Namibem. Sowicie ciê wynagrodzi.
    AI_Output (other, self ,"DIA_GorNaPol_BG_END_15_05"); //Dziêki. Pomówiê z Caine’m I Baalem Namibem.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_06"); //Mi³o by³o z tob¹ wspó³pracowaæ. Ja tymczasem wracam do swoich zajêæ. Do zobaczenia.
    AI_Output (other, self ,"DIA_GorNaPol_BG_END_15_07"); //Na razie.
	Npc_ExchangeRoutine(TPL_40115_GorNaPol,"Start");
	B_LogEntry               (BagienneGolemy,"Pokonaliœmy bagienne golemy. Gor Na Pol z³o¿y³ mi gratulacje I nawet sypn¹³ lekko rud¹. Teraz muszê pogadaæ z Cainem I Baalem Namibem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HERO_IS_TPL
//========================================

INSTANCE DIA_GorNaPol_HERO_IS_TPL (C_INFO)
{
   npc          = TPL_40115_GorNaPol;
   nr           = 1;
   condition    = DIA_GorNaPol_HERO_IS_TPL_Condition;
   information  = DIA_GorNaPol_HERO_IS_TPL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaPol_HERO_IS_TPL_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_TPL)
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaPol_HERO_IS_TPL_Info()
{
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_01"); //Brawo. Sta³eœ siê teraz wojownikiem Œni¹cego ch³opcze.
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_02"); //Pamiêtaj jakie to wyró¿nienie. 
    AI_Output (other, self ,"DIA_GorNaPol_HERO_IS_TPL_15_03"); //Rozumiem. Pewnie jesteœ zadowolony ze swojego statusu?
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_04"); //Dumny. Jako wojownik Bractwa czuje siê wa¿ny I potrzebny.
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_05"); //Krocz pewny swego ale nie zapominaj o sile ducha!
};

