// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Zagol_EXIT(C_INFO)
{
	npc             = Nov_40148_Zagol;
	nr              = 999;
	condition	= DIA_Zagol_EXIT_Condition;
	information	= DIA_Zagol_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Zagol_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Zagol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Zagol_HELLO1 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 1;
   condition    = DIA_Zagol_HELLO1_Condition;
   information  = DIA_Zagol_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Zagol_HELLO1_Condition()
{
   if (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR)
{
    return TRUE;
};
};
FUNC VOID DIA_Zagol_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_01"); //Hola, hola! S�ysza�em, �e do��czy�e� do naszego Bractwa.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_02"); //I co z tego?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_03"); //A to, �e dalej wygl�dasz jak nikczemne czupirad�o rodem z Nowego Obozu.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_04"); //Masz co� do mojego wygl�du?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_05"); //Jeste� teraz cz�onkiem Bractwa �ni�cego, nie wiem jakim cudem ale jednak.
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_06"); //Wi�c wygl�daj zgodnie z tutejszymi standardami a nie jak chamski ma�piszon.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_07"); //Jeszcze s�owo i ten ma�piszon przetrzepie tw�j �ysy czerep! 
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_08"); //Ha! Agresja to jeden z najprostszych i najprymitywniejszych instynkt�w.
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_09"); // Moja oferta jest inna. Mog� za op�at� doprowadzi� ci� do cywilizowanego wygl�du.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_10"); //A konketnie?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_11"); //Ogoli� g�ow� na �yso i zrobi� tatua�e charakterystyczne dla naszej wsp�lnoty.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Zagol_HELLO2 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 2;
   condition    = DIA_Zagol_HELLO2_Condition;
   information  = DIA_Zagol_HELLO2_Info;
   permanent	= FALSE;
   description	= "Nie wiem czy to potrzebne. Przemy�l� to p�ki co bo lubi� sw�j dotychczasowy styl. ";
};

FUNC INT DIA_Zagol_HELLO2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Zagol_HELLO1))
	&& !(Npc_KnowsInfo(hero,DIA_Zagol_HELLO3))
{

    return TRUE;
};
};
FUNC VOID DIA_Zagol_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Zagol_HELLO2_15_01"); //Nie wiem czy to potrzebne. Przemy�l� to p�ki co bo lubi� sw�j dotychczasowy styl. 
    AI_Output (self, other ,"DIA_Zagol_HELLO2_03_02"); //Phi....Przyzwyczai�e� si� do marnoty i teraz trudno ci si� z ni� rozsta�. Prawie si� wzruszy�em....
    AI_Output (other, self ,"DIA_Zagol_HELLO2_15_03"); //Za chwil� mo�esz wr�cz p�aka� ale nie ze wzruszenia a z po�amania ko�czyn. Wi�c daruj sobie.
    AI_Output (self, other ,"DIA_Zagol_HELLO2_03_04"); //Niech b�dzie. Skoro wolisz wygl�da� jak odyniec z lasu to twoja sprawa.
    AI_StopProcessInfos	(self);
};
var int Shave_Head;
var int Shave_and_Tatto;
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Zagol_HELLO3 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 3;
   condition    = DIA_Zagol_HELLO3_Condition;
   information  = DIA_Zagol_HELLO3_Info;
   permanent	= FALSE;
   description	= "Dobra. Skoro cz�onkiem tej wsp�lnoty to powinienem si� upodobni� do pozosta�ych. ";
};

