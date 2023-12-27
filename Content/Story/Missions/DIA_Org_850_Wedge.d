
// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Ciiii... Hej, ty!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Co? Ja?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... Chod� no tutaj!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czego ode mnie chcesz?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jeste� tu nowy, co? Od razu zauwa�y�em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz si� jeszcze wiele nauczy�. M�g�bym ci pokaza�, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa�a� z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze� si� go!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co z nim jest nie tak?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //A co z nim jest nie tak?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby�ych. Na twoim miejscu unika�bym go jak ognia.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo�esz mnie nauczy�?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC, "Szkodnik o przezwisku Klin mo�e mnie nauczy� skradania si�, otwierania zamk�w i kradzie�y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale�y... A co chcesz wiedzie�?
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Wedge_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Wedge_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Wedge_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Wedge_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Wedge_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

/////////////////////////////////////////////////
// Cronos Theft
/////////////////////////////////////////////////

instance  DIA_Wedge_CronosTheft (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_CronosTheft_Condition;
	information		= DIA_Wedge_CronosTheft_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam pewnego z�odzieja."; 
};

FUNC int  DIA_Wedge_CronosTheft_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Cronos_KRADZIEZ))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_CronosTheft_Info()
{
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_00"); //Szukam pewnego z�odzieja.
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_01"); //Rozmawiasz z prawdziwym mistrzem z�odziejskiego fachu.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_02"); //Kto� okrad� Cronosa.
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_03"); //I przychodzisz z tymi zarzutami do mnie? To obelga!
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_04"); //A to dlaczego?
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_05"); //�aden porz�dny z�odziej nie okrada w�asnego obozu. Tej kradzie�y dopu�ci�a si� jaka� szuja. Kto�, kto jest tu nowy i lu�no zwi�zany.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_06"); //Znasz nowych rekrut�w Laresa?
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_07"); //Nie. I pewnie on sam te� ich nie zna. Zdobycie stroju Szkodnika z drugiej r�ki wcale nie jest takie trudne.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_08"); //Musz� jako� znale�� z�odzieja. 
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_09"); //Nie wszystko stracone. Go�� musia� mie� jakich� kumpli w obozie. Popytaj. Zacznij od Sharkiego. 
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_10"); //Ka�dy potrzebuje broni, wi�c ka�dy pr�dzej czy p�niej zajrzy do handlarza.
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Klin zasugerowa� �eby porozmawia� z Sharkym o kradzie�y. Handlarz broni� mo�e zna� z�odzieja.");
	
	B_GiveXP (75);
};  

//========================================
//-----------------> KluczBaala
//========================================

INSTANCE DIA_Wedge_KluczBaala (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_KluczBaala_Condition;
   information  = DIA_Wedge_KluczBaala_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o kluczu Baal Kagana?";
};

FUNC INT DIA_Wedge_KluczBaala_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalKagan_nfosKey))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KluczBaala_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KluczBaala_15_01"); //Wiesz co� o kluczu Baal Kagana?
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_02"); //Mo�e wiem, mo�e nie wiem.
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_03"); //Masz 50 bry�ek rudy?
    B_LogEntry                     (CH1_KeyKagan,"Klin sprzeda mi klucz Kagana za 50 bry�ek rudy.");

    B_GiveXP (50);
};

//========================================
//-----------------> KeyBuy
//========================================

INSTANCE DIA_Wedge_KeyBuy (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_KeyBuy_Condition;
   information  = DIA_Wedge_KeyBuy_Info;
   permanent	= FALSE;
   description	= "(Kup klucz - 50 bry�ek) ";
};

FUNC INT DIA_Wedge_KeyBuy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_KluczBaala))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KeyBuy_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KeyBuy_15_01"); //Daj mi ten klucz.
    AI_Output (self, other ,"DIA_Wedge_KeyBuy_03_02"); //Bardzo prosz�.
    CreateInvItems (self, ItKe_Ncbaal, 1);
    B_GiveInvItems (self, other, ItKe_Ncbaal, 1);
    B_LogEntry                     (CH1_KeyKagan,"Odkupi�em klucz od Klina. Mog� go odda� Baal Kaganowi. Chocia� warto by by�o zajrze� do jego skrzyni...");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zlodzieje
//========================================

