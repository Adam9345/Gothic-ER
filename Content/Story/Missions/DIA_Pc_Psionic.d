// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Chod�my.
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Niech �ni�cy ma ci� w swojej opiece!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Odezwa�e� si� do Guru! Nigdy wi�cej tego nie r�b, to blu�nierstwo! Je�li jaki� mistrz zechce z tob� rozmawia�, sam si� do ciebie odezwie.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Kim jeste�?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Nazywam si� Lester. Zajmuj� si� naszymi nowymi go��mi.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Masz szcz�cie, �e nie odezwa�e� si� do Baal Namiba. Obcym nie wolno rozmawia� z Guru.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Ale ja musz� porozmawia� z twoim mistrzem.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ale ja musz� porozmawia� z twoim mistrzem.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Nie pr�buj! Gwarantuj� ci, �e potrafi� udzieli� ci wszystkich potrzebnych informacji.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Opowiedz mi o waszym Obozie.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Opowiedz mi o waszym Obozie.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //A co chcesz wiedzie�?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Opowiedz mi o tutejszych kastach.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mo�esz mi powiedzie� o �ni�cym?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mo�esz mi powiedzie� o bagiennym zielu?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Opowiedz mi o tutejszych kastach.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Najwy�sz� kast� stanowi� Guru. To niezwykle pot�ni duchowi przyw�dcy naszego Obozu. Stra�nicy �wi�tyni wykorzystuj� si�� swego ducha w walce.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Ich cia�o i duch funkcjonuj� w idealnej harmonii. Lepiej nie wchod� im w drog�. Ja natomiast jestem Nowicjuszem. Naszym zadaniem jest wykonywanie wszystkich pomniejszych zada�, no i oczywi�cie �arliwa modlitwa do �ni�cego.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Niekt�rzy Nowicjusze dost�pili zaszczytu pobierania nauk u Guru, ale aby to osi�gn��, trzeba s�u�y� w Obozie przynajmniej kilka lat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mo�esz mi powiedzie� o �ni�cym?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //�ni�cy to boska istota, kt�ra zsy�a nam wizje objawiaj�ce jego wol�. W ka�dym razie zsy�a je Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlimy si� do niego, bo obieca� zwr�ci� nam wolno��.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //I wierzycie mu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jestem w tej Kolonii od dw�ch lat. Wiesz jak d�ugie mog� si� wyda� DWA LATA w wi�zieniu?!
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nie wyobra�asz sobie w co by�bym w stanie uwierzy�, byle tylko wydosta� si� z tego przekl�tego miejsca!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co mo�esz mi powiedzie� o bagiennym zielu?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //C�, ziele ro�nie wy��cznie na bagnach. Zanim da si� je pali�, trzeba je odpowiednio przetworzy�. Tym w�a�nie zajmuj� si� Nowicjusze.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Ziele ma dzia�anie relaksuj�ce i uspokajaj�ce. Dzi�ki niemu mo�na osi�gn�� stan umys�u pozwalaj�cy na nawi�zanie kontaktu ze �ni�cym.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Cz�� zebranego ziela wymieniamy ze Starym Obozem. Tam te� pozyskujemy nowych cz�on�w Bractwa.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Wielu z nich do��cza do nas tylko ze wzgl�du na ziele, ale przynajmniej pomagaj� nam w pracy.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Chcia�bym zosta� cz�onkiem Bractwa.";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chcia�bym zosta� cz�onkiem Bractwa.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //O tym, czy mo�esz zosta� jednym z nich zadecyduje Cor Kalom.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Ale on polega zwykle na opinii pozosta�ych Guru. Baal Namib na przyk�ad jest jednym z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Najpierw musisz udowodni�, �e jeste� godny, by nale�e� do Bractwa. Dopiero wtedy Guru wy�l� ci� do Cor Kaloma.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Jak mam tego dokona�, je�li �aden z Guru nie chce si� do mnie odezwa�?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak mam tego dokona�, je�li �aden z Guru nie chce si� do mnie odezwa�?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Chocia� trudno w to uwierzy�, Guru b�d� obserwowali ka�dy tw�j krok.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Je�li uznaj�, �e zas�ugujesz na zostanie jednym z nas, sami si� do ciebie odezw�.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Z pewno�ci� znajdziesz w Obozie wiele okazji, by udowodni� swoj� przydatno��.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Je�li chc� do��czy� do Bractwa �ni�cego, musz� przekona� do siebie kilu Guru. Niestety, ci nie chc� rozmawia� z nowoprzyby�ymi. Nowicjusz Lester uprzedzi� mnie, �e mimo to ka�dy m�j ruch jest obserwowany i �e powinienem spr�bowa� zrobi� na nich dobre wra�enie. Tylko jak niby mam to zrobi�?! Na pocz�tek rozejrz� si� troch� po Obozie Bractwa.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Jak mog� sk�oni� twojego mistrza do rozmowy ze mn�?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);

	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Jak mog� sk�oni� twojego mistrza do rozmowy ze mn�?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Musisz wiedzie�, co chcia�by us�ysze�?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A co chcia�by us�ysze�?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Kiedy nast�pnym razem b�dziemy blisko niego, zwr�cisz si� do mnie i porozmawiamy chwil�.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib martwi si�, gdy� wielu Nowicjuszy opr�cz modlitwy do �ni�cego czci jeszcze starych bog�w.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Powiesz mi, �e wyrzek�e� si� innych b�stw i od tej pory zamierzasz wznosi� mod�y wy��cznie do �ni�cego.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Wtedy ja zapytam dlaczego podj��e� tak� decyzj�, a ty odpowiesz, �e prze�y�e� wizj�, w kt�rej �ni�cy wzywa� ci� do siebie.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //To go powinno zainteresowa�. My�lisz, �e dasz sobie rad�?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Oczywi�cie!
	
	B_LogEntry	(CH1_JoinPsi, "Aby przekona� do siebie Baal Namiba, mam zwr�ci� si� do Lestera, gdy wielki Guru b�dzie w pobli�u porozmawia� z nim o bogach i �ni�cym.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);

	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //ACH! MI�O CI� ZN�W WIDZIE�. CO U CIEBIE S�YCHA�?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "WYRZEK�EM SI� STARYCH BOG�W!";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //WYRZEK�EM SI� STARYCH BOG�W!
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //CZY�BY? CO CI� SK�ONI�O DO TAK DRASTYCZNYCH KROK�W?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //PRZE�Y�EM OBJAWIENIE: �NI�CY ZWR�CI� SI� DO MNIE...
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //I CO POWIEDZIA�?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //POWIEDZIA�: ID� DO OBOZU NA BAGNIE I PRZY��CZ SI� DO BRACTWA.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JESTE� SZCZʌLIWYM CZ�OWIEKIEM, NIEZNAJOMY: TYLKO NIELICZNI DOST�PILI TAKIEJ NAGRODY.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Jak znajd� najwa�niejsze miejsca w Obozie?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak znajd� najwa�niejsze miejsca w Obozie?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Mog� ci pokaza� wszystko, co warto tu obejrze�.
};

