//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "Czeœæ! Nie jesteœ z tego Obozu, prawda?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Czeœæ! Nie jesteœ z tego Obozu, prawda?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Có¿, teraz ju¿ jestem! Tydzieñ temu wyruszy³em ze Starego Obozu. Mój kumpel, Dusty, mia³ iœæ ze mn¹, ale postanowi³ jeszcze trochê poczekaæ.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Kopacz Melvin do³¹czy³ do Bractwa. Jego kumpel, Dusty, zosta³ w Starym Obozie, ale on te¿ zastanawia siê nad przejœciem do obozu na bagnie.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Znam Dustego - zamieniliœmy kiedyœ kilka s³ów.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Znam Dustego - zamieniliœmy kiedyœ kilka s³ów.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Gdybyœ go jeszcze kiedyœ spotka³, powiedz mu, ¿e g³upio zrobi³ nie id¹c ze mn¹. ¯ycie w Bractwie jest sto razy lepsze od ci¹g³ego u¿erania siê ze Stra¿nikami ze Starego Obozu.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Nie omieszkam mu tego powtórzyæ.
};


// **************************************************
// 				   Nozyk
// **************************************************

INSTANCE DIA_Melvin_Nozyk (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Nozyk_Condition;
	information		= DIA_Melvin_Nozyk_Info;
	permanent		= 0;
	description		= "S³ysza³em, ¿e masz pewien specjalny nó¿...";
};

FUNC INT DIA_Melvin_Nozyk_Condition()
{	
	if  (Npc_KnowsInfo(hero,DIA_Brago_Zarobek)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_Nozyk_Info()
{
	AI_Output (other, self,"DIA_Melvin_Nozyk_15_00"); //S³ysza³em, ¿e masz pewien specjalny nó¿...
	AI_Output (self, other,"DIA_Melvin_Nozyk_03_01"); //To by³o jedno z moich narzêdzi zanim trafi³em do Kolonii. Niegdyœ by³em cieœl¹.
	AI_Output (other, self,"DIA_Melvin_Nozyk_15_02"); //Teraz pewnie nie jest ci potrzebny. Mo¿e chcesz go sprzedaæ?
	AI_Output (self, other,"DIA_Melvin_Nozyk_03_03"); //Eeee... Raczej nie, to pami¹tka po starych, dobrych czasach.
	AI_Output (other, self,"DIA_Melvin_Nozyk_15_04"); //Mo¿e jednak zmienisz zdanie, gdy naprawdê dobrze zap³acê. 
	AI_Output (self, other,"DIA_Melvin_Nozyk_03_05"); //Có¿, z drugiej strony tutaj raczej na nic mi siê nie przyda. Jeœli zap³acisz mi 200 bry³ek to mogê ci go daæ.

	
};



// **************************************************
// 				   Nozyk
// **************************************************

INSTANCE DIA_Melvin_Nozyk_Ruda (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Nozyk_Ruda_Condition;
	information		= DIA_Melvin_Nozyk_Ruda_Info;
	permanent		= 0;
	description		= "Masz tu rudê.";
};

FUNC INT DIA_Melvin_Nozyk_Ruda_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Melvin_Nozyk)) 
	&& (Npc_HasItems(other,ItMiNugget) >= 200) 
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_Nozyk_Ruda_Info()
{
	AI_Output (other, self,"DIA_Melvin_Nozyk_Ruda_15_00"); //Masz tu rudê.
	AI_Output (self, other,"DIA_Melvin_Nozyk_Ruda_03_01"); //A ty mój nó¿. Tylko dobrze go wykorzystaj! 
	B_GiveInvItems      (self,hero, ItMi_Knife_Melvin, 1);		
	B_GiveInvItems      (hero,self, ItMiNugget, 200);	
	
};



//========================================
//-----------------> BG_DRINK
//========================================

INSTANCE DIA_Melvin_BG_DRINK (C_INFO)
{
   npc          = Vlk_582_Melvin;
   nr           = 1;
   condition    = DIA_Melvin_BG_DRINK_Condition;
   information  = DIA_Melvin_BG_DRINK_Info;
   permanent	= FALSE;
   description	= "Dawne przyzwyczajenia ciê nie opuœci³y...";
};

