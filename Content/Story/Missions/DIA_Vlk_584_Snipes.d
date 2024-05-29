//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Do zobaczenia nast�pnym razem!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Jasne!
	
	AI_StopProcessInfos	( self );
};

// **************** Edycja Rozszerzona - nauka ************************
//========================================
//-----------------> ABOUT_TEACH
//========================================

INSTANCE DIA_Snipes_ABOUT_TEACH (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_ABOUT_TEACH_Condition;
   information  = DIA_Snipes_ABOUT_TEACH_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Snipes_ABOUT_TEACH_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Snipes_ABOUT_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Snipes_ABOUT_TEACH_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_02"); //Ha! Dawno nikt mnie o to nie pyta�!
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_03"); //Mog� nauczy� ci� jak opr�nia� sakiewki i skrzynie.
	//notatka
	Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
	B_LogEntry			(GE_TeacherOM,"Snipes mo�e mnie nauczy� okradania, skradania oraz otwierania zamk�w.");
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Snipes_Lehrer (C_INFO)
{
	npc				= VLK_584_Snipes;
	nr				= 2;
	condition		= DIA_Snipes_Lehrer_Condition;
	information		= DIA_Snipes_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo�esz mnie nauczy�?"; 
};

FUNC INT DIA_Snipes_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Snipes_ABOUT_TEACH))
	{
		return 1;	
	};
};

FUNC VOID DIA_Snipes_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_15_00"); //Chcia�bym nauczy� si� sztuki z�odziejskiej?
	AI_Output (self, other,"DIA_Snipes_Lehrer_05_01"); //A czego dok�adnie chcesz wiedzie�si� nauczy�?
	

	Info_ClearChoices	(DIA_Snipes_Lehrer );
	Info_AddChoice		(DIA_Snipes_Lehrer,DIALOG_BACK																,DIA_Snipes_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Snipes_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Snipes_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Snipes_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Snipes_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Snipes_Lehrer_Schleichen);
	};
};


func void DIA_Snipes_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if  (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_03"); //B�d� cierpliwy, a nie b�dziesz potrzebowa� zbyt wiel wytrych�w.
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_02"); //To charakterystyczne trzeszczenie pr꿹cego si� wytrychu. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a liczba potzrebnych ci wytrych�w b�dzie male�.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Snipes_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Snipes_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowscy z�odzieje mog� zosta� przy�apani.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Snipes_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Snipes_Lehrer );
};
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
if  (kapitel < 4)
{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Jak leci?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mam dla ciebie pewn� propozycj�.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Spraw, �eby Aaron odczepi� si� od tej skrzyni, a zap�ac� ci 10 bry�ek rudy.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Kopacz Snipes zaoferowa� mi 10 bry�ek rudy w zamian za odci�gni�cie Aarona od jego skrzyni.");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nale�y mi si� 10 bry�ek rudy!"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS) && (kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Nale�y mi si� 10 bry�ek rudy!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Prosz�, zas�u�y�e� na nie.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach, i jeszcze co�: mam przy sobie klucz do tej skrzyni. Jak dla ciebie - 30 bry�ek.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Za kolejne 30 bry�ek Snipes zaoferowa� mi klucz do skrzyni Aarona."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(kup klucz)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02)) && (kapitel < 4)
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Wezm� ten klucz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Trafi�a ci si� nie lada okazja.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zastanawiam si� co TY z tego masz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Zawsze si� ciesz�, kiedy mog� da� prztyczka w nos kt�remu� ze Stra�nik�w. Zreszt�, gdyby znale�li przy mnie rzeczy z tej skrzyni, by�bym martwy.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Kupi�em od Snipesa klucz od skrzyni! Ciekawe, co zrobi Aaron, gdy mu o tym powiem?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ma by� 30 bry�ek! Daj mi rud�, to dostaniesz klucz.
	};
};  

//========================================
//-----------------> POGADUCHY_K4
//========================================

