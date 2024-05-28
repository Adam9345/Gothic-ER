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
	description	= "Troszczysz siê o pola ry¿owe, czy¿ nie?";
};                       

FUNC INT DIA_Ricelord_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Ricelord_Hello_Info()
{	
	AI_Output (other, self,"DIA_Ricelord_Hello_15_00"); //Troszczysz siê o pola ry¿owe, czy¿ nie?
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
	description	= "A masz dla mnie jakieœ zajêcie?";
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
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakieœ zajêcie?
	AI_Output (self, other,"DIA_Ricelord_Arbeit_12_01"); //Porozmawiaj z Lewusem. Krêci siê zwykle na prawo od szopy.
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
	description	= "Mo¿e siê dogadamy...";
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
	AI_Output (other, self,"DIA_Ricelord_TRADE_15_00"); //Mo¿e siê dogadamy...
	AI_Output (self, other,"DIA_Ricelord_TRADE_12_01"); //A co mo¿esz mi zaoferowaæ?
	var int wpis_handel_ricelord;
	if wpis_handel_ricelord == false
	{
	wpis_handel_ricelord = true;
	Log_CreateTopic   	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry			(GE_TraderNC,	"Jak siê okazuje z Ry¿owym Ksiêciem mo¿na handlowaæ. Sprzedaje czêœæ towarów z magazynu. ");
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
	description	= "Przysy³a mnie Lewus.";
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
	AI_Output (other, self,"DIA_Ricelord_LeftySentMe_15_00"); //Przysy³a mnie Lewus.
	AI_Output (self, other,"DIA_Ricelord_LeftySentMe_12_01"); //Tak? I co powiedzia³?
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
	description	= "Mam zanieœæ wodê zbieraczom ry¿u!";
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
	AI_Output (other, self,"DIA_Ricelord_GetWater_15_00"); //Mam zanieœæ wodê zbieraczom ry¿u!
	
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_01"); //Dobra. Masz tu tuzin butelek.
		AI_Output			(self, other,"DIA_Ricelord_GetWater_12_02"); //To jakieœ dwa razy wiêcej ni¿ liczba zbieraczy, wiêc postaraj siê rozdzieliæ je sprawiedliwie.

		CreateInvItems		(self, ItFo_Potion_Water_01, 12);
		B_GiveInvItems		(self, other, ItFo_Potion_Water_01, 12);

		Ricelord_AskedForWater = FALSE;
		B_LogEntry			(CH1_CarryWater,	"Ry¿owy Ksi¹¿e da³ mi tuzin butelek z wod¹.");

		AI_StopProcessInfos	(self);
	}
	else if (Lefty_WorkDay == Wld_GetDay()-1)
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_00"); //To by³o wczoraj, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Ricelord_GetWater_TooLate_12_01"); //To by³o parê dni temu, ch³opcze. Lepiej zajrzyj znowu do Lewusa. Chyba ma ci coœ do powiedzenia.
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
   description	= "Co mo¿esz mi powiedzieæ o polach ry¿owych?";
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
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_01"); //Co mo¿esz mi powiedzieæ o polach ry¿owych?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_02"); //Ja jestem tu szefem. Zarz¹dzam ca³¹ prac¹.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_03"); //Pomaga mi Lewus.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_04"); //I jak zbiory?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_05"); //Du¿e. Ostatnio idzie coraz lepiej.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_06"); //To z pewnoœci¹ twoja zas³uga... 
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_07"); //Tak, masz racjê.
    AI_Output (other, self ,"DIA_Ricelord_RYZ_15_08"); //Co robicie z nadwy¿k¹ ry¿u?
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_09"); //Zatrzymujemy w magazynach. Niewielk¹ czêœæ sprzedajemy do innych obozów.
    AI_Output (self, other ,"DIA_Ricelord_RYZ_03_10"); //G³ównie do Bractwa. Ale s¹ to naprawdê ma³e iloœci.
    knowsRice = true;
    B_LogEntry                     (CH1_TestOc,"Sporo siê dowiedzia³em od Ry¿owego Ksiêcia. Nadwy¿ka ry¿u jest sprzedawana do Bractwa.");
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
   description	= "Przysy³a mnie Homer, mam dla ciebie ry¿ówkê od Jeremiasza.";
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
    AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_01"); //Przysy³a mnie Homer, mam dla ciebie ry¿ówkê od Jeremiasza.
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_02"); //¯e co? Ten leñ nie móg³ siê sam ruszyæ i teraz wysy³a ch³opca na posy³ki?
    AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_03"); //Dobra, daj mi trzy butelki. Resztê zanieœ Lewusowi i ch³opakom.
    if (Npc_HasItems (other, ItMi_SpecialBooze) >=3)
    {
        AI_Output (other, self ,"DIA_Ricelord_ALCO_BUNT_15_04"); //Nie ma sprawy.
		B_GiveInvItems (other, self, ItMi_SpecialBooze, 3);
		b_givexp (50);
		DIA_Ricelord_ALCO_BUNT.permanent = false;
    }
    else
    {
        AI_Output (self, other ,"DIA_Ricelord_ALCO_BUNT_03_05"); //Próbujesz mnie oszukaæ?! 
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
   description	= "Lewus podarowa³ twój pierœcieñ Pock'owi.";
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
    AI_Output (other, self ,"DIA_Ricelord_RingTheft_15_01"); //Lewus podarowa³ twój pierœcieñ Pock'owi. To mia³ byæ dowód wdziêcznoœci za pomoc.
    AI_Output (self, other ,"DIA_Ricelord_RingTheft_03_02"); //Ten sukinsyn ju¿ od dawna sadzi³ siê na mój pierœcieñ. LEWUS, ZDRAJCA! BRAÆ GO!
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
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_02"); //Tfu, ten pod³y sukinsyn gryzie piach.
    AI_Output (self, other ,"DIA_Ricelord_Peace_03_03"); //Skoñczcie ju¿ tê dziecinadê. Przystanê na wszystkie warunki. Dostaniecie lepsze ¿arcie i wiêcej spania.
	AI_Output (self, other ,"DIA_Ricelord_Peace_03_04"); //Tylko niech ci imbecyle wróc¹ do pracy.
    AI_Output (other, self ,"DIA_Ricelord_Peace_15_01"); //W porz¹dku. To ju¿ koniec.
	
	self.flags = 2;
	
    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (self, "start");
	
	B_LogEntry                     (CH1_BuntZbieraczy,"To ju¿ koniec rebelii Zbieraczy. Lewus nie ¿yje, a Ry¿owy Ksi¹¿ê przysta³ na warunki buntowników. Najwy¿szy czas pogadaæ z Rufusem.");
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
    AI_Output (self, other ,"DIA_Ricelord_HELLO2_03_03"); //W magazynie rozmno¿y³y siê olbrzymie szczury wielkie jak psy. Trzeba je wybiæ zanim wszystko wy¿r¹.



    Info_ClearChoices	(DIA_Ricelord_Plaga );
	Info_AddChoice		(DIA_Ricelord_Plaga,"Mam gdzieœ twoje szczury. Jak dla mnie...",DIA_Ricelord_Plaga_Nie);
	Info_AddChoice		(DIA_Ricelord_Plaga,"Mogê zaj¹æ siê szczurami. Ale nie za darmo rzecz jasna.",DIA_Ricelord_Plaga_Tak);


};


