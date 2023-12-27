// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	&& (!Wld_IsTime	(02,00,03,00))
	&& (Kapitel < 4)

	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Sprzedaj� bagienne ziele i r�ne wywary z obozu na bagnach. Mo�e czego� potrzebujesz?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Co to jest 'bagienne ziele'?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	if (Kapitel < 4)
	&& (Npc_KnowsInfo (hero,DIA_Dexter_First))
	&& (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	{
	return 1; 
	};
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co to jest "bagienne ziele"?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jeste� tu nowy, co? Bagienne ziele mo�na pali�. To bardzo odpr�aj�ce.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Poka� mi swoje towary.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	if (!Npc_KnowsInfo (hero, DIA_Dexter_Angry))
	&& (Kapitel < 4)
	{
	return 1;
	};
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Poka� mi swoje towary.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mam tu tylko towar najwy�szej jako�ci...
	B_ClearTreaderAmmo(self);
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC, "Cie� o imieniu Dexter handluje bagiennym zielem i napojami z Obozu Bractwa.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Chcia�bym do��czy� do Obozu. Chc� zosta� Cieniem.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK))  && (Kapitel < 4) 
	//&& ((MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chcia�bym do��czy� do Obozu. Chc� zosta� Cieniem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //O, i szukasz pewnie okazji, �eby pokaza�, na co ci� sta�, tak?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobra - mo�esz wy�wiadczy� mi pewn� przys�ug�. Je�li dobrze si� spiszesz, wstawi� si� za tob� u Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //O co chodzi?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //W obozie Sekty mieszka m�czyzna imieniem Kalom. To wielka szycha - jeden z Guru ca�ej tej pomylonej zgrai.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom jest alchemikiem. Posiada przepis na niezwykle skuteczny nap�j uzdrawiaj�cy.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chcia�bym go od niego odkupi�, wtedy sam m�g�bym zacz�� produkcj� tego napoju.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ale do Kaloma trudno si� zbli�y�, zw�aszcza ludziom z zewn�trz.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A czego oczekujesz ode mnie?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Te �wiry z Sekty bez przerwy szukaj� nowych ludzi. Jeste� tu nowy, nikt ci� nie zna. Udawaj, �e chcesz do nich do��czy�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom jest jednym z Guru, wi�c to on sprawdza nowych kandydat�w. Je�li uda ci si� z nim spotka�, spr�buj zdoby� dla mnie t� receptur�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Czy za ni� zap�acisz, czy nie - to ju� nie moja sprawa.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Dobrze, zobacz� co si� da zrobi�."						,DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC, "To nie b�dzie �atwe. Co b�d� z tego mia�?"	,DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobrze, zobacz� co si� da zrobi�.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cie� z targowiska, kaza� mi odwiedzi� Guru Kaloma w obozie sekty i zdoby� pewn� receptur�.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi� mi, �ebym udawa� sympatyka Sekty �ni�cego.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //To nie b�dzie �atwe. Co b�d� z tego mia�?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Pr�dzej czy p�niej Diego zapyta mnie co o tobie s�dz�. Zgadnij od czego b�dzie zale�a�a moja odpowied�.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Mo�e b�d� mu musia� zap�aci� za t� receptur�. Potrzebuj� 50 bry�ek rudy."	,DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Mo�e b�d� mu musia� zap�aci� za t� receptur�. Potrzebuj� 50 bry�ek rudy jako zaliczk�.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Nie ma mowy.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie ma rudy - nie ma receptury!"	,DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Nie ma rudy - nie ma receptury!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //No dobra, ale o rudzie porozmawiamy jak b�dziesz mia� receptur� w r�ku.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "Nie! Albo zap�acisz mi z g�ry, albo sam sobie id� na bagno."	,DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nie! Albo zap�acisz mi z g�ry, albo sam sobie id� do obozu na bagnie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Jest tu wielu ��todziob�w. Chyba jednak zlec� to zadanie komu� innemu...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC, "�wietnie! Zapomnijmy o ca�ej sprawie."	,DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //�wietnie! Zapomnijmy o ca�ej sprawie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Zaraz, powoli! Chcia�em tylko zobaczy�, jak daleko si� posuniesz... 50 bry�ek to troch� du�o jak na ��todzioba, nie s�dzisz?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To ju� lepiej...
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //A niech ci� szlag! Masz tu swoje 50 bry�ek! Tylko nie pr�buj mnie wykiwa�, ma�y!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cie� z targowiska, kaza� mi odwiedzi� Guru Kaloma w obozie Sekty i zdoby� pewn� receptur�.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi� mi, �ebym udawa� sympatyka Sekty �ni�cego.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 0;
	description	= "Gdzie jest ten ca�y ob�z na bagnie?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Gdzie jest ten ca�y ob�z na bagnie?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Wyjd� z Zewn�trznego Pier�cienia przez po�udniow� bram�, potem skieruj si� na wsch�d. Najlepiej b�dzie, jak we�miesz map�...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Bj�rn
		{																						//Bj�rn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mam tu jedn�. Kosztuje 50 bry�ek...
		};																						//Bj�rn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Po�udniowa brama to ta przy zawalonej wie�y, tak?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Dok�adnie.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Ob�z Sekty le�y na wsch�d od Starego Obozu.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Mam dla ciebie receptur�, o kt�r� prosi�e�!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mam dla ciebie receptur�, o kt�r� prosi�e�!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //To �wietnie! Poka� j�!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Znakomicie! Teraz sam b�d� m�g� wytwarza� nap�j uzdrawiaj�cy.
	if ((MIS_DraxTest != LOG_RUNNING) || (MIS_DraxTest != LOG_SUCCESS) || (MIS_EasyJoinOC != LOG_RUNNING) || (MIS_EasyJoinOC != LOG_SUCCESS))
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //R�wny z ciebie ch�op! Wspomn� o tobie Diego.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //We� to. To w nagrod�...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by� pod wra�eniem. Na pewno wspomni Diego o moich dokonaniach.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by� pod wra�eniem, ale co z tego? I tak nie mog� ju� zosta� Cieniem.");
	};
	B_GiveXP (XP_DexterKalom);
	
	}
	else
	{
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //We� to jako swoj� nagrod�...
	
	CreateInvItems (other,itminugget,50);
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	};
};



