// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hej, ty!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kto? Ja?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Wiesz dobrze, do kogo mówiê, synku!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Coœ ci powiem: to mój rejon i nie chcê tutaj ¿adnych k³opotów!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Ale nowi, tacy jak ty, zawsze sprawiaj¹ k³opoty. Zw³aszcza, kiedy buszuj¹ tutaj w nocy.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Lepiej bêdzie, jeœli pójdziesz sobie ju¿ do domu i nie poka¿esz siê tutaj zbyt prêdko. Przy arenie jest jedna pusta chata, ma daszek nad wejœciem. IdŸ spaæ!
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Ale jeœli z³apiê ciê na grzebaniu w cudzych chatach, osobiœcie postaram siê, ¿ebyœ ju¿ nigdy wiêcej tego nie zrobi³!
	b_givexp (150);
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Jeœli chcesz siê pozbyæ swoich pieniêdzy za ochronê, wybra³eœ z³y dzieñ.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? A dlaczego?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Bo mnie tu nie ma.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Rozumiem." 	,DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"To jakim cudem z tob¹ rozmawiam?"	,DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Czy¿by? A gdzie jesteœ?"	,DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Czy¿by? A gdzie jesteœ?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //W tej chwili siedzê w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //To jakim cudem z tob¹ rozmawiam?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek gdzieœ znikn¹³. Zwykle to on patroluje ten rejon.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dopóki nie raczy siê tutaj zjawiæ, Thorus kaza³ MI mieæ oko na wszystko.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Rozumiem.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Wiesz, gdzie siê podziewa Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if (( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) ) && (Sly_LostNek == LOG_RUNNING)) || (MIS_WheresNek == LOG_RUNNING)
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Wiesz, gdzie siê podziewa Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Nie, i raczej siê tego nie dowiem.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Jeœli komuœ coœ o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj¹ ze Stra¿nikami.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //A zw³aszcza ze mn¹, bo wiedz¹, ¿e brzydzê siê ich robot¹. Za³o¿ê siê, ¿e podœmiewaj¹ siê ze mnie za moimi plecami.
	
	if (Sly_LostNek != LOG_SUCCESS)
	{
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,	"Mo¿e Kopacze mieszkaj¹cy w pobli¿u areny wiedz¹ gdzie siê podzia³ Nek.");
	};
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Ale dlaczego nie zbierasz pieniêdzy za ochronê?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Ale dlaczego nie zbierasz pieniêdzy za ochronê?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek zebra³ ju¿, co by³o do zebrania. Wiêcej z nich nie wycisnê.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Chodzi o Neka...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Chodzi o Neka.
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Tak?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Chyba go znalaz³em.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Co? Gdzie on jest?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //W innym, lepszym œwiecie...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //O cholera! To znaczy, ¿e bêdê tutaj tkwi³ do koñca ¿ycia. Mia³em nadziejê, ¿e ten bêcwa³ jednak wróci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Teraz mam k³opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //¯adnych wieœci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Informuj mnie na bie¿¹co.
	};
};

// ************************************************************
//						Wo Nek 2			
// ************************************************************

instance DIA_Fletcher_WoNek2 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek2_Condition;
	information		= DIA_Fletcher_WoNek2_Info;
	permanent		= 0;
	description		= "Snaf twierdzi, ¿e Nek ¿yje.";
};

func int DIA_Fletcher_WoNek2_Condition()
{	
	if  (MIS_WheresNek == LOG_RUNNING) && (fletcher_foundNek == true)
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek2_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_00"); //Snaf twierdzi, ¿e Nek ¿yje.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_01"); //O czym ty znowu gadasz? Dopiero co mówi³eœ, ¿e gryzie piach! 
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_02"); //Pewne okolicznoœci uleg³y zmianom. Byæ mo¿e trup le¿¹cy w jaskini za Obozem nie jest tym Stra¿nikiem, o którego nam chodzi. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_03"); //To co ty tu jeszcze robisz? Szukaj tego imbecyla!
	AI_Output (other, self,"DIA_Fletcher_WoNek2_15_04"); //Liczy³em, ¿e dasz mi jakieœ wskazówki.
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_05"); //Jakie wskazówki do cholery? Przecie¿ wiesz co wszyscy mówi¹. Nek, o ile ¿yje, jest w Nowym Obozie. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_06"); //Musisz wejœæ w to gówno i zacz¹æ w nim grzebaæ dopóki go nie znajdziesz. Kapujesz? Na tym to polega. 
	AI_Output (self, other,"DIA_Fletcher_WoNek2_06_07"); //Jak ju¿ znajdziesz tego dezertera, to urwij mu ³eb. Dos³ownie, bez ogródek. Taki œmieæ na nic siê nam nie przyda. 
	
	B_LogEntry               (CH1_WheresNek,"Fletcher bez zbêdnych opóŸnieñ kaza³ mi przeczesaæ Nowy Obóz w poszukiwaniu Neka. Gdy go znajdê, ma zgin¹æ.");	
};

