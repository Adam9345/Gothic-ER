//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hanson_EXIT(C_INFO)
{
	npc             = NOV_1378_Hanson;
	nr              = 999;
	condition		= DIA_Hanson_EXIT_Condition;
	information		= DIA_Hanson_EXIT_Info;
	permanent		= TRUE;
	description  	= DIALOG_ENDE;
};

FUNC INT DIA_Hanson_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hanson_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////
// DIALOGI OG�LNE
////////////////////////////////////////////////

//========================================
//-----------------> WHO
//========================================

INSTANCE DIA_Hanson_WHO (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_WHO_Condition;
   information  = DIA_Hanson_WHO_Info;
   permanent	= FALSE;
   description	= "Jeste� drwalem?";
};

FUNC INT DIA_Hanson_WHO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_WHO_Info()
{
    AI_Output (other, self ,"DIA_Hanson_WHO_15_01"); //Jeste� drwalem?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_02"); //Nie wida�?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_03"); //Wyci��em ju� po�ow� tego dziadostwa. Drewno z bagien w wi�kszo�ci jest kiepskiej jako�ci. Przegni�e i zbutwia�e...
	AI_Output (self, other ,"DIA_Hanson_WHO_03_04"); //Tylko niekt�re drzewa s� naprawd� w dobrym stanie, ale je z kolei nie spos�b wyci��. S� strasznie twarde, a �aden z tych obibok�w z Obozu nie chce mi pom�c. 
    AI_Output (self, other ,"DIA_Hanson_WHO_03_05"); //Ale gdy kt�ry� chce, �eby mu co� wystruga� z drewna to przychodzi od razu...
};

//========================================
//-----------------> PRACA
//========================================

INSTANCE DIA_Hanson_PRACA (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 2;
   condition    = DIA_Hanson_PRACA_Condition;
   information  = DIA_Hanson_PRACA_Info;
   permanent	= FALSE;
   description	= "Jak praca?";
};

FUNC INT DIA_Hanson_PRACA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_PRACA_Info()
{
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_01"); //Jak praca? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_02"); //Po prostu wspaniale! Siedz� po uszy w b�otnistym g�wnie i wycinam drzewa. Spe�nienie marze�...
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_03"); //Dlaczego ci�gle narzekasz?
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_04"); //Bo jestem chory! �le si� czuj�, a ci�gle przychodzi do mnie kto�, komu potrzebne jest drewno na chat�.
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_05"); //Mo�e powiniene� st�d odej��, skoro ta praca ci nie odpowiada? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_06"); //Nie mam dok�d...
};

////////////////////////////////////////////
// TAJEMNICZY HANDLARZ
////////////////////////////////////////////

//========================================
//-----------------> STEH
//========================================

INSTANCE DIA_Hanson_STEH (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_STEH_Condition;
   information  = DIA_Hanson_STEH_Info;
   permanent	= FALSE;
   description	= "To ty zajmujesz si� handlem artefaktami?!";
};

