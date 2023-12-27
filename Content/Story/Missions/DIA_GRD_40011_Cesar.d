

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_Exit (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 999;
	condition	= DIA_GRD_40011_Cesar_Exit_Condition;
	information	= DIA_GRD_40011_Cesar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GRD_40011_Cesar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_40011_Cesar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
	var int Cesar_Kopacz1;
	var int Cesar_Kopacz2;
	var int Cesar_Kopacz3;
	var int Cesar_Kopacz4;
// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_LeaveMe (C_INFO)
{
	npc				= GRD_40011_Cesar;
	nr				= 2;
	condition		= DIA_GRD_40011_Cesar_LeaveMe_Condition;
	information		= DIA_GRD_40011_Cesar_LeaveMe_Info;
	permanent		= 0;
	description		= "Witaj. S³ysza³em, ¿e organizujesz walki.";
};

FUNC int DIA_GRD_40011_Cesar_LeaveMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_VLK_40010_Elton_Cesar))
	
{
    return TRUE;
};
};
FUNC VOID DIA_GRD_40011_Cesar_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_00"); //Witaj. S³ysza³em, ¿e organizujesz walki.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_01"); //To dobrze s³ysza³eœ. Mo¿esz œwietnie zarobiæ i do tego wy³adowaæ na kimœ swoj¹ z³oœæ, obijaj¹c mu gêbê.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_02"); //Ile konkretnie mogê zarobiæ.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_03"); //Za pierwszego przeciwnika 10 bry³ek. Za drugiego 20, za trzeciego 50 a za pokonanie mistrza otrzymasz a¿ 300 bry³ek!.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_04"); //Brzmi nieŸle.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_05"); //To co chcesz siê biæ?
    AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_06"); //Powiedzmy ¿e tak.
	AI_GotoWP(VLK_40012_Kopacz,"WP_MINE_ARENA");
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_07"); //W takim razie czas na debiut. Dobrze idŸ i pokonaj pierwszego przeciwnika.
	AI_StopProcessInfos	(self);
    B_LogEntry               (ObitePyski,"Rozmawia³em z Cesarem. Zaproponowa³em swój udzia³ w walkach a ten obieca³ mi z³ote góry. Muszê stan¹æ w szranki i spróbowaæ dojœæ jak najdalej w hierarchii walcz¹cych.");

	
	Cesar_Kopacz1 = LOG_RUNNING;
	Cesar_Kopacz2 = LOG_RUNNING;
	Cesar_Kopacz3 = LOG_RUNNING;
	Cesar_Kopacz4 = LOG_RUNNING;
	
	var C_NPC Kopacz1; 	Kopacz1 = Hlp_GetNpc(VLK_40012_Kopacz);			Kopacz1.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kopacz1.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kopacz2;	Kopacz2 = Hlp_GetNpc(VLK_40013_Kopacz);		    Kopacz2.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kopacz2.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kopacz3;	Kopacz3 = Hlp_GetNpc(VLK_40014_Kopacz);	        Kopacz3.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	    Kopacz3.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kopacz4;	Kopacz4 = Hlp_GetNpc(VLK_40015_Kopacz);	        Kopacz4.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	    Kopacz4.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	
	Npc_ExchangeRoutine            (VLK_40012_Kopacz,"Walka1");
};





// **************************************************
// 					 Kopacz1 SUCCESS
// **************************************************

