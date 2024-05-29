// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fritz_EXIT(C_INFO)
{
	npc             = SLD_40064_Fritz;
	nr              = 999;
	condition	= DIA_Fritz_EXIT_Condition;
	information	= DIA_Fritz_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Fritz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fritz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


Func Void FritzGoingGwm()
{


    Wld_InsertNpc				(GRD_40058_Gardist,"WP_GWM_02");	
	Wld_InsertNpc				(GRD_40059_Gardist,"WP_GWM_03");	
	Wld_InsertNpc				(GRD_40060_Gardist,"WP_GWM_04");	
	Wld_InsertNpc				(GRD_40061_Gardist,"WP_GWM_05");	
};
//========================================
//-----------------> GWM
//========================================

INSTANCE DIA_Fritz_GWM (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_GWM_Condition;
   information  = DIA_Fritz_GWM_Info;
   permanent	= FALSE;
   description	= "Nefarius pono� ju� z tob� rozmawia� w sprawie...";
};

FUNC INT DIA_Fritz_GWM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Nefarius_GWM))
{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_GWM_Info()
{
    AI_Output (other, self ,"DIA_Fritz_GWM_15_01"); //Nefarius pono� ju� z tob� rozmawia� w sprawie orkowego szamana z Wie�y Mgie�.
	
    AI_Output (self, other ,"DIA_Fritz_GWM_03_02"); //Taa... Zgodzi�em si� wyruszy� z tob� by zg�adzi� to orkowe �cierwo.
    AI_Output (other, self ,"DIA_Fritz_GWM_15_03"); //W�a�nie takiej odpowiedzi oczekiwa�em.
    AI_Output (self, other ,"DIA_Fritz_GWM_03_04"); //To co? Got�w i�� po �eb orkowego szamana?
    AI_Output (other, self ,"DIA_Fritz_GWM_15_05"); //Jasne. Pora zako�czy� n�dzny �ywot tego zielonosk�rego pajaca.
    AI_Output (self, other ,"DIA_Fritz_GWM_03_06"); //�wietnie. Zatem b�d� na ciebie czeka� w okolicy Wie�y Mgie�.
    AI_Output (other, self ,"DIA_Fritz_GWM_15_07"); //W porz�dku.
	
	B_LogEntry               (GoscWWiezyMgiel,"Rozmawia�em z Fritzem. Bez wahania wyruszy ze mn� na trudn� misj� po g�ow� szamana Ork�w.");
		
	 
	 
	 Info_ClearChoices	(DIA_Fritz_GWM);
     Info_AddChoice		(DIA_Fritz_GWM, "(Szybka podr� - Wie�a mgie�)", DIA_Fritz_GWM_FastTravel);
	
};

FUNC VOID DIA_Fritz_GWM_FastTravel()
{
 
	 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
     Npc_ExchangeRoutine(SLD_40064_Fritz,"GWM");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(SLD_40064_Fritz,"WP_GWM_01");
	AI_Teleport(hero,"WP_GWM_01");
    FritzGoingGwm();
};
//========================================
//-----------------> GWM_GRD
//========================================

INSTANCE DIA_Fritz_GWM_GRD (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_GWM_GRD_Condition;
   information  = DIA_Fritz_GWM_GRD_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Fritz_GWM_GRD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fritz_GWM)) //&& (Npc_GetDistToWP(hero,"WP_GWM_01")<1050) && (Npc_GetDistToNpc(hero,SLD_40064_Fritz)<800) 
{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_GWM_GRD_Info()
{
    
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_01"); //S�ysza�e�? O cholera! Patrol Stra�y Gomeza.
	AI_SetWalkmode(SLD_40064_Fritz,NPC_SNEAK);
    AI_SetWalkmode(hero,NPC_SNEAK);
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_15_02"); //�e tez zapu�cili si� a� tutaj.
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_03"); //Pora da� im nauczk�.
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_15_04"); //I to na dobre...
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_05"); //Do ataku.
	 Npc_ExchangeRoutine(SLD_40064_Fritz,"GWMGRD");	
    SLD_40064_Fritz.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry               (GoscWWiezyMgiel,"Mamy niemi�� niespodziank�. Pod Wie�� Mgie� rozbili obozowisko Stra�nicy Gomeza. Musimy si�  z nimi rozprawi�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GWM_GRD_Dead
//========================================

INSTANCE DIA_Fritz_GWM_GRD_Dead (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 3;
   condition    = DIA_Fritz_GWM_GRD_Dead_Condition;
   information  = DIA_Fritz_GWM_GRD_Dead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fritz_GWM_GRD_Dead_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_Fritz_GWM_GRD)) 
  && (Npc_IsDead (GRD_40058_Gardist))  
{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_GWM_GRD_Dead_Info()
{
 
    AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_01"); //No i to by by�o na tyle z tym patrolem.
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_Dead_15_02"); //Ju� nie wr�c� do swoich. Teraz pora na orkowego szamana.
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_03"); //Masz racj�. Jednak, skoro ci durnie ze starego obozu byli ju� tutaj, to wola�bym wiedzie� co mamy za plecami...
	AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_04"); //Zw�aszcza, �e zawsze mog� wys�a� kolejnych...
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_Dead_15_05"); //Czy�by� narobi� w portki ze strachu? C� w takim razie czekaj tu na mnie.
	AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_06"); //Jasna sprawa, m�ody...
	
	Npc_ExchangeRoutine(SLD_40064_Fritz,"GWM2");	
	B_LogEntry               (GoscWWiezyMgiel,"Pokonali�my Stra�nik�w. Pora wej�� do Wie�y Mgie� i j� dok�adnie zinfiltrowa�. Ciekawe co sie tam na mnie czai?");
};

//========================================
//-----------------> GWM_SHA
//========================================

INSTANCE DIA_Fritz_GWM_SHA (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 4;
   condition    = DIA_Fritz_GWM_SHA_Condition;
   information  = DIA_Fritz_GWM_SHA_Info;
   permanent	= FALSE;
   description	= "Orkowy szaman gryzie piach.";
};

FUNC INT DIA_Fritz_GWM_SHA_Condition()
{
  if (Npc_IsDead (Shaman_GWM_01))
  && (Npc_KnowsInfo(hero,DIA_Fritz_GWM_GRD_Dead))
  && (Npc_HasItems (other, ITRI_GWM) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_GWM_SHA_Info()
{
    AI_Output (other, self ,"DIA_Fritz_GWM_SHA_15_01"); //Orkowy szaman gryzie piach.
    AI_Output (self, other ,"DIA_Fritz_GWM_SHA_03_02"); //No i prawid�owo. Co z artefaktem?
    AI_Output (other, self ,"DIA_Fritz_GWM_SHA_15_03"); //Mam go.
    AI_Output (self, other ,"DIA_Fritz_GWM_SHA_03_04"); //Wspaniale. Pora si� st�d wynosi�. Mam zakl�cie od mag�w kt�re teleportuje nas prosto do obozu.
    AI_Output (other, self ,"DIA_Fritz_GWM_SHA_15_05"); //�wietnie. Zatem wracajmy.
	
	
	B_LogEntry               (GoscWWiezyMgiel,"Stoczyli�my walk� z Orkowym Szamanem I jego pomocnikami. Wygrali�my j� I zgarneli�my artefakt. Pora wr�ci� do Nefariusa.");
	
	Info_ClearChoices	(DIA_Fritz_GWM_SHA);
    Info_AddChoice		(DIA_Fritz_GWM_SHA, "(Szybka podr� - Magowie Wody)", DIA_Fritz_Tp_To_Nc);
};

FUNC VOID DIA_Fritz_Tp_To_Nc()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
     Npc_ExchangeRoutine(SLD_40064_Fritz,"GWM3");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(SLD_40064_Fritz,"NC_KDW_CAVE_STAIRS");
	AI_Teleport(hero,"NC_KDW_CAVE_CENTER");
	


};
//========================================
//-----------------> GWM_SLD
//========================================

INSTANCE DIA_PC_Fighter_GWM_SLD (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_PC_Fighter_GWM_SLD_Condition;
   information  = DIA_PC_Fighter_GWM_SLD_Info;
   permanent	= FALSE;
   important    = 1;
};

FUNC INT DIA_PC_Fighter_GWM_SLD_Condition()
{
 if (Npc_GetDistToWP(hero,"NC_KDW_CAVE_CENTER")<500)
 && (Npc_KnowsInfo(hero,DIA_Fritz_GWM_SHA))
{
    return TRUE;
};
};
FUNC VOID DIA_PC_Fighter_GWM_SLD_Info()
{
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_01"); //No i jeste�my na miejscu.
    AI_Output (other, self ,"DIA_PC_Fighter_GWM_SLD_15_02"); //Tak. Pora bym pom�wi� z Nefariusem.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_03"); //W razie czego wiesz, gdzie mnie szuka�.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_04"); //Dobr� akcj� i porz�dn� bitk� nigdy nie gardz�.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_05"); //Do zobaczenia.
    AI_Output (other, self ,"DIA_PC_Fighter_GWM_SLD_15_06"); //Trzymaj si�.
	SLD_40064_Fritz.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SLD_40064_Fritz,"Start");
};

//========================================
//-----------------> Gru�lik
//========================================

INSTANCE DIA_Fritz_HELLO1 (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_HELLO1_Condition;
   information  = DIA_Fritz_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie wiadomo�� od Baala Oruna";
};

FUNC INT DIA_Fritz_HELLO1_Condition()
{
if ((Npc_HasItems (other, ItWr_CaineToFritz) >=1) && (Npc_HasItems (other, ItFo_Potion_Fritz01)>=1) && (GRU_STRMIS == TRUE))
&& (Kapitel == 2) || (Kapitel == 3)

{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_01"); //Mam dla ciebie wiadomo�� od Caine'a.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_02"); //To ciebie Caine wys�a�?
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_03"); //Niezupe�nie. Nieszcz�sny pos�aniec wys�any przez Caina, zosta� zagryziony przez zg�odnia�e wilki. A mikstura, kt�r� ni�s� rozbi�a si� i w ca�o�ci wyla�a.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_04"); //Co?! O bogowie, no to ze mn� koniec.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_05"); //A co si� sta�o?
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_06"); //Raczej co si� stanie. Umieram. Mam wyj�tkowo ci�ki przypadek gru�licy ja... (kaszle)
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_07"); //Pewnego dnia, kiedy pomaga�em Magom Wody w laboratorium, dosz�o do wypadku, w wyniku kt�rego zatru�em si� jakimi� oparami alchemicznymi.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_08"); //My�la�em, �e p�uca wypluje od kaszlu. (kaszle) Ja umieram...  tak stwierdzili Magowie, dodaj�c, �e tylko jaki� wywar z zi� rosn�cych w obozie Sekty mo�e mi pom�c.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_09"); //M�g�bym uda� si� do Sekty i zapyta� o tw�j eliksir.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_10"); //Naprawd�? Zrobi�by� to dla mnie? Pom�w prosz� z Cainem. Niech przyrz�dzi jeszcze jedn� porcj� eliksiru.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_11"); //Tak zrobi�. Wyruszam natychmiast.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_12"); //Wybacz, ale z trudem si� poruszam, wi�c nie da�bym z Tob� p�j��... Nawet kawa�ka drogi. Tylko bym ci� spowalnia�.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_13"); //Powodzenia.
	B_GiveInvItems (other,self, ItWr_CaineToFritz, 1);
	B_GiveInvItems (other,self, ItFo_Potion_Fritz01, 1);
	B_LogEntry               (Gruzlik,"Rozmawia�em z Fritzem. Na skutek wypadku w laboratorium Mag�w Wody ma ci�ki przypadek gru�licy i umiera. Poprosi� mnie bym uda� si� do Sekty i pom�wi� z Cainem o antidotum. Je�li chc� by prze�y� musz� mu pom�c.");
    AI_StopProcessInfos	(self);

};
//========================================
//-----------------> Gru�lik
//========================================

INSTANCE DIA_Fritz_GR_END (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_GR_END_Condition;
   information  = DIA_Fritz_GR_END_Info;
   permanent	= FALSE;
   description	= "Masz. O to twoje lekarstwo.";
};

FUNC INT DIA_Fritz_GR_END_Condition()
{
if (Npc_HasItems (other, ItFo_Potion_Fritz02) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Fritz_GR_END_Info()
{

    AI_StandUP(self);
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_01"); //Trzymaj. O to twoje lekarstwo.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_02"); //Dzi�kuj�. Ale capi! Nie gorzej jednak ni� tamte truj�ce opary.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_03"); //No dobra, moje zdrowie. 
	AI_UseItem(SLD_40064_Fritz, ItFo_Potion_Fritz02);
	B_GiveInvItems (other,self, ItFo_Potion_Fritz02,1);
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_04"); //Ugh... To by�o paskudne, ale ju� czuje jak rozgrzewa mnie od �rodka.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_06"); //Wydaje mi si�, �e ju� mi troch� lepiej. I to wszystko dzi�ki tobie. Jestem twoim dozgonnym d�u�nikiem.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_08"); //Drobiazg.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_09"); //W podzi�ce przyjmij t� rud�.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_10"); //Dzi�ki. Teraz mnie co� rozgrza�o od �rodka. Nie ma to jak zastrzyk z rudy.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_11"); //Dzi�kuj� przyjacielu.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_12"); //Jeszcze za wcze�nie by� szed� na spotkanie z Beliarem.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_13"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_14"); //Uwa�aj na siebie.
	B_GiveXP(250);
	B_LogEntry (Gruzlik,"Da�em mikstur� lecznicz� Fritzowi. Najemnik poczu� si� lepiej i zosta� uratowany. W podzi�ce za uratowanie �ycia wyp�aci� mi nale�n� rud�. Wygl�da na to, �e ocali�em cz�owieka i zyska�em przychyln� dusz� w Nowym Obozie.");
	GRU_STRMIS = FALSE;
	Log_SetTopicStatus	(Gruzlik,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_FRITZ
//========================================

INSTANCE DIA_Fritz_HI_FRITZ (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_HI_FRITZ_Condition;
   information  = DIA_Fritz_HI_FRITZ_Info;
   permanent	= FALSE;
   description	= "Cze��.";
};

FUNC INT DIA_Fritz_HI_FRITZ_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fritz_HI_FRITZ_Info()
{
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_01"); //Cze��.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_03"); //A tak chcia�em pogada�.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_04"); //Mhm... �api�, m�ody.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_05"); //Wkr�tce relacje ze Starym Obozem pogorsz� si�. Zapami�taj moje s�owa. Czuje to w ko�ciach...
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_06"); //Sk�d ta pewno��?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_07"); //Mam wiele znajomo�ci, wi�c i sporo si� dowiaduje. Niebawem b�dzie tu bardzo ciekawie. Ja, Fritz, ci to m�wi�!
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_08"); //M�g�by� mi pom�c do��czy� do ludzi Laresa?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_09"); //C�, mo�e i mia�bym dla ciebie pewn� robot�. Ale niestety teraz to wykluczone.
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_10"); //Dlaczego?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_11"); //Poprztyka�em si� z Lee, a Lares stan�� po jego stronie. Straci�em, przez to pewne wp�ywy, przynajmniej cz�ciowo.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_12"); //Z czasem o sprzeczce zapomn�, a ja odbuduje u nich notowania dzi�ki innym kontaktom... Ale to wymaga czasu.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_13"); //P�ki co niestety nie pomog�. Przykro mi.
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_14"); //Rozumiem.
};

