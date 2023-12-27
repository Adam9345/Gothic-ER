
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
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Rozejrzê siê trochê po okolicy.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Nie sprawiaj ¿adnych k³opotów.
	
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
	description		= "To ty jesteœ Ian, szef tej kopalni?"; 
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
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //To ty jesteœ Ian, szef tej kopalni?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Tak, to ja. A to moja kopalnia, wiêc lepiej nie próbuj niczego g³upiego.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Myœla³em, ¿e to kopalnia Gomeza?"; 
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
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Myœla³em, ¿e to kopalnia Gomeza?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //No có¿, oczywiœcie, kopalnia nale¿y do Starego Obozu. Ale tutaj, pod ziemi¹, jest tylko jeden szef - ja!
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mo¿esz mi opowiedzieæ o wydobyciu rudy?"; 
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
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Mo¿esz mi opowiedzieæ o wydobyciu rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Kopiemy dniem i noc¹. Dziêki temu wydobywamy oko³o 200 worków rudy na miesi¹c, plus jakieœ 20 worków, które od razu zostaj¹ przetopione.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, któr¹ dostarczamy Królowi mo¿na by wykuæ orê¿ dla nie lada armii.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "S³ysza³em, ¿e ruda ma w³aœciwoœci magiczne. Opowiedz mi o tym."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //S³ysza³em, ¿e ruda ma w³aœciwoœci magiczne. Opowiedz mi o tym.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Tak, nasza ruda rzeczywiœcie posiada w³aœciwoœci magiczne. Wykuta z niej broñ nigdy siê nie psuje, a miecze i topory s¹ ostrzejsze, ni¿ te wykute ze stali.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Ka¿da armia wyposa¿ona w taki orê¿ ma powa¿n¹ przewagê w boju.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi coœ jeszcze o rudzie."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Opowiedz mi coœ jeszcze o rudzie.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Niestety, magiczne w³aœciwoœci rudy zanikaj¹ podczas przetapiania. W hutach Nordmaru znaj¹ odpowiednie techniki przetapiania.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale nawet bez mocy magicznych, broñ wykonana z naszej rudy jest bardziej wytrzyma³a i zadaje wiêksze obra¿enia ni¿ zwyk³y orê¿.
	
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
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Jeœli chcesz siê tu trochê rozejrzeæ, to radzê ci dobrze uwa¿aæ. W jaskiniach kryj¹ siê pe³zacze. Najlepiej trzymaj siê g³ównego szybu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //I nie przeszkadzaj Œwi¹tynnym Stra¿nikom. Chocia¿ przez wiêkszoœæ czasu zbijaj¹ b¹ki, to najlepsi sprzymierzeñcy, jakich mo¿na sobie wyobraziæ podczas starcia z pe³zaczami.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Postaram siê o tym pamiêtaæ.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Mam jeszcze sporo roboty. A, i nie przeszkadzaj w pracy moim ludziom!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Tylko siê tu trochê rozejrzê.
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
	description		= "Przychodzê tu po listê dla Obozu."; 
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
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Przychodzê tu po listê dla Obozu.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Ka¿dy mo¿e tak powiedzieæ. Spadaj.
	 
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
	description		= "Przysy³a mnie Diego. Mam odebraæ listê."; 
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
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Przysy³a mnie Diego. Mam odebraæ listê.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //W porz¹dku. Oto i ona. Powiedz im, ¿eby siê pospieszyli z dostawami.
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_03"); //Mogê tak po prostu st¹d wyjœæ? Stra¿nicy nie bêd¹ mi robiæ k³opotu? Niejaki Lorenzo mówi³, ¿e mo¿esz mi nie zaufaæ.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_04"); //Lorenzo to niech siê za przeproszeniem nie wpieprza w moje sprawy. 
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_05"); //Ta lista jest bardzo wa¿na i CHOLERNIE mi ZALE¯Y, aby SZYBKO dostaæ rzeczy, które na niej s¹. Jasne? IdŸ ju¿.
	B_LogEntry  (CH1_BringList,"Ian bez sprzeciwu wrêczy³ mi listê zamówieñ. Ponadto zaufa³ mi i nie muszê pracowaæ jako Kopacz, zanim bêdê móg³ wyjœæ z Kopalni.");
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
	description = "Gdzieœ tutaj musi byæ gniazdo pe³zaczy.";
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
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Gdzieœ tutaj musi byæ gniazdo pe³zaczy.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Za³o¿ê siê, ¿e jest tu przynajmniej z tuzin gniazd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //S³uchaj, muszê natychmiast iœæ do tego gniazda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nie mam teraz na to czasu! Parê godzin temu zepsu³ siê nasz rozdrabniacz. Ko³o zêbate pêk³o w drzazgi.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nie mam pojêcia, gdzie znajdê nowe.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Przynieœ mi ko³o zêbate. Wtedy zajmê siê twoim problemem.

	B_LogEntry		(CH2_MCEggs,	"Ian, szef Starej Kopalni, nie pomo¿e mi w odnalezieniu gniazda pe³zaczy. Mam za to przynieœæ mu ko³o zêbate do zepsutego rozdrabniacza rudy. Podobno mogê je znaleŸæ w którymœ z opuszczonych bocznych tuneli.");

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
	description = "Ko³o zêbate? A gdzie ja niby mam je znaleŸæ?";
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
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ko³o zêbate? A gdzie ja niby mam je znaleŸæ?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nie mam pojêcia. Jestem równie bezradny co ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //W którymœ z bocznych szybów stoi zepsuty rozdrabniacz. Mo¿e tam coœ znajdziesz.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam ko³o zêbate.";
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

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mam ko³o zêbate.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Dobra robota! Powinno dzia³aæ. No a teraz wróæmy do twojej sprawy. Szukasz gniazda pe³zaczy... Hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //ZnajdŸ Asghana i powiedz mu, ¿eby otworzy³ ci drzwi. Bêdziesz móg³ rozejrzeæ siê po zamkniêtych korytarzach.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Powiedz mu "Wszystko bêdzie w porz¹dku". Po tym pozna, ¿e to ja ciê przysy³am.

	B_LogEntry		(CH2_MCEggs,	"Przynios³em Ianowi ko³o zêbate, o które prosi³. Teraz mam powiedzieæ Asghanowi, ¿e WSZYSTKO BÊDZIE W PORZ¥DKU. Wtedy Stra¿nik otworzy dla mnie bramê do opuszczonych szybów.");
	
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
	description = "Nadal szukam gniazda pe³zaczy.";
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
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Nadal szukam gniazda pe³zaczy.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Mówi³em ci ju¿ - idŸ do Asghana. To dowódca Stra¿ników. Znajdziesz go gdzieœ na najni¿szym poziomie.

	B_LogEntry		(CH2_MCEggs,	"Jeœli chcê odnaleŸæ gniazdo pe³zaczy, powinienem porozmawiaæ z Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz³em gniazdo!";
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
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Znalaz³em gniazdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //No to nareszcie bêdziemy tu mieli chwilê spokoju. Ha ha ha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez obrazy. Dobra robota, ch³opcze.
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Masz. WeŸ tê skrzynkê piwa. Zas³u¿y³eœ.
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
	description = "Znalaz³em gniazdo! I jaja z³o¿one przez królow¹ pe³zaczy!";
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
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Znalaz³em gniazdo! I jaja z³o¿one przez królow¹ pe³zaczy!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Co? Tylko tyle tych jaj? A zreszt¹... Udowodni³eœ, ¿e twardy z ciebie goœæ.
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
   description	= "Podobno Stary Obóz robi coœ w kopalni dla Bractwa.";
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
    AI_Output (other, self ,"DIA_IAN_SZPIEG_15_01"); //Podobno Stary Obóz robi coœ w kopalni dla Bractwa.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_02"); //Mo¿e, ale taki bandycki ch³ystek nie powinien nic o tym wiedzieæ.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_03"); //Masz szczêœcie, ¿e w ogóle ciê tu wpuœci³em.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_04"); //Zobaczycie. Bandyci kiedyœ polegn¹. Quentin zap³aci za swe zuchwalstwo!
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_05"); //Spróbuj tylko coœ zrobiæ w kopalni, to po¿a³ujesz!
    B_LogEntry                     (CH1_PSIcampWORK,"Ian nie chce mi zdradziæ informacji. O ma³o co wypêdzi³by mnie z kopalni. Muszê na niego uwa¿aæ.");
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
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_01"); //Zaczekaj. Jak ju¿ wybierasz siê na zewn¹trz, to bêdê mia³ dla ciebie zadanie.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_02"); //Mamy problem z dostawami ¿ywnoœci do Kopalni.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_03"); //To co dostajemy z Obozu nie zgadza siê z tym, co zamawiamy.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_04"); //Nikt z moich ludzi nie chcia³ sobie babraæ tym r¹k.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_05"); //Móg³byœ wyjaœniæ tê sprawê?
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_06"); //Jasne. Od czego mam zacz¹æ?
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_07"); //IdŸ do Starego Obozu i porozmawiaj z kucharzem Snafem.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_08"); //On przygotowuje strawê, która jest nam dostarczana.
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_09"); //Wkrótce siê tym zajmê. 
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_10"); //Mam tak¹ nadziejê.
    MIS_FoodForOldMine = LOG_RUNNING;

    Log_CreateTopic          (CH1_FoodForOldMine, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FoodForOldMine, LOG_RUNNING);
    B_LogEntry               (CH1_FoodForOldMine,"Ian zleci³ mi pewne zadanie: mam wybadaæ, dlaczego dostawy ¿ywnoœci dostarczane do Starej Kopalni nie zgadzaj¹ siê z zamówieniami. Powinienem w tym celu porozmawiaæ ze Snafem.");
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
   description	= "Problem zosta³ rozwi¹zany.";
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
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_01"); //Problem zosta³ rozwi¹zany.
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_02"); //Mirzo odprowadza³ czêœæ dostaw do Nowego Obozu. NieŸle przy tym zarobi³.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_03"); //A to gnida! Mam nadzieje, ¿e ju¿ nie bêdzie przeszkadza³?
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_04"); //Nie bêdzie.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_05"); //Bardzo dobrze. Œwietnie siê spisa³eœ, jak na nowego.
    B_LogEntry               (CH1_FoodForOldMine,"Powiedzia³em o wszystkim Ianowi. Moja rola skoñczona. ");
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
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_01"); //Hej, podejdŸ. Musimy pomówiæ.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_15_02"); //O czym?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_03"); //Krêcisz siê tu i ówdzie po ca³ej dostêpnej czêœci kopalni. Wiele widzisz i gadasz z wieloma ludŸmi.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_15_04"); //Móg³byœ mówiæ nieco jaœniej?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_13_05"); //Muszê siê czegoœ dowiedzieæ, czegoœ co nikt raczej nie powie mi wprost.
	
};


