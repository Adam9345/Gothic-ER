//poprawione i sprawdzone -  

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Darrion_Exit (C_INFO)
{
	npc			=  Nov_1312_Darrion;
	nr			=  999;
	condition	=  DIA_Darrion_Exit_Condition;
	information	=  DIA_Darrion_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Darrion_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Hallo
// **************************************************

instance  DIA_Darrion_Hello (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Hello_Condition;
	information	= DIA_Darrion_Hello_Info;
	permanent	= 0;
	description	= "Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.";
};                       

FUNC int  DIA_Darrion_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Hello_Info()
{
	AI_Output (other, self,"DIA_Darrion_Hello_15_00"); //Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.
	AI_Output (self, other,"DIA_Darrion_Hello_11_01"); //Zatem trafi�e� nie tam gdzie trzeba. Odk�d Stra�nicy �wi�tynni rozpocz�li przygotowania do walki, pracujemy dniem i noc�.
	AI_Output (self, other,"DIA_Darrion_Hello_11_02"); //Nie mam wiele czasu na pogaw�dki, wi�c nie zawracaj mi g�owy je�li nie chcesz niczego kupi�.
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Nowicjusz Darrion handluje broni�. Kr�ci si� zwykle w pobli�u ku�ni.");
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Darrion_Trade (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 800;
	condition	= DIA_Darrion_Trade_Condition;
	information	= DIA_Darrion_Trade_Info;
	permanent	= 1;
	description	= "Chcia�bym co� kupi�!";
	trade 		= 1;
};                       

FUNC int  DIA_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Darrion_Trade_Info()
{
	AI_Output (other, self,"DIA_Darrion_Trade_15_00"); //Chcia�bym co� kupi�!
	AI_Output (self, other,"DIA_Darrion_Trade_11_01"); //To �wietnie! Oto bro�, kt�r� mam aktualnie na sk�adzie.
	B_ClearTreaderAmmo(self);
	
	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};

//========================================
//-----------------> ORE
//========================================

INSTANCE DIA_Darrion_ORE (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 6;
   condition    = DIA_Darrion_ORE_Condition;
   information  = DIA_Darrion_ORE_Info;
   permanent	= FALSE;
   description	= "Masz d�ug u Starkada. Wiesz co� o tym?";
};

FUNC INT DIA_Darrion_ORE_Condition()
{
    if (MIS_CheatedMerchant == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_ORE_Info()
{
    AI_Output (other, self ,"DIA_Darrion_ORE_15_01"); //Masz d�ug u Starkada. Wiesz co� o tym?
    AI_Output (self, other ,"DIA_Darrion_ORE_03_02"); //Jasne! A jak mam nie wiedzie�? Mam tylko pewien problem. Potrzebuj� rudy i nie chc� jej teraz oddawa� Starkadowi.
    AI_Output (other, self ,"DIA_Darrion_ORE_15_03"); //No to mamy problem...
    AI_Output (self, other ,"DIA_Darrion_ORE_03_04"); //C�, mo�e nie. O ile b�dziesz chcia� p�j�� na pewne ust�pstwa... 
	AI_Output (other, self ,"DIA_Darrion_ORE_15_05"); //Niby jakie?
	AI_Output (self, other ,"DIA_Darrion_ORE_03_06"); //Oddasz te 50 bry�ek rudy za mnie, a ja w zamian dam ci jedn� z dw�ch broni. Co ty na to? S� wi�cej warte ni� te 50 bry�ek rudy. Sp�jrz na nie. 
	Info_ClearChoices	(DIA_Darrion_ORE);
    Info_AddChoice		(DIA_Darrion_ORE, "We� j�zyk topielca (obra�enia: 14, jednor�czna)", DIA_Darrion_ORE_JEZYK);
	Info_AddChoice		(DIA_Darrion_ORE, "We� laska s�dziowska (obra�enia: 19, dwur�czna)", DIA_Darrion_ORE_DZIDA);
	Info_AddChoice		(DIA_Darrion_ORE, "Dawaj rud�!", DIA_Darrion_ORE_MONEY);
    
};

func void DIA_Darrion_ORE_JEZYK ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_JEZYK_15_01"); //Daj mi j�zyk topielca. 
	AI_Output (self, other ,"DIA_Darrion_ORE_JEZYK_03_02"); //Naprawd� nie po�a�ujesz. 
	B_LogEntry     (CH1_CheatedMerchant,"Zamiast rudy wzi��em od Darriona ca�kiem przyzwoity miecz. Rud� b�d� musia� odda� z w�asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_1H_Sword_Short_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Short_03, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_DZIDA ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_DZIDA_15_01"); //Daj mi t� lask�.
	AI_Output (self, other ,"DIA_Darrion_ORE_DZIDA_03_02"); //To dobry wyb�r. Jest dro�sza i wytrzymalsza.
	B_LogEntry     (CH1_CheatedMerchant,"Zamiast rudy wzi��em od Darriona ca�kiem fajny kawa�ek kija. Ciekawe jak si� nim walczy... Rud� b�d� musia� odda� z w�asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_2H_Staff_02, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_02, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_MONEY ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_MONEY_15_01"); //Koniec gierek! Dawaj rud�!
	AI_Output (self, other ,"DIA_Darrion_ORE_MONEY_03_02"); //Naprawd� nie m�g�by� za mnie za�o�y�? No c�. Znowu b�d� musia� po�yczy�...
	B_LogEntry     (CH1_CheatedMerchant,"Za��da�em od Darriona rudy. Nie mam zamiaru za niego zak�ada�.");//fix 1210
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Info_ClearChoices	(DIA_Darrion_ORE);
};



//========================================
//-----------------> GoldAmullet
//========================================

INSTANCE DIA_Darrion_GoldAmullet (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_GoldAmullet_Condition;
   information  = DIA_Darrion_GoldAmullet_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Darrion_GoldAmullet_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_GoldAmullet_Info()
{
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_01"); //Hej, mia�bym do ciebie ma�y interes.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_02"); //Mianowicie?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_03"); //Kojarzysz pewnego Stra�nika �wi�tynnego, nazywa� si� Gor Boba.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_04"); //Mo�e...
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_05"); //To fanatyk. A gdy ten szaleniec Cor Calom opu�ci� nasz Ob�z, ten �lepo za nim pod��y�.
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_06"); //Zachowywa� si� jak ob��kaniec. My�l�, �e jego fanatyzm zbyt daleko go nie zaprowadzi. 
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_07"); //To dla mnie niez�a okazja. Ten �wir mia� przy sobie cenny, z�oty medalion, kt�ry niezmiernie mnie interesuje. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_08"); //Sk�d mam wiedzie� gdzie jest teraz Gor Boba? I ile mi zap�acisz je�li oddam ci ten medalion?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_09"); //Nie mam poj�cia gdzie on teraz jest, ale je�li na niego trafisz i zdob�dziesz to, czego chc�, to zap�ac� ci 400 bry�ek rudy. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_10"); //W porz�dku. Jak wpadnie mi w r�ce to zdob�d� dla ciebie amulet. 
	
	MIS_GoldMedallion == LOG_RUNNING;
	
	Log_CreateTopic		(CH4_GoldMedallion, LOG_MISSION);
	Log_SetTopicStatus	(CH4_GoldMedallion, LOG_RUNNING);
    B_LogEntry          (CH4_GoldMedallion,"Darrion powiedzia� mi, �e niejaki Gor Boba razem z Kalomem opu�ci� ob�z. Kowal z Bractwa spisuje ich na strat� i powiedzia�, �e je�li kiedy� spotkam Gor Bob�, to nie�le mi zap�aci za zabranie jego z�otego medalionu. ");
};

//========================================
//-----------------> GiveMedallion
//========================================

INSTANCE DIA_Darrion_GiveMedallion (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 2;
   condition    = DIA_Darrion_GiveMedallion_Condition;
   information  = DIA_Darrion_GiveMedallion_Info;
   permanent	= FALSE;
   description	= "Mam medalion, kt�ry chcia�e�.";
};

FUNC INT DIA_Darrion_GiveMedallion_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Darrion_GoldAmullet))
    && (Npc_HasItems (other, ItMi_GoldMedallion) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_GiveMedallion_Info()
{
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_01"); //Mam medalion, kt�ry chcia�e�.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_02"); //Dzi�ki, jak go zdoby�e�?
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_03"); //To d�uga historia. Gor Boba wraz z Kalomem zaszed� a� do Miasta Ork�w. A konkretniej do �wi�tyni ukrytej pod tym miastem.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_04"); //�wi�tyni pod Miastem Ork�w? O czym ty bredzisz? 
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_05"); //Powiedz po prostu, �e spotka�e� go w jakiej� melinie i wygra�e� dla mnie medalion w karty. 
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_06"); //Nie umiem gra� w karty.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_07"); //Niewa�ne. Oto obiecana ruda.
    B_LogEntry                     (CH4_GoldMedallion,"Odda�em Darrionowi medalion, kt�ry znalaz�em przy ciele Gor Boby. ");
    Log_SetTopicStatus       (CH4_GoldMedallion, LOG_SUCCESS);
    MIS_GoldMedallion = LOG_SUCCESS;

    B_GiveXP (450);
    B_GiveInvItems (other, self, ItMi_GoldMedallion, 1);
	CreateInvItems(self, itminugget,400);
	B_GiveInvItems(self, other,itminugget,400);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Cenne Znalezisko