INSTANCE DIA_Snipes_POGADUCHY_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_POGADUCHY_K4_Condition;
   information  = DIA_Snipes_POGADUCHY_K4_Info;
   permanent	= FALSE;
   description	= "Widz�, �e i tym razem uda�o ci si� wykiwa� Stra�nik�w!";
};

FUNC INT DIA_Snipes_POGADUCHY_K4_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_POGADUCHY_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_POGADUCHY_K4_15_01"); //Widz�, �e i tym razem uda�o ci si� wykiwa� Stra�nik�w!
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_02"); //Hehe... Masz racj�. Cho� tym razem my�la�em, �e nam si� nie uda.
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_03"); //Uciekli�my dos�ownie w ostatniej chwili. Jak chcesz poznac szczeg�y, to pogadaj z W�em.
};

//========================================
//-----------------> HOW_YOU_ARE_K4
//========================================

INSTANCE DIA_Snipes_HOW_YOU_ARE_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_HOW_YOU_ARE_K4_Condition;
   information  = DIA_Snipes_HOW_YOU_ARE_K4_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Snipes_HOW_YOU_ARE_K4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_POGADUCHY_K4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_HOW_YOU_ARE_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_02"); //Nie�le. Nikt si� tu nie kr�ci poza kilkoma �cierwojadami, ale nimi si� akurat nie martwi�. Jest na co polowa�.
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_03"); //Poza tym jeste�my tu bezpieczni. Stra�nicy Gomeza raczej tu nie zagl�daj�, mimo i� kr�c� si� w pobli�u bram. 
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_04"); //Gadali�cie z nimi?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_05"); //Nie, na razie nas nie wykryli i lepiej �eby tak zosta�o.
};


//=====================================================================================================================================================================================


//========================================
//-----------------> OBITE PYSKI
//========================================

INSTANCE DIA_Snipes_OBITE_PYSKI (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_OBITE_PYSKI_Condition;
   information  = DIA_Snipes_OBITE_PYSKI_Info;
   permanent	= FALSE;
   description	= "Chcia�bym si� czego� dowiedzie�.";
};

FUNC INT DIA_Snipes_OBITE_PYSKI_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_OBITE_PYSKI1))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_OBITE_PYSKI_Info()
{
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_01"); //Chcia�bym si� czego� dowiedzie�.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_02"); //Tego czy dobrze si� czuje? Tak, stary czuje si� �wietnie zw�aszcza je�li masz dla mnie troch� rudy hehe...
	AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_03"); //Kto� tu mnie nauczy�, �e: "Nie ma nic za darmo!" Dam ci par� bry�ek je�li powiesz mi co� wa�nego.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_04"); //A co chcesz wiedzie�? 
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_05"); //Sk�d bior� si� tajemnicze obra�enia u cz�ci Kopaczy?
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_06"); //Znam kogo� kto powinien umie� ci to wyja�ni�.
	AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_07"); //Kto to jest?
	AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_08"); //�eby udzieli� tej informacji potrzebuje sakiewki ze 100 bry�kami rudy w r�ku, m�ody.
				    B_LogEntry               (ObitePyski,"Snipes chc� za fatyg� 100 bry�ek rudy. Chyba b�d� je musia� mu zap�aci�, je�li chce dowiedzie� si� wi�cej.");

};

//======================

INSTANCE DIA_Snipes_OBITE_PYSKI_RUDA (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_OBITE_PYSKI_RUDA_Condition;
   information  = DIA_Snipes_OBITE_PYSKI_RUDA_Info;
   permanent	= FALSE;
   description	= "Oto 100 bry�ek rudy.";
};

