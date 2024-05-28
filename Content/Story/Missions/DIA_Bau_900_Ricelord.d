//poprawione i sprawdzone -  

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Ricelord_EXIT (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 999;
	condition	= DIA_Ricelord_EXIT_Condition;
	information	= DIA_Ricelord_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Ricelord_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Ricelord_Hello (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_Hello_Condition;
	information	= DIA_Ricelord_Hello_Info;
	permanent	= 0;
	description	= "Troszczysz si� o pola ry�owe, czy� nie?";
};                       

FUNC INT DIA_Ricelord_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Ricelord_Hello_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_Hello_15_00"); //Troszczysz si� o pola ry�owe, czy� nie?
	AI_Output (self, other,"DIA_Ricelord_Hello_12_01"); //Czemu pytasz? Szukasz pracy?
};

// ************************************************************
// 						Arbeit
// ************************************************************

INSTANCE DIA_Ricelord_Arbeit (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_Arbeit_Condition;
	information	= DIA_Ricelord_Arbeit_Info;
	permanent	= 0;
	description	= "A masz dla mnie jakie� zaj�cie?";
};                       

FUNC INT DIA_Ricelord_Arbeit_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Ricelord_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Lefty_First)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakie� zaj�cie?
	AI_Output (self, other,"DIA_Ricelord_Arbeit_12_01"); //Porozmawiaj z Lewusem. Kr�ci si� zwykle na prawo od szopy.
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_Ricelord_TRADE (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 800;
	condition	= DIA_Ricelord_TRADE_Condition;
	information	= DIA_Ricelord_TRADE_Info;
	permanent	= 1;
	description	= "Mo�e si� dogadamy...";
	trade 		= 1;
};                       

FUNC INT DIA_Ricelord_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ricelord_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_TRADE_15_00"); //Mo�e si� dogadamy...
	AI_Output (self, other,"DIA_Ricelord_TRADE_12_01"); //A co mo�esz mi zaoferowa�?
	var int wpis_handel_ricelord;
	if wpis_handel_ricelord == false
	{
	wpis_handel_ricelord = true;
	Log_CreateTopic   	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry			(GE_TraderNC,	"Jak si� okazuje z Ry�owym Ksi�ciem mo�na handlowa�. Sprzedaje cz�� towar�w z magazynu. ");
	};
};
	
// ************************************************************
// 						Lefty Mission
// ************************************************************
INSTANCE DIA_Ricelord_LeftySentMe (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_LeftySentMe_Condition;
	information	= DIA_Ricelord_LeftySentMe_Info;
	permanent	= 0;
	description	= "Przysy�a mnie Lewus.";
};                       

FUNC INT DIA_Ricelord_LeftySentMe_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Ricelord_Hello)
	&&	(Lefty_Mission == LOG_RUNNING)
	&&	(Ricelord_AskedForWater == FALSE)
	&& (LeftyDead == False)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_LeftySentMe_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_LeftySentMe_15_00"); //Przysy�a mnie Lewus.
	AI_Output (self, other,"DIA_Ricelord_LeftySentMe_12_01"); //Tak? I co powiedzia�?
	Ricelord_AskedForWater = TRUE;
};

// ************************************************************
// 						Lefty Mission
// ************************************************************

INSTANCE DIA_Ricelord_GetWater (C_INFO)
{
	npc			= Bau_900_Ricelord;
	nr			= 1;
	condition	= DIA_Ricelord_GetWater_Condition;
	information	= DIA_Ricelord_GetWater_Info;
	permanent	= 1;
	description	= "Mam zanie�� wod� zbieraczom ry�u!";
};                       

FUNC INT DIA_Ricelord_GetWater_Condition()
{
	if (Ricelord_AskedForWater == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Ricelord_GetWater_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_GetWater_15_00"); //Mam zanie�� wod� zbieraczom ry�u!
	
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_01"); //Dobra. Masz tu tuzin butelek.
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_02"); //To jakie� dwa razy wi�cej ni� liczba zbieraczy, wi�c postaraj si� rozdzieli� je sprawiedliwie.

		CreateInvItems		(self, ItFo_Potion_Water_01, 12);
		B_GiveInvItems		(self, other, ItFo_Potion_Water_01, 12);

		Ricelord_AskedForWater = FALSE;
		B_LogEntry			(CH1_CarryWater,	"Ry�owy Ksi��e da� mi tuzin butelek z wod�.");

		AI_StopProcessInfos	(self);
	}
	else if (Lefty_WorkDay == Wld_GetDay()-1)
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_00"); //To by�o wczoraj, ch�opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci co� do powiedzenia.
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_01"); //To by�o par� dni temu, ch�opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci co� do powiedzenia.
		AI_StopProcessInfos	(self);
	};
};