// ************************************************************
//						Hero Kill Nek			
// ************************************************************

instance DIA_Fletcher_KillNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_KillNek_Condition;
	information		= DIA_Fletcher_KillNek_Info;
	permanent		= 0;
	description		= "Zabi³em Neka.";
};

func int DIA_Fletcher_KillNek_Condition()
{	
	if (HeroKillNek == true) && Npc_KnowsInfo(hero,DIA_Nek_Exposed)
	{
		return 1;
	};
};

func void  DIA_Fletcher_KillNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_00"); //Zabi³em Neka.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_01"); //Jedno pytanie, by³ w Nowym Obozie?
	AI_Output (other, self,"DIA_Fletcher_KillNek_15_02"); //Tak.
	AI_Output (self, other,"DIA_Fletcher_KillNek_06_03"); //Dosta³ to na co zas³u¿y³, zdradziecki sukinsyn. 
	
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Dostanê coœ?", DIA_Fletcher_KillNek_MONEY);
	Info_AddChoice		(DIA_Fletcher_KillNek, "Do zobaczenia.", DIA_Fletcher_KillNek_ENDE);

	B_GiveXP (50);
};

func void DIA_Fletcher_KillNek_MONEY ()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_00"); //Dostanê coœ?
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_01"); //Przecie¿ ciê ju¿ pochwali³em... Nie mam teraz rudy. Mówi³em ci chyba o moich d³ugach u Scatty'ego.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_02"); //Czyli pozby³em siê go na marne? 
	AI_Output (self, other,"DIA_Fletcher_KillNek_MONEY_06_03"); //A czy ktoœ ci mówi³, ¿e coœ dostaniesz? Zrobi³eœ to z czystej idei: œmieræ za zdradê. Œwiadomoœæ tego niech bêdzie twoj¹ nagrod¹.
	AI_Output (other, self,"DIA_Fletcher_KillNek_MONEY_15_04"); //Niezwykle pocieszaj¹ce...
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	AI_StopProcessInfos (self);
};

func void DIA_Fletcher_KillNek_ENDE ()
{
	AI_Output (other, self,"DIA_Fletcher_KillNek_ENDE_15_00"); //Do zobaczenia. 
	Info_ClearChoices	(DIA_Fletcher_KillNek);
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Hero Found Nek			
// ************************************************************

instance DIA_Fletcher_FoundNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_FoundNek_Condition;
	information		= DIA_Fletcher_FoundNek_Info;
	permanent		= 0;
	description		= "Znalaz³em Neka, ale wci¹¿ ¿yje.";
};

func int DIA_Fletcher_FoundNek_Condition()
{	
	if (HeroKillNek == false) && Npc_KnowsInfo(hero,DIA_Nek_Exposed) && !Npc_KnowsInfo(hero,DIA_Fletcher_FoundNek_2)
	{
		return 1;
	};
};

func void  DIA_Fletcher_FoundNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_00"); //Znalaz³em Neka, ale wci¹¿ ¿yje.
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_01"); //Jak to? 
	AI_Output (other, self,"DIA_Fletcher_FoundNek_15_02"); //Jest w Nowym Obozie. Zap³aci³ mi za to, ¿ebym zostawi³ go w spokoju, ale pomyœla³em, ¿e zainteresuje ciê jego obecna kryjówka... 
	AI_Output (self, other,"DIA_Fletcher_FoundNek_06_03"); //Ty durniu! Mia³eœ go ZABIÆ, a nie mówiæ mi gdzie jest. Dwulicowa szuja. Spadaj st¹d. 
};

// ************************************************************
//						Hero Found Nek2		
// ************************************************************

instance DIA_Fletcher_FoundNek_2 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_FoundNek_2_Condition;
	information		= DIA_Fletcher_FoundNek_2_Info;
	permanent		= 0;
	description		= "Neka zabi³o stado wilków.";
};

