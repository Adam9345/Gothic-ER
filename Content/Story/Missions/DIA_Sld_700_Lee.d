//*********************************************************
//*********************************************************
//							EXIT									
//*********************************************************

instance  Sld_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  Sld_700_Lee_Exit_Condition;
	information	=  Sld_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*********************************************************
//						Greet									
//*********************************************************

instance  Sld_700_Lee_Greet (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Greet_Condition;
	information	=  Sld_700_Lee_Greet_Info;
	permanent	=  0;
	description = "Jesteœ szefem Najemników, tak?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Jesteœ szefem Najemników, tak?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Zgadza siê, ch³opcze!
};

//*********************************************************
//						Define									
//*********************************************************

instance  Sld_700_Lee_Define (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Define_Condition;
	information	=  Sld_700_Lee_Define_Info;
	permanent	=  0;
	description = "Czym zajmuje siê Najemnik w s³u¿bie magów?";
};                       

FUNC int  Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Define_Info()
{
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Czym zajmuje siê Najemnik w s³u¿bie magów?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //To proste: pilnuje rudy i broni magów.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Od czasu do czasu magowie zlecaj¹ nam jakieœ zadania specjalne.
};

//*********************************************************
//						Mitmachen									
//*********************************************************

instance  Sld_700_Lee_Mitmachen (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  Sld_700_Lee_Mitmachen_Condition;
	information	=  Sld_700_Lee_Mitmachen_Info;
	permanent	=  0;
	description = "Chcia³bym do was do³¹czyæ!";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SFB)) //+ inne gildie NO
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Chcia³bym do was do³¹czyæ!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //Odbi³o ci? Myœlisz, ¿e przyjmujê ka¿dego w³óczêgê, który siê do mnie zg³osi?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Musisz najpierw spêdziæ trochê czasu w naszym Obozie. Bêdê ciê mia³ na oku! Zobaczymy, na co ciê staæ.
};


//*********************************************************
//						NowReady for Sld?									
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance  Sld_700_Lee_NowReady (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  700;
	condition	=  Sld_700_Lee_NowReady_Condition;
	information	=  Sld_700_Lee_NowReady_Info;
	permanent	=  1;
	description = "Chcia³bym zostaæ Najemnikiem w s³u¿bie magów. Myœlisz, ¿e jestem ju¿ gotów?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SFB)) && (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Chcia³bym zostaæ Najemnikiem w s³u¿bie magów. Myœlisz, ¿e jestem ju¿ gotów?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Twoje dokonania w Starej Kopalni dowodz¹, ¿e staæ ciê na wiele.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Jestem sk³onny przyj¹æ ciê w poczet Najemników.
	
		if (hero.level < 10)
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale nie jesteœ gotowy do s³u¿by w naszych szeregach. Musisz zdobyæ jeszcze trochê doœwiadczenia.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if (hero.level >= 10)
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szansê. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_01"); //Najemnikami zostaj¹ ci, którzy dobrze poznali ¿ycie w kolonii lub zrobili coœ, co udowadnia ich odwagê.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_02"); //Ty jeszcze nic takiego nie dokona³eœ. Czeka ciê d³uga droga.
	};

	
};

/*------------------------------------------------------------------------
							SÖLDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcê zostaæ Najemnikiem."; 
};

FUNC int  Sld_700_Lee_BECOMESLDNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	&& (Npc_GetTrueGuild(hero) == GIL_ORG)
	&& (player_chose_WaterMages == false)
	&& (kapitel >= 2)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chcê zostaæ Najemnikiem.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //M¹dra decyzja. Nie po¿a³ujesz.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Powiedz mi: dlaczego? Dlaczego do³¹czy³eœ do nas, a nie do Bractwa, albo do Starego Obozu?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee pozwoli³ mi do³¹czyæ do Najemników.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"W tamtych obozach tylko traci³bym czas.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Od pocz¹tku myœla³em tylko o odzyskaniu wolnoœci.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Tak siê jakoœ z³o¿y³o.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //W tamtych obozach tylko traci³bym czas.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedyna rzecz, która ma tutaj jak¹œ prawdziw¹ wartoœæ to pragnienie wolnoœci. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Od pocz¹tku myœla³em tylko o odzyskaniu wolnoœci.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //I dziêki nam wkrótce j¹ odzyskasz. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Tak siê jakoœ z³o¿y³o.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //¯eby siê tylko nie z³o¿y³o, ¿e kiedyœ nagle zmienisz zdanie. Witaj wœród nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

/*------------------------------------------------------------------------
							WATERMAGE WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMEWMNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMEWMNOW_Condition;
	information		= Sld_700_Lee_BECOMEWMNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcê zostaæ Magiem Wody."; 
};

FUNC int  Sld_700_Lee_BECOMEWMNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	&& (Npc_GetTrueGuild (hero) == GIL_ORG)
	&& (kapitel >= 2)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMEWMNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMEWMNOW_Info_15_01"); //Chcê zostaæ Magiem Wody.
	AI_Output			(self, other,"Sld_700_Lee_BECOMEWMNOW_Info_08_02"); //Có¿, dokona³eœ wiele, jednak to nie ja o tym decydujê. Musisz porozmawiaæ z Cronosem. 
	
	Log_CreateTopic		(GE_BecomeWatermage,LOG_NOTE);
	B_LogEntry			(GE_BecomeWatermage,"Lee pozwoli³ mi do³¹czyæ do Magów Wody. Jednak to oni podejm¹ kluczow¹ decyzjê, czy jestem gotowy. Muszê porozmawiaæ z Cronosem.");	
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM									
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_DAMNPAST_Condition;
	information		= Sld_700_Lee_DAMNPAST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_700_Lee_DAMNPAST_Condition()
{	
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc (hero,self) < 1000)	
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void  Sld_700_Lee_DAMNPAST_Info()
{
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Kiedyœ wiod³em ca³kiem inne ¿ycie.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //By³em jednym z najlepszych genera³ów tego królestwa.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Ca³e ¿ycie spêdzi³em broni¹c ojczyzny przed wrogiem.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Ale szlachta patrzy³a na mnie niechêtnie, bo Król wysoko ceni³ sobie moje rady. Te ³otry wiedzia³y, ¿e mogê pokrzy¿owaæ ich plany.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //By³em zbyt pewny siebie i nie zauwa¿y³em side³, które na mnie zastawili. Aby mnie usun¹æ pos³u¿yli siê królewsk¹ ¿on¹.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Pos¹dzono mnie o jej zamordowanie. Rhobar nie mia³ innego wyboru.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Od szubienicy uratowa³o mnie tylko wiele lat przyk³adnej s³u¿by. W ten sposób trafi³em tutaj.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Ale pewnego dnia odzyskam wolnoœæ, a wtedy nadejdzie czas zemsty...
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Zemszczê siê!
	if (Npc_KnowsInfo(hero,DIA_Norton_Beer_Othniella))
	{
	B_LogEntry               (ZaDlugiJezor,"Lee powiedzia³, ¿e zosta³ oskar¿ony o morderstwo królewskiej ¿ony. Muszê mu powiedzieæ to co us³ysza³em od Nortona.");
	};
	Npc_ExchangeRoutine (self,"START");
	var C_NPC Homer;
	Homer = Hlp_GetNpc	(BAU_935_HOMER);
	Npc_ExchangeRoutine	(Homer,"START"); 
	AI_ContinueRoutine	(Homer);
};

//*********************************************************
//						FMTaken									
//*********************************************************

instance  Sld_700_Lee_FMTaken (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_FMTaken_Condition;
	information	=  Sld_700_Lee_FMTaken_Info;
	permanent	=  1;
	description = "Co myœlisz o ca³ej tej sprawie z kopalni¹?";
};                       

FUNC int  Sld_700_Lee_FMTaken_Condition()
{
	if	FMTaken
	{
		return TRUE;
	};
};

FUNC VOID  Sld_700_Lee_FMTaken_Info()
{
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Co myœlisz o ca³ej tej sprawie z kopalni¹?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die Möglichkeit, Lee über die freie Mine zu informieren! ***Björn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Tym razem posunêli siê za daleko. Jeszcze tego po¿a³uj¹.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//Myœlê, ¿e zagro¿enie ju¿ minê³o.
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Nasz Obóz wiele ci zawdziêcza. Przyda³by mi siê ktoœ taki jak ty.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Dziêkujê. Muszê ju¿ ruszaæ w dalsz¹ drogê.
		AI_Output			(self, hero,"Info_Lee_TELEPORT_08_01"); 		//Jeszcze coœ!
		AI_Output			(self, hero,"Info_Lee_TELEPORT_08_03"); 		//WeŸ tê magiczn¹ runê jako symbol naszej wdziêcznoœci za twoje dokonania.
		AI_Output			(hero, self,"Info_Lee_TELEPORT_15_05"); 		//Dziêkujê!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Do zobaczenia!


		B_LogEntry			(CH4_BannedFromOC,	"Poinformowa³em Lee o wynikach akcji, któr¹ przeprowadzi³em wraz z Gornem w Wolnej Kopalni. By³ bardzo zadowolony.");
		
 	   	B_GiveInvItems (self,other, ItArRuneFirestorm, 1);
		B_GiveXP (500);		
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD								
------------------------------------------------------------------------*/
instance  Sld_700_Lee_CHANGESIDE (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_CHANGESIDE_Condition;
	information		= Sld_700_Lee_CHANGESIDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyrzucono mnie ze Starego Obozu. Chcia³bym do was do³¹czyæ."; 
};