//========================================
//-----------------> RYZ
//========================================

INSTANCE DIA_Ricelord_RYZ (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_RYZ_Condition;
   information  = DIA_Ricelord_RYZ_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o polach ry�owych?";
};

FUNC INT DIA_Ricelord_RYZ_Condition()
{
    if (wiecejRice == true)
    && (Npc_KnowsInfo (hero, DIA_Aidan_SZPIEGOWANIE))
    && (MIS_TestOC == LOG_RUNNING)    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_RYZ_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_01"); //Co mo�esz mi powiedzie� o polach ry�owych?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_02"); //Ja jestem tu szefem. Zarz�dzam ca�� prac�.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_03"); //Pomaga mi Lewus.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_04"); //I jak zbiory?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_05"); //Du�e. Ostatnio idzie coraz lepiej.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_06"); //To z pewno�ci� twoja zas�uga... 
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_07"); //Tak, masz racj�.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_08"); //Co robicie z nadwy�k� ry�u?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_09"); //Zatrzymujemy w magazynach. Niewielk� cz�� sprzedajemy do innych oboz�w.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_10"); //G��wnie do Bractwa. Ale s� to naprawd� ma�e ilo�ci.
    knowsRice = true;
    B_LogEntry                     (CH1_TestOc,"Sporo si� dowiedzia�em od Ry�owego Ksi�cia. Nadwy�ka ry�u jest sprzedawana do Bractwa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ALCO_BUNT
//========================================

INSTANCE DIA_Ricelord_ALCO_BUNT (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_ALCO_BUNT_Condition;
   information  = DIA_Ricelord_ALCO_BUNT_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Homer, mam dla ciebie ry��wk� od Jeremiasza.";
};

FUNC INT DIA_Ricelord_ALCO_BUNT_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_ALCO_BUNT_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_01"); //Przysy�a mnie Homer, mam dla ciebie ry��wk� od Jeremiasza.
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_02"); //�e co? Ten le� nie m�g� si� sam ruszy� i teraz wysy�a ch�opca na posy�ki?
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_03"); //Dobra, daj mi trzy butelki. Reszt� zanie� Lewusowi i ch�opakom.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_04"); //Nie ma sprawy.
		B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
		b_givexp (50);
		DIA_Ricelord_ALCO_BUNT.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_05"); //Pr�bujesz mnie oszuka�?! 
        AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_06"); //Nie masz tu trzech butelek!
        DIA_Ricelord_ALCO_BUNT.permanent = true;
    };
    AI_StopProcessInfos	(self);
    
};

////////////////////////////////////////////
//	Ring Theft
////////////////////////////////////////////

INSTANCE DIA_Ricelord_RingTheft (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_RingTheft_Condition;
   information  = DIA_Ricelord_RingTheft_Info;
   permanent	= FALSE;
   description	= "Lewus podarowa� tw�j pier�cie� Pock'owi.";
};