FUNC INT DIA_Zagol_HELLO3_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Zagol_HELLO1))
   && !(Npc_KnowsInfo(hero,DIA_Zagol_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_Zagol_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Zagol_HELLO3_15_01"); //Dobra. Skoro cz�onkiem tej wsp�lnoty to powinienem si� upodobni� do pozosta�ych. 
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_02"); //Pierwsza m�dra wypowied� w twojej obozowej karierze. 
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_03"); //A w�a�ciwie w naszym zak�tku zadumy i medytacji pod okiem Ja�nie O�wieconego Y'Beriona oraz Najpot�zniejszego i Niedo�cignionego �ni�cego.
    AI_Output (other, self ,"DIA_Zagol_HELLO3_15_04"); //Dosy� tych przem�w. Przejd�my do konkret�w. Chcia�bym �eby� zaj�� si� moim wygl�dem.
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_05"); //W porz�dku. Wobec tego czym dok�adnie jeste� zainteresowany?
	
	
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Zagol_HELLO4 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 4;
   condition    = DIA_Zagol_HELLO4_Condition;
   information  = DIA_Zagol_HELLO4_Info;
   permanent	= FALSE;
   description	= "Golenie g�owy i zrobienie tatua�y. (300 bry�ek rudy)";
};

FUNC INT DIA_Zagol_HELLO4_Condition()
{
if (Shave_and_Tatto != TRUE)
&& (Npc_KnowsInfo(hero,DIA_Zagol_HELLO3))

{
    return TRUE;
};
};
FUNC VOID DIA_Zagol_HELLO4_Info()
{
   // FF_ApplyOnceExt(Blackscreen, 1, BlackscreenDuration);
    Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    B_GiveInvItems (other,self, itminugget, 300);
    Mdl_SetVisualBody (hero,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald",	152, 			0,			-1);
    Shave_Head = TRUE;
	Shave_and_Tatto = TRUE;
};
var int ShaveOnlyHead;
//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Zagol_HELLO5 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 5;
   condition    = DIA_Zagol_HELLO5_Condition;
   information  = DIA_Zagol_HELLO5_Info;
   permanent	= FALSE;
   description	= "Golenie g�owy. (150 bry�ek rudy)";
};

FUNC INT DIA_Zagol_HELLO5_Condition()
{
 if (ShaveOnlyHead != TRUE)
 && (Shave_and_Tatto != TRUE)
 && (Npc_KnowsInfo(hero,DIA_Zagol_HELLO3))
{
    return TRUE;
};
};
FUNC VOID DIA_Zagol_HELLO5_Info()
{
    B_GiveInvItems (other,self, itminugget, 150);
  //  FF_ApplyOnceExt(Blackscreen, 1, BlackscreenDuration);
    Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	Mdl_SetVisualBody (hero,"hum_body_Naked0",	5,			1,			"Hum_Head_Bald",	152, 			0,			-1);   
	//Shave_Head = TRUE;
	ShaveOnlyHead = TRUE;
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Zagol_HELLO7 (C_INFO)
{
   npc          = Nov_40148_Zagol;
   nr           = 7;
   condition    = DIA_Zagol_HELLO7_Condition;
   information  = DIA_Zagol_HELLO7_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Zagol_HELLO7_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zagol_HELLO7_Info()
{
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_02"); //W�a�ciwie to kim� lepszym od ciebie pod ka�dym wzgl�dem.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_03"); //Sk�d ta pewno��?
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_04"); //Sp�jrz na siebie! 1000 nieszcz�� w jednym.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_05"); //Gadasz jakby� sam chcia� mie� nieszcz�cie i dobrze wiesz o czym m�wi�....
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_06"); //Hah lepiej id� ju� sobie. Jak b�d� chcia� to sam do ciebie zagadam.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_07"); //Nie jeste� Guru tylko zwyk�ym Nowicjuszem - robotnic� w tym mrowisku!
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_08"); //Jak �miesz tak z�o�eczy� i zni�a� nasz� wielk� wsp�lnot� duchow�. 
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_09"); //Gdyby to ode mnie zale�a�o to kaza�bym cie wych�osta�.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_10"); //Gdyby Nowicjuszu...
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_11"); //Precz st�d.
    AI_StopProcessInfos	(self);
};

instance dia_zagol_pickpocket(c_info) {
    npc = nov_40148_zagol;
    nr = 900;
    condition = dia_zagol_pickpocket_condition;
    information = dia_zagol_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_zagol_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 15);
};

func void dia_zagol_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_zagol_pickpocket);
	info_addchoice(dia_zagol_pickpocket, dialog_back, dia_zagol_pickpocket_back);
	info_addchoice(dia_zagol_pickpocket, dialog_pickpocket, dia_zagol_pickpocket_doit);
};

func void dia_zagol_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_zagol_pickpocket);
};

func void dia_zagol_pickpocket_back() {
    info_clearchoices(dia_zagol_pickpocket);
};