FUNC int  Sld_700_Lee_CHANGESIDE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

FUNC void  Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Wyrzucono mnie ze Starego Obozu. Chcia³bym do was do³¹czyæ.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Nasz Obóz wiele ci zawdziêcza. Przyda³by mi siê ktoœ taki jak ty.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //PrzejdŸmy od razu do rzeczy. Witaj w Nowym Obozie, Najemniku!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //WeŸ tê zbrojê. Dobrze, ¿e mamy ciê teraz po naszej stronie.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Po tym jak zosta³em wygnany ze Starego Obozu, postanowi³em zostaæ Najemnikiem. Pora wracaæ do Saturasa!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee mo¿e mnie nauczyæ walki dwurêcznym orê¿em oraz zwiêkszyæ moj¹ si³ê i zwinnoœæ.");
};  

/*------------------------------------------------------------------------
							ARMOR									
------------------------------------------------------------------------*/
instance  Sld_700_Lee_ARMOR (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ARMOR_Condition;
	information		= Sld_700_Lee_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Przyda³aby mi siê lepsza zbroja."; 
};

FUNC int  Sld_700_Lee_ARMOR_Condition()
{	
	if  (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ARMOR_Info()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Przyda³aby mi siê lepsza zbroja.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Najpierw musisz sobie na ni¹ zas³u¿yæ. Poza tym - taka rzecz nie jest tania.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	
	Info_AddChoice		(Sld_700_Lee_ARMOR,"Kup œredni¹ zbroje najemnika.",Sld_700_Lee_ARMOR_M);
    AFIP_SetChoiceItem  (Sld_700_Lee_ARMOR_M,SLD_ARMOR_M);
	
	Info_AddChoice		(Sld_700_Lee_ARMOR,"Kup ciê¿k¹ zbrojê najemnika.",Sld_700_Lee_ARMOR_H);
	AFIP_SetChoiceItem  (Sld_700_Lee_ARMOR_H,SLD_ARMOR_H);
	
	//var int AFIP_ShowItem(Sld_700_Lee_ARMOR_M); AFIP_ShowItem = SLD_ARMOR_M;
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices (Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
var int AFIP_ShowItem;
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chcia³bym dostaæ wzmocnion¹ zbrojê.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Nie jesteœ jeszcze doœæ doœwiadczony, ¿eby otrzymaæ nowy pancerz. Wróæ, jak zdobêdziesz trochê doœwiadczenia.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy te¿ nie masz co marzyæ o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Ta zbroja to kawa³ solidnej roboty. Bêdzie ci dobrze s³u¿yæ.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
	};
};
func void Sld_700_Lee_ARMOR_H()
{
var int AFIP_ShowItem;
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Chcia³bym dostaæ ciê¿k¹ zbrojê.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Nie jesteœ jeszcze doœæ doœwiadczony, ¿eby otrzymaæ nowy pancerz. Wróæ, jak zdobêdziesz trochê doœwiadczenia.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy te¿ nie masz co marzyæ o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Ten pancerz to prawdziwe dzie³o sztuki. Lepszego nie znajdziesz po tej stronie Bariery. Mo¿esz mi wierzyæ, wart jest ka¿dej bry³ki...
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem		(hero,SLD_ARMOR_H);	//SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
	};

};
/*------------------------------------------------------------------------
							STR + DEX								
------------------------------------------------------------------------*/
INSTANCE Sld_700_Lee_Teach(C_INFO)
{
	npc			= Sld_700_Lee;
	nr			= 10;
	condition	= Sld_700_Lee_Teach_Condition;
	information	= Sld_700_Lee_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	  
	{
		return TRUE;
	};
};

FUNC VOID Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Mogê ci pomóc zwiêkszyæ twoj¹ si³ê i zrêcznoœæ.
	
	
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString( NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};
//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_Condition;
	information		= SLD_700_Lee_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ dwurêcznym orê¿em?"; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  SLD_700_Lee_TEACH_2H_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_Info_09_02"); //Dobrze, ale musisz byæ cz³onkiem Nowego Obozu. 

	//if (log_Leefight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Lee mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko zostanê cz³onkiem Nowego Obozu.");
	//	log_Leefight = TRUE;
	//};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H_START (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_START_Condition;
	information		= SLD_700_Lee_TEACH_2H_START_Info;
	permanent		= 1;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_START_Condition()
{	
	if (Npc_KnowsInfo (hero, SLD_700_Lee_TEACH_2H))
	&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || (Npc_GetTrueGuild    (hero) == GIL_ORG) || (Npc_GetTrueGuild    (hero) == GIL_SFB) || (Npc_GetTrueGuild    (hero) == GIL_KDW) || ( (Npc_GetTrueGuild(hero) == GIL_NONE) && (kapitel >= 4)))
	{
	return TRUE;
	};
};

FUNC void  SLD_700_Lee_TEACH_2H_START_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_START_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_START_Info_09_02"); //No dobra.

    Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,"Wróæ",DIA_Lee_START_TRAIN_BACK);
	
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);
	

};

func void DIA_Lee_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,Dialog_Back,DIA_Lee_START_TRAIN_BACK);
	
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);

};



func void DIA_Lee_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,Dialog_Back,DIA_Lee_START_TRAIN_BACK);

	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);


};



func void DIA_Lee_START_TRAIN_BACK()
{
	Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
};



//========================================
//-----------------> KOPALNIA_QUENTINA
//========================================