FUNC INT DIA_Melvin_BG_DRINK_Condition()
{
if (Npc_HasItems (other, ItMi_Cloth_BG) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Melvin_BG_DRINK_Info()
{
    AI_Output (other, self ,"DIA_Melvin_BG_DRINK_15_01"); //Dawne przyzwyczajenia ciê nie opuœci³y. Dalej pijesz pop³uczyny a do tego zacz¹³eœ kraœæ... nie³adnie.
    AI_Output (self, other ,"DIA_Melvin_BG_DRINK_03_02"); //O czym ty mówisz cz³owieku.
    AI_Output (other, self ,"DIA_Melvin_BG_DRINK_15_03"); //O tym!
    AI_Output (self, other ,"DIA_Melvin_BG_DRINK_03_04"); //Czemu wymachujesz mi t¹ szmat¹ przed oczami?
    AI_Output (other, self ,"DIA_Melvin_BG_DRINK_15_05"); //Bo to Twoja zguba!
    AI_Output (self, other ,"DIA_Melvin_BG_DRINK_03_06"); //Zabieraj to. To nie moja sprawa. Niczego nie ukrad³em Ghoranowi.
    AI_Output (other, self ,"DIA_Melvin_BG_DRINK_15_07"); //Nawet nie zd¹¿y³em powiedzieæ , ¿e chodzi o niego. Zatem du¿o wiesz. Podejrzanie du¿o.
    AI_Output (self, other ,"DIA_Melvin_BG_DRINK_03_08"); //Nic nie wiem. OdejdŸ ode mnie cz³owieku.
    AI_Output (other, self ,"DIA_Melvin_BG_DRINK_15_09"); //Mów co wiesz albo inaczej pogadamy.
    AI_Output (self, other ,"DIA_Melvin_BG_DRINK_03_10"); //Chcesz dostaæ po ³bie! Proszê bardzo!
		TPL_40115_GorNaPol.Npctype	= NPCTYPE_FRIEND;
		TPL_40115_GorNaPol.Guild=GIL_NONE;
		TPL_40115_GorNaPol.aivar[AIV_PARTYMEMBER] = TRUE;
		Vlk_582_Melvin.aivar[AIV_PARTYMEMBER] = TRUE;

    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};



//========================================
//-----------------> BG_ATTACK
//========================================

INSTANCE DIA_Melvin_BG_ATTACK (C_INFO)
{
   npc          = Vlk_582_Melvin;
   nr           = 2;
   condition    = DIA_Melvin_BG_ATTACK_Condition;
   information  = DIA_Melvin_BG_ATTACK_Info;
   permanent	= FALSE;
   description	= "No I co przypomnia³o ci siê co nieco Melvin?";
};

FUNC INT DIA_Melvin_BG_ATTACK_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Melvin_BG_DRINK))
{
    return TRUE;
};
};
FUNC VOID DIA_Melvin_BG_ATTACK_Info()
{
    AI_Output (other, self ,"DIA_Melvin_BG_ATTACK_15_01"); //No I co przypomnia³o ci siê co nieco Melvin?
    AI_Output (self, other ,"DIA_Melvin_BG_ATTACK_03_02"); //Ahhh moja g³owa, ¿e te¿ da³em siê w to wci¹gn¹æ...
    AI_Output (other, self ,"DIA_Melvin_BG_ATTACK_15_03"); //W co?
    AI_Output (self, other ,"DIA_Melvin_BG_ATTACK_03_04"); //Okrada³em Ghorana bo zastraszli mnie zbóje, którzy maj¹ kryjówkê na bagnie.
    AI_Output (self, other ,"DIA_Melvin_BG_ATTACK_03_05"); //Pocz¹tkowo mieliœmy robiæ interesy z czasem pobili mnie od nieprzytomnoœci I zaczêli zastraszaæ.
    AI_Output (self, other ,"DIA_Melvin_BG_ATTACK_03_06"); //Od tamtej pory by³em ich marionetk¹. 
	B_LogEntry               (BagienneGolemy,"Melvin nie chcia³ rozmawiaæ jednak gdy dosta³ nieco po g³owie zmieni³ zdanie. Okazuje siê, ¿e jest zastraszony przez pewn¹ szajkê, która osiad³a gdzieœ na bagnie.");
};

//========================================
//-----------------> BG_CAMP
//========================================