// **************************************************
//				F�HRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Daleko jeszcze?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Daleko jeszcze?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Jakby� mi nie przeszkadza�, dawno byliby�my na miejscu.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE �NDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Rozmy�li�em si�.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmy�li�em si�.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Wiesz, gdzie mnie znale��.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------F�HRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka� mi jak doj��..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Poka� mi jak doj��...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... z powrotem do g��wnej bramy",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... do ku�ni.",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... do �wi�tyni.",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... do nauczycieli.",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... do laboratorium alchemicznego.",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... do ku�ni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Chod� za mn�!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... do �wi�tyni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Chod� za mn�!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... do nauczycieli.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Chod� za mn�!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... do laboratorium alchemicznego.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Chod� za mn�!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Tam znajdziesz Baal Cadara. To on naucza Nowicjuszy.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Nad nami znajduje si� plac treningowy �wi�tynnych Stra�nik�w. Zaczekam na ciebie na dole, albo u Baal Namiba, przy wej�ciu do Obozu.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Oto �wi�tynia! Zaczekam na ciebie tutaj, ale gdyby� zamarudzi�, znajdziesz mnie przy wej�ciu do Obozu.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Jeste�my w ku�ni. Rozejrzyj si� troch�. B�d� czeka� przez jak�� godzin�. P�niej znajdziesz mnie przy wej�ciu do Obozu.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauth�ndler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Na g�rze tej drabiny znajdziesz laboratorium alchemiczne Cor Kaloma. Tu na dole rezyduje Fortuno, handlarz zielem.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Zaczekam na ciebie tutaj. Tylko nie marud� zbyt d�ugo, bo wr�c� do Baal Namiba.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= TRUE;
	permanent		= FALSE;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral f�r alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	&& 	(Npc_GetTrueGuild(hero) != GIL_SFB) 
	&&  (Npc_GetTrueGuild(hero) != GIL_VLK)
	&&  !(Npc_KnowsInfo(hero,PC_Psionic_SEND))
    &&  (kapitel == 1)	//fix 
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Ciesz� si�, �e ci� widz�. Mam dla ciebie wiadomo��.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Mam nadziej�, �e dobr�?
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Nasze Bractwo przygotowuje si� do wielkiego wydarzenia.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Jakiego wydarzenia? Planujecie ucieczk�?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru pr�buj� skontaktowa� si� ze �ni�cym, ale potrzebuj� czego�, co zjednoczy ich duchowe si�y.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //I co dalej?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Poszukuj� magicznego artefaktu, kamienia ogniskuj�cego.
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_07"); //Ponadto jeden z Guru dozna� wizji w kt�rej objawi� mu si� rytua� przywo�ania pos�a�ca �ni�cego. 

		B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czemu mia�bym by� tym zainteresowany?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Czemu mia�bym by� tym zainteresowany?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Porozmawiaj koniecznie z Ja�nie O�wieconym Y'Berionem. To twoja wielka szansa, �eby spojrza� na ciebie �askawym okiem.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Gdzie mog� go znale��?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Id� do �wi�tyni. Bardzo rzadko j� opuszcza. Pewnie w tych zimnych ruinach czuje si� bli�ej �ni�cego ni� gdzie indziej.
	
	MIS_MessengerRecall = LOG_RUNNING;

   Log_CreateTopic		(CH2_MessengerRecall, LOG_MISSION);
   Log_SetTopicStatus(CH2_MessengerRecall, LOG_RUNNING);
   B_LogEntry				(CH2_MessengerRecall, "Lester zaczepi� mnie i zacz�� co� m�wi� o wielkich rzeczach, przywo�aniu �ni�cego i jakiego� jego pos�a�ca. Aby wzi�� udzia� w tym wielkim wydarzeniu powinienem pogada� z Y'Berionem, kt�ry zdradzi mi wi�cej o tym ca�ym pos�a�cu. ");
	
	
	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,	"Nowicjusz Lester powiedzia� mi, �e Y'Berion poszukuje magicznego kamienia ogniskuj�cego. Guru przebywa wewn�trz �wi�tynnego wzg�rza.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;

};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tu robisz?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Przybywam z polecenia Mag�w Wody. Szukam magicznych artefakt�w zwanych kamieniami ogniskuj�cymi.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Szukasz kamieni ogniskuj�cych, tak? Odwa�ny jeste�.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas i pozostali magowie z Nowego Obozu zamierzaj� wykorzysta� ich moc, by wysadzi� w powietrze Barier� i zwr�ci� nam wolno��.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Jak zobacz� to uwierz�...
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Tu si� zgadzamy... Ale powiedz, czemu ty tu przyszed�e�?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zastanawiam si�, czy warto zaryzykowa� wypraw� do G�rskiej Fortecy.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Wiesz... jest tam pewien dokument, kt�ry chcia�bym odzyska�, ale taka wyprawa mo�e si� okaza� bardzo niebezpieczna.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak ci si� uda�o przej�� przez t� �yw� g�r�?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak ci si� uda�o przej�� przez t� �yw� g�r�?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Pobiera�em nauki u najlepszych Guru. Ich magia potrafi by� bardzo przydatna.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ten dokument, kt�rego szukasz... Co to jest?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ten dokument, kt�rego szukasz... Co to jest?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Wiele lat temu w�adca tych ziem rezydowa� w G�rskiej Fortecy, sk�d kontrolowa� kopalni� i okoliczne tereny.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Jak wszyscy mo�ni, posiada� w swoich zbiorach dokument, kt�ry po�wiadcza� jego prawo do tych ziem. Zamierzam odnale�� to pismo.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Przecie� tak d�ugo, jak b�dziemy uwi�zieni wewn�trz Bariery, ten dokument nie b�dzie wart z�amanego grosza!
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Wiem. Ale pr�dzej czy p�niej magowie zdo�aj� przerwa� Barier�. Wtedy ten kawa�ek papieru zapewni mi dostatnie �ycie na d�ugie lata.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mogliby�my wsp�lnie rozejrze� si� po Fortecy!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Mogliby�my wsp�lnie rozejrze� si� po Fortecy!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Niez�y pomys�. Prowad�. P�jd� za tob�.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,	"Przed pot�n� G�rsk� Fortec� spotka�em Lestera. Szuka� pewnego dokumentu i postanowi� tymczasowo do mnie do��czy�.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Patrz, chyba mia�e� racj� co do tego kamienia ogniskuj�cego.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Racja, to rzeczywi�cie wygl�da na punkt ogniskuj�cy... Ale nie �atwo go b�dzie dosi�gn��...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,	"Kamie�, kt�rego szukam, spoczywa na piedestale. Nie dam rady wdrapa� si� tam. Musz� znale�� jaki� inny spos�b na zdobycie artefaktu.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL �BER DIE BR�CKE OHNE DEN AUFTRAG ERF�LLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Dok�d si� wybierasz? Jeszcze nie sko�czyli�my!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem ranny. Mo�esz mi pom�c?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jestem ranny. Mo�esz mi pom�c?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //We� ten nap�j uzdrawiaj�cy.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE F�R LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em dokument!"; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Znalaz�em dokument!
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Dobra robota! Przyjmij te zwoje magiczne jako wyraz mojej wdzi�czno�ci. Przy ich pomocy uda ci si� dotrze� do kamienia.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Zaczekam na ciebie przy platformie.

	B_LogEntry		(CH3_Fortress,	"Akt w�asno�ci, kt�rego szuka� Lester, znajdowa� si� w jednej ze skrzy�. Nowicjusz da� mi za niego cztery zwoje z zakl�ciem telekinezy, kt�re pomog� mi zdoby� kamie�.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mam dosi�gn�� tego kamienia?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Jak mam dosi�gn�� tego kamienia?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistrz Y'Berion zwyk� mawia�: Ucze� pr�buje przesuwa� przedmioty r�kami i nogami. Mistrz porusza je si�� swego ducha.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Zostan� tutaj jeszcze troch� i poszukam dokumentu.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //P�jd� rozejrze� si� na g�rze.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Teraz obaj mamy to, po co przyszli�my. Chcia�bym tu jeszcze troch� zosta�, poczyta� stare ksi�gi.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Do nast�pnego spotkania!

	B_LogEntry		(CH3_Fortress,	"Zabra�em kamie�. Lester chce si� jeszcze troch� rozejrze� po Fortecy. Ciekawe, kiedy go znowu zobacz�.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�e� co�?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Znalaz�e� co�?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Tamta skrzynia jest zamkni�ta. Mo�e uda si� nam gdzie� znale�� klucz.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Znalaz�e� ju� ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Nie, jeszcze nie...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Zagl�da�e� ju� do biblioteki?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przeszukajmy t� Fortec� razem."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Przeszukajmy t� Fortec� razem.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobrze, id� przodem!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Bj�rn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Spotka�em Diego i Miltena przed Starym Obozem!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Co s�ycha�?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tu robisz?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Stara Kopalnia zosta�a zalana przez podziemn� rzek�!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//I co z tego?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Wszyscy Magowie Ognia zgin�li!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez kaza� ich zamordowa�.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Nie �atwo b�dzie to teraz odkr�ci�!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Spotka�em Diego i Miltena przed Starym Obozem!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Chce si� z tob� spotka�, tam gdzie zawsze.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Najwy�szy czas!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//I co teraz?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Zostan� tutaj, �eby przejrze� stare ksi�gi.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Eee... Nie rozumiem...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistrz Y'Berion zwyk� mawia�: Ucze� pr�buje przesuwa� przedmioty r�kami i nogami. Mistrz porusza je si�� swego ducha.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dobrze, dobrze. Zrozumia�em aluzj�.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Uwa�aj na siebie.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Dzi�kuj�. Musz� ju� rusza� w dalsz� drog�.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Niech �ni�cy ma ci� w swojej opiece!
	
	B_LogEntry			(CH4_4Friends,		"Poinformowa�em Lestera o spotkaniu z ich przyjaci�mi."); 
		
	B_GiveXP			(XP_MessageForGorn);
/*
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowa�em Lestera i Gorna o spotkaniu z ich przyjaci�mi. Moje zadanie sko�czone. Dalej b�d� musieli radzi� sobie sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
		MIS_4Friends = true;
	};

*/
	// if (Npc_KnowsInfo (hero, DIA_PC_Fighter_FREE_AND_FREE))
	// {
	// Npc_ExchangeRoutine (PC_PSIONIC,"spotkanie");
	// };
	AI_StopProcessInfos(self);
	
};

//========================================
//-----------------> RUNY_INFOS
//========================================

INSTANCE DIA_PC_Psionic_RUNY_INFOS (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_RUNY_INFOS_Condition;
   information  = DIA_PC_Psionic_RUNY_INFOS_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�, Lesterze? (zagadaj o runach)";
};

FUNC INT DIA_PC_Psionic_RUNY_INFOS_Condition()
{
    if (MIS_NEW_GOD == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_RUNY_INFOS_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_RUNY_INFOS_15_01"); //Co s�ycha�, Lesterze?
    AI_Output (self, other ,"DIA_PC_Psionic_RUNY_INFOS_03_02"); //S�ysza�em �e uda�o ci si� zdoby� uznanie samego Mistrza Y'Beriona. Ca�kiem nie�le, jak na kogo� kto jest tu od niedawna.
    AI_Output (other, self ,"DIA_PC_Psionic_RUNY_INFOS_15_03"); //Tak... Wasz Ob�z jest bardzo ciekawym miejscem. Momentami �a�uj�, �e do��czy�em do Mag�w Ognia zamiast do Bractwa.
    AI_Output (self, other ,"DIA_PC_Psionic_RUNY_INFOS_03_04"); //Nie ma co p�aka� nad rozlanym mlekiem, przyjacielu. Przecie� i tak nam pomagasz. Odk�d pozby�e� si� kr�lowej pe�zaczy ze Starej Kopalni i zdoby�e� jaja moi bracia uwa�aj� ci� za bohatera. 
    AI_Output (other, self ,"DIA_PC_Psionic_RUNY_INFOS_15_05"); //Hej, w�a�ciwie to mam �wietny pomys�! Jestem magiem i mog� zg��bi� tajniki magii runicznej wszystkich rodzaj�w magii. Nie wiesz w jaki spos�b mog� zdoby� jak�� run�?
    AI_Output (self, other ,"DIA_PC_Psionic_RUNY_INFOS_03_06"); //Z tego co wiem runy sprzedaje Baal Cadar.
    AI_Output (other, self ,"DIA_PC_Psionic_RUNY_INFOS_15_07"); //Tak, ale s� one bardzo drogie. Jako skromny s�uga Innosa nie mam do�� rudy.
    AI_Output (self, other ,"DIA_PC_Psionic_RUNY_INFOS_03_08"); //No c�, w takim razie mo�e powiniene� pom�wi� z moim mistrzem, Baal Namibem. Mo�e zechce podzieli� si� z tob� wiedz�.
    B_LogEntry                     (CH2_New_God,"Powinienem porozmawia� z Baal Namibem na temat run. Mo�e uda mi si� jedn� dosta�.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};


//#####################################################################################
//####### ROZDZIA� 5
//####### SPOTKANIE
//#####################################################################################
//========================================
//-----------------> PODAREK_LESTER
//========================================

INSTANCE DIA_Ash_PODAREK_LESTER (C_INFO)
{
   npc          = PC_PSIONIC;
   nr           = 1;
   condition    = DIA_Ash_PODAREK_LESTER_Condition;
   information  = DIA_Ash_PODAREK_LESTER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ash_PODAREK_LESTER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_pc_mage_PODAREK_MILTEN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ash_PODAREK_LESTER_Info()
{
    AI_Output (self, hero  ,"DIA_Ash_PODAREK_LESTER_03_01"); //Kogo ja widz�, to� to nasz bohater.
    AI_Output (self, hero  ,"DIA_Ash_PODAREK_LESTER_03_02"); //Ciesz� si�, �e przyby�e�. Zaczyna�em si� niepokoi�.
    AI_Output (hero, self  ,"DIA_Ash_PODAREK_LESTER_03_03"); //Jak wida� dotar�em.
    AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_04"); //Tak, to oznacza, �e teraz jeste� jednym z nas, na co w pe�ni zas�ugujesz.
	AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_05"); //Mam dla ciebie drobny podarek, w imi� przyja�ni.
	AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_06"); //We� ten wywar z wn�trzno�ci pe�zaczy. 
	AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_07"); //Znalaz�em go przypadkiem w mojej chacie, gdy pakowa�em si� na wypraw� do G�rskiej Fortecy.
	AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_08"); //Cor Kalom warzy� takie dla Nowicjuszy, w celu wzmocnienia ich kontaktu ze �ni�cym.
    AI_Output (self, other ,"DIA_Ash_PODAREK_LESTER_03_09"); //Powinien zwi�kszy� twoje si�y mentalne.
	AI_Output (hero, self  ,"DIA_Ash_PODAREK_LESTER_03_10"); //Dzi�ki!
	CreateInvItems (self, ItFo_Potion_Elixier_Egg, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Elixier_Egg, 1);
	B_LogEntry                     (CH4_4Friends,"Lester obdarowa� mnie napojem z wn�trzno�ci pe�zaczy. Wreszcie dowiem si�, jakim �wi�stwem Cor Kalom odurza� Nowicjuszy.");
	//AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LORE_BRACTWO
//========================================

INSTANCE DIA_PC_Psionic_LORE_BRACTWO (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 2;
   condition    = DIA_PC_Psionic_LORE_BRACTWO_Condition;
   information  = DIA_PC_Psionic_LORE_BRACTWO_Info;
   permanent	= FALSE;
   description	= "Co s�ycha� w Bractwie?";
};

FUNC INT DIA_PC_Psionic_LORE_BRACTWO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_LORE_BRACTWO_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_LORE_BRACTWO_15_01"); //Co s�ycha� w Bractwie?
    AI_Output (self, other ,"DIA_PC_Psionic_LORE_BRACTWO_03_02"); //Szczerze m�wi�c nie mam poj�cia.
    AI_Output (self, other ,"DIA_PC_Psionic_LORE_BRACTWO_03_03"); //Odk�d wybra�em si� do G�rskiej Fortecy, nie mia�em kontaktu z �adnym z moich braci.
    AI_Output (self, other ,"DIA_PC_Psionic_LORE_BRACTWO_03_04"); //Za kilka dni zamierzam uda� si� z wizyt� do mojego mistrza, Baal Namiba. 
  
};

//========================================
//-----------------> ANGAR
//========================================

INSTANCE DIA_PC_Psionic_ANGAR (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 3;
   condition    = DIA_PC_Psionic_ANGAR_Condition;
   information  = DIA_PC_Psionic_ANGAR_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Cor Angarze?";
};

FUNC INT DIA_PC_Psionic_ANGAR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_ANGAR_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_ANGAR_15_01"); //Co mo�esz mi powiedzie� o Cor Angarze?
    AI_Output (self, other ,"DIA_PC_Psionic_ANGAR_03_02"); //My�l�, �e  dobrze b�dzie zast�powa� Y'Beriona. 
    AI_Output (self, other ,"DIA_PC_Psionic_ANGAR_03_03"); //Jest rozs�dny, twardy, a zarazem wyrozumia�y.
    AI_Output (self, other ,"DIA_PC_Psionic_ANGAR_03_04"); //Ciesz� si�, �e Kalom opu�ci� Bractwo. Nie b�dzie zara�a� innych swoim jadem.
    AI_Output (other, self ,"DIA_PC_Psionic_ANGAR_15_05"); //My�la�em, �e szanowa�e� Cor Kaloma.
    AI_Output (self, other ,"DIA_PC_Psionic_ANGAR_03_06"); //Tak by�o, ale ten go�� chyba za bardzo si� wczu� w to wszystko.
    AI_Output (self, other ,"DIA_PC_Psionic_ANGAR_03_07"); //A co do Cor Angara, to wierz�, �e zaprowadzi porz�dek w Bractwie.
	
};

//========================================
//-----------------> SLEPPER
//========================================

INSTANCE DIA_PC_Psionic_SLEPPER (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 4;
   condition    = DIA_PC_Psionic_SLEPPER_Condition;
   information  = DIA_PC_Psionic_SLEPPER_Info;
   permanent	= FALSE;
   description	= "�ni�cy naprawd� istnieje.";
};

FUNC INT DIA_PC_Psionic_SLEPPER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_SLEPPER_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_SLEPPER_15_01"); //�ni�cy naprawd� istnieje. Zosta� przyzwany do tego �wiata przez ork�w.
    AI_Output (self, other ,"DIA_PC_Psionic_SLEPPER_03_02"); //Co?! Nie mog� w to uwierzy�!
    AI_Output (self, other ,"DIA_PC_Psionic_SLEPPER_03_03"); //Jak mogli�my by� tacy �lepi! 
    AI_Output (other, self ,"DIA_PC_Psionic_SLEPPER_15_04"); //Spoczywa u�piony od wiek�w w �wi�tyni pod miastem ork�w.
    AI_Output (self, other ,"DIA_PC_Psionic_SLEPPER_03_05"); //To ca�kiem blisko st�d. Mam nadzieje, �e nigdy nie zostanie zbudzony.
    AI_Output (other, self ,"DIA_PC_Psionic_SLEPPER_15_06"); //Nie �udzi�bym si�, wydaje mi si�, �e Cor Kalom dosta� si� do �wi�tyni.
    AI_Output (self, other ,"DIA_PC_Psionic_SLEPPER_03_07"); //Lepiej szybko powstrzymaj tego szale�ca!
    AI_Output (other, self ,"DIA_PC_Psionic_SLEPPER_15_08"); //Nie martw si�, postaram si� tym zaj��. 
	
};

//========================================
//-----------------> WHY_PSICAMP
//========================================

INSTANCE DIA_PC_Psionic_WHY_PSICAMP (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 5;
   condition    = DIA_PC_Psionic_WHY_PSICAMP_Condition;
   information  = DIA_PC_Psionic_WHY_PSICAMP_Info;
   permanent	= FALSE;
   description	= "Dlaczego do��czy�e� akurat do obozu na bagnie?";
};

FUNC INT DIA_PC_Psionic_WHY_PSICAMP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_WHY_PSICAMP_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_WHY_PSICAMP_15_01"); //Dlaczego do��czy�e� akurat do obozu na bagnie?
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_02"); //D�ugo w��czy�em si� po innych obozach, szukaj�c wygodnego dla mnie �ycia.
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_03"); //Jednak ka�dy ob�z mia� swoje wady i zalety.
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_04"); //Mia�em m�tlik w g�owie. Nie wiedzia�em co zrobi�. 
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_05"); //Z braku lepszych pomys��w do��czy�em do Bractwa. 
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_06"); //Uda�o mi si� wymiga� od pracy jako zbieracz na bagnie. 
    AI_Output (self, other ,"DIA_PC_Psionic_WHY_PSICAMP_03_08"); //My�la�em p�niej nad zmian�, ale ciesze si�, �e ostatecznie zrezygnowa�em. 
};

//========================================
//-----------------> CASTLE
//========================================

INSTANCE DIA_PC_Psionic_CASTLE (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 6;
   condition    = DIA_PC_Psionic_CASTLE_Condition;
   information  = DIA_PC_Psionic_CASTLE_Info;
   permanent	= FALSE;
   description	= "Co zamierzasz zrobi� ze swoj� siedzib�?";
};

FUNC INT DIA_PC_Psionic_CASTLE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Psionic_CASTLE_Info()
{
    AI_Output (other, self ,"DIA_PC_Psionic_CASTLE_15_01"); //Co zamierzasz zrobi� ze swoj� siedzib�?
    AI_Output (self, other ,"DIA_PC_Psionic_CASTLE_03_02"); //Po mojej kr�tkiej wizycie w Bractwie zamierzam zadomowi� si� tam na dobre.
    AI_Output (self, other ,"DIA_PC_Psionic_CASTLE_03_03"); //Mam przeczucie, �e ju� wkr�tce Bariera upadnie.
    AI_Output (self, other ,"DIA_PC_Psionic_CASTLE_03_04"); //Wtedy sp�dz� reszt� swojego �ycia w dostatku i bogactwie.
    AI_Output (other, self ,"DIA_PC_Psionic_CASTLE_15_05"); //Tego ci �ycz�.
    AI_Output (self, other ,"DIA_PC_Psionic_CASTLE_03_06"); //Zawsze b�dziesz mile widzianym go�ciem, przyjacielu. 
};


//-------------------------------------------------------------------------------------------SUBMOD------------------------------------------------------------


// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_Zabojstwo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_Zabojstwo_Condition;
	information	= DIA_Lester_Zabojstwo_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC int  DIA_Lester_Zabojstwo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Brago_Medalion))
    &&  (Ucieczka_Brago_Day<=(Wld_GetDay()-1)) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Zabojstwo_Info()
{

    AI_Output (self, other,"DIA_Lester_Zabojstwo_05_01"); //Dziwie ci si�, �e mo�esz by� tak spokojny!
	AI_Output (other, self,"DIA_Lester_Zabojstwo_15_02"); //A niby czemu mia�bym taki nie by�?
	AI_Output (self, other,"DIA_Lester_Zabojstwo_05_03"); //Cho�by dlatego, �e jeste� g��wnym podejrzanym o kilka wyst�pk�w w tym zab�jstwo.
	NOV_40001_Mosul.attribute[ATR_HITPOINTS] = 0;
	    Info_ClearChoices (DIA_Lester_Zabojstwo);
	    Info_AddChoice    (DIA_Lester_Zabojstwo,"CO?!",DIA_Lester_Co);
		
};