FUNC INT DIA_Hanson_STEH_Condition()
{
	if (Npc_KnowsInfo (hero, Nov_1371_BaalNetbek_QUEST)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Hanson_STEH_Info()
{
    AI_Output (other, self ,"DIA_Hanson_STEH_15_01"); //To ty zajmujesz si� handlem artefaktami?!
    AI_Output (self, other ,"DIA_Hanson_STEH_03_02"); //Mistrzu, naprawd� nie wiem o czym m�wisz!
	AI_Output (other, self ,"DIA_Hanson_STEH_15_03"); //K�amiesz! Baal Netbek wskaza� na kogo�, kto kr�ci si� w tych okolicach. 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_04"); //Naprawd�? Guru bierze na powa�nie s�owa tego ob��kanego popapra�ca?! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_05"); //Nie mam sobie nic do zarzucenia! Mo�esz przeszuka� mnie i moj� chat�. Nie mam nic do ukrycia! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_06"); //Lepiej zainteresuj si� tym cz�owiekiem, kt�ry od kilku dni przesiaduje przy palisadzie, a normalnym ludziom daj spok�j.
	AI_Output (other, self ,"DIA_Hanson_STEH_15_07"); //Sprawdz� to, ale je�li k�amiesz to wr�c�. 
	B_LogEntry     (CH3_StrangeResearcher,"Rozmawia�em z Hansonem na temat handlu. Wszystkiego si� wypiera. Twierdzi, �e Baal Netbek si� pomyli� i powinienem poszuka� Nowicjusza, kt�ry kr�ci si� przy palisadzie. ");
};

//////////////////////////////////////////////
// SERIA ZAB�JSTW W BRACTWIE
//////////////////////////////////////////////

//========================================
//-----------------> QUEST2_D
//========================================

INSTANCE DIA_Hanson_QUEST2_D (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 5;
   condition    = DIA_Hanson_QUEST2_D_Condition;
   information  = DIA_Hanson_QUEST2_D_Info;
   permanent	= FALSE;
   description	= "To ty zabija�e� Nowicjuszy!";
};

FUNC INT DIA_Hanson_QUEST2_D_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    && (Npc_HasItems (other, ItMw_SiekieraCSI) >=1)
    && (Npc_HasItems (other, ItMi_OstrzeCSI) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hanson_QUEST2_D_Info()
{
    AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_01"); //To ty zabija�e� Nowicjuszy!
    AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_02"); //Wiedzia�em, �e w ko�cu kto� si� zorientuje. 
    AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_03"); //To dziwne. Przyznajesz si�, nawet nie zada�e� sobie trudu �eby ukry� �lady. Dlaczego?
    AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_04"); //To mia�o by� ostrze�enie dla wszystkich. Ci trzej Nowicjusze mieli u mnie d�ugi.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_05"); //Po�yczali rud� na skr�ty i jeszcze brali ode mnie deski na budow� swoich chat. Obiecali, �e wkr�tce zap�ac�.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_06"); //Ju� od dw�ch lat czeka�em. �aden z nich nie wpad� nawet na pomys�, �eby mi pom�c i odpracowa� d�ugi. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_07"); //�ni�cy jest demonem i ty dobrze o tym wiesz, Guru, kt�rego nikt prawie nie zna... Ja te� o tym wiem.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_08"); //Skoro wiara w �ni�cego ju� nie ma sensu to wszystkie zasady, praca wsp�lnoty i inne pierdo�y r�wnie� s� bezcelowe. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_09"); //Wracamy do tego, co zawsze rz�dzi�o naszym �yciem - do pieni�dzy. Czy to z�oto, czy ruda... niewa�ne. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_10"); //Po prostu ma si� zgadza�.
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_11"); //Nawet je�li nie wierzysz w �ni�cego to co z pozosta�ymi bogami? Nie upatrujesz w nich jakiej� nadziei?
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_12"); //Nie, tak jak wi�kszo�� bandzior�w i wyrzutk�w, kt�rzy tu egzystuj�. Sko�czmy t� paplanin�.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_13"); //Wiem, �e nie pu�cisz mnie �ywcem, dlatego b�d� walczy� jak wojownik.
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	Info_AddChoice		(DIA_Hanson_QUEST2_D,"(Pu�� Hansona wolno)", DIA_Hanson_QUEST2_D_FREE);
	Info_AddChoice		(DIA_Hanson_QUEST2_D,"hs@FF0000 (Zabij Hansona)",DIA_Hanson_QUEST2_D_KILL);
};

FUNC VOID DIA_Hanson_QUEST2_D_FREE ()
{
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_01"); //Odejd�.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_FREE_03_02"); //CO?
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_03"); //Odejd�. Opu�� Ob�z.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_FREE_03_04"); //Dlaczego to robisz?
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_05"); //A powiedz mi czym r�ni�bym si� od ciebie, gdybym ci� zabi�.
	B_LogEntry                     (CH3_PsionicCSI,"Morderc� okaza� si� Hanson, kt�ry przyzna� si� do dokonania zab�jstw. Kaza�em mu opu�ci� Ob�z.");
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	Npc_ExchangeRoutine(self,"tot");
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanson_QUEST2_D_KILL ()
{
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_KILL_15_01"); //Ka�dego w ko�cu dosi�gnie sprawiedliwo��.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_KILL_03_02"); //Tego si� spodziewa�em.
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	B_LogEntry                     (CH3_PsionicCSI,"Morderc� okaza� si� Hanson, kt�ry przyzna� si� do dokonania zab�jstw. Stan��em z nim do walki.");
};

instance dia_hanson_pickpocket(c_info) {
    npc = nov_1378_hanson;
    nr = 900;
    condition = dia_hanson_pickpocket_condition;
    information = dia_hanson_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanson_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_hanson_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanson_pickpocket);
	info_addchoice(dia_hanson_pickpocket, dialog_back, dia_hanson_pickpocket_back);
	info_addchoice(dia_hanson_pickpocket, dialog_pickpocket, dia_hanson_pickpocket_doit);
};

func void dia_hanson_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hanson_pickpocket);
};

func void dia_hanson_pickpocket_back() {
    info_clearchoices(dia_hanson_pickpocket);
};