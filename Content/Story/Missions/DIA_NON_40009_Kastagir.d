//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Kastagir_EXIT(C_INFO)
{
	npc             = NON_40009_Kastagir;
	nr              = 999;
	condition	= DIA_Kastagir_EXIT_Condition;
	information	= DIA_Kastagir_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Kastagir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kastagir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Kastagir_WhoYou (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_WhoYou_Condition;
   information  = DIA_Kastagir_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Kastagir_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Kastagir_WhoYou_Info()
{
     AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_01"); //Kim jeste�?
     AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_02"); //Wojownikiem.
	 AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_03"); //I?
     AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_04"); //Tyle. Obecnie nie zas�ugujesz na to bym zdradza� ci wi�cej o sobie.
	 AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_05"); //Sk�d ta pewno��?
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_06"); //A umiesz ubi� chocia� zapchlonego orkowego psa?!
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_07"); //JA pos�a�em do piachu wi�cej Ork�w ni� jest li�ci na drzewach w tej przekl�tej Kolonii. 
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_08"); //Ale by� mo�e zmieni�bym zdanie o tobie i dodatkowo mia� jeszcze dla ciebie bardzo dobrze p�atne zlecenie.
	 
	 
};


//========================================
//-----------------> IWannaArmor
//========================================

INSTANCE DIA_Kastagir_IWannaArmor (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_IWannaArmor_Condition;
   information  = DIA_Kastagir_IWannaArmor_Info;
   permanent	= FALSE;
   description	= "Doprawdy? A co mam niby zrobi�?.";
};

FUNC INT DIA_Kastagir_IWannaArmor_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Kastagir_WhoYou))
	{
    return TRUE; 
	};
};


FUNC VOID DIA_Kastagir_IWannaArmor_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_01"); //Doprawdy? A co mam niby zrobi�?
    AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_02"); //Na pocz�tek przynie� mi miecz elitarnego Orka. Chce wiedzie� czy mam do czynienia z prawdziwym wojownikiem czy maminsynkiem.
    AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_03"); //To nie b�dzie �atwe...
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_04"); //�atwo w �yciu to mo�e mie� dziwka Gomeza, ale nie prawdziwy facet z krwi i ko�ci. �ycie to ci�g�a walka o byt i przetrwanie ch�opcz�!
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_05"); //A je�li naprawd� masz jaja i talent do walki to zrobisz to. Dla cz�owieka z dusz� wojownika nie ma rzeczy niemo�liwych!
	AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_06"); //Niech b�dzie... Chocia� nie wiem po co to robi�.
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_07"); //Brawo! Mo�e jednak b�d� z ciebie ludzie. Jak zdob�dziesz to ostrze to przynie� je na dow�d. I nie pr�buj mnie oszuka� bo wbije ci to ostrze w brzuch!
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_08"); //Powodzenia ��todziobie!
	
	Log_CreateTopic         (Kastragir, LOG_MISSION);
    Log_SetTopicStatus      (Kastragir, LOG_RUNNING);
    B_LogEntry              (Kastragir,"W obozowisku �owc�w Ork�w spotka�em niejakiego Kastagira. Nie powiedzia� o sobie zbyt wiele ale rzekomo ma mie� wobec mnie jakie� plany. Jednak najpierw musz� przynie�� mu bro� elitarnego orka jako dow�d swoich umiej�tno�ci.");
	
	
};


//========================================
//-----------------> WeNeedHelp
//========================================

INSTANCE DIA_Kastagir_WeNeedHelp (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_WeNeedHelp_Condition;
   information  = DIA_Kastagir_WeNeedHelp_Info;
   permanent	= FALSE;
   description  = "Mam miecz, kt�ry chcia�e�.";
};

FUNC INT DIA_Kastagir_WeNeedHelp_Condition()
{
	 if (Npc_HasItems (hero, ItMw_2H_OrcSword_02)>=1)
	 && (Npc_KnowsInfo (hero, DIA_Kastagir_IWannaArmor))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Kastagir_WeNeedHelp_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_WeNeedHelp_03_01"); //Mam miecz, kt�ry chcia�e�.
	AI_Output (self, other ,"DIA_Kastagir_WeNeedHelp_15_02"); //Doskonale. Musz� przyzna�, �e nie spodziewa�em si�, �e ci si� powiedzie.
	AI_Output (other, self ,"DIA_Kastagir_WeNeedHelp_03_03"); //A jednak.
	AI_Output (self, other ,"DIA_Kastagir_WeNeedHelp_15_04"); //Widz�, �e naprawd� mi si� przydasz.
    B_GiveInvItems (other, self,ItMw_2H_OrcSword_02,1);
};