//========================================

INSTANCE DIA_Darrion_Naprawa (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 2;
   condition    = DIA_Darrion_Naprawa_Condition;
   information  = DIA_Darrion_Naprawa_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie pewien uszkodzony medalion...";
};

FUNC INT DIA_Darrion_Naprawa_Condition()
{
    if (Npc_HasItems(hero, Amulett_BrandickS)>=1)
    && (Npc_KnowsInfo (hero ,DIA_BaalOrun_Amulett_Brandick))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_Naprawa_Info()
{
    AI_Output (other, self ,"DIA_Darrion_Naprawa_15_01"); //Mam dla ciebie pewien uszkodzony medalion. Chcia�bym by� go zreperowa�.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_02"); //Masz szcz�cie, akurat wyj�tkowo mam nieco mniej pracy co zdarza si� prawie nigdy.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_03"); //Poka� go.
    AI_Output (other, self ,"DIA_Darrion_Naprawa_15_04"); //Masz. 
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_05"); //�adna rzecz i zapewne u�yteczna gdy jest w stanie u�ywalno�ci.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_06"); //Mog� naprawi� obudow� tego medalionu ale musisz zap�aci� 50 bry�ek rudy.    
    B_LogEntry               (CiekaweZnalezisko,"Darrion naprawi obudow� medalionu w zamian za 50 bry�ek rudy. B�d� m�g� si� po niego zg�osi� nast�pnego dnia.");
   // B_GiveInvItems (other, self, Amulett_BrandickS, 1);	
   // B_GiveInvItems (self,other ,Amulett_BrandickS, 1);	
  
};