//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
//////////////////////////////////////////////

//========================================
//-----------------> SellElixer
//========================================

INSTANCE DIA_Dexter_SellElixer (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_SellElixer_Condition;
   information  = DIA_Dexter_SellElixer_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wn�trzno�ci pe�zaczy?";
};

FUNC INT DIA_Dexter_SellElixer_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_SellElixer_Info()
{
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_01"); //Sprzedajesz eliksir z wn�trzno�ci pe�zaczy?
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_02"); //Jasne! To nowy towar. Widz�, �e jeste� zainteresowany.
    AI_Output (other, self ,"DIA_Dexter_SellElixer_15_03"); //Bardziej mnie interesuje, kto ci go sprzeda�?  
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_04"); //To nie twoja sprawa.
	AI_DrawWeapon (hero);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_05"); //Jak zrobisz jak�� burd�, to natychmiast wezw� Stra�nik�w i zrobi� ci z dupy Nowy Ob�z.
    AI_RemoveWeapon (other);
    AI_Output (self, other ,"DIA_Dexter_SellElixer_03_06"); //Po prostu st�d spadaj. Chyba, �e co� bierzesz...
	
    B_LogEntry                     (CH3_SellElixer,"Okazuje si�, �e Dexter tak�e ma w swojej ofercie nasz eliksir. Jednak nie uda�o mi si� ustali�, od kogo go skupuje.");
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Dexter_Angry (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Angry_Condition;
   information  = DIA_Dexter_Angry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dexter_Angry_Condition()
{
    if (CaineFriend == false)
    && (Npc_KnowsInfo (hero, DIA_Caine_Exposed))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Angry_Info()
{
    AI_Output (self, other ,"DIA_Dexter_Angry_03_01"); //Gdzie moja dostawa eliksir�w?
    AI_Output (other, self ,"DIA_Dexter_Angry_15_02"); //Ju� nigdy jej nie zobaczysz. Mo�na powiedzie�, �e Caine wstrzyma� dzia�alno��.
    AI_Output (other, self ,"DIA_Dexter_Angry_15_03"); //Ty sukinsynu! Kiedy� mi za to zap�acisz.
    AI_Output (self, other ,"DIA_Dexter_Angry_03_04"); //Id� precz!
    AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////////
//  CSI: KRYMINALNE ZAGADKI STAREGO OBOZU
/////////////////////////////////////////////////////




//////////////////////////////////////////////
//	Zadanie: Nowe ziele
//////////////////////////////////////////////

//========================================
//-----------------> NovizeJoints
//========================================

INSTANCE DIA_Dexter_NovizeJoints (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_NovizeJoints_Condition;
   information  = DIA_Dexter_NovizeJoints_Info;
   permanent	= FALSE;
   description	= "Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.";
};

FUNC INT DIA_Dexter_NovizeJoints_Condition()
{
    if (MIS_NewWeed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_NovizeJoints_Info()
{
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_02"); //Doprawdy? Nowicjusze? Czy Guru wiedz� o tym zielu.
    AI_Output (other, self ,"DIA_Dexter_NovizeJoints_15_03"); //C�...
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_04"); //Tak my�la�em. Wsp�pracuj� z wysoko po�o�onymi i szanowanymi cz�onkami Bractwa. Baal Parvez i Baal Taran ci�gle patrz� mi na r�ce. 
    AI_Output (self, other ,"DIA_Dexter_NovizeJoints_03_05"); //Nie mam zamiaru ryzykowa� moich dobrych kontakt�w...

    B_LogEntry                     (CH1_NewWeed,"Dexter nie jest zainteresowany naszym towarem. �ci�le wsp�pracuje z innymi Nowicjuszami.");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kapitel4_dialog
//========================================

INSTANCE DIA_Dexter_Kapitel4_dialog (C_INFO)
{
   npc          = STT_329_Dexter;
   nr           = 1;
   condition    = DIA_Dexter_Kapitel4_dialog_Condition;
   information  = DIA_Dexter_Kapitel4_dialog_Info;
   permanent	= FALSE;
   description	= "Wci�� sprzedajesz bagienne ziele?";
};

FUNC INT DIA_Dexter_Kapitel4_dialog_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dexter_Kapitel4_dialog_Info()
{
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_01"); //Wci�� sprzedajesz bagienne ziele?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_02"); //Ju� nie. Po tym jak zostali zamordowani Magowie Ognia, urwa� mi si� kontakt z Bractwem.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_03"); //Straci�em dostawc�w. Nie mia�em wyboru i musia�em zwin�� interes.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_04"); //Teraz jestem zwiadowc� Kruka i jego lew� r�k�.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_05"); //Kto� jeszcze si� liczy?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_06"); //Bloodwyn, ale jego na razie tu nie ma. Za�atwia porachunki w Obozie.
    AI_Output (other, self ,"DIA_Dexter_Kapitel4_dialog_15_07"); //Czym sobie zas�u�y�e� na ten zaszczyt?
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_08"); //Dobrze si� sprawowa�em. To dzi�ki moim poradom Kruk zabra� ze sob� Toma. Taki cz�owiek bardzo nam si� przyda.
    AI_Output (self, other ,"DIA_Dexter_Kapitel4_dialog_03_09"); //Ponadto szef darzy mnie wielkim zaufaniem.
};

instance dia_dexter_pickpocket(c_info) {
    npc = stt_329_dexter;
    nr = 900;
    condition = dia_dexter_pickpocket_condition;
    information = dia_dexter_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dexter_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_dexter_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dexter_pickpocket);
	info_addchoice(dia_dexter_pickpocket, dialog_back, dia_dexter_pickpocket_back);
	info_addchoice(dia_dexter_pickpocket, dialog_pickpocket, dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back() {
    info_clearchoices(dia_dexter_pickpocket);
};