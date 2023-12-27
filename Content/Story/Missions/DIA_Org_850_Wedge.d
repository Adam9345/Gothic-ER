
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
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... ChodŸ no tutaj!
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
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jesteœ tu nowy, co? Od razu zauwa¿y³em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz siê jeszcze wiele nauczyæ. Móg³bym ci pokazaæ, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa¿aæ z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze¿ siê go!
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
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby³ych. Na twoim miejscu unika³bym go jak ognia.
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
	description		= "Czego mo¿esz mnie nauczyæ?"; 
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
		B_LogEntry			(GE_TeacherNC, "Szkodnik o przezwisku Klin mo¿e mnie nauczyæ skradania siê, otwierania zamków i kradzie¿y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale¿y... A co chcesz wiedzieæ?
	

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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
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
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
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
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
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
	description		= "Szukam pewnego z³odzieja."; 
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
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_00"); //Szukam pewnego z³odzieja.
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_01"); //Rozmawiasz z prawdziwym mistrzem z³odziejskiego fachu.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_02"); //Ktoœ okrad³ Cronosa.
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_03"); //I przychodzisz z tymi zarzutami do mnie? To obelga!
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_04"); //A to dlaczego?
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_05"); //¯aden porz¹dny z³odziej nie okrada w³asnego obozu. Tej kradzie¿y dopuœci³a siê jakaœ szuja. Ktoœ, kto jest tu nowy i luŸno zwi¹zany.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_06"); //Znasz nowych rekrutów Laresa?
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_07"); //Nie. I pewnie on sam te¿ ich nie zna. Zdobycie stroju Szkodnika z drugiej rêki wcale nie jest takie trudne.
	AI_Output (other, self,"DIA_Wedge_CronosTheft_15_08"); //Muszê jakoœ znaleŸæ z³odzieja. 
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_09"); //Nie wszystko stracone. Goœæ musia³ mieæ jakichœ kumpli w obozie. Popytaj. Zacznij od Sharkiego. 
	AI_Output (self, other,"DIA_Wedge_CronosTheft_05_10"); //Ka¿dy potrzebuje broni, wiêc ka¿dy prêdzej czy póŸniej zajrzy do handlarza.
	
	B_LogEntry               (CH1_MagicySzkodnicy,"Klin zasugerowa³ ¿eby porozmawiaæ z Sharkym o kradzie¿y. Handlarz broni¹ mo¿e znaæ z³odzieja.");
	
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
   description	= "Wiesz coœ o kluczu Baal Kagana?";
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
    AI_Output (other, self ,"DIA_Wedge_KluczBaala_15_01"); //Wiesz coœ o kluczu Baal Kagana?
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_02"); //Mo¿e wiem, mo¿e nie wiem.
    AI_Output (self, other ,"DIA_Wedge_KluczBaala_03_03"); //Masz 50 bry³ek rudy?
    B_LogEntry                     (CH1_KeyKagan,"Klin sprzeda mi klucz Kagana za 50 bry³ek rudy.");

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
   description	= "(Kup klucz - 50 bry³ek) ";
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
    AI_Output (self, other ,"DIA_Wedge_KeyBuy_03_02"); //Bardzo proszê.
    CreateInvItems (self, ItKe_Ncbaal, 1);
    B_GiveInvItems (self, other, ItKe_Ncbaal, 1);
    B_LogEntry                     (CH1_KeyKagan,"Odkupi³em klucz od Klina. Mogê go oddaæ Baal Kaganowi. Chocia¿ warto by by³o zajrzeæ do jego skrzyni...");

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
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_01"); //Ostatnio roi siê tutaj od z³odziei.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_02"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_03"); //Ktoœ ukrad³ moj¹ rodzinn¹ pami¹tkê.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_04"); //To niewielki pos¹¿ek jakiegoœ nieznanego mi bóstwa.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_05"); //Chêtnie bym go poszuka³, ale muszê pilnowaæ swojej chaty.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_06"); //Odzyskasz go dla mnie?
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje_15_07"); //Czemu nie?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_08"); //Niestety nie mogê ci daæ ¿adnej wskazówki.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje_03_09"); //Po prostu rozgl¹daj siê tu i tam.
    MIS_WedgesStatuette = LOG_RUNNING;

    Log_CreateTopic          (CH1_WedgesStatuette, LOG_MISSION);
    Log_SetTopicStatus       (CH1_WedgesStatuette, LOG_RUNNING);
    B_LogEntry               (CH1_WedgesStatuette,"Klin chce, abym odnalaz³ jego rodzinn¹ pami¹tkê. To ma³y pos¹¿ek przedstawiaj¹cy dziwne bóstwo.");
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
   description	= "Mam pos¹¿ek.";
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
    AI_Output (other, self ,"DIA_Wedge_Posog_15_01"); //Mam pos¹¿ek.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_02"); //Gdzie go znalaz³eœ?
    AI_Output (other, self ,"DIA_Wedge_Posog_15_03"); //Kupi³em go od handlarza Fiska.
    AI_Output (self, other ,"DIA_Wedge_Posog_03_04"); //A to pod³a gnida!
    AI_Output (other, self ,"DIA_Wedge_Posog_15_05"); //Myœlisz, ¿e sam tu przyszed³ i ci go ukrad³?
    AI_Output (self, other ,"DIA_Wedge_Posog_03_06"); //Nie wiem tego.
    B_LogEntry                     (CH1_WedgesStatuette,"Znalaz³em pos¹¿ek Klina w ofercie handlarza Fiska. Odda³em Szkodnikowi zgubê.");
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
   description	= "Dowiedzia³eœ siê, kto ci go ukrad³?";
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
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_01"); //Dowiedzia³eœ siê kto ci go ukrad³?
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_02"); //Jeszcze nie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_03"); //Jednak widzê, ¿e ty masz wielk¹ chêæ to ustaliæ.
    AI_Output (other, self ,"DIA_Wedge_Zlodzieje2_15_04"); //Powiedzmy, ¿e to by³o moje ¿yciowe marzenie.
    AI_Output (self, other ,"DIA_Wedge_Zlodzieje2_03_05"); //Œwietnie! Gdy czegoœ siê dowiesz, daj mi znaæ. Wynagrodzê ciê.
    MIS_ZnowuZapierdalam = LOG_RUNNING;

    Log_CreateTopic            (CH1_ZnowuZapierdalam, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZnowuZapierdalam, LOG_RUNNING);
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Klin do tej pory nie ustali³, kto ukrad³ jego pos¹¿ek. T¹ spraw¹ mam siê zaj¹æ ja.");
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
   description	= "Wiem, kto ukrad³ pos¹¿ek.";
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
    AI_Output (other, self ,"DIA_Wedge_Judge_15_01"); //Wiem, kto ukrad³ pos¹¿ek.
    AI_Output (self, other ,"DIA_Wedge_Judge_03_02"); //Kto to taki?

    Info_ClearChoices	(DIA_Wedge_Judge);
    Info_AddChoice		(DIA_Wedge_Judge, "To Butch!", DIA_Wedge_Judge_Butch);
    Info_AddChoice		(DIA_Wedge_Judge, "To Sharky!", DIA_Wedge_Judge_Sharky);
};