//========================================
//-----------------> QUEST1_Kastagir
//========================================

INSTANCE DIA_Kastagir_QUEST1_Kastagir (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_QUEST1_Kastagir_Condition;
   information  = DIA_Kastagir_QUEST1_Kastagir_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi teraz powiedzie� wi�cej o sobie?";
};

FUNC INT DIA_Kastagir_QUEST1_Kastagir_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Kastagir_WeNeedHelp))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Kastagir_QUEST1_Kastagir_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_01"); //Mo�esz mi teraz powiedzie� wi�cej o sobie?
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_02"); //Jestem Kastagir. Cho� moje pocz�tki si�gaj� pustyni Vaarantu to przez ca�e �ycie podr�owa�em doskonal�c swoje umiej�tno�ci w boju.
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_03"); //Chocia�by mistrzowskiej walki toporem nauczy�em si� w Nordmarze gdzie przez jaki� czas �y�em i wojowa�em wsp�lnie z jednym z tamtejszych Klan�w.
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_04"); //Jak tu trafi�e�?
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_05"); //Podr�owa�em po Myrthanie z oddzia�em wojownik�w do wynaj�cia i sam by�em jednym z nich.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_06"); //Pewnego dnia napotkali�my wiosk�, kt�r� niszczyli i okradali ludzie Rhobara. Chwycili�my za bro� i przep�dzili�my chciwych �o�dak�w.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_07"); //Jednak gdy dotarli�my do najbli�szego miasta ci �o�nierze powiadomili ju� swoich prze�o�onych.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_08"); //Gdy przysz�a pora uj�li nas znienacka. Poder�n�li gard�a kilku ch�opakom ale uznali, �e przynajmniej jednemu nale�y zrobi� pokazowy proces.
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_09"); //To by�e� ty.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_10"); //Dok�adnie. Proces by� fars� a ten napuszony gruby sukinsyn w ��tym stroju � S�dzia nakaza� niezw�ocznie zrzuci� mnie do G�rniczej Doliny.	
  
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_DOSTAWA_Q1 (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_DOSTAWA_Q1_Condition;
   information  = DIA_Kastagir_DOSTAWA_Q1_Info;
   permanent	= FALSE;
   description	= "Jak pozna�e� si� z lud�mi Wilsona?";
};

FUNC INT DIA_Kastagir_DOSTAWA_Q1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kastagir_QUEST1_Kastagir))   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_DOSTAWA_Q1_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q1_15_01"); //Jak pozna�e� si� z lud�mi Wilsona?
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_02"); //Nie by�o zbyt wielu alternatyw. Nie interesowa� mnie konflikt mi�dzy Starym Obozem a Nowym. A �wiry z Sekty to nie by�o miejsce dla mnie.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_03"); //S�ysza�em te� o Bandytach, kt�rzy rzekomo ukrywaj� si� gdzie� w g�rach ale nigdy ich nie spotka�em.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_04"); //A w�r�d ludzi Wilsona odnalaz�em spok�j i mog�em ponownie bez przeszk�d szlifowa� umiej�tno�ci bojowe czy to w obozie czy w terenie walcz�c z Orkami.
  	
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_DOSTAWA_Q11 (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_DOSTAWA_Q11_Condition;
   information  = DIA_Kastagir_DOSTAWA_Q11_Info;
   permanent	= FALSE;
   description	= "Mia�e� rzekomo dla mnie jakie� interesuj�ce zlecenie. ";
};

FUNC INT DIA_Kastagir_DOSTAWA_Q11_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kastagir_DOSTAWA_Q1))   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_DOSTAWA_Q11_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_01"); //Mia�e� rzekomo dla mnie jakie� interesuj�ce zlecenie. 
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_02"); //O tak, mo�na je tak nazwa�. Ale zdobycie tamtego miecza to spacerek w por�wnaniu do tego co teraz ci� czeka. 
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_03"); //Jednak zdecydowanie nagroda b�dzie godna tego wysi�ku.
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_04"); //Zatem m�w w czym rzecz.
  	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_05"); //Niedaleko znajduje si� pewien pos�g. Przedstawia orkowego wojownika, ale jest tam co� jeszcze...
	AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_06"); //Co takiego?
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_07"); //Na jego szczycie znajduje si� pewien pot�ny  kryszta�. Zbiera on spor� cz�� magicznej mocy z okolicy.
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_08"); //Nie jest jednak w pe�ni na�adowany. Orkowi Szamani odprawiaj� mod�y i wykonuj� magiczne obrz�dy, dzi�ki czemu jego moc wzrasta z ka�dym dniem.
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_09"); //Gdy jego moc b�dzie pe�na, orkowie zyskaj� pot�n� bro�, kt�r� na pewno obr�c� przeciw nam to znaczy ludziom pod Barier�.
	
	 Info_ClearChoices (DIA_Kastagir_DOSTAWA_Q11);
	 Info_AddChoice    (DIA_Kastagir_DOSTAWA_Q11,"Co zamierzasz?",DIA_Kastagir_ZLECENIE);
	
};

