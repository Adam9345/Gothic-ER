//poprawione i sprawdzone -  

// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj siê dotrzeæ do Starego Obozu w jednym kawa³ku!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Czym siê tutaj zajmujesz?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo³any nie dosta³ siê w pobli¿e miejsca wymiany. Zw³aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dziœ zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza siê.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa¿aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, których widzia³eœ na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak³adam, ¿e rozmawia³eœ ju¿ z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie."	,DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak."	,DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wiêc zrób to! On zajmuje siê wszystkimi nowoprzyby³ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz siê wszystkiego co ¿ó³todziób wiedzieæ powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia³em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju¿ mniej wiêcej co i jak.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W porównaniu z Nowym Obozem, Stary Obóz to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Obóz nie otrzymuje ¿adnych przesy³ek z zewn¹trz. Te szkodniki po prostu kradn¹ wszystko, czego potrzebuj¹.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "A Stary Obóz?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Obóz?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz¹dz¹ Magnaci, handluj¹cy rud¹. Pod nimi s¹ Stra¿nicy, a nastêpnie Cienie. Najni¿sz¹ kastê stanowi¹ Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka¿dy, kto tu trafi, zaczyna jako Kopacz. Jeœli masz wiêksze ambicje, musisz zostaæ przyjêty do Cieni.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi¹ tak z wszystkimi nowymi. Mówi¹ na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiaków?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi¹ ci krzywdy, jeœli zap³acisz im za ochronê.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Widzia³em, jak spuszczano tutaj jak¹œ kobietê."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia³em, jak spuszczano tutaj jak¹œ kobietê.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Có¿, Magnaci dostaj¹ wszystko, czego zapragn¹.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzieæ, ¿e król wymienia kobiety na rudê?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te¿ trafiaj¹ tutaj prosto z wiêzienia. Gdyby Gomez nie œci¹gn¹³ ich tutaj, dalej gni³yby w jakimœ lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju¿ nie wiem, co jest dla nich gorsze...
	
	MIS_Women = LOG_RUNNING;
	Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Gdy zosta³em zrzucony za Barierê, widzia³em kobietê spuszczan¹ na dó³ wraz z ³adunkiem. Jestem ciekaw jaki los j¹ spotka³ w Kolonii. Stra¿nik Orry powiedzia³, ¿e kobiety s¹ w³asnoœci¹ Magnatów i s¹ zsy³ane do Kolonii z ich polecenia. Powinienem rozejrzeæ siê w Starym Obozie.");
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Potrzebujê broni..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebujê broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj siê trochê przy zamkniêtej kopalni, w g³êbi kanionu. Na pewno coœ tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj siê w powa¿ne bójki uzbrojony w g³upi kilof. To bardzo ciê¿ka i nieporêczna broñ.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedoœwiadczony wojownik powinien pos³ugiwaæ siê nim tylko w ostatecznoœci.
	
};

//========================================
//-----------------> TripNotes
//========================================

INSTANCE DIA_Orry_TripNotes (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 1;
   condition    = DIA_Orry_TripNotes_Condition;
   information  = DIA_Orry_TripNotes_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Thorus. Przychodzê po notatki opisuj¹ce kierunki dzia³añ Bandytów.";
};

FUNC INT DIA_Orry_TripNotes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Graham_Spy_Map_Bandit))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_TripNotes_Info()
{
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_01"); //Przysy³a mnie Thorus. Przychodzê po notatki opisuj¹ce kierunki dzia³añ Bandytów.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_02"); //Ach tak, kojarzê.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_03"); //Faktycznie, dostarczono mi takie notatki. 
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_04"); //Nie czyta³em ich jeszcze, wiêc postanowi³em je ukryæ, by nikt mi ich nie wykrad³.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_05"); //Gdzie je znajdê?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_06"); //Wybacz, ale zanim ci je dam, muszê je przeczytaæ.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_07"); //To na co czekasz?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_08"); //Teraz mam to zrobiæ? Nie widzisz, ¿e pilnujê placu przed Szkodnikami i Bandytami?
    B_LogEntry                     (CH1_DraxTest,"Orry ukry³ notatki Tripa. Nie chce mi ich przekazaæ, dopóki ich nie przeczyta. Myœlê, ¿e szkoda na to czasu.");
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> TripNotes
//========================================

INSTANCE DIA_Orry_Corristo_Przesylka (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 1;
   condition    = DIA_Orry_Corristo_Przesylka_Condition;
   information  = DIA_Orry_Corristo_Przesylka_Info;
   permanent	= FALSE;
   description	= "Mam sprawê. Chodzi o pewn¹ cenn¹ przesy³kê...";
};

