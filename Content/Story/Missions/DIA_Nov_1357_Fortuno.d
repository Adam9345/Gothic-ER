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
//					Erste Begr�ssung
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
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //Chod� bli�ej! Ka�dy nowoprzyby�y otrzymuje od Bractwa powitalny prezent!
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
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //To Mrok P�nocy - dobry towar!
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Mo�esz do mnie przychodzi� codziennie po now� porcj�, ale gdyby� chcia� dosta� wi�cej ni� przewiduje dzienna racja, b�dziesz musia� zap�aci�.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_MOD_00"); //Aha, cz�onkowie innych oboz�w nie dostaj� prezent�w.  
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Gdyby� znalaz� jakie� zio�a lub owoce mo�esz je przynie�� do mnie. Ch�tnie je od ciebie odkupi�.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Fortuno handluje bagiennym zielem. Znajd� go pod laboratorium alchemicznym.");
};

// **************************************************
//				T�gliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "Przyszed�em po moj� codzienn� porcj� ziela.";
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
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //Przyszed�em po moj� codzienn� porcj� ziela.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Prosz� bardzo. Trzy sztuki Mroku P�nocy. Tylko nie wypal wszystkiego na raz!
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //Dosta�e� ju� dzi� swoj� porcj�. Je�li chcesz wi�cej, b�dziesz musia� zap�aci�. Najlepiej przyjd� jutro.
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
	description = "Chc� co� kupi�.";
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
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Chc� co� kupi�.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Czego szukasz? A mo�e chcesz co� sprzeda�?
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
   description	= "Sprzedawa�e� co� ostatnio do Obozu Bandyt�w?";
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
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_01"); //Sprzedawa�e� co� ostatnio do Obozu Bandyt�w?
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_02"); //Te� pytanie. Ci�gle co� tam sprzedaj�. Spotykam si� z Ratfordem i Draxem. Oni odbieraj� ziele dla ca�ego Obozu, a ja zgarniam rud�.
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_03"); //Pono� sprzeda�e� im ostatnio co� wyj�tkowego. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_04"); //O, tak, tak. To Oddech �ni�cego. Ma niez�ego kopa. 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_05"); //Jak chcesz to sprzedam ci lufk� za 100 bry�ek rudy. 
    AI_Output (other, self ,"DIA_Fortuno_JointyBandytow_15_06"); //Co tak drogo? 
    AI_Output (self, other ,"DIA_Fortuno_JointyBandytow_03_07"); //Satysfakcja gwarantowana. Poza tym... te� musz� z czego� �y�.
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
   description	= "Dawaj ten Oddech �ni�cego. ";
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
    AI_Output (other, self ,"DIA_Fortuno_GiveBreathSlepper_15_01"); //Dawaj ten Oddech �ni�cego. 
    AI_Output (self, other ,"DIA_Fortuno_GiveBreathSlepper_03_02"); //Prosz� bardzo. 
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
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_02"); //Czarne cienie nad nami wkr�tce pogr��� ten �wiat.
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_03"); //Och nie! Zostaw mnie! Ja nie chc�! Ja nie chc�!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_04"); //AAAAA! �wi�tynia w dalekiej krainie? Ale jak?! Ja nie potrafi�!
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_05"); //Adanosie zmi�uj si� nade mn�!
    AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_06"); //Czy wszystko w porz�dku?
    AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_07"); //Jarkendar? Nigdy nie s�ysza�em o tym miejscu.
	AI_Output (self, other ,"DIA_Fortuno_CoTamZToba_03_08"); //Nie zmusisz mnie do tego! Zostaw mnie!
	AI_TurnAway (hero,self);
	AI_Output (other, self ,"DIA_Fortuno_CoTamZToba_15_09"); //Najlepiej zostawi� go w spokoju, wida� �e nie najlepiej zni�s� upadek �ni�cego. 
	
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
   description	= "Potrzebuje ro�lin z tej listy.";
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
    AI_Output (other, self ,"DIA_Fortuno_Gruzlik_15_01"); //Potrzebuje ro�lin z tej listy.
	B_UseFakeScroll( );
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_02"); //Mam tylko t� ostatni�. Ale dam ci j� dopiero wtedy kiedy odp�dzisz ode mnie tego natr�tnego Nowicjusza. 
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_03"); //Na�pa� si� i w�cieka si�, �e nie chce sprzeda� mu wi�cej mocnego ziela. Demoluje moje stanowisko handlowe i nie daje egzystowa� w spokoju.
    AI_Output (other, self ,"DIA_Fortuno_Gruzlik_15_04"); //Zatem dam mu nauczk�.
    AI_Output (self, other ,"DIA_Fortuno_Gruzlik_03_05"); //Z g�ry dzi�kuje.
	B_LogEntry               (Gruzlik,"Fortuno mo�e mi odda� Mgie�k� lecz najpierw musz� da� nauczk� pewnemu na�panemu Nowicjuszowi, kt�ry nie daje mu �y�. Musz� mu wyperswadowa� dr�czenie Fortuno.");
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
   description	= "Ten na�pany pajac da ci spok�j.";
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
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_01"); //Ten na�pany pajac da ci spok�j.
    AI_Output (self, other ,"DIA_Fortuno_HELLO1_03_02"); //Dzi�kuje. Jestem twoim d�u�nikiem.
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_03"); //Co jak co ale obieca�e� mi ro�lin�.
    AI_Output (self, other ,"DIA_Fortuno_HELLO1_03_04"); //Dobrze we� j�. Zas�u�y�e�.
	B_GiveInvItems (self,other, ItFo_MgiHerb, 1);
    AI_Output (other, self ,"DIA_Fortuno_HELLO1_15_05"); //Dzi�ki. Trzymaj si�.
	B_LogEntry               (Gruzlik,"Upora�em si� z na�panym Nowicjuszem a Fortuno w podzi�ce odda� mi jeden okaz Mgie�ki.");
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
   description	= "Chcia�bym kupi� specjalnego skr�ta. Nazywa si� ,,Ryk d�ungli�.";
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
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_01"); //Chcia�bym kupi� specjalnego skr�ta. Nazywa si� ,,Ryk d�ungli�.
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_02"); //No! �wietny gust! Ten skr�t jest naprawd� wyj�tkowy I zapewnia unikalne doznania!
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_03"); //W�a�ciwie to nie dla mnie. Ale mniejsza o to. To jak dostan� go?
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_04"); //Mog� ci go sprzeda� za 100 bry�ek. Ale najpierw mam do ciebie pewn� pro�b�.
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_05"); //Mianowicie?
    AI_Output (self, other ,"DIA_Fortuno_ZD_03_06"); //Sakhar zawsze zagl�da� do mnie I kupowa� soporo ziela. Od jakiego� czasu to si� zmieni�o. M�g�by� si� dowiedzie� dlaczego nagle zmieni� upodobania?
    AI_Output (other, self ,"DIA_Fortuno_ZD_15_07"); //Niech b�dzie.
	B_LogEntry               (ZachciankiDiliona,"Rozmawia�em z Fortuno. Sprzeda mi specjalnego skr�ta za 100 bry�ek. Ale najpierw mam dowiedzie� si� czemu Sakhar przesta� kupowa� u niego ziele. Pogadam z nim. To ten kt�ry ma namiot za ku�ni� Darriona.");
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
   description	= "Sakhar zn�w b�dzie si� u ciebie zaopatrywa� w ziele.";
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
    AI_Output (other, self ,"DIA_Fortuno_ZD_HERB_15_01"); //Sakhar zn�w b�dzie si� u ciebie zaopatrywa� w ziele.
    AI_Output (self, other ,"DIA_Fortuno_ZD_HERB_03_02"); //�wietnie. Zatem zn�w b�d� mia� niez�y zarobek. On naprawd� sporo pali.
    AI_Output (other, self ,"DIA_Fortuno_ZD_HERB_15_03"); //Sprzedasz mi tego skr�ta?
    AI_Output (self, other ,"DIA_Fortuno_ZD_HERB_03_04"); //Jasne. Daj mi to 100 bry�ek I skr�t jest tw�j.
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
   description	= "Trzymaj (100 bry�ek rudy)";
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
    AI_Output (other, self ,"DIA_Fortuno_ZD_JOINT_15_01"); //Trzymaj (100 bry�ek rudy)
    AI_Output (self, other ,"DIA_Fortuno_ZD_JOINT_03_02"); //Prosz�.
    AI_Output (self, other ,"DIA_Fortuno_ZD_JOINT_03_03"); //No I taki biznes to sama przyjemno��. Jak b�dziesz jeszcze chcia� kupi� co� ciekawego do palenia to wpadnij do mojego kramu.
	B_GiveInvItems (other,self, itminugget, 100);
	B_GiveInvItems (self,other, ItMiJoint_ZD, 1);
	B_LogEntry               (ZachciankiDiliona,"Po za�atwieniu sprawy Sakahra kupi�em u Fortuno specjalnego skr�ta. Teraz powinien zaj�� si� pozosta�ymi rzeczami dla Dillona.");
	
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