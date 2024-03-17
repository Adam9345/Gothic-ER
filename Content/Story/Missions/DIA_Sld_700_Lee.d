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
	description = "Jeste� szefem Najemnik�w, tak?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Jeste� szefem Najemnik�w, tak?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Zgadza si�, ch�opcze!
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
	description = "Czym zajmuje si� Najemnik w s�u�bie mag�w?";
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
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Czym zajmuje si� Najemnik w s�u�bie mag�w?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //To proste: pilnuje rudy i broni mag�w.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Od czasu do czasu magowie zlecaj� nam jakie� zadania specjalne.
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
	description = "Chcia�bym do was do��czy�!";
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
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Chcia�bym do was do��czy�!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //Odbi�o ci? My�lisz, �e przyjmuj� ka�dego w��cz�g�, kt�ry si� do mnie zg�osi?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Musisz najpierw sp�dzi� troch� czasu w naszym Obozie. B�d� ci� mia� na oku! Zobaczymy, na co ci� sta�.
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
	description = "Chcia�bym zosta� Najemnikiem w s�u�bie mag�w. My�lisz, �e jestem ju� got�w?";
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
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Chcia�bym zosta� Najemnikiem w s�u�bie mag�w. My�lisz, �e jestem ju� got�w?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Twoje dokonania w Starej Kopalni dowodz�, �e sta� ci� na wiele.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Jestem sk�onny przyj�� ci� w poczet Najemnik�w.
	
		if (hero.level < 10)
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale nie jeste� gotowy do s�u�by w naszych szeregach. Musisz zdoby� jeszcze troch� do�wiadczenia.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if (hero.level >= 10)
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dam ci szans�. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_01"); //Najemnikami zostaj� ci, kt�rzy dobrze poznali �ycie w kolonii lub zrobili co�, co udowadnia ich odwag�.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_MOD_02"); //Ty jeszcze nic takiego nie dokona�e�. Czeka ci� d�uga droga.
	};

	
};