INSTANCE DIA_Wedge_Zlodzieje (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_Zlodzieje_Condition;
   information  = DIA_Wedge_Zlodzieje_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Wedge_Zlodzieje_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Psst)) && (Kapitel == 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Zlodzieje_Info()
{
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_01"); //Ostatnio roi si� tutaj od z�odziei.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_02"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_03"); //Kto� ukrad� moj� rodzinn� pami�tk�.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_04"); //To niewielki pos��ek jakiego� nieznanego mi b�stwa.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_05"); //Ch�tnie bym go poszuka�, ale musz� pilnowa� swojej chaty.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_06"); //Odzyskasz go dla mnie?
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_07"); //Czemu nie?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_08"); //Niestety nie mog� ci da� �adnej wskaz�wki.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_09"); //Po prostu rozgl�daj si� tu i tam.
    MIS_WedgesStatuette = LOG_RUNNING;

    Log_CreateTopic          (CH1_WedgesStatuette, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WedgesStatuette, LOG_RUNNING);
    B_LogEntry               (CH1_WedgesStatuette,"Klin chce, abym odnalaz� jego rodzinn� pami�tk�. To ma�y pos��ek przedstawiaj�cy dziwne b�stwo.");
	//CreateInvItems (Stt_311_Fisk, JakBylPosazekPoAngielskuDoZCholery, 1); ***FIX*** TWORZONY W INNYM SKRYPCIE!!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Posog
//========================================

INSTANCE DIA_Wedge_Posog (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_Posog_Condition;
   information  = DIA_Wedge_Posog_Info;
   permanent	= FALSE;
   description	= "Mam pos��ek.";
};

FUNC INT DIA_Wedge_Posog_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wedge_Zlodzieje))
    && (Npc_HasItems (other, JakBylPosazekPoAngielskuDoZCholery) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Posog_Info()
{
    AI_Output (other, self ,"DIA_Wedge_Posog_15_01"); //Mam pos��ek.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_02"); //Gdzie go znalaz�e�?
    AI_Output (other, self ,"DIA_Wedge_Posog_15_03"); //Kupi�em go od handlarza Fiska.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_04"); //A to pod�a gnida!
    AI_Output (other, self ,"DIA_Wedge_Posog_15_05"); //My�lisz, �e sam tu przyszed� i ci go ukrad�?
    AI_Output (self, other ,"DIA_Wedge_Posog_03_06"); //Nie wiem tego.
    B_LogEntry                     (CH1_WedgesStatuette,"Znalaz�em pos��ek Klina w ofercie handlarza Fiska. Odda�em Szkodnikowi zgub�.");
    Log_SetTopicStatus       (CH1_WedgesStatuette, LOG_SUCCESS);
    MIS_WedgesStatuette = LOG_SUCCESS;

    B_GiveXP (125);
    B_GiveInvItems (other, self, JakBylPosazekPoAngielskuDoZCholery, 1);
    CreateInvItems (self, ItMiNugget, 35);
    B_GiveInvItems (self, other, ItMiNugget, 35);
};

//========================================
//-----------------> Zlodzieje2
//========================================

INSTANCE DIA_Wedge_Zlodzieje2 (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 3;
   condition    = DIA_Wedge_Zlodzieje2_Condition;
   information  = DIA_Wedge_Zlodzieje2_Info;
   permanent	= FALSE;
   description	= "Dowiedzia�e� si�, kto ci go ukrad�?";
};

FUNC INT DIA_Wedge_Zlodzieje2_Condition()
{
    if (MIS_WedgesStatuette == LOG_SUCCESS)
    && (Npc_KnowsInfo (hero, Org_843_Sharky_Fisk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Zlodzieje2_Info()
{
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_01"); //Dowiedzia�e� si� kto ci go ukrad�?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_02"); //Jeszcze nie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_03"); //Jednak widz�, �e ty masz wielk� ch�� to ustali�.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_04"); //Powiedzmy, �e to by�o moje �yciowe marzenie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_05"); //�wietnie! Gdy czego� si� dowiesz, daj mi zna�. Wynagrodz� ci�.
    MIS_ZnowuZapierdalam = LOG_RUNNING;

    Log_CreateTopic            (CH1_ZnowuZapierdalam, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_RUNNING);
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Klin do tej pory nie ustali�, kto ukrad� jego pos��ek. T� spraw� mam si� zaj�� ja.");
    AI_StopProcessInfos	(self);
};
var int WedgeKnowsSharky;
//========================================
//-----------------> Judge
//========================================

INSTANCE DIA_Wedge_Judge (C_INFO)
{
   npc          = Org_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_Judge_Condition;
   information  = DIA_Wedge_Judge_Info;
   permanent	= FALSE;
   description	= "Wiem, kto ukrad� pos��ek.";
};

FUNC INT DIA_Wedge_Judge_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Sharky_UkradzionyPosag))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_Judge_Info()
{
    AI_Output (other, self ,"DIA_Wedge_Judge_15_01"); //Wiem, kto ukrad� pos��ek.
    AI_Output (self, other ,"DIA_Wedge_Judge_03_02"); //Kto to taki?

    Info_ClearChoices	(DIA_Wedge_Judge);
    Info_AddChoice		(DIA_Wedge_Judge, "To Butch!", DIA_Wedge_Judge_Butch);
    Info_AddChoice		(DIA_Wedge_Judge, "To Sharky!", DIA_Wedge_Judge_Sharky);
};

FUNC VOID DIA_Wedge_Judge_Butch()
{
    AI_Output (other, self ,"DIA_Wedge_Judge_Butch_15_01"); //To Butch!
    AI_Output (self, other ,"DIA_Wedge_Judge_Butch_03_02"); //Wiedzia�em, �e z niego kawa� sukinsyna!
    AI_Output (self, other ,"DIA_Wedge_Judge_Butch_03_03"); //Dzi�ki.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Zaufa�em Sharkiemu i powiedzia�em, �e to Butch okrad� Klina.");
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_SUCCESS);
    MIS_ZnowuZapierdalam = LOG_SUCCESS;
	WedgeKnowsSharky = false;
    B_GiveXP (50);
    Info_ClearChoices		(DIA_Wedge_Judge);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Wedge_Judge_Sharky()
{
    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_01"); //To Sharky!

    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_03"); //Co wi�cej, pr�bowa� mnie przekupi�.
    AI_Output (self, other ,"DIA_Wedge_Judge_Sharky_03_04"); //Sk�d wiesz, �e to on?
    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_05"); //To w�a�nie Sharky jest nowym paserem Fiska.
    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_06"); //Sam za�atwia�em mu t� robot�.
    AI_Output (self, other ,"DIA_Wedge_Judge_Sharky_03_07"); //Ju� ja go dorw�!
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Nie ufam Sharky'emu. Powiedzia�em, �e to on okrad� Klina. ");
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_SUCCESS);
    MIS_ZnowuZapierdalam = LOG_SUCCESS;
	WedgeKnowsSharky = true;
    B_GiveXP (200);
    Info_ClearChoices		(DIA_Wedge_Judge);
    AI_StopProcessInfos	(self);
};