func void DIA_Ricelord_Plaga_Nie()
{
	AI_Output (other, self,"DIA_Ricelord_Plaga_Nie_15_00"); //Mam gdzieœ twoje szczury. Jak dla mnie mog¹ zjeœæ nawet i ciebie.
	AI_Output (self, other,"DIA_Ricelord_Plaga_Nie_07_01"); //Co za leniwy gnój, nawet szczurów siê boi. Zje¿d¿aj st¹d zanim moi ludzie zrobi¹ z tob¹ porz¹dek!
	AI_StopProcessInfos	(self);
};


func void DIA_Ricelord_Plaga_Tak()
{
	AI_Output (other, self,"DIA_Ricelord_Plaga_Tak_15_00"); //Mogê zaj¹æ siê szczurami. Ale nie za darmo rzecz jasna.
	AI_Output (self, other,"DIA_Ricelord_Plaga_Tak_07_01"); //Dostaniesz sporo rudy ale najpierw masz pozabijaæ wszystkie te gadziny, co do jednej.
	AI_Output (other, self,"DIA_Ricelord_Plaga_Tak_15_02"); //Zajmê siê tym.
	Log_CreateTopic		(Plaga,	LOG_MISSION);
	Log_SetTopicStatus	(Plaga,	LOG_RUNNING);
	B_LogEntry               (Plaga,"W magazynie ry¿owego ksiêcia rozmno¿y³y siê szczury. Teraz ten marny gospodarz chce bym poszed³ do magazynu i wybi³ wszystkie szczury. Skoro proponuje rudê to zajmê siê tym.");
	AI_Output (self, other,"DIA_Ricelord_Plaga_Tak_07_03"); //No to nie stój tak grzebi¹c sobie w ty³ku tylko idŸ tam i zrób co trzeba.
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
   description	= "Olbrzymie szczury nie ¿yj¹.";
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
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_01"); //Olbrzymie szczury nie ¿yj¹.
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_02"); //NieŸle.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_03"); //I tylko tyle?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_04"); //O co ci chodzi?
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_05"); //Mo¿e o zap³atê?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_06"); //A kto ci powiedzia³, ¿e to wszystko.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_07"); //To czego jeszcze chcesz?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_08"); //To dopiero u³amek sukcesu bo szczury powróc¹.
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_09"); //Potrzebna jest specjalna mikstura, która rozlana w magazynie odstraszy te plugawe stworzenia.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_10"); //Sk¹d mam j¹ wzi¹æ?
    AI_Output (self, other ,"DIA_Ricelord_Plaga_Szczury_03_11"); //IdŸ do Jeremiasza i powiedz mu o co chodzi.
    AI_Output (other, self ,"DIA_Ricelord_Plaga_Szczury_15_12"); //Niech stracê. Skoro ju¿ upora³em siê ze szczurami to przyniosê tê miksturê.
    B_LogEntry               (Plaga,"Wybi³em wszystkie szczury w magazynie. Teraz Ry¿owy Ksi¹¿ê chce bym zdoby³ miksturê, która rozlana w magazynie odstraszy szczury. Mam pomówiæ z alchemikiem Jeremiaszem.");
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
   description	= "Ponoæ masz sad³o kretoszczura.";
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

    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_02"); //Ponoæ masz sad³o kretoszczura. Jeremiasz potrzebuje tego do mikstury odpêdzaj¹cej szczury.
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_03"); //Tak? W takim razie bierz.
	CreateInvItem (self, ItMi_Alchemy_Moleratlubric_01);
	B_GiveInvItems (self,other,ItMi_Alchemy_Moleratlubric_01,1);
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_04"); //I ruszaj siê bo te gadziny znów zalegn¹ siê w magazynie.
    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_05"); //Przy takim gospodarzu to nic dziwnego... (pod nosem)
    AI_Output (self, other ,"DIA_Ricelord_P_Sadlo_03_06"); //Mówi³eœ coœ?
    AI_Output (other, self ,"DIA_Ricelord_P_Sadlo_15_07"); //Sk¹d¿e. 