func int DIA_Fletcher_FoundNek_2_Condition()
{	
	if (HeroKillNek == false) && Npc_KnowsInfo(hero,DIA_Nek_Exposed) && !Npc_KnowsInfo(hero,DIA_Fletcher_FoundNek)
	{
		return 1;
	};
};

func void  DIA_Fletcher_FoundNek_2_Info()
{
	AI_Output (other, self,"DIA_Fletcher_FoundNek_2_15_00"); //Neka zabi³o stado wilków.
	AI_Output (self, other,"DIA_Fletcher_FoundNek_2_06_01"); //Ha! I dobrze mu tak. Dwulicowy sukinsyn...
};
// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Jaki problem?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Jaki problem?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jestem winien Scatty'emu nie lada sumkê. Kiedy dowie siê, ¿e przej¹³em dzia³kê Neka, bêdzie mnie nachodzi³ codziennie...
};	

//========================================
//-----------------> HelloIHelYou
//========================================

INSTANCE DIA_Fletcher_HelloIHelYou (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_HelloIHelYou_Condition;
   information  = DIA_Fletcher_HelloIHelYou_Info;
   permanent	= FALSE;
   description	= "Mo¿e mogê ci jakoœ pomóc?";
};

FUNC INT DIA_Fletcher_HelloIHelYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fletcher_Problem))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_HelloIHelYou_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_01"); //Mo¿e mogê ci jakoœ pomóc?
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_02"); //To zale¿y.
    AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_03"); //Dasz radê znaleŸæ kogoœ na moje miejsce?
    AI_Output (other, self ,"DIA_Fletcher_HelloIHelYou_15_04"); //Popytaæ nie zaszkodzi.
	AI_Output (self, other ,"DIA_Fletcher_HelloIHelYou_03_05"); //W sumie to mo¿e móg³bym siê z kimœ zamieniæ albo coœ w tym stylu.
    
	MIS_FletchersReplacement = LOG_RUNNING;

    Log_CreateTopic          (CH1_FletchersReplacement, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FletchersReplacement, LOG_RUNNING);
    B_LogEntry               (CH1_FletchersReplacement,"Fletcher poprosi³ mnie, abym poszuka³ dla niego zastêpstwa.");
        
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Trip
//========================================

INSTANCE DIA_Fletcher_Trip (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Trip_Condition;
   information  = DIA_Fletcher_Trip_Info;
   permanent	= FALSE;
   description	= "Przyprowadzi³em Tripa.";
};

FUNC INT DIA_Fletcher_Trip_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Trip_GoToWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Trip_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_01"); //Przyprowadzi³em Tripa.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_02"); //Coœ nie w humorze ten twój kolega, ale niech bêdzie.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_03"); //Przez kilka tygodni przesiadywa³ w karczmie i udawa³, ¿e pracuje.
    AI_Output (other, self ,"DIA_Fletcher_Trip_15_04"); //Do tego zbiera³ wyp³atê.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_05"); //He he. Sprytny jest. Mój cz³owiek.
    AI_Output (self, other ,"DIA_Fletcher_Trip_03_06"); //Myœlê, ¿e sobie tutaj poradzi.
	
    B_LogEntry               (CH1_FletchersReplacement,"Przyprowadzi³em Tripa do Fletchera. Fletcher mo¿e ju¿ spokojnie iœæ do zamku.");
    Log_SetTopicStatus       (CH1_FletchersReplacement, LOG_SUCCESS);
    MIS_FletchersReplacement = LOG_SUCCESS;

    B_GiveXP (100);

    Npc_ExchangeRoutine (self,"zamek");
    AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Widzê, ¿e szybko nauczy³eœ siê dbaæ o swoje interesy. Witamy w stra¿y!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//========================================
//-----------------> WhatsUpGuard
//========================================

INSTANCE DIA_Fletcher_WhatsUpGuard (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_WhatsUpGuard_Condition;
   information  = DIA_Fletcher_WhatsUpGuard_Info;
   permanent	= FALSE;
   description	= "Jak leci, Stra¿niku?";
};