//========================================
//-----------------> Cenne Znalezisko
//========================================

INSTANCE DIA_Darrion_Naprawa1 (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 2;
   condition    = DIA_Darrion_Naprawa1_Condition;
   information  = DIA_Darrion_Naprawa1_Info;
   permanent	= FALSE;
   description	= "Oto ruda za napraw�. ";
};

FUNC INT DIA_Darrion_Naprawa1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Darrion_Naprawa))
    && (Npc_HasItems (other, itminugget) >=50)
	&& (Npc_HasItems (other, Amulett_BrandickS) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Darrion_Naprawa1_Info()
{
    AI_Output (other, self ,"DIA_Darrion_Naprawa1_15_01"); //Oto ruda za napraw�. 
    AI_Output (self, other ,"DIA_Darrion_Naprawa1_03_02"); //Niech b�dzie. Wr�� jutro a ja postaram si� w mi�dzyczasie naprawi� b�yskotk�.   
	Darron_naprawa_Day = Wld_GetDay();
	B_GiveInvItems (other, self, Amulett_BrandickS, 1);	
	B_GiveInvItems (other, self, itminugget, 50);	
    Npc_RemoveInvItems (Nov_1312_Darrion, Amulett_BrandickS,1);
   
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Amulet_Oprawa
//========================================

INSTANCE DIA_Darrion_Amulet_Oprawa (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_Amulet_Oprawa_Condition;
   information  = DIA_Darrion_Amulet_Oprawa_Info;
   permanent	= FALSE;
   description	= "No i co z medalionem?";
};

FUNC INT DIA_Darrion_Amulet_Oprawa_Condition()
{

    if  Darron_naprawa_Day<=(Wld_GetDay()-1)
	&& (Npc_KnowsInfo (hero, DIA_Darrion_Naprawa1))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Darrion_Amulet_Oprawa_Info()
{
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_01"); //No i co z medalionem?
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_02"); //Jest pewien problem.
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_03"); //O jak mi�o...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_04"); //Nie jest mi do �miechu. Przy�o�y�em si� do tej roboty i wykona�em j� najlepiej jak potrafi�em.
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_05"); //To o co chodzi?
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_06"); //Naprawiona obudowa medalionu zosta�a skradziona.
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_07"); //Jakie� dwa kwadranse przed twoj� aktualn� wizyt� kr�ci� tutaj Harlok...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_08"); //Pewnie ten dra� gwizdn�� mi obudow� medalionu i moj� sakiewk�.
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_09"); //Ju� ja sobie porozmawiam z Harlokiem...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_10"); //Przywal mu kilka razy po g�bie od siebie i ode mnie. J�zor na pewno mu si� rozwi��e.
	B_LogEntry               (CiekaweZnalezisko,"Cholera... Kowal zosta� okradziony. Trop wiedzie do Harloka. Musz� przeprowadzi� z nim powa�n� rozmow�.");
};



