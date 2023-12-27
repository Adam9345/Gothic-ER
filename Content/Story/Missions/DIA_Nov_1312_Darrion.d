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
	description	= "Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.";
};                       

FUNC int  DIA_Darrion_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Hello_Info()
{
	AI_Output (other, self,"DIA_Darrion_Hello_15_00"); //Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.
	AI_Output (self, other,"DIA_Darrion_Hello_11_01"); //Zatem trafi³eœ nie tam gdzie trzeba. Odk¹d Stra¿nicy Œwi¹tynni rozpoczêli przygotowania do walki, pracujemy dniem i noc¹.
	AI_Output (self, other,"DIA_Darrion_Hello_11_02"); //Nie mam wiele czasu na pogawêdki, wiêc nie zawracaj mi g³owy jeœli nie chcesz niczego kupiæ.
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Nowicjusz Darrion handluje broni¹. Krêci siê zwykle w pobli¿u kuŸni.");
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
	description	= "Chcia³bym coœ kupiæ!";
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
	AI_Output (other, self,"DIA_Darrion_Trade_15_00"); //Chcia³bym coœ kupiæ!
	AI_Output (self, other,"DIA_Darrion_Trade_11_01"); //To œwietnie! Oto broñ, któr¹ mam aktualnie na sk³adzie.
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
   description	= "Masz d³ug u Starkada. Wiesz coœ o tym?";
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
    AI_Output (other, self ,"DIA_Darrion_ORE_15_01"); //Masz d³ug u Starkada. Wiesz coœ o tym?
    AI_Output (self, other ,"DIA_Darrion_ORE_03_02"); //Jasne! A jak mam nie wiedzieæ? Mam tylko pewien problem. Potrzebujê rudy i nie chcê jej teraz oddawaæ Starkadowi.
    AI_Output (other, self ,"DIA_Darrion_ORE_15_03"); //No to mamy problem...
    AI_Output (self, other ,"DIA_Darrion_ORE_03_04"); //Có¿, mo¿e nie. O ile bêdziesz chcia³ pójœæ na pewne ustêpstwa... 
	AI_Output (other, self ,"DIA_Darrion_ORE_15_05"); //Niby jakie?
	AI_Output (self, other ,"DIA_Darrion_ORE_03_06"); //Oddasz te 50 bry³ek rudy za mnie, a ja w zamian dam ci jedn¹ z dwóch broni. Co ty na to? S¹ wiêcej warte ni¿ te 50 bry³ek rudy. Spójrz na nie. 
	Info_ClearChoices	(DIA_Darrion_ORE);
    Info_AddChoice		(DIA_Darrion_ORE, "WeŸ jêzyk topielca (obra¿enia: 14, jednorêczna)", DIA_Darrion_ORE_JEZYK);
	Info_AddChoice		(DIA_Darrion_ORE, "WeŸ laska sêdziowska (obra¿enia: 19, dwurêczna)", DIA_Darrion_ORE_DZIDA);
	Info_AddChoice		(DIA_Darrion_ORE, "Dawaj rudê!", DIA_Darrion_ORE_MONEY);
    
};

func void DIA_Darrion_ORE_JEZYK ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_JEZYK_15_01"); //Daj mi jêzyk topielca. 
	AI_Output (self, other ,"DIA_Darrion_ORE_JEZYK_03_02"); //Naprawdê nie po¿a³ujesz. 
	B_LogEntry     (CH1_CheatedMerchant,"Zamiast rudy wzi¹³em od Darriona ca³kiem przyzwoity miecz. Rudê bêdê musia³ oddaæ z w³asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_1H_Sword_Short_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Short_03, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_DZIDA ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_DZIDA_15_01"); //Daj mi tê laskê.
	AI_Output (self, other ,"DIA_Darrion_ORE_DZIDA_03_02"); //To dobry wybór. Jest dro¿sza i wytrzymalsza.
	B_LogEntry     (CH1_CheatedMerchant,"Zamiast rudy wzi¹³em od Darriona ca³kiem fajny kawa³ek kija. Ciekawe jak siê nim walczy... Rudê bêdê musia³ oddaæ z w³asnej kieszeni.");//fix 1210
	CreateInvItems (self, ItMw_2H_Staff_02, 1);
    B_GiveInvItems (self, other, ItMw_2H_Staff_02, 1);
	Info_ClearChoices	(DIA_Darrion_ORE);
};