FUNC INT DIA_Ricelord_RingTheft_Condition()
{
    if (Quest_StealRing == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_RingTheft_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_RingTheft_15_01"); //Lewus podarowa� tw�j pier�cie� Pock'owi. To mia� by� dow�d wdzi�czno�ci za pomoc.
    AI_Output (self, other ,"DIA_Ricelord_RingTheft_03_02"); //Ten sukinsyn ju� od dawna sadzi� si� na m�j pier�cie�. LEWUS, ZDRAJCA! BRA� GO!
    //AI_Output (self, other ,"DIA_Ricelord_RingTheft_03_03"); //
    
	Bau_900_Ricelord.flags = 2;

    AI_StopProcessInfos	(Bau_900_Ricelord);
	AI_GotoNpc(Bau_900_Ricelord, Org_844_Lefty);
	
	Npc_SetTarget (Bau_900_Ricelord, Org_844_Lefty);
    AI_StartState (Org_844_Lefty, ZS_ATTACK, 1, "");
	
	B_ChangeGuild (Org_844_Lefty, GIL_BDT);
};

////////////////////////////////////////////
//	Peace
////////////////////////////////////////////

INSTANCE DIA_Ricelord_Peace (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_Peace_Condition;
   information  = DIA_Ricelord_Peace_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Ricelord_Peace_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ricelord_RingTheft)) && (Npc_IsDead(Org_844_Lefty))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ricelord_Peace_Info()
{
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_02"); //Tfu, ten pod�y sukinsyn gryzie piach.
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_03"); //Sko�czcie ju� t� dziecinad�. Przystan� na wszystkie warunki. Dostaniecie lepsze �arcie i wi�cej spania.
	AI_Output (self, other ,"DIA_Ricelord_Peace_03_04"); //Tylko niech ci imbecyle wr�c� do pracy.
    AI_Output (other, self ,"DIA_Ricelord_Peace_15_01"); //W porz�dku. To ju� koniec.
	
	self.flags = 2;
	
    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (self, "start");
	
	B_LogEntry                     (CH1_BuntZbieraczy,"To ju� koniec rebelii Zbieraczy. Lewus nie �yje, a Ry�owy Ksi��� przysta� na warunki buntownik�w. Najwy�szy czas pogada� z Rufusem.");
};











//--------------------------------------------------------------------1.6.1------------------------------------------------------------

//========================================
//-----------------> Plaga
//========================================

INSTANCE DIA_Ricelord_Plaga (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_Plaga_Condition;
   information  = DIA_Ricelord_Plaga_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ricelord_Plaga_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_ORG)
{
    return TRUE;
};
};
FUNC VOID DIA_Ricelord_Plaga_Info()
{

    AI_Output (self, other ,"DIA_Ricelord_HELLO2_03_01"); //Hej, ty mam dla ciebie zadanie. 
    AI_Output (other, self ,"DIA_Ricelord_HELLO2_15_02"); //Jakie?
    AI_Output (self, other ,"DIA_Ricelord_HELLO2_03_03"); //W magazynie rozmno�y�y si� olbrzymie szczury wielkie jak psy. Trzeba je wybi� zanim wszystko wy�r�.



    Info_ClearChoices	(DIA_Ricelord_Plaga );
	Info_AddChoice		(DIA_Ricelord_Plaga,"Mam gdzie� twoje szczury. Jak dla mnie...",DIA_Ricelord_Plaga_Nie);
	Info_AddChoice		(DIA_Ricelord_Plaga,"Mog� zaj�� si� szczurami. Ale nie za darmo rzecz jasna.",DIA_Ricelord_Plaga_Tak);


};


func void DIA_Ricelord_Plaga_Nie()
{
	AI_Output (other, self,"DIA_Ricelord_Plaga_Nie_15_00"); //Mam gdzie� twoje szczury. Jak dla mnie mog� zje�� nawet i ciebie.
	AI_Output (self, other,"DIA_Ricelord_Plaga_Nie_07_01"); //Co za leniwy gn�j, nawet szczur�w si� boi. Zje�d�aj st�d zanim moi ludzie zrobi� z tob� porz�dek!
	AI_StopProcessInfos	(self);
};


func void DIA_Ricelord_Plaga_Tak()
{
	AI_Output (other, self,"DIA_Ricelord_Plaga_Tak_15_00"); //Mog� zaj�� si� szczurami. Ale nie za darmo rzecz jasna.
	AI_Output (self, other,"DIA_Ricelord_Plaga_Tak_07_01"); //Dostaniesz sporo rudy ale najpierw masz pozabija� wszystkie te gadziny, co do jednej.
	AI_Output (other, self,"DIA_Ricelord_Plaga_Tak_15_02"); //Zajm� si� tym.
	Log_CreateTopic		(Plaga,	LOG_MISSION);
	Log_SetTopicStatus	(Plaga,	LOG_RUNNING);
	B_LogEntry               (Plaga,"W magazynie ry�owego ksi�cia rozmno�y�y si� szczury. Teraz ten marny gospodarz chce bym poszed� do magazynu i wybi� wszystkie szczury. Skoro proponuje rud� to zajm� si� tym.");
	AI_Output (self, other,"DIA_Ricelord_Plaga_Tak_07_03"); //No to nie st�j tak grzebi�c sobie w ty�ku tylko id� tam i zr�b co trzeba.
	AI_StopProcessInfos	(self);
	Ricelord_Szczury = TRUE;
	Wld_InsertNpc				(Giant_Rat_P1,"WP_PLAGA_RAT1"); 
	Wld_InsertNpc				(Giant_Rat_P2,"WP_PLAGA_RAT2"); 
	Wld_InsertNpc				(Giant_Rat_P3,"WP_PLAGA_RAT3");
	Wld_InsertNpc				(Giant_Rat_P4,"WP_PLAGA_RAT4");
	Wld_InsertNpc				(Giant_Rat_P5,"WP_PLAGA_RAT5");
};