//********************************************************************
//********* POGADUCHY KARCZMA 1
//********************************************************************
//========================================
//-----------------> KARCZMA_1
//========================================

INSTANCE DIA_Wedge_KARCZMA_1 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_KARCZMA_1_Condition;
   information  = DIA_Wedge_KARCZMA_1_Info;
   permanent	= FALSE;
   description	= "Dobry maj� tu alkohol?";
};

FUNC INT DIA_Wedge_KARCZMA_1_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_1_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_1_15_01"); //Dobry maj� tu alkohol?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_02"); //Nie jest mo�e tak dobry, jak piwo spoza Bariery, ale nie wybrzydzam.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_03"); //W naszym Obozie p�dzi si� g��wnie ry��wk�. Na piwo mo�esz si� tu natkn�� tylko po obrabowaniu konwoj�w ze Starego Obozu.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_04"); //Ostrzegam, �e bardzo szybko si� sprzedaje!
};

//========================================
//-----------------> KARCZMA_2
//========================================

INSTANCE DIA_Wedge_KARCZMA_2 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_KARCZMA_2_Condition;
   information  = DIA_Wedge_KARCZMA_2_Info;
   permanent	= FALSE;
   description	= "Mo�e piwko? ";
};

FUNC INT DIA_Wedge_KARCZMA_2_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    && (Npc_HasItems (other, ItFoBeer) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_2_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_01"); //Mo�e piwko? 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_02"); //Spadasz mi z nieba kolego! Tak dawno nie pi�em piwa. Zazwyczaj ca�e piwo ko�czy wypite przez sta�ych bywalc�w.
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_03"); //Prosz�, wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_04"); //Dzi�ki.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_05"); //Jakich sta�ych bywalc�w masz na my�li?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_06"); //Jest par� os�b, kt�re ca�ymi dniami tu siedz�. Taki na przyk�ad Isidro. Dziwi� si�, �e ten kole� jeszcze nie wylecia� z Sekty za swoje pija�stwo. Poza tym kilku ch�opk�w lubi sobie popi�, jak na przyk�ad Cipher. 
};

