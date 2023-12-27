//poprawione i sprawdzone - Reflide

// ********************************
// 				EXIT
// ********************************

instance DIA_Stuart_EXIT (C_INFO)
{
	npc			= SLD_40047_Stuart;
	nr			= 999;
	condition	= DIA_Stuart_EXIT_Condition;
	information	= DIA_Stuart_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Stuart_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Stuart_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



// ********************************
// 				Hallo
// ********************************

instance DIA_Stuart_Hallo (C_INFO)
{
	npc			= SLD_40047_Stuart;
	nr			= 1;
	condition	= DIA_Stuart_Hallo_Condition;
	information	= DIA_Stuart_Hallo_Info;
	permanent	= 0;
	description = "Czy ja dobrze widzê? Aleœ ty... wielki!";
};                       

FUNC int DIA_Stuart_Hallo_Condition()


{
	return 1;
};

FUNC VOID  DIA_Stuart_Hallo_Info()
{
	AI_Output (other, self,"DIA_Stuart_Hallo_15_00"); //Czy ja dobrze widzê? Aleœ ty... wielki!
	AI_Output (self, other,"DIA_Stuart_Hallo_04_01"); //To nie tak jak myœlicie, ty i reszta tych kretynów, którzy pierwszy raz mnie widz¹.
	AI_Output (self, other,"DIA_Stuart_Hallo_04_02"); //Nie jestem ¿adnym kar³em a ju¿ na pewno nie od urodzenia. To przez to orkowe cholerstwo!

};

//========================================
//-----------------> Kobieta
//========================================

INSTANCE DIA_Stuart_Kobieta (C_INFO)
{
   npc          = SLD_40047_Stuart;
   nr           = 1;
   condition    = DIA_Stuart_Kobieta_Condition;
   information  = DIA_Stuart_Kobieta_Info;
   permanent	= FALSE;
   description	= "Co masz na myœli? Jakie cholerstwo?";
};

FUNC INT DIA_Stuart_Kobieta_Condition()
{
        if (Npc_KnowsInfo (hero, DIA_Stuart_Hallo))
		
		
		
		
{
    return TRUE;
};
};


FUNC VOID DIA_Stuart_Kobieta_Info()
{
    AI_Output (other, self ,"DIA_Stuart_Kobieta_15_01"); //Co masz na myœli? Jakie cholerstwo?
    AI_Output (self, other ,"DIA_Stuart_Kobieta_03_02"); //Kiedyœ by³em normalnym Kretem i pracowa³em w Kotle. Ale gdy mia³em kilka dni wolnego, postanowi³em rozprostowaæ koœci.
    AI_Output (self, other ,"DIA_Stuart_Kobieta_03_03"); //Pow³óczy³em siê trochê po Kolonii. Dotar³em nawet nad granicê z Orkami, to tam coœ znalaz³em...
    AI_Output (other, self ,"DIA_Stuart_Kobieta_15_04"); //Co takiego?
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_05"); //Jakiœ dziwny stary orkowy amulet. Wzi¹³em go ze sob¹, w koñcu w tej Kolonii prawie zawsze nic nie mia³em. Jakiœ czas potem pokaza³em ten amulet mojemu kumplowi z Kot³a.
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_06"); //Poleci³ mi bym jak najszybciej wyrzuci³ to plugastwo bo takie orkowe przedmioty mog¹ nieœæ ze sob¹ ró¿ne kl¹twy dzia³aj¹ce na ludziach.
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_07"); //Ale ja g³upi pomyœla³em, ¿e chce mi on jedynie odebraæ ten amulet. Dlatego zachowa³em go.

};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Stuart_Halasy (C_INFO)
{
   npc          = SLD_40047_Stuart;
   nr           = 2;
   condition    = DIA_Stuart_Halasy_Condition;
   information  = DIA_Stuart_Halasy_Info;
   permanent	= FALSE;
   description	= "I co by³o potem?";
};

FUNC INT DIA_Stuart_Halasy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stuart_Kobieta))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stuart_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_01"); //I co by³o potem?
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_02"); //Pewnej nocy, coœ mnie opêta³o i zaczê³o mówiæ co mam robiæ. Zacz¹³em siê modliæ do jakiegoœ bóstwa w nieznanym jêzyku, opêta³a mnie jakaœ tajemnicza si³a.
	AI_Output (self, other ,"DIA_Stuart_Halasy_03_03"); //Rano obudzi³em siê skrajnie wyczerpany i w takim rozmiarze jak teraz. Sta³em siê poœmiewiskiem i musia³em odejœæ z Kot³a. Przysta³em do Myœliwych-Najemników. Tutaj jest mi lepiej.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_04"); //Jest jakiœ sposób bo znieœæ z ciebie t¹ orkow¹ kl¹twê?
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_05"); //Nie wiem. Porozmawiaj z którymœ z Magów Wody.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_06"); //Obawiam siê, ¿e bêdê potrzebowa³ twojego ,,cudownego” amuletu.
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_07"); //Wyrzuci³em go ju¿ dawno. Jest gdzieœ na wzgórzach okalaj¹cych Kocio³. 
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_08"); //Oczywiœcie dostaniesz ode mnie nagrodê jeœli mi pomo¿esz pozbyæ siê tego z³ego czaru.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_09"); //Dobrze, tylko niech ta ruda któr¹ mi dasz nie bêdzie pomniejszona, tak jak ty!
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_10"); //IdŸ ju¿!
	Log_CreateTopic		(Liliput,	LOG_MISSION);
	Log_SetTopicStatus	(Liliput,	LOG_RUNNING);
	B_LogEntry          (Liliput,"W obozie Najemników-myœliwych spotka³em kar³a. To niejaki Stuart. Twierdzi, ¿e pad³ ofiar¹ okrutnej kl¹twy i niegdyœ by³ normalnego wzrostu. Wszystko za spraw¹ pewnego orkowego amuletu, który za³o¿ony przez Stuarta wywar³ na niego tak specyficzny wp³yw. Muszê mu pomóc. Najpierw powinienem odnaleŸæ orkowy amulet, który Stuart wyrzuci³ gdzieœ w górach okalaj¹cych kocio³. Potem powinienem pomówiæ z Cronosem.");
	Wld_InsertItem			(ItMi_StuartOrcTalisman,"FP_ITEM_AM_STUART");
 
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Stuart_BANG (C_INFO)
{
   npc          = SLD_40047_Stuart;
   nr           = 1;
   condition    = DIA_Stuart_BANG_Condition;
   information  = DIA_Stuart_BANG_Info;
   permanent	= FALSE;
   description	= "Hej, potrzebny mi twój pukiel w³osów!";
};