FUNC VOID DIA_Lester_Co()
  {
     AI_Teleport(NOV_40000_Brago, "WP_BRAGO_TAVERN");   
	AI_Output               (other,self ,"DIA_Lester_Co_15_00");  //CO?!
	AI_Output               (self ,other,"DIA_Lester_Co_11_01");  //Nowicjusz Mosul zosta� zamordowany ostatniej nocy. Nied�ugo przed zab�jstwem widziano wasz� b�jk�. Ale to nie koniec.
	AI_Output               (other,self ,"DIA_Lester_Co_15_02");  //M�w dalej!
	AI_Output               (self ,other,"DIA_Lester_Co_11_03");  //Mosul otrzyma� �miertelne rany no�em, kt�ry kupi�e� u Melvina. No i jest jeszcze sprawa okradzenia Joru.
	AI_Output               (self ,other,"DIA_Lester_Co_11_04");  //Brago zezna�, �e to twoja sprawka. 
	AI_Output               (other,self ,"DIA_Lester_Co_15_05");  //Ten sukinsyn wszystko ukartowa�! To on jest morderc�! Musze go dorwa� i oczy�ci� si� z zarzut�w.
	AI_Output               (self ,other,"DIA_Lester_Co_11_06");  //Najpierw porozmawiaj z Baalem Namibem. To on nadzoruje spraw� morderstwa.
	AI_Output               (self ,other,"DIA_Lester_Co_11_07");  //Ja te� z nim pom�wi�. Dowie si� ode mnie, �e najprawdopodobniej to nie ty za tym stoisz. Ale to wci�� ma�o.
	AI_Output               (self ,other,"DIA_Lester_Co_11_08");  //A co do Brago to nie znajdziesz go w obozie. O �wicie po�piesznie opu�ci� ob�z. 
	AI_Output               (other,self ,"DIA_Lester_Co_15_09");  //Wiadomo co� wi�cej?
	AI_Output               (self ,other,"DIA_Lester_Co_11_10");  //Tu� przed nim do Starej Kopalni wyruszyli Stra�nicy �wi�tynni. Pom�w z Gor Na Drakiem. Mo�e on wie w kt�r� stron� poszed� Brago.
	AI_Output               (other,self ,"DIA_Lester_Co_15_11");  //Dzi�ki przyjacielu. Ratujesz mi sk�r�!
	Info_ClearChoices       (DIA_Lester_Zabojstwo);  
    
	 NAMIB_MOSULKILL = TRUE;
	 Npc_ExchangeRoutine            (NOV_40000_Brago,"Ucieczka");
	 B_LogEntry                     (ZlodziejskaWspolpraca,"Lester powiedzia� mi �e Nowicjusz Mosul zosta� zamordowany ostatniej nocy. Dokonano tego no�em, kt�ry kupi�em od Melvina. Pono� widziano wcze�niej moj� b�jk� z Mosulem i to ja jestem g��wnym podejrzanym. Na dodatek ten sukinsyn Brago zezna�, �e okrad�em Joru. To wszystko to jego sprawka! Musze jako� oczy�ci� si� z zarzut�w.");
	 AI_StopProcessInfos  	        (self);
};




// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_Koniec_Brago (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_Koniec_Brago_Condition;
	information	= DIA_Lester_Koniec_Brago_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC int  DIA_Lester_Koniec_Brago_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_BaalNamib_GIT))

	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Koniec_Brago_Info()
{

    AI_Output (self, other,"DIA_Lester_Koniec_Brago_05_00"); //A wi�c wszystko dobrze si� sko�czy�o.
	AI_Output (other, self,"DIA_Lester_Koniec_Brago_15_01"); //Tak. Ale gdyby nie ty to teraz ca�a Sekta chcia�aby mnie wypatroszy�.
	AI_Output (self, other,"DIA_Lester_Koniec_Brago_05_02"); //Istotnie.
	AI_Output (other, self,"DIA_Lester_Koniec_Brago_15_03"); //Jestem twoim d�u�nikiem.
	AI_Output (self, other,"DIA_Lester_Koniec_Brago_05_04"); //Drobiazg. Ja pomog�em tobie a ty kiedy� pomo�esz mi.
	AI_Output (other, self,"DIA_Lester_Koniec_Brago_15_05"); //Postaram si�.
	   
};


// **************************************************
//					Cenne znalezisko
// **************************************************

instance  DIA_Lester_AMULET_PSI (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_AMULET_PSI_Condition;
	information	= DIA_Lester_AMULET_PSI_Info;
	permanent	= 0;
	description   = "Mam pewien interesuj�cy medalion...";
};                       