INSTANCE DIA_Lee_KOPALNIA_QUENTINA (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_KOPALNIA_QUENTINA_Condition;
   information  = DIA_Lee_KOPALNIA_QUENTINA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_KOPALNIA_QUENTINA_Condition()
{
    if (MIS_TorlofNeedHelp == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_KOPALNIA_QUENTINA_Info()
{
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_01"); //Dobrze, ¿e jesteœ. Potrzeba nam kogoœ do pomocy.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_03"); //Ostatnio z wieœciami przyby³ pos³aniec z Obozu Bandytów. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_04"); //Ponoæ Gomez wys³a³ grupê ludzi do Opuszczonej Kopalni. Quentin chce udaremniæ jego plan wznowienia wydobycia. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_05"); //Jest jeden haczyk, kopalnia nie zosta³a opuszczona bez powodu. Roi siê w niej od przeró¿nego plugastwa. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_06"); //Mo¿liwe, ¿e jak pozbêdziecie siê Stra¿ników, to bêdzie was czeka³a walka z nieumar³ymi albo innym œcierwem.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_07"); //Postaram siê prze¿yæ, jednak w pojedynkê nie bêdzie ³atwo...
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_08"); //Wys³a³em ju¿ Najemników, którzy ci pomog¹. Powinieneœ ich spotkaæ przy wejœciu do kopalni. IdŸ ju¿! Nie ma czasu do stracenia...
	
	//zadanie - oficjalne zadanie [odwiedzenie kopalni] dla wszystkich gildii innych ni¿ bandyta 
    MIS_SupportForQuentin = LOG_RUNNING;
	Log_CreateTopic          (CH4_SupportForQuentin, LOG_MISSION);
    Log_SetTopicStatus       (CH4_SupportForQuentin, LOG_RUNNING);
    B_LogEntry               (CH4_SupportForQuentin,"Lee chce pomóc Quentinowi pozbyæ siê Stra¿ników z Opuszczonej Kopalni. Gomez postanowi³ wznowiæ tam wydobycie. Przywódca Najemników twierdzi, ¿e Stra¿nicy nie s¹ najwiêkszym zagro¿eniem jakie czyha pod ziemi¹. Có¿, wkrótce przekonam siê o tym na w³asnej skórze. Mam siê przegrupowaæ z ludŸmi przydzielonymi przez Lee przy wejœciu do kopalni.");
	
	//rutyny: Cord [kluczowy npc], Jarvis, Rocky
	B_Story_AbMine_Soldiers ();
    
	Wld_SendTrigger("KOPALNIAEXIT");
	
	//koniec
    AI_StopProcessInfos	(self);
	
	//zadanie - wpis dla cz³onków bractwa
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Po rozmowie z Lee okaza³o siê, ¿e Nowy Obóz chce pomóc Bandytom odbiæ Opuszczon¹ Kopalniê. Mam siê tam udaæ i odszukaæ zaprzyjaŸnionych Najemników. Lee przestrzeg³ mnie, ¿e Kopalnia jest przeklêta od lat. Szykuje siê nie lada wyzwanie. ");
	};
};

//========================================
//-----------------> CZYSTKA_W_KOPALNI
//========================================

INSTANCE DIA_Lee_CZYSTKA_W_KOPALNI (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_CZYSTKA_W_KOPALNI_Condition;
   information  = DIA_Lee_CZYSTKA_W_KOPALNI_Info;
   permanent	= FALSE;
   description	= "Pozby³em siê Stra¿ników i o¿ywieñców z kopalni.";
};

FUNC INT DIA_Lee_CZYSTKA_W_KOPALNI_Condition()
{
    if (MIS_SupportForQuentin == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_CZYSTKA_W_KOPALNI_Info()
{
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_01"); //Pozby³em siê Stra¿ników i o¿ywieñców z kopalni.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_02"); //Czyli naprawdê byli tam o¿ywieñcy. Masz szczêœcie, ¿e jeszcze ¿yjesz.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_03"); //Nie mniej jednak dobrze siê spisa³eœ. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_04"); //Cord kaza³ ci zaproponowaæ, ¿ebyœmy wznowili wydobycie w kopalni. Z³o¿a s¹ jeszcze dosyæ spore. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_05"); //Z pewnoœci¹ spodoba siê to Magom Wody.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_06"); //Hmmm... Fakt. Kopalnia mo¿e nam przynieœæ znaczne korzyœci. Jednak transport rudy do Obozu by³by nie lada wyzwaniem.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_07"); //Wszêdzie krêc¹ siê Stra¿nicy.
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_08"); //Chyba jednak warto zaryzykowaæ. 
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_09"); //Masz racjê, ale jest jeden problem. Do kopania rudy potrzebni s¹ robotnicy. Nie mam doœæ ludzi, aby wys³aæ ich do pracy.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_10"); //IdŸ do Laresa i spytaj czy wys³a³by kilku Szkodników do kopalni.
    B_LogEntry                     (CH4_NC_Mine,"Mam iœæ do Laresa i poprosiæ go o wys³anie kilku Szkodników do pracy w kopalni. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> BRAK_LUDZI
//========================================

INSTANCE DIA_Lee_BRAK_LUDZI (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_BRAK_LUDZI_Condition;
   information  = DIA_Lee_BRAK_LUDZI_Info;
   permanent	= FALSE;
   description	= "Lares nie ma wystarczaj¹cej iloœci ludzi.";
};

FUNC INT DIA_Lee_BRAK_LUDZI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lares_POTZREBNI_LUDZIE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_BRAK_LUDZI_Info()
{
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_01"); //Lares nie ma wystarczaj¹cej iloœci ludzi.
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_02"); //Wiedzia³em! No to mamy niez³y problem. Je¿eli nie wyœlemy kogoœ do kopalni, to Gomez pewnie znowu j¹ zajmie.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_03"); //Lares kaza³ ci prosiæ o pomoc Bandytów. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_04"); //Racja. Mo¿e oni wyœl¹ czêœæ swoich ludzi do kopalni. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_05"); //IdŸ do Quentina i siê z nim dogadaj. Zaproponuj mu czwart¹ czêœæ wydobytego urobku jako zap³atê.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_06"); //Ju¿ tam idê.
    B_LogEntry                     (CH4_NC_Mine,"Trzeba dogadaæ siê z Quentinem. Mam zaproponowaæ przywódcy Bandytów czwart¹ czêœæ urobku z kopalni w zamian za pomoc. ");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PertractacjieDD
//========================================

INSTANCE DIA_lee_PertractacjieDD (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_lee_PertractacjieDD_Condition;
   information  = DIA_lee_PertractacjieDD_Info;
   permanent	= FALSE;
   description	= "Dogada³em siê z Quentinem.";
};

FUNC INT DIA_lee_PertractacjieDD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_GuyWork)) && (MIS_NC_Mine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_lee_PertractacjieDD_Info()
{
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_01"); //Dogada³em siê z Quentinem.
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_02"); //Nie by³ zbyt zadowolony, ale siê zgodzi³.
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_03"); //Œwietnie. 
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_04"); //Oto twoja zap³ata.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH4_NC_Mine,"Nowy Obóz dogada³ siê z Quentinem. Mamy zapewnione nowe Ÿród³o rudy ma³ym kosztem.");
    Log_SetTopicStatus       (CH4_NC_Mine, LOG_SUCCESS);
    MIS_NC_Mine = LOG_SUCCESS;
	if MIS_PsiAbadonedMine == log_running
	{
	Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
	B_LogEntry                     (CH4_PsiAbadonedMine,"Najemnicy zyskali dostêp do Opuszczonej Kopalni, a Gomez zosta³ os³abiony. Tymczasowo uspokoi³em sytuacjê, ale wci¹¿ muszê byæ czujny. Wypada³oby w miêdzyczasie zanieœæ raport Cor Angarowi. Z pewnoœci¹ mnie jakoœ wynagrodzi.");
	};
    B_GiveXP (300);
};

//========================================
//-----------------> XARDASGOLEMS
//========================================

INSTANCE DIA_Lee_XARDASGOLEMS (C_INFO)
{
   npc          = SLD_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_XARDASGOLEMS_Condition;
   information  = DIA_Lee_XARDASGOLEMS_Info;
   permanent	= FALSE;
   description	= "Saturas zleci³ mi odszukanie Xardasa. Co wiesz na jego temat?";
};

FUNC INT DIA_Lee_XARDASGOLEMS_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Saturas_XARDASGO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_XARDASGOLEMS_Info()
{
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_01"); //Saturas zleci³ mi odszukanie Xardasa. Co wiesz na jego temat?
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_02"); //Jakiœ czas temu wys³a³em oddzia³ Najemników na polecenie Saturasa, aby odszukali tego Nekromantê, niestety nigdy nie wrócili. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_03"); //Postanowi³em wiêc wys³aæ Torlofa wraz z ma³ym oddzia³em, ¿eby sprawdziæ, co ich spotka³o.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_04"); //Kilka dni póŸniej, gdy Torlof wróci³, opowiedzia³ mi o trzech golemach. Widzia³ je tylko z daleka, choæ nietrudno siê domyœliæ jaki los spotka³ moich ludzi. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_05"); //Dostêpu do wie¿y broni³ kamienny golem, ognisty oraz lodowy. Nie radzê ci siê tam wybieraæ, zrobi¹ z ciebie sieczkê.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_06"); //Skoro zdoby³em kamienie ogniskuj¹ce zabijaj¹c po drodze trolle, harpie i inne plugastwo, to z tymi magicznymi pos¹gami poradzê sobie bez problemu.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_07"); //Mam nadzieje. Dam ci jeszcze jedn¹ radê, uwa¿aj na Xardasa. Jest niezwykle przebieg³y i potê¿ny. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_08"); //Pamiêtam jak spotka³em go na dworze Rhobara, gdy zosta³ wyznaczony do przewodzenia magami, którzy mieli stworzyæ Barierê.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_09"); //Wydawa³ siê byæ niezwykle wierny Innosowi. PóŸniej okaza³o siê, ¿e bardziej ci¹gnie go do magii demonów. Nigdy bym siê tego nie domyœli³.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_10"); //Dziêki za radê. 
};



//========================================
//-----------------> DANGERORE
//========================================

INSTANCE DIA_Lee_DANGERORE (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_DANGERORE_Condition;
   information  = DIA_Lee_DANGERORE_Info;
   permanent	= FALSE;
   description	= "Spotka³em Xardasa.";
};

FUNC INT DIA_Lee_DANGERORE_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Xardas_DANGER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_DANGERORE_Info()
{
    AI_Output (other, self ,"DIA_Lee_DANGERORE_15_01"); //Spotka³em Xardasa. Powiedzia³ mi, ¿e pomys³ Magów Wody z kopcem rudy jest bezcelowy. Jednak jest inny sposób na zniszczenie Bariery. Nie bardzo wiem, jak powiedzieæ o tym Saturasowi.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_02"); //Lepiej mu o tym nie mów. Saturas to bardzo wybuchowy cz³owiek. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_03"); //Ja sam dochowam tajemnicy, choæ jestem szczerze zdziwiony. Przez te wszystkie lata pod¹¿a³em œlepo za Magami Wody g³êboko wierz¹c w ich plan.
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_04"); //Przez ca³y czas wierzy³em, ¿e ich pomys³ odnoœnie Bariery wypali.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_05"); //Da³em im s³owo, ¿e dopóki Bariera istnieje, bêdê im s³u¿y³ i tak w³aœnie zamierzam uczyniæ. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_06"); //S³u¿ba jako genera³ Króla Rhobara nauczy³a mnie honoru. Sta³eœ siê niezwykle potê¿ny, nie ka¿dy cz³owiek zdo³a³by przedrzeæ siê do Xardasa i zrobiæ na nim wra¿enie, tak jak tobie siê uda³o.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_07"); //Powodzenia, przyjacielu! Mam nadziejê, ¿e ju¿ wkrótce siê zobaczymy.
};

