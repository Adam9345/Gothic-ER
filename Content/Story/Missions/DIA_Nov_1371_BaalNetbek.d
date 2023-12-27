//poprawione i sprawdzone -  

/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							GÄRTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kim jesteœ?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kim jesteœ?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jestem Guru z obozu na bagnie. Moi s³udzy mówi¹ na mnie Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //S³udzy? Nie widzê tu ¿adnej s³u¿by.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Och, ale¿ oni s¹ wszêdzie. Spójrz na drzewa. Jak one tañcz¹! 
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //Eee, rozumiem. Có¿, chyba pójdê ju¿ dalej...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Zaczekaj, móg³byœ pomóc mi przekszta³ciæ to bagno w ogromn¹ ³¹kê pe³n¹ kwiatów!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Mo¿e zaczniesz beze mnie? Wrócê... nied³ugo.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ten cz³owiek raczej mi nie pomo¿e...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Czeœæ, co s³ychaæ?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Czeœæ, co s³ychaæ?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Tylko uwa¿aj, ¿ebyœ nie skrzywdzi³ moich kochanych drzew! 
};  


/*------------------------------------------------------------------------
							QUEST							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_QUEST (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_QUEST_Condition;
	information		= Nov_1371_BaalNetbek_QUEST_Info;
	important		= 0;
	description		= "Wiesz coœ o handlarzu, który sprzedaje amulety?"; 
};

FUNC int  Nov_1371_BaalNetbek_QUEST_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Talas_ABOUT_STEH))
	{
		return TRUE;
	};
};
FUNC void  Nov_1371_BaalNetbek_QUEST_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_01"); //Wiesz coœ o handlarzu, który sprzedaje amulety?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_02"); //Krzywdzi drzewa...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_03"); //Skupmy siê mo¿e na czymœ innym. Siedzisz tu ca³y czas. Widzia³eœ coœ podejrzanego?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_04"); //To by³o kilka dni temu. Rozmawia³em z moj¹ ulubion¹ paproci¹, gdy spostrzeg³em jak ktoœ czai siê za chat¹ Nyrasa. 
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_05"); //Postanowi³em schowaæ siê za du¿ym drzewem rosn¹cym nieopodal.
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_06"); //Nie uwierzysz co siê potem sta³o. Schyli³em siê i dostrzeg³em, ¿e na korzeniu mojego ulubionego drzewa roœnie olbrzymi mech!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_07"); //Próbowa³em go zerwaæ, ale wrós³ strasznie mocno!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_08"); //Moje pytanie brzmi: czy znasz jakieœ magiczne preparaty nie bazuj¹ce na alkoholu dziêki którym pozbêdê siê tego paskudztwa?
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_09"); //...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_10"); //Co siê sta³o dalej?! Handlarz! Pamiêtasz?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_11"); //No próbowa³em oderwaæ ten mech... Gdy ponownie siê rozejrza³em, zobaczy³em tylko sylwetkê biegn¹c¹ w stronê tartaku. 
	B_LogEntry               (CH3_StrangeResearcher,"Baal Netbek podobno widzia³ wieczorem Nowicjusza, który krêci³ siê w okolicach chaty Nyrasa. Nie wiem co by³o póŸniej, ale Nowicjusz oddali³ siê w stronê tartaku. Czy¿by to Hanson? ");
};  
	
//---------------------------------------------------------------1.6.1--------------------------------------------------------------
/*------------------------------------------------------------------------
							Dziwna Przypad³oœæ							
------------------------------------------------------------------------*/

instance  DIA_Nov_1371_BaalNetbek_DP (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= DIA_Nov_1371_BaalNetbek_DP_Condition;
	information		= DIA_Nov_1371_BaalNetbek_DP_Info;
	important		= 0;
	description		= "Potrzebuje nasion Rombowca Modrego. Wiesz co to jest prawda?"; 
};

FUNC int  DIA_Nov_1371_BaalNetbek_DP_Condition()
{	
	if (Npc_KnowsInfo (hero,Info_Riordian_Fiolka_Krwi))
	{
		return TRUE;
	};

};
FUNC void  DIA_Nov_1371_BaalNetbek_DP_Info()
{
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_01"); //Potrzebuje nasion Rombowca Modrego. Wiesz co to jest prawda?
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_02"); //Ja wiem... Ja wiele wiem... ale muszê dbaæ o swych przyjació³.
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_03"); //Oni musz¹ dobrze wyrosn¹æ z ziemi.
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_04"); //Wiedzia³em, ¿e nie bêdzie ³atwo..
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_05"); //Chcesz pomóc mi sadziæ nowych braci by by³o ich jak najwiêcej?
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_06"); //Nie, chce tylko...
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_07"); //Nie krêpuj siê. Sadzenie braci to sama przyjemnoœæ i dobry uczynek!
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_08"); //Czy¿by?! A co jeœli ja sadzê tylko braci, którzy rosn¹ z nasion Rombowca Modrego?
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_09"); //Dam ci te nasiona. A ty rozsiewaj je by nowe dusze do³¹czy³y do nas i ubogaci³y œwiat!
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_10"); //No i gdzie te nasiona.
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_11"); //Mam, ma³y woreczek tych rzadkich nasion. Oto one.
	CreateInvItem (Nov_1371_BaalNetbek, ItMi_Netbek_Seed);
	B_GiveInvItems (self,other,ItMi_Netbek_Seed, 1);
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_12"); //Dziêki, nie musisz siê ju¿ martwiæ o te nasiona... znaczy swoich braci czy tam przyjació³...
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_13"); //Dziêkuje za pomoc.
	 B_LogEntry               (DziwnaPrzypadlosc,"Rozmawia³em z Baalem Netbekiem. Uda³o mi siê go zmanipulowaæ by da³ mi nasiona rombowca modrego. Wiêc ten sk³adnik mam ju¿ z g³owy.");
	
};  	