//========================================
//-----------------> Harlok_rob
//========================================

INSTANCE DIA_Darrion_Harlok_rob (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 2;
   condition    = DIA_Darrion_Harlok_rob_Condition;
   information  = DIA_Darrion_Harlok_rob_Info;
   permanent	= FALSE;
   description	= "Mia�e� racj�. Harlok ci� okrad�.";
};

FUNC INT DIA_Darrion_Harlok_rob_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Harlok_AMM))
&& (Npc_HasItems (other, ItMi_Worek_Darrion) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_Harlok_rob_Info()
{
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_01"); //Mia�e� racj�. Harlok ci� okrad�.
    AI_Output (self, other ,"DIA_Darrion_Harlok_rob_03_02"); //Marna wsza z niego. Wiedzia�em�.
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_03"); //Oto twoja sakiewka
    AI_Output (self, other ,"DIA_Darrion_Harlok_rob_03_04"); //Dzi�kuje. We� to za fatyg�. I co obudowa wygl�da solidne czy� nie?
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_05"); //Oczywi�cie. Nie ma do czego si� przyczepi�.
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_06"); //Do zobaczenia.
	B_LogEntry               (CiekaweZnalezisko,"Odebra�em magiczny medalion od Darriona. Obudowa wygl�da teraz naprawd� solidnie.");
	B_GiveInvItems (other,self, ItMi_Worek_Darrion, 1);
    AI_StopProcessInfos	(self);
   
};




// **************************************************
//					Miecz Gor Boby
// **************************************************

instance  DIA_Darrion_Boba_Sword (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Boba_Sword_Condition;
	information	= DIA_Darrion_Boba_Sword_Info;
	permanent	= 0;
	description	= "Gor Boba chcia�by wzmocni� sw�j miecz.";
};                       

FUNC int  DIA_Darrion_Boba_Sword_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorBoba_IHave_Nugget)) && (Npc_HasItems (other, ItMi_SilverNugget) >=40) &&  (Npc_HasItems (other,ItMw_Sword_Boba) >=1)
{
	return 1;
};
};
FUNC VOID  DIA_Darrion_Boba_Sword_Info()
{
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_00"); //Gor Boba chcia�by wzmocni� sw�j miecz.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_01"); //Jestem bardzo zaj�ty.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_02"); //Chodzi o minera� zwany srebrnym gromem.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_03"); //Ooo... S�ysza�em o nim ale nigdy nie mia�em go w r�kach. Ch�tnie bym nad nim popracowa�.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_04"); //No to b�dziesz mia� okazj�. Oto miecz Gor Boby i 40 sztuk srebrnego gromu.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_05"); //W porz�dku. Ale b�dzie ci� to kosztowa� 50 bry�ek rudy. Czas i praca kosztuj�.
	
	
	
	
	B_LogEntry               (MieczGorBoby,"Darrion chc� 50 bry�ek w zamian za wzmocnienie miecza Gor Boby ,,srebrnym gromem�.");
};



// **************************************************
//					Miecz Gor Boby
// **************************************************

instance  DIA_Darrion_Boba_Sword_Pay (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Boba_Sword_Pay_Condition;
	information	= DIA_Darrion_Boba_Sword_Pay_Info;
	permanent	= 0;
	description	= "Masz.";
};                       

