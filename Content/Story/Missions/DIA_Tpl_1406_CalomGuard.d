//poprawione i sprawdzone -  

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_KalomsGuard_Exit (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 999;
	condition	= DIA_KalomsGuard_Exit_Condition;
	information	= DIA_KalomsGuard_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						PERM
// **************************************************

instance  DIA_KalomsGuard_PERM (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 1;
	condition	= DIA_KalomsGuard_PERM_Condition;
	information	= DIA_KalomsGuard_PERM_Info;
	permanent	= 1;
	description	= "Chyba nie bêdziesz mia³ nic przeciwko, jeœli tam wejdê?";
};                       

FUNC int  DIA_KalomsGuard_PERM_Condition()
{
	if !(Npc_KnowsInfo(hero,DIA_Perrick_DEXTER))
{
	return 1;
};
};
FUNC VOID  DIA_KalomsGuard_PERM_Info()
{
	AI_Output (other, self,"DIA_KalomsGuard_PERM_15_00"); //Chyba nie bêdziesz mia³ nic przeciwko, jeœli tam wejdê?
	AI_Output (self, other,"DIA_KalomsGuard_PERM_13_01"); //Okazuj mojemu mistrzowi nale¿yty szacunek, albo nie po¿yjesz d³ugo!
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> WDC
//========================================

INSTANCE DIA_Templer_WDC (C_INFO)
{
   npc          = Tpl_1406_Templer;
   nr           = 1;
   condition    = DIA_Templer_WDC_Condition;
   information  = DIA_Templer_WDC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_WDC_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_Perrick_CALOM))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_WDC_Info()
{
    AI_Output (self, other ,"DIA_Templer_WDC_03_01"); //Nie wolno ci wejœæ do œrodka. I to pod ¿adnym pozorem!
    AI_Output (other, self ,"DIA_Templer_WDC_15_02"); //A to dlaczego?
    AI_Output (self, other ,"DIA_Templer_WDC_03_03"); //Mistrzowi Calomowi skradziono pewn¹ bardzo cenn¹ recepturê.
    AI_Output (self, other ,"DIA_Templer_WDC_03_04"); //Nie mogê pozwoliæ by to siê powtórzy³o. Winnego spotka surowa kara!
    AI_Output (other, self ,"DIA_Templer_WDC_15_05"); //Mo¿e nieco rudy sprawi, ¿e przymkniesz na mnie oko...
    AI_Output (self, other ,"DIA_Templer_WDC_03_06"); //Wynocha mi st¹d! I to natychmiast!
    AI_Output (other, self ,"DIA_Templer_WDC_15_07"); //Jak chcesz.
	B_LogEntry               (WiazankaDlaCorCaloma,"Kradzie¿, której dokona³em wysz³a na jaw. Ludzie z Sekty nie wiedz¹ kto jej dokona³ ale ochroniarz Caloma nie wpuœci mnie tak po prostu do jego siedziby. Muszê pomówiæ z kimœ zaufanym w obozie.");
};

//========================================
//-----------------> WDC_GetOut
//========================================

INSTANCE DIA_Templer_WDC_GetOut (C_INFO)
{
   npc          = Tpl_1406_Templer;
   nr           = 1;
   condition    = DIA_Templer_WDC_GetOut_Condition;
   information  = DIA_Templer_WDC_GetOut_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Templer_WDC_GetOut_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Pc_Psionic_WDC_CalomGuard))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_WDC_GetOut_Info()
{
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_01"); //Mówi³em ju¿... Wynoœ siê st¹d w podskokach!
    AI_Output (other, self ,"DIA_Templer_WDC_GetOut_15_02"); //Spokojnie... Chcia³em Ciê tylko poinformowaæ, ¿e wo³aj¹ ciê na plac treningowy.
    AI_Output (other, self ,"DIA_Templer_WDC_GetOut_15_03"); //Ponoæ organizuj¹ jakieœ zawody, czy coœ...
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_04"); //Turniej mówisz..
    AI_Output (other, self ,"DIA_Templer_WDC_GetOut_15_05"); //To mo¿e byæ dobra okazja, byœ zosta³ zauwa¿onym...
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_06"); //Ale co z pilnowaniem mistrza Cor Caloma?
    AI_Output (other, self ,"DIA_Templer_WDC_GetOut_15_07"); //Ja ciê zast¹piê. Obijesz parê ³bów i wrócisz.
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_08"); //Chyba ¿artujesz? TY? Naprawdê? Nie wydaje mi siê, byœ by³ w stanie pokonaæ nawet rannego b³otnego wê¿a...
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_09"); //Ale niech bêdzie. Postoisz tu a ja w tym czasie wezmê udzia³ w tym turnieju.
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_10"); //Mistrz zapewne i tak niczego nie zauwa¿y. Jest zbyt zajêty swoimi badaniami.
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_12"); //Tylko jest ma³y problem. Zawsze walczy³em na arenie moim ulubionym mieczem.
    AI_Output (self, other ,"DIA_Templer_WDC_GetOut_03_13"); //Ostanio odda³em go do ostrzenia kowalowi Darrionowi. Przynieœ mi go. Tylko siê poœpiesz!

	B_LogEntry               (WiazankaDlaCorCaloma,"Ochroniarz Caloma ma miecz u naprawy u obozowego kowala Darriona. Muszê siê do niego udaæ I odebraæ broñ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WDC_SWORD
//========================================

INSTANCE DIA_Templer_WDC_SWORD (C_INFO)
{
   npc          = Tpl_1406_Templer;
   nr           = 1;
   condition    = DIA_Templer_WDC_SWORD_Condition;
   information  = DIA_Templer_WDC_SWORD_Info;
   permanent	= FALSE;
  important = TRUE;
};

FUNC INT DIA_Templer_WDC_SWORD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Darrion_WDC_Sakhar_Change))
&& (Npc_HasItems (other, ITMW_CalomGuardSWD) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_WDC_SWORD_Info()
{

    AI_Output (self, other ,"DIA_Templer_WDC_SWORD_03_00"); //Masz mój miecz czy znowu przyszed³eœ mnie denerwowaæ?!
    AI_Output (other, self ,"DIA_Templer_WDC_SWORD_15_01"); //Mam.
    AI_Output (self, other ,"DIA_Templer_WDC_SWORD_03_02"); //Dawaj!
    AI_Output (other, self ,"DIA_Templer_WDC_SWORD_15_03"); //Trzymaj.
	B_GiveInvItems (other,self, ITMW_CalomGuardSWD, 1);
	AI_EquipBestMeleeWeapon	(Tpl_1406_Templer);                    
    AI_Output (self, other ,"DIA_Templer_WDC_SWORD_03_04"); //No dobra, d³ugo mi znie zejdzie...
    AI_Output (other, self ,"DIA_Templer_WDC_SWORD_15_05"); //Powodzenia...
	Npc_ExchangeRoutine(Tpl_1406_Templer,"Arena");
    AI_Output (self, other ,"DIA_Templer_WDC_SWORD_03_06"); //Obêdzie siê bez. Zwyciêstwo ju¿ mam w kieszeni! Jestem na to za dobry!
    AI_Output (other, self ,"DIA_Templer_WDC_SWORD_15_07"); //Z pewnoœci¹...
	B_LogEntry               (WiazankaDlaCorCaloma,"Da³em ochroniarzowi Caloma jego miecz a ten w podnieceniu pobieg³ na plac treningowy. Droga wolna.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WDC_TURNIEJ
//========================================

INSTANCE DIA_Templer_WDC_TURNIEJ (C_INFO)
{
   npc          = Tpl_1406_Templer;
   nr           = 1;
   condition    = DIA_Templer_WDC_TURNIEJ_Condition;
   information  = DIA_Templer_WDC_TURNIEJ_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Templer_WDC_TURNIEJ_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Perrick_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Templer_WDC_TURNIEJ_Info()
{
    AI_Output (self, other ,"DIA_Templer_WDC_TURNIEJ_03_01"); //Ty gnido! Oszuka³eœ mnie, nie by³o ¿adnego turnieju!
    AI_Output (other, self ,"DIA_Templer_WDC_TURNIEJ_15_02"); //Ahhh... Widocznie coœ pomyli³em.
    AI_Output (self, other ,"DIA_Templer_WDC_TURNIEJ_03_03"); //Jeœli mistrzowi Calomowi cokolwiek zginê³o, to poszatkuje ciê i rzucê na po¿arcie b³otnym wê¿om!
    AI_Output (other, self ,"DIA_Templer_WDC_TURNIEJ_15_04"); //Jestem pewien, ¿e nic mu nie zginê³o... A raczej nawet przyby³o trochê zmarszczek ze z³oœci...
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WDC_TURNIEJ
//========================================
INSTANCE Info_Tpl_1406_LastWarn (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 1;
	condition	= Info_Tpl_1406_LastWarn_Condition;
	information	= Info_Tpl_1406_LastWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Tpl_1406_LastWarn_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Templer_WDC))
	&& (PerrickGiftForCalom == LOG_MISSION)
	
	{
		return TRUE;
	};
};

func int Info_Tpl_1406_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Tpl_1406_LastWarn_13_01"); 		//Powiedzia³em, wynoœ siê z t¹d!

	AI_GotoWP (hero, "PSI_PATH_12"); 
	
	AI_StopProcessInfos	(self);
	
};


//========================================
//-----------------> WDC_TURNIEJ
//========================================
INSTANCE Info_Tpl_1406_LastWarnD (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 1;
	condition	= Info_Tpl_1406_LastWarnD_Condition;
	information	= Info_Tpl_1406_LastWarnD_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Tpl_1406_LastWarnD_Condition()
{
	if  (Npc_KnowsInfo(hero,DIA_Templer_WDC_GetOut))
	&& !(Npc_HasItems (other, ITMW_CalomGuardSWD) >=1
	&& (PerrickGiftForCalom != LOG_SUCCESS))
	&& (kapitel == 10)
	{
		return TRUE;
	};
};

func int Info_Tpl_1406_LastWarnD_Info()
{
	AI_Output (self, hero,"Info_Tpl_1406_LastWarnD_13_01"); 		//Wynocha po miecz, bo inaczej nakarmiê tob¹ b³otne wê¿e.

	AI_GotoWP (hero, "PSI_PATH_12"); 
	
	AI_StopProcessInfos	(self);
	
};

instance dia_kalomsguard_pickpocket(c_info) {
    npc = tpl_1406_templer;
    nr = 900;
    condition = dia_kalomsguard_pickpocket_condition;
    information = dia_kalomsguard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kalomsguard_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_kalomsguard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kalomsguard_pickpocket);
	info_addchoice(dia_kalomsguard_pickpocket, dialog_back, dia_kalomsguard_pickpocket_back);
	info_addchoice(dia_kalomsguard_pickpocket, dialog_pickpocket, dia_kalomsguard_pickpocket_doit);
};

func void dia_kalomsguard_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_kalomsguard_pickpocket);
};

func void dia_kalomsguard_pickpocket_back() {
    info_clearchoices(dia_kalomsguard_pickpocket);
};