FUNC INT DIA_Stuart_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_Liliput_Ruda))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stuart_BANG_Info()
{
    AI_Output (other, self ,"DIA_Stuart_BANG_15_01"); //Hej, potrzebny mi twój pukiel w³osów!
    AI_Output (self, other ,"DIA_Stuart_BANG_03_02"); //Kpisz sobie ze mnie?
    AI_Output (other, self ,"DIA_Stuart_BANG_15_03"); //Mag Cronos potrzebuje go do zdjêcia kl¹twy.
    AI_Output (self, other ,"DIA_Stuart_BANG_03_04"); //Aaaaa... Zatem proszê weŸ go.
   // AI_PlayAni(self, "S_IGET");
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Stuart_BIG_BANG (C_INFO)
{
   npc          = SLD_40047_Stuart;
   nr           = 1;
   condition    = DIA_Stuart_BIG_BANG_Condition;
   information  = DIA_Stuart_BIG_BANG_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Stuart_BIG_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cronos_Liliput_Ritual))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stuart_BIG_BANG_Info()
{
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_01"); //WeŸ te flaszkê ry¿ówki i ciesz siê ze mn¹!
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_02"); //Uda³o siê.
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_03"); //Wszystko jest tak jak dawniej, z nieba mi spad³eœ.
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_04"); //Chyba powinieneœ mi coœ wrêczyæ dla podtrzymania tej sielankowej atmosfery.
	AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_05"); //Ach tak... Proszê weŸ, zas³u¿y³eœ!
	AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_06"); //Masz tu jeszcze kilka skór, na pewno nieŸle na nich zarobisz jeœli znajdziesz kupca.
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_07"); //Dziêki. Co teraz bêdziesz robi³?
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_08"); //Na razie zostanê tu, dobrze mi miêdzy myœliwymi. A kto wie mo¿e poducz¹ mnie bardziej swojego fachu.
	AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_09"); //Zatem ¿yczê powodzenia na polowaniach.
	B_GiveInvItems (self,other, ItAt_Wolf_01, 3);
	B_GiveInvItems (self,other, ItAt_Shadow_01, 1);
	B_GiveInvItems (self,other, itfobooze, 1);
	
	B_LogEntry          (Liliput,"Rozmawia³em ze Stuartem. Jest ju¿ co najmniej mojego wzrostu! PóŸny wiek na roœniêcie….. W ka¿dym razie uda³o siê i facet znów nie musi siê wstydziæ i byæ obiektem drwin. Stuart wyp³aci³ mi sowit¹ nagrodê a historia zatoczy³a szczêœliwie ko³o.");
    B_GiveXP(250);
	Log_SetTopicStatus	(Liliput,	LOG_SUCCESS);
	AI_StopProcessInfos	(self);
	
};

instance dia_stuart_pickpocket(c_info) {
    npc = sld_40047_stuart;
    nr = 900;
    condition = dia_stuart_pickpocket_condition;
    information = dia_stuart_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stuart_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_stuart_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stuart_pickpocket);
	info_addchoice(dia_stuart_pickpocket, dialog_back, dia_stuart_pickpocket_back);
	info_addchoice(dia_stuart_pickpocket, dialog_pickpocket, dia_stuart_pickpocket_doit);
};

func void dia_stuart_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_stuart_pickpocket);
};

func void dia_stuart_pickpocket_back() {
    info_clearchoices(dia_stuart_pickpocket);
};