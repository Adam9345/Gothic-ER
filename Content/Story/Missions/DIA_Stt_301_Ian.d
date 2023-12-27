
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Rozejrz� si� troch� po okolicy.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Nie sprawiaj �adnych k�opot�w.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "To ty jeste� Ian, szef tej kopalni?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //To ty jeste� Ian, szef tej kopalni?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Tak, to ja. A to moja kopalnia, wi�c lepiej nie pr�buj niczego g�upiego.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "My�la�em, �e to kopalnia Gomeza?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //My�la�em, �e to kopalnia Gomeza?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //No c�, oczywi�cie, kopalnia nale�y do Starego Obozu. Ale tutaj, pod ziemi�, jest tylko jeden szef - ja!
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mo�esz mi opowiedzie� o wydobyciu rudy?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Mo�esz mi opowiedzie� o wydobyciu rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Kopiemy dniem i noc�. Dzi�ki temu wydobywamy oko�o 200 work�w rudy na miesi�c, plus jakie� 20 work�w, kt�re od razu zostaj� przetopione.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, kt�r� dostarczamy Kr�lowi mo�na by wyku� or� dla nie lada armii.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Tak, nasza ruda rzeczywi�cie posiada w�a�ciwo�ci magiczne. Wykuta z niej bro� nigdy si� nie psuje, a miecze i topory s� ostrzejsze, ni� te wykute ze stali.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Ka�da armia wyposa�ona w taki or� ma powa�n� przewag� w boju.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi co� jeszcze o rudzie."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Opowiedz mi co� jeszcze o rudzie.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Niestety, magiczne w�a�ciwo�ci rudy zanikaj� podczas przetapiania. W hutach Nordmaru znaj� odpowiednie techniki przetapiania.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale nawet bez mocy magicznych, bro� wykonana z naszej rudy jest bardziej wytrzyma�a i zadaje wi�ksze obra�enia ni� zwyk�y or�.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o kopalni."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Opowiedz mi o kopalni.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Je�li chcesz si� tu troch� rozejrze�, to radz� ci dobrze uwa�a�. W jaskiniach kryj� si� pe�zacze. Najlepiej trzymaj si� g��wnego szybu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //I nie przeszkadzaj �wi�tynnym Stra�nikom. Chocia� przez wi�kszo�� czasu zbijaj� b�ki, to najlepsi sprzymierze�cy, jakich mo�na sobie wyobrazi� podczas starcia z pe�zaczami.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Postaram si� o tym pami�ta�.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Mam jeszcze sporo roboty. A, i nie przeszkadzaj w pracy moim ludziom!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Tylko si� tu troch� rozejrz�.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przychodz� tu po list� dla Obozu."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Przychodz� tu po list� dla Obozu.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Ka�dy mo�e tak powiedzie�. Spadaj.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przysy�a mnie Diego. Mam odebra� list�."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	&& (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Przysy�a mnie Diego. Mam odebra� list�.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //W porz�dku. Oto i ona. Powiedz im, �eby si� pospieszyli z dostawami.
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_03"); //Mog� tak po prostu st�d wyj��? Stra�nicy nie b�d� mi robi� k�opotu? Niejaki Lorenzo m�wi�, �e mo�esz mi nie zaufa�.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_04"); //Lorenzo to niech si� za przeproszeniem nie wpieprza w moje sprawy. 
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_05"); //Ta lista jest bardzo wa�na i CHOLERNIE mi ZALE�Y, aby SZYBKO dosta� rzeczy, kt�re na niej s�. Jasne? Id� ju�.
	B_LogEntry  (CH1_BringList,"Ian bez sprzeciwu wr�czy� mi list� zam�wie�. Ponadto zaufa� mi i nie musz� pracowa� jako Kopacz, zanim b�d� m�g� wyj�� z Kopalni.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie� tutaj musi by� gniazdo pe�zaczy.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Gdzie� tutaj musi by� gniazdo pe�zaczy.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Za�o�� si�, �e jest tu przynajmniej z tuzin gniazd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //S�uchaj, musz� natychmiast i�� do tego gniazda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nie mam teraz na to czasu! Par� godzin temu zepsu� si� nasz rozdrabniacz. Ko�o z�bate p�k�o w drzazgi.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nie mam poj�cia, gdzie znajd� nowe.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Przynie� mi ko�o z�bate. Wtedy zajm� si� twoim problemem.

	B_LogEntry		(CH2_MCEggs,	"Ian, szef Starej Kopalni, nie pomo�e mi w odnalezieniu gniazda pe�zaczy. Mam za to przynie�� mu ko�o z�bate do zepsutego rozdrabniacza rudy. Podobno mog� je znale�� w kt�rym� z opuszczonych bocznych tuneli.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ko�o z�bate? A gdzie ja niby mam je znale��?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ko�o z�bate? A gdzie ja niby mam je znale��?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nie mam poj�cia. Jestem r�wnie bezradny co ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //W kt�rym� z bocznych szyb�w stoi zepsuty rozdrabniacz. Mo�e tam co� znajdziesz.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam ko�o z�bate.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mam ko�o z�bate.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Dobra robota! Powinno dzia�a�. No a teraz wr��my do twojej sprawy. Szukasz gniazda pe�zaczy... Hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Znajd� Asghana i powiedz mu, �eby otworzy� ci drzwi. B�dziesz m�g� rozejrze� si� po zamkni�tych korytarzach.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Powiedz mu "Wszystko b�dzie w porz�dku". Po tym pozna, �e to ja ci� przysy�am.

	B_LogEntry		(CH2_MCEggs,	"Przynios�em Ianowi ko�o z�bate, o kt�re prosi�. Teraz mam powiedzie� Asghanowi, �e WSZYSTKO B�DZIE W PORZ�DKU. Wtedy Stra�nik otworzy dla mnie bram� do opuszczonych szyb�w.");
	
	//er 1.4.5
	Wld_InsertNpc (VLK_7019_Buddler, "OM_NEW_ORE1");
	Wld_InsertNpc (VLK_7018_Buddler, "OM_NEW_ORE1");
	Wld_InsertNpc (GRD_7017_Gardist, "OM_NEW_ORE1");
	Wld_InsertNpc (GRD_7016_Gardist, "OM_NEW_ORE1");
};	

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Nadal szukam gniazda pe�zaczy.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Nadal szukam gniazda pe�zaczy.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //M�wi�em ci ju� - id� do Asghana. To dow�dca Stra�nik�w. Znajdziesz go gdzie� na najni�szym poziomie.

	B_LogEntry		(CH2_MCEggs,	"Je�li chc� odnale�� gniazdo pe�zaczy, powinienem porozmawia� z Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz�em gniazdo!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Znalaz�em gniazdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //No to nareszcie b�dziemy tu mieli chwil� spokoju. Ha ha ha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez obrazy. Dobra robota, ch�opcze.
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Masz. We� t� skrzynk� piwa. Zas�u�y�e�.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Co? Tylko tyle tych jaj? A zreszt�... Udowodni�e�, �e twardy z ciebie go��.
};

//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_IAN_SZPIEG (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 8;
   condition    = DIA_IAN_SZPIEG_Condition;
   information  = DIA_IAN_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Podobno Stary Ob�z robi co� w kopalni dla Bractwa.";
};

