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
	description = "Czy ja dobrze widz�? Ale� ty... wielki!";
};                       

FUNC int DIA_Stuart_Hallo_Condition()


{
	return 1;
};

FUNC VOID  DIA_Stuart_Hallo_Info()
{
	AI_Output (other, self,"DIA_Stuart_Hallo_15_00"); //Czy ja dobrze widz�? Ale� ty... wielki!
	AI_Output (self, other,"DIA_Stuart_Hallo_04_01"); //To nie tak jak my�licie, ty i reszta tych kretyn�w, kt�rzy pierwszy raz mnie widz�.
	AI_Output (self, other,"DIA_Stuart_Hallo_04_02"); //Nie jestem �adnym kar�em a ju� na pewno nie od urodzenia. To przez to orkowe cholerstwo!

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
   description	= "Co masz na my�li? Jakie cholerstwo?";
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
    AI_Output (other, self ,"DIA_Stuart_Kobieta_15_01"); //Co masz na my�li? Jakie cholerstwo?
    AI_Output (self, other ,"DIA_Stuart_Kobieta_03_02"); //Kiedy� by�em normalnym Kretem i pracowa�em w Kotle. Ale gdy mia�em kilka dni wolnego, postanowi�em rozprostowa� ko�ci.
    AI_Output (self, other ,"DIA_Stuart_Kobieta_03_03"); //Pow��czy�em si� troch� po Kolonii. Dotar�em nawet nad granic� z Orkami, to tam co� znalaz�em...
    AI_Output (other, self ,"DIA_Stuart_Kobieta_15_04"); //Co takiego?
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_05"); //Jaki� dziwny stary orkowy amulet. Wzi��em go ze sob�, w ko�cu w tej Kolonii prawie zawsze nic nie mia�em. Jaki� czas potem pokaza�em ten amulet mojemu kumplowi z Kot�a.
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_06"); //Poleci� mi bym jak najszybciej wyrzuci� to plugastwo bo takie orkowe przedmioty mog� nie�� ze sob� r�ne kl�twy dzia�aj�ce na ludziach.
	AI_Output (self, other ,"DIA_Stuart_Kobieta_03_07"); //Ale ja g�upi pomy�la�em, �e chce mi on jedynie odebra� ten amulet. Dlatego zachowa�em go.

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
   description	= "I co by�o potem?";
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
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_01"); //I co by�o potem?
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_02"); //Pewnej nocy, co� mnie op�ta�o i zacz�o m�wi� co mam robi�. Zacz��em si� modli� do jakiego� b�stwa w nieznanym j�zyku, op�ta�a mnie jaka� tajemnicza si�a.
	AI_Output (self, other ,"DIA_Stuart_Halasy_03_03"); //Rano obudzi�em si� skrajnie wyczerpany i w takim rozmiarze jak teraz. Sta�em si� po�miewiskiem i musia�em odej�� z Kot�a. Przysta�em do My�liwych-Najemnik�w. Tutaj jest mi lepiej.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_04"); //Jest jaki� spos�b bo znie�� z ciebie t� orkow� kl�tw�?
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_05"); //Nie wiem. Porozmawiaj z kt�rym� z Mag�w Wody.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_06"); //Obawiam si�, �e b�d� potrzebowa� twojego ,,cudownego� amuletu.
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_07"); //Wyrzuci�em go ju� dawno. Jest gdzie� na wzg�rzach okalaj�cych Kocio�. 
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_08"); //Oczywi�cie dostaniesz ode mnie nagrod� je�li mi pomo�esz pozby� si� tego z�ego czaru.
    AI_Output (other, self ,"DIA_Stuart_Halasy_15_09"); //Dobrze, tylko niech ta ruda kt�r� mi dasz nie b�dzie pomniejszona, tak jak ty!
    AI_Output (self, other ,"DIA_Stuart_Halasy_03_10"); //Id� ju�!
	Log_CreateTopic		(Liliput,	LOG_MISSION);
	Log_SetTopicStatus	(Liliput,	LOG_RUNNING);
	B_LogEntry          (Liliput,"W obozie Najemnik�w-my�liwych spotka�em kar�a. To niejaki Stuart. Twierdzi, �e pad� ofiar� okrutnej kl�twy i niegdy� by� normalnego wzrostu. Wszystko za spraw� pewnego orkowego amuletu, kt�ry za�o�ony przez Stuarta wywar� na niego tak specyficzny wp�yw. Musz� mu pom�c. Najpierw powinienem odnale�� orkowy amulet, kt�ry Stuart wyrzuci� gdzie� w g�rach okalaj�cych kocio�. Potem powinienem pom�wi� z Cronosem.");
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
   description	= "Hej, potrzebny mi tw�j pukiel w�os�w!";
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
    AI_Output (other, self ,"DIA_Stuart_BANG_15_01"); //Hej, potrzebny mi tw�j pukiel w�os�w!
    AI_Output (self, other ,"DIA_Stuart_BANG_03_02"); //Kpisz sobie ze mnie?
    AI_Output (other, self ,"DIA_Stuart_BANG_15_03"); //Mag Cronos potrzebuje go do zdj�cia kl�twy.
    AI_Output (self, other ,"DIA_Stuart_BANG_03_04"); //Aaaaa... Zatem prosz� we� go.
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
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_01"); //We� te flaszk� ry��wki i ciesz si� ze mn�!
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_02"); //Uda�o si�.
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_03"); //Wszystko jest tak jak dawniej, z nieba mi spad�e�.
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_04"); //Chyba powiniene� mi co� wr�czy� dla podtrzymania tej sielankowej atmosfery.
	AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_05"); //Ach tak... Prosz� we�, zas�u�y�e�!
	AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_06"); //Masz tu jeszcze kilka sk�r, na pewno nie�le na nich zarobisz je�li znajdziesz kupca.
    AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_07"); //Dzi�ki. Co teraz b�dziesz robi�?
    AI_Output (self, other ,"DIA_Stuart_BIG_BANG_03_08"); //Na razie zostan� tu, dobrze mi mi�dzy my�liwymi. A kto wie mo�e poducz� mnie bardziej swojego fachu.
	AI_Output (other, self ,"DIA_Stuart_BIG_BANG_15_09"); //Zatem �ycz� powodzenia na polowaniach.
	B_GiveInvItems (self,other, ItAt_Wolf_01, 3);
	B_GiveInvItems (self,other, ItAt_Shadow_01, 1);
	B_GiveInvItems (self,other, itfobooze, 1);
	
	B_LogEntry          (Liliput,"Rozmawia�em ze Stuartem. Jest ju� co najmniej mojego wzrostu! P�ny wiek na ro�ni�cie�.. W ka�dym razie uda�o si� i facet zn�w nie musi si� wstydzi� i by� obiektem drwin. Stuart wyp�aci� mi sowit� nagrod� a historia zatoczy�a szcz�liwie ko�o.");
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