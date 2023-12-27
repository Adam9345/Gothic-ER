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
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_GorNaPol_WHO_YOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaPol_WHO_YOU_Info()
{
    AI_Output (other, self ,"DIA_GorNaPol_WHO_YOU_15_01"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_GorNaPol_WHO_YOU_03_02"); //Przynie� mi skr�t "zew nocy" to ch�tnie Ci opowiem.
    AI_Output (other, self ,"DIA_GorNaPol_WHO_YOU_15_03"); //Niech b�dzie. 
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
   description	= "Masz tu skr�ta.";
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
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_01"); //Masz tu skr�ta.
	B_GiveInvItems (other,self, ItMiJoint_3, 1);
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_02"); //Dzi�ki.
	AI_UseItem(TPL_40115_GorNaPol,ItMiJoint_3);   
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_03"); //Opowiesz mi teraz czym na co dzie� si� parasz?
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_04"); //Tak. Zajmuje si� b�d� zajmowa�em wszystkim co jest pisane Stra�nikowi �wi�tynnemu.
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_05"); //Polowa�em na Pe�zacze w kopalni, pilnowa�em porz�dku I bezpiecze�stwa na terenie Bractwa czy doskonali�em si� jako wojownik pod okiem tutejszych mistrz�w or�a.
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_06"); //No I opr�cz tego czasem udaje si� na polowanie. 
    AI_Output (other, self ,"DIA_GorNaPol_JOI_15_07"); //Czy w obozie nie ma innych my�liwych?
    AI_Output (self, other ,"DIA_GorNaPol_JOI_03_08"); //Jest Sakhar. Ale nie mamy najlepszych relacji. Cud, �e nie sko�czy�o si� na r�koczynach ale widocznie wszystko przed nami...
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
    AI_Output (self, other ,"DIA_GorNaPol_WHAT_HU_03_02"); //Na bagienne golemy. Kiedy trzeba bo te bestie s� bardzo zuchwa�e.
    AI_Output (other, self ,"DIA_GorNaPol_WHAT_HU_15_03"); //Co mo�na pozyska� z tych bestii?
    AI_Output (self, other ,"DIA_GorNaPol_WHAT_HU_03_04"); //Ich przepe�nione zapachem torfu I b�ota serca.
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
   description	= "Dosz�y mnie s�uchy, �e bagienne golemy zagra�aj� naszym ludziom.";
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
    AI_Output (other, self ,"DIA_Templer_BG_15_01"); //Dosz�y mnie s�uchy, �e bagienne golemy zagra�aj� naszym ludziom.
    AI_Output (self, other ,"DIA_Templer_BG_03_02"); //Te� co nieco s�ysza�em na ten temat.
    AI_Output (other, self ,"DIA_Templer_BG_15_03"); //Dlaczego wi�c nic z tym nie robisz? S�ysza�em, �e umiesz niezwykle sprawnie ubija� bagienne stwory.
    AI_Output (self, other ,"DIA_Templer_BG_03_04"); //Nie chwal�c si� wys�a�em do piekie� mn�stwo bestii z bagna ku chwale �ni�cego.
    AI_Output (self, other ,"DIA_Templer_BG_03_05"); //Ale skupi�em si� na innych rzeczach. Widocznie w mi�dzy czasie stwory znowu si� rozpleni�y niczym truj�ce kwiaty, kt�re okalaj� teraz mrocznie nasz ob�z.
    AI_Output (other, self ,"DIA_Templer_BG_15_06"); //Poetycko ale w ten spos�b dalej b�dziemy traci� ludzi. Musisz zaj�� si� bagiennymi golemami.
    AI_Output (self, other ,"DIA_Templer_BG_03_07"); //Mam co� na g�owie. Chodzi o Nowicjusza Ghorana. Jego towary s� okradane.
	B_LogEntry               (BagienneGolemy,"Gor Na Pol ma na g�owie inny problem ni� bagienne golemy. Chodzi o kradzie�y, kt�rych kto� dopuszcza si� na Ghoranie. Widocznie najpierw tym b�d� musia� si� zaj��.");
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
   description	= "Co ustali�e�?";
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
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_01"); //Co ustali�e�?
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_02"); //Z�odziej nie jest osob� stroni�c� od na�og�w I zostawia po sobie �lady. Jednak nie uda�o mi si� jeszcze ustali� dok�d prowadz�.
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_03"); //Czy gdybym pom�g� ci w tej sprawie to zaj��by� si� potem bagiennymi golemami?
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_04"); //Oczywi�cie. W takim wypadku by�by to m�j obowi�zek by wykaza� si� swoimi umiej�tno�ciami by dostrzeg� to �ni�cy.
    AI_Output (other, self ,"DIA_Templer_BG_Ghoran_15_05"); //Pom�wi� z Ghoranem.
    AI_Output (self, other ,"DIA_Templer_BG_Ghoran_03_06"); //Wiesz co, p�jd� z tob�.
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
    AI_Output (self, other ,"DIA_Templer_BG_CLOTH_03_01"); //Znalaz�e� co�?
    AI_Output (other, self ,"DIA_Templer_BG_CLOTH_15_02"); //Isotnie, to jaki� fragment odzienia. Cuchnie jak stary troll albo I gorzej.
    AI_Output (self, other ,"DIA_Templer_BG_CLOTH_03_03"); //Ohooo czuje a� tutaj ale daj mi to.
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
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_02"); //O �ni�cy! Faktycznie cuchnie tak jak rzek�e�.
    AI_Output (other, self ,"DIA_Templer_BG_CLOTHG_15_03"); //Jak dla mnie to mieszanina potu, brudu i mocnego alkoholu o s�abej jako�ci.
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_04"); //Cuchnie jak szczyny, kt�re pij� Kopacze ze Starego Obozu.
    AI_Output (other,self  ,"DIA_Templer_BG_CLOTHG_25_05"); //Trzeba pogada� z kim� kto... 
    AI_Output (self, other ,"DIA_Templer_BG_CLOTHG_03_06"); //Melvin! Chod�my do niego.
	B_GiveInvItems (self,other, ItMi_Cloth_BG, 1);
	B_LogEntry               (BagienneGolemy,"Znalaz�em jak�� cuchn�c� chust�. Cuchnie alkoholem, kt�ry popijaj� kopacze ze Starego Obozu. Wygl�da na to �e �lad prowadzi do Melvina...");
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_ITEMS_03_01"); //Przeszukaj ich kryj�wk� dok�adnie. W szczeg�lno�ci zbierz rzeczy Ghorana.
    AI_Output (self, other ,"DIA_GorNaPol_BG_ITEMS_03_02"); //Ja stan� na czatach.
    AI_Output (other, self ,"DIA_GorNaPol_BG_ITEMS_15_03"); //W porz�dku.
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_IHAVEIT_03_02"); //�wietnie. Id� do niego. Ja wracam do siebie. Przyjd� do mnie jutro ko�o po�udnia Zajmiemy si� wreszcie golemami.
    AI_Output (other, self ,"DIA_GorNaPol_BG_IHAVEIT_15_03"); //Niech b�dzie.
	B_LogEntry               (BagienneGolemy,"Pokonali�my z Gor Na Polem rozb�jnik�w. Odzyskali�my towary Ghorana. Trzeba mu je odda�. Mam pogada� z Gor Na Polem kolejnego dnia w po�udnie, wcze�niej powinienem pogada� z Ghoranem");
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOLEMS_03_02"); //Przygotowa�em si� do polowania. Nie b�dzie to spacerek ale wierz�, �e �ni�cy nas ochroni.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOLEMS_03_03"); //Nim wyruszmy zg�o� si� do Caine�a. Co� od ciebie chcia�. Ja poczekam tutaj.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOLEMS_15_04"); //W takim razie daj mi chwil�.
	B_LogEntry               (BagienneGolemy,"Gor Na Pol powiedzia�, �e przed p�j�ciem na walk� z golemami mam i�� co Caine�a. Pono� chc� on czego� ode mnie.");
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOL_GO_03_02"); //Czego chcia� nasz obozowy j�ka�a?
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_03"); //Mam zgarn�� dla niego p� tuzina serc bagiennego golema.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_04"); //Pono� potrzebne do jakiego� eksperymentu.
    AI_Output (self, other ,"DIA_GorNaPol_BG_GOL_GO_03_05"); //Mniejsza o to. Chod�my ju� bo szykuje si� trudny b�j.
    AI_Output (other, self ,"DIA_GorNaPol_BG_GOL_GO_15_06"); //Prowad� do tych golem�w. 
	B_LogEntry               (BagienneGolemy,"Ja I Gor Na Pol ruszyli�my na Bagienne golemy. Nareszcie. Oby�my obaj wyszli z tego �ywi.");
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_PICK_03_02"); //To �lady golem�w. S� blisko. Gdy szli�my t�dy z Melvinem nie zauwa�y�em nic niepokoj�cego.
    AI_Output (self, other ,"DIA_GorNaPol_BG_PICK_03_03"); //Mo�liwe �e zachcia�o im si� pospacerowa�. Chod�my.
	Npc_ExchangeRoutine(self,"FollowGOL");
	B_LogEntry               (BagienneGolemy,"Gor Na Pol odnalaz� tropy. �lady te zosta�y pozostawione przez bagienne golemy. Jeste�my ju� blisko.");
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
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_01"); //To by by�o na tyle.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_02"); //D�ugo minie nim zn�w b�d� stanowi� jakie� zagro�enie.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_03"); //Wykaza�e� si� odwag� oraz spyrtem w sprawie Melvina i rozb�jnik�w, a teraz w walce z golemami.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_04"); //Oddaj serca pokonanych golem�w Caine�owi a potem pom�w z Baalem Namibem. Sowicie ci� wynagrodzi.
    AI_Output (other, self ,"DIA_GorNaPol_BG_END_15_05"); //Dzi�ki. Pom�wi� z Caine�m I Baalem Namibem.
    AI_Output (self, other ,"DIA_GorNaPol_BG_END_03_06"); //Mi�o by�o z tob� wsp�pracowa�. Ja tymczasem wracam do swoich zaj��. Do zobaczenia.
    AI_Output (other, self ,"DIA_GorNaPol_BG_END_15_07"); //Na razie.
	Npc_ExchangeRoutine(TPL_40115_GorNaPol,"Start");
	B_LogEntry               (BagienneGolemy,"Pokonali�my bagienne golemy. Gor Na Pol z�o�y� mi gratulacje I nawet sypn�� lekko rud�. Teraz musz� pogada� z Cainem I Baalem Namibem.");
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
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_01"); //Brawo. Sta�e� si� teraz wojownikiem �ni�cego ch�opcze.
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_02"); //Pami�taj jakie to wyr�nienie. 
    AI_Output (other, self ,"DIA_GorNaPol_HERO_IS_TPL_15_03"); //Rozumiem. Pewnie jeste� zadowolony ze swojego statusu?
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_04"); //Dumny. Jako wojownik Bractwa czuje si� wa�ny I potrzebny.
    AI_Output (self, other ,"DIA_GorNaPol_HERO_IS_TPL_03_05"); //Krocz pewny swego ale nie zapominaj o sile ducha!
};