FUNC INT DIA_Snipes_OBITE_PYSKI_RUDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_OBITE_PYSKI))
	&& ( Npc_HasItems (hero, ItMinugget) >= 100 ) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_OBITE_PYSKI_RUDA_Info()
{
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_RUDA_15_01"); //Oto 100 bry�ek rudy.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_RUDA_03_02"); //O! I teraz si� wszystko si� zgadza. Zatem pogadaj z Eltonem, to m�ody Kopacz z rozkwaszonym nosem, hehe.
		B_GiveInvItems 	(hero, self, ItMiNugget,100);
  B_LogEntry               (ObitePyski,"Snipes twierdzi, �e m�ody Kopacz Elton mo�e co� wiedzie� na temat ostatnich uraz�w i kontuzji w�r�d Kopaczy. Pono� sam jest poszkodowany. Pom�wi� z nim.");
		
};



//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Snipes_Grom_Info (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Grom_Info_Condition;
   information  = DIA_Snipes_Grom_Info_Info;
   permanent	= FALSE;
   description	= "Wiesz co� na temat surowca zwanego srebrnym gromem?";
};

FUNC INT DIA_Snipes_Grom_Info_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_BOBA_SWORD_NUGGET))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_Grom_Info_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_01"); //Wiesz co� na temat surowca zwanego srebrnym gromem?
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_02"); //Opr�cz tego, �e jest rzadki jak g�wno Gomeza?
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_03"); //C� za poetyckie por�wnanie.
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_04"); //Mo�e wiem. Mo�e nie wiem. To zale�y ile za to dostan�. Proste.
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_05"); //Mo�e 30 bry�ek rudy?
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_06"); //Co najmniej 50.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_07"); //Mo�e jednak 40?
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_08"); //To ja powiem 51.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_09"); //W ostateczno�ci mo�e by� 50.
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_10"); //No i nie mo�na by�o tak od razu..?
				   
 B_LogEntry               (MieczGorBoby,"Rozmawia�em ze Snipsem. Sprzeda mi informacj� na temat posiadaczy ,,srebrnego gromu� w zamian za 50 bry�ek rudy.");
};



//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Snipes_Grom_Info_Ore (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Grom_Info_Ore_Condition;
   information  = DIA_Snipes_Grom_Info_Ore_Info;
   permanent	= FALSE;
   description	= "Prosz�.";
};

FUNC INT DIA_Snipes_Grom_Info_Ore_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_Grom_Info)) && (Npc_HasItems (other, ItMiNugget) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_Grom_Info_Ore_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_01"); //Prosz�.
	B_GiveInvItems (other,self, itminugget, 50);
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_02"); //Dzi�ki. Wiem o dw�ch ludziach, kt�rzy mielibyli w posiadaniu tego surowca. Jeden to Grimes.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_03"); //Ju� z nim rozmawia�em.
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_04"); //A drugi to Glen.
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_05"); //O! A to przydatna informacja...
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_06"); //No widzisz, interesy ze mn� to przyjemno�� dla obu stron.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_07"); //Dobra. Dzi�ki za informacje.
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_08"); //Na razie, przyjacielu.
	
				     B_LogEntry               (MieczGorBoby,"Snipes powiedzia�, �e Glen by� w posiadaniu ,,srebrnego gromu�, musz� si� zatem do niego uda�.");

};



//========================================
//-----------------> Oprawca
//========================================

INSTANCE DIA_Snipes_Oprawca (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_Oprawca_Condition;
   information  = DIA_Snipes_Oprawca_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie robot�.";
};

FUNC INT DIA_Snipes_Oprawca_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Huno_Oprawca))
&& !(Npc_KnowsInfo(hero,DIA_Asghan_Oprawca))
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_01"); //Mam dla ciebie robot�.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_02"); //Je�li nie jest p�atna to daruj sobie.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_03"); //Dam ci 50 bry�ek rudy. Musisz okra�� stra�nika Winstona.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_04"); //Potrzebny mi jego osobisty dziennik.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_05"); //Facet lubi sobie goln��. Skroi� go to jak oszuka� dzieciaka - �atwizna.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_06"); //Ale najpierw ruda, nie dam si� wyrolowa�.
     B_LogEntry               (Oprawca,"Rozmawia�em ze Snipesem. Zaproponowa�em mu 50 bry�ek rudy za okradzenie Winstona. Przysta� na moj� propozycj�.");
};