//#####################################################################################
//####### ROZDZIA£ 5
//####### ZASTÊPSTWO DLA GORNA
//#####################################################################################
//========================================
//-----------------> OBRONA_WK
//========================================

INSTANCE DIA_Lee_OBRONA_WK (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBRONA_WK_Condition;
   information  = DIA_Lee_OBRONA_WK_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Gorn. Mam ci pomóc w organizacji obrony.";
};

FUNC INT DIA_Lee_OBRONA_WK_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Gorn_ZASTEPSTWO))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBRONA_WK_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_01"); //Przysy³a mnie Gorn. Mam ci pomóc w organizacji obrony.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_02"); //Ach tak! Dobrze, ¿e przyszed³eœ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_03"); //Ju¿ ustali³em którzy z moich ludzi zajm¹ siê kopalni¹.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_04"); //Niestety, zagro¿enie ze strony Gomeza jeszcze nie minê³o i nie mia³em kogo wys³aæ do wybranych Najemników.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_05"); //Ja mogê im to przekazaæ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_06"); //W porz¹dku. IdŸ zatem do Corda i Outlama. 
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_07"); //Przeka¿ im, ¿e kopalnie powierzam prowizorycznej stra¿y i myœliwym-najemnikom.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_08"); //Nie ma sprawy.
    B_LogEntry                     (CH5_ObronaWk,"Lee wyznaczy³ do obrony kopalni ludzi Corda i Outlama. Mam im to przekazaæ.");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> OBRONA_ENDQUEST
//========================================

INSTANCE DIA_Lee_OBRONA_ENDQUEST (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBRONA_ENDQUEST_Condition;
   information  = DIA_Lee_OBRONA_ENDQUEST_Info;
   permanent	= FALSE;
   description	= "Zorganizowa³em obronê.";
};

FUNC INT DIA_Lee_OBRONA_ENDQUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_CALL_OF_DUTY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBRONA_ENDQUEST_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBRONA_ENDQUEST_15_01"); //Zorganizowa³em obronê.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_02"); //Dobra robota! Teraz Stra¿nicy mog¹ nam naskoczyæ.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_03"); //Przeka¿ Gornowi, ¿e jest wolny.
    B_LogEntry                     (CH5_ObronaWK,"Najemnicy zajm¹ siê Woln¹ Kopalni¹, a Gorn mo¿e w koñcu udaæ siê na spotkanie.");
    Log_SetTopicStatus       (CH5_ObronaWK, LOG_SUCCESS);
    MIS_ObronaWK = LOG_SUCCESS;

    B_GiveXP (400);
    AI_StopProcessInfos	(self);
};
//----------------------------------------------------------------1.6.1-------------------------------------------




//========================================
//-----------------> Obozowisko Moroka
//========================================

INSTANCE DIA_Lee_OBOZ (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBOZ_Condition;
   information  = DIA_Lee_OBOZ_Info;
   important = TRUE;
   
};

