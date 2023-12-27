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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj si� dotrze� do Starego Obozu w jednym kawa�ku!
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
	description		= "Czym si� tutaj zajmujesz?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo�any nie dosta� si� w pobli�e miejsca wymiany. Zw�aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dzi� zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza si�.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa�aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, kt�rych widzia�e� na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak�adam, �e rozmawia�e� ju� z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie."	,DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak."	,DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wi�c zr�b to! On zajmuje si� wszystkimi nowoprzyby�ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz si� wszystkiego co ��todzi�b wiedzie� powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia�em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju� mniej wi�cej co i jak.
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
	description		= "Dlaczego mam uwa�a� na ludzi z Nowego Obozu?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa�a� na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W por�wnaniu z Nowym Obozem, Stary Ob�z to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Ob�z nie otrzymuje �adnych przesy�ek z zewn�trz. Te szkodniki po prostu kradn� wszystko, czego potrzebuj�.
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
	description		= "A Stary Ob�z?"; 
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
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Ob�z?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz�dz� Magnaci, handluj�cy rud�. Pod nimi s� Stra�nicy, a nast�pnie Cienie. Najni�sz� kast� stanowi� Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka�dy, kto tu trafi, zaczyna jako Kopacz. Je�li masz wi�ksze ambicje, musisz zosta� przyj�ty do Cieni.
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
	description		= "Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi� tak z wszystkimi nowymi. M�wi� na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiak�w?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi� ci krzywdy, je�li zap�acisz im za ochron�.
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
	description		= "Widzia�em, jak spuszczano tutaj jak�� kobiet�."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia�em, jak spuszczano tutaj jak�� kobiet�.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //C�, Magnaci dostaj� wszystko, czego zapragn�.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzie�, �e kr�l wymienia kobiety na rud�?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te� trafiaj� tutaj prosto z wi�zienia. Gdyby Gomez nie �ci�gn�� ich tutaj, dalej gni�yby w jakim� lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju� nie wiem, co jest dla nich gorsze...
	
	MIS_Women = LOG_RUNNING;
	Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Gdy zosta�em zrzucony za Barier�, widzia�em kobiet� spuszczan� na d� wraz z �adunkiem. Jestem ciekaw jaki los j� spotka� w Kolonii. Stra�nik Orry powiedzia�, �e kobiety s� w�asno�ci� Magnat�w i s� zsy�ane do Kolonii z ich polecenia. Powinienem rozejrze� si� w Starym Obozie.");
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
	description		= "Potrzebuj� broni..."; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebuj� broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj si� troch� przy zamkni�tej kopalni, w g��bi kanionu. Na pewno co� tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj si� w powa�ne b�jki uzbrojony w g�upi kilof. To bardzo ci�ka i niepor�czna bro�.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedo�wiadczony wojownik powinien pos�ugiwa� si� nim tylko w ostateczno�ci.
	
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
   description	= "Przysy�a mnie Thorus. Przychodz� po notatki opisuj�ce kierunki dzia�a� Bandyt�w.";
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
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_01"); //Przysy�a mnie Thorus. Przychodz� po notatki opisuj�ce kierunki dzia�a� Bandyt�w.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_02"); //Ach tak, kojarz�.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_03"); //Faktycznie, dostarczono mi takie notatki. 
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_04"); //Nie czyta�em ich jeszcze, wi�c postanowi�em je ukry�, by nikt mi ich nie wykrad�.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_05"); //Gdzie je znajd�?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_06"); //Wybacz, ale zanim ci je dam, musz� je przeczyta�.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_07"); //To na co czekasz?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_08"); //Teraz mam to zrobi�? Nie widzisz, �e pilnuj� placu przed Szkodnikami i Bandytami?
    B_LogEntry                     (CH1_DraxTest,"Orry ukry� notatki Tripa. Nie chce mi ich przekaza�, dop�ki ich nie przeczyta. My�l�, �e szkoda na to czasu.");
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
   description	= "Mam spraw�. Chodzi o pewn� cenn� przesy�k�...";
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
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_01"); //Mam spraw�. Chodzi o pewn� cenn� przesy�k� z zewn�trznego �wiata. Jej adresatem jest Corristo.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_02"); //Mam z�� wiadomo��. Kto� pewnej nocy okrad� plac wymian.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_03"); //Przepad�a ca�a partia towaru przygotowanego do transportu do obozu.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_04"); //W tym i przesy�ka dla Corristo.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_05"); //To fatalnie.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_06"); //Nie inaczej.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_07"); //Czy kto� obcy kr�ci� si� po placu wymian przed kradzie��?
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_08"); //Nie, byli tylko nasi ludzie.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_09"); //Czy zauwa�y�e� co� niepokoj�cego?
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_10"); //Par� dni przed kradzie�� znale�li�my nagie zw�oki jednego ze stra�nik�w.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_11"); //Mo�e to jaka� poszlaka... Zauwa�y�e� co� jeszcze?
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_12"); //To nie wygl�da�o na nic gro�nego ale gladiator Kirgo by� tutaj jaki� czas przed rabunkiem.
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka_15_13"); //Musz� z nim pom�wi�.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka_03_14"); //Zr�b tak a ja wracam do swoich zaj��. Drugi raz nie damy si� podej��!
        B_LogEntry                     (PrzesylkaCorristo ,"Rozmawia�em z Orry�m. Powiedzia�, �e plac wymian zosta� okradziony. Przepad�a i przesy�ka dla Corristo. Pono� wcze�niej odnaleziono zw�oki jednego ze Stra�nik�w nieopodal a tak�e widziano gladiatora Kirgo. Musz� zbada� t� spraw�.");
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
   description	= "Jeden z rozb�jnik�w zabi� Stra�nika...";
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
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_01"); //Jeden z rozb�jnik�w zabi� Stra�nika a nast�pnie b�d�c w jego pancerzu okrad� plac wymian!
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_02"); //A to przebieg�y skunks! Dopad�e� go?
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_03"); //Tak i reszt� jego szajki r�wnie�.
    AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_04"); //A skradzione rzeczy?
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_05"); //Mam je tutaj prosz�.
	B_GiveInvItems           (other,self, ItMi_OrryTowary,1);
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_06"); //Zachowam tylko przesy�k� dla Corristo. Przeka�� mu j� osobi�cie.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_10"); //Dobra robota ch�opcz�. Skuteczny i przebieg�y z ciebie go�� a to przydatne tutaj w Kolonii.
	AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_11"); //Chyba pora na mnie. Musz� jak najszybciej dostarczy� przesy�k� arcymistrzowi Corristo.
	AI_Output (self, other ,"DIA_Orry_Corristo_Przesylka1_03_12"); //No to le�. Stary Corristo na pewno ju� obgryza paznokcie z niecierpliwo�ci hehe!
    AI_Output (other, self ,"DIA_Orry_Corristo_Przesylka1_15_13"); //Do zobaczenia.
    B_LogEntry                     (PrzesylkaCorristo ,"Poszed�em do Orry�ego i odda�em skradzione towary. Wyja�ni�em ca�� intryg� z przebraniem si� za Stra�nika, kt�ry uknuli rozb�jnicy. Teraz musz� zanie�� przesy�k� do Corristo bo na pewno cholernie si� niecierpliwi. ");
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