FUNC VOID DIA_Kastagir_ZLECENIE()
  {
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_00");  //Co zamierzasz?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_01");  //Trzeba spr�bowa� przej�� ten artefakt. Najpierw nale�y pozby� si� Szaman�w i ich obstawy. 
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_02");  //Zostaje jednak kwestia zabezpiecze�, jakie orkowi szamani na pewno na�o�yli na kryszta�.
    AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_03");  //Ale wiem co nale�y zrobi�.
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_04");  //Mianowicie?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_05");  //Trzeba pozyska� pewn� ksi�g�. Informacje o niej ma zapewne Mag Uturiel � samotnik mieszkaj�cy na ziemiach ork�w. Prawdopodobnie ukry� si� w kt�rej� z grot.
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_06");  //Zdob�d� on niego t� ksi�g�, a popchniesz t� spraw� znacz�co dalej.
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_07");  //A jej tytu�?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_08");  //,,Pot�ga Magicznych Kryszta��w�
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_09");  //Niech b�dzie, ale pami�taj, �e nie robi� tego za darmo.
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_10");  //Nagroda ci� nie ominie, b�d� tego pewien.
	
    AI_StopProcessInfos	     (self);
   
  	    B_LogEntry              (Kastragir,"Dowiedzia�em si� co nieco na temat Kastagira. W ko�cu wyjawi� mi on jakie ma plany wobec mojej osoby. Rzekomo na ziemiach Ork�w znajduje si� totem na szczycie, kt�rego znajduje si� pot�ny kryszta� mocy. Na�adowuje si� on a gdy ju� zyska pe�ni� swojej magicznej si�y w�wczas Orkowie zyskaj� pot�n� bro� przeciwko ludziom. Musimy ich zatem powstrzyma�. Ale b�dzie potrzebna pewna ksi�ga by zdj�� zabezpieczenia na�o�one przez Orkowych szaman�w. Ma j� pono� mag Uturiel. Musz� z nim pom�wi�.");

};






var int Kastragir_Attak_Day;
//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_Ksiega (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_Ksiega_Condition;
   information  = DIA_Kastagir_Ksiega_Info;
   permanent	= FALSE;
   description	= "Oto ksi�ga, kt�r� chcia�e� zdoby�.";
};