//========================================
//-----------------> KARCZMA_3
//========================================

INSTANCE DIA_Wedge_KARCZMA_3 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 3;
   condition    = DIA_Wedge_KARCZMA_3_Condition;
   information  = DIA_Wedge_KARCZMA_3_Info;
   permanent	= FALSE;
   description	= "Co w og�le s�ycha� w Obozie?";
};

FUNC INT DIA_Wedge_KARCZMA_3_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_3_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_3_15_01"); //Co w og�le s�ycha� w Obozie?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_02"); //Jak zwykle pe�no burd pomi�dzy Najemnikami i Szkodnikami. Ostatnio jednak mia� miejsce pewien zabawny incydent. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_03"); //Krzykacz, jeden z najbardziej rozzuchwalonych Szkodnik�w zwin�� nieco stali kowalowi Huanowi. 
	AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_04"); //Ten odkry� to i mia�a miejsce bardzo ciekawa walka. Krzykacz tak oberwa�, �e a� ze strachu przeni�s� si� do chat Najemnik�w.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_05"); //Krzykacz nie doceni� jak� si�� mo�e dysponowa� kowal. 
};

//========================================
//-----------------> KARCZMA_4
//========================================

INSTANCE DIA_Wedge_KARCZMA_4 (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 4;
   condition    = DIA_Wedge_KARCZMA_4_Condition;
   information  = DIA_Wedge_KARCZMA_4_Info;
   permanent	= FALSE;
   description	= "Za co trafi�e� do Kolonii?";
};

FUNC INT DIA_Wedge_KARCZMA_4_Condition()
{
    if (Wld_IsTime     (21,00,00,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_KARCZMA_4_Info()
{
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_4_15_01"); //Za co trafi�e� do Kolonii?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_02"); //Najog�lniej za liczne kradzie�e dokonywane na s�ugach Kr�la. Mieszka�em w Myrtanie, w okolicach Gothy, twierdzy paladyn�w.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_03"); //Pewnego wieczoru m�j prze�o�ony poleci� mi, bym okrad� kapitana Garonda, jednego z najlepszych paladyn�w w kr�lestwie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_04"); //Niestety Garond nie bez powodu nosi tytu� kapitana. Szybko mnie wykry� i by� got�w wymierzy� sprawiedliwo��.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_05"); //Gdyby do tej sprawy nie w��czy� si� Lord Hagen - wielki mistrz zakonu paladyn�w, by�bym martwy.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_06"); //Paladyni wys�ali mnie do stolicy, a Rhobar skaza� na wrzucenie za Barier�. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_07"); //Gdy by�em transportowany statkiem do Khorinis, zarzyga�em ca�� kajut�. Nienawidz� podr�y morskich!
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_08"); //Ot i ca�a moja historia. 
};

//========================================
//-----------------> ZAKONCZENIE
//========================================

INSTANCE DIA_Wedge_ZAKONCZENIE (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 5;
   condition    = DIA_Wedge_ZAKONCZENIE_Condition;
   information  = DIA_Wedge_ZAKONCZENIE_Info;
   permanent	= FALSE;
   description	= "Mi�o si� rozmawia�o.";
};

FUNC INT DIA_Wedge_ZAKONCZENIE_Condition()
{
    if  (Wld_IsTime     (21,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_1))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_2))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_3))
    && (Npc_KnowsInfo (hero, DIA_Wedge_KARCZMA_4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wedge_ZAKONCZENIE_Info()
{
    AI_Output (other, self ,"DIA_Wedge_ZAKONCZENIE_15_01"); //Mi�o si� rozmawia�o.
    AI_Output (self, other ,"DIA_Wedge_ZAKONCZENIE_03_02"); //Wpadnij jeszcze, kole�. Pami�taj, �e mog� ci� wiele nauczy� o z�odziejstwie. 
    AI_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------------1.6.1---------------------------------------------------------------------

//========================================
//-----------------> Cie� w boku
//========================================

INSTANCE DIA_KLIN_SWINEY (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_KLIN_SWINEY_Condition;
   information  = DIA_KLIN_SWINEY_Info;
   permanent	= FALSE;
   important = 1;
};

FUNC INT DIA_KLIN_SWINEY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Butch_SWINEY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_KLIN_SWINEY_Info()
{
    AI_Output (self, other ,"DIA_KLIN_SWINEY_03_01"); //Ej, widz�, �e zdenerwowa�e� Butcha. Masz szcz�cie, �e si� na ciebie nie rzuci�.
    AI_Output (other, self ,"DIA_KLIN_SWINEY_15_02"); //Prawdopodobnie ma co� czego szukam. Chodzi o pewien �wistek.
    AI_Output (self, other ,"DIA_KLIN_SWINEY_15_03"); //C� je�li by� mi zap�aci� to m�g�bym sprawi� by to pismo trafi�o do ciebie.
    AI_Output (other, self ,"DIA_KLIN_SWINEY_15_04"); //Ile chcesz w zamian za okradni�cie go?
	AI_Output (self, other ,"DIA_KLIN_SWINEY_15_05"); //150 bry�ek.

	 B_LogEntry               (Cienwboku,"Po nieudanej rozmowie z Butchem zagada� do mnie Klin. Zobowi�za� si� okra�� Butcha w zamian za op�at� 150 bry�ek rudy. Oby warto by�o go wynajmowa�.");
};
//////////////////////
//--------Cie� w boku
//////////////////////
INSTANCE DIA_KLIN_SWINEYRUDA (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_KLIN_SWINEYRUDA_Condition;
   information  = DIA_KLIN_SWINEYRUDA_Info;
   permanent	= FALSE;
   description = "Oto 150 bry�ek rudy";
};

FUNC INT DIA_KLIN_SWINEYRUDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_KLIN_SWINEY)) 	&& (Npc_HasItems(other,itminugget) >= 150)
    {
    return TRUE;
    };
};