FUNC INT DIA_Lee_OBOZ_Condition()
{
    if (kapitel == 4)
    && (!Npc_IsDead (GRD_7894_Morok))
	&& (!Npc_IsDead (GRD_7895_Patter))
	&& (Npc_GetTrueGuild(hero) == GIL_SLD)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBOZ_Info()
{
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_01"); //Mam dla ciebie wa¿ne zadanie.
    AI_Output (other, self ,"DIA_Lee_OBOZ_03_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_03"); //Nieopodal chaty myœliwego Cavalorna znajduje siê w¹wóz. Z tego miejsca s¹ urz¹dzane zdradzieckie napady na naszych ludzi.
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_04"); //Teraz w czasach zamêtu uaktywni³ siê tam oddzia³ Stra¿ników, który wczeœniej by³ tam na posterunku.
	AI_Output (self, other ,"DIA_Lee_OBOZ_15_05"); //Na jego czele stoi niejaki Morok.
	AI_Output (other, self ,"DIA_Lee_OBOZ_03_06"); //Co mia³bym zrobiæ?
	AI_Output (self, other ,"DIA_Lee_OBOZ_15_07"); //Zabraæ ze sob¹ Torlofa i Corda. A potem udaæ siê tam i wypleniæ to robactwo. A tak¿e jeœli to mo¿liwe odzyskaæ czêœæ zrabowanych nam rzeczy.
	Log_CreateTopic          (Obozowisko, LOG_MISSION);
    Log_SetTopicStatus       (Obozowisko, LOG_RUNNING);
    B_LogEntry                     (Obozowisko,"Lee ma dla mnie wa¿ne zadanie. Chodzi o obóz stra¿ników, na którego czele stoi niejaki Morok. Napadaj¹ oni na ludzi z Nowego Obozu, grabi¹ i morduj¹. Lee chce by zniszczyæ to gniazdo szerszeni. Poleci³ mi porozmawiaæ z Torlofem i Cordem, którzy maj¹ pomóc mi w tej misji.");
	
	
};

//========================================
//-----------------> OBRONA_ENDQUEST
//========================================

INSTANCE DIA_Lee_OBOZ1 (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBOZ1_Condition;
   information  = DIA_Lee_OBOZ1_Info;
   permanent = FALSE;
   description = "Rozumiem. Porozmawiam z Torlofem i Cordem.";
};

FUNC INT DIA_Lee_OBOZ1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBOZ))
    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBOZ1_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBOZ1_03_01");  //Rozumiem. Porozmawiam z Torlofem i Cordem.
    AI_Output (self, other ,"DIA_Lee_OBOZ1_15_02");  //S³usznie. Zajmij siê tym.
    AI_Output (other, self ,"DIA_Lee_OBOZ1_03_03");  //W porz¹dku.
    AI_Output (self, other ,"DIA_Lee_OBOZ1_15_04");  //Jeszcze jedno. WeŸ tê mapê z zaznaczonym miejscem gdzie znajduje siê obozowisko tych œwiñ. 
	CreateInvItem (self, ItWr_OM_T);
	B_GiveInvItems (self,other, ItWr_OM_T, 1);
	AI_Output (other, self ,"DIA_Lee_OBOZ1_03_05");  //Rozumiem, dziêki.
	
	GRD_7895_Patter.guild  = GIL_NONE;
	GRD_7898_Gardist.guild = GIL_NONE;
	GRD_7897_Gardist.guild = GIL_NONE;
	GRD_7896_Gardist.guild = GIL_NONE;
	GRD_7894_Morok.guild   = GIL_NONE;
	
	B_Story_MorokCamp_CH5();
};

//========================================
//-----------------> OBRONA_ENDQUEST
//========================================

INSTANCE DIA_Lee_OBOZ1S (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_OBOZ1S_Condition;
   information  = DIA_Lee_OBOZ1S_Info;
   permanent = FALSE;
   description = "Morok i jego ludzie nie ¿yj¹...";
};

FUNC INT DIA_Lee_OBOZ1S_Condition()
{
    if (Npc_IsDead (GRD_7894_Morok))
	&& (Npc_KnowsInfo (hero,DIA_Patter_Oboz))
	&& (Npc_HasItems (other, ItMi_StolenGoodsSLD) >=3)

    {
    return TRUE;
    };
};


FUNC VOID DIA_Lee_OBOZ1S_Info()
{
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_01"); //Morok i jego ludzie nie ¿yj¹. Odzyskaliœmy to co ukradli swoim ofiar¹.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_02"); //Dobra robota. Nie wskrzesimy tych, których wymordowali ale przynajmniej zrobiliœmy wszystko to co da³o siê zrobiæ.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_03"); //Gdzie zrabowane towary?
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_04"); //Tutaj.
	B_GiveInvItems (other,self,ItMi_StolenGoodsSLD,3);
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_05"); //Dziêkuje. Rozdam to moim ludziom jako premiê. Poprawi to ich morale w dzisiejszych ciê¿kich i krwawych czasach.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_06"); //A oto twoja nagroda. 
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_07"); //W pe³ni zas³u¿y³eœ na tê rudê.
	CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self,other,ItMiNugget,500);
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_08"); //Dziêkuje.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_09"); //Dziêki za wykonanie tej misji. By³a bardzo istotna dla naszej sprawy.	
	Npc_SetTrueGuild	(GRD_7895_Patter, GIL_GRD);
	GRD_7895_Patter.guild = GIL_GRD;
	AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_10"); //W porz¹dku. Zrobiliœmy to co musieliœmy zrobiæ.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_11"); //Gdybyœmy mieli wiêcej takich ludzi jak ty to losy tej wojny by³yby dla nas korzystniejsze.
	AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_12"); //Wygramy j¹.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_13"); //Mam tak¹ nadzieje. 
    B_LogEntry               (Obozowisko,"Zda³em raport Lee. Wykonaliœmy powierzone nam przez niego zadanie. Zdecydowa³ siê rozdysponowaæ odzyskane towary pomiêdzy swoich ludzi. Ja otrzyma³em wynagrodzenie w rudzie. Sprawa obozu Moroka zosta³a zamkniêta raz na zawsze.");
	Log_SetTopicStatus       (Obozowisko, LOG_SUCCESS);
	B_GiveXP (600);
};


//========================================
//-----------------> TMQ_GRDS
//========================================

INSTANCE DIA_Lee_TMQ_GRDS (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_TMQ_GRDS_Condition;
   information  = DIA_Lee_TMQ_GRDS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_TMQ_GRDS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_TMQ_POTION))
&& (Npc_GetDistToWP(Sld_700_Lee,"NC_SMALL_CAVE_CENTER")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_TMQ_GRDS_Info()
{
    AI_LookAtNpc(ban_1610_Quentin,sld_700_lee);
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_01"); //Widzê, ¿e nasi spóŸnieni goœcie wreszcie przybyli.
    AI_Output (other, self ,"DIA_Lee_TMQ_GRDS_15_02"); //SpóŸniliœmy siê bo stra¿ ujê³a Quentina. Na szczêœcie uda³o siê nam go odbiæ.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_03"); //Co? Zatem byli tak blisko sukcesu?
    AI_Output (other, self ,"DIA_Lee_TMQ_GRDS_15_04"); //Grunt, ¿e uda³o siê ich powstrzymaæ.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_05"); //Dobrze... Zatem rozpoczynajmy naradê.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_06"); //Ostatnio odnieœliœmy wiele sukcesów w walce ze Stra¿¹.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_07"); //Wygraliœmy szereg potyczek. A si³y Gomeza siê wykruszaj¹. 
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_08"); //Jednak jest coœ niepokoj¹cego.

};

//========================================
//-----------------> TMQ_UNDEAD
//========================================

INSTANCE DIA_Lee_TMQ_UNDEAD (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 2;
   condition    = DIA_Lee_TMQ_UNDEAD_Condition;
   information  = DIA_Lee_TMQ_UNDEAD_Info;
   permanent	= FALSE;
   description	= "Co takiego?";
};

FUNC INT DIA_Lee_TMQ_UNDEAD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_TMQ_GRDS))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_TMQ_UNDEAD_Info()
{
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_01"); //Co takiego?
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_02"); //Otrzyma³em raporty mówi¹ce, ¿e moi ludzie natknêli siê na zombie w pancerzach stra¿y.
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_03"); //Te istoty zasia³y pop³och w naszych szeregach.
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_04"); //Co zamierzasz?
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_05"); //Na pocz¹tek powinieneœ pomówiæ z jednym z moich ludzi Florianem. Prze¿y³ on starcie z nieumar³ymi Gomeza.
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_06"); //Gdzie go spotkam?
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_07"); //W karczmie...
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_08"); //Pogadaj z tym Najemnikiem a potem wróæ i zdaj nam relacjê.
	//Wld_InsertNpc				(SLD_40070_Florian,"OC1");
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_09"); //Jasne.
		B_LogEntry               (TajnaMisjaQuentina,"Dotarliœmy na naradê. Lee powiedzia³, ¿e dzieje siê coœ niepokoj¹cego. Ostatnio jego ludzie natknêli siê na zombie, które oddanie walczy³y po stronie Gomeza. Mam pomówiæ z niejakim Florianem, który by³ naocznym œwiadkiem tych wydarzeñ. Spotkam go w karczmie Mazina.");
    AI_StopProcessInfos	(self);
};
Func void TMQ_JIM_RESP()
{
	//CreateInvItems	             (STT_2077_Jim, KDF_ARMOR_L,1);
	//AI_EquipBestArmor	         (STT_2077_Jim);
	Npc_ExchangeRoutine          (STT_2077_Jim,"TMQ");
	//STT_2077_Jim.flags = 0;
    Stt_325_Omid.guild = GIL_NONE;
	B_ChangeGuild                (Stt_325_Omid,GIL_NONE);
	Npc_ExchangeRoutine          (Stt_325_Omid,"TMQOCC");
	
	Wld_InsertNpc				(ZombieTMQ1,"OCC_GREATTOWER_2NDSTORE");
	Wld_InsertNpc				(ZombieTMQ2,"WP_TMQ_ZOM1");
	Wld_InsertNpc				(STT_40149_Jim,"WP_TMQJIM_SIT");
	
};