//========================================
//-----------------> Plaga_Szczury
//========================================

INSTANCE DIA_Ricelord_Plaga_Szczury (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 2;
   condition    = DIA_Ricelord_Plaga_Szczury_Condition;
   information  = DIA_Ricelord_Plaga_Szczury_Info;
   permanent	= FALSE;
   description	= "Olbrzymie szczury nie �yj�.";
};


FUNC INT DIA_Ricelord_Plaga_Szczury_Condition()
{
if (Ricelord_Szczury == TRUE)
 && (Npc_IsDead (Giant_Rat_P1))
  && (Npc_IsDead (Giant_Rat_P2))
   && (Npc_IsDead (Giant_Rat_P3))
    && (Npc_IsDead (Giant_Rat_P4))
	 && (Npc_IsDead (Giant_Rat_P5))
 
 
 
{
    return TRUE;
};
};
FUNC VOID DIA_Ricelord_Plaga_Szczury_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_01"); //Olbrzymie szczury nie �yj�.
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_02"); //Nie�le.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_03"); //I tylko tyle?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_04"); //O co ci chodzi?
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_05"); //Mo�e o zap�at�?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_06"); //A kto ci powiedzia�, �e to wszystko.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_07"); //To czego jeszcze chcesz?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_08"); //To dopiero u�amek sukcesu bo szczury powr�c�.
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_09"); //Potrzebna jest specjalna mikstura, kt�ra rozlana w magazynie odstraszy te plugawe stworzenia.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_10"); //Sk�d mam j� wzi��?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_11"); //Id� do Jeremiasza i powiedz mu o co chodzi.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_12"); //Niech strac�. Skoro ju� upora�em si� ze szczurami to przynios� t� mikstur�.
    B_LogEntry               (Plaga,"Wybi�em wszystkie szczury w magazynie. Teraz Ry�owy Ksi��� chce bym zdoby� mikstur�, kt�ra rozlana w magazynie odstraszy szczury. Mam pom�wi� z alchemikiem Jeremiaszem.");
};



//========================================
//-----------------> Plaga
//========================================

INSTANCE DIA_Ricelord_P_Sadlo (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 5;
   condition    = DIA_Ricelord_P_Sadlo_Condition;
   information  = DIA_Ricelord_P_Sadlo_Info;
   permanent	= FALSE;
   description	= "Pono� masz sad�o kretoszczura.";
};

FUNC INT DIA_Ricelord_P_Sadlo_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jeremiah_Plaga))
{
    return TRUE;
};
};
FUNC VOID DIA_Ricelord_P_Sadlo_Info()
{

    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_02"); //Pono� masz sad�o kretoszczura. Jeremiasz potrzebuje tego do mikstury odp�dzaj�cej szczury.
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_03"); //Tak? W takim razie bierz.
	CreateInvItem (self, ItMi_Alchemy_Moleratlubric_01);
	B_GiveInvItems (self,other,ItMi_Alchemy_Moleratlubric_01,1);
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_04"); //I ruszaj si� bo te gadziny zn�w zalegn� si� w magazynie.
    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_05"); //Przy takim gospodarzu to nic dziwnego... (pod nosem)
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_06"); //M�wi�e� co�?
    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_07"); //Sk�d�e. 
B_LogEntry               (Plaga,"Wzi��em sad�o kretoszczura od Ry�owego ksi�cia. Musz� jeszcze zaj�� si� innymi sk�adnikami do mikstury.");

};



//========================================
//-----------------> POTION_P
//========================================

INSTANCE DIA_Ricelord_POTION_P (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_POTION_P_Condition;
   information  = DIA_Ricelord_POTION_P_Info;
   permanent	= FALSE;
   description	= "Mam mikstur�, kt�rej potrzebujesz.";
};