func void DIA_Darrion_ORE_MONEY ()
{
	AI_Output (other, self ,"DIA_Darrion_ORE_MONEY_15_01"); //Koniec gierek! Dawaj rudê!
	AI_Output (self, other ,"DIA_Darrion_ORE_MONEY_03_02"); //Naprawdê nie móg³byœ za mnie za³o¿yæ? No có¿. Znowu bêdê musia³ po¿yczyæ...
	B_LogEntry     (CH1_CheatedMerchant,"Za¿¹da³em od Darriona rudy. Nie mam zamiaru za niego zak³adaæ.");//fix 1210
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
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_01"); //Hej, mia³bym do ciebie ma³y interes.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_02"); //Mianowicie?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_03"); //Kojarzysz pewnego Stra¿nika Œwi¹tynnego, nazywa³ siê Gor Boba.
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_04"); //Mo¿e...
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_05"); //To fanatyk. A gdy ten szaleniec Cor Calom opuœci³ nasz Obóz, ten œlepo za nim pod¹¿y³.
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_06"); //Zachowywa³ siê jak ob³¹kaniec. Myœlê, ¿e jego fanatyzm zbyt daleko go nie zaprowadzi. 
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_07"); //To dla mnie niez³a okazja. Ten œwir mia³ przy sobie cenny, z³oty medalion, który niezmiernie mnie interesuje. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_08"); //Sk¹d mam wiedzieæ gdzie jest teraz Gor Boba? I ile mi zap³acisz jeœli oddam ci ten medalion?
    AI_Output (self, other ,"DIA_Darrion_GoldAmullet_03_09"); //Nie mam pojêcia gdzie on teraz jest, ale jeœli na niego trafisz i zdobêdziesz to, czego chcê, to zap³acê ci 400 bry³ek rudy. 
    AI_Output (other, self ,"DIA_Darrion_GoldAmullet_15_10"); //W porz¹dku. Jak wpadnie mi w rêce to zdobêdê dla ciebie amulet. 
	
	MIS_GoldMedallion == LOG_RUNNING;
	
	Log_CreateTopic		(CH4_GoldMedallion, LOG_MISSION);
	Log_SetTopicStatus	(CH4_GoldMedallion, LOG_RUNNING);
    B_LogEntry          (CH4_GoldMedallion,"Darrion powiedzia³ mi, ¿e niejaki Gor Boba razem z Kalomem opuœci³ obóz. Kowal z Bractwa spisuje ich na stratê i powiedzia³, ¿e jeœli kiedyœ spotkam Gor Bobê, to nieŸle mi zap³aci za zabranie jego z³otego medalionu. ");
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
   description	= "Mam medalion, który chcia³eœ.";
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
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_01"); //Mam medalion, który chcia³eœ.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_02"); //Dziêki, jak go zdoby³eœ?
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_03"); //To d³uga historia. Gor Boba wraz z Kalomem zaszed³ a¿ do Miasta Orków. A konkretniej do œwi¹tyni ukrytej pod tym miastem.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_04"); //Œwi¹tyni pod Miastem Orków? O czym ty bredzisz? 
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_05"); //Powiedz po prostu, ¿e spotka³eœ go w jakiejœ melinie i wygra³eœ dla mnie medalion w karty. 
    AI_Output (other, self ,"DIA_Darrion_GiveMedallion_15_06"); //Nie umiem graæ w karty.
    AI_Output (self, other ,"DIA_Darrion_GiveMedallion_03_07"); //Niewa¿ne. Oto obiecana ruda.
    B_LogEntry                     (CH4_GoldMedallion,"Odda³em Darrionowi medalion, który znalaz³em przy ciele Gor Boby. ");
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
    AI_Output (other, self ,"DIA_Darrion_Naprawa_15_01"); //Mam dla ciebie pewien uszkodzony medalion. Chcia³bym byœ go zreperowa³.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_02"); //Masz szczêœcie, akurat wyj¹tkowo mam nieco mniej pracy co zdarza siê prawie nigdy.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_03"); //Poka¿ go.
    AI_Output (other, self ,"DIA_Darrion_Naprawa_15_04"); //Masz. 
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_05"); //£adna rzecz i zapewne u¿yteczna gdy jest w stanie u¿ywalnoœci.
    AI_Output (self, other ,"DIA_Darrion_Naprawa_03_06"); //Mogê naprawiæ obudowê tego medalionu ale musisz zap³aciæ 50 bry³ek rudy.    
    B_LogEntry               (CiekaweZnalezisko,"Darrion naprawi obudowê medalionu w zamian za 50 bry³ek rudy. Bêdê móg³ siê po niego zg³osiæ nastêpnego dnia.");
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
   description	= "Oto ruda za naprawê. ";
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
    AI_Output (other, self ,"DIA_Darrion_Naprawa1_15_01"); //Oto ruda za naprawê. 
    AI_Output (self, other ,"DIA_Darrion_Naprawa1_03_02"); //Niech bêdzie. Wróæ jutro a ja postaram siê w miêdzyczasie naprawiæ b³yskotkê.   
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
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_03"); //O jak mi³o...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_04"); //Nie jest mi do œmiechu. Przy³o¿y³em siê do tej roboty i wykona³em j¹ najlepiej jak potrafi³em.
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_05"); //To o co chodzi?
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_06"); //Naprawiona obudowa medalionu zosta³a skradziona.
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_07"); //Jakieœ dwa kwadranse przed twoj¹ aktualn¹ wizyt¹ krêci³ tutaj Harlok...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_08"); //Pewnie ten drañ gwizdn¹³ mi obudowê medalionu i moj¹ sakiewkê.
    AI_Output (other, self ,"DIA_Darrion_Amulet_Oprawa_15_09"); //Ju¿ ja sobie porozmawiam z Harlokiem...
    AI_Output (self, other ,"DIA_Darrion_Amulet_Oprawa_03_10"); //Przywal mu kilka razy po gêbie od siebie i ode mnie. Jêzor na pewno mu siê rozwi¹¿e.
	B_LogEntry               (CiekaweZnalezisko,"Cholera... Kowal zosta³ okradziony. Trop wiedzie do Harloka. Muszê przeprowadziæ z nim powa¿n¹ rozmowê.");
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
   description	= "Mia³eœ racjê. Harlok ciê okrad³.";
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
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_01"); //Mia³eœ racjê. Harlok ciê okrad³.
    AI_Output (self, other ,"DIA_Darrion_Harlok_rob_03_02"); //Marna wsza z niego. Wiedzia³em….
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_03"); //Oto twoja sakiewka
    AI_Output (self, other ,"DIA_Darrion_Harlok_rob_03_04"); //Dziêkuje. WeŸ to za fatygê. I co obudowa wygl¹da solidne czy¿ nie?
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_05"); //Oczywiœcie. Nie ma do czego siê przyczepiæ.
    AI_Output (other, self ,"DIA_Darrion_Harlok_rob_15_06"); //Do zobaczenia.
	B_LogEntry               (CiekaweZnalezisko,"Odebra³em magiczny medalion od Darriona. Obudowa wygl¹da teraz naprawdê solidnie.");
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
	description	= "Gor Boba chcia³by wzmocniæ swój miecz.";
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
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_00"); //Gor Boba chcia³by wzmocniæ swój miecz.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_01"); //Jestem bardzo zajêty.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_02"); //Chodzi o minera³ zwany srebrnym gromem.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_03"); //Ooo... S³ysza³em o nim ale nigdy nie mia³em go w rêkach. Chêtnie bym nad nim popracowa³.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_15_04"); //No to bêdziesz mia³ okazjê. Oto miecz Gor Boby i 40 sztuk srebrnego gromu.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_11_05"); //W porz¹dku. Ale bêdzie ciê to kosztowaæ 50 bry³ek rudy. Czas i praca kosztuj¹.
	
	
	
	
	B_LogEntry               (MieczGorBoby,"Darrion chcê 50 bry³ek w zamian za wzmocnienie miecza Gor Boby ,,srebrnym gromem”.");
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
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Pay_11_01"); //To rozumiem. Wróæ jutro a powinno byæ gotowe.
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Pay_15_02"); //W porz¹dku.
	B_GiveInvItems (other,self, ItMi_SilverNugget, 40);
	B_GiveInvItems (other,self, itminugget, 50);
    B_GiveInvItems (other,self, ItMw_Sword_Boba, 1);
	Npc_RemoveInvItems (Nov_1312_Darrion, ItMw_Sword_Boba,1);
	Npc_RemoveInvItems (Nov_1312_Darrion, ItMi_SilverNugget, 40);
	Boba_Sword_Day = Wld_GetDay(); 
	
	
	
	
	B_LogEntry               (MieczGorBoby,"Zap³aci³em Darrionowi 50 bry³ek rudy a teraz on wzmocni miecz Gor Boby.");
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
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_01"); //Dopiero co skoñczy³em. Ten kruszec jest wyj¹tkowo twardy i ciê¿ko siê nad nim pracuje.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_02"); //Ale masz. Oto wzmocniony miecz. To potê¿ny orê¿.
	B_GiveInvItems (self,other, ItMwM_Sword_Boba, 1);
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Done_15_03"); //Oddam go Gor Bobie.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_04"); //Pewnie sam chcia³byœ taki nosiæ hehe.	
	AI_Output (other, self,"DIA_Darrion_Boba_Sword_Done_15_05"); //Nie zaprzeczê. Do zobaczenia.
	AI_Output (self, other,"DIA_Darrion_Boba_Sword_Done_11_06"); //Czeœæ.
	
	B_LogEntry               (MieczGorBoby,"Odebra³em miecz Gor Boby od Darriona. Praca kosztowa³a go du¿o wysi³ku.");
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
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_04"); //Póki ten diabelny Sakhar bêdzie smrodzi³ mi tymi swoimi truch³ami to moja wydajonoœæ bêdzie wci¹¿ spadaæ!
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_05"); //Co on takiego robi?
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_06"); //Oprawia zwierzynê niedaleko a smród roznosi siê a¿ tutaj. Nie bêdê pracowa³ dobrze w takich warunkach!
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_07"); //A gdybym z nim pogada³? Zaj¹³byœ siê szybciej robot¹?
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_03_08"); //Jasne. Nie jestem jakimœ leniem. Tyle, ¿e ten cymba³ zapewne na to nie pójdzie.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_15_09"); //No có¿ zobaczymy.
	 B_LogEntry               (WiazankaDlaCorCaloma,"Sprawa okaza³a siê bardziej skomplikowana ni¿ siê spodziewa³em. Darrion ma problem z Sakharem. Ten wyrzuca œmierdz¹ce odpadki z oprawianej zwierzyny co przeszkadza kowalowi w pracy. Muszê pogadaæ z Sakharem.");
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
   description	= "Namówi³em Sakhara do zmiany stanowiska pracy. ";
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
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_01"); //Namówi³em Sakhara do zmiany stanowiska pracy. 
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_02"); //I dlatego jakby przesta³o œmierdzieæ trupem.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_03"); //Dobra robota, jakkolwiek tego dokona³eœ.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_04"); //Mo¿esz teraz wracaæ do pracy.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_05"); //Ju¿ to zrobi³em. Zaj¹³em siê najpierw mieczem ochroniarza Caloma. Jest gotowy.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_06"); //Daj mi go. Zaniosê mu go.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_07"); //Tylko nie próbuj go gwizdn¹æ. Ochroniarz Caloma by ci nie odpuœci³.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_08"); //Mam inny cel do zrealizowania. I potrzebuje daæ mu ten miecz.
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_09"); //Masz.
	B_GiveInvItems (self,other, ITMW_CalomGuardSWD, 1);
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_10"); //Dziêki. 
    AI_Output (self, other ,"DIA_Darrion_WDC_Sakhar_Change_03_11"); //To ja dziêkuje za pomoc z tym wa³koniem Sakharem.
    AI_Output (other, self ,"DIA_Darrion_WDC_Sakhar_Change_15_12"); //Drobiazg.
	 B_LogEntry               (WiazankaDlaCorCaloma,"Kowal Darrrion da³ mi miecz ochroniarza Caloma, teraz pora mu go dostarczyæ.");
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
    AI_Output (other, self ,"DIA_Darrion_LearnMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Darrion_LearnMe_03_02"); //Jasne, mogê ci pokazaæ jak wykuæ solidny miecz.
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
   description	= "Naucz mnie jak wykuæ miecz. (Kowalstwo poz.1/3 - 5 PN)";
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
    AI_Output (other, self ,"DIA_Darrion_LearnSmith_01_15_01"); //Naucz mnie jak wykuæ miecz. 
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_02"); //To doœæ proste. ZnajdŸ sobie plan oraz kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_04"); //Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_01_03_05"); //Reszty dowiesz siê sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Darrion_LearnSmith_01_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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
   description	= "Naucz mnie jak wykuæ dobry miecz. (Kowalstwo poz.2/3 - 10 PN)";
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
    AI_Output (other, self ,"DIA_Darrion_LearnSmith_02_15_01"); //Naucz mnie jak wykuæ dobry miecz. 
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_02"); //Podstawy ju¿ znasz, teraz czas na coœ trudniejszego...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_03"); //Gdy uderzasz w gor¹c¹ stal staraj siê robiæ to z wyczuciem i nie b¹dŸ spiêty.
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_04"); //Najwa¿niejsze, jest to byœ nie uderza³ zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Darrion_LearnSmith_02_03_05"); //Poza tym, wszystko zale¿y od ciebie i rodzaju broni, jak¹ chcesz wykonaæ.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Darrion_LearnSmith_02_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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