//========================================
//-----------------> TMQ_FLORIAN
//========================================

INSTANCE DIA_Lee_TMQ_FLORIAN (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_TMQ_FLORIAN_Condition;
   information  = DIA_Lee_TMQ_FLORIAN_Info;
   permanent	= FALSE;
   description	= "Florian opowiedzia³ mi o wszystkim.";
};

FUNC INT DIA_Lee_TMQ_FLORIAN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Florian_TMQ_ZOMBIE))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_TMQ_FLORIAN_Info()
{
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_01"); //Florian opowiedzia³ mi o wszystkim. To jakiœ m³ody Mag na us³ugach Gomeza przywo³uje zombie, które przera¿aj¹ twoich ludzi. 
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_02"); //Tylko sk¹d ten Mag? Przecie¿ oni zostali zabici.
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_03"); //Sam chcia³bym to wiedzieæ.
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_04"); //Powinieneœ dostaæ siê do Starego Obozu i zabiæ tego Maga nim narobi wiêkszych szkód. 
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_05"); //Przygotuje siê do tego i zrobiê to. Nie ma innej mo¿liwoœci.
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_06"); //Zatem niech ci siê powiedzie bo inaczej los tej wojny mo¿e siê odmieniæ na nasz¹ niekorzyœæ.
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_07"); //Bez obaw. Poradzê sobie.
	B_LogEntry               (TajnaMisjaQuentina,"Lee poleci³ mi bym teleportowa³ siê do Starego Obozu i zabi³ tajemniczego Maga, który wspiera Gomeza. To nie bêdzie ³atwe.");
	TMQ_JIM_RESP();
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> TMQ_KILLJIM
//========================================

INSTANCE DIA_Lee_TMQ_KILLJIM (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_TMQ_KILLJIM_Condition;
   information  = DIA_Lee_TMQ_KILLJIM_Info;
   permanent	= FALSE;
   description	= "Ten mag od nekromancji si³ Gomeza ju¿ nie ¿yje.";
};

FUNC INT DIA_Lee_TMQ_KILLJIM_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jim_TMQ_HI))
&& (Npc_IsDead (STT_40149_Jim))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_TMQ_KILLJIM_Info()
{
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_01"); //Ten mag od nekromancji si³ Gomeza ju¿ nie ¿yje.
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_02"); //A wiêc uda³o ci siê!
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_03"); //Zatem uk³ony w twoj¹ stronê. To by³o bardzo wa¿ne co zrobi³eœ. 
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_04"); //Teraz si³y Gomeza wreszcie nam ulegn¹!
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_05"); //Wyœwiadczy³eœ nam wszystkim wielk¹ przys³ugê. Przyjmij to w nagrodê.
	B_GiveInvItems (self,other, ItFo_PotionTime_Strength_01, 3);
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_06"); //Dziêki.
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_07"); //Do zobaczenia przyjacielu i donieœ o sukcesie Quentinowi.
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_08"); //Tak zrobiê.
	B_LogEntry               (TajnaMisjaQuentina,"Lee by³ ze mnie bardzo zadowolony. Wszak si³y Gomeza zosta³y teraz znacz¹co os³abione poprzez moj¹ ma³¹ dywersjê.");
};

//========================================
//-----------------> Othnielia
//========================================

INSTANCE DIA_Lee_Othnielia (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_Othnielia_Condition;
   information  = DIA_Lee_Othnielia_Info;
   permanent	= FALSE;
   description	= "Chyba wiem coœ co ciê zainteresuje.";
};

FUNC INT DIA_Lee_Othnielia_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Norton_HELLO2))
&& (Npc_KnowsInfo(hero,Sld_700_Lee_DAMNPAST))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_Othnielia_Info()
{
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_01"); //Chyba wiem coœ co ciê zainteresuje.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_03"); //O zabójstwo królewskiej ¿ony. Jeden z jej prawdziwych morderców jest pod Barier¹.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_04"); //CO!? Gdzie on teraz jest? I co to za sukinsyn!
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_05"); //To Norton. Stra¿nik ze Starego Obozu.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_06"); //Gdybym tylko go dorwa³... Teraz bêdzie o to ciê¿ko gdy Stary Obóz jest dobrze strze¿ony i zamkniêty.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_07"); //Muszê go zabiæ i dowiedzieæ siê kto by³ zleceniodawc¹ tej zbrodni. 
};

//========================================
//-----------------> Norton
//========================================

INSTANCE DIA_Lee_Norton (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 2;
   condition    = DIA_Lee_Norton_Condition;
   information  = DIA_Lee_Norton_Info;
   permanent	= FALSE;
   description	= "Mogê rozprawiæ siê z Nortonem.";
};

FUNC INT DIA_Lee_Norton_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_Othnielia))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_Norton_Info()
{
    AI_Output (other, self ,"DIA_Lee_Norton_15_01"); //Mogê rozprawiæ siê z Nortonem.
    AI_Output (self, other ,"DIA_Lee_Norton_03_02"); //Gdybyœ by³ na tyle odwa¿ny i znalaz³ siê w Starym Obozie to rozpraw siê z nim.
    AI_Output (self, other ,"DIA_Lee_Norton_03_03"); //Nie zabijaj go do momentu a¿ powie coœ wa¿nego. Jak ju¿ siê czegos dowiesz to wiesz co robiæ.
    AI_Output (other, self ,"DIA_Lee_Norton_15_04"); //Jasne.
    AI_Output (self, other ,"DIA_Lee_Norton_03_05"); //Dla mnie to sprawa honoru a nawet coœ wiêcej...
	B_LogEntry               (ZaDlugiJezor,"Lee poleci³ mi za³atwiæ Nortona a wczeœniej go przes³uchaæ by dowiedzieæ siê kto by³ zleceniodawc¹ morderstwa królewskiej ¿ony.");
	B_ChangeGuild    (Grd_40107_Norton,GIL_NONE);  
	B_SetPermAttitude	(Grd_40107_Norton,	ATT_NEUTRAL);
	Grd_40107_Norton.guild = GIL_NONE;
	Wld_InsertNpc				(GRD_40109_Gardist,"OC1");
	B_ChangeGuild    (GRD_40109_Gardist,GIL_NONE);  
	B_SetPermAttitude	(GRD_40109_Gardist,	ATT_NEUTRAL);
	GRD_40109_Gardist.guild = GIL_NONE;
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> NortonIsDead
//========================================

INSTANCE DIA_Lee_NortonIsDead (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_NortonIsDead_Condition;
   information  = DIA_Lee_NortonIsDead_Info;
   permanent	= FALSE;
   description	= "Norton nie ¿yje.";
};

FUNC INT DIA_Lee_NortonIsDead_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Norton_HELLO5))
    && (Npc_IsDead (Grd_40107_Norton))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_NortonIsDead_Info()
{
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_01"); //Norton nie ¿yje.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_02"); //Znakomicie. Drañ dosta³ to na co zas³u¿y³.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_03"); //Kim by³ jego zleceniodawca przy zabójstwie Othnielii?
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_04"); //Tego ju¿ siê nie dowiemy. Przynajmniej nie pod Barier¹. Norton umar³ w momencie gdy mia³ mi to ujawniæ.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_05"); //Cholera, jak zwykle. Liczy³em, ¿e jest cieñ szansy, ¿e dowiem siê kto by³ tym sukinsynem, który zaplanowa³ to wszystko.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_06"); //I sprawi³, ¿e moje dotychczasowe ¿ycie leg³o w gruzach.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_07"); //Dobrze. I tak wyœwiadczy³eœ mi wielk¹ przys³ugê. 
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_08"); //WeŸ to, Zas³u¿y³eœ.
	B_GiveInvItems (self,other, itminugget, 400);
	B_GiveInvItems (self,other, Schutzring_Waffen2, 1);
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_09"); //Dziêki.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_10"); //Czas zemsty nadejdzie. Gdy tylko to wszystko tutaj siê skoñczy.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_11"); //Do zobaczenia, przyjacielu.
	B_LogEntry               (ZaDlugiJezor,"Powiedzia³em Lee o œmierci Nortona a tak¿e o tym co zd¹¿y³ mi powiedzieæ. Niestety nie dowiedzieliœmy siê kto by³ jego zleceniodawc¹. Tak czy owak Lee wyp³aci³ mi nagrodê za zabicie jednego z morderców królewskiej ¿ony. Zarzeka siê, ¿e gdy Bariera upadnie to krwawo rozliczy siê ze swoimi pod³ymi przeœladowcami.");
	Log_SetTopicStatus(ZaDlugiJezor,LOG_SUCCESS);
	B_GiveXP(800);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZM_Hunter