//========================================
//-----------------> GRU_MUDPL
//========================================

INSTANCE DIA_BaalNetbek_GRU_MUDPL (C_INFO)
{
   npc          = Nov_1371_BaalNetbek;
   nr           = 1;
   condition    = DIA_BaalNetbek_GRU_MUDPL_Condition;
   information  = DIA_BaalNetbek_GRU_MUDPL_Info;
   permanent	= FALSE;
   description	= "Potrzebuje roœlin z tej listy.";
};

FUNC INT DIA_BaalNetbek_GRU_MUDPL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Caine_Gruzlik))
{
    return TRUE;
};
};
FUNC VOID DIA_BaalNetbek_GRU_MUDPL_Info()
{
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_01"); //Potrzebuje roœlin z tej listy.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_02"); //Nie mam ¿adnej z tych wspania³ych roœlinek.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_03"); //Cholera...
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_04"); //Ale wiem gdzie s¹ nasiona B³otniaka przyjacielu.
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_05"); //Niestety tamtejszy teren zamieszkuj¹ te okropne b³otne wê¿e a ja nie mam zamiaru sk¹czyæ w paszczy któregoœ z nich.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_06"); //Móg³byœ mi wskazaæ to mjejsce?
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_07"); //A rozniesiesz po bagnie trochê nasionek?
    B_LogEntry               (Gruzlik,"Baal Netbek nie ma ¿adnej roœliny z listy. Jednak wie gdzie s¹ nasiona B³otnika. Mo¿e mnie tam zaprowadziæ jeœli obiecam, ¿e potem rozniosê po bagnie trochê jego nasion. Có¿, chyba mam lepsze rzeczy do roboty... Nie zaszkodzi jak przy pierwszej lepszej okazji wyrzucê woreczek zió³ a zajmê siê ratowaniem Fritza.");
    Info_ClearChoices	(DIA_BaalNetbek_GRU_MUDPL);
    Info_AddChoice		(DIA_BaalNetbek_GRU_MUDPL, "Tak (Sk³am).", DIA_BaalNetbek_GRU_ADD);
};

FUNC VOID DIA_BaalNetbek_GRU_ADD()
{
AI_Output (other, self ,"DIA_BaalNetbek_GRU_ADD_15_01"); //Tak...
AI_Output (self , other,"DIA_BaalNetbek_GRU_ADD_15_02"); //WeŸ przyjacielu te kochane nasioneczka a ja najpierw ci poka¿ê gdzie s¹ nasiona B³otnika.
AI_Output (other, self ,"DIA_BaalNetbek_GRU_ADD_15_03"); //W porz¹dku.
Wld_InsertItem			(ItFo_MudHerb,"FP_ITEM_GRU_MUDPLANT");
Wld_InsertItem			(ItFo_MudSeed,"FP_ITEM_GRU_MUDSEED3");
Wld_InsertItem			(ItFo_MudSeed,"FP_ITEM_GRU_MUDSEED1");
Npc_ExchangeRoutine(self,"gruzlik");
AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GRU_MUDSEED
//========================================

INSTANCE DIA_BaalNetbek_GRU_MUDSEED (C_INFO)
{
   npc          = Nov_1371_BaalNetbek;
   nr           = 1;
   condition    = DIA_BaalNetbek_GRU_MUDSEED_Condition;
   information  = DIA_BaalNetbek_GRU_MUDSEED_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_BaalNetbek_GRU_MUDSEED_Condition()
{
if (Npc_KnowsInfo(hero,DIA_BaalNetbek_GRU_MUDPL))
&& (Npc_GetDistToWP(self,"WP_GRU_NET_PTH4")<1000)
{
    return TRUE;
};
};
FUNC VOID DIA_BaalNetbek_GRU_MUDSEED_Info()
{

    AI_PointAt(Nov_1371_BaalNetbek,"WP_PLANT_NETGRU"); 
	AI_LookAt(Nov_1371_BaalNetbek,"WP_PLANT_NETGRU");
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDSEED_03_01"); //To tam jest to wspania³e miejsce. Gdzie rosn¹ mali b³otni bracia!
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDSEED_15_02"); //Dziêki za pomoc.
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDSEED_03_03"); //Tylko pamiêtaj o nasionkach. A teraz pójdê obejrzeæ swój drzewny balet.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDSEED_15_04"); //Jasne idŸ...
	Npc_ExchangeRoutine(self,"Start");
    AI_StopProcessInfos	(self);
};

instance dia_baalnetbek_pickpocket(c_info) {
    npc = nov_1371_baalnetbek;
    nr = 900;
    condition = dia_baalnetbek_pickpocket_condition;
    information = dia_baalnetbek_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalnetbek_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalnetbek_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalnetbek_pickpocket);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_back, dia_baalnetbek_pickpocket_back);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_pickpocket, dia_baalnetbek_pickpocket_doit);
};

func void dia_baalnetbek_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_baalnetbek_pickpocket);
};

func void dia_baalnetbek_pickpocket_back() {
    info_clearchoices(dia_baalnetbek_pickpocket);
};