FUNC INT DIA_IAN_SZPIEG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaDrak_SZPIEG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_IAN_SZPIEG_15_01"); //Podobno Stary Ob�z robi co� w kopalni dla Bractwa.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_02"); //Mo�e, ale taki bandycki ch�ystek nie powinien nic o tym wiedzie�.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_03"); //Masz szcz�cie, �e w og�le ci� tu wpu�ci�em.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_04"); //Zobaczycie. Bandyci kiedy� polegn�. Quentin zap�aci za swe zuchwalstwo!
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_05"); //Spr�buj tylko co� zrobi� w kopalni, to po�a�ujesz!
    B_LogEntry                     (CH1_PSIcampWORK,"Ian nie chce mi zdradzi� informacji. O ma�o co wyp�dzi�by mnie z kopalni. Musz� na niego uwa�a�.");
};

//========================================
//-----------------> Start_FoodForOldMine
//========================================

INSTANCE DIA_IAN_Start_FoodForOldMine (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_Start_FoodForOldMine_Condition;
   information  = DIA_IAN_Start_FoodForOldMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_IAN_Start_FoodForOldMine_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_GETLIST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_Start_FoodForOldMine_Info()
{
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_01"); //Zaczekaj. Jak ju� wybierasz si� na zewn�trz, to b�d� mia� dla ciebie zadanie.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_02"); //Mamy problem z dostawami �ywno�ci do Kopalni.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_03"); //To co dostajemy z Obozu nie zgadza si� z tym, co zamawiamy.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_04"); //Nikt z moich ludzi nie chcia� sobie babra� tym r�k.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_05"); //M�g�by� wyja�ni� t� spraw�?
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_06"); //Jasne. Od czego mam zacz��?
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_07"); //Id� do Starego Obozu i porozmawiaj z kucharzem Snafem.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_08"); //On przygotowuje straw�, kt�ra jest nam dostarczana.
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_09"); //Wkr�tce si� tym zajm�. 
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_10"); //Mam tak� nadziej�.
    MIS_FoodForOldMine = LOG_RUNNING;

    Log_CreateTopic          (CH1_FoodForOldMine, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FoodForOldMine, LOG_RUNNING);
    B_LogEntry               (CH1_FoodForOldMine,"Ian zleci� mi pewne zadanie: mam wybada�, dlaczego dostawy �ywno�ci dostarczane do Starej Kopalni nie zgadzaj� si� z zam�wieniami. Powinienem w tym celu porozmawia� ze Snafem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QuestEndAll
//========================================

INSTANCE DIA_IAN_QuestEndAll (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_QuestEndAll_Condition;
   information  = DIA_IAN_QuestEndAll_Info;
   permanent	= FALSE;
   description	= "Problem zosta� rozwi�zany.";
};

FUNC INT DIA_IAN_QuestEndAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_QuestIan_Succes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_QuestEndAll_Info()
{
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_01"); //Problem zosta� rozwi�zany.
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_02"); //Mirzo odprowadza� cz�� dostaw do Nowego Obozu. Nie�le przy tym zarobi�.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_03"); //A to gnida! Mam nadzieje, �e ju� nie b�dzie przeszkadza�?
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_04"); //Nie b�dzie.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_05"); //Bardzo dobrze. �wietnie si� spisa�e�, jak na nowego.
    B_LogEntry               (CH1_FoodForOldMine,"Powiedzia�em o wszystkim Ianowi. Moja rola sko�czona. ");
    Log_SetTopicStatus       (CH1_FoodForOldMine, LOG_SUCCESS);
    MIS_FoodForOldMine = LOG_SUCCESS;

    B_GiveXP (255);
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
    AI_StopProcessInfos	(self);
};