FUNC int  DIA_Darrion_Boba_Sword_Pay_Condition()
{
if (Npc_HasItems (other, ItMiNugget) >=50) &&  (Npc_HasItems (other, ItMi_SilverNugget) >=40) && (Npc_HasItems (other, ItMw_Sword_Boba) >=1) && (Npc_KnowsInfo(hero,DIA_Darrion_Boba_Sword))
{
	return 1;
};
};
FUNC VOID  DIA_Darrion_Boba_Sword_Pay_Info()
{
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Pay_15_00"); //Masz.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Pay_11_01"); //To rozumiem. Wr�� jutro a powinno by� gotowe.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Pay_15_02"); //W porz�dku.
	B_GiveInvItems (other,self, ItMi_SilverNugget, 40);
	B_GiveInvItems (other,self, itminugget, 50);
    B_GiveInvItems (other,self, ItMw_Sword_Boba, 1);
	Npc_RemoveInvItems (Nov_1312_Darrion, ItMw_Sword_Boba,1);
	Npc_RemoveInvItems (Nov_1312_Darrion, ItMi_SilverNugget, 40);
	Boba_Sword_Day = Wld_GetDay(); 
	
	
	
	
	B_LogEntry               (MieczGorBoby,"Zap�aci�em Darrionowi 50 bry�ek rudy a teraz on wzmocni miecz Gor Boby.");
};



// **************************************************
//					Miecz Gor Boby
// **************************************************

instance  DIA_Darrion_Boba_Sword_Done (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Boba_Sword_Done_Condition;
	information	= DIA_Darrion_Boba_Sword_Done_Info;
	permanent	= 0;
	description	= "No i co z tym mieczem?";
};                       

FUNC int  DIA_Darrion_Boba_Sword_Done_Condition()
{
if (Boba_Sword_Day != Wld_GetDay())  && (Npc_KnowsInfo(hero,DIA_Darrion_Boba_Sword_Pay))
{
	return 1;
};
};

FUNC VOID  DIA_Darrion_Boba_Sword_Done_Info()
{
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Done_15_00"); //No i co z tym mieczem?
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_01"); //Dopiero co sko�czy�em. Ten kruszec jest wyj�tkowo twardy i ci�ko si� nad nim pracuje.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_02"); //Ale masz. Oto wzmocniony miecz. To pot�ny or�.
	B_GiveInvItems (self,other, ItMwM_Sword_Boba, 1);
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Done_15_03"); //Oddam go Gor Bobie.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_04"); //Pewnie sam chcia�by� taki nosi� hehe.	
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Done_15_05"); //Nie zaprzecz�. Do zobaczenia.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_06"); //Cze��.
	
	B_LogEntry               (MieczGorBoby,"Odebra�em miecz Gor Boby od Darriona. Praca kosztowa�a go du�o wysi�ku.");
};


//========================================
//-----------------> WDC_Sakhar
//========================================

INSTANCE DIA_Darrion_WDC_Sakhar (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_WDC_Sakhar_Condition;
   information  = DIA_Darrion_WDC_Sakhar_Info;
   permanent	= FALSE;
   description	= "Podobno naprawiasz miecz ochroniarza Caloma.";
};

FUNC INT DIA_Darrion_WDC_Sakhar_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Templer_WDC_GetOut))
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_WDC_Sakhar_Info()
{
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_01"); //Podobno naprawiasz miecz ochroniarza Caloma.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_02"); //Nie...
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_03"); //Jak to?
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_04"); //P�ki ten diabelny Sakhar b�dzie smrodzi� mi tymi swoimi truch�ami to moja wydajono�� b�dzie wci�� spada�!
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_05"); //Co on takiego robi?
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_06"); //Oprawia zwierzyn� niedaleko a smr�d roznosi si� a� tutaj. Nie b�d� pracowa� dobrze w takich warunkach!
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_07"); //A gdybym z nim pogada�? Zaj��by� si� szybciej robot�?
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_08"); //Jasne. Nie jestem jakim� leniem. Tyle, �e ten cymba� zapewne na to nie p�jdzie.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_09"); //No c� zobaczymy.
	 B_LogEntry               (WiazankaDlaCorCaloma,"Sprawa okaza�a si� bardziej skomplikowana ni� si� spodziewa�em. Darrion ma problem z Sakharem. Ten wyrzuca �mierdz�ce odpadki z oprawianej zwierzyny co przeszkadza kowalowi w pracy. Musz� pogada� z Sakharem.");
};


//========================================
//-----------------> WDC_Sakhar_Change
//========================================

INSTANCE DIA_Darrion_WDC_Sakhar_Change (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_WDC_Sakhar_Change_Condition;
   information  = DIA_Darrion_WDC_Sakhar_Change_Info;
   permanent	= FALSE;
   description	= "Nam�wi�em Sakhara do zmiany stanowiska pracy. ";
};