//========================================

INSTANCE DIA_Lee_ZM_Hunter (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_ZM_Hunter_Condition;
   information  = DIA_Lee_ZM_Hunter_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_ZM_Hunter_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_40129_Pascal_ZM))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_ZM_Hunter_Info()
{
    AI_Output (self, other ,"DIA_Lee_ZM_Hunter_03_01"); //Przyby³ myœliwy Jonas. Z tego co ju¿ wiem chodzi o Stra¿ników Gomeza.
    AI_Output (other, self ,"DIA_Lee_ZM_Hunter_15_02"); //Mo¿na siê by³o domyœleæ.
    AI_Output (self, other ,"DIA_Lee_ZM_Hunter_03_03"); //Jestem ciekaw co nam powie ten myœliwy.
    AI_Output (other, self ,"DIA_Lee_ZM_Hunter_15_04"); //Przekonajmy siê.
	B_LogEntry               (ZagrozeniMysliwi,"Lee poleci³ mi przes³uchaæ myœliwego Jonasa, który przyby³ w pewnej wa¿nej sprawie.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> ZM_YouHear
//========================================

INSTANCE DIA_Lee_ZM_YouHear (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_ZM_YouHear_Condition;
   information  = DIA_Lee_ZM_YouHear_Info;
   permanent	= FALSE;
   description	= "Sam s³ysza³eœ.";
};

FUNC INT DIA_Lee_ZM_YouHear_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jonas_ZM_Who))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_ZM_YouHear_Info()
{
    AI_Output (other, self ,"DIA_Lee_ZM_YouHear_15_01"); //Sam s³ysza³eœ.
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_02"); //W takim uk³adzie. Musimy ich wesprzeæ. 
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_03"); //Zbierz Pascala, Torlofa i Wilka.
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_04"); //Potem pogadaj z Jonasem. Nich poprowadzi was do ich obozowiska.
    AI_Output (other, self ,"DIA_Lee_ZM_YouHear_15_05"); //Zrozumiano.
	Npc_ExchangeRoutine(NON_5611_Jonas,"NC2");

	B_LogEntry     (ZagrozeniMysliwi,"Lee poleci³ mi zebraæ Pascal, Torlofa i Wilka a nastêpnie wraz z Jonasem udaæ siê do obozu myœliwych by obroniæ ich przed Stra¿nikami.");
    AI_StopProcessInfos	(self);
};





//========================================
//-----------------> ZM_END
//========================================

INSTANCE DIA_Lee_ZM_END (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_ZM_END_Condition;
   information  = DIA_Lee_ZM_END_Info;
   permanent	= FALSE;
   description	= "Myœliwi s¹ ju¿ bezpieczni. Ich obozowi nic ju¿ nie zagra¿a.";
};

FUNC INT DIA_Lee_ZM_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_SLD_40129_Pascal_ZM_TROPHY))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_ZM_END_Info()
{
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_01"); //Myœliwi s¹ ju¿ bezpieczni. Ich obozowi nic ju¿ nie zagra¿a.
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_02"); //Dobrze. Rozumiem ¿e pokazaliœcie tym durniom gdzie ich miejsce.
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_04"); //Z racji, ¿e by³eœ g³ównodowodz¹cym w tej misji nale¿y ci siê jeszcze nagroda ode mnie.
	B_GiveInvItems (self,other,ItMw_2H_AxeHevay_100 , 1);
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_05"); //Dziêki.
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_06"); //B¹dŸ w pogotowiu bo czuje, ¿e bêdzie wiêcej k³opotów.
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_07"); //Miejmy nadziejê ¿e nie...
	B_LogEntry          (ZagrozeniMysliwi,"Lee by³ zadowolony z rezultatów naszej misji. Wyp³aci³ mi nagrodê jako g³ównodowodz¹cemu grup¹ Najemników, która ocali³a Myœliwych.");
	Log_SetTopicStatus	(ZagrozeniMysliwi,	LOG_SUCCESS);
	B_GiveXP(1000);
};








//========================================
//-----------------> I_Dead_PZ
//========================================