B_LogEntry               (Plaga,"Wzi¹³em sad³o kretoszczura od Ry¿owego ksiêcia. Muszê jeszcze zaj¹æ siê innymi sk³adnikami do mikstury.");

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
   description	= "Mam miksturê, której potrzebujesz.";
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
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_01"); //Mam miksturê, której potrzebujesz.
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_02"); //No to nie stój jak s³up soli tylko mi j¹ dawaj.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_03"); //Masz.
	B_GiveInvItems (other,self, ItMi_Plaga_Potion, 1);
	Npc_RemoveInvItems(Bau_900_Ricelord, ItMi_Plaga_Potion, 1);
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_04"); //Rozleje j¹ w magazynie. To powinno pomóc.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_05"); //To teraz chyba pora na zap³atê.
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_07"); //Co takiego?!
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_08"); //Jeszcze nie skonczy³eœ.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_09"); //Jak to?
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_10"); //Potrzebuje cz³owieka do pilnowania magazynu. Masz mi go znaleŸæ, chyba ¿e sam chcesz siê tym zaj¹æ.
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_11"); //Gdzie mam go szukaæ?
    AI_Output (self, other ,"DIA_Ricelord_POTION_P_03_12"); //To ju¿ twój problem. Pogadaj z Lewusem... Albo ze zbieraczami. Nie wiem...
    AI_Output (other, self ,"DIA_Ricelord_POTION_P_15_13"); //Dobra. Ale to ju¿ ostatnia przys³uga jak¹ ci wyœwiadczam.
	B_LogEntry               (Plaga,"To jednak nie koniec. Ry¿owy Ksi¹¿ê chce bym znalaz³ jeszcze stró¿a do jego magazynu. Muszê go poszukaæ w pobli¿u. Byæ mo¿e uda mi siê nak³oniæ Lewusa...");
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
   description	= "Pock zajmie siê twoim magazynem.";
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
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_01"); //Pock zajmie siê twoim magazynem.
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_02"); //On? Na pewno nie ma kogoœ lepszego?
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_03"); //Chyba, ¿e wolisz ¿eby Magowie Wody przetestowali na tobie nowe zaklêcie o nazwie ,,rozdwojenie”.
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_04"); //Bardzo œmieszne cwaniaczku... Niech bêdzie. Pock mo¿e byæ stró¿em magazynu.
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_05"); //To chcia³em us³yszeæ. Ale nie tylko to... Co z zap³at¹?
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_06"); //Dobra. Niby zrobi³eœ co trzeba... wiêc weŸ tê rudê.
	B_GiveInvItems (self,other, itminugget, 80);
    AI_Output (self, other ,"DIA_Ricelord_P_Koniec_03_07"); //I ciesz siê, ¿e tyle ci zap³aci³em. Liczy³em, ¿e zajmiesz siê tym szybciej.
    AI_Output (other, self ,"DIA_Ricelord_P_Koniec_15_08"); //Udam, ¿e tego nie s³ysza³em. Na razie.
	B_LogEntry               (Plaga,"Powiedzia³em Ry¿owemu Ksiêciu o tym, ¿e znalaz³em stra¿nika dla jego magazynu. Wreszcie wyp³aci³ mi nale¿n¹ rudê. Mam nadzieje, ¿e to ostatni interes jaki z nim ubijam.");
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


