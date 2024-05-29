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
   description	= "Nefarius ponoæ ju¿ z tob¹ rozmawia³ w sprawie...";
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
    AI_Output (other, self ,"DIA_Fritz_GWM_15_01"); //Nefarius ponoæ ju¿ z tob¹ rozmawia³ w sprawie orkowego szamana z Wie¿y Mgie³.
	
    AI_Output (self, other ,"DIA_Fritz_GWM_03_02"); //Taa... Zgodzi³em siê wyruszyæ z tob¹ by zg³adziæ to orkowe œcierwo.
    AI_Output (other, self ,"DIA_Fritz_GWM_15_03"); //W³aœnie takiej odpowiedzi oczekiwa³em.
    AI_Output (self, other ,"DIA_Fritz_GWM_03_04"); //To co? Gotów iœæ po ³eb orkowego szamana?
    AI_Output (other, self ,"DIA_Fritz_GWM_15_05"); //Jasne. Pora zakoñczyæ nêdzny ¿ywot tego zielonoskórego pajaca.
    AI_Output (self, other ,"DIA_Fritz_GWM_03_06"); //Œwietnie. Zatem bêdê na ciebie czeka³ w okolicy Wie¿y Mgie³.
    AI_Output (other, self ,"DIA_Fritz_GWM_15_07"); //W porz¹dku.
	
	B_LogEntry               (GoscWWiezyMgiel,"Rozmawia³em z Fritzem. Bez wahania wyruszy ze mn¹ na trudn¹ misjê po g³owê szamana Orków.");
		
	 
	 
	 Info_ClearChoices	(DIA_Fritz_GWM);
     Info_AddChoice		(DIA_Fritz_GWM, "(Szybka podró¿ - Wie¿a mgie³)", DIA_Fritz_GWM_FastTravel);
	
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
    
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_01"); //S³ysza³eœ? O cholera! Patrol Stra¿y Gomeza.
	AI_SetWalkmode(SLD_40064_Fritz,NPC_SNEAK);
    AI_SetWalkmode(hero,NPC_SNEAK);
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_15_02"); //¯e tez zapuœcili siê a¿ tutaj.
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_03"); //Pora daæ im nauczkê.
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_15_04"); //I to na dobre...
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_03_05"); //Do ataku.
	 Npc_ExchangeRoutine(SLD_40064_Fritz,"GWMGRD");	
    SLD_40064_Fritz.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry               (GoscWWiezyMgiel,"Mamy niemi³¹ niespodziankê. Pod Wie¿¹ Mgie³ rozbili obozowisko Stra¿nicy Gomeza. Musimy siê  z nimi rozprawiæ.");
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
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_01"); //No i to by by³o na tyle z tym patrolem.
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_Dead_15_02"); //Ju¿ nie wróc¹ do swoich. Teraz pora na orkowego szamana.
    AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_03"); //Masz racjê. Jednak, skoro ci durnie ze starego obozu byli ju¿ tutaj, to wola³bym wiedzieæ co mamy za plecami...
	AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_04"); //Zw³aszcza, ¿e zawsze mog¹ wys³aæ kolejnych...
    AI_Output (other, self ,"DIA_Fritz_GWM_GRD_Dead_15_05"); //Czy¿byœ narobi³ w portki ze strachu? Có¿ w takim razie czekaj tu na mnie.
	AI_Output (self, other ,"DIA_Fritz_GWM_GRD_Dead_03_06"); //Jasna sprawa, m³ody...
	
	Npc_ExchangeRoutine(SLD_40064_Fritz,"GWM2");	
	B_LogEntry               (GoscWWiezyMgiel,"Pokonaliœmy Stra¿ników. Pora wejœæ do Wie¿y Mgie³ i j¹ dok³adnie zinfiltrowaæ. Ciekawe co sie tam na mnie czai?");
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
    AI_Output (self, other ,"DIA_Fritz_GWM_SHA_03_02"); //No i prawid³owo. Co z artefaktem?
    AI_Output (other, self ,"DIA_Fritz_GWM_SHA_15_03"); //Mam go.
    AI_Output (self, other ,"DIA_Fritz_GWM_SHA_03_04"); //Wspaniale. Pora siê st¹d wynosiæ. Mam zaklêcie od magów które teleportuje nas prosto do obozu.
    AI_Output (other, self ,"DIA_Fritz_GWM_SHA_15_05"); //Œwietnie. Zatem wracajmy.
	
	
	B_LogEntry               (GoscWWiezyMgiel,"Stoczyliœmy walkê z Orkowym Szamanem I jego pomocnikami. Wygraliœmy j¹ I zgarneliœmy artefakt. Pora wróciæ do Nefariusa.");
	
	Info_ClearChoices	(DIA_Fritz_GWM_SHA);
    Info_AddChoice		(DIA_Fritz_GWM_SHA, "(Szybka podró¿ - Magowie Wody)", DIA_Fritz_Tp_To_Nc);
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
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_01"); //No i jesteœmy na miejscu.
    AI_Output (other, self ,"DIA_PC_Fighter_GWM_SLD_15_02"); //Tak. Pora bym pomówi³ z Nefariusem.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_03"); //W razie czego wiesz, gdzie mnie szukaæ.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_04"); //Dobr¹ akcj¹ i porz¹dn¹ bitk¹ nigdy nie gardzê.
    AI_Output (self, other ,"DIA_PC_Fighter_GWM_SLD_03_05"); //Do zobaczenia.
    AI_Output (other, self ,"DIA_PC_Fighter_GWM_SLD_15_06"); //Trzymaj siê.
	SLD_40064_Fritz.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SLD_40064_Fritz,"Start");
};