FUNC INT DIA_Fletcher_WhatsUpGuard_Condition()
{
    if (Kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_WhatsUpGuard_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_01"); //Jak leci, Stra¿niku?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_02"); //Ju¿ nie jestem Stra¿nikiem. Teraz nale¿ê do stra¿y Kruka.
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_03"); //Zamierzamy rozpocz¹æ nowe ¿ycie z dala od Starego Obozu.
    AI_Output (other, self ,"DIA_Fletcher_WhatsUpGuard_15_04"); //A jak tam twoje relacjê ze Scatty'm?
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_05"); //S¹ ostatnio wiêcej ni¿ dobre. Pomog³em mu zdobyæ kilka b³yskotek gdy uciekaliœmy z obozu. To by³o bardzo op³acalne dla obu stron. 
    AI_Output (self, other ,"DIA_Fletcher_WhatsUpGuard_03_06"); //Teraz nie martwiê siê o to czy starczy mi na godne ¿ycie.
   
};

//-------------------------------------------------------------------------1.6.1-------------------------------------------------------
//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_Fletcher_Dlug (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Dlug_Condition;
   information  = DIA_Fletcher_Dlug_Info;
   permanent	= FALSE;
   description	= "Móg³bym pomóc ci z twoim d³ugiem o Scatty’ego.";
};

FUNC INT DIA_Fletcher_Dlug_Condition()
{
	 if (Npc_KnowsInfo (hero, DIA_Fletcher_Problem))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Fletcher_Dlug_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Dlug_15_01"); //Móg³bym pomóc ci z twoim d³ugiem o Scatty’ego.
    AI_Output (self, other ,"DIA_Fletcher_Dlug_03_02"); //Obawiam siê, ¿e ten wieprzek nie da siê tak ³atwo podejœæ. Ale jeœli masz odpowiedni¹ sumê to idŸ do niego.
    AI_Output (other, self ,"DIA_Fletcher_Dlug_03_03"); //Dobrze. A ile konkretnie?
    AI_Output (self, other ,"DIA_Fletcher_Dlug_15_04"); //200 bry³ek.
    AI_Output (other, self ,"DIA_Fletcher_Dlug_03_05"); //Niech bêdzie.
   
            MIS_dlugfletchera = LOG_RUNNING;
	        Log_CreateTopic		(Dlug,	LOG_MISSION);
			Log_SetTopicStatus	(Dlug,	LOG_RUNNING);
			B_LogEntry			(Dlug,	"Fletcher ma d³ug u Scatty’ego wynosz¹cy 200 bry³ek rudy. Jeœli mam tak¹ sumkê to mogê mu pomóc.");

};


//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_Fletcher_Dlug1 (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Dlug1_Condition;
   information  = DIA_Fletcher_Dlug1_Info;
   permanent	= FALSE;
   description	= "Sp³aci³em twój d³ug...";
};

FUNC INT DIA_Fletcher_Dlug1_Condition()
{
	if (HanisPokonany == TRUE)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Fletcher_Dlug1_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Dlug1_15_01"); //Sp³aci³em twój d³ug. Musia³em walczyæ na arenie i obstawiæ walkê. Na szczêœcie wygra³em i Scatty przyj¹³ zaleg³¹ rudê.
    AI_Output (self, other ,"DIA_Fletcher_Dlug1_03_02"); //Dobrze siê spisa³eœ m³ody. WeŸ w nagrodê tê napoje uzdrawiaj¹ce.
    B_GiveInvItems (self,other, ItFo_Potion_Health_02, 4);
    MIS_dlugfletchera = LOG_SUCCESS;

    B_GiveXP (140);
    Log_SetTopicStatus	(Dlug,	LOG_SUCCESS);
	B_LogEntry			(Dlug,	"Rozmawia³em z Fletcherem. By³ zadowolony z powodu umorzenia jego d³ugu. Otrzyma³em od niego nagrodê.");
    
};
//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_Fletcher_Dlug2 (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Dlug2_Condition;
   information  = DIA_Fletcher_Dlug2_Info;
   permanent	= FALSE;
   description	= "Próbowa³em ci pomóc ze Scatty’m...";
};

FUNC INT DIA_Fletcher_Dlug2_Condition()
{
 
   if (HanisPrzegrana == TRUE)
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Dlug2_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Dlug2_15_01"); //Próbowa³em ci pomóc ze Scatty’m. Kaza³ mi walczyæ na arenie i obstawiæ walkê. Przegra³em, jesteœ mu winien teraz 400 bry³ek.
    AI_Output (self, other ,"DIA_Fletcher_Dlug2_03_02"); //Co?! Ty kretynie! Sk¹d ja wezmê a¿ tyle. Trzeba by³o nie mieszaæ siê w nieswoje sprawy.
    AI_Output (other, self ,"DIA_Fletcher_Dlug2_03_03"); //Przecie¿...?
    AI_Output (self, other ,"DIA_Fletcher_Dlug2_15_04"); //ZejdŸ mi z oczu!
	
	 Log_SetTopicStatus	(Dlug,	LOG_FAILED);
	 B_LogEntry			(Dlug,	"Fletcher by³ wœciek³y z powodu mojej przegraj i podwojeniu jego d³ugu. Zwyzywa³ mnie i kaza³ siê wynosiæ. Dobrze, ¿e przynajmniej i on mi nie do³o¿y³. ");
	 B_GiveXP (80);
	
    AI_StopProcessInfos	(self);
   
};