INSTANCE DIA_Melvin_BG_CAMP (C_INFO)
{
   npc          = Vlk_582_Melvin;
   nr           = 3;
   condition    = DIA_Melvin_BG_CAMP_Condition;
   information  = DIA_Melvin_BG_CAMP_Info;
   permanent	= FALSE;
   description	= "Gdzie jest ich obozowisko?";
};

FUNC INT DIA_Melvin_BG_CAMP_Condition()
{
 if (Npc_KnowsInfo(hero,DIA_Melvin_BG_ATTACK))
{
    return TRUE;
};
};
FUNC VOID DIA_Melvin_BG_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Melvin_BG_CAMP_15_01"); //Gdzie jest ich obozowisko?
    AI_Output (self, other ,"DIA_Melvin_BG_CAMP_03_02"); //Mówi³em ju¿ na bagnach. Niebezpiecznie miejsce bez dwóch zdañ.
    AI_Output (other, self ,"DIA_Melvin_BG_CAMP_15_03"); //Poka¿ nam gdzie jest ich siedziba a oczyœcimy ciê z zarzutów.
    AI_Output (self, other ,"DIA_Melvin_BG_CAMP_03_04"); //Wszystko co zrabowane maj¹ tam na miejscu. Odzyskacie towary Ghorana a ja dobre imiê.
    AI_Output (other, self ,"DIA_Melvin_BG_CAMP_15_05"); //Dobry uk³ad. Zatem prowadŸ.
    AI_Output (self, other ,"DIA_Melvin_BG_CAMP_15_06"); //Golnê sobie tylko na odwagê.
	B_LogEntry               (BagienneGolemy,"Melvin wska¿ê nam po³o¿enie ich obozowiska.");
	AI_StandUp(Vlk_582_Melvin); 
	CreateInvItem (self, ItFoBeer);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Melvin_BG_CAMP_03_07"); //W drogê.
	vlk_582_Melvin.flags=NPC_FLAG_IMMORTAL;
	Vlk_582_Melvin.attribute[ATR_HITPOINTS] = 300;
	Vlk_582_Melvin.level = 100;
	Npc_ExchangeRoutine(self,"BG");
};

//========================================
//-----------------> BG_BDT
//========================================

INSTANCE DIA_Melvin_BG_BDT (C_INFO)
{
   npc          = Vlk_582_Melvin;
   nr           = 4;
   condition    = DIA_Melvin_BG_BDT_Condition;
   information  = DIA_Melvin_BG_BDT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Melvin_BG_BDT_Condition()
{
if (Npc_GetDistToWP(hero,"PATH_AROUND_PSI17")<400)
&& (Npc_KnowsInfo(hero,DIA_Melvin_BG_CAMP))
{
    return TRUE;
};
};
FUNC VOID DIA_Melvin_BG_BDT_Info()
{
    AI_Output (self, other ,"DIA_Melvin_BG_BDT_03_01"); //To tutaj. Po drugiej stronie maj¹ swoj¹ kryjówke.
	AI_PointAt(Vlk_582_Melvin,"WP_BG_B1");    
    AI_Output (other, self ,"DIA_Melvin_BG_BDT_15_02"); //Zatem ja i Gor Na Pol zajmiemy siê tymi rozbójnikami.
    AI_Output (self, other ,"DIA_Melvin_BG_BDT_03_03"); //Dobra, ja spadam.
	Npc_ExchangeRoutine(self,"Start");
    AI_StopProcessInfos	(self);
	
	Wld_InsertItem			(ItMi_Items_BG,"FP_ITEM_BG1");
	Wld_InsertItem			(ItMi_Items_BG,"FP_ITEM_BG2");
	Wld_InsertItem			(ItMi_Items_BG,"FP_ITEM_BG3");
	Wld_InsertItem			(ItMi_Items_BG,"FP_ITEM_BG4");
};

instance dia_melvin_pickpocket(c_info) {
    npc = vlk_582_melvin;
    nr = 900;
    condition = dia_melvin_pickpocket_condition;
    information = dia_melvin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_melvin_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_melvin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_melvin_pickpocket);
	info_addchoice(dia_melvin_pickpocket, dialog_back, dia_melvin_pickpocket_back);
	info_addchoice(dia_melvin_pickpocket, dialog_pickpocket, dia_melvin_pickpocket_doit);
};

func void dia_melvin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_melvin_pickpocket);
};

func void dia_melvin_pickpocket_back() {
    info_clearchoices(dia_melvin_pickpocket);
};