// ***************** Infos *****************************   
instance  STT_301_IAN_OBITE_PYSKI1 (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_OBITE_PYSKI1_Condition;
	information		= STT_301_IAN_OBITE_PYSKI1_Info;
	important		= 0;
	permanent		= 0;
	description     = "Co takiego niby mia³bym dla ciebie wybadaæ?";
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
	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_01"); //Co takiego niby mia³bym dla ciebie wybadaæ?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_02"); //Nasi Kopacze ostatnio nie wygl¹daj¹ najlepiej.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_03"); //Bior¹c pod uwagê ich wynagrodzenie  i dietê...
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_04"); //Bez ¿artów. Daj mi dokoñczyæ. S¹ ostatnio wyj¹tkowo powolni i ociê¿ali we wszystkim co robi¹.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_05"); //Dlaczego?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_06"); //Mo¿e od tych siniaków. Ktoœ daje im niez³ego ³upnia a wydajnoœæ ich pracy leci na ³eb.	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_07"); //Stra¿nicy siê nad nimi znêcaj¹?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_08"); //Rzecz w tym, ¿e nie. Przynajmniej to uda³o mi siê na razie ustaliæ.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI1_15_09"); //A co mówi¹ sami Kopacze?
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_10"); //Nic. Wszyscy z jakiœ powodów milcz¹. A najwiêcej ci z pyskami granatowymi od siniaków.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI1_13_11"); //Ledwo kuœtykaj¹, zamiast pracowaæ. Ca³y obóz na tym traci a to wszystko mo¿e spaœæ na mnie gdy Magnatom zmniejsz¹ siê wp³ywy.

     Info_ClearChoices (STT_301_IAN_OBITE_PYSKI1 );
	 Info_AddChoice    (STT_301_IAN_OBITE_PYSKI1 ,"Co zamierzasz?",DIA_IAN_ZLECENIE);
	
};

