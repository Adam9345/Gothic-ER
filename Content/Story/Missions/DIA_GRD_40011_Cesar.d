

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
	description		= "Witaj. S�ysza�em, �e organizujesz walki.";
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
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_00"); //Witaj. S�ysza�em, �e organizujesz walki.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_01"); //To dobrze s�ysza�e�. Mo�esz �wietnie zarobi� i do tego wy�adowa� na kim� swoj� z�o��, obijaj�c mu g�b�.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_02"); //Ile konkretnie mog� zarobi�.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_03"); //Za pierwszego przeciwnika 10 bry�ek. Za drugiego 20, za trzeciego 50 a za pokonanie mistrza otrzymasz a� 300 bry�ek!.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_04"); //Brzmi nie�le.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_05"); //To co chcesz si� bi�?
    AI_Output (other, self,"DIA_GRD_40011_Cesar_LeaveMe_15_06"); //Powiedzmy �e tak.
	AI_GotoWP(VLK_40012_Kopacz,"WP_MINE_ARENA");
	AI_Output (self, other,"DIA_GRD_40011_Cesar_LeaveMe_01_07"); //W takim razie czas na debiut. Dobrze id� i pokonaj pierwszego przeciwnika.
	AI_StopProcessInfos	(self);
    B_LogEntry               (ObitePyski,"Rozmawia�em z Cesarem. Zaproponowa�em sw�j udzia� w walkach a ten obieca� mi z�ote g�ry. Musz� stan�� w szranki i spr�bowa� doj�� jak najdalej w hierarchii walcz�cych.");

	
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
	
	AI_Output (self,other,"DIA_Cesar_Kopacz1Success_15_00"); //Czyli ju� po walce!
	if(Kopacz1.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
	PokonanyPrzezKopacz1 = true;
		AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_01"); //A wi�c przegra�e�.
	    AI_Output (other, self,"DIA_Cesar_Kopacz1Success_15_02"); //C�, nie jestem jak�� chodz�c� machin� wojenn�.
	    AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_03"); //Pierwsze koty za p�oty. Jeste� nowy, widz� w tobie potencja�.
	    AI_Output (self, other,"DIA_Cesar_Kopacz1Success_01_04"); //Zawsze mo�esz powt�rzy� walk�.
	    AI_Output (other, self,"DIA_Cesar_Kopacz1Success_15_05"); //Zatem tak w�a�nie uczyni�.
	
		Cesar_Kopacz1 = LOG_FAILED;
			Npc_ExchangeRoutine            (VLK_40012_Kopacz,"Walka");
		
	}
	else if (Kopacz1.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz1 = true;
		AI_Output (self,other,"DIA_Cesar_Kopacz1Success_01_06"); //Nie�le oto 10 bry�ek.
		AI_Output (other,self,"DIA_Cesar_Kopacz1Success_15_07"); //Dzi�ki.
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
   AI_Output (self, other,"DIA_GRD_40011_Cesar_WalkaS_01_02"); //Wci�ga co? W takim razie walcz o ile starczy ci si�.
	
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
		AI_Output (self, other,"DIA_Cesar_Kopacz2Success_01_01"); //A wi�c przegra�e�.
	    AI_Output (other, self,"DIA_Cesar_Kopacz2Success_15_02"); //No c�...   	
		Cesar_Kopacz2 = LOG_FAILED;
			Npc_ExchangeRoutine            (VLK_40013_Kopacz,"FMstart");
		
	}
	else if (Kopacz2.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz2 = true;
		AI_Output (self,other,"DIA_Cesar_Kopacz2Success_01_03"); //Dobrze, 20 bry�ek jest twoje.
		AI_Output (other,self,"DIA_Cesar_Kopacz2Success_15_04"); //Dzi�ki.
		B_GiveInvItems (self,other, ItMiNugget, 20);
		
			Npc_ExchangeRoutine            (VLK_40013_Kopacz,"FMstart");
		Info_ClearChoices (DIA_Cesar_Kopacz2Success);
	    Info_AddChoice    (DIA_Cesar_Kopacz2Success,"Chce dalej walczy�.",DIA_GRD_40011_Cesar_Walka2M);
		
		Cesar_Kopacz2 = LOG_SUCCESS;
		Kopacz2.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};


FUNC VOID DIA_GRD_40011_Cesar_Walka2M()
  {
  
  
    AI_Output (other,self,"DIA_GRD_40011_Cesar_Walka2M_01_01"); //Chce dalej walczy�.
	AI_GotoWP(VLK_40014_Kopacz,"WP_MINE_ARENA");
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka2M_01_02"); //No prosz�, zatem poka� na co ci� sta�.
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
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka3_01_01"); //A wi�c przegra�e�.
	    AI_Output (other, self,"DIA_GRD_40011_Cesar_Walka3_15_02"); //No c�...   	
		Cesar_Kopacz3 = LOG_FAILED;
		Npc_ExchangeRoutine            (VLK_40014_Kopacz,"FMstart");
		
	}
	else if (Kopacz3.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz3 = true;
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka3_01_03"); //Dobry jeste�. We� t� rud�. 50 bry�ek to zawsze niez�a sumka.

		B_GiveInvItems (self,other, ItMiNugget, 50);
		Npc_ExchangeRoutine            (VLK_40014_Kopacz,"FMstart");
		
	Info_ClearChoices (DIA_GRD_40011_Cesar_Walka3);
	Info_AddChoice    (DIA_GRD_40011_Cesar_Walka3,"Chc� walczy� z mistrzem.",DIA_GRD_40011_Cesar_Walka2MF);
		
		Cesar_Kopacz3 = LOG_SUCCESS;
		Kopacz3.aivar[AIV_WASDEFEATEDBYSC] == false;	


	};
};
	
