//poprawione i sprawdzone - Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Brennus_Exit (C_INFO)
{
	npc			= VLK_40057_Brennus;
	nr			= 999;
	condition	= DIA_Brennus_Exit_Condition;
	information	= DIA_Brennus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Brennus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Brennus_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> TaLK
//========================================

INSTANCE DIA_Brennus_TALK (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_TALK_Condition;
   information  = DIA_Brennus_TALK_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Brennus_TALK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HI_BRE2))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_TALK_Info()
{
    AI_Output (other, self ,"DIA_Brennus_TALK_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Brennus_TALK_03_02"); //Ahh... nie mam ju¿ ochoty na rozmowê.
    AI_Output (other, self ,"DIA_Brennus_TALK_15_03"); //Coœ nie tak?
    AI_Output (self, other ,"DIA_Brennus_TALK_03_04"); //Chyba jasno siê wyrazi³em nieprawda¿?
	AI_StopProcessInfos	( self );
  
};
//========================================
//-----------------> HI_BRE
//========================================

INSTANCE DIA_Brennus_HI_BRE (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_HI_BRE_Condition;
   information  = DIA_Brennus_HI_BRE_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Brennus_HI_BRE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Brennus_HI_BRE_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_02"); //Daj spokój Z ka¿dym dniem zbli¿am siê do powrotu do ,,ukochanej” kopalni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_03"); //Krew siê w cz³owieku gotuje!
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_04"); //Widzê, ¿e nie pa³asz zbytnim optymizmem co do wizyty w kopalni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_05"); //Mêczarnia I tyle. Wszystko co uzyskasz l¹duje w kieszeni Magnatów. Na dodatek ci¹gle obawiasz siê o te cholerne Pe³zacze.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_06"); //Widzia³eœ kiedyœ Pe³zacza?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_07"); //Samego pe³zacza nie ale ju¿ efekt jego lub ich posi³ku tak. Ze¿ar³y mojego kumpla.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_08"); //Dlatego siedzê tutaj I czekam na wyrok.
};

//========================================
//-----------------> HI_BRE2
//========================================

INSTANCE DIA_Brennus_HI_BRE2 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 2;
   condition    = DIA_Brennus_HI_BRE2_Condition;
   information  = DIA_Brennus_HI_BRE2_Info;
   permanent	= FALSE;
   description	= "Nie myœla³eœ by do³¹czyæ do Cieni?";
};

FUNC INT DIA_Brennus_HI_BRE2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HI_BRE))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HI_BRE2_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_01"); //Nie myœla³eœ by do³¹czyæ do Cieni?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_02"); //To nie moja bajka. Diego nic we mnie nie zobaczy. Nie mam specjalnych umiejêtnoœci czy wp³ywów wœród tutejszych Cieni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_03"); //Za to jestem doœæ silny.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_04"); //Co robi³eœ przed zrzuceniem pod barierê?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_05"); //Pracowa³em jako robotnik fizyczny tu I tam. G³ównie za ciep³e jedzenie.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_06"); //¯y³em jak ¿y³em. Ale mia³em coœ co jest najwa¿niejsze a tutaj tego brak. Wolnoœæ.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_07"); // Oby ta bariera pad³a jak najszybciej.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_08"); //Te¿ mam tak¹ nadzieje.
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Brennus_HELLO1 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_HELLO1_Condition;
   information  = DIA_Brennus_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty jesteœ Brennus?";
};

FUNC INT DIA_Brennus_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Huno_Oprawca))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_01"); //Ty jesteœ Brennus?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_02"); //Nie, jestem Gomez... Mo¿esz zadawaæ m¹drzejsze pytania.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_03"); //Skoro chcesz. Dlaczego nie donios³eœ Asghanowi o szwindlu Winstona?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_04"); //Co?!
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_05"); //By³eœ jednym z jego tragarzy. Kupi³ tani¹ broñ u Huno zamiast orê¿ wysokiej jakoœci u Skipa.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_06"); //Mówi³, ¿e to dla kopaczy do obrony...
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_07"); //Huno mówi³, ¿e Winston sprzeda³ wam tê opowiastkê. Potwierdzasz to?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_08"); //Nie czuje siê winny. Winston kaza³ to wykonaliœmy polecenie.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_09"); //Powiesz to Thorusowi.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_10"); //50 bry³ek rudy.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_11"); //Pazerny z ciebie goœæ.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_12"); //Raczej sprytny i rozs¹dny. Jak mam siê to tego mieszaæ to nie za darmo.
	  B_LogEntry               (Oprawca,"Rozmawia³em z Brennusem. Chce on 50 bry³ek rudy za pomoc w sprawie z Winstonem.");
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Brennus_HELLO2 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 2;
   condition    = DIA_Brennus_HELLO2_Condition;
   information  = DIA_Brennus_HELLO2_Info;
   permanent	= FALSE;
   description	= "Dobra, bierz rudê.";
};