//========================================
//-----------------> Oprawca_Ruda
//========================================

INSTANCE DIA_Snipes_Oprawca_Ruda (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Oprawca_Ruda_Condition;
   information  = DIA_Snipes_Oprawca_Ruda_Info;
   permanent	= FALSE;
   description	= "Masz.";
};

FUNC INT DIA_Snipes_Oprawca_Ruda_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Snipes_Oprawca))
&& (Npc_HasItems (other, itminugget) >=50)
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Ruda_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Ruda_15_01"); //Masz.
	OP_SnipesWins_Day = Wld_GetDay();
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Ruda_03_02"); //Dzi�ki, wpadnij jutro do tego czasu postaram si� oskuba� tego jelenia.
    B_GiveInvItems (other, self, itminugget, 50);
	  B_LogEntry               (Oprawca,"Snipes wzi�� ode mnie 50 bry�ek rudy, teraz ma skroi� Winstona i nast�pnego dnia powinien ju� mie� jego dziennik.");
};


//========================================
//-----------------> Oprawca_Dziennik
//========================================

INSTANCE DIA_Snipes_Oprawca_Dziennik (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 3;
   condition    = DIA_Snipes_Oprawca_Dziennik_Condition;
   information  = DIA_Snipes_Oprawca_Dziennik_Info;
   permanent	= FALSE;
   description	= "No i jak tam? Masz dziennik Winstona?";
};

FUNC INT DIA_Snipes_Oprawca_Dziennik_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Snipes_Oprawca_Ruda))
&& (OP_SnipesWins_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Dziennik_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_01"); //No i jak tam? Masz dziennik Winstona?
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_02"); //No pytasz dzika czy sra w lesie. Pewnie, �e mam.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_03"); //No to dawaj.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_04"); //Trzymaj. Widz�, �e idziesz na wojn� z tym zabijak�, ryzykowna gra. Ale mo�e jak ja te� lubisz ryzykowa�?
	B_GiveInvItems (self,other, ItWr_WinstonBook, 1);
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_05"); //Nie toleruj� niesprawiedliwo�ci.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_06"); //Byleby ta tolerancja nie kosztowa�a ci� kilku z�b�w...
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_07"); //Nie musisz si� o to martwi�.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_08"); //Trzymaj si�.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_09"); //Do zobaczyska.
	  B_LogEntry               (Oprawca,"Snipes da� mi dziennik Winstona. Zatem mam obci��aj�cy go dow�d. Powinienem pom�wi� z Asghanem.");
};
//========================================
//-----------------> DWMN
//========================================

INSTANCE DIA_Snipes_DWMN (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_DWMN_Condition;
   information  = DIA_Snipes_DWMN_Info;
   permanent	= FALSE;
   description	= "S�ysza�e� nowin�?";
};

FUNC INT DIA_Snipes_DWMN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Robin_DWNM))
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_DWMN_Info()
{
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_01"); //S�ysza�e� nowin�?
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_02"); //Jak�?
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_03"); //Przygotowuj� specjaln� dostaw� rudy do obozu. Gomez b�dzie zadowolony.
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_04"); //Ta chciwa kanalia mog�aby bra� k�piele w rudzie a jeszcze jej ma�o...
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_05"); //Dzi�ki za informacj�.
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_06"); //Nie ma sprawy.
};

instance dia_snipes_pickpocket(c_info) {
    npc = vlk_584_snipes;
    nr = 900;
    condition = dia_snipes_pickpocket_condition;
    information = dia_snipes_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_snipes_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_snipes_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_snipes_pickpocket);
	info_addchoice(dia_snipes_pickpocket, dialog_back, dia_snipes_pickpocket_back);
	info_addchoice(dia_snipes_pickpocket, dialog_pickpocket, dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back() {
    info_clearchoices(dia_snipes_pickpocket);
};