//=====================================================================================================================================================================================



// ***************** Infos *****************************   
instance  STT_301_IAN_OBITE_PYSKI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_OBITE_PYSKI_Condition;
	information		= STT_301_IAN_OBITE_PYSKI_Info;
	important		= 0;
	permanent		= 0;
	important       = TRUE; 
};

FUNC int  STT_301_IAN_OBITE_PYSKI_Condition()
{	
	if (Kapitel == 2) 
	
	{
		return TRUE;
	};

};
func void  STT_301_IAN_OBITE_PYSKI_Info()
{
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_01"); //Hej, podejd�. Musimy pom�wi�.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_15_02"); //O czym?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_03"); //Kr�cisz si� tu i �wdzie po ca�ej dost�pnej cz�ci kopalni. Wiele widzisz i gadasz z wieloma lud�mi.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_15_04"); //M�g�by� m�wi� nieco ja�niej?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_05"); //Musz� si� czego� dowiedzie�, czego� co nikt raczej nie powie mi wprost.
	
};


// ***************** Infos *****************************   
instance  STT_301_IAN_OBITE_PYSKI1 (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_OBITE_PYSKI1_Condition;
	information		= STT_301_IAN_OBITE_PYSKI1_Info;
	important		= 0;
	permanent		= 0;
	description     = "Co takiego niby mia�bym dla ciebie wybada�?";
};

FUNC int  STT_301_IAN_OBITE_PYSKI1_Condition()
{	
	if (Npc_KnowsInfo (hero, STT_301_IAN_OBITE_PYSKI))
	
	{
		return TRUE;
	};

};
func void  STT_301_IAN_OBITE_PYSKI1_Info()
{
	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_01"); //Co takiego niby mia�bym dla ciebie wybada�?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_02"); //Nasi Kopacze ostatnio nie wygl�daj� najlepiej.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_03"); //Bior�c pod uwag� ich wynagrodzenie  i diet�...
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_04"); //Bez �art�w. Daj mi doko�czy�. S� ostatnio wyj�tkowo powolni i oci�ali we wszystkim co robi�.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_05"); //Dlaczego?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_06"); //Mo�e od tych siniak�w. Kto� daje im niez�ego �upnia a wydajno�� ich pracy leci na �eb.	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_07"); //Stra�nicy si� nad nimi zn�caj�?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_08"); //Rzecz w tym, �e nie. Przynajmniej to uda�o mi si� na razie ustali�.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_09"); //A co m�wi� sami Kopacze?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_10"); //Nic. Wszyscy z jaki� powod�w milcz�. A najwi�cej ci z pyskami granatowymi od siniak�w.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_11"); //Ledwo ku�tykaj�, zamiast pracowa�. Ca�y ob�z na tym traci a to wszystko mo�e spa�� na mnie gdy Magnatom zmniejsz� si� wp�ywy.

     Info_ClearChoices (STT_301_IAN_OBITE_PYSKI1 );
	 Info_AddChoice    (STT_301_IAN_OBITE_PYSKI1 ,"Co zamierzasz?",DIA_IAN_ZLECENIE);
	
};