//========================================
//-----------------> Dlug
//========================================

INSTANCE DIA_Fletcher_Potwor_Thorus (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Potwor_Thorus_Condition;
   information  = DIA_Fletcher_Potwor_Thorus_Info;
   permanent	= FALSE;
   description	= "Thorus przydzieli³ ciê do misji...";
};

FUNC INT DIA_Fletcher_Potwor_Thorus_Condition()
{
 
    if  (Npc_KnowsInfo (hero, DIA_Thorus_Potwor_Joel))
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Potwor_Thorus_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Potwor_Thorus_15_01"); //Thorus przydzieli³ ciê do misji zabicia potwora w pobli¿u placu wymian. Wyruszymy wieczorem.
    AI_Output (self, other ,"DIA_Fletcher_Potwor_Thorus_03_02"); //Co nieco o tym s³ysza³em. Có¿ to wielce nieprzyjemna sprawa. Ale Thorus skoro kaza³ to muszê siê tym zaj¹æ.
	AI_Output (self, other ,"DIA_Fletcher_Potwor_Thorus_03_03"); //Bêdê czeka³ na ciebie przed obozem.
   
	  Npc_ExchangeRoutine(self,"oc1");
	  B_LogEntry                     (PotworBramus,"Rozmawia³em z Fletcherem. Ma on pewne obawy ale zgodzi³ siê wzi¹æ udzia³ w misji. Bêdzie czeka³ przed obozem. Wyruszymy wieczorem.");
	
   
   
};

//========================================
//-----------------> Dlug
//========================================

INSTANCE DIA_Fletcher_Potwor_Bramus (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Potwor_Bramus_Condition;
   information  = DIA_Fletcher_Potwor_Bramus_Info;
   permanent	= FALSE;
   description	= "W drogê.";
};

FUNC INT DIA_Fletcher_Potwor_Bramus_Condition()
{
 
    if (Npc_KnowsInfo (hero, DIA_Fletcher_Potwor_Thorus))
    && (Wld_IsTime (19,00,05,00) == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Potwor_Bramus_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_Potwor_Bramus_15_01"); //W drogê.
    AI_Output (self, other ,"DIA_Fletcher_Potwor_Bramus_03_02"); //W porz¹dku.
    Npc_ExchangeRoutine            (Grd_255_Fletcher,"bramus");
    AI_StopProcessInfos	(self);
   
};

//========================================
//-----------------> Dlug
//========================================

INSTANCE DIA_Fletcher_Potwor_Plac (C_INFO)
{
   npc          = Grd_255_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_Potwor_Plac_Condition;
   information  = DIA_Fletcher_Potwor_Plac_Info;
   permanent	= FALSE;
   important = TRUE;
};

FUNC INT DIA_Fletcher_Potwor_Plac_Condition()
{
 
    if (Npc_KnowsInfo (hero, DIA_Fletcher_Potwor_Bramus))
   && ( Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_1_5_4") ) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_Potwor_Plac_Info()
{

    AI_Output (self, other ,"DIA_Fletcher_Potwor_Plac_03_01"); //Cholera, to ten potwór!
    AI_Output (other, self ,"DIA_Fletcher_Potwor_Plac_15_02"); //Strach ciê oblecia³? A mo¿e narobi³eœ w portki ze strachu!
	AI_Output (self, other ,"DIA_Fletcher_Potwor_Plac_03_03"); //CO? Ja... Sk¹d¿e... Zajmijmy siê nim.
	AI_Output (other, self ,"DIA_Fletcher_Potwor_Plac_15_04"); //Racja. Do ataku!
      B_LogEntry                     (PotworBramus,"Zgodnie z przewidywaniami noc¹ zauwa¿yliœmy wielk¹ bestiê. Trzeba j¹ zat³uc by nikogo wiêcej ju¿ nie po¿ar³a.");
    AI_StopProcessInfos	(self);
   
};


