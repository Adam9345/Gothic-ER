//poprawione i sprawdzone - Reflide

// ************************ EXIT **************************

instance  GRD_261_Brandick_Exit (C_INFO)
{
	npc			=  GRD_261_Brandick;
	nr			= 999;
	condition	=  GRD_261_Brandick_Exit_Condition;
	information	=  GRD_261_Brandick_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> WALKING
//========================================

INSTANCE DIA_Brandick_WALKING (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_Brandick_WALKING_Condition;
   information  = DIA_Brandick_WALKING_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brandick_WALKING_Condition()
{
if (Kapitel == 2)
{
    return TRUE;
};
};
FUNC VOID DIA_Brandick_WALKING_Info()
{
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_01"); //Znowu tu ³azisz?
    AI_Output (other, self ,"DIA_Brandick_WALKING_15_02"); //A co w tym z³ego?
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_03"); //Pa³êtasz siê po moim rewirze. A ja cenie spokój, porz¹dek i skrupulatnoœæ. 
    AI_Output (other, self ,"DIA_Brandick_WALKING_15_04"); //Powia³o ch³odem.
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_05"); //Jak chcesz siê rozgrzaæ to walnij mocn¹ gorza³ê. I nie wychylaj mi siê tu!
};


// ***************** Infos *****************************

instance  GRD_261_Brandick_ALEPH (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_ALEPH_Condition;
	information		= GRD_261_Brandick_ALEPH_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Wydaj Alepha)"; 
};

FUNC int  GRD_261_Brandick_ALEPH_Condition()
{	
	if ( Npc_KnowsInfo ( hero, VLK_585_Aleph_GUARDS) )
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_ALEPH_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_ALEPH_Info_15_01"); //S³uchaj, za ka¿dym razem, kiedy siê odwracasz, Aleph siedzi bezczynnie i zbija b¹ki.
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Czy¿by?
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Wiesz jakich ludzi nienawidzê jeszcze bardziej od obiboków? Donosicieli! ZejdŸ mi z oczu!
	
	AI_StopProcessInfos	(self);
};  

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_HELLO1 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_HELLO1_Condition;
   information  = DIA_brandick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_brandick_HELLO1_Condition()
{

	if (kapitel < 4) 
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_02"); //Brandick. Pilnujê porz¹dku w Kopalni i dbam o to, ¿eby nasi ludzie siê nie obijali. Masz jakiœ problem?
	AI_Output (other, self ,"DIA_brandick_HELLO1_15_03"); //Nie, a ty?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_04"); //Ca³¹ masê problemów. W bocznych szybach roi siê od pe³zaczy i trolli ziemnych. Te skurwiele potrafi¹ napsuæ nerwów. 
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_05"); //Trolle ziemne? Myœla³em, ¿e trolle nie ¿yj¹ pod ziemi¹, tylko w górach.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_06"); //Zwyk³e i czarne trolle jak najbardziej. Jednak ziemne trolle nieco siê ró¿ni¹ od swych pobratymców.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_07"); //S¹ mniejszej postury i lubi¹ ciemnoœci. Jak bêdziesz mia³ pecha, to spotkasz jakiegoœ w jaskini na powierzchni. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_08"); //To, ¿e s¹ mniejsze, nie czyni ich jednak mniej niebezpiecznymi.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_09"); //Jakiœ czas temu grupa Œwi¹tynnych Stra¿ników wybra³a siê, ¿eby trochê zredukowaæ liczbê tego ta³atajstwa. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_10"); //To, co z nich zosta³o nie nadawa³o siê nawet na nawóz, he he. Chyba przecenili swoje si³y.
	MIS_Brandick = TRUE;
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_brandick_HELLO2 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 2;
   condition    = DIA_brandick_HELLO2_Condition;
   information  = DIA_brandick_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_brandick_HELLO2_Condition()
{
if (kapitel < 4) 
{
    return TRUE; 
};
};

FUNC VOID DIA_brandick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO2_15_01"); //Jak leci?
    if (!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_02"); //S³yszysz? Tam na dole, w dziurze czaj¹ siê pe³zacze. Mam nadziejê, ¿e nie towarzysz¹ im ziemne trolle...
		
		
    }
    else
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_03"); //Gówno ciê to obchodzi. Powiedzia³em, ¿e nie tolerujê donosicieli! Spadaj st¹d darmozjadzie!
    
    AI_StopProcessInfos	(self);
};
};

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Brandick_DIE (C_INFO)
{
	npc			= GRD_261_Brandick;
	condition	= Info_Brandick_DIE_Condition;
	information	= Info_Brandick_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Brandick_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Brandick_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomyœleæ, ¿e uwa¿aliœmy ciê za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog¹ ci nawet znajomoœci wœród Cieni!
		};			

		AI_Output		(hero,self,"Info_Brandick_DIE_15_04"); //O czym ty do diab³a mówisz, Brandick?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz siê z tymi bandziorami z Nowego Obozu! A mo¿e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myœla³eœ, ¿e siê nie domyœlimy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada³eœ zmys³y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale¿ sk¹d. Za to TY za chwilê stracisz G£OWÊ, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GIÑ, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa³ siê przy tylnej bramie. Na mój widok zareagowa³ podobnie jak Brandick. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Brandick, który strze¿e teraz g³ównej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No proszê. To goœæ z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To goœæ z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jakiœ problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mieæ, to ja bêdê wasz¹ ma³¹ kopalniê!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy¿by? Chyba œnisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k³opotów.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by³o o tym pomyœleæ zanim tutaj przyszed³eœ!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch³opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTAKEN2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_261_Brandick,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};