FUNC VOID DIA_IAN_ZLECENIE()
  {
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_00");  //Je�li mi zap�acisz to mog� si� dowiedzie� o co w tym chodzi.
	AI_Output (self ,other," DIA_IAN_ZLECENIE_11_01");  //Jak rozwi��esz t� zagadk� to mo�esz liczy� na moj� wdzi�czno��.	
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_02");  //Gdzie i od kogo mam zacz�� poszukiwania?
	AI_Output (self ,other," DIA_IAN_ZLECENIE_11_03");  //Hmmm... Niech to b�dzie jaki� interesowny cwaniak. Taki na pewno co� b�dzie wiedzia� i oczywi�cie sprzeda t� wiedz� za odpowiedni� cene.	
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_04");  //Pogadam z kim� takim.
	
	
    AI_StopProcessInfos	     (self);
    Log_CreateTopic          (ObitePyski, LOG_MISSION);
    Log_SetTopicStatus       (ObitePyski, LOG_RUNNING);
    B_LogEntry               (ObitePyski,"Ian twierdzi, �e kopacze ostatnio s� bardzo zmaltretowani i s�aniaj� si� z b�lu. Ich wydajno�� bardzo mocno spad�a. Pono� to nie zas�uga Stra�nik�w. Musz� dowiedzie� si� o co w tym wszystkim chodzi. Powinienem pogada� z jakim� cwanym go�ciem, kt�ry du�o wie.");

};

// ***************** Obite pyski end *****************************   
instance  STT_301_IAN_OBITE_PYSKI_END (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_OBITE_PYSKI_END_Condition;
	information		= STT_301_IAN_OBITE_PYSKI_END_Info;
	important		= 0;
	permanent		= 0;
	description     = "Zbada�em spraw� pobitych kopaczy.";
};

FUNC int  STT_301_IAN_OBITE_PYSKI_END_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Garp_Ian))
	&& (Npc_GetDistToWP(Vlk_587_Garp,"OM_CAVE1_49")<300)
	{
		return TRUE;
	};

};
func void  STT_301_IAN_OBITE_PYSKI_END_Info()
{
	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_01"); //Zbada�em spraw� pobitych kopaczy.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_02"); //Powiedz o co w tym chodzi.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_03"); //Stra�nicy organizuj� nielegalne walki na platformie nad Asghanem. On o wszystkim wie ale umywa r�ce bo boi si� konsekwencji tego, �e przymyka� oko na ca�y proceder.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_04"); //A co tu robi ten kopacz?
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_05"); //Garp b�dzie zeznawa� w tej sprawie. Poprze moj� wersje wydarze� jako bezpo�redni uczestnik wydarze�.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_06"); //Ale boi si� reakcji Stra�nik�w wi�c b�dzie potrzebowa� ochrony.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_07"); //C�.... Postaram si� by Stra�nicy nie dowiedzieli si� o jego pomocy. Ale na wszelki wypadek Na razie zostanie tutaj.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_08"); //Teraz przes�ucham Garpa. A ty we� nagrod� za pomoc w tej sprawie.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_09"); //Dzi�kuje, oby tamci Stra�nicy dostali nauczk�.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_10"); //Dostan�, bez obaw ch�opcze.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_11"); //Zatem do zobaczenia...  A zaraz jeszcze jedno. 
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_12"); //Oto zapiski Cesara, to powinno go ostatecznie obci��y� win� za ca�e zamieszanie.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_13"); //Jeszcze raz dzi�kuje. 
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_14"); //Drobiazg.
	Log_SetTopicStatus       (ObitePyski, LOG_SUCCESS);
	B_LogEntry               (ObitePyski,"Wyja�ni�em Ianowi co mia�o miejsce z pokiereszowanymi Kopaczami. Garp tak jak chcia�em b�dzie �wiadkiem przy oskar�eniu Cesara. Da�em Ianowi r�wnie� zapiski Cesara. Ten wyp�aci� mi w nagrod� poka�n� sumk� w rudzie.");
    B_GiveXP (255);
	CreateInvItems (self, ItMiNugget, 390);
    B_GiveInvItems (self, other, ItMiNugget, 390);
	//=============================CESAR================================
	CreateInvItem		(GRD_40011_Cesar, VLK_ARMOR_M);
	Npc_RemoveInvItem	(GRD_40011_Cesar, GRD_ARMOR_H);
	AI_EquipBestArmor	(GRD_40011_Cesar); 
	CreateInvItem       (GRD_40011_Cesar, ItMwPickaxe);
	Npc_ExchangeRoutine            (GRD_40011_Cesar,"kopacz");
	
	
	Npc_ExchangeRoutine            (Vlk_587_Garp,"Siedzi");
	
};