//========================================
//-----------------> GruŸlik
//========================================

INSTANCE DIA_Fritz_HELLO1 (C_INFO)
{
   npc          = SLD_40064_Fritz;
   nr           = 1;
   condition    = DIA_Fritz_HELLO1_Condition;
   information  = DIA_Fritz_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie wiadomoœæ od Baala Oruna";
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
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_01"); //Mam dla ciebie wiadomoœæ od Caine'a.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_02"); //To ciebie Caine wys³a³?
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_03"); //Niezupe³nie. Nieszczêsny pos³aniec wys³any przez Caina, zosta³ zagryziony przez zg³odnia³e wilki. A mikstura, któr¹ niós³ rozbi³a siê i w ca³oœci wyla³a.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_04"); //Co?! O bogowie, no to ze mn¹ koniec.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_05"); //A co siê sta³o?
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_06"); //Raczej co siê stanie. Umieram. Mam wyj¹tkowo ciê¿ki przypadek gruŸlicy ja... (kaszle)
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_07"); //Pewnego dnia, kiedy pomaga³em Magom Wody w laboratorium, dosz³o do wypadku, w wyniku którego zatru³em siê jakimiœ oparami alchemicznymi.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_08"); //Myœla³em, ¿e p³uca wypluje od kaszlu. (kaszle) Ja umieram...  tak stwierdzili Magowie, dodaj¹c, ¿e tylko jakiœ wywar z zió³ rosn¹cych w obozie Sekty mo¿e mi pomóc.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_09"); //Móg³bym udaæ siê do Sekty i zapytaæ o twój eliksir.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_10"); //Naprawdê? Zrobi³byœ to dla mnie? Pomów proszê z Cainem. Niech przyrz¹dzi jeszcze jedn¹ porcjê eliksiru.
    AI_Output (other, self ,"DIA_Fritz_HELLO1_15_11"); //Tak zrobiê. Wyruszam natychmiast.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_12"); //Wybacz, ale z trudem siê poruszam, wiêc nie da³bym z Tob¹ pójœæ... Nawet kawa³ka drogi. Tylko bym ciê spowalnia³.
    AI_Output (self, other ,"DIA_Fritz_HELLO1_03_13"); //Powodzenia.
	B_GiveInvItems (other,self, ItWr_CaineToFritz, 1);
	B_GiveInvItems (other,self, ItFo_Potion_Fritz01, 1);
	B_LogEntry               (Gruzlik,"Rozmawia³em z Fritzem. Na skutek wypadku w laboratorium Magów Wody ma ciê¿ki przypadek gruŸlicy i umiera. Poprosi³ mnie bym uda³ siê do Sekty i pomówi³ z Cainem o antidotum. Jeœli chcê by prze¿y³ muszê mu pomóc.");
    AI_StopProcessInfos	(self);

};
//========================================
//-----------------> GruŸlik
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
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_02"); //Dziêkujê. Ale capi! Nie gorzej jednak ni¿ tamte truj¹ce opary.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_03"); //No dobra, moje zdrowie. 
	AI_UseItem(SLD_40064_Fritz, ItFo_Potion_Fritz02);
	B_GiveInvItems (other,self, ItFo_Potion_Fritz02,1);
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_04"); //Ugh... To by³o paskudne, ale ju¿ czuje jak rozgrzewa mnie od œrodka.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_06"); //Wydaje mi siê, ¿e ju¿ mi trochê lepiej. I to wszystko dziêki tobie. Jestem twoim dozgonnym d³u¿nikiem.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_08"); //Drobiazg.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_09"); //W podziêce przyjmij tê rudê.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_10"); //Dziêki. Teraz mnie coœ rozgrza³o od œrodka. Nie ma to jak zastrzyk z rudy.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_11"); //Dziêkujê przyjacielu.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_12"); //Jeszcze za wczeœnie byœ szed³ na spotkanie z Beliarem.
    AI_Output (other, self ,"DIA_Fritz_GR_END_15_13"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Fritz_GR_END_03_14"); //Uwa¿aj na siebie.
	B_GiveXP(250);
	B_LogEntry (Gruzlik,"Da³em miksturê lecznicz¹ Fritzowi. Najemnik poczu³ siê lepiej i zosta³ uratowany. W podziêce za uratowanie ¿ycia wyp³aci³ mi nale¿n¹ rudê. Wygl¹da na to, ¿e ocali³em cz³owieka i zyska³em przychyln¹ duszê w Nowym Obozie.");
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
   description	= "Czeœæ.";
};