FUNC VOID DIA_GRD_40011_Cesar_Walka2MF()
{
  
  
    AI_Output (other, self,"DIA_GRD_40011_Cesar_Walka2MF_15_02"); //Chc� walczy� z mistrzem.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Walka2MF_01_03"); //No i prawid�owo. Spr�buj zatem szcz�cia skoro doszed�e� a� tutaj...
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
		AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_01"); //A wi�c przegra�e�.
	    AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_02"); //No c�... chyba bardziej nie da�o si� tego spartaczy�.  	
		Cesar_Kopacz4 = LOG_FAILED;
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine            (VLK_40015_Kopacz,"START");
	}
	else if (Kopacz4.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
	PokonanyKopacz3 = true;
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_01"); //A wi�c mamy nowego czempiona...
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_02"); //Dla takiej rudy by�o warto nastawia� karku.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_03"); //Tak ale mam dla ciebie smutn� wiadomo��.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_04"); //Jak�?
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_05"); //Najwi�cej zak�ad�w przyjmuje w trakcie walki. A ty bez nale�nej czci pobi�e� mojego mistrza w par� sekund.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_06"); //B�d� to musia� sobie odbi�. Niestety twoim kosztem.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_07"); //Co to znaczy?.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_08"); //W�a�ciwie nie jestem ci nic winny. Ale znaj moje naiwne serce i we� te 5 bry�ek na os�od�, hehe.
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_09"); //Ty...
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_10"); //No co robaczku?! Mam ci� wzi�� pod but? A mo�e maj� to zrobi� moi ludzie?
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Mistrz_15_11"); //Jeszcze pogadamy.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_12"); //Na pewno. Ale pi�nij s��wko  o tym co tu widzia�e� Ianowi a b�dziesz trupem! 
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Mistrz_01_13"); //Poza tym chce ci� widzie� jak przyprowadzasz mi nowego naiwniak... Znaczy gladiatora.
	AI_StopProcessInfos	(self);
	B_GiveInvItems (self,other, ItMiNugget, 5);
    Npc_ExchangeRoutine            (VLK_40015_Kopacz,"START");
    B_LogEntry               (ObitePyski,"Pokona�em dotychczasowego mistrza. Cesar nie wyp�aci� mi obiecanej nagrody za walk� bezczelnie twierdz�c , �e z powodu jej kr�tko�ci prawie nikt nie zd��y� jej obstawi�.");

		
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
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_03"); //Czego chcesz pokrako? Masz dla mnie nowych walcz�cych?
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_04"); //Nie.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_05"); //To niedobrze. Jak moi ludzie wr�c� to skopi� ci dup�. Albo lepiej ja to zrobi�.
	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_07"); //Dobrze si� sk�ada. Albo oddasz mi swoje notatki albo porachuje ci ko�ci.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_08"); //Trzymajcie mnie bo umr� ze �miechu. Ty, n�dzny karaluchu �miesz mi grozi�?!
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack_15_09"); //Tak, stawaj do walki.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack_01_10"); //Sam si� o to prosi�e�!
	CreateInvItem (GRD_40011_Cesar, ItMi_ZapiskiCesara);	
	AI_StopProcessInfos	           (self);
	
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    B_LogEntry               (ObitePyski,"Po za�atwieniu sprawy towarzyszy Cesara pom�wi�em z nim. Nie chcia� on odda� mi zapisk�w po dobroci wi�c go pobi�em.");

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

	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack1_15_01"); //O widz�, �e zmieni�e� wdzianko na kapk� wygodniejsze...
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack1_01_02"); //Oszcz�dzaj oddech p�ki mo�esz. Ten popapraniec Ian zdegradowa� mnie na prostego Kopacza i zniszczy� ca�y �wietnie prosperuj�cy interes.
	AI_Output (self, other,"DIA_GRD_40011_Cesar_Attack1_01_03"); //Ale wiedz, �e raz na wozie raz pod wozem! Nied�ugo zn�w wyjdzie na moje a wtedy ty pierwszy sko�czysz z mieczem w brzuchu!	
	AI_Output (other, self,"DIA_GRD_40011_Cesar_Attack1_15_04"); //Nie mog� si� doczeka�... Kopaczu.
	

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
   description	= "Kim jeste�?";
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
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_02"); //Kim� wa�nym jak wida�. 
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_03"); //I?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_04"); //Na razie niech Ci to wystarczy. 
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_05"); //Ale wkr�tce mog� mie� dla ciebie pewn� ofert�. Bo aktualnie mam wystarczaj�co ch�tnych.
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_06"); //Ch�tnych na co?
    AI_Output (self, other ,"DIA_Cesar_HI_CESAR_03_07"); //Nie lubi� si� powtarza�... Dodam, �e jestem kim� kto chce by� na razie si� oddali� I nie k�apa� zbytnio szcz�k�.
    AI_Output (other, self ,"DIA_Cesar_HI_CESAR_15_08"); //Jak sobie chcesz.
    AI_StopProcessInfos	(self);
};




























































