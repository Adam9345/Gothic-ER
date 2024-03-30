//poprawione i sprawdzone - Reflide

//****************************************************
//	Typ der den SC an der Nase herum f�hrt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------





instance DIA_SLD_753_Baloro (C_INFO)
{
	npc				= SLD_753_Baloro;
	condition		= DIA_SLD_753_Baloro_Condition;
	information		= DIA_SLD_753_Baloro_Intro_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hej, ty! Co si� dzieje?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "Cze��!";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Cze��!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Kr�cisz si� tutaj, jakby� czego� szuka�!
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Czy�by? Mmh, mo�e masz racj�. A dlaczego?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //�wietnie! Zapytaj MNIE! Mo�e mog� ci jako� pom�c!


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Co masz na my�li?";
};                       

FUNC int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))	&& (SLD_753_Baloro_SC_choice == 0) )
	{
	return 1;
	};
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Co masz na my�li?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //A czego potrzebujesz?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Na pocz�tek wystarczy dobry miecz, gruby pancerz i wst�p do kopalni.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Phi! To ma�e piwo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Mam tu co� takiego, �e oczy ci wyjd� na wierzch. Mog� ci da� bro�, kt�r� pokonasz ka�dego wroga!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //W zamian, wystarczy, �e wy�wiadczysz mi drobn� przys�ug�. To wszystko! Co ty na to?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Co mia�bym dla ciebie zrobi�?"	,DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Nie, nie! Niewa�ne! Nie jestem zainteresowany!"	,DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Co mia�bym dla ciebie zrobi�?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //To proste!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Przynie� mi 5 jab�ek, 2 butelki ry��wki, 5 butelek piwa, 3 bochenki chleba, 2 kawa�ki sera i 2 ki�cie winogron. 
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Mo�esz mi wierzy�: nie po�a�ujesz! Jak ju� m�wi�em - t� broni� pokonasz ka�dego wroga!
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Dobrze! Zobacz� co si� da zrobi�!"						,DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Nie, nie! Niewa�ne! Nie jestem zainteresowany!"	,DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Dobrze! Zobacz� co si� da zrobi�!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //To �wietnie! Tylko si� pospiesz.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //Tylko nie zapomnij: 5 jab�ek, 2 butelki ry��wki, 5 butelek piwa, 3 bochenki chleba, 2 kawa�ki sera i 2 ki�cie winogron! Jasne?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Jak s�o�ce.
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Baloro obieca� mi sprzeda� niezwykle pot�n� bro�, je�li przynios� mu 5 jab�ek, 2 butelki ry��wki, 5 butelek piwa, 3 bochenki chleba, 2 kawa�ki sera i 2 ki�cie winogron."); 

	AI_StopProcessInfos	( self );
};
	



// ********************** Ich hab�s noch nicht dabei *****************	


instance DIA_SLD_753_Baloro_habsnichtdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important	= 0;	
	permanent	= 1;
	description = "Nie uda�o mi si� jeszcze zebra� wszystkich potrzebnych ci rzeczy.";
};                       

FUNC int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if 	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Nie uda�o mi si� jeszcze zebra� wszystkich potrzebnych ci rzeczy. M�g�by� mi przypomnie�, co to mia�o by�?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Jasne. S�uchaj uwa�nie. Chc�, �eby� mi przyni�s�...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 jab�ek, 2 butelki ry��wki, 5 butelek piwa, 3 bochenki chleba, 2 kawa�ki sera i 2 ki�cie winogron! Zapami�tasz tym razem?
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Oczywi�cie! Nied�ugo wr�c�!

	AI_StopProcessInfos	( self );	
};


// ********************** Ich hab�s  dabei *****************	

instance DIA_SLD_753_Baloro_habsdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsdabei_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Mam ju� wszystko! teraz porozmawiajmy o tej niesamowitej broni, tak?";
};                       