FUNC VOID DIA_Wedge_Judge_Butch()
{
    AI_Output (other, self ,"DIA_Wedge_Judge_Butch_15_01"); //To Butch!
    AI_Output (self, other ,"DIA_Wedge_Judge_Butch_03_02"); //Wiedzia³em, ¿e z niego kawa³ sukinsyna!
    AI_Output (self, other ,"DIA_Wedge_Judge_Butch_03_03"); //Dziêki.
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Zaufa³em Sharkiemu i powiedzia³em, ¿e to Butch okrad³ Klina.");
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

    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_03"); //Co wiêcej, próbowa³ mnie przekupiæ.
    AI_Output (self, other ,"DIA_Wedge_Judge_Sharky_03_04"); //Sk¹d wiesz, ¿e to on?
    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_05"); //To w³aœnie Sharky jest nowym paserem Fiska.
    AI_Output (other, self ,"DIA_Wedge_Judge_Sharky_15_06"); //Sam za³atwia³em mu tê robotê.
    AI_Output (self, other ,"DIA_Wedge_Judge_Sharky_03_07"); //Ju¿ ja go dorwê!
    B_LogEntry                     (CH1_ZnowuZapierdalam,"Nie ufam Sharky'emu. Powiedzia³em, ¿e to on okrad³ Klina. ");
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
   description	= "Dobry maj¹ tu alkohol?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_1_15_01"); //Dobry maj¹ tu alkohol?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_02"); //Nie jest mo¿e tak dobry, jak piwo spoza Bariery, ale nie wybrzydzam.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_03"); //W naszym Obozie pêdzi siê g³ównie ry¿ówkê. Na piwo mo¿esz siê tu natkn¹æ tylko po obrabowaniu konwojów ze Starego Obozu.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_1_03_04"); //Ostrzegam, ¿e bardzo szybko siê sprzedaje!
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
   description	= "Mo¿e piwko? ";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_01"); //Mo¿e piwko? 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_02"); //Spadasz mi z nieba kolego! Tak dawno nie pi³em piwa. Zazwyczaj ca³e piwo koñczy wypite przez sta³ych bywalców.
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_03"); //Proszê, wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_04"); //Dziêki.
    B_GiveInvItems (other, self, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_2_15_05"); //Jakich sta³ych bywalców masz na myœli?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_2_03_06"); //Jest parê osób, które ca³ymi dniami tu siedz¹. Taki na przyk³ad Isidro. Dziwiê siê, ¿e ten koleœ jeszcze nie wylecia³ z Sekty za swoje pijañstwo. Poza tym kilku ch³opków lubi sobie popiæ, jak na przyk³ad Cipher. 
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
   description	= "Co w ogóle s³ychaæ w Obozie?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_3_15_01"); //Co w ogóle s³ychaæ w Obozie?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_02"); //Jak zwykle pe³no burd pomiêdzy Najemnikami i Szkodnikami. Ostatnio jednak mia³ miejsce pewien zabawny incydent. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_03"); //Krzykacz, jeden z najbardziej rozzuchwalonych Szkodników zwin¹³ nieco stali kowalowi Huanowi. 
	AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_04"); //Ten odkry³ to i mia³a miejsce bardzo ciekawa walka. Krzykacz tak oberwa³, ¿e a¿ ze strachu przeniós³ siê do chat Najemników.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_3_03_05"); //Krzykacz nie doceni³ jak¹ si³¹ mo¿e dysponowaæ kowal. 
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
   description	= "Za co trafi³eœ do Kolonii?";
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
    AI_Output (other, self ,"DIA_Wedge_KARCZMA_4_15_01"); //Za co trafi³eœ do Kolonii?
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_02"); //Najogólniej za liczne kradzie¿e dokonywane na s³ugach Króla. Mieszka³em w Myrtanie, w okolicach Gothy, twierdzy paladynów.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_03"); //Pewnego wieczoru mój prze³o¿ony poleci³ mi, bym okrad³ kapitana Garonda, jednego z najlepszych paladynów w królestwie.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_04"); //Niestety Garond nie bez powodu nosi tytu³ kapitana. Szybko mnie wykry³ i by³ gotów wymierzyæ sprawiedliwoœæ.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_05"); //Gdyby do tej sprawy nie w³¹czy³ siê Lord Hagen - wielki mistrz zakonu paladynów, by³bym martwy.
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_06"); //Paladyni wys³ali mnie do stolicy, a Rhobar skaza³ na wrzucenie za Barierê. 
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_07"); //Gdy by³em transportowany statkiem do Khorinis, zarzyga³em ca³¹ kajutê. Nienawidzê podró¿y morskich!
    AI_Output (self, other ,"DIA_Wedge_KARCZMA_4_03_08"); //Ot i ca³a moja historia. 
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
   description	= "Mi³o siê rozmawia³o.";
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
    AI_Output (other, self ,"DIA_Wedge_ZAKONCZENIE_15_01"); //Mi³o siê rozmawia³o.
    AI_Output (self, other ,"DIA_Wedge_ZAKONCZENIE_03_02"); //Wpadnij jeszcze, koleœ. Pamiêtaj, ¿e mogê ciê wiele nauczyæ o z³odziejstwie. 
    AI_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------------1.6.1---------------------------------------------------------------------