INSTANCE DIA_Cesar_Kopacz1Success (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_Cesar_Kopacz1Success_Condition;
	information	= DIA_Cesar_Kopacz1Success_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT DIA_Cesar_Kopacz1Success_Condition()
{
	var C_NPC Kopacz1; 	Kopacz1 = Hlp_GetNpc(VLK_40012_Kopacz);			

	if ( (Cesar_Kopacz1 == LOG_RUNNING) && (Kopacz1_Charged == TRUE) && ( (Kopacz1.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kopacz1.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )  
	{
		return 1;
	};
};

FUNC VOID DIA_Cesar_Kopacz1Success_Info()
{
	var C_NPC Kopacz1; 	Kopacz1 = Hlp_GetNpc(VLK_40012_Kopacz);	
	
	AI_Output (self,other,"DIA_Cesar_Kopacz1Success_15_00"); //Czyli ju¿ po walce!
	if(Kopacz1.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKopacz1 = true;
		AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_01"); //A wiêc przegra³eœ.
	    AI_Output (other, self,"DIA_Cesar_Kopacz1Success_15_02"); //Có¿, nie jestem jak¹œ chodz¹c¹ machin¹ wojenn¹.
	    AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_03"); //Pierwsze koty za p³oty. Jesteœ nowy, widzê w tobie potencja³.
	    AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_04"); //Zawsze mo¿esz powtórzyæ walkê.
	    AI_Output (other, self,"DIA_Cesar_Kopacz1Success_15_05"); //Zatem tak w³aœnie uczyniê.
	
		Cesar_Kopacz1 = LOG_FAILED;
			Npc_ExchangeRoutine            (VLK_40012_Kopacz,"Walka");
		
	}
	else if (Kopacz1.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz1 = true;
		AI_Output (self,other,"DIA_Cesar_Kopacz1Success_01_06"); //NieŸle oto 10 bry³ek.
		AI_Output (other,self,"DIA_Cesar_Kopacz1Success_15_07"); //Dziêki.
		B_GiveInvItems (self,other, ItMiNugget, 10);
		
		Npc_ExchangeRoutine            (VLK_40012_Kopacz,"FMstart");
		Info_ClearChoices (DIA_Cesar_Kopacz1Success);
	    Info_AddChoice    (DIA_Cesar_Kopacz1Success,"Daj mi drugiego przeciwnika.",DIA_GRD_40011_Cesar_WalkaS);
		
		Cesar_Kopacz1 = LOG_SUCCESS;
		Kopacz1.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};


FUNC VOID DIA_GRD_40011_Cesar_WalkaS()
  {
   AI_Output (other, self,"DIA_GRD_40011_Cesar_WalkaS_15_01"); //Daj mi drugiego przeciwnika.
   AI_GotoWP(VLK_40013_Kopacz,"WP_MINE_ARENA");
   AI_Output (self, other,"DIA_GRD_40011_Cesar_WalkaS_01_02"); //Wci¹ga co? W takim razie walcz o ile starczy ci si³.
	
	Npc_ExchangeRoutine            (VLK_40013_Kopacz,"Walka");
    AI_StopProcessInfos	           (self);
  
};

// **************************************************
// 					 Kopacz2 SUCCESS
// **************************************************

INSTANCE DIA_Cesar_Kopacz2Success (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_Cesar_Kopacz2Success_Condition;
	information	= DIA_Cesar_Kopacz2Success_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT DIA_Cesar_Kopacz2Success_Condition()
{
	var C_NPC Kopacz2; 	Kopacz2 = Hlp_GetNpc(VLK_40013_Kopacz);			

	if ( (Cesar_Kopacz2 == LOG_RUNNING) && (Kopacz2_Charged == TRUE) && ( (Kopacz2.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kopacz2.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )  
	{
		return 1;
	};
};

FUNC VOID DIA_Cesar_Kopacz2Success_Info()
{
	var C_NPC Kopacz2; 	Kopacz2 = Hlp_GetNpc(VLK_40013_Kopacz);	
	
	AI_Output (self,other,"DIA_Cesar_Kopacz2Success_15_00"); //Hm... 
	if(Kopacz2.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKopacz2 = true;
		AI_Output (self, other,"DIA_Cesar_Kopacz2Success_01_01"); //A wiêc przegra³eœ.
	    AI_Output (other, self,"DIA_Cesar_Kopacz2Success_15_02"); //No có¿...   	
		Cesar_Kopacz2 = LOG_FAILED;
			Npc_ExchangeRoutine            (VLK_40013_Kopacz,"FMstart");
		
	}
	else if (Kopacz2.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz2 = true;
		AI_Output (self,other,"DIA_Cesar_Kopacz2Success_01_03"); //Dobrze, 20 bry³ek jest twoje.
		AI_Output (other,self,"DIA_Cesar_Kopacz2Success_15_04"); //Dziêki.
		B_GiveInvItems (self,other, ItMiNugget, 20);
		
			Npc_ExchangeRoutine            (VLK_40013_Kopacz,"FMstart");
		Info_ClearChoices (DIA_Cesar_Kopacz2Success);
	    Info_AddChoice    (DIA_Cesar_Kopacz2Success,"Chce dalej walczyæ.",DIA_GRD_40011_Cesar_Walka2M);
		
		Cesar_Kopacz2 = LOG_SUCCESS;
		Kopacz2.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};


FUNC VOID DIA_GRD_40011_Cesar_Walka2M()
  {
  
  
    AI_Output (other,self,"DIA_GRD_40011_Cesar_Walka2M_01_01"); //Chce dalej walczyæ.
	AI_GotoWP(VLK_40014_Kopacz,"WP_MINE_ARENA");
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka2M_01_02"); //No proszê, zatem poka¿ na co ciê staæ.
	Npc_ExchangeRoutine            (VLK_40014_Kopacz,"Walka");
    AI_StopProcessInfos	           (self);
  
};

// **************************************************
// 					 Kopacz3 SUCCESS
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_Walka3 (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_GRD_40011_Cesar_Walka3_Condition;
	information	= DIA_GRD_40011_Cesar_Walka3_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT DIA_GRD_40011_Cesar_Walka3_Condition()
{
	var C_NPC Kopacz3; 	Kopacz3 = Hlp_GetNpc(VLK_40014_Kopacz);			

	if ( (Cesar_Kopacz3 == LOG_RUNNING) && (Kopacz3_Charged == TRUE) && ( (Kopacz3.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kopacz3.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )  
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_40011_Cesar_Walka3_Info()
{
	var C_NPC Kopacz3; 	Kopacz3 = Hlp_GetNpc(VLK_40014_Kopacz);	
	
	AI_Output (self,other,"DIA_GRD_40011_Cesar_Walka3_15_00"); //Hm...
	if(Kopacz3.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKopacz3 = true;
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka3_01_01"); //A wiêc przegra³eœ.
	    AI_Output (other, self,"DIA_GRD_40011_Cesar_Walka3_15_02"); //No có¿...   	
		Cesar_Kopacz3 = LOG_FAILED;
		Npc_ExchangeRoutine            (VLK_40014_Kopacz,"FMstart");
		
	}
	else if (Kopacz3.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz3 = true;
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka3_01_03"); //Dobry jesteœ. WeŸ tê rudê. 50 bry³ek to zawsze niez³a sumka.

		B_GiveInvItems (self,other, ItMiNugget, 50);
		Npc_ExchangeRoutine            (VLK_40014_Kopacz,"FMstart");
		
	Info_ClearChoices (DIA_GRD_40011_Cesar_Walka3);
	Info_AddChoice    (DIA_GRD_40011_Cesar_Walka3,"Chcê walczyæ z mistrzem.",DIA_GRD_40011_Cesar_Walka2MF);
		
		Cesar_Kopacz3 = LOG_SUCCESS;
		Kopacz3.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};
	
FUNC VOID DIA_GRD_40011_Cesar_Walka2MF()
{
  
  
    AI_Output (other, self,"DIA_GRD_40011_Cesar_Walka2MF_15_02"); //Chcê walczyæ z mistrzem.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka2MF_01_03"); //No i prawid³owo. Spróbuj zatem szczêœcia skoro doszed³eœ a¿ tutaj...
	Npc_ExchangeRoutine            (VLK_40015_Kopacz,"Walka");
    AI_StopProcessInfos	           (self);
  
};
 
//CHAMPION

// **************************************************
// 					 Kopacz3 SUCCESS
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_Mistrz (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_GRD_40011_Cesar_Mistrz_Condition;
	information	= DIA_GRD_40011_Cesar_Mistrz_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT DIA_GRD_40011_Cesar_Mistrz_Condition()
{
	var C_NPC Kopacz4; 	Kopacz4 = Hlp_GetNpc(VLK_40015_Kopacz);			

	if ( (Cesar_Kopacz4 == LOG_RUNNING) && (Kopacz4_Charged == TRUE) && ( (Kopacz4.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kopacz4.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )  
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_40011_Cesar_Mistrz_Info()
{
	var C_NPC Kopacz4; 	Kopacz4 = Hlp_GetNpc(VLK_40015_Kopacz);	
	
	AI_Output (self,other,"DIA_GRD_40011_Cesar_Mistrz_15_00"); //Hm...
	if(Kopacz4.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKopacz4 = true;
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_01"); //A wiêc przegra³eœ.
	    AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_02"); //No có¿... chyba bardziej nie da³o siê tego spartaczyæ.  	
		Cesar_Kopacz4 = LOG_FAILED;
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine            (VLK_40015_Kopacz,"START");
	}
	else if (Kopacz4.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz3 = true;
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_01"); //A wiêc mamy nowego czempiona...
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_02"); //Dla takiej rudy by³o warto nastawiaæ karku.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_03"); //Tak ale mam dla ciebie smutn¹ wiadomoœæ.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_04"); //Jak¹?
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_05"); //Najwiêcej zak³adów przyjmuje w trakcie walki. A ty bez nale¿nej czci pobi³eœ mojego mistrza w parê sekund.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_06"); //Bêdê to musia³ sobie odbiæ. Niestety twoim kosztem.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_07"); //Co to znaczy?.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_08"); //W³aœciwie nie jestem ci nic winny. Ale znaj moje naiwne serce i weŸ te 5 bry³ek na os³odê, hehe.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_09"); //Ty...
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_10"); //No co robaczku?! Mam ciê wzi¹æ pod but? A mo¿e maj¹ to zrobiæ moi ludzie?
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_11"); //Jeszcze pogadamy.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_12"); //Na pewno. Ale piœnij s³ówko  o tym co tu widzia³eœ Ianowi a bêdziesz trupem! 
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_13"); //Poza tym chce ciê widzieæ jak przyprowadzasz mi nowego naiwniak... Znaczy gladiatora.
	AI_StopProcessInfos	(self);
	B_GiveInvItems (self,other, ItMiNugget, 5);
    Npc_ExchangeRoutine            (VLK_40015_Kopacz,"START");
    B_LogEntry               (ObitePyski,"Pokona³em dotychczasowego mistrza. Cesar nie wyp³aci³ mi obiecanej nagrody za walkê bezczelnie twierdz¹c , ¿e z powodu jej krótkoœci prawie nikt nie zd¹¿y³ jej obstawiæ.");

		
		Cesar_Kopacz4 = LOG_SUCCESS;
		Kopacz4.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};

// **************************************************
// 					 Kopacz3 SUCCESS
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_Attack (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_GRD_40011_Cesar_Attack_Condition;
	information	= DIA_GRD_40011_Cesar_Attack_Info;
	permanent	= 0;
	description = "Tak czy siak twoi ludzie pozostawili nas sam na sam.";
};                       

FUNC INT DIA_GRD_40011_Cesar_Attack_Condition()
{
	

	if   (Npc_KnowsInfo (hero, DIA_GRD_278_Gardist_LeaveMe1)) 
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_40011_Cesar_Attack_Info()
{

	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_02"); //Tak czy siak twoi ludzie pozostawili nas sam na sam.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_03"); //Czego chcesz pokrako? Masz dla mnie nowych walcz¹cych?
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_04"); //Nie.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_05"); //To niedobrze. Jak moi ludzie wróc¹ to skopi¹ ci dupê. Albo lepiej ja to zrobiê.
	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_07"); //Dobrze siê sk³ada. Albo oddasz mi swoje notatki albo porachuje ci koœci.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_08"); //Trzymajcie mnie bo umrê ze œmiechu. Ty, nêdzny karaluchu œmiesz mi groziæ?!
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_09"); //Tak, stawaj do walki.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_10"); //Sam siê o to prosi³eœ!
	CreateInvItem (GRD_40011_Cesar, ItMi_ZapiskiCesara);	
	AI_StopProcessInfos	           (self);
	
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    B_LogEntry               (ObitePyski,"Po za³atwieniu sprawy towarzyszy Cesara pomówi³em z nim. Nie chcia³ on oddaæ mi zapisków po dobroci wiêc go pobi³em.");

};


// **************************************************
// 					 Kopacz3 SUCCESS
// **************************************************

INSTANCE DIA_GRD_40011_Cesar_Attack1 (C_INFO)
{
	npc			= GRD_40011_Cesar;
	nr			= 1;
	condition	= DIA_GRD_40011_Cesar_Attack1_Condition;
	information	= DIA_GRD_40011_Cesar_Attack1_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT DIA_GRD_40011_Cesar_Attack1_Condition()
{
	

	if   (Npc_KnowsInfo (hero, STT_301_IAN_OBITE_PYSKI_END)) 
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_40011_Cesar_Attack1_Info()
{

	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack1_15_01"); //O widzê, ¿e zmieni³eœ wdzianko na kapkê wygodniejsze...
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack1_01_02"); //Oszczêdzaj oddech póki mo¿esz. Ten popapraniec Ian zdegradowa³ mnie na prostego Kopacza i zniszczy³ ca³y œwietnie prosperuj¹cy interes.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack1_01_03"); //Ale wiedz, ¿e raz na wozie raz pod wozem! Nied³ugo znów wyjdzie na moje a wtedy ty pierwszy skoñczysz z mieczem w brzuchu!	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack1_15_04"); //Nie mogê siê doczekaæ... Kopaczu.
	

};


//========================================
//-----------------> HI_CESAR
//========================================

INSTANCE DIA_Cesar_HI_CESAR (C_INFO)
{
   npc          = GRD_40011_Cesar;
   nr           = 1;
   condition    = DIA_Cesar_HI_CESAR_Condition;
   information  = DIA_Cesar_HI_CESAR_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Cesar_HI_CESAR_Condition()
{
if !(Npc_KnowsInfo(hero,STT_301_IAN_OBITE_PYSKI))
{
    return TRUE;
};
};
FUNC VOID DIA_Cesar_HI_CESAR_Info()
{
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_02"); //Kimœ wa¿nym jak widaæ. 
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_03"); //I?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_04"); //Na razie niech Ci to wystarczy. 
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_05"); //Ale wkrótce mog¹ mieæ dla ciebie pewn¹ ofertê. Bo aktualnie mam wystarczaj¹co chêtnych.
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_06"); //Chêtnych na co?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_07"); //Nie lubiê siê powtarzaæ... Dodam, ¿e jestem kimœ kto chce byœ na razie siê oddali³ I nie k³apa³ zbytnio szczêk¹.
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_08"); //Jak sobie chcesz.
    AI_StopProcessInfos	(self);
};




























