FUNC int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if (	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&&   (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts))	
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2) )
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Mam ju� wszystko! teraz porozmawiajmy o tej niesamowitej broni, tak?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Najpierw poka� mi, co dla mnie masz.
	
	CreateInvItems(other, ItFoApple, 14);
	
	B_GiveInvItems(other, self, ItFoApple, 19); //N�tig f�r die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.
	
	Npc_RemoveInvItems ( other,ItFoBooze,2);
	Npc_RemoveInvItems ( other,ItFoBeer,5);
	Npc_RemoveInvItems ( other,ItFoLoaf,3);
	Npc_RemoveInvItems ( other,ItFoCheese,2);
	Npc_RemoveInvItems ( other,ItFo_wineberrys_01,2);
	
	Npc_RemoveInvItems ( self,ItFoApple,14);
	CreateInvItems	(self,ItFoBooze,2);
	CreateInvItems	(self,ItFoBeer,5);
	CreateInvItems	(self,ItFoLoaf,3);
	CreateInvItems	(self,ItFoCheese,2);
	CreateInvItems	(self,ItFo_wineberrys_01,2);

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Prosz� bardzo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Nooo... W porz�dku!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //A teraz bro�!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Zapomnij o tym!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Co?!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Naprawd� my�la�e�, �e dostaniesz co� w zamian? Je�li rzeczywi�cie jeste� taki g�upi, to a� ci wsp�czuj�!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Dziwi� si�, �e prze�y�e� tak d�ugo! Je�li b�dziesz wierzy� we wszystko co ci powiedz� tutejsi ludzie, nie poci�gniesz d�ugo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //A zreszt� - niewa�ne! Teraz mamy do�� jedzenia na ma�� uczt�. Wielkie dzi�ki! Mo�e si� jeszcze spotkamy! He he he!
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"By�em g�upcem, �e zaufa�em temu �garzowi! C�, dosta�em nauczk�..."); 

	Log_SetTopicStatus	(Baloros_Waffe,		LOG_SUCCESS);
	
	AI_StopProcessInfos	( self );	
};


// **********************	EXIT\ Spieler will Rechenschaft	*****************	

instance DIA_SLD_753_Baloro_letztes_Wort (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information	= DIA_SLD_753_Baloro_letztes_Wort_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Hej! Nie dam si� robi� w konia!";
	
};                       

FUNC int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hej! Nie dam si� robi� w konia!
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Czego znowu chcesz! Uciekaj st�d! Powkurzaj sobie kogo� innego, co? No ju� - spadaj!
		
			SLD_753_Baloro_SC_wills_wissen = 1	;
			
			AI_StopProcessInfos	(self);	
		
		};



// **********************	EXIT\ Spieler will�s wissen	*****************	

instance DIA_SLD_753_Baloro_SC_wills_wissen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information	= DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "hs@FF0000 Widz�, �e b�d� ci musia� da� nauczk�.";
	
};                       

FUNC int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{
	
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

FUNC VOID DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Widz�, �e b�d� ci musia� da� nauczk�.
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //No ju� - po�miali�my si� troch�, a teraz spadaj st�d! Sio!
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Chyba mnie nie zrozumia�e�!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //No dobra! Sam si� o to prosi�e�! Ostrzega�em ci�!
	
	DIA_SLD_753_Baloro_Attack () ;
	
};




// **********************	EXIT	*****************	


instance DIA_SLD_753_Baloro_Exit (C_INFO)
{
	npc			= SLD_753_Baloro;
	nr			=999;
	condition	= DIA_SLD_753_Baloro_Exit_Condition;
	information	= DIA_SLD_753_Baloro_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= "Nie, nie! Niewa�ne!";
	
};                       

FUNC int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0)	&&  (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};


FUNC VOID DIA_SLD_753_Baloro_Exit_Info()
{		
		
				if ( (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  &&   (SLD_753_Baloro_SC_choice == 0)	)  
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Nie, nie! Niewa�ne! Nie jestem zainteresowany!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //C�, jak sobie �yczysz! Marnujesz niepowtarzaln� okazj�!
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Przykro mi, ale nie mam czasu na pogaw�dki!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Och, jeste� zaj�ty! Porozmawiamy innym razem!
					};
			
	
	AI_StopProcessInfos	( self );
};


// **********************	EXIT\ wie war das mit deinem Angebot	*****************	

instance DIA_SLD_753_Baloro_Angebotdochannehmen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information	= DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Zmieni�em zdanie. Porozmawiajmy jeszcze raz o twojej propozycji.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Zmieni�em zdanie. Porozmawiajmy jeszcze raz o twojej propozycji.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //Teraz jest ju� za p�no. Mia�e� swoj� szans�!
		
			
			AI_StopProcessInfos	(self);	
		
		};