/*------------------------------------------------------------------------
							S�LDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chc� zosta� Najemnikiem."; 
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
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chc� zosta� Najemnikiem.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //M�dra decyzja. Nie po�a�ujesz.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Powiedz mi: dlaczego? Dlaczego do��czy�e� do nas, a nie do Bractwa, albo do Starego Obozu?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee pozwoli� mi do��czy� do Najemnik�w.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"W tamtych obozach tylko traci�bym czas.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Od pocz�tku my�la�em tylko o odzyskaniu wolno�ci.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Tak si� jako� z�o�y�o.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //W tamtych obozach tylko traci�bym czas.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedyna rzecz, kt�ra ma tutaj jak�� prawdziw� warto�� to pragnienie wolno�ci. Witaj w�r�d nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Od pocz�tku my�la�em tylko o odzyskaniu wolno�ci.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //I dzi�ki nam wkr�tce j� odzyskasz. Witaj w�r�d nas, NAJEMNIKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Tak si� jako� z�o�y�o.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //�eby si� tylko nie z�o�y�o, �e kiedy� nagle zmienisz zdanie. Witaj w�r�d nas, NAJEMNIKU!
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
	description		= "Chc� zosta� Magiem Wody."; 
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
	AI_Output			(other, self,"Sld_700_Lee_BECOMEWMNOW_Info_15_01"); //Chc� zosta� Magiem Wody.
	AI_Output			(self, other,"Sld_700_Lee_BECOMEWMNOW_Info_08_02"); //C�, dokona�e� wiele, jednak to nie ja o tym decyduj�. Musisz porozmawia� z Cronosem. 
	
	Log_CreateTopic		(GE_BecomeWatermage,LOG_NOTE);
	B_LogEntry			(GE_BecomeWatermage,"Lee pozwoli� mi do��czy� do Mag�w Wody. Jednak to oni podejm� kluczow� decyzj�, czy jestem gotowy. Musz� porozmawia� z Cronosem.");	
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
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Kiedy� wiod�em ca�kiem inne �ycie.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //By�em jednym z najlepszych genera��w tego kr�lestwa.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Ca�e �ycie sp�dzi�em broni�c ojczyzny przed wrogiem.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Ale szlachta patrzy�a na mnie niech�tnie, bo Kr�l wysoko ceni� sobie moje rady. Te �otry wiedzia�y, �e mog� pokrzy�owa� ich plany.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //By�em zbyt pewny siebie i nie zauwa�y�em side�, kt�re na mnie zastawili. Aby mnie usun�� pos�u�yli si� kr�lewsk� �on�.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Pos�dzono mnie o jej zamordowanie. Rhobar nie mia� innego wyboru.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Od szubienicy uratowa�o mnie tylko wiele lat przyk�adnej s�u�by. W ten spos�b trafi�em tutaj.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Ale pewnego dnia odzyskam wolno��, a wtedy nadejdzie czas zemsty...
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Zemszcz� si�!
	if (Npc_KnowsInfo(hero,DIA_Norton_Beer_Othniella))
	{
	B_LogEntry               (ZaDlugiJezor,"Lee powiedzia�, �e zosta� oskar�ony o morderstwo kr�lewskiej �ony. Musz� mu powiedzie� to co us�ysza�em od Nortona.");
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
	description = "Co my�lisz o ca�ej tej sprawie z kopalni�?";
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
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Co my�lisz o ca�ej tej sprawie z kopalni�?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die M�glichkeit, Lee �ber die freie Mine zu informieren! ***Bj�rn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Tym razem posun�li si� za daleko. Jeszcze tego po�a�uj�.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//My�l�, �e zagro�enie ju� min�o.
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Nasz Ob�z wiele ci zawdzi�cza. Przyda�by mi si� kto� taki jak ty.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Dzi�kuj�. Musz� ju� rusza� w dalsz� drog�.
		AI_Output			(self, hero,"Info_Lee_TELEPORT_08_01"); 		//Jeszcze co�!
		AI_Output			(self, hero,"Info_Lee_TELEPORT_08_03"); 		//We� t� magiczn� run� jako symbol naszej wdzi�czno�ci za twoje dokonania.
		AI_Output			(hero, self,"Info_Lee_TELEPORT_15_05"); 		//Dzi�kuj�!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Do zobaczenia!


		B_LogEntry			(CH4_BannedFromOC,	"Poinformowa�em Lee o wynikach akcji, kt�r� przeprowadzi�em wraz z Gornem w Wolnej Kopalni. By� bardzo zadowolony.");
		
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
	description		= "Wyrzucono mnie ze Starego Obozu. Chcia�bym do was do��czy�."; 
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
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Wyrzucono mnie ze Starego Obozu. Chcia�bym do was do��czy�.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Nasz Ob�z wiele ci zawdzi�cza. Przyda�by mi si� kto� taki jak ty.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Przejd�my od razu do rzeczy. Witaj w Nowym Obozie, Najemniku!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //We� t� zbroj�. Dobrze, �e mamy ci� teraz po naszej stronie.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Po tym jak zosta�em wygnany ze Starego Obozu, postanowi�em zosta� Najemnikiem. Pora wraca� do Saturasa!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee mo�e mnie nauczy� walki dwur�cznym or�em oraz zwi�kszy� moj� si�� i zwinno��.");
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
	description		= "Przyda�aby mi si� lepsza zbroja."; 
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
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Przyda�aby mi si� lepsza zbroja.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Najpierw musisz sobie na ni� zas�u�y�. Poza tym - taka rzecz nie jest tania.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	
	Info_AddChoice		(Sld_700_Lee_ARMOR,"Kup �redni� zbroje najemnika.",Sld_700_Lee_ARMOR_M);
    AFIP_SetChoiceItem  (Sld_700_Lee_ARMOR_M,SLD_ARMOR_M);
	
	Info_AddChoice		(Sld_700_Lee_ARMOR,"Kup ci�k� zbroj� najemnika.",Sld_700_Lee_ARMOR_H);
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
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chcia�bym dosta� wzmocnion� zbroj�.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Nie jeste� jeszcze do�� do�wiadczony, �eby otrzyma� nowy pancerz. Wr��, jak zdob�dziesz troch� do�wiadczenia.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy te� nie masz co marzy� o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Ta zbroja to kawa� solidnej roboty. B�dzie ci dobrze s�u�y�.
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
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Chcia�bym dosta� ci�k� zbroj�.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Nie jeste� jeszcze do�� do�wiadczony, �eby otrzyma� nowy pancerz. Wr��, jak zdob�dziesz troch� do�wiadczenia.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy te� nie masz co marzy� o nowej zbroi.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Ten pancerz to prawdziwe dzie�o sztuki. Lepszego nie znajdziesz po tej stronie Bariery. Mo�esz mi wierzy�, wart jest ka�dej bry�ki...
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Mog� ci pom�c zwi�kszy� twoj� si�� i zr�czno��.
	
	
	
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
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  SLD_700_Lee_TEACH_2H (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= SLD_700_Lee_TEACH_2H_Condition;
	information		= SLD_700_Lee_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy� dwur�cznym or�em?"; 
};
//
FUNC int  SLD_700_Lee_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  SLD_700_Lee_TEACH_2H_Info()
{
	AI_Output (other, self,"SLD_700_Lee_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"SLD_700_Lee_TEACH_2H_Info_09_02"); //Dobrze, ale musisz by� cz�onkiem Nowego Obozu. 

	//if (log_Leefight == FALSE)
	//{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Lee mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko zostan� cz�onkiem Nowego Obozu.");
	//	log_Leefight = TRUE;
	//};
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
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
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,"Wr��",DIA_Lee_START_TRAIN_BACK);
	
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);
	

};

func void DIA_Lee_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,Dialog_Back,DIA_Lee_START_TRAIN_BACK);
	
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);

};



func void DIA_Lee_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(SLD_700_Lee_TEACH_2H_START);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,Dialog_Back,DIA_Lee_START_TRAIN_BACK);

	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Lee_START_TRAIN_2H_1);
	Info_AddChoice(SLD_700_Lee_TEACH_2H_START,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Lee_START_TRAIN_2H_5);


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
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_01"); //Dobrze, �e jeste�. Potrzeba nam kogo� do pomocy.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_02"); //W czym problem?
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_03"); //Ostatnio z wie�ciami przyby� pos�aniec z Obozu Bandyt�w. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_04"); //Pono� Gomez wys�a� grup� ludzi do Opuszczonej Kopalni. Quentin chce udaremni� jego plan wznowienia wydobycia. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_05"); //Jest jeden haczyk, kopalnia nie zosta�a opuszczona bez powodu. Roi si� w niej od przer�nego plugastwa. 
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_06"); //Mo�liwe, �e jak pozb�dziecie si� Stra�nik�w, to b�dzie was czeka�a walka z nieumar�ymi albo innym �cierwem.
    AI_Output (other, self ,"DIA_Lee_KOPALNIA_QUENTINA_15_07"); //Postaram si� prze�y�, jednak w pojedynk� nie b�dzie �atwo...
    AI_Output (self, other ,"DIA_Lee_KOPALNIA_QUENTINA_03_08"); //Wys�a�em ju� Najemnik�w, kt�rzy ci pomog�. Powiniene� ich spotka� przy wej�ciu do kopalni. Id� ju�! Nie ma czasu do stracenia...
	
	//zadanie - oficjalne zadanie [odwiedzenie kopalni] dla wszystkich gildii innych ni� bandyta 
    MIS_SupportForQuentin = LOG_RUNNING;
	Log_CreateTopic          (CH4_SupportForQuentin, LOG_MISSION);
    Log_SetTopicStatus       (CH4_SupportForQuentin, LOG_RUNNING);
    B_LogEntry               (CH4_SupportForQuentin,"Lee chce pom�c Quentinowi pozby� si� Stra�nik�w z Opuszczonej Kopalni. Gomez postanowi� wznowi� tam wydobycie. Przyw�dca Najemnik�w twierdzi, �e Stra�nicy nie s� najwi�kszym zagro�eniem jakie czyha pod ziemi�. C�, wkr�tce przekonam si� o tym na w�asnej sk�rze. Mam si� przegrupowa� z lud�mi przydzielonymi przez Lee przy wej�ciu do kopalni.");
	
	//rutyny: Cord [kluczowy npc], Jarvis, Rocky
	B_Story_AbMine_Soldiers ();
    
	Wld_SendTrigger("KOPALNIAEXIT");
	
	//koniec
    AI_StopProcessInfos	(self);
	
	//zadanie - wpis dla cz�onk�w bractwa
	if MIS_PsiAbadonedMine == log_running
	{
	B_LogEntry                     (CH4_PsiAbadonedMine,"Po rozmowie z Lee okaza�o si�, �e Nowy Ob�z chce pom�c Bandytom odbi� Opuszczon� Kopalni�. Mam si� tam uda� i odszuka� zaprzyja�nionych Najemnik�w. Lee przestrzeg� mnie, �e Kopalnia jest przekl�ta od lat. Szykuje si� nie lada wyzwanie. ");
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
   description	= "Pozby�em si� Stra�nik�w i o�ywie�c�w z kopalni.";
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
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_01"); //Pozby�em si� Stra�nik�w i o�ywie�c�w z kopalni.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_02"); //Czyli naprawd� byli tam o�ywie�cy. Masz szcz�cie, �e jeszcze �yjesz.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_03"); //Nie mniej jednak dobrze si� spisa�e�. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_04"); //Cord kaza� ci zaproponowa�, �eby�my wznowili wydobycie w kopalni. Z�o�a s� jeszcze dosy� spore. 
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_05"); //Z pewno�ci� spodoba si� to Magom Wody.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_06"); //Hmmm... Fakt. Kopalnia mo�e nam przynie�� znaczne korzy�ci. Jednak transport rudy do Obozu by�by nie lada wyzwaniem.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_07"); //Wsz�dzie kr�c� si� Stra�nicy.
    AI_Output (other, self ,"DIA_Lee_CZYSTKA_W_KOPALNI_15_08"); //Chyba jednak warto zaryzykowa�. 
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_09"); //Masz racj�, ale jest jeden problem. Do kopania rudy potrzebni s� robotnicy. Nie mam do�� ludzi, aby wys�a� ich do pracy.
    AI_Output (self, other ,"DIA_Lee_CZYSTKA_W_KOPALNI_03_10"); //Id� do Laresa i spytaj czy wys�a�by kilku Szkodnik�w do kopalni.
    B_LogEntry                     (CH4_NC_Mine,"Mam i�� do Laresa i poprosi� go o wys�anie kilku Szkodnik�w do pracy w kopalni. ");

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
   description	= "Lares nie ma wystarczaj�cej ilo�ci ludzi.";
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
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_01"); //Lares nie ma wystarczaj�cej ilo�ci ludzi.
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_02"); //Wiedzia�em! No to mamy niez�y problem. Je�eli nie wy�lemy kogo� do kopalni, to Gomez pewnie znowu j� zajmie.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_03"); //Lares kaza� ci prosi� o pomoc Bandyt�w. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_04"); //Racja. Mo�e oni wy�l� cz�� swoich ludzi do kopalni. 
    AI_Output (self, other ,"DIA_Lee_BRAK_LUDZI_03_05"); //Id� do Quentina i si� z nim dogadaj. Zaproponuj mu czwart� cz�� wydobytego urobku jako zap�at�.
    AI_Output (other, self ,"DIA_Lee_BRAK_LUDZI_15_06"); //Ju� tam id�.
    B_LogEntry                     (CH4_NC_Mine,"Trzeba dogada� si� z Quentinem. Mam zaproponowa� przyw�dcy Bandyt�w czwart� cz�� urobku z kopalni w zamian za pomoc. ");

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
   description	= "Dogada�em si� z Quentinem.";
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
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_01"); //Dogada�em si� z Quentinem.
    AI_Output (other, self ,"DIA_lee_PertractacjieDD_15_02"); //Nie by� zbyt zadowolony, ale si� zgodzi�.
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_03"); //�wietnie. 
    AI_Output (self, other ,"DIA_lee_PertractacjieDD_03_04"); //Oto twoja zap�ata.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_LogEntry                     (CH4_NC_Mine,"Nowy Ob�z dogada� si� z Quentinem. Mamy zapewnione nowe �r�d�o rudy ma�ym kosztem.");
    Log_SetTopicStatus       (CH4_NC_Mine, LOG_SUCCESS);
    MIS_NC_Mine = LOG_SUCCESS;
	if MIS_PsiAbadonedMine == log_running
	{
	Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
	B_LogEntry                     (CH4_PsiAbadonedMine,"Najemnicy zyskali dost�p do Opuszczonej Kopalni, a Gomez zosta� os�abiony. Tymczasowo uspokoi�em sytuacj�, ale wci�� musz� by� czujny. Wypada�oby w mi�dzyczasie zanie�� raport Cor Angarowi. Z pewno�ci� mnie jako� wynagrodzi.");
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
   description	= "Saturas zleci� mi odszukanie Xardasa. Co wiesz na jego temat?";
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
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_01"); //Saturas zleci� mi odszukanie Xardasa. Co wiesz na jego temat?
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_02"); //Jaki� czas temu wys�a�em oddzia� Najemnik�w na polecenie Saturasa, aby odszukali tego Nekromant�, niestety nigdy nie wr�cili. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_03"); //Postanowi�em wi�c wys�a� Torlofa wraz z ma�ym oddzia�em, �eby sprawdzi�, co ich spotka�o.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_04"); //Kilka dni p�niej, gdy Torlof wr�ci�, opowiedzia� mi o trzech golemach. Widzia� je tylko z daleka, cho� nietrudno si� domy�li� jaki los spotka� moich ludzi. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_05"); //Dost�pu do wie�y broni� kamienny golem, ognisty oraz lodowy. Nie radz� ci si� tam wybiera�, zrobi� z ciebie sieczk�.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_06"); //Skoro zdoby�em kamienie ogniskuj�ce zabijaj�c po drodze trolle, harpie i inne plugastwo, to z tymi magicznymi pos�gami poradz� sobie bez problemu.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_07"); //Mam nadzieje. Dam ci jeszcze jedn� rad�, uwa�aj na Xardasa. Jest niezwykle przebieg�y i pot�ny. 
	AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_08"); //Pami�tam jak spotka�em go na dworze Rhobara, gdy zosta� wyznaczony do przewodzenia magami, kt�rzy mieli stworzy� Barier�.
    AI_Output (self, other ,"DIA_Lee_XARDASGOLEMS_03_09"); //Wydawa� si� by� niezwykle wierny Innosowi. P�niej okaza�o si�, �e bardziej ci�gnie go do magii demon�w. Nigdy bym si� tego nie domy�li�.
    AI_Output (other, self ,"DIA_Lee_XARDASGOLEMS_15_10"); //Dzi�ki za rad�. 
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
   description	= "Spotka�em Xardasa.";
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
    AI_Output (other, self ,"DIA_Lee_DANGERORE_15_01"); //Spotka�em Xardasa. Powiedzia� mi, �e pomys� Mag�w Wody z kopcem rudy jest bezcelowy. Jednak jest inny spos�b na zniszczenie Bariery. Nie bardzo wiem, jak powiedzie� o tym Saturasowi.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_02"); //Lepiej mu o tym nie m�w. Saturas to bardzo wybuchowy cz�owiek. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_03"); //Ja sam dochowam tajemnicy, cho� jestem szczerze zdziwiony. Przez te wszystkie lata pod��a�em �lepo za Magami Wody g��boko wierz�c w ich plan.
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_04"); //Przez ca�y czas wierzy�em, �e ich pomys� odno�nie Bariery wypali.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_05"); //Da�em im s�owo, �e dop�ki Bariera istnieje, b�d� im s�u�y� i tak w�a�nie zamierzam uczyni�. 
	AI_Output (self, other ,"DIA_Lee_DANGERORE_03_06"); //S�u�ba jako genera� Kr�la Rhobara nauczy�a mnie honoru. Sta�e� si� niezwykle pot�ny, nie ka�dy cz�owiek zdo�a�by przedrze� si� do Xardasa i zrobi� na nim wra�enie, tak jak tobie si� uda�o.
    AI_Output (self, other ,"DIA_Lee_DANGERORE_03_07"); //Powodzenia, przyjacielu! Mam nadziej�, �e ju� wkr�tce si� zobaczymy.
};

//#####################################################################################
//####### ROZDZIA� 5
//####### ZAST�PSTWO DLA GORNA
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
   description	= "Przysy�a mnie Gorn. Mam ci pom�c w organizacji obrony.";
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
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_01"); //Przysy�a mnie Gorn. Mam ci pom�c w organizacji obrony.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_02"); //Ach tak! Dobrze, �e przyszed�e�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_03"); //Ju� ustali�em kt�rzy z moich ludzi zajm� si� kopalni�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_04"); //Niestety, zagro�enie ze strony Gomeza jeszcze nie min�o i nie mia�em kogo wys�a� do wybranych Najemnik�w.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_05"); //Ja mog� im to przekaza�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_06"); //W porz�dku. Id� zatem do Corda i Outlama. 
    AI_Output (self, other ,"DIA_Lee_OBRONA_WK_03_07"); //Przeka� im, �e kopalnie powierzam prowizorycznej stra�y i my�liwym-najemnikom.
    AI_Output (other, self ,"DIA_Lee_OBRONA_WK_15_08"); //Nie ma sprawy.
    B_LogEntry                     (CH5_ObronaWk,"Lee wyznaczy� do obrony kopalni ludzi Corda i Outlama. Mam im to przekaza�.");

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
   description	= "Zorganizowa�em obron�.";
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
    AI_Output (other, self ,"DIA_Lee_OBRONA_ENDQUEST_15_01"); //Zorganizowa�em obron�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_02"); //Dobra robota! Teraz Stra�nicy mog� nam naskoczy�.
    AI_Output (self, other ,"DIA_Lee_OBRONA_ENDQUEST_03_03"); //Przeka� Gornowi, �e jest wolny.
    B_LogEntry                     (CH5_ObronaWK,"Najemnicy zajm� si� Woln� Kopalni�, a Gorn mo�e w ko�cu uda� si� na spotkanie.");
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
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_01"); //Mam dla ciebie wa�ne zadanie.
    AI_Output (other, self ,"DIA_Lee_OBOZ_03_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_03"); //Nieopodal chaty my�liwego Cavalorna znajduje si� w�w�z. Z tego miejsca s� urz�dzane zdradzieckie napady na naszych ludzi.
    AI_Output (self, other ,"DIA_Lee_OBOZ_15_04"); //Teraz w czasach zam�tu uaktywni� si� tam oddzia� Stra�nik�w, kt�ry wcze�niej by� tam na posterunku.
	AI_Output (self, other ,"DIA_Lee_OBOZ_15_05"); //Na jego czele stoi niejaki Morok.
	AI_Output (other, self ,"DIA_Lee_OBOZ_03_06"); //Co mia�bym zrobi�?
	AI_Output (self, other ,"DIA_Lee_OBOZ_15_07"); //Zabra� ze sob� Torlofa i Corda. A potem uda� si� tam i wypleni� to robactwo. A tak�e je�li to mo�liwe odzyska� cz�� zrabowanych nam rzeczy.
	Log_CreateTopic          (Obozowisko, LOG_MISSION);
    Log_SetTopicStatus       (Obozowisko, LOG_RUNNING);
    B_LogEntry                     (Obozowisko,"Lee ma dla mnie wa�ne zadanie. Chodzi o ob�z stra�nik�w, na kt�rego czele stoi niejaki Morok. Napadaj� oni na ludzi z Nowego Obozu, grabi� i morduj�. Lee chce by zniszczy� to gniazdo szerszeni. Poleci� mi porozmawia� z Torlofem i Cordem, kt�rzy maj� pom�c mi w tej misji.");
	
	
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
    AI_Output (self, other ,"DIA_Lee_OBOZ1_15_02");  //S�usznie. Zajmij si� tym.
    AI_Output (other, self ,"DIA_Lee_OBOZ1_03_03");  //W porz�dku.
    AI_Output (self, other ,"DIA_Lee_OBOZ1_15_04");  //Jeszcze jedno. We� t� map� z zaznaczonym miejscem gdzie znajduje si� obozowisko tych �wi�. 
	CreateInvItem (self, ItWr_OM_T);
	B_GiveInvItems (self,other, ItWr_OM_T, 1);
	AI_Output (other, self ,"DIA_Lee_OBOZ1_03_05");  //Rozumiem, dzi�ki.
	
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
   description = "Morok i jego ludzie nie �yj�...";
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
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_01"); //Morok i jego ludzie nie �yj�. Odzyskali�my to co ukradli swoim ofiar�.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_02"); //Dobra robota. Nie wskrzesimy tych, kt�rych wymordowali ale przynajmniej zrobili�my wszystko to co da�o si� zrobi�.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_03"); //Gdzie zrabowane towary?
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_04"); //Tutaj.
	B_GiveInvItems (other,self,ItMi_StolenGoodsSLD,3);
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_05"); //Dzi�kuje. Rozdam to moim ludziom jako premi�. Poprawi to ich morale w dzisiejszych ci�kich i krwawych czasach.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_06"); //A oto twoja nagroda. 
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_07"); //W pe�ni zas�u�y�e� na t� rud�.
	CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self,other,ItMiNugget,500);
    AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_08"); //Dzi�kuje.
    AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_09"); //Dzi�ki za wykonanie tej misji. By�a bardzo istotna dla naszej sprawy.	
	Npc_SetTrueGuild	(GRD_7895_Patter, GIL_GRD);
	GRD_7895_Patter.guild = GIL_GRD;
	AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_10"); //W porz�dku. Zrobili�my to co musieli�my zrobi�.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_11"); //Gdyby�my mieli wi�cej takich ludzi jak ty to losy tej wojny by�yby dla nas korzystniejsze.
	AI_Output (other, self ,"DIA_Lee_OBOZ1S_15_12"); //Wygramy j�.
	AI_Output (self, other ,"DIA_Lee_OBOZ1S_03_13"); //Mam tak� nadzieje. 
    B_LogEntry               (Obozowisko,"Zda�em raport Lee. Wykonali�my powierzone nam przez niego zadanie. Zdecydowa� si� rozdysponowa� odzyskane towary pomi�dzy swoich ludzi. Ja otrzyma�em wynagrodzenie w rudzie. Sprawa obozu Moroka zosta�a zamkni�ta raz na zawsze.");
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
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_01"); //Widz�, �e nasi sp�nieni go�cie wreszcie przybyli.
    AI_Output (other, self ,"DIA_Lee_TMQ_GRDS_15_02"); //Sp�nili�my si� bo stra� uj�a Quentina. Na szcz�cie uda�o si� nam go odbi�.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_03"); //Co? Zatem byli tak blisko sukcesu?
    AI_Output (other, self ,"DIA_Lee_TMQ_GRDS_15_04"); //Grunt, �e uda�o si� ich powstrzyma�.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_05"); //Dobrze... Zatem rozpoczynajmy narad�.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_06"); //Ostatnio odnie�li�my wiele sukces�w w walce ze Stra��.
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_07"); //Wygrali�my szereg potyczek. A si�y Gomeza si� wykruszaj�. 
    AI_Output (self, other ,"DIA_Lee_TMQ_GRDS_03_08"); //Jednak jest co� niepokoj�cego.

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
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_02"); //Otrzyma�em raporty m�wi�ce, �e moi ludzie natkn�li si� na zombie w pancerzach stra�y.
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_03"); //Te istoty zasia�y pop�och w naszych szeregach.
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_04"); //Co zamierzasz?
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_05"); //Na pocz�tek powiniene� pom�wi� z jednym z moich ludzi Florianem. Prze�y� on starcie z nieumar�ymi Gomeza.
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_06"); //Gdzie go spotkam?
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_07"); //W karczmie...
    AI_Output (self, other ,"DIA_Lee_TMQ_UNDEAD_03_08"); //Pogadaj z tym Najemnikiem a potem wr�� i zdaj nam relacj�.
	//Wld_InsertNpc				(SLD_40070_Florian,"OC1");
    AI_Output (other, self ,"DIA_Lee_TMQ_UNDEAD_15_09"); //Jasne.
		B_LogEntry               (TajnaMisjaQuentina,"Dotarli�my na narad�. Lee powiedzia�, �e dzieje si� co� niepokoj�cego. Ostatnio jego ludzie natkn�li si� na zombie, kt�re oddanie walczy�y po stronie Gomeza. Mam pom�wi� z niejakim Florianem, kt�ry by� naocznym �wiadkiem tych wydarze�. Spotkam go w karczmie Mazina.");
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
   description	= "Florian opowiedzia� mi o wszystkim.";
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
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_01"); //Florian opowiedzia� mi o wszystkim. To jaki� m�ody Mag na us�ugach Gomeza przywo�uje zombie, kt�re przera�aj� twoich ludzi. 
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_02"); //Tylko sk�d ten Mag? Przecie� oni zostali zabici.
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_03"); //Sam chcia�bym to wiedzie�.
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_04"); //Powiniene� dosta� si� do Starego Obozu i zabi� tego Maga nim narobi wi�kszych szk�d. 
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_05"); //Przygotuje si� do tego i zrobi� to. Nie ma innej mo�liwo�ci.
    AI_Output (self, other ,"DIA_Lee_TMQ_FLORIAN_03_06"); //Zatem niech ci si� powiedzie bo inaczej los tej wojny mo�e si� odmieni� na nasz� niekorzy��.
    AI_Output (other, self ,"DIA_Lee_TMQ_FLORIAN_15_07"); //Bez obaw. Poradz� sobie.
	B_LogEntry               (TajnaMisjaQuentina,"Lee poleci� mi bym teleportowa� si� do Starego Obozu i zabi� tajemniczego Maga, kt�ry wspiera Gomeza. To nie b�dzie �atwe.");
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
   description	= "Ten mag od nekromancji si� Gomeza ju� nie �yje.";
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
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_01"); //Ten mag od nekromancji si� Gomeza ju� nie �yje.
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_02"); //A wi�c uda�o ci si�!
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_03"); //Zatem uk�ony w twoj� stron�. To by�o bardzo wa�ne co zrobi�e�. 
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_04"); //Teraz si�y Gomeza wreszcie nam ulegn�!
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_05"); //Wy�wiadczy�e� nam wszystkim wielk� przys�ug�. Przyjmij to w nagrod�.
	B_GiveInvItems (self,other, ItFo_PotionTime_Strength_01, 3);
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_06"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Lee_TMQ_KILLJIM_03_07"); //Do zobaczenia przyjacielu i donie� o sukcesie Quentinowi.
    AI_Output (other, self ,"DIA_Lee_TMQ_KILLJIM_15_08"); //Tak zrobi�.
	B_LogEntry               (TajnaMisjaQuentina,"Lee by� ze mnie bardzo zadowolony. Wszak si�y Gomeza zosta�y teraz znacz�co os�abione poprzez moj� ma�� dywersj�.");
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
   description	= "Chyba wiem co� co ci� zainteresuje.";
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
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_01"); //Chyba wiem co� co ci� zainteresuje.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_03"); //O zab�jstwo kr�lewskiej �ony. Jeden z jej prawdziwych morderc�w jest pod Barier�.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_04"); //CO!? Gdzie on teraz jest? I co to za sukinsyn!
    AI_Output (other, self ,"DIA_Lee_Othnielia_15_05"); //To Norton. Stra�nik ze Starego Obozu.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_06"); //Gdybym tylko go dorwa�... Teraz b�dzie o to ci�ko gdy Stary Ob�z jest dobrze strze�ony i zamkni�ty.
    AI_Output (self, other ,"DIA_Lee_Othnielia_03_07"); //Musz� go zabi� i dowiedzie� si� kto by� zleceniodawc� tej zbrodni. 
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
   description	= "Mog� rozprawi� si� z Nortonem.";
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
    AI_Output (other, self ,"DIA_Lee_Norton_15_01"); //Mog� rozprawi� si� z Nortonem.
    AI_Output (self, other ,"DIA_Lee_Norton_03_02"); //Gdyby� by� na tyle odwa�ny i znalaz� si� w Starym Obozie to rozpraw si� z nim.
    AI_Output (self, other ,"DIA_Lee_Norton_03_03"); //Nie zabijaj go do momentu a� powie co� wa�nego. Jak ju� si� czegos dowiesz to wiesz co robi�.
    AI_Output (other, self ,"DIA_Lee_Norton_15_04"); //Jasne.
    AI_Output (self, other ,"DIA_Lee_Norton_03_05"); //Dla mnie to sprawa honoru a nawet co� wi�cej...
	B_LogEntry               (ZaDlugiJezor,"Lee poleci� mi za�atwi� Nortona a wcze�niej go przes�ucha� by dowiedzie� si� kto by� zleceniodawc� morderstwa kr�lewskiej �ony.");
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
   description	= "Norton nie �yje.";
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
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_01"); //Norton nie �yje.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_02"); //Znakomicie. Dra� dosta� to na co zas�u�y�.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_03"); //Kim by� jego zleceniodawca przy zab�jstwie Othnielii?
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_04"); //Tego ju� si� nie dowiemy. Przynajmniej nie pod Barier�. Norton umar� w momencie gdy mia� mi to ujawni�.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_05"); //Cholera, jak zwykle. Liczy�em, �e jest cie� szansy, �e dowiem si� kto by� tym sukinsynem, kt�ry zaplanowa� to wszystko.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_06"); //I sprawi�, �e moje dotychczasowe �ycie leg�o w gruzach.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_07"); //Dobrze. I tak wy�wiadczy�e� mi wielk� przys�ug�. 
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_08"); //We� to, Zas�u�y�e�.
	B_GiveInvItems (self,other, itminugget, 400);
	B_GiveInvItems (self,other, Schutzring_Waffen2, 1);
    AI_Output (other, self ,"DIA_Lee_NortonIsDead_15_09"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_10"); //Czas zemsty nadejdzie. Gdy tylko to wszystko tutaj si� sko�czy.
    AI_Output (self, other ,"DIA_Lee_NortonIsDead_03_11"); //Do zobaczenia, przyjacielu.
	B_LogEntry               (ZaDlugiJezor,"Powiedzia�em Lee o �mierci Nortona a tak�e o tym co zd��y� mi powiedzie�. Niestety nie dowiedzieli�my si� kto by� jego zleceniodawc�. Tak czy owak Lee wyp�aci� mi nagrod� za zabicie jednego z morderc�w kr�lewskiej �ony. Zarzeka si�, �e gdy Bariera upadnie to krwawo rozliczy si� ze swoimi pod�ymi prze�ladowcami.");
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
    AI_Output (self, other ,"DIA_Lee_ZM_Hunter_03_01"); //Przyby� my�liwy Jonas. Z tego co ju� wiem chodzi o Stra�nik�w Gomeza.
    AI_Output (other, self ,"DIA_Lee_ZM_Hunter_15_02"); //Mo�na si� by�o domy�le�.
    AI_Output (self, other ,"DIA_Lee_ZM_Hunter_03_03"); //Jestem ciekaw co nam powie ten my�liwy.
    AI_Output (other, self ,"DIA_Lee_ZM_Hunter_15_04"); //Przekonajmy si�.
	B_LogEntry               (ZagrozeniMysliwi,"Lee poleci� mi przes�ucha� my�liwego Jonasa, kt�ry przyby� w pewnej wa�nej sprawie.");
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
   description	= "Sam s�ysza�e�.";
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
    AI_Output (other, self ,"DIA_Lee_ZM_YouHear_15_01"); //Sam s�ysza�e�.
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_02"); //W takim uk�adzie. Musimy ich wesprze�. 
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_03"); //Zbierz Pascala, Torlofa i Wilka.
    AI_Output (self, other ,"DIA_Lee_ZM_YouHear_03_04"); //Potem pogadaj z Jonasem. Nich poprowadzi was do ich obozowiska.
    AI_Output (other, self ,"DIA_Lee_ZM_YouHear_15_05"); //Zrozumiano.
	Npc_ExchangeRoutine(NON_5611_Jonas,"NC2");

	B_LogEntry     (ZagrozeniMysliwi,"Lee poleci� mi zebra� Pascal, Torlofa i Wilka a nast�pnie wraz z Jonasem uda� si� do obozu my�liwych by obroni� ich przed Stra�nikami.");
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
   description	= "My�liwi s� ju� bezpieczni. Ich obozowi nic ju� nie zagra�a.";
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
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_01"); //My�liwi s� ju� bezpieczni. Ich obozowi nic ju� nie zagra�a.
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_02"); //Dobrze. Rozumiem �e pokazali�cie tym durniom gdzie ich miejsce.
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_04"); //Z racji, �e by�e� g��wnodowodz�cym w tej misji nale�y ci si� jeszcze nagroda ode mnie.
	B_GiveInvItems (self,other,ItMw_2H_AxeHevay_100 , 1);
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_05"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Lee_ZM_END_03_06"); //B�d� w pogotowiu bo czuje, �e b�dzie wi�cej k�opot�w.
    AI_Output (other, self ,"DIA_Lee_ZM_END_15_07"); //Miejmy nadziej� �e nie...
	B_LogEntry          (ZagrozeniMysliwi,"Lee by� zadowolony z rezultat�w naszej misji. Wyp�aci� mi nagrod� jako g��wnodowodz�cemu grup� Najemnik�w, kt�ra ocali�a My�liwych.");
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
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_01"); //Nie... To ja powinienem by� zgin��....
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_02"); //Bogowie.... Co tu si� sta�o?!
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_03"); //Byli przebrani za Szkodnik�w. Ale to byli zamachowcy....
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_04"); //Orik mnie zas�oni� i.... Przekl�te dranie!
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_05"); //Gdzie pozostali dwaj?
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_06"); //My�leli , �e mnie dostan� lecz gdy Orik zas�oni� mnie w�asn� piersi� i sam przyj�� cios....
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_07"); //Zdo�a�em ci�� toporem jednego z nich. Pozostali dwaj przestraszyli si� i uciekli.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_08"); //A twoi wartownicy?
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_09"); //My�leli , �e to zwyli Szkodnicy. Dali si� zaskoczy� a tamci zwiali.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_10"); //Mo�e uda si� ich dopa��.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_11"); //Je�li mo�esz wype�ni moj� pro�b�. Pom�cij Orika zabijaj�c tych dw�ch sukinsyn�w.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_12"); //Najpierw musz� ustali� gdzie s�.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_13"); //Zatem po�piesz si�. Liczy si� ka�da minuta by wymierzy� im sprawiedliwo��.
    AI_Output (other, self ,"DIA_Lee_I_Dead_PZ_15_14"); //Ruszam.
    AI_Output (self, other ,"DIA_Lee_I_Dead_PZ_03_15"); //Powodzena.
	B_LogEntry          (PodejrzaneZamieszanie,"Kto� pr�bowa� skrytob�jczo zabi� Lee. Zgin�� jednak Orik broni�c swego prze�o�onego. Zamachowcy uciekli a ja musz� pod��y� ich tropem. Wcze�niej pom�wi� z Torlofem jak chcia�.");
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
   description	= "Wszyscy zamachowcy nie �yj�.";
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
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_01"); //Wszyscy zamachowcy nie �yj�.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_02"); //Pom�ci�e� Orika ale to ju� nie cofnie czasu. Tym niemniej dzi�kuje ci za to, �e nie odpu�ci�e� i ukara�e� tych szubrawc�w. Cho� prawdziwym winowajc� jest ten kto zleci� t� zbrodnie.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_03"); //To robota Magnat�w. Oto pismo, kt�re znalaz�em u zamachowca.
	B_GiveInvItems (other,self, ItWr_PZ_Message, 1);
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_04"); //Tak my�la�em. A to sukinsyny! To w�a�nie ich mordercze metody. Nie cofn� si� przed niczym by zrealizowa� sw�j cel. Orik zap�aci� za to najwy�sz� cen�. Wiernie mi s�u�y� i co go spotka�o...
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_05"); //Straci�e� doradc� i przyjaciela ale nie mo�esz si� podda�. Dni Gomeza i jego najbli�szych towarzyszy s� ju� policzone.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_06"); //Ca�y czas w to wierz�. Oby zaznali kary za wszystkie swoje pod�o�ci. �winie musz� zdechn�� w rynszotku jak im przysta�o. A ty we� w to w nagrod�. Zas�u�y�e� za okazan� pomoc, jedno z lepszych ostrzy z mojej kolekcji.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_07"); //Dzi�kuje cho� wola�bym to dosta� w znacznie lepszych okoliczno�ciach.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_08"); //Pora si� otrz�sn��. Pochowa� Orika z honorami pod t� cholern� barier� i my�le� co dalej.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_09"); //Mo�esz na mnie liczy�. I na swoich ludzi chocia�by Gorna i Torlofa. 
	B_GiveInvItems (self,other, ItMw_Soul_Destroyer, 1);
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_10"); //I ta my�l dodaje mi wiecej si�. Kim by�by genera� bez swoich �o�nierzy... Ruszaj. Z pewno�ci� masz wi�cej do roboty.
    AI_Output (other, self ,"DIA_Lee_PZ_ALL_DEAD_15_11"); //Dobrze. Daj zna� gdy b�d� potrzebny.
    AI_Output (self, other ,"DIA_Lee_PZ_ALL_DEAD_03_12"); //Dzi�kuje.
	Log_SetTopicStatus	(PodejrzaneZamieszanie,	LOG_SUCCESS);
	B_LogEntry          (PodejrzaneZamieszanie,"Powiedzia�em Lee o �mierci zamachowc�w i wyjawi�em kto by� ich zleceniodawc� czego przyw�dca Najemnik�w si� domy�la�. Jest smutny i roz�alony ale wiem, �e b�dzie walczy� dalej, mo�e nawet z wi�ksz� determinacj�. Lee wynagrodzi� mnie za pomoc a ja obieca�em, �e b�dzie m�g� liczy� na mnie i na swoich podkomendnych w dalszych walkach z Gomezem i jego zgraj�.");
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
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_02"); //W Kolonii one s� codziennie. Jaki tym razem?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_03"); //Powa�ny. Jaka� zb�jecka szajka chce okra�� waszego in�yniera z cennych dokument�w. Chcieliby pozyska� plany fortyfikacji Nowego Obozu i sprzeda� je Gomezowi.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_04"); //Hmmm pod�y i chytry plan. Masz jakie� dowody, �e ta banda �ajdak�w chce nas bezczelnie okras�?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_05"); //Rzu� okiem na to pismo.
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_06"); //Kto by� jego adresatem?
    AI_Output (other, self ,"DIA_Lee_PZ_Problem_15_07"); //Zbieracz Foster. Potajemnie nale�a� do tej szajki ale postanowi� zerwa� wsp�prac�. Gro�� mu �mierci�.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_08"); //Zatem wpakowa� si� w niez�e bagno. Kontakty z szemranymi typam zawsze si� �le ko�cz�. I tym razem te� nie ma wyjatku. Troch� mi go �al ale sam jest sobie winien.
    AI_Output (self, other ,"DIA_Lee_PZ_Problem_03_09"); //Przydziel� ochrone Homerowi. Musi dok�adnie pilniowa� cennych pism. A moi dwaj ludzie b�d� w jego pobli�u. Id� i powiedz mu o tym. Potem pogadaj z Fosterem mo�e jeszcze si� czego� dowiesz.
	B_LogEntry           (PoszkodowaniZbieracze,"Rozmawia�em z Lee i powiedzia�em mu co i jak. Lider Najemnik�w przydzieli� ochron� Homerowi. Pogadam z in�ynierem.");
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
   description	= "Problem z�odziejskiej szajki zosta� rozwi�zany.";
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
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_01"); //Problem z�odziejskiej szajki zosta� rozwi�zany.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_02"); //W jaki spos�b?
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_03"); //Prosty ale skuteczny. Wszyscy nie �yj�.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_04"); //Pokona�e� ich? Je�li tak to post�pi�e� twardo i zdecydowanie. Masz moje uznanie.
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_05"); //Szkoda, �e nie przypilnowa�em te� Fostera. Dawni kumple go zabili.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_06"); //C� czeka�aby go bardzo surowa kara. Tak dosta� jej najwy�szy wymiar...
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_07"); //Ale najwa�niejsze, �e ty nam pomog�e�. We� to w nagrod�.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_08"); //Miej oczy szeroko otwarte i doskonal si� a daleko zajdziesz. Masz potencja�.
    AI_Output (other, self ,"DIA_Lee_PZ_ENDED_15_09"); //Dzi�kuje. Na razie.
    AI_Output (self, other ,"DIA_Lee_PZ_ENDED_03_10"); //Do nast�pnego spotkania.
	B_GiveInvItems (self,other, Schutzamulett_Geschosse, 1);
	B_LogEntry           (PoszkodowaniZbieracze,"Powiedzia�em Lee o �mierci rozb�jnik�w. Usatysfakcjonowany da� mi rud� i przyzna�, �e mam potencja�. Mi�e s�owa.");
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