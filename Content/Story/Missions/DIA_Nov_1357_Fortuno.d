//poprawione i sprawdzone -  

// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_Fortuno_EXIT (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 999;
	condition	= DIA_Fortuno_EXIT_Condition;
	information	= DIA_Fortuno_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_Fortuno_Greet (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_Greet_Condition;
	information	= DIA_Fortuno_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_Greet_Info()
{
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //ChodŸ bli¿ej! Ka¿dy nowoprzyby³y otrzymuje od Bractwa powitalny prezent!
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance  DIA_Fortuno_GetGeschenk (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_GetGeschenk_Condition;
	information	= DIA_Fortuno_GetGeschenk_Info;
	permanent	= 0;
	description = "Co to za prezent?";
};                       

FUNC int  DIA_Fortuno_GetGeschenk_Condition()
{
if (Kapitel < 4) && (Npc_KnowsInfo(hero,DIA_Fortuno_Greet))
{
	return 1; };
};

FUNC VOID  DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output (other, self,"DIA_Fortuno_GetGeschenk_15_00"); //Co to za prezent?
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //To Mrok Pó³nocy - dobry towar!
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Mo¿esz do mnie przychodziæ codziennie po now¹ porcjê, ale gdybyœ chcia³ dostaæ wiêcej ni¿ przewiduje dzienna racja, bêdziesz musia³ zap³aciæ.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_MOD_00"); //Aha, cz³onkowie innych obozów nie dostaj¹ prezentów.  
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Gdybyœ znalaz³ jakieœ zio³a lub owoce mo¿esz je przynieœæ do mnie. Chêtnie je od ciebie odkupiê.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Fortuno handluje bagiennym zielem. Znajdê go pod laboratorium alchemicznym.");
};

// **************************************************
//				Tägliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "Przyszed³em po moj¹ codzienn¹ porcjê ziela.";
};                       

FUNC int  DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) && (Kapitel < 4) && ( (Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_NOV) ||(Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR)  )
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_DailyRation_Info()
{
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //Przyszed³em po moj¹ codzienn¹ porcjê ziela.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Proszê bardzo. Trzy sztuki Mroku Pó³nocy. Tylko nie wypal wszystkiego na raz!
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //Dosta³eœ ju¿ dziœ swoj¹ porcjê. Jeœli chcesz wiêcej, bêdziesz musia³ zap³aciæ. Najlepiej przyjdŸ jutro.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Fortuno_BuyJoints (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 4;
	condition	= DIA_Fortuno_BuyJoints_Condition;
	information	= DIA_Fortuno_BuyJoints_Info;
	permanent	= 1;
	description = "Chcê coœ kupiæ.";
	Trade		= 1;
};                       

FUNC int  DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk)) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_BuyJoints_Info()
{
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Chcê coœ kupiæ.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Czego szukasz? A mo¿e chcesz coœ sprzedaæ?
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> JointyBandytow
//========================================

INSTANCE DIA_Fortuno_JointyBandytow (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_JointyBandytow_Condition;
   information  = DIA_Fortuno_JointyBandytow_Info;
   permanent	= FALSE;
   description	= "Sprzedawa³eœ coœ ostatnio do Obozu Bandytów?";
};

FUNC INT DIA_Fortuno_JointyBandytow_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_AboutRatford))
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_JointyBandytow_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_01"); //Sprzedawa³eœ coœ ostatnio do Obozu Bandytów?
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_02"); //Te¿ pytanie. Ci¹gle coœ tam sprzedajê. Spotykam siê z Ratfordem i Draxem. Oni odbieraj¹ ziele dla ca³ego Obozu, a ja zgarniam rudê.
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_03"); //Ponoæ sprzeda³eœ im ostatnio coœ wyj¹tkowego. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_04"); //O, tak, tak. To Oddech Œni¹cego. Ma niez³ego kopa. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_05"); //Jak chcesz to sprzedam ci lufkê za 100 bry³ek rudy. 
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_06"); //Co tak drogo? 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_07"); //Satysfakcja gwarantowana. Poza tym... te¿ muszê z czegoœ ¿yæ.
};

//========================================
//-----------------> GiveBreathSlepper
//========================================

INSTANCE DIA_Fortuno_GiveBreathSlepper (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 2;
   condition    = DIA_Fortuno_GiveBreathSlepper_Condition;
   information  = DIA_Fortuno_GiveBreathSlepper_Info;
   permanent	= TRUE;
   description	= "Dawaj ten Oddech Œni¹cego. ";
};