//========================================
//-----------------> Oprawca
//========================================

INSTANCE DIA_IAN_Oprawca (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_Oprawca_Condition;
   information  = DIA_IAN_Oprawca_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_IAN_Oprawca_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Eliott_Oprawca_End))
{
    return TRUE;
};
};
FUNC VOID DIA_IAN_Oprawca_Info()
{
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_01"); //Eliott opowiada�, �e wykry�e� oszustwo Winstona z broni� i za�atwi�e� by ten odczepi� si� od niego.
    AI_Output (other, self ,"DIA_IAN_Oprawca_15_02"); //To prawda.
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_03"); //Zas�u�y�e� na nagrod�. We� te 100 bry�ek.
    AI_Output (other, self ,"DIA_IAN_Oprawca_15_04"); //Dzi�ki.
	B_GiveInvItems (self,other, itminugget, 100);
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_05"); //Przyda�o by si� wi�cej takich zdolnych i uczciwych ludzi.
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> DWNS
//========================================

INSTANCE DIA_IAN_DWNS (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_DWNS_Condition;
   information  = DIA_IAN_DWNS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_IAN_DWNS_Condition()
{
  if (Npc_GetTrueGuild(hero) == GIL_VLK)
  && (Kapitel == 1)
{
    return TRUE;
};
};
FUNC VOID DIA_IAN_DWNS_Info()
{
    AI_Output (self, other ,"DIA_IAN_DWNS_03_01"); //Ej podejd� no na chwil�!
    AI_Output (other, self ,"DIA_IAN_DWNS_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_IAN_DWNS_03_03"); //Dzieje si� co� z�ego. Kto� nocami demoluje stoiska z rud� przygotowane do transportu do Starego Obozu. 
    AI_Output (other, self ,"DIA_IAN_DWNS_15_04"); //Hmm... Mo�e poprostu kto� mia� z�y dzie�...
    AI_Output (self, other ,"DIA_IAN_DWNS_03_05"); //To nie wszystko. Nasz hutnik na dnie kopalni - W��, zg�osi� co� przed chwil�. Co� pono� si� sta�o.
    AI_Output (other, self ,"DIA_IAN_DWNS_15_06"); //Pom�wi� z W�em.
    AI_Output (self, other ,"DIA_IAN_DWNS_03_07"); //Dobrze. A potem wr�� I wyja�nij mi o co chodzi do jasnej cholery.
    AI_Output (other, self ,"DIA_IAN_DWNS_15_08"); //Dobrze.
	Log_CreateTopic		(Dywersant,	LOG_MISSION);
	Log_SetTopicStatus	(Dywersant,	LOG_RUNNING);
	B_LogEntry               (Dywersant,"Ian powiedzia�, �e kto� demoluje stoiska z rud� przeznaczon� do transportu do Starego Obozu. Ponadto W�� zg�asza� co� jeszcze. Musz� z nim pom�wi�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DWNS_FUR
//========================================

INSTANCE DIA_IAN_DWNS_FUR (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_DWNS_FUR_Condition;
   information  = DIA_IAN_DWNS_FUR_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z W�em.";
};

FUNC INT DIA_IAN_DWNS_FUR_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Viper_DWNS))
{
    return TRUE;
};
};
FUNC VOID DIA_IAN_DWNS_FUR_Info()
{
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_01"); //Rozmawia�em z W�em.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_02"); //Co si� sta�o?
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_03"); //Kto� pr�bowa� uszkodzi� piec hutniczy.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_04"); //A to sukinsyn.
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_05"); //Co teraz?
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_06"); //Mam w kopalni swojego cz�owieka. To Cie� Robin.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_07"); //Porozmawiaj z nim. Da�em mu ju� pewne wskaz�wki. Znajdziesz go id�c na wprost wej�cia od magazynu.
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_08"); //Niech b�dzie... ale co ja b�d� z tego mia�?
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_09"); //O nagrodzie porozmawiamy gdy ju� dowiemy si� co to za kretyn.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_10"); //No... Co ty tu jeszcze robisz!
	B_LogEntry               (Dywersant,"Ian poleci� mi zbada� spraw� ostatniej dywersji w kopalni. Mam pom�wi� z jego cz�owiekiem - Cieniem Robinem. Znajd� go na wprost od magazynu.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DWMN_ULBERT
//========================================

INSTANCE DIA_IAN_DWMN_ULBERT (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_DWMN_ULBERT_Condition;
   information  = DIA_IAN_DWMN_ULBERT_Info;
   permanent	= FALSE;
   description	= "Ulbert zmusza� Glena by robi� szkody w kopalni. ";
};

FUNC INT DIA_IAN_DWMN_ULBERT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_ULBERT_DWMN_B2))
{
    return TRUE;
};
};
FUNC VOID DIA_IAN_DWMN_ULBERT_Info()
{
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_01"); //Ulbert zmusza� Glena by robi� szkody w kopalni. Kto� najwyra�niej chc� by� straci� posad�.
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_02"); //Ulbert? Nie wierze.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_03"); //Niekoniecznie. Kto jest stryjem Ulberta?
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_04"); //Drake.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_05"); //Zatem on za tym stoi.
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_06"); //Ka�� niezw�ocznie przeszuka� Ulberta. Wr�� do mnie jutro.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_07"); //W porz�dku.
	B_LogEntry               (Dywersant,"Ian powiedzia�, �e Ulbert zostanie przszukany w sprawie zlecenia dywersji Glenowi. Oczywi�cie taki g��b nie m�g� by� m�zgiem ca�ej operacji. Lecz jego stryj. Okazuje si�, �e jest nim Drake. Mam wr�ci� do Iana nast�pnego dnia I dowiedzie� si� co si� stanie.");
	Dywersant_CDay = Wld_GetDay();
};