FUNC int  DIA_Lester_AMULET_PSI_Condition()
{
	if (Npc_HasItems(hero, Amulett_BrandickS)>=1)
    && (Npc_KnowsInfo (hero ,GRD_261_Brandick_PSI_AMULET))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_AMULET_PSI_Info()
{

    AI_Output (other, self,"DIA_Lester_AMULET_PSI_15_01"); //Mam pewien interesuj�cy medalion. Mo�esz mi co� wi�cej powiedzie� na jego temat?
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_02"); //Poka� mi go.
	AI_Output (other, self,"DIA_Lester_AMULET_PSI_15_03"); //Prosz�.
	B_GiveInvItems (other,self,Amulett_BrandickS, 1);
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_04"); //Hmmm... Wygl�da mi na medalion �wi�tynnego wojownika, kt�ry wzmacnia si�y witalne posiadacza.
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_05"); //Ale jest powa�nie uszkodzony, a co za tym idzie niemal bezu�yteczny.
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_06"); //A tak w�a�ciwie to sk�d go masz?
	AI_Output (other, self,"DIA_Lester_AMULET_PSI_15_07"); //Jeden z waszych Stra�nik�w �wi�tynnych zgin�� w Starej Kopalni. T� b�yskotk� znaleziono przy jego zw�okach.
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_08"); //A wi�c tak to wygl�da. C�, by� mo�e jednak jest szansa, �e ten medalion da si� zreperowa�.
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_09"); //Ale niestety, nie mog� ci w tym pom�c. Musisz pom�wi� z kt�rym� z Baal�w. Mo�e to by� chocia�by Baal Orun.
	AI_Output (self, other,"DIA_Lester_AMULET_PSI_05_10"); //Jednak musisz go najpierw przekona� do rozmowy z tob�. Masz z powrotem medalion.
	B_GiveInvItems (self,other,Amulett_BrandickS, 1);
	AI_Output (other, self,"DIA_Lester_AMULET_PSI_15_11"); //Co� wymy�l�, dzi�ki za rad�.
    B_LogEntry               (CiekaweZnalezisko,"Rozmawia�em z Lesterem. Powiedzia�, �e uszkodzony medalion zwi�ksza si�y witalne posiadacza. My�l�, �e warto si� tym zainteresowa�. Lester poleci� mi porozmawia� z kt�rym� z Baal�w na przyk�ad z Orunem.");

};


//========================================
//-----------------> KH_Hear
//========================================

INSTANCE DIA_Pc_Psionic_KH_Hear (C_INFO)
{
   npc          = Pc_Psionic;
   nr           = 1;
   condition    = DIA_Pc_Psionic_KH_Hear_Condition;
   information  = DIA_Pc_Psionic_KH_Hear_Info;
   permanent	= FALSE;
   description	= "S�ysza�e� co� o tak zwanej Koronie Hrodgira?";
};

FUNC INT DIA_Pc_Psionic_KH_Hear_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Connor_KH_Sekta))
{
    return TRUE;
};
};
FUNC VOID DIA_Pc_Psionic_KH_Hear_Info()
{
    AI_Output (other, self ,"DIA_Pc_Psionic_KH_Hear_15_01"); //S�ysza�e� co� o tak zwanej Koronie Hrodgira?
    AI_Output (self, other ,"DIA_Pc_Psionic_KH_Hear_03_02"); //Niewiele. To pono� cenny przedmiot. Ale Baal Cadar powinien wiedzie� wi�cej.
    AI_Output (self, other ,"DIA_Pc_Psionic_KH_Hear_03_03"); //Jedyne informacj� jakie posiadam o tej koronie pochodz� w�a�nie od niego.
    AI_Output (other, self ,"DIA_Pc_Psionic_KH_Hear_15_04"); //Wielkie dzi�ki.
    AI_Output (self, other ,"DIA_Pc_Psionic_KH_Hear_03_05"); //Swoj� drog� to oznaka wielkiej buty � sporz�dzi� sobie koron� samemu nie b�d�c kr�lem.
    AI_Output (other, self ,"DIA_Pc_Psionic_KH_Hear_15_06"); //To prawda.
	B_LogEntry               (KoronaHrodgira,"Lester powiedzia�, �e Baal Cadar wie wi�cej o koronie Hrodgira. Musz� z nim pogada�.");
    AI_StopProcessInfos	(self);
};
//--------------------------------------------------------------Wi�zanka Dla Cor Caloma