//========================================
//-----------------> Cieñ w boku
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
    AI_Output (self, other ,"DIA_KLIN_SWINEY_03_01"); //Ej, widzê, ¿e zdenerwowa³eœ Butcha. Masz szczêœcie, ¿e siê na ciebie nie rzuci³.
    AI_Output (other, self ,"DIA_KLIN_SWINEY_15_02"); //Prawdopodobnie ma coœ czego szukam. Chodzi o pewien œwistek.
    AI_Output (self, other ,"DIA_KLIN_SWINEY_15_03"); //Có¿ jeœli byœ mi zap³aci³ to móg³bym sprawiæ by to pismo trafi³o do ciebie.
    AI_Output (other, self ,"DIA_KLIN_SWINEY_15_04"); //Ile chcesz w zamian za okradniêcie go?
	AI_Output (self, other ,"DIA_KLIN_SWINEY_15_05"); //150 bry³ek.

	 B_LogEntry               (Cienwboku,"Po nieudanej rozmowie z Butchem zagada³ do mnie Klin. Zobowi¹za³ siê okraœæ Butcha w zamian za op³atê 150 bry³ek rudy. Oby warto by³o go wynajmowaæ.");
};
//////////////////////
//--------Cieñ w boku
//////////////////////
INSTANCE DIA_KLIN_SWINEYRUDA (C_INFO)
{
   npc          = ORG_850_Wedge;
   nr           = 2;
   condition    = DIA_KLIN_SWINEYRUDA_Condition;
   information  = DIA_KLIN_SWINEYRUDA_Info;
   permanent	= FALSE;
   description = "Oto 150 bry³ek rudy";
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
    AI_Output (other, self ,"DIA_KLIN_SWINEYRUDA_03_01"); //Oto 150 bry³ek rudy.
	B_GiveInvItems      (hero,self, ItMiNugget, 150);
    AI_Output (self, other ,"DIA_KLIN_SWINEYRUDA_15_02"); //Wpadnij to mnie jutro. Powinien mieæ ju¿ ten dokument.
   
    AI_StopProcessInfos	(self);
	Klin_Papier_Day = Wld_GetDay();
};