//========================================
//-----------------> DWMN_DRAKE
//========================================

INSTANCE DIA_IAN_DWMN_DRAKE (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 2;
   condition    = DIA_IAN_DWMN_DRAKE_Condition;
   information  = DIA_IAN_DWMN_DRAKE_Info;
   permanent	= FALSE;
   description	= "Co wiadomo w kwestii Ulberta?";
};

FUNC INT DIA_IAN_DWMN_DRAKE_Condition()
{
if (Dywersant_CDay != Wld_GetDay())
&& (Npc_KnowsInfo(hero,DIA_IAN_DWMN_ULBERT))
{
    return TRUE;
};
};
FUNC VOID DIA_IAN_DWMN_DRAKE_Info()
{
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_01"); //Co wiadomo w kwestii Ulberta?
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_02"); //Znale�li�my przy nim instrukcj� od Drake�a. Mia�o doj�� do takich szk�d by kopalnia straci�a na wydajno�ci.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_03"); //Chodzi�o o to bym straci� posad�. A Drake zaj�� moje miejsce.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_04"); //Chytry plan. Ale posiada podstawowy b��d bo anga�uje do tego g�upiego Ulberta.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_05"); //Dok�adnie.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_06"); //Co czeka Drake�a I Ulberta?
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_07"); //Ten sukinsyn Drake mia� tu dot�d takie powa�anie, �e sko�czy si� pewnie tylko na bardzo poka�nej grzywnie.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_08"); //A Ulbert?
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_09"); //Ten g��b sam jest nieszkodliwy. Po co go wiesza� skoro szkoda sznura. A nu� si� urwie...
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_10"); //Wy�wiadczy�e� mi wielk� przys�ug�. Oto nale�na Ci nagroda.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItAt_TrollFur, 3);
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_11"); //Dzi�ki.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_12"); //Post�puj�c tak dalej zajdziesz tu znacznie wy�ej.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_13"); //Do zobaczenia.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_14"); //Na razie.
	B_LogEntry               (Dywersant,"Drake�a I Ulberta czekaj� bardzo surowe kary. Ale raczej unikn� stryczka. Ja tymczasem odebra�em pochwa�y od Iana i nale�n� nagrod�.");
	B_GiveXP (290);
	Log_SetTopicStatus	(Dywersant,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};