FUNC VOID DIA_IAN_ZLECENIE()
  {
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_00");  //Jeœli mi zap³acisz to mogê siê dowiedzieæ o co w tym chodzi.
	AI_Output (self ,other," DIA_IAN_ZLECENIE_11_01");  //Jak rozwi¹¿esz tê zagadkê to mo¿esz liczyæ na moj¹ wdziêcznoœæ.	
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_02");  //Gdzie i od kogo mam zacz¹æ poszukiwania?
	AI_Output (self ,other," DIA_IAN_ZLECENIE_11_03");  //Hmmm... Niech to bêdzie jakiœ interesowny cwaniak. Taki na pewno coœ bêdzie wiedzia³ i oczywiœcie sprzeda t¹ wiedzê za odpowiedni¹ cene.	
	AI_Output (other,self ," DIA_IAN_ZLECENIE_15_04");  //Pogadam z kimœ takim.
	
	
    AI_StopProcessInfos	     (self);
    Log_CreateTopic          (ObitePyski, LOG_MISSION);
    Log_SetTopicStatus       (ObitePyski, LOG_RUNNING);
    B_LogEntry               (ObitePyski,"Ian twierdzi, ¿e kopacze ostatnio s¹ bardzo zmaltretowani i s³aniaj¹ siê z bólu. Ich wydajnoœæ bardzo mocno spad³a. Ponoæ to nie zas³uga Stra¿ników. Muszê dowiedzieæ siê o co w tym wszystkim chodzi. Powinienem pogadaæ z jakimœ cwanym goœciem, który du¿o wie.");

};