//========================================
//-----------------> WpierdolAlboKasa
//========================================

INSTANCE DIA_Baloro_WpierdolAlboKasa (C_INFO)
{
   npc          = SLD_753_Baloro;
   nr           = 1;
   condition    = DIA_Baloro_WpierdolAlboKasa_Condition;
   information  = DIA_Baloro_WpierdolAlboKasa_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Baloro_WpierdolAlboKasa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Senyan_GoldMine))
    && (Npc_GetDistToWP (self, "KARCZMA_NC") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Baloro_WpierdolAlboKasa_Info()
{
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_01"); //Ej, ty!
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_02"); //Tak, ty!
    AI_Output (other, self ,"DIA_Baloro_WpierdolAlboKasa_15_03"); //O co chodzi?
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_04"); //Gadaj, gdzie jest kopalnia, albo dostaniesz w mord�!
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_05"); //Tutaj nikt ci nie pomo�e.
    AI_Output (other, self ,"DIA_Baloro_WpierdolAlboKasa_15_06"); //Sk�d wiesz o kopalni?
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_07"); //Senyan mi powiedzia�, �e wiesz, gdzie ona jest.
    AI_Output (other, self ,"DIA_Baloro_WpierdolAlboKasa_15_08"); //Pomagasz mu?
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_09"); //Nie zadawaj g�upich pyta�!
    AI_Output (other, self ,"DIA_Baloro_WpierdolAlboKasa_15_10"); //Chwila! Nie wiem, gdzie jest ta kopalnia.
    AI_Output (other, self ,"DIA_Baloro_WpierdolAlboKasa_15_11"); //Jestem tylko po�rednikiem.
    AI_Output (self, other ,"DIA_Baloro_WpierdolAlboKasa_03_12"); //Zaczynasz mnie wkurza�.
    B_LogEntry                     (CH2_GoldMine,"Baloro rzuci� si� na mnie w karczmie. Senyan chcia� zgarn�� z�oto z kopalni dla siebie i podzieli� si� zyskami z Najemnikiem Baloro.");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Baloro_EXIT(C_INFO)
{
	npc             = SLD_753_Baloro;
	nr              = 999;
	condition	= DIA_Baloro_EXIT_Condition;
	information	= DIA_Baloro_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Baloro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Baloro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//-------------------------------------------------------------------------1.6.1--------------------------------------------

//========================================
//-----------------> Ziggy
//========================================

INSTANCE DIA_Baloro_Ziggy (C_INFO)
{
   npc          = SLD_753_Baloro;
   nr           = 1;
   condition    = DIA_Baloro_Ziggy_Condition;
   information  = DIA_Baloro_Ziggy_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Baloro_Ziggy_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Ziggy_LSZ_MUD))
{
    return TRUE;
};
};
FUNC VOID DIA_Baloro_Ziggy_Info()
{
    AI_Output (self, other ,"DIA_Baloro_Ziggy_03_01"); //O kogo my tu mamy to przecie� kumpel samego Zigg�yego!
    AI_Output (self, other ,"DIA_Baloro_Ziggy_03_02"); //Obozowego przy�upa. Dobrali�cie si� nie�le. Barany...
    AI_Output (other, self ,"DIA_Baloro_Ziggy_15_03"); //A chcesz w pysk m�dralo?
   AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_Baloro_Ziggy_03_04"); //Nie zaslugujesz nawet by skrzy�owa� z tob� or�, ofermo!
    AI_Output (other, self ,"DIA_Baloro_Ziggy_15_05"); //Jeste� zbyt pewny siebie, mo�e to pora by ci� troch� skr�ci�.
   AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
  
 
};

instance dia_baloro_pickpocket(c_info) {
    npc = sld_753_baloro;
    nr = 900;
    condition = dia_baloro_pickpocket_condition;
    information = dia_baloro_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baloro_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 30);
};

func void dia_baloro_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baloro_pickpocket);
	info_addchoice(dia_baloro_pickpocket, dialog_back, dia_baloro_pickpocket_back);
	info_addchoice(dia_baloro_pickpocket, dialog_pickpocket, dia_baloro_pickpocket_doit);
};

func void dia_baloro_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_baloro_pickpocket);
};

func void dia_baloro_pickpocket_back() {
    info_clearchoices(dia_baloro_pickpocket);
};