FUNC INT DIA_Orry_Corristo_Przesylka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Corristo_Przesylka))


    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_Corristo_Przesylka_Info()
{
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_01"); //Mam sprawê. Chodzi o pewn¹ cenn¹ przesy³kê z zewnêtrznego œwiata. Jej adresatem jest Corristo.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_02"); //Mam z³¹ wiadomoœæ. Ktoœ pewnej nocy okrad³ plac wymian.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_03"); //Przepad³a ca³a partia towaru przygotowanego do transportu do obozu.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_04"); //W tym i przesy³ka dla Corristo.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_05"); //To fatalnie.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_06"); //Nie inaczej.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_07"); //Czy ktoœ obcy krêci³ siê po placu wymian przed kradzie¿¹?
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_08"); //Nie, byli tylko nasi ludzie.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_09"); //Czy zauwa¿y³eœ coœ niepokoj¹cego?
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_10"); //Parê dni przed kradzie¿¹ znaleŸliœmy nagie zw³oki jednego ze stra¿ników.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_11"); //Mo¿e to jakaœ poszlaka... Zauwa¿y³eœ coœ jeszcze?
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_12"); //To nie wygl¹da³o na nic groŸnego ale gladiator Kirgo by³ tutaj jakiœ czas przed rabunkiem.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_13"); //Muszê z nim pomówiæ.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_14"); //Zrób tak a ja wracam do swoich zajêæ. Drugi raz nie damy siê podejœæ!
        B_LogEntry                     (PrzesylkaCorristo ,"Rozmawia³em z Orry’m. Powiedzia³, ¿e plac wymian zosta³ okradziony. Przepad³a i przesy³ka dla Corristo. Ponoæ wczeœniej odnaleziono zw³oki jednego ze Stra¿ników nieopodal a tak¿e widziano gladiatora Kirgo. Muszê zbadaæ tê sprawê.");
    AI_StopProcessInfos	(self);
};




//========================================
//-----------------> TripNotes
//========================================

INSTANCE DIA_Orry_Corristo_Przesylka1 (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 1;
   condition    = DIA_Orry_Corristo_Przesylka1_Condition;
   information  = DIA_Orry_Corristo_Przesylka1_Info;
   permanent	= FALSE;
   description	= "Jeden z rozbójników zabi³ Stra¿nika...";
};

FUNC INT DIA_Orry_Corristo_Przesylka1_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Przywodca_What))
    && (Npc_HasItems (other, ItMi_OrryTowary) >=1)
	&& (Npc_HasItems (other, ItMi_Corristo_pack) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_Corristo_Przesylka1_Info()
{
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_01"); //Jeden z rozbójników zabi³ Stra¿nika a nastêpnie bêd¹c w jego pancerzu okrad³ plac wymian!
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_02"); //A to przebieg³y skunks! Dopad³eœ go?
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_03"); //Tak i resztê jego szajki równie¿.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_04"); //A skradzione rzeczy?
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_05"); //Mam je tutaj proszê.
	B_GiveInvItems           (other,self, ItMi_OrryTowary,1);
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_06"); //Zachowam tylko przesy³kê dla Corristo. Przeka¿ê mu j¹ osobiœcie.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_10"); //Dobra robota ch³opczê. Skuteczny i przebieg³y z ciebie goœæ a to przydatne tutaj w Kolonii.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_11"); //Chyba pora na mnie. Muszê jak najszybciej dostarczyæ przesy³kê arcymistrzowi Corristo.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_12"); //No to leæ. Stary Corristo na pewno ju¿ obgryza paznokcie z niecierpliwoœci hehe!
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_13"); //Do zobaczenia.
    B_LogEntry                     (PrzesylkaCorristo ,"Poszed³em do Orry’ego i odda³em skradzione towary. Wyjaœni³em ca³¹ intrygê z przebraniem siê za Stra¿nika, który uknuli rozbójnicy. Teraz muszê zanieœæ przesy³kê do Corristo bo na pewno cholernie siê niecierpliwi. ");
    AI_StopProcessInfos	(self);
};

instance dia_orry_pickpocket(c_info) {
    npc = grd_254_orry;
    nr = 900;
    condition = dia_orry_pickpocket_condition;
    information = dia_orry_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_orry_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_orry_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_orry_pickpocket);
	info_addchoice(dia_orry_pickpocket, dialog_back, dia_orry_pickpocket_back);
	info_addchoice(dia_orry_pickpocket, dialog_pickpocket, dia_orry_pickpocket_doit);
};

func void dia_orry_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_orry_pickpocket);
};

func void dia_orry_pickpocket_back() {
    info_clearchoices(dia_orry_pickpocket);
};