INSTANCE DIA_Lee_I_Dead_PZ (C_INFO)
{
   npc          = SLD_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_I_Dead_PZ_Condition;
   information  = DIA_Lee_I_Dead_PZ_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lee_I_Dead_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Torlof_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_I_Dead_PZ_Info()
{
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_01"); //Nie... To ja powinienem by³ zgin¹æ....
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_02"); //Bogowie.... Co tu siê sta³o?!
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_03"); //Byli przebrani za Szkodników. Ale to byli zamachowcy....
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_04"); //Orik mnie zas³oni³ i.... Przeklête dranie!
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_05"); //Gdzie pozostali dwaj?
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_06"); //Myœleli , ¿e mnie dostan¹ lecz gdy Orik zas³oni³ mnie w³asn¹ piersi¹ i sam przyj¹³ cios....
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_07"); //Zdo³a³em ci¹æ toporem jednego z nich. Pozostali dwaj przestraszyli siê i uciekli.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_08"); //A twoi wartownicy?
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_09"); //Myœleli , ¿e to zwyli Szkodnicy. Dali siê zaskoczyæ a tamci zwiali.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_10"); //Mo¿e uda siê ich dopaœæ.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_11"); //Jeœli mo¿esz wype³ni moj¹ proœbê. Pomœcij Orika zabijaj¹c tych dwóch sukinsynów.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_12"); //Najpierw muszê ustaliæ gdzie s¹.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_13"); //Zatem poœpiesz siê. Liczy siê ka¿da minuta by wymierzyæ im sprawiedliwoœæ.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_14"); //Ruszam.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_15"); //Powodzena.
	B_LogEntry          (PodejrzaneZamieszanie,"Ktoœ próbowa³ skrytobójczo zabiæ Lee. Zgin¹³ jednak Orik broni¹c swego prze³o¿onego. Zamachowcy uciekli a ja muszê pod¹¿yæ ich tropem. Wczeœniej pomówiê z Torlofem jak chcia³.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZ_ALL_DEAD
//========================================

INSTANCE DIA_Lee_PZ_ALL_DEAD (C_INFO)
{
   npc          = SLD_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_PZ_ALL_DEAD_Condition;
   information  = DIA_Lee_PZ_ALL_DEAD_Info;
   permanent	= FALSE;
   description	= "Wszyscy zamachowcy nie ¿yj¹.";
};

FUNC INT DIA_Lee_PZ_ALL_DEAD_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Podejrzanys_HELLO1))
    && (Npc_IsDead (ORG_40152_Podejrzany))
    && (Npc_IsDead (ORG_40151_Podejrzany))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_PZ_ALL_DEAD_Info()
{
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_01"); //Wszyscy zamachowcy nie ¿yj¹.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_02"); //Pomœci³eœ Orika ale to ju¿ nie cofnie czasu. Tym niemniej dziêkuje ci za to, ¿e nie odpuœci³eœ i ukara³eœ tych szubrawców. Choæ prawdziwym winowajc¹ jest ten kto zleci³ t¹ zbrodnie.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_03"); //To robota Magnatów. Oto pismo, które znalaz³em u zamachowca.
	B_GiveInvItems (other,self, ItWr_PZ_Message, 1);
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_04"); //Tak myœla³em. A to sukinsyny! To w³aœnie ich mordercze metody. Nie cofn¹ siê przed niczym by zrealizowaæ swój cel. Orik zap³aci³ za to najwy¿sz¹ cenê. Wiernie mi s³u¿y³ i co go spotka³o...
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_05"); //Straci³eœ doradcê i przyjaciela ale nie mo¿esz siê poddaæ. Dni Gomeza i jego najbli¿szych towarzyszy s¹ ju¿ policzone.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_06"); //Ca³y czas w to wierzê. Oby zaznali kary za wszystkie swoje pod³oœci. Œwinie musz¹ zdechn¹æ w rynszotku jak im przysta³o. A ty weŸ w to w nagrodê. Zas³u¿y³eœ za okazan¹ pomoc, jedno z lepszych ostrzy z mojej kolekcji.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_07"); //Dziêkuje choæ wola³bym to dostaæ w znacznie lepszych okolicznoœciach.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_08"); //Pora siê otrz¹sn¹æ. Pochowaæ Orika z honorami pod t¹ cholern¹ barier¹ i myœleæ co dalej.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_09"); //Mo¿esz na mnie liczyæ. I na swoich ludzi chocia¿by Gorna i Torlofa. 
	B_GiveInvItems (self,other, ItMw_Soul_Destroyer, 1);
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_10"); //I ta myœl dodaje mi wiecej si³. Kim by³by genera³ bez swoich ¿o³nierzy... Ruszaj. Z pewnoœci¹ masz wiêcej do roboty.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_11"); //Dobrze. Daj znaæ gdy bêdê potrzebny.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_12"); //Dziêkuje.
	Log_SetTopicStatus	(PodejrzaneZamieszanie,	LOG_SUCCESS);
	B_LogEntry          (PodejrzaneZamieszanie,"Powiedzia³em Lee o œmierci zamachowców i wyjawi³em kto by³ ich zleceniodawc¹ czego przywódca Najemników siê domyœla³. Jest smutny i roz¿alony ale wiem, ¿e bêdzie walczy³ dalej, mo¿e nawet z wiêksz¹ determinacj¹. Lee wynagrodzi³ mnie za pomoc a ja obieca³em, ¿e bêdzie móg³ liczyæ na mnie i na swoich podkomendnych w dalszych walkach z Gomezem i jego zgraj¹.");
	B_GiveXP(800);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZ_Problem
//========================================

INSTANCE DIA_Lee_PZ_Problem (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_PZ_Problem_Condition;
   information  = DIA_Lee_PZ_Problem_Info;
   permanent	= FALSE;
   description	= "Jest problem.";
};

FUNC INT DIA_Lee_PZ_Problem_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Foster_HomerAndLee))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_PZ_Problem_Info()
{
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_01"); //Jest problem.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_02"); //W Kolonii one s¹ codziennie. Jaki tym razem?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_03"); //Powa¿ny. Jakaœ zbójecka szajka chce okraœæ waszego in¿yniera z cennych dokumentów. Chcieliby pozyskaæ plany fortyfikacji Nowego Obozu i sprzedaæ je Gomezowi.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_04"); //Hmmm pod³y i chytry plan. Masz jakieœ dowody, ¿e ta banda ³ajdaków chce nas bezczelnie okrasæ?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_05"); //Rzuæ okiem na to pismo.
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_06"); //Kto by³ jego adresatem?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_07"); //Zbieracz Foster. Potajemnie nale¿a³ do tej szajki ale postanowi³ zerwaæ wspó³pracê. Gro¿¹ mu œmierci¹.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_08"); //Zatem wpakowa³ siê w niez³e bagno. Kontakty z szemranymi typam zawsze siê Ÿle koñcz¹. I tym razem te¿ nie ma wyjatku. Trochê mi go ¿al ale sam jest sobie winien.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_09"); //Przydzielê ochrone Homerowi. Musi dok³adnie pilniowaæ cennych pism. A moi dwaj ludzie bêd¹ w jego pobli¿u. IdŸ i powiedz mu o tym. Potem pogadaj z Fosterem mo¿e jeszcze siê czegoœ dowiesz.
	B_LogEntry           (PoszkodowaniZbieracze,"Rozmawia³em z Lee i powiedzia³em mu co i jak. Lider Najemników przydzieli³ ochronê Homerowi. Pogadam z in¿ynierem.");
};

//========================================
//-----------------> PZ_ENDED
//========================================

INSTANCE DIA_Lee_PZ_ENDED (C_INFO)
{
   npc          = Sld_700_Lee;
   nr           = 1;
   condition    = DIA_Lee_PZ_ENDED_Condition;
   information  = DIA_Lee_PZ_ENDED_Info;
   permanent	= FALSE;
   description	= "Problem z³odziejskiej szajki zosta³ rozwi¹zany.";
};

FUNC INT DIA_Lee_PZ_ENDED_Condition()
{
   if (Npc_IsDead (ORG_40160_Szef))
   && (Npc_IsDead (Org_40161_Rozbojnik))
   && (Npc_IsDead (Org_40159_Rozbojnik))
   && (Npc_KnowsInfo(hero,DIA_Szef_HI_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Lee_PZ_ENDED_Info()
{
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_01"); //Problem z³odziejskiej szajki zosta³ rozwi¹zany.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_02"); //W jaki sposób?
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_03"); //Prosty ale skuteczny. Wszyscy nie ¿yj¹.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_04"); //Pokona³eœ ich? Jeœli tak to post¹pi³eœ twardo i zdecydowanie. Masz moje uznanie.
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_05"); //Szkoda, ¿e nie przypilnowa³em te¿ Fostera. Dawni kumple go zabili.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_06"); //Có¿ czeka³aby go bardzo surowa kara. Tak dosta³ jej najwy¿szy wymiar...
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_07"); //Ale najwa¿niejsze, ¿e ty nam pomog³eœ. WeŸ to w nagrodê.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_08"); //Miej oczy szeroko otwarte i doskonal siê a daleko zajdziesz. Masz potencja³.
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_09"); //Dziêkuje. Na razie.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_10"); //Do nastêpnego spotkania.
	B_GiveInvItems (self,other, Schutzamulett_Geschosse, 1);
	B_LogEntry           (PoszkodowaniZbieracze,"Powiedzia³em Lee o œmierci rozbójników. Usatysfakcjonowany da³ mi rudê i przyzna³, ¿e mam potencja³. Mi³e s³owa.");
    AI_StopProcessInfos	(self);
};

instance dia_lee_pickpocket(c_info) {
    npc = sld_700_lee;
    nr = 900;
    condition = dia_lee_pickpocket_condition;
    information = dia_lee_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lee_pickpocket_condition() {
	e_beklauen(10, 50);
};

func void dia_lee_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lee_pickpocket);
	info_addchoice(dia_lee_pickpocket, dialog_back, dia_lee_pickpocket_back);
	info_addchoice(dia_lee_pickpocket, dialog_pickpocket, dia_lee_pickpocket_doit);
};

func void dia_lee_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_lee_pickpocket);
};

func void dia_lee_pickpocket_back() {
    info_clearchoices(dia_lee_pickpocket);
};