FUNC VOID DIA_KLIN_SWINEYRUDA_Info()
{
    AI_Output (other, self ,"DIA_KLIN_SWINEYRUDA_03_01"); //Oto 150 bry�ek rudy.
	B_GiveInvItems      (hero,self, ItMiNugget, 150);
    AI_Output (self, other ,"DIA_KLIN_SWINEYRUDA_15_02"); //Wpadnij to mnie jutro. Powinien mie� ju� ten dokument.
   
    AI_StopProcessInfos	(self);
	Klin_Papier_Day = Wld_GetDay();
};

/////////////////////
//
//----------Cie� w boku
//
////////////////////////

INSTANCE DIA_KLIN_PAPIER (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_KLIN_PAPIER_Condition;
   information  = DIA_KLIN_PAPIER_Info;
   permanent	= FALSE;
   description = "I jak masz te papiery?";
};

FUNC INT DIA_KLIN_PAPIER_Condition()
{
    if (Npc_KnowsInfo (hero,  DIA_KLIN_SWINEYRUDA )) 	
	&& (Klin_Papier_Day!= Wld_GetDay())
    {
    return TRUE;
    };
};


FUNC VOID DIA_KLIN_PAPIER_Info()
{
    AI_Output (other, self ,"DIA_KLIN_PAPIER_03_01"); //I jak masz te papiery?	
    AI_Output (self, other ,"DIA_KLIN_PAPIER_15_02"); //Jasne. Co jak co ale takiego t�paka jak Butch okrada�aby nawet ma�a dziewczynka.
	B_GiveInvItems      (self,hero, ItMi_DokumentSwineya, 1);
    AI_Output (other, self ,"DIA_KLIN_PAPIER_03_03"); //Dzi�ki za pomoc.
    AI_StopProcessInfos	(self);
 B_LogEntry               (Cienwboku,"Klin okrad� Butcha i dzi�ki temu mam dokument. Musze dostarczy� go Swiney�owi.");
};



//========================================
//-----------------> PZ
//========================================

INSTANCE DIA_Wedge_PZ (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_PZ_Condition;
   information  = DIA_Wedge_PZ_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie zlecenie. ";
};