//---------------------------------------------------------------------------------------1.6.1-----------------------------------------------------------------

// ***************** Skóry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Skory (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Skory_Condition;
	information		= GRD_261_Brandick_Skory_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wspominaj¹c o trollach ziemnych mia³eœ dziwny wyraz twarzy."; 
};

FUNC int  GRD_261_Brandick_Skory_Condition()
{	
	if (MIS_Brandick == TRUE)
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Skory_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_Skory_Info_15_01"); //Wspominaj¹c o trollach ziemnych mia³eœ dziwny wyraz twarzy.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_02"); //Gdybyœ by³ na tyle g³upi i szalony to...
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_03"); //Móg³byœ mi przynieœæ 3 skóry tych bestii. Wtedy móg³bym je kapitalnie opchn¹æ Alberto lub Santino.
	AI_Output			(other, self,"GRD_261_Brandick_Skory_Info_15_04"); //Muszê siê zastanowiæ.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_05"); //Na twoim miejscu bym odmówi³. Ale z drugiej strony zaoferuje ci za to naprawdê sporo rudy.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_06"); //Chocia¿ po co ruda trupowi...
	
	
};  

// ***************** Skóry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Decyzja (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Decyzja_Condition;
	information		= GRD_261_Brandick_Decyzja_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zdecydowa³em siê."; 
};

FUNC int  GRD_261_Brandick_Decyzja_Condition()
{	
	if (MIS_Brandick == TRUE)
	&& (Npc_KnowsInfo (hero ,GRD_261_Brandick_Skory))
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Decyzja_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_Decyzja_Info_15_01"); //Zdecydowa³em siê.
	AI_Output			(self, other,"GRD_261_Brandick_Decyzja_Info_06_02"); //Albo jesteœ cholernie odwa¿ny albo twoje mózgowie nieŸle szwankuje.
	AI_Output			(self, other,"GRD_261_Brandick_Decyzja_Info_06_03"); //W ka¿dym razie ¿yczê powodzenia m³ody. W razie sukcesu czyli zdobycia skór, wiesz gdzie mnie szukaæ.
	AI_Output			(other, self,"GRD_261_Brandick_Decyzja_Info_15_04"); //Jasne.
	Log_CreateTopic       (Skory, LOG_MISSION);
	Log_SetTopicStatus       (Skory, LOG_RUNNING);
	B_LogEntry                     (Skory,"Brandick wspomina³ o ¿yj¹cych w Starej Kopalni trollach ziemnych. Mówi³, ¿e ich skóry s¹ bardzo cenne. Gdybym by³ na tyle odwa¿ny lub g³upi móg³bym je dla niego zdobyæ. Oczywiœcie za stosown¹ nagrodê. ");
	
};  