//========================================
//-----------------> WDC_CalomGuard
//========================================
var int Calom_GWarn;
INSTANCE DIA_Pc_Psionic_WDC_CalomGuard (C_INFO)
{
   npc          = Pc_Psionic;
   nr           = 1;
   condition    = DIA_Pc_Psionic_WDC_CalomGuard_Condition;
   information  = DIA_Pc_Psionic_WDC_CalomGuard_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o ochroniarzu Cor Caloma?";
};

FUNC INT DIA_Pc_Psionic_WDC_CalomGuard_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Templer_WDC))
{
    return TRUE;
};
};
FUNC VOID DIA_Pc_Psionic_WDC_CalomGuard_Info()
{
    AI_Output (other, self ,"DIA_Pc_Psionic_WDC_CalomGuard_15_01"); //Co mo�esz mi powiedzie� o ochroniarzu Cor Caloma?
    AI_Output (self, other ,"DIA_Pc_Psionic_WDC_CalomGuard_03_02"); //To bardzo dobry wojownik. Wyr�ni� si� na tyle, �e teraz pilnuje tak wa�nej osobisto�ci w naszym Bractwie.
    AI_Output (other, self ,"DIA_Pc_Psionic_WDC_CalomGuard_15_03"); //A co� jeszcze?
    AI_Output (self, other ,"DIA_Pc_Psionic_WDC_CalomGuard_03_04"); //Jest bardzo dumny i pewny siebie. Ma tylko �al, �e nigdy nie zosta� mistrzem naszej areny.
    AI_Output (self, other ,"DIA_Pc_Psionic_WDC_CalomGuard_03_05"); //Gdyby us�ysza�, �e organizuj� tu turniej to pobieg�by z wywieszonym j�zorem by stan�� w szranki.
    AI_Output (other, self ,"DIA_Pc_Psionic_WDC_CalomGuard_15_06"); //Hmm... Licz� na dos�owno�� tego stwierdzenia.
	Calom_GWarn = TRUE;
	 B_LogEntry               (WiazankaDlaCorCaloma,"Lester powiedzia�, �e ambicja ochroniarza Caloma zawsze by�o stani�cie w szranki na arenie Bractwa I zdobycie tytu�u czempiona. Chyba mu powiem, �e takowy w�a�nie si� zaczyna...");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BG
//========================================

INSTANCE DIA_PC_Psionic_BG (C_INFO)
{
   npc          = PC_Psionic;
   nr           = 1;
   condition    = DIA_PC_Psionic_BG_Condition;
   information  = DIA_PC_Psionic_BG_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Psionic_BG_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_TPL)
{
    return TRUE;
};
};
FUNC VOID DIA_PC_Psionic_BG_Info()
{
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_01"); //Mamy problem.
    AI_Output (other, self ,"DIA_PC_Psionic_BG_15_02"); //C�, na tym �wiecie to chleb powszedni. O co chodzi?
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_03"); //Bagienne golemy podchodz� niebezpiecznie blisko obozu od strony bagna.
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_04"); //W efekcie stracili�my ju� paru ludzi. To nie mo�e si� powtarza�.
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_05"); //Te bestie strasznie si� rozzuchwali�y.
    AI_Output (other, self ,"DIA_PC_Psionic_BG_15_06"); //Chyba wiem co masz na my�li...
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_07"); //Znam cz�owieka, kt�ry specjalizuje si� w zabijaniu tych stwor�w. Ale obawiam si�, �e ma wiele na g�owie.
    AI_Output (other, self ,"DIA_PC_Psionic_BG_15_08"); //Kto to taki?
    AI_Output (self, other ,"DIA_PC_Psionic_BG_03_09"); //Wojownik �wi�tynny Gor Na Pol. Opanowa� sztuk� zabijania b�otnych w�y I bagiennych golem�w do perfekcji.
    AI_Output (other, self ,"DIA_PC_Psionic_BG_15_10"); //Porozmawiam z nim.
	Log_CreateTopic		(BagienneGolemy,	LOG_MISSION);
	Log_SetTopicStatus	(BagienneGolemy,	LOG_RUNNING);
	B_LogEntry               (BagienneGolemy,"Lester poninformowa�, �e pojawi�y si� ataki ze strony bagiennych golem�w na mieszka�c�w obozu. Te stwory podchodz� coraz bli�ej i zabijaj� nowicjuszy. Powinienem pom�wi� z Gor Na Polem on zna si� na zabijaniu bagiennych golem�w.");
};
















