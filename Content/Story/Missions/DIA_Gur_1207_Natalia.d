// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Natalia_EXIT(C_INFO)
{
	npc             = Gur_1207_Natalia;
	nr              = 999;
	condition	= DIA_Natalia_EXIT_Condition;
	information	= DIA_Natalia_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Natalia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Natalia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloNatalia
//========================================

INSTANCE DIA_Natalia_HelloNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 1;
   condition    = DIA_Natalia_HelloNatalia_Condition;
   information  = DIA_Natalia_HelloNatalia_Info;
   permanent	= FALSE;
   description	= "Witaj nieznajoma!";
};

FUNC INT DIA_Natalia_HelloNatalia_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Natalia_HelloNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_HelloNatalia_15_01"); //Witaj nieznajoma!
  //  AI_Output (self, other ,"DIA_Natalia_HelloNatalia_03_02"); //Omm...
    AI_Output (self, other ,"DIA_Natalia_HelloNatalia_03_03"); //Witaj skazañcze! Jestem Natalia, jedna z kobiet Y'Beriona.
};

//========================================
//-----------------> WorkNatalia
//========================================

INSTANCE DIA_Natalia_WorkNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 1;
   condition    = DIA_Natalia_WorkNatalia_Condition;
   information  = DIA_Natalia_WorkNatalia_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Natalia_WorkNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_WorkNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_WorkNatalia_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Natalia_WorkNatalia_03_02"); //Dbamy o to, by wizje naszego mistrza by³y intensywne.
    AI_Output (self, other ,"DIA_Natalia_WorkNatalia_03_03"); //Oprócz tego razem z Chani troszczymy siê o jego potrzeby.
};

//========================================
//-----------------> CampNatalia
//========================================

INSTANCE DIA_Natalia_CampNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 2;
   condition    = DIA_Natalia_CampNatalia_Condition;
   information  = DIA_Natalia_CampNatalia_Info;
   permanent	= FALSE;
   description	= "Czy wyznajesz Œni¹cego?";
};

FUNC INT DIA_Natalia_CampNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_CampNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_SleeperNatalia_15_01"); //Czy wyznajesz Œni¹cego?
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_02"); //Oczywiœcie. Nale¿ê teraz do Bractwa i wszystko co robiê, jest ku chwale Œni¹cego.
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_03"); //On w zamian za nasz¹ pomoc, uwolni nas z tego wiêzienia.
    AI_Output (other, self ,"DIA_Natalia_SleeperNatalia_15_04"); //Czyli kobiety te¿ mog¹ do³¹czaæ do Obozu?
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_05"); //Tak, jednak na trochê innych zasadach. Nie mo¿emy przynale¿eæ do ¿adnych kast, a naszym jedynym obowi¹zkiem jest s³u¿yæ Y'Berionowi.
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_06"); //Pozosta³ymi rzeczami w Obozie zajmuj¹ siê mê¿czyŸni.
};

//========================================
//-----------------> PastNatalia
//========================================

INSTANCE DIA_Natalia_PastNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 3;
   condition    = DIA_Natalia_PastNatalia_Condition;
   information  = DIA_Natalia_PastNatalia_Info;
   permanent	= FALSE;
   description	= "Kim by³aœ zanim trafi³aœ do Kolonii?";
};

FUNC INT DIA_Natalia_PastNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_PastNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_PastNatalia_15_01"); //Kim by³aœ zanim trafi³aœ do Kolonii?
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_02"); //By³am zielark¹ z Khorinis. Mieszka³am razem z moj¹ mentork¹ i nauczycielk¹ Sagitt¹, w jaskini w lesie.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_03"); //Farmerzy nazywali nas wiedŸmami i oszustkami. Jednak w razie potrzeby przypominali sobie o naszych leczniczych zio³ach.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_04"); //Niestety pewnego razu moje losy nie potoczy³y siê zbyt dobrze.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_05"); //Ojciec Onara, mieszkaj¹cy na farmie posiadacza ziemskiego dosta³ ataku serca.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_06"); //Jego rodzina i pomocnicy od razu przyprowadzili go do mnie.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_07"); //Chcia³am przyrz¹dziæ mu specjaln¹ miksturê z serafisów i rdestów polnych.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_08"); //Okaza³o siê, ¿e w moich zapasach zabrak³o dwóch serafisów i mikstura okaza³a siê wadliwa.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_09"); //Sagitty nie by³o wówczas ze mn¹. Wyruszy³a z samego rana do lasu nazbieraæ nieco grzybów.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_10"); //Nie by³am w stanie uratowaæ ojca Onara. Zmar³ po chwili...
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_11"); //Jego syn oskar¿y³ mnie w mieœcie o otrucie go.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_12"); //I reszty mo¿esz siê sam domyœliæ. Sagitta zosta³a sama i wci¹¿ pe³ni³a rolê zielarki.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_13"); //Za³o¿ê siê, ¿e wci¹¿ nie mo¿e siê pozbieraæ po utracie swojej jedynej przyjació³ki...
    AI_Output (other, self ,"DIA_Natalia_PastNatalia_15_14"); //Rozumiem.
};