FUNC INT DIA_Darrion_WDC_Sakhar_Change_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_WDC_BLDF_DEAD))
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_WDC_Sakhar_Change_Info()
{
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_01"); //Nam�wi�em Sakhara do zmiany stanowiska pracy. 
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_02"); //I dlatego jakby przesta�o �mierdzie� trupem.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_03"); //Dobra robota, jakkolwiek tego dokona�e�.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_04"); //Mo�esz teraz wraca� do pracy.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_05"); //Ju� to zrobi�em. Zaj��em si� najpierw mieczem ochroniarza Caloma. Jest gotowy.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_06"); //Daj mi go. Zanios� mu go.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_07"); //Tylko nie pr�buj go gwizdn��. Ochroniarz Caloma by ci nie odpu�ci�.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_08"); //Mam inny cel do zrealizowania. I potrzebuje da� mu ten miecz.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_09"); //Masz.
	B_GiveInvItems (self,other, ITMW_CalomGuardSWD, 1);
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_10"); //Dzi�ki. 
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_11"); //To ja dzi�kuje za pomoc z tym wa�koniem Sakharem.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_12"); //Drobiazg.
	 B_LogEntry               (WiazankaDlaCorCaloma,"Kowal Darrrion da� mi miecz ochroniarza Caloma, teraz pora mu go dostarczy�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LearnMe
//========================================

INSTANCE DIA_Darrion_LearnMe (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_LearnMe_Condition;
   information  = DIA_Darrion_LearnMe_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Darrion_LearnMe_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Darrion_Hello))
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_LearnMe_Info()
{
    AI_Output (other, self ,"DIA_Darrion_LearnMe_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Darrion_LearnMe_03_02"); //Jasne, mog� ci pokaza� jak wyku� solidny miecz.
};


//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Darrion_LearnSmith_01 (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_LearnSmith_01_Condition;
   information  = DIA_Darrion_LearnSmith_01_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.1/3 - 5 PN)";
};

FUNC INT DIA_Darrion_LearnSmith_01_Condition()
{
 if (NPC_TALENT_SMITH == 0) && (Npc_KnowsInfo(hero,DIA_Darrion_LearnMe))
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_LearnSmith_01_Info()
{

    if  (hero.lp >= 5) 
	{
    AI_Output (other, self ,"DIA_Darrion_LearnSmith_01_15_01"); //Naucz mnie jak wyku� miecz. 
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_02"); //To do�� proste. Znajd� sobie plan oraz kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_04"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_05"); //Reszty dowiesz si� sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Darrion_LearnSmith_01_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};



//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Darrion_LearnSmith_02 (C_INFO)
{
   npc          = Nov_1312_Darrion;
   nr           = 1;
   condition    = DIA_Darrion_LearnSmith_02_Condition;
   information  = DIA_Darrion_LearnSmith_02_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
};

FUNC INT DIA_Darrion_LearnSmith_02_Condition()
{
 if (NPC_TALENT_SMITH == 1) 
{
    return TRUE;
};
};
FUNC VOID DIA_Darrion_LearnSmith_02_Info()
{

    if  (hero.lp >= 10) 
	{
    AI_Output (other, self ,"DIA_Darrion_LearnSmith_02_15_01"); //Naucz mnie jak wyku� dobry miecz. 
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_02"); //Podstawy ju� znasz, teraz czas na co� trudniejszego...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_03"); //Gdy uderzasz w gor�c� stal staraj si� robi� to z wyczuciem i nie b�d� spi�ty.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_04"); //Najwa�niejsze, jest to by� nie uderza� zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_05"); //Poza tym, wszystko zale�y od ciebie i rodzaju broni, jak� chcesz wykona�.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Darrion_LearnSmith_02_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};

instance dia_darrion_pickpocket(c_info) {
    npc = nov_1312_darrion;
    nr = 900;
    condition = dia_darrion_pickpocket_condition;
    information = dia_darrion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_darrion_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_darrion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_darrion_pickpocket);
	info_addchoice(dia_darrion_pickpocket, dialog_back, dia_darrion_pickpocket_back);
	info_addchoice(dia_darrion_pickpocket, dialog_pickpocket, dia_darrion_pickpocket_doit);
};

func void dia_darrion_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_darrion_pickpocket);
};

func void dia_darrion_pickpocket_back() {
    info_clearchoices(dia_darrion_pickpocket);
};