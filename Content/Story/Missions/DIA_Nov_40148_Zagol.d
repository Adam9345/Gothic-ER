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
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_01"); //Hola, hola! S³ysza³em, ¿e do³¹czy³eœ do naszego Bractwa.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_02"); //I co z tego?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_03"); //A to, ¿e dalej wygl¹dasz jak nikczemne czupirad³o rodem z Nowego Obozu.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_04"); //Masz coœ do mojego wygl¹du?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_05"); //Jesteœ teraz cz³onkiem Bractwa Œni¹cego, nie wiem jakim cudem ale jednak.
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_06"); //Wiêc wygl¹daj zgodnie z tutejszymi standardami a nie jak chamski ma³piszon.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_07"); //Jeszcze s³owo i ten ma³piszon przetrzepie twój ³ysy czerep! 
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_08"); //Ha! Agresja to jeden z najprostszych i najprymitywniejszych instynktów.
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_09"); // Moja oferta jest inna. Mogê za op³at¹ doprowadziæ ciê do cywilizowanego wygl¹du.
    AI_Output (other, self ,"DIA_Zagol_HELLO1_15_10"); //A konketnie?
    AI_Output (self, other ,"DIA_Zagol_HELLO1_03_11"); //Ogoliæ g³owê na ³yso i zrobiæ tatua¿e charakterystyczne dla naszej wspólnoty.
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
   description	= "Nie wiem czy to potrzebne. Przemyœlê to póki co bo lubiê swój dotychczasowy styl. ";
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
    AI_Output (other, self ,"DIA_Zagol_HELLO2_15_01"); //Nie wiem czy to potrzebne. Przemyœlê to póki co bo lubiê swój dotychczasowy styl. 
    AI_Output (self, other ,"DIA_Zagol_HELLO2_03_02"); //Phi....Przyzwyczai³eœ siê do marnoty i teraz trudno ci siê z ni¹ rozstaæ. Prawie siê wzruszy³em....
    AI_Output (other, self ,"DIA_Zagol_HELLO2_15_03"); //Za chwilê mo¿esz wrêcz p³akaæ ale nie ze wzruszenia a z po³amania koñczyn. Wiêc daruj sobie.
    AI_Output (self, other ,"DIA_Zagol_HELLO2_03_04"); //Niech bêdzie. Skoro wolisz wygl¹daæ jak odyniec z lasu to twoja sprawa.
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
   description	= "Dobra. Skoro cz³onkiem tej wspólnoty to powinienem siê upodobniæ do pozosta³ych. ";
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
    AI_Output (other, self ,"DIA_Zagol_HELLO3_15_01"); //Dobra. Skoro cz³onkiem tej wspólnoty to powinienem siê upodobniæ do pozosta³ych. 
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_02"); //Pierwsza m¹dra wypowiedŸ w twojej obozowej karierze. 
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_03"); //A w³aœciwie w naszym zak¹tku zadumy i medytacji pod okiem Jaœnie Oœwieconego Y'Beriona oraz Najpotêzniejszego i Niedoœcignionego Œni¹cego.
    AI_Output (other, self ,"DIA_Zagol_HELLO3_15_04"); //Dosyæ tych przemów. PrzejdŸmy do konkretów. Chcia³bym ¿ebyœ zaj¹³ siê moim wygl¹dem.
    AI_Output (self, other ,"DIA_Zagol_HELLO3_03_05"); //W porz¹dku. Wobec tego czym dok³adnie jesteœ zainteresowany?
	
	
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
   description	= "Golenie g³owy i zrobienie tatua¿y. (300 bry³ek rudy)";
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
   description	= "Golenie g³owy. (150 bry³ek rudy)";
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Zagol_HELLO7_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zagol_HELLO7_Info()
{
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_02"); //W³aœciwie to kimœ lepszym od ciebie pod ka¿dym wzglêdem.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_03"); //Sk¹d ta pewnoœæ?
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_04"); //Spójrz na siebie! 1000 nieszczêœæ w jednym.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_05"); //Gadasz jakbyœ sam chcia³ mieæ nieszczêœcie i dobrze wiesz o czym mówiê....
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_06"); //Hah lepiej idŸ ju¿ sobie. Jak bêdê chcia³ to sam do ciebie zagadam.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_07"); //Nie jesteœ Guru tylko zwyk³ym Nowicjuszem - robotnic¹ w tym mrowisku!
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_08"); //Jak œmiesz tak z³o¿eczyæ i zni¿aæ nasz¹ wielk¹ wspólnotê duchow¹. 
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_09"); //Gdyby to ode mnie zale¿a³o to kaza³bym cie wych³ostaæ.
    AI_Output (other, self ,"DIA_Zagol_HELLO7_15_10"); //Gdyby Nowicjuszu...
    AI_Output (self, other ,"DIA_Zagol_HELLO7_03_11"); //Precz st¹d.
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