FUNC INT DIA_Kastagir_Ksiega_Condition()
{
    if (Npc_HasItems (other, ItWr_UturielBook) >=1) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_Ksiega_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_01"); //Oto ksi�ga, kt�r� chcia�e� zdoby�.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_02"); //Wspaniale, daj mi j�!
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_03"); //Trzymaj.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_04"); //Znakomicie, wreszcie jeste�my blisko ostatecznego rozstrzygni�cia.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_05"); //Daj mi 2 dni na przestudiowanie ksi�gi. Potem wr�� a za�atwimy w�tek kryszta�u ork�w raz na zawsze.
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_06"); //I mojej nagrody...
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_07"); //Oczywi�cie, mo�esz mi zaufa�. Spotkamy si� przed bram� naszego obozowiska.
    B_GiveInvItems (other, self, ItWr_UturielBook, 1);
   	B_LogEntry              (Kastragir,"Kastagir pragnie dok�adnie przestudiowa� zdobyt� ksi�g�. Potrzebuje on na to 2 dni. Po tym czasie mam si� z nim spotka� przed g��wn� bram� obozowiska �owc�w Ork�w.");
	Kastragir_Attak_Day = Wld_GetDay();
    B_GiveXP (50);
    Npc_ExchangeRoutine (NON_40009_Kastagir,"cava");	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_DOSTAWA_Q12 (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_DOSTAWA_Q12_Condition;
   information  = DIA_Kastagir_DOSTAWA_Q12_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Kastagir_DOSTAWA_Q12_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Kastagir_Ksiega))  && Kastragir_Attak_Day<=(Wld_GetDay()-2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_DOSTAWA_Q12_Info()
{
    
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_02"); //Jestem gotowy. Przewertowa�em dok�adnie ksi�g� i mo�emy rusza�.
	AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q12_15_01"); //Zgoda. Tylko b�d�my ostro�ni.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_03"); //Rozwaga to dobra sprawa ale czasem trzeba dzia�a� jej na przek�r.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_04"); //W drog�.
    AI_StopProcessInfos	(self);
	  	    B_LogEntry              (Kastragir,"Spotka�em si� z Kastagirem. Ruszyli�my wsp�lnie do totemu i znajduj�cego si� na nim kryszta�u. Czeka nas niechybne starcie z Orkami.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine (NON_40009_Kastagir,"wait");	
	   
	Wld_InsertNpc	     	(Shaman_Kastagir_01,"FP_ORC_PREY_NEW1");
	Wld_InsertNpc		    (Shaman_Kastagir_02,"FP_ORC_PREY_NEW2");
	Wld_InsertNpc		    (Shaman_Kastagir_03,"FP_ORC_PREY_NEW3");
    Wld_InsertNpc	     	(OrcWarrior2,"FP_GUARD_ORC_NEW_01");
	Wld_InsertNpc		    (OrcWarrior2,"FP_GUARD_ORC_NEW_02");
	Wld_InsertNpc		    (Orcelite_Rest,"FP_GUARD_ORC_NEW_03");

    Wld_InsertItem			     (OrcCrystal,"FP_ITEM_ORCCRYSTAL");






	   
	
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_KRYSZTAL_MOCY (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_KRYSZTAL_MOCY_Condition;
   information  = DIA_Kastagir_KRYSZTAL_MOCY_Info;
   permanent	= FALSE;
   description	= "Orkowie s� martwi.";
};

FUNC INT DIA_Kastagir_KRYSZTAL_MOCY_Condition()
{
    if (Npc_IsDead(Shaman_Kastagir_03)) 
	&& (Npc_IsDead(Shaman_Kastagir_02))
	&& (Npc_IsDead(Shaman_Kastagir_01))
	&& (Npc_KnowsInfo (hero,DIA_Kastagir_DOSTAWA_Q12))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_KRYSZTAL_MOCY_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_KRYSZTAL_MOCY_15_01"); //Orkowie s� martwi.
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_02"); //Teraz musz� zdj�� przy pomocy ksi�gi zdj�� z kryszta�u orkowe zabezpieczenia.
    AI_Output (other, self ,"DIA_Kastagir_KRYSZTAL_MOCY_15_03"); //W porz�dku.
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_04"); //O krysztale mocy! Nie b�d� zamkni�ty na nowych w�a�cicieli! Niech bramy do twojej pot�gi otworz� si� dla nas!
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_05"); //Niech twa si�a stanie si� dost�pna a czary obronne na�o�one na ciebie niechaj strac� sw� moc!
  
  
  	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags = 0;
 // fight_tactic	=	FAI_HUMAN_MAGE;
     Info_ClearChoices (DIA_Kastagir_KRYSZTAL_MOCY);
	 Info_AddChoice    (DIA_Kastagir_KRYSZTAL_MOCY,"I co teraz?",DIA_Kastagir_KRYSZTAL_MOCY_ADD);
  
  
  
  

};

FUNC VOID DIA_Kastagir_KRYSZTAL_MOCY_ADD()
  {
	AI_Output (other,self ,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_15_00");  //I co teraz?
	AI_Output (self ,other,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_11_01");  //Gotowe. Teraz u�yj zakl�cia telekinezy i zdejmij kryszta� na d�. Potem daj go mnie.
	AI_Output (other,self ,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_15_02");  //Dobrze... chocia�...
    AI_Output (self ,other,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_11_03");  //Szybciej!
		
    AI_StopProcessInfos	     (self); 
    B_LogEntry              (Kastragir,"Po walce z Orkami, Kastagir przeprowadzi� magiczny rytua�. Teraz mo�na ju� dobra� si� do kryszta�u mocy. Tylko potrzeba do tego zakl�cia telekinezy.");
	
	
	
};
func void Kastagir_Charged ()
{


    NON_40009_Kastagir.guild = GIL_DEMON;
    Snd_Play 	    ("MFX_DESTROYUNDEAD_CAST" );
	Wld_PlayEffect  ("spellFX_MassDeath",hero,NON_40009_Kastagir, 0, 0, 0, TRUE);
	AI_PlayAni		(NON_40009_Kastagir, "T_HEASHOOT_2_STAND" );
	Npc_ChangeAttribute(pc_hero,ATR_HITPOINTS,-200);
	Wld_InsertNpc	(DemonKastagir,"OW_ORC_LOOKOUT_2_02");
	NON_40009_Kastagir.attribute[ATR_STRENGTH] = 150;
	NON_40009_Kastagir.attribute[ATR_HITPOINTS] = 1500;
	NON_40009_Kastagir.attribute[ATR_HITPOINTS_MAX] = 1500;
    B_SetPermAttitude	(NON_40009_Kastagir,	ATT_HOSTILE);
    B_ChangeGuild(NON_40009_Kastagir,GIL_DEMON); 



};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Kastagir_WALKA_CRYSTAL (C_INFO)
{
   npc          = NON_40009_Kastagir;
   nr           = 1;
   condition    = DIA_Kastagir_WALKA_CRYSTAL_Condition;
   information  = DIA_Kastagir_WALKA_CRYSTAL_Info;
   permanent	= FALSE;
   description	= "Oto kryszta�.";
};

FUNC INT DIA_Kastagir_WALKA_CRYSTAL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Kastagir_QUEST1_Kastagir))   
	&&(Npc_HasItems (other, OrcCrystal) >=1) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kastagir_WALKA_CRYSTAL_Info()
{
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_01"); //Oto kryszta�.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_02"); //Nareszcie! Nadesz�a dla mnie wielka chwila. Kryszta� jest m�j i tylko m�j!
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_03"); //Teraz przy jego pomocy mo�esz wyeliminowa� ork�w?
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_04"); //Mog� wszystko ty marny ludziku! Mog� obali� Gomeza i za��da� od Corristo by wzmocni� kryszta� tak bym by� niepokonany!
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_05"); //Moja w�adza wkr�tce rozci�gnie si� na wszystkich ludzi. Ca�e t�umy b�d� �ci�ga� do mego pa�acu by odda� mi pok�on!
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_06"); //Niech to szlag, ty naprawd� oszala�e�. Co ja narobi�em, Garret jednak mia� racj�.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_07"); //Garett to dure� tak jak reszta ,,Wielkich �owc�w Ork�w�. Banda �lepc�w.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_08"); //Mog� zniszczy� ork�w ale by sta� si� w�adc� absolutnym b�d� musia� te� zniszczy� wielu ludzi by ca�e kr�lestwa pada�y na kolana przede mn�!
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_09"); //Inaczej utopi� ich we krwi! Ka�dego kto b�dzie �mia� stawi� mi op�r!
  
	B_GiveInvItems (other, self, OrcCrystal, 1);
    B_GiveXP (150);
	
	
	 Info_ClearChoices (DIA_Kastagir_WALKA_CRYSTAL);
	 Info_AddChoice    (DIA_Kastagir_WALKA_CRYSTAL,"Nie by�bym tego taki pewny!",DIA_Kastagir_WALKA_CRYSTAL_ADD);
  
	
};



FUNC VOID DIA_Kastagir_WALKA_CRYSTAL_ADD()
  {
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_00");  //Nie by� bym tego taki pewny!
	AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_01");  //Ju� dawno zwano mnie najostrzejszym toporem pustyni. Teraz z moc� kryszta�u jestem niemal niepokonany.
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_02");  //W�a�nie... Niemal!
    AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_03");  //Zatem stawaj marny psie i zejd� z mojej drogi ku zwyci�stwu!
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_04");  //Idiota.
    AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_05");  //Teraz zdechniesz za t� potwarz! A potem wszyscy ludzie zaznaj� gniewu i pot�gi Kastagira!
    AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_06");  //Do�� tego! Sko�cz z tym be�kotem i poka� na co cie sta�, pajacu!
	
	Kastagir_Charged ();
    AI_StopProcessInfos	     (self); 
    B_LogEntry              (Kastragir,"Kastagir oszala� pod wp�ywem mocy kryszta�u, chc�c zyska� niesko�czon� moc. Musia�em stoczy� z nim walk� i zabi� go. Zabra�em magiczny kryszta�. Musz� pom�wi� z Wilsonem.");
	
	
};

instance dia_kastagir_pickpocket(c_info) {
    npc = non_40009_kastagir;
    nr = 900;
    condition = dia_kastagir_pickpocket_condition;
    information = dia_kastagir_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kastagir_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 35);
};

func void dia_kastagir_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kastagir_pickpocket);
	info_addchoice(dia_kastagir_pickpocket, dialog_back, dia_kastagir_pickpocket_back);
	info_addchoice(dia_kastagir_pickpocket, dialog_pickpocket, dia_kastagir_pickpocket_doit);
};

func void dia_kastagir_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_kastagir_pickpocket);
};

func void dia_kastagir_pickpocket_back() {
    info_clearchoices(dia_kastagir_pickpocket);
};