FUNC INT DIA_Wedge_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Horatio_TalkingFoster))
{
    return TRUE;
};
};
FUNC VOID DIA_Wedge_PZ_Info()
{
    AI_Output (other, self ,"DIA_Wedge_PZ_15_01"); //Mam dla ciebie zlecenie. 
    AI_Output (self, other ,"DIA_Wedge_PZ_03_02"); //Jakie?
    AI_Output (other, self ,"DIA_Wedge_PZ_15_03"); //Z�odziejskie.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_04"); //Wi�c kierujesz je do w�a�ciwego cz�owieka. W czym rzecz?
    AI_Output (other, self ,"DIA_Wedge_PZ_15_05"); //Zbieracz Foster ma przy sobie pewien klucz.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_06"); //Chcesz go przej�� i dosta� si� do jakiego� kufra? Mog� si� tym zaj��. Ale o ile wiem ten kole� jest strasznie podejrzliwy i wsz�dzie doszukuje si� spisku.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_07"); //C� gdybym wpad� co jednak nie nast�pi pewnie powi�zano by to ze spraw� okradania zbieraczy. Ale akurat z tym nie mam nic wsp�lnego. Mam lepsze rzeczy na g�owie.
    AI_Output (other, self ,"DIA_Wedge_PZ_15_08"); //Ile chcesz za ten numer?
    AI_Output (self, other ,"DIA_Wedge_PZ_03_09"); //200 bry�ek. Profesjonalista bierze profesjonalne stawki. Logiczne co?
    AI_Output (other, self ,"DIA_Wedge_PZ_15_10"); //Hmmm niech b�dzie.
	B_LogEntry           (PoszkodowaniZbieracze,"Klin chce 200 bry�ek za dyskretne zabranie Fosterowi jego klucza. Inaczej nie popchn� sprawy naprz�d. ");
};

//========================================
//-----------------> PZ_NUGGET
//========================================
var int PZ_WedgeDay;
INSTANCE DIA_Wedge_PZ_NUGGET (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_Wedge_PZ_NUGGET_Condition;
   information  = DIA_Wedge_PZ_NUGGET_Info;
   permanent	= FALSE;
   description	= "We� 200 bry�ek i zr�b co trzeba.";
};

FUNC INT DIA_Wedge_PZ_NUGGET_Condition()
{
 if (Npc_HasItems (other, ItMiNugget) >=200)
 && (Npc_KnowsInfo(hero,DIA_Wedge_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Wedge_PZ_NUGGET_Info()
{
    AI_Output (other, self ,"DIA_Wedge_PZ_NUGGET_15_01"); //We� 200 bry�ek i zr�b co trzeba.
	B_GiveInvItems (other,self, itminugget, 200);
    AI_Output (self, other ,"DIA_Wedge_PZ_NUGGET_03_02"); //Daj mi 2 dni potem wr�� po klucz, kt�ry wkr�tce zniknie z kieszeni Fostera...
    AI_Output (other, self ,"DIA_Wedge_PZ_NUGGET_15_03"); //Dobrze.
	PZ_WedgeDay = Wld_GetDay();
};

//========================================
//-----------------> PZ_KEY
//========================================

INSTANCE DIA_Wedge_PZ_KEY (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 1;
   condition    = DIA_Wedge_PZ_KEY_Condition;
   information  = DIA_Wedge_PZ_KEY_Info;
   permanent	= FALSE;
   description	= "No i masz ten klucz?";
};

FUNC INT DIA_Wedge_PZ_KEY_Condition()
{
   if (PZ_WedgeDay != Wld_GetDay())
   && (Npc_KnowsInfo(hero,DIA_Wedge_PZ_NUGGET)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Wedge_PZ_KEY_Info()
{
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_01"); //No i masz ten klucz?
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_02"); //C�, pom�g� fakt, �e zna�em pewnego zbieracza. 
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_03"); //Dzi�ki temu mia�em alibi, pogada�em ze znajomym a za chwil� pracuj�cy obok Foster mia� opr�nion� kiesze�...
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_04"); //Czyli masz co trzeba.
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_05"); //Znam si� na swoim fachu to zrobi�em to co dobrze umiem. Masz ten klucz.
	B_GiveInvItems (self,other, ITKE_Foster, 1);
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_06"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_07"); //Fajna robota. Gdyby� kiedy jeszcze jak�� mia� to daj zna�.
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_08"); //W porz�dku.
	B_LogEntry           (PoszkodowaniZbieracze,"Po wr�czeniu rudy Klinowi poczeka�em 2 dni. Kolejny raz zanotowa� udan� kradzie�. Pora uda� si� do kufra Fostera.");
    AI_StopProcessInfos	(self);
};