FUNC INT DIA_Fortuno_GiveBreathSlepper_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fortuno_JointyBandytow))
    && (MIS_CourierFireMage == LOG_RUNNING) 
    && (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_GiveBreathSlepper_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_GiveBreathSlepper_15_01"); //Dawaj ten Oddech Œni¹cego. 
    AI_Output (self, other ,"DIA_Fortuno_GiveBreathSlepper_03_02"); //Proszê bardzo. 
    CreateInvItems (self, ItMis_SlepperBreathJoint, 1);
    B_GiveInvItems (self, other, ItMis_SlepperBreathJoint, 1);
    B_GiveInvItems (other, self, ItMiNugget, 100);
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> CoTamZToba
//========================================

INSTANCE DIA_Fortuno_CoTamZToba (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_CoTamZToba_Condition;
   information  = DIA_Fortuno_CoTamZToba_Info;
   permanent	= FALSE;
   description	= "Fortuno! To ty?";
};

FUNC INT DIA_Fortuno_CoTamZToba_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fortuno_CoTamZToba_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_01"); //Fortuno! To ty?
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_02"); //Czarne cienie nad nami wkrótce pogr¹¿¹ ten œwiat.
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_03"); //Och nie! Zostaw mnie! Ja nie chcê! Ja nie chcê!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_04"); //AAAAA! Œwi¹tynia w dalekiej krainie? Ale jak?! Ja nie potrafiê!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_05"); //Adanosie zmi³uj siê nade mn¹!
    AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_06"); //Czy wszystko w porz¹dku?
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_07"); //Jarkendar? Nigdy nie s³ysza³em o tym miejscu.
	AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_08"); //Nie zmusisz mnie do tego! Zostaw mnie!
	AI_TurnAway (hero,self);
	AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_09"); //Najlepiej zostawiê go w spokoju, widaæ ¿e nie najlepiej zniós³ upadek Œni¹cego. 
	
};

//========================================
//-----------------> Gruzlik
//========================================

INSTANCE DIA_Fortuno_Gruzlik (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_Gruzlik_Condition;
   information  = DIA_Fortuno_Gruzlik_Info;
   permanent	= FALSE;
   description	= "Potrzebuje roœlin z tej listy.";
};

FUNC INT DIA_Fortuno_Gruzlik_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Caine_Gruzlik))

{
    return TRUE;
};
};
FUNC VOID DIA_Fortuno_Gruzlik_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_Gruzlik_15_01"); //Potrzebuje roœlin z tej listy.
	B_UseFakeScroll( );
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_02"); //Mam tylko t¹ ostatni¹. Ale dam ci j¹ dopiero wtedy kiedy odpêdzisz ode mnie tego natrêtnego Nowicjusza. 
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_03"); //Naæpa³ siê i wœcieka siê, ¿e nie chce sprzedaæ mu wiêcej mocnego ziela. Demoluje moje stanowisko handlowe i nie daje egzystowaæ w spokoju.
    AI_Output (other, self ,"DIA_Fortuno_Gruzlik_15_04"); //Zatem dam mu nauczkê.
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_05"); //Z góry dziêkuje.
	B_LogEntry               (Gruzlik,"Fortuno mo¿e mi oddaæ Mgie³kê lecz najpierw muszê daæ nauczkê pewnemu naæpanemu Nowicjuszowi, który nie daje mu ¿yæ. Muszê mu wyperswadowaæ drêczenie Fortuno.");
	NOV_40065_Cpun.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		NOV_40065_Cpun.aivar[AIV_HASDEFEATEDSC] = FALSE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Fortuno_HELLO1 (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_HELLO1_Condition;
   information  = DIA_Fortuno_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ten naæpany pajac da ci spokój.";
};

FUNC INT DIA_Fortuno_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Cpun_Gruzlik_2))
{
    return TRUE;
};
};
FUNC VOID DIA_Fortuno_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_01"); //Ten naæpany pajac da ci spokój.
    AI_Output (self, other ,"DIA_Fortuno_HELLO1_03_02"); //Dziêkuje. Jestem twoim d³u¿nikiem.
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_03"); //Co jak co ale obieca³eœ mi roœlinê.
    AI_Output (self, other ,"DIA_Fortuno_HELLO1_03_04"); //Dobrze weŸ j¹. Zas³u¿y³eœ.
	B_GiveInvItems (self,other, ItFo_MgiHerb, 1);
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_05"); //Dziêki. Trzymaj siê.
	B_LogEntry               (Gruzlik,"Upora³em siê z naæpanym Nowicjuszem a Fortuno w podziêce odda³ mi jeden okaz Mgie³ki.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZD
//========================================

INSTANCE DIA_Fortuno_ZD (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_ZD_Condition;
   information  = DIA_Fortuno_ZD_Info;
   permanent	= FALSE;
   description	= "Chcia³bym kupiæ specjalnego skrêta. Nazywa siê ,,Ryk d¿ungli”.";
};

FUNC INT DIA_Fortuno_ZD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Dillon_ZD_YES))
{
    return TRUE;
};
};
FUNC VOID DIA_Fortuno_ZD_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_01"); //Chcia³bym kupiæ specjalnego skrêta. Nazywa siê ,,Ryk d¿ungli”.
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_02"); //No! Œwietny gust! Ten skrêt jest naprawdê wyj¹tkowy I zapewnia unikalne doznania!
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_03"); //W³aœciwie to nie dla mnie. Ale mniejsza o to. To jak dostanê go?
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_04"); //Mogê ci go sprzedaæ za 100 bry³ek. Ale najpierw mam do ciebie pewn¹ proœbê.
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_05"); //Mianowicie?
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_06"); //Sakhar zawsze zagl¹da³ do mnie I kupowa³ soporo ziela. Od jakiegoœ czasu to siê zmieni³o. Móg³byœ siê dowiedzieæ dlaczego nagle zmieni³ upodobania?
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_07"); //Niech bêdzie.
	B_LogEntry               (ZachciankiDiliona,"Rozmawia³em z Fortuno. Sprzeda mi specjalnego skrêta za 100 bry³ek. Ale najpierw mam dowiedzieæ siê czemu Sakhar przesta³ kupowaæ u niego ziele. Pogadam z nim. To ten który ma namiot za kuŸni¹ Darriona.");
};