FUNC INT DIA_Fritz_HI_FRITZ_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fritz_HI_FRITZ_Info()
{
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_01"); //Czeœæ.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_03"); //A tak chcia³em pogadaæ.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_04"); //Mhm... £apiê, m³ody.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_05"); //Wkrótce relacje ze Starym Obozem pogorsz¹ siê. Zapamiêtaj moje s³owa. Czuje to w koœciach...
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_06"); //Sk¹d ta pewnoœæ?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_07"); //Mam wiele znajomoœci, wiêc i sporo siê dowiaduje. Niebawem bêdzie tu bardzo ciekawie. Ja, Fritz, ci to mówiê!
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_08"); //Móg³byœ mi pomóc do³¹czyæ do ludzi Laresa?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_09"); //Có¿, mo¿e i mia³bym dla ciebie pewn¹ robotê. Ale niestety teraz to wykluczone.
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_10"); //Dlaczego?
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_11"); //Poprztyka³em siê z Lee, a Lares stan¹³ po jego stronie. Straci³em, przez to pewne wp³ywy, przynajmniej czêœciowo.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_12"); //Z czasem o sprzeczce zapomn¹, a ja odbuduje u nich notowania dziêki innym kontaktom... Ale to wymaga czasu.
    AI_Output (self, other ,"DIA_Fritz_HI_FRITZ_03_13"); //Póki co niestety nie pomogê. Przykro mi.
    AI_Output (other, self ,"DIA_Fritz_HI_FRITZ_15_14"); //Rozumiem.
};