/////////////////////
//
//----------Cieñ w boku
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
    AI_Output (self, other ,"DIA_KLIN_PAPIER_15_02"); //Jasne. Co jak co ale takiego têpaka jak Butch okrada³aby nawet ma³a dziewczynka.
	B_GiveInvItems      (self,hero, ItMi_DokumentSwineya, 1);
    AI_Output (other, self ,"DIA_KLIN_PAPIER_03_03"); //Dziêki za pomoc.
    AI_StopProcessInfos	(self);
 B_LogEntry               (Cienwboku,"Klin okrad³ Butcha i dziêki temu mam dokument. Musze dostarczyæ go Swiney’owi.");
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
    AI_Output (other, self ,"DIA_Wedge_PZ_15_03"); //Z³odziejskie.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_04"); //Wiêc kierujesz je do w³aœciwego cz³owieka. W czym rzecz?
    AI_Output (other, self ,"DIA_Wedge_PZ_15_05"); //Zbieracz Foster ma przy sobie pewien klucz.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_06"); //Chcesz go przej¹æ i dostaæ siê do jakiegoœ kufra? Mogê siê tym zaj¹æ. Ale o ile wiem ten koleœ jest strasznie podejrzliwy i wszêdzie doszukuje siê spisku.
    AI_Output (self, other ,"DIA_Wedge_PZ_03_07"); //Có¿ gdybym wpad³ co jednak nie nast¹pi pewnie powi¹zano by to ze spraw¹ okradania zbieraczy. Ale akurat z tym nie mam nic wspólnego. Mam lepsze rzeczy na g³owie.
    AI_Output (other, self ,"DIA_Wedge_PZ_15_08"); //Ile chcesz za ten numer?
    AI_Output (self, other ,"DIA_Wedge_PZ_03_09"); //200 bry³ek. Profesjonalista bierze profesjonalne stawki. Logiczne co?
    AI_Output (other, self ,"DIA_Wedge_PZ_15_10"); //Hmmm niech bêdzie.
	B_LogEntry           (PoszkodowaniZbieracze,"Klin chce 200 bry³ek za dyskretne zabranie Fosterowi jego klucza. Inaczej nie popchnê sprawy naprzód. ");
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
   description	= "WeŸ 200 bry³ek i zrób co trzeba.";
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
    AI_Output (other, self ,"DIA_Wedge_PZ_NUGGET_15_01"); //WeŸ 200 bry³ek i zrób co trzeba.
	B_GiveInvItems (other,self, itminugget, 200);
    AI_Output (self, other ,"DIA_Wedge_PZ_NUGGET_03_02"); //Daj mi 2 dni potem wróæ po klucz, który wkrótce zniknie z kieszeni Fostera...
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
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_02"); //Có¿, pomóg³ fakt, ¿e zna³em pewnego zbieracza. 
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_03"); //Dziêki temu mia³em alibi, pogada³em ze znajomym a za chwilê pracuj¹cy obok Foster mia³ opró¿nion¹ kieszeñ...
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_04"); //Czyli masz co trzeba.
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_05"); //Znam siê na swoim fachu to zrobi³em to co dobrze umiem. Masz ten klucz.
	B_GiveInvItems (self,other, ITKE_Foster, 1);
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_06"); //Dziêki.
    AI_Output (self, other ,"DIA_Wedge_PZ_KEY_03_07"); //Fajna robota. Gdybyœ kiedy jeszcze jak¹œ mia³ to daj znaæ.
    AI_Output (other, self ,"DIA_Wedge_PZ_KEY_15_08"); //W porz¹dku.
	B_LogEntry           (PoszkodowaniZbieracze,"Po wrêczeniu rudy Klinowi poczeka³em 2 dni. Kolejny raz zanotowa³ udan¹ kradzie¿. Pora udaæ siê do kufra Fostera.");
    AI_StopProcessInfos	(self);
};