//========================================
//-----------------> ZD_HERB
//========================================

INSTANCE DIA_Fortuno_ZD_HERB (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 1;
   condition    = DIA_Fortuno_ZD_HERB_Condition;
   information  = DIA_Fortuno_ZD_HERB_Info;
   permanent	= FALSE;
   description	= "Sakhar znów bêdzie siê u ciebie zaopatrywa³ w ziele.";
};

FUNC INT DIA_Fortuno_ZD_HERB_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_ZD_HARPY))
{
    return TRUE;
};
};
FUNC VOID DIA_Fortuno_ZD_HERB_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_ZD_HERB_15_01"); //Sakhar znów bêdzie siê u ciebie zaopatrywa³ w ziele.
    AI_Output (self, other ,"DIA_Fortuno_ZD_HERB_03_02"); //Œwietnie. Zatem znów bêdê mia³ niez³y zarobek. On naprawdê sporo pali.
    AI_Output (other, self ,"DIA_Fortuno_ZD_HERB_15_03"); //Sprzedasz mi tego skrêta?
    AI_Output (self, other ,"DIA_Fortuno_ZD_HERB_03_04"); //Jasne. Daj mi to 100 bry³ek I skrêt jest twój.
};

//========================================
//-----------------> ZD_JOINT
//========================================

INSTANCE DIA_Fortuno_ZD_JOINT (C_INFO)
{
   npc          = NOV_1357_Fortuno;
   nr           = 2;
   condition    = DIA_Fortuno_ZD_JOINT_Condition;
   information  = DIA_Fortuno_ZD_JOINT_Info;
   permanent	= FALSE;
   description	= "Trzymaj (100 bry³ek rudy)";
};

FUNC INT DIA_Fortuno_ZD_JOINT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fortuno_ZD_HERB))
&& (Npc_HasItems (other, ItMiNugget) >=100)
{
    return TRUE;
};
};
FUNC VOID DIA_Fortuno_ZD_JOINT_Info()
{
    AI_Output (other, self ,"DIA_Fortuno_ZD_JOINT_15_01"); //Trzymaj (100 bry³ek rudy)
    AI_Output (self, other ,"DIA_Fortuno_ZD_JOINT_03_02"); //Proszê.
    AI_Output (self, other ,"DIA_Fortuno_ZD_JOINT_03_03"); //No I taki biznes to sama przyjemnoœæ. Jak bêdziesz jeszcze chcia³ kupiæ coœ ciekawego do palenia to wpadnij do mojego kramu.
	B_GiveInvItems (other,self, itminugget, 100);
	B_GiveInvItems (self,other, ItMiJoint_ZD, 1);
	B_LogEntry               (ZachciankiDiliona,"Po za³atwieniu sprawy Sakahra kupi³em u Fortuno specjalnego skrêta. Teraz powinien zaj¹æ siê pozosta³ymi rzeczami dla Dillona.");
	
};

instance dia_fortuno_pickpocket(c_info) {
    npc = nov_1357_fortuno;
    nr = 900;
    condition = dia_fortuno_pickpocket_condition;
    information = dia_fortuno_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fortuno_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 40);
};

func void dia_fortuno_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fortuno_pickpocket);
	info_addchoice(dia_fortuno_pickpocket, dialog_back, dia_fortuno_pickpocket_back);
	info_addchoice(dia_fortuno_pickpocket, dialog_pickpocket, dia_fortuno_pickpocket_doit);
};

func void dia_fortuno_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_fortuno_pickpocket);
};

func void dia_fortuno_pickpocket_back() {
    info_clearchoices(dia_fortuno_pickpocket);
};