// ***************** Skóry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Mamskore (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Mamskore_Condition;
	information		= GRD_261_Brandick_Mamskore_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam skóry trolli ziemnych."; 
};

FUNC int  GRD_261_Brandick_Mamskore_Condition()
{	
    if (Npc_HasItems(hero, ItAt_TrollFur)>=3)
	&& (Npc_KnowsInfo (hero ,GRD_261_Brandick_Decyzja))
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Mamskore_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_01"); //Mam skóry trolli ziemnych.
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_02"); //¯artujesz? Taki ¿ó³todziób zdo³a³ pozyskaæ skóry trolli ziemnych?!
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_03"); //Jestem pod wielkim wra¿eniem tego wyczynu. Niez³y z ciebie myœliwy, m³ody.
	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_04"); //Oto twoje skóry.
	B_GiveInvItems (other, self,ItAt_TrollFur, 3);
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_05"); //A to nagroda za nie. Zas³u¿y³eœ na ni¹ w pe³ni.
	B_GiveInvItems (self, other,ItMiNugget, 200);
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_06"); //W wolnej chwili dobije targu z handlarzami. Zacieram ju¿ rêce na t¹ myœl.
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_07"); //A póki co wracam do swoich obowi¹zków.
	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_08"); //Dziêki za rudê i bywaj.
	AI_StopProcessInfos	(self);
    B_GiveXP (200);
	B_LogEntry                     (Skory,"Zdoby³em skóry trolli ziemnych i rozmawia³em z Brandickiem. By³ zadowolony i wyp³aci³ mi nale¿n¹ rudê. Ryzyko jak widaæ siê op³aci³o. Przynajmniej tym razem. ");
	Log_SetTopicStatus       (Skory, LOG_SUCCESS);
};  



// ***************** Ciekawe znalezisko *****************************

instance  GRD_261_Brandick_Amulet (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Amulet_Condition;
	information		= GRD_261_Brandick_Amulet_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czy mogê coœ dla ciebie zrobiæ?"; 
};

FUNC int  GRD_261_Brandick_Amulet_Condition()
{	
     if  (Kapitel == 2)

	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Amulet_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_01"); //Czy mogê coœ dla ciebie zrobiæ?
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_02"); //Tak, odejœæ st¹d....
	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_03"); //Jak chcesz.
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_04"); //Czekaj... Jest coœ do czego chyba móg³byœ mi siê przydaæ, choæ trochê w¹tpiê w to czy jesteœ do tego odpowiedni¹ osob¹.
	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_05"); //O co chodzi?
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_06"); //Kilka tygodni temu w innym rewirze kopalni odkryto zw³oki œwi¹tynnego wojownika z sekty. Widaæ mia³ mniej szczêœcia ni¿ jego towarzysze.
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_07"); //By³em jednym z pierwszych, którzy go znaleŸli.


	 Info_ClearChoices (GRD_261_Brandick_Amulet);
	 Info_AddChoice    (GRD_261_Brandick_Amulet,"I co by³o dalej?",GRD_261_Brandick_Amulet_ADD);
};  
   // B_GiveXP (200);


FUNC VOID GRD_261_Brandick_Amulet_ADD()
  {
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_00");  //I co by³o dalej?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_01");  //Przeszuka³em zw³oki i znalaz³em przy nich pewien ciekawy medalion.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_02");  //Chwilê póŸniej pojawili siê inni wojownicy œwi¹tynni ale ja zapomnia³em o tej b³yskotce i zosta³a w mojej kieszeni.
    AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_03");  //Ale wiem co nale¿y zrobiæ.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_04");  //Po czasie, przyjrza³em siê medalionowi. Jest wykonany z ¿elaza, ponadto ma ciekawy zielony odcieñ i mia³ chyba jakieœ w³aœciwoœci magiczne.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_05");  //Mia³?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_06");  //Niestety jest uszkodzony. A ja rzecz jasna nie wiem jak go naprawiæ.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_07");  //Co to ma wspólnego ze mn¹?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_08");  //B³yskotka pochodzi z sekty wiêc to tam szuka³bym pomocy w tej sprawie.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_09");  //To czemu siê tam nie udasz?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_10");  //Oszala³eœ?! Mam tu wa¿ny rewir do pilnowania a te nieroby kopacze tylko czekaj¹ ¿eby zacz¹æ siê obijaæ gdy nikt ich nie nadzoruje.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_11");  //W zwi¹zku z tym chcê ¿ebyœ wzi¹³ medalion i uda³ siê do Bractwa. Tam dowiedz siê co to za b³yskotka i czy jej naprawa jest warta zachodu.
	
     Log_CreateTopic          (CiekaweZnalezisko, LOG_MISSION);
	 Log_SetTopicStatus       (CiekaweZnalezisko, LOG_RUNNING);
	 B_LogEntry               (CiekaweZnalezisko,"Brandick opowiedzia³ mi ciekaw¹ historiê. W jednym z bocznych szybów odnaleziono zw³oki jednego ze œwi¹tynnych wojowników z obozu Bractwa. Mia³ on przy sobie pewien interesuj¹cy medalion. Jest jednak uszkodzony. Brandick chcia³by siê dowiedzieæ na ile jest on cenny. Muszê udaæ siê do Sekty i pogadaæ z kimœ zaufanym.");
	
};

//=======================================================


instance  GRD_261_Brandick_PSI_AMULET (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_PSI_AMULET_Condition;
	information		= GRD_261_Brandick_PSI_AMULET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dobrze, ale nie za nic!"; 
};

FUNC int  GRD_261_Brandick_PSI_AMULET_Condition()
{	
    if (Npc_KnowsInfo (hero ,GRD_261_Brandick_Amulet))
	
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_PSI_AMULET_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET_Info_15_01"); //Dobrze, ale nie za nic!
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_02"); //Dostaniesz 300 bry³ek rudy.
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET_Info_15_03"); //To ju¿ brzmi lepiej.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_04"); //W takim razie masz go tutaj.
	B_GiveInvItems (self,other,Amulett_BrandickS, 1);
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_05"); //A ja wracam do swoich obowi¹zków.
    AI_StopProcessInfos	(self);
    
};  
//===================================================================================================================

instance  GRD_261_Brandick_PSI_AMULET1 (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_PSI_AMULET1_Condition;
	information		= GRD_261_Brandick_PSI_AMULET1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam twój medalion."; 
};

FUNC int  GRD_261_Brandick_PSI_AMULET1_Condition()
{	
    if (Npc_KnowsInfo (hero ,DIA_BaalOrun_Amulett_Ritual))
	&& (Brandick_Amulette == LOG_SUCCESS)
	&& (Npc_HasItems(hero, Amulett_Brandick_01)>=1)
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_PSI_AMULET1_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_01"); //Mam twój medalion.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_02"); //Naprawi³eœ go?
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_03"); //Tak, wymaga³ zreperowania ¿elaznej obudowy i w³o¿enia magicznego kamienia.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_04"); //Jakie w³aœciwoœci ma to cacko?	
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_05"); //Zwiêksza ¿ywotnoœæ posiadacza.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_06"); //Znakomicie. Daj mi go.
	
	
	
	
	 Info_ClearChoices (GRD_261_Brandick_PSI_AMULET1);
	 Info_AddChoice    (GRD_261_Brandick_PSI_AMULET1,"Najpierw ruda.",GRD_261_Brandick_Amulet_ADD1);
	
};  

FUNC VOID GRD_261_Brandick_Amulet_ADD1()
  {
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_00");  //Najpierw ruda.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_01");  //No dobra. Tak jak siê umawialiœmy 300 bry³ek.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_02");  //A ty trzymaj medalion.
    AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_03");  //Piêkna rzecz. Liczê, ¿e mi siê przyda.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_04");  //Zapewne tak.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_05");  //No có¿... Teraz pora powróciæ do obowi¹zków, czyli pilnowania ca³ego tego ba³aganu.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_06");  //Na razie.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_07");  //Do zobaczenia.
	B_GiveInvItems (other,self,Amulett_Brandick_01, 1);
	B_GiveInvItems (self,other,ItMiNugget,300);
	B_LogEntry               (CiekaweZnalezisko,"Wróci³em do Brandicka i odda³em magiczny medalion ponownie zdatny do u¿ytku. Stra¿nik by³ ze mnie zadowolony i wyp³aci³ mi umówione 300 bry³ek rudy.");
	Log_SetTopicStatus       (CiekaweZnalezisko, LOG_SUCCESS);
	B_GiveXP (300);
};




//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Boba_Sword (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Boba_Sword_Condition;
   information  = DIA_brandick_Boba_Sword_Info;
   permanent	= FALSE;
   description	= "Ponoæ zarekwirowa³eœ Alephowi pewien cenny minera³.";
};

FUNC INT DIA_brandick_Boba_Sword_Condition()
{

	if (Npc_KnowsInfo(other, DIA_Aleph_Srebrny_Grom))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Boba_Sword_Info()
{
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_01"); //Ponoæ zarekwirowa³eœ Alephowi pewien cenny minera³.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_02"); //Ten obibok ci¹gle siê leni, niech siê cieszy, ¿e nie dosta³ po ³bie.
	AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_03"); //Chcia³bym kupiæ ten surowiec od ciebie.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_04"); //Nie jest na sprzeda¿.
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_05"); //Jak to?
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_06"); //Nied³ugo wrócê do Starego obozu. Tam spróbuje sprzedaæ ten minera³ Bartholo on bêdzie siê na tym lepiej zna³.
   
};

//========================================
//-----------------> Silver_Nugg_Robb
//========================================

INSTANCE DIA_Brandick_Silver_Nugg_Robb (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 99;
   condition    = DIA_Brandick_Silver_Nugg_Robb_Condition;
   information  = DIA_Brandick_Silver_Nugg_Robb_Info;
   permanent	= FALSE;
   description	= "Ukradnij srebrny grom. (Wymagana zrêcznoœæ - 50)";
};

FUNC INT DIA_Brandick_Silver_Nugg_Robb_Condition()
{
    if (Npc_KnowsInfo (other, DIA_brandick_Boba_Sword))
	&& !(Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword_Nugget))
   // && (other.attribute[ATR_DEXTERITY] < 50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brandick_Silver_Nugg_Robb_Info()
{

    
    AI_Output (other, self ,"DIA_Brandick_Silver_Nugg_Robb_15_01"); //Sk¹d wiesz ¿e Bartholo bêdzie zainteresowany tym minera³em?
    AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_02"); //Bo wiem.
	if (other.attribute[ATR_DEXTERITY] > 49)
 	{
 		 AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_03"); //Zreszt¹ gówno cie to obchodzi, Zje¿d¿aj!
	     B_GiveInvItems (self,hero, ItMi_SilverNugget, 10);
		 B_GiveXP(50);
		 AI_StopProcessInfos	(self);
		 
		 
	}
	else
	{
		 AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_04"); //Ty parszywy z³odzieju! Czekaj no!
		 AI_StopProcessInfos	(self);
         Npc_SetTarget (self, other);
         AI_StartState (self, ZS_ATTACK, 1, "");

	};
   
	

};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Boba_Sword_Nugget (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 98;
   condition    = DIA_brandick_Boba_Sword_Nugget_Condition;
   information  = DIA_brandick_Boba_Sword_Nugget_Info;
   permanent	= FALSE;
   description	= "Hmm... Ode mnie dostaniesz wiêcej!";
};

FUNC INT DIA_brandick_Boba_Sword_Nugget_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword))
	&& !(Npc_KnowsInfo(hero,DIA_Brandick_Silver_Nugg_Robb))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Boba_Sword_Nugget_Info()
{
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_01"); //Hmm... Ode mnie dostaniesz wiêcej!
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_02"); //Haha! Czy¿by? W¹tpie.
	AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_03"); //Na pewno jest jakiœ sposób ¿eby ciê przekonaæ.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_04"); //Gdybyœ by³ na tyle lekkomyœlny ¿eby pójœæ za pewn¹ star¹ map¹...
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_05"); //Co? Mów dalej!
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_06"); //Mam star¹ mapê, która ponoæ prowadzi do jakiegoœ skarbu. Ja mam robotê na g³owie poza tym miejsce jego po³o¿enia nie jest zbyt przyjazne...

	
    
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Skarb (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Skarb_Condition;
   information  = DIA_brandick_Skarb_Info;
   permanent	= FALSE;
   description	= "Mogê pójœæ po ten skarb.";
};

FUNC INT DIA_brandick_Skarb_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword_Nugget))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Skarb_Info()
{
    AI_Output (other, self ,"DIA_brandick_Skarb_15_01"); //Mogê pójœæ po ten skarb.
    AI_Output (self, other ,"DIA_brandick_Skarb_03_02"); //Odwa¿ny jesteœ. Widzê, ¿e bardzo ci zale¿y na tym minerale.
	AI_Output (self, other ,"DIA_brandick_Skarb_03_03"); //Oto mapa.
	B_GiveInvItems (self,other, ItWr_BRANDICK_SKARB, 1);
    AI_Output (self, other ,"DIA_brandick_Skarb_03_04"); //To nie bêdzie ³atwa wyprawa... Jeœli mo¿esz nie zgiñ.
    AI_Output (other, self ,"DIA_brandick_Skarb_15_05"); //By³oby mi³o. Na razie.    
	AI_Output (self, other ,"DIA_brandick_Skarb_03_06"); //Czeœæ.
	
    B_LogEntry               (MieczGorBoby,"Brandick chcê bym uda³ siê wiedziony jak¹œ star¹ map¹ po rzekomy skarb. Wtedy dostanê od niego ,,srebrny grom”, który zabra³ Alephowi. Chyba bêdê musia³ siê tego podj¹æ.");
};






//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Mapa (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Mapa_Condition;
   information  = DIA_brandick_Mapa_Info;
   permanent	= FALSE;
   description	= "By³em na miejscu zaznaczonym na twojej mapie.";
};

FUNC INT DIA_brandick_Mapa_Condition()
{

	if (Npc_HasItems (other, ItRi_Brandick_S) >=1) && (Npc_KnowsInfo(hero,DIA_brandick_Skarb))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Mapa_Info()
{
    AI_Output (other, self ,"DIA_brandick_Mapa_15_01"); //By³em na miejscu zaznaczonym na twojej mapie.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_02"); //O... Co to za skarb?
	AI_Output (other, self ,"DIA_brandick_Mapa_15_03"); //Pewien cenny pierœcieñ.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_04"); //Daj mi go.
    AI_Output (other, self ,"DIA_brandick_Mapa_15_05"); //Najpierw minera³.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_06"); //Dobra. Trzymaj.
	CreateInvItem (self, ItMi_SilverNugget);
	B_GiveInvItems (self,hero, ItMi_SilverNugget, 10);
	AI_Output (other, self ,"DIA_brandick_Mapa_15_07"); //A to twój pierœcieñ.
	B_GiveInvItems (other,self, ItRi_Brandick_S, 1);
	AI_Output (other, self ,"DIA_brandick_Mapa_15_08"); //No to dobiliœmy targu. 
	AI_Output (self, other ,"DIA_brandick_Mapa_03_09"); //Trzymaj siê. Odwa¿ny z ciebie ch³opak.
  
   B_LogEntry               (MieczGorBoby,"Da³em Brandickowi zdobyty cenny pierœcieñ a ten w zamian da³ mi 10 bry³ek ,,srebrnego gromu”. Wygl¹da na to, ¿e mam ju¿ komplet. Pora wracaæ do Gor Boby.");
	B_GiveXP(150);

};

instance dia_brandick_pickpocket(c_info) {
    npc = grd_261_brandick;
    nr = 900;
    condition = dia_brandick_pickpocket_condition;
    information = dia_brandick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brandick_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_brandick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brandick_pickpocket);
	info_addchoice(dia_brandick_pickpocket, dialog_back, dia_brandick_pickpocket_back);
	info_addchoice(dia_brandick_pickpocket, dialog_pickpocket, dia_brandick_pickpocket_doit);
};

func void dia_brandick_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_brandick_pickpocket);
};

func void dia_brandick_pickpocket_back() {
    info_clearchoices(dia_brandick_pickpocket);
};






