// ***************** Obite pyski end *****************************   
instance  STT_301_IAN_OBITE_PYSKI_END (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_OBITE_PYSKI_END_Condition;
	information		= STT_301_IAN_OBITE_PYSKI_END_Info;
	important		= 0;
	permanent		= 0;
	description     = "Zbada³em sprawê pobitych kopaczy.";
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
	
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_01"); //Zbada³em sprawê pobitych kopaczy.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_02"); //Powiedz o co w tym chodzi.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_03"); //Stra¿nicy organizuj¹ nielegalne walki na platformie nad Asghanem. On o wszystkim wie ale umywa rêce bo boi siê konsekwencji tego, ¿e przymyka³ oko na ca³y proceder.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_04"); //A co tu robi ten kopacz?
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_05"); //Garp bêdzie zeznawa³ w tej sprawie. Poprze moj¹ wersje wydarzeñ jako bezpoœredni uczestnik wydarzeñ.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_06"); //Ale boi siê reakcji Stra¿ników wiêc bêdzie potrzebowa³ ochrony.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_07"); //Có¿.... Postaram siê by Stra¿nicy nie dowiedzieli siê o jego pomocy. Ale na wszelki wypadek Na razie zostanie tutaj.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_08"); //Teraz przes³ucham Garpa. A ty weŸ nagrodê za pomoc w tej sprawie.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_09"); //Dziêkuje, oby tamci Stra¿nicy dostali nauczkê.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_10"); //Dostan¹, bez obaw ch³opcze.
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_11"); //Zatem do zobaczenia...  A zaraz jeszcze jedno. 
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_12"); //Oto zapiski Cesara, to powinno go ostatecznie obci¹¿yæ win¹ za ca³e zamieszanie.
	AI_Output			(self, other,"STT_301_IAN_OBITE_PYSKI_END_13_13"); //Jeszcze raz dziêkuje. 
	AI_Output			(other, self,"STT_301_IAN_OBITE_PYSKI_END_15_14"); //Drobiazg.
	Log_SetTopicStatus       (ObitePyski, LOG_SUCCESS);
	B_LogEntry               (ObitePyski,"Wyjaœni³em Ianowi co mia³o miejsce z pokiereszowanymi Kopaczami. Garp tak jak chcia³em bêdzie œwiadkiem przy oskar¿eniu Cesara. Da³em Ianowi równie¿ zapiski Cesara. Ten wyp³aci³ mi w nagrodê pokaŸn¹ sumkê w rudzie.");
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
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_01"); //Eliott opowiada³, ¿e wykry³eœ oszustwo Winstona z broni¹ i za³atwi³eœ by ten odczepi³ siê od niego.
    AI_Output (other, self ,"DIA_IAN_Oprawca_15_02"); //To prawda.
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_03"); //Zas³u¿y³eœ na nagrodê. WeŸ te 100 bry³ek.
    AI_Output (other, self ,"DIA_IAN_Oprawca_15_04"); //Dziêki.
	B_GiveInvItems (self,other, itminugget, 100);
    AI_Output (self, other ,"DIA_IAN_Oprawca_03_05"); //Przyda³o by siê wiêcej takich zdolnych i uczciwych ludzi.
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
    AI_Output (self, other ,"DIA_IAN_DWNS_03_01"); //Ej podejdŸ no na chwilê!
    AI_Output (other, self ,"DIA_IAN_DWNS_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_IAN_DWNS_03_03"); //Dzieje siê coœ z³ego. Ktoœ nocami demoluje stoiska z rud¹ przygotowane do transportu do Starego Obozu. 
    AI_Output (other, self ,"DIA_IAN_DWNS_15_04"); //Hmm... Mo¿e poprostu ktoœ mia³ z³y dzieñ...
    AI_Output (self, other ,"DIA_IAN_DWNS_03_05"); //To nie wszystko. Nasz hutnik na dnie kopalni - W¹¿, zg³osi³ coœ przed chwil¹. Coœ ponoæ siê sta³o.
    AI_Output (other, self ,"DIA_IAN_DWNS_15_06"); //Pomówiê z Wê¿em.
    AI_Output (self, other ,"DIA_IAN_DWNS_03_07"); //Dobrze. A potem wróæ I wyjaœnij mi o co chodzi do jasnej cholery.
    AI_Output (other, self ,"DIA_IAN_DWNS_15_08"); //Dobrze.
	Log_CreateTopic		(Dywersant,	LOG_MISSION);
	Log_SetTopicStatus	(Dywersant,	LOG_RUNNING);
	B_LogEntry               (Dywersant,"Ian powiedzia³, ¿e ktoœ demoluje stoiska z rud¹ przeznaczon¹ do transportu do Starego Obozu. Ponadto W¹¿ zg³asza³ coœ jeszcze. Muszê z nim pomówiæ.");
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
   description	= "Rozmawia³em z Wê¿em.";
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
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_01"); //Rozmawia³em z Wê¿em.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_02"); //Co siê sta³o?
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_03"); //Ktoœ próbowa³ uszkodziæ piec hutniczy.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_04"); //A to sukinsyn.
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_05"); //Co teraz?
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_06"); //Mam w kopalni swojego cz³owieka. To Cieñ Robin.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_07"); //Porozmawiaj z nim. Da³em mu ju¿ pewne wskazówki. Znajdziesz go id¹c na wprost wejœcia od magazynu.
    AI_Output (other, self ,"DIA_IAN_DWNS_FUR_15_08"); //Niech bêdzie... ale co ja bêdê z tego mia³?
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_09"); //O nagrodzie porozmawiamy gdy ju¿ dowiemy siê co to za kretyn.
    AI_Output (self, other ,"DIA_IAN_DWNS_FUR_03_10"); //No... Co ty tu jeszcze robisz!
	B_LogEntry               (Dywersant,"Ian poleci³ mi zbadaæ sprawê ostatniej dywersji w kopalni. Mam pomówiæ z jego cz³owiekiem - Cieniem Robinem. Znajdê go na wprost od magazynu.");
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
   description	= "Ulbert zmusza³ Glena by robi³ szkody w kopalni. ";
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
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_01"); //Ulbert zmusza³ Glena by robi³ szkody w kopalni. Ktoœ najwyraŸniej chcê byœ straci³ posadê.
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_02"); //Ulbert? Nie wierze.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_03"); //Niekoniecznie. Kto jest stryjem Ulberta?
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_04"); //Drake.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_05"); //Zatem on za tym stoi.
    AI_Output (self, other ,"DIA_IAN_DWMN_ULBERT_03_06"); //Ka¿ê niezw³ocznie przeszukaæ Ulberta. Wróæ do mnie jutro.
    AI_Output (other, self ,"DIA_IAN_DWMN_ULBERT_15_07"); //W porz¹dku.
	B_LogEntry               (Dywersant,"Ian powiedzia³, ¿e Ulbert zostanie przszukany w sprawie zlecenia dywersji Glenowi. Oczywiœcie taki g³¹b nie móg³ byæ mózgiem ca³ej operacji. Lecz jego stryj. Okazuje siê, ¿e jest nim Drake. Mam wróciæ do Iana nastêpnego dnia I dowiedzieæ siê co siê stanie.");
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
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_02"); //ZnaleŸliœmy przy nim instrukcjê od Drake’a. Mia³o dojœæ do takich szkód by kopalnia straci³a na wydajnoœci.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_03"); //Chodzi³o o to bym straci³ posadê. A Drake zaj¹³ moje miejsce.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_04"); //Chytry plan. Ale posiada podstawowy b³¹d bo anga¿uje do tego g³upiego Ulberta.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_05"); //Dok³adnie.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_06"); //Co czeka Drake’a I Ulberta?
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_07"); //Ten sukinsyn Drake mia³ tu dot¹d takie powa¿anie, ¿e skoñczy siê pewnie tylko na bardzo pokaŸnej grzywnie.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_08"); //A Ulbert?
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_09"); //Ten g³¹b sam jest nieszkodliwy. Po co go wieszaæ skoro szkoda sznura. A nu¿ siê urwie...
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_10"); //Wyœwiadczy³eœ mi wielk¹ przys³ugê. Oto nale¿na Ci nagroda.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItAt_TrollFur, 3);
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_11"); //Dziêki.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_12"); //Postêpuj¹c tak dalej zajdziesz tu znacznie wy¿ej.
    AI_Output (self, other ,"DIA_IAN_DWMN_DRAKE_03_13"); //Do zobaczenia.
    AI_Output (other, self ,"DIA_IAN_DWMN_DRAKE_15_14"); //Na razie.
	B_LogEntry               (Dywersant,"Drake’a I Ulberta czekaj¹ bardzo surowe kary. Ale raczej unikn¹ stryczka. Ja tymczasem odebra³em pochwa³y od Iana i nale¿n¹ nagrodê.");
	B_GiveXP (290);
	Log_SetTopicStatus	(Dywersant,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};