FUNC INT DIA_Brennus_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HELLO1)) && (Npc_HasItems (other, ItMiNugget) >=50)
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO2_15_01"); //Dobra, bierz rudê.
	Brennus_OPR_Day = Wld_GetDay();
    AI_Output (self, other ,"DIA_Brennus_HELLO2_03_02"); // Pogadam z Thorusem. Wróæ do mnie jutro.
    B_GiveInvItems (other, self, itminugget, 50);
	  B_LogEntry               (Oprawca,"Brennus pogada z Thorusem odnoœnie szwindlu Winstona. Mam poczekaæ do jutra.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Brennus_HELLO3 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 3;
   condition    = DIA_Brennus_HELLO3_Condition;
   information  = DIA_Brennus_HELLO3_Info;
   permanent	= FALSE;
   description	= "I co rozmawia³eœ z Thorusem?";
};

FUNC INT DIA_Brennus_HELLO3_Condition()
{
if (Brennus_OPR_Day != Wld_GetDay()) &&(Npc_KnowsInfo(hero,DIA_Brennus_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_01"); //I co rozmawia³eœ z Thorusem?
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_02"); //Powiedzia³em wszystko, Thorus napisa³ list do Asghana. Obci¹¿a twojego kumpla Winstona.
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_03"); //Oto on.
	CreateInvItem (self, ItWr_OPR_THOASH);
	B_GiveInvItems (self,other, ItWr_OPR_THOASH, 1);
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_04"); //Dziêki. Teraz muszê pomówiæ z Asghanem.
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_05"); //Ale jak dostaniesz po ³bie od Winstona to masz nie pisn¹æ s³ówka o mojej roli w tej sprawie.
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_06"); //Postaram siê nie dostaæ po g³owie od tego osi³ka.
	  B_LogEntry               (Oprawca,"Brennus da³ mi list od Thorusa dla Asghana. Muszê mu go czym prêdzej dorêczyæ.");
};

//========================================
//-----------------> PZ
//========================================

INSTANCE DIA_Brennus_PZ (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_PZ_Condition;
   information  = DIA_Brennus_PZ_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Foster. Jesteœ mu winien 150 bry³ek.";
};

FUNC INT DIA_Brennus_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Foster_PZ_RUFI))
&& (Npc_HasItems (other, ItWr_PZ_Brennus) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_PZ_Info()
{
    AI_Output (other, self ,"DIA_Brennus_PZ_15_01"); //Przysy³a mnie Foster. Jesteœ mu winien 150 bry³ek.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_02"); //Co? Nie.... Mam ci dawaæ rudê dla kogoœ innego? W dodatku nie jestem mu nic winny.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_03"); //Nie krêæ. Bo jego kumple z Nowego Obozu ciê odwiedz¹.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_04"); //Eeee....Pod³y argument si³y. Mo¿e i mia³em u niego d³ug. Ale nie u ciebie. Jak przyjdzie osobiœcie to dam mu t¹ cholern¹ rudê.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_05"); //Dasz j¹ mnie. Mam pisemne upowa¿nienie od Fostera.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_06"); //Poka¿ to.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_07"); //Masz.
	B_GiveInvItems (other,self, ItWr_PZ_Brennus, 1);
	B_GiveInvItems (self,other, ItMiNugget, 150);
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Brennus_PZ_03_08"); //Takie same bazgro³y jak wtedy (pod nosem).
    AI_Output (other, self ,"DIA_Brennus_PZ_15_09"); //S³ysza³em to. Zatem rozpozna³eœ jego pismo wiêc dawaj rudê.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_10"); //Niech bêdzie. WeŸ to skoro musisz i zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_11"); //Ju¿ siê robi. Na razie.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_12"); //Taa...
	B_LogEntry           (PoszkodowaniZbieracze,"Brennus próbowa³ siê wykrêciæ ale stosowne argumenty przekona³y go to tego by przekazaæ mi rudê, któr¹ by³ winien Fosterowi. To koñczy sprawe.");
	Log_SetTopicStatus	 (PoszkodowaniZbieracze, LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};

instance dia_brennus_pickpocket(c_info) {
    npc = vlk_40057_brennus;
    nr = 900;
    condition = dia_brennus_pickpocket_condition;
    information = dia_brennus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brennus_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_brennus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brennus_pickpocket);
	info_addchoice(dia_brennus_pickpocket, dialog_back, dia_brennus_pickpocket_back);
	info_addchoice(dia_brennus_pickpocket, dialog_pickpocket, dia_brennus_pickpocket_doit);
};

func void dia_brennus_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_brennus_pickpocket);
};

func void dia_brennus_pickpocket_back() {
    info_clearchoices(dia_brennus_pickpocket);
};