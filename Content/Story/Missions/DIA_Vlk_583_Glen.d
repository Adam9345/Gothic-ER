// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "O czym powinienem pami�ta�, b�d�c w kopalni?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //O czym powinienem pami�ta�, b�d�c w kopalni?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Uwa�aj na pe�zacze.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Im ni�ej zejdziesz, tym cz�ciej mo�esz na nie wpa��. Te przekl�te stwory przychodz� chyba wprost z kr�lestwa samego Beliara!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Bez przerwy s�ycha�, jak grzebi� i kopi�. Siedz� w ciemno�ci i czekaj� na jakiego� biednego g�rnika, z kt�rego zrobi� sobie obiad.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //S� bezlitosne i bardzo szybkie. Je�li ci �ycie mi�e, uciekaj st�d ile si� w nogach. Pr�dzej czy p�niej padnie i na ciebie.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "S�ysza�em, �e mo�na tu kupi� wytrychy?";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //S�ysza�em, �e mo�na tu kupi� wytrychy?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Skoro okaza�e� si� na tyle sprytny, �eby do mnie dotrze�, mo�esz kilka kupi�. To b�dzie 10 bry�ek rudy za sztuk�.
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kopacz Glen, kt�rego mog� znale�� przy wyj�ciu z kopalni, handluje wytrychami."); 

};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(kup wytrychy)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chc� kupi� kilka wytrych�w.
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> NeedOre
//========================================

INSTANCE DIA_Glen_NeedOre (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 4;
   condition    = DIA_Glen_NeedOre_Condition;
   information  = DIA_Glen_NeedOre_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi pom�c dorobi� nieco rudy?";
};

FUNC INT DIA_Glen_NeedOre_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Glen_NeedOre_Info()
{
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_01"); //Mo�esz mi pom�c dorobi� nieco rudy?
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_03"); //Po co ci?
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_04"); //Chcia�bym troch� si� wzbogaci�...
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_05"); //To �ap za kilof i zacznij kopa�. W ko�cu po to tu jeste�. Dlaczego si� tak spieszysz?
    AI_Output (other, self ,"DIA_Glen_NeedOre_15_08"); //Sk�d ty si� urwa�e�? Ruda na szybko zawsze jest potrzebna. To jak? Mo�esz mi pom�c?
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_09"); //Mog� da� ci dziesi�� bry�ek rudy w zamian za dostarczenie tych wytrych�w Garpowi.
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_10"); //Wi�kszo�� czasu sp�dza na dnie kopalni. Mo�liwe, �e on te� b�dzie mia� dla ciebie jakie� zadanie. Jednak nie licz na wysokie wynagrodzenie.
	AI_Output (self, other ,"DIA_Glen_NeedOre_03_11"); //Wszyscy tutaj s� biedni, a ty nie wygl�dasz na kogo�, kto zas�uguje na specjalne traktowanie. 
    AI_Output (self, other ,"DIA_Glen_NeedOre_03_12"); //Mo�esz pogada� te� ze Snipesem. Lubi robi� sobie jaja ze Stra�nik�w i ch�tnie p�aci pomocnikom.
};

//========================================
//-----------------> GetPickLocks
//========================================

INSTANCE DIA_Glen_GetPickLocks (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 5;
   condition    = DIA_Glen_GetPickLocks_Condition;
   information  = DIA_Glen_GetPickLocks_Info;
   permanent	= FALSE;
   description	= "Zanios� te wytrychy.";
};

FUNC INT DIA_Glen_GetPickLocks_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glen_NeedOre))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_GetPickLocks_Info()
{
    AI_Output (other, self ,"DIA_Glen_GetPickLocks_15_01"); //Zanios� te wytrychy.
    AI_Output (self, other ,"DIA_Glen_GetPickLocks_03_02"); //Pami�tasz gdzie masz i��? Na dno Kopalni, prosto do Garpa. Wytrych�w jest 20 sztuk. Nie podw�d� �adnego!
	
    CreateInvItems (self, ItKeLockpick, 20);
    B_GiveInvItems (self, other, ItKeLockpick, 20);
    MIS_SmallDelivery = LOG_RUNNING;

    Log_CreateTopic          (CH1_SmallDelivery, LOG_MISSION);
    Log_SetTopicStatus       (CH1_SmallDelivery, LOG_RUNNING);
    B_LogEntry               (CH1_SmallDelivery,"Glen kaza� mi zanie�� 20 wytrych�w Garpowi. Znajd� go na dnie Kopalni.");
};

//========================================
//-----------------> ROBOTKA
//========================================

INSTANCE DIA_Glen_ROBOTKA (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 6;
   condition    = DIA_Glen_ROBOTKA_Condition;
   information  = DIA_Glen_ROBOTKA_Info;
   permanent	= FALSE;
   description	= "Przyszed�em po wytrychy.";
};

FUNC INT DIA_Glen_ROBOTKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_WLAM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_ROBOTKA_Info()
{
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_01"); //Przyszed�em po wytrychy.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_02"); //A wi�c zaczynacie...
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_03"); //Mo�e trzeba by�o wzi�� sobie s�owa Alepha do serca?
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_04"); //Jakie to ma znaczenie? Z pewno�ci� wszystko si� uda.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_05"); //Czemu tak ci na tym zale�y?
	/*if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_06"); //Po pierwsze: zyskam poparcie Kopaczy, a po drugie: potrzebuj� tej rudy.
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_07"); //Mam wykopa� 500 bry�ek, �eby Ian w og�le ze mn� porozmawia�.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_08"); //A wi�c chcesz zosta� Cieniem?
    AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_09"); //To chyba oczywiste, �e nie zamierzam tu gni� 10 lat.
    AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_10"); //Jak chcesz, ch�opcze.
	}
	else
	{*/
	AI_Output (other, self ,"DIA_Glen_ROBOTKA_15_11"); //Ja po prostu chc� pom�c Kopaczom odzyska� ich w�asno�ci. 
	AI_Output (self, other ,"DIA_Glen_ROBOTKA_03_12"); //Nie wiem czy ta sprawa jest warta takiego ryzyka, ale jak chcesz...
	//};
    B_LogEntry                     (CH1_ActionOM,"Glen da� mi 5 wytrych�w. Wkr�tce b�dziemy gotowi �eby zaczyna�. Musz� ustali� ostatnie szczeg�y z Garpem.");
    CreateInvItems (self, ItKeLockpick, 5);
    B_GiveInvItems (self, other, ItKeLockpick, 5);
};

//========================================
//-----------------> SAKIEWKAPP
//========================================

INSTANCE DIA_Glen_SAKIEWKAPP (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 88;
   condition    = DIA_Glen_SAKIEWKAPP_Condition;
   information  = DIA_Glen_SAKIEWKAPP_Info;
   permanent	= FALSE;
   description	= "Czy to czasem nie nale�y do ciebie?";
};

FUNC INT DIA_Glen_SAKIEWKAPP_Condition()
{
    if (Npc_HasItems (other, ItMi_Worek_Glen) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glen_SAKIEWKAPP_Info()
{
    AI_Output (other, self ,"DIA_Glen_SAKIEWKAPP_15_01"); //Czy to czasem nie nale�y do ciebie?
    AI_Output (self, other ,"DIA_Glen_SAKIEWKAPP_03_02"); //A wi�c moje wytrychy na co� si� przyda�y?
    AI_Output (self, other ,"DIA_Glen_SAKIEWKAPP_03_03"); //Dobra robota, ch�opcze.
    B_GiveInvItems (other, self, ItMi_Worek_Glen, 1);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
};

//========================================
//-----------------> NeedOre
//========================================

INSTANCE DIA_Glen_Silver_Nugget (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 4;
   condition    = DIA_Glen_Silver_Nugget_Condition;
   information  = DIA_Glen_Silver_Nugget_Info;
   permanent	= FALSE;
   description	= "Pono� jeste� w posiadaniu minera�u zwanego srebrnym gromem.";
};

FUNC INT DIA_Glen_Silver_Nugget_Condition()

{
if (Npc_KnowsInfo(hero,DIA_Snipes_Grom_Info_Ore))
{
    return TRUE;
};
};

FUNC VOID DIA_Glen_Silver_Nugget_Info()
{
    AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_01"); //Pono� jeste� w posiadaniu minera�u zwanego srebrnym gromem.
    AI_Output (self, other ,"DIA_Glen_Silver_Nugget_03_03"); //Czy�by?
    AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_04"); //A nie?
    AI_Output (self, other ,"DIA_Glen_Silver_Nugget_03_05"); //Nie. Ju� nie.
    AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_08"); //Jak to?
    AI_Output (self, other ,"DIA_Glen_Silver_Nugget_03_09"); //Odsprzeda�em minera� handlarzowi Alberto za odpowiedni� sum�.
    AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_10"); //Rozumiem.
	AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_11"); //Nie b�d� ci ju� zabiera� czasu. Id� do tego handlarza.
    AI_Output (self, other ,"DIA_Glen_Silver_Nugget_03_12"); //Dobrze wracam do pracy.
	AI_Output (other, self ,"DIA_Glen_Silver_Nugget_15_13"); //Na razie.
	
	 B_LogEntry               (MieczGorBoby,"Rozmawia�em z Glenem. Odsprzeda� on sw�j cenny kruszec handlarzowi Alberto.");
	
	
};


//========================================
//-----------------> DWMN_MAMCIE
//========================================

INSTANCE DIA_Glen_DWMN_MAMCIE (C_INFO)
{
   npc          = VLK_583_Glen;
   nr           = 1;
   condition    = DIA_Glen_DWMN_MAMCIE_Condition;
   information  = DIA_Glen_DWMN_MAMCIE_Info;
   permanent	= FALSE;
   description	= "Mam ci� ptaszku!";
};

FUNC INT DIA_Glen_DWMN_MAMCIE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Robin_DWMN_NUGGET))
//&&  (Npc_GetDistToWP(hero,"WP_DYW_GLEN_PICK")<300)
&&  (Wld_IsTime(22,59,04,59 ))
{
    return TRUE;
};
};
FUNC VOID DIA_Glen_DWMN_MAMCIE_Info()
{
    AI_Output (other, self ,"DIA_Glen_DWMN_MAMCIE_15_01"); //Mam ci� ptaszku!
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_02"); //Ale... Nie rozumiem...
    AI_Output (other, self ,"DIA_Glen_DWMN_MAMCIE_15_03"); //To ty demolujesz cenne rzeczy w kopalni od pewnego czasu.
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_04"); //Nie... Ja nie...
    AI_Output (other, self ,"DIA_Glen_DWMN_MAMCIE_15_05"); //Gadaj!
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_06"); //Zmusili mnie. Ja nie chcia�em tego robi�.
    AI_Output (other, self ,"DIA_Glen_DWMN_MAMCIE_15_07"); //Kto ci� zmusi�?
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_08"); //Ulbert. Ale taki t�pak nie mo�e by� m�zgiem tej operacji.
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_09"); //Kto� chc� ewidentnie usun�� Iana z jego stanowiska.
    AI_Output (other, self ,"DIA_Glen_DWMN_MAMCIE_15_10"); //Ciekawe. Id� do Iana I powiedz mu to co powiedzia�e� mi. Ja pogadam z Ulbertem.
    AI_Output (self, other ,"DIA_Glen_DWMN_MAMCIE_03_11"); //W porz�dku. Tylko niech ju� nikt mnie nie bije...
	B_LogEntry               (Dywersant,"Glen pr�bowa� zrobi� co� z g�r� rudy. Ale jest on tylko wykonawc� misji do, kt�rej pono� zmusi� go Ulbert. Musz� z nim pogada� ");
	Npc_ExchangeRoutine(VLK_583_Glen,"start");
	Wld_InsertNpc				(Grd_40150_Nieznajomy,"OM_014A");
    AI_StopProcessInfos	(self);
};

instance dia_glen_pickpocket(c_info) {
    npc = vlk_583_glen;
    nr = 900;
    condition = dia_glen_pickpocket_condition;
    information = dia_glen_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_glen_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_glen_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_glen_pickpocket);
	info_addchoice(dia_glen_pickpocket, dialog_back, dia_glen_pickpocket_back);
	info_addchoice(dia_glen_pickpocket, dialog_pickpocket, dia_glen_pickpocket_doit);
};

func void dia_glen_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_glen_pickpocket);
};

func void dia_glen_pickpocket_back() {
    info_clearchoices(dia_glen_pickpocket);
};

