FUNC INT DIA_Ricelord_POTION_P_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jeremiah_P_Potion))
&& (Npc_HasItems (other, ItMi_Plaga_Potion) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Ricelord_POTION_P_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_01"); //Mam mikstur�, kt�rej potrzebujesz.
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_02"); //No to nie st�j jak s�up soli tylko mi j� dawaj.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_03"); //Masz.
	B_GiveInvItems (other,self, ItMi_Plaga_Potion, 1);
	Npc_RemoveInvItems(Bau_900_Ricelord, ItMi_Plaga_Potion, 1);
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_04"); //Rozleje j� w magazynie. To powinno pom�c.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_05"); //To teraz chyba pora na zap�at�.
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_07"); //Co takiego?!
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_08"); //Jeszcze nie skonczy�e�.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_09"); //Jak to?
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_10"); //Potrzebuje cz�owieka do pilnowania magazynu. Masz mi go znale��, chyba �e sam chcesz si� tym zaj��.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_11"); //Gdzie mam go szuka�?
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_12"); //To ju� tw�j problem. Pogadaj z Lewusem... Albo ze zbieraczami. Nie wiem...
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_13"); //Dobra. Ale to ju� ostatnia przys�uga jak� ci wy�wiadczam.
	B_LogEntry               (Plaga,"To jednak nie koniec. Ry�owy Ksi��� chce bym znalaz� jeszcze str�a do jego magazynu. Musz� go poszuka� w pobli�u. By� mo�e uda mi si� nak�oni� Lewusa...");
};

//========================================
//-----------------> P_Koniec
//========================================

INSTANCE DIA_Ricelord_P_Koniec (C_INFO)
{
   npc          = Bau_900_Ricelord;
   nr           = 1;
   condition    = DIA_Ricelord_P_Koniec_Condition;
   information  = DIA_Ricelord_P_Koniec_Info;
   permanent	= FALSE;
   description	= "Pock zajmie si� twoim magazynem.";
};

FUNC INT DIA_Ricelord_P_Koniec_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Pock_Plaga))
{
    return TRUE;
};
};
FUNC VOID DIA_Ricelord_P_Koniec_Info()
{
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_01"); //Pock zajmie si� twoim magazynem.
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_02"); //On? Na pewno nie ma kogo� lepszego?
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_03"); //Chyba, �e wolisz �eby Magowie Wody przetestowali na tobie nowe zakl�cie o nazwie ,,rozdwojenie�.
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_04"); //Bardzo �mieszne cwaniaczku... Niech b�dzie. Pock mo�e by� str�em magazynu.
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_05"); //To chcia�em us�ysze�. Ale nie tylko to... Co z zap�at�?
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_06"); //Dobra. Niby zrobi�e� co trzeba... wi�c we� t� rud�.
	B_GiveInvItems (self,other, itminugget, 80);
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_07"); //I ciesz si�, �e tyle ci zap�aci�em. Liczy�em, �e zajmiesz si� tym szybciej.
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_08"); //Udam, �e tego nie s�ysza�em. Na razie.
	B_LogEntry               (Plaga,"Powiedzia�em Ry�owemu Ksi�ciu o tym, �e znalaz�em stra�nika dla jego magazynu. Wreszcie wyp�aci� mi nale�n� rud�. Mam nadzieje, �e to ostatni interes jaki z nim ubijam.");
	Log_SetTopicStatus	(Plaga,	LOG_SUCCESS);
	B_GiveXP(220);
};

instance dia_ricelord_pickpocket(c_info) {
    npc = bau_900_ricelord;
    nr = 900;
    condition = dia_ricelord_pickpocket_condition;
    information = dia_ricelord_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ricelord_pickpocket_condition() {
	e_beklauen(baseThfChanceBAU, 25);
};

func void dia_ricelord_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ricelord_pickpocket);
	info_addchoice(dia_ricelord_pickpocket, dialog_back, dia_ricelord_pickpocket_back);
	info_addchoice(dia_ricelord_pickpocket, dialog_pickpocket, dia_ricelord_pickpocket_doit);
};

func void dia_ricelord_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_ricelord_pickpocket);
};

func void dia_ricelord_pickpocket_back() {
    info_clearchoices(dia_ricelord_pickpocket);
};


