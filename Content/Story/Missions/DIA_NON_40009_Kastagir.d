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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Kastagir_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Kastagir_WhoYou_Info()
{
     AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_01"); //Kim jesteœ?
     AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_02"); //Wojownikiem.
	 AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_03"); //I?
     AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_04"); //Tyle. Obecnie nie zas³ugujesz na to bym zdradza³ ci wiêcej o sobie.
	 AI_Output (other, self ,"DIA_Kastagir_WhoYou_15_05"); //Sk¹d ta pewnoœæ?
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_06"); //A umiesz ubiæ chocia¿ zapchlonego orkowego psa?!
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_07"); //JA pos³a³em do piachu wiêcej Orków ni¿ jest liœci na drzewach w tej przeklêtej Kolonii. 
	 AI_Output (self, other ,"DIA_Kastagir_WhoYou_03_08"); //Ale byæ mo¿e zmieni³bym zdanie o tobie i dodatkowo mia³ jeszcze dla ciebie bardzo dobrze p³atne zlecenie.
	 
	 
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
   description	= "Doprawdy? A co mam niby zrobiæ?.";
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
    AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_01"); //Doprawdy? A co mam niby zrobiæ?
    AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_02"); //Na pocz¹tek przynieœ mi miecz elitarnego Orka. Chce wiedzieæ czy mam do czynienia z prawdziwym wojownikiem czy maminsynkiem.
    AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_03"); //To nie bêdzie ³atwe...
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_04"); //£atwo w ¿yciu to mo¿e mieæ dziwka Gomeza, ale nie prawdziwy facet z krwi i koœci. ¯ycie to ci¹g³a walka o byt i przetrwanie ch³opczê!
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_05"); //A jeœli naprawdê masz jaja i talent do walki to zrobisz to. Dla cz³owieka z dusz¹ wojownika nie ma rzeczy niemo¿liwych!
	AI_Output (other, self ,"DIA_Kastagir_IWannaArmor_15_06"); //Niech bêdzie... Chocia¿ nie wiem po co to robiê.
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_07"); //Brawo! Mo¿e jednak bêd¹ z ciebie ludzie. Jak zdobêdziesz to ostrze to przynieœ je na dowód. I nie próbuj mnie oszukaæ bo wbije ci to ostrze w brzuch!
	AI_Output (self, other ,"DIA_Kastagir_IWannaArmor_03_08"); //Powodzenia ¿ó³todziobie!
	
	Log_CreateTopic         (Kastragir, LOG_MISSION);
    Log_SetTopicStatus      (Kastragir, LOG_RUNNING);
    B_LogEntry              (Kastragir,"W obozowisku £owców Orków spotka³em niejakiego Kastagira. Nie powiedzia³ o sobie zbyt wiele ale rzekomo ma mieæ wobec mnie jakieœ plany. Jednak najpierw muszê przynieœæ mu broñ elitarnego orka jako dowód swoich umiejêtnoœci.");
	
	
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
   description  = "Mam miecz, który chcia³eœ.";
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
    AI_Output (other, self ,"DIA_Kastagir_WeNeedHelp_03_01"); //Mam miecz, który chcia³eœ.
	AI_Output (self, other ,"DIA_Kastagir_WeNeedHelp_15_02"); //Doskonale. Muszê przyznaæ, ¿e nie spodziewa³em siê, ¿e ci siê powiedzie.
	AI_Output (other, self ,"DIA_Kastagir_WeNeedHelp_03_03"); //A jednak.
	AI_Output (self, other ,"DIA_Kastagir_WeNeedHelp_15_04"); //Widzê, ¿e naprawdê mi siê przydasz.
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
   description	= "Mo¿esz mi teraz powiedzieæ wiêcej o sobie?";
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
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_01"); //Mo¿esz mi teraz powiedzieæ wiêcej o sobie?
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_02"); //Jestem Kastagir. Choæ moje pocz¹tki siêgaj¹ pustyni Vaarantu to przez ca³e ¿ycie podró¿owa³em doskonal¹c swoje umiejêtnoœci w boju.
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_03"); //Chocia¿by mistrzowskiej walki toporem nauczy³em siê w Nordmarze gdzie przez jakiœ czas ¿y³em i wojowa³em wspólnie z jednym z tamtejszych Klanów.
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_04"); //Jak tu trafi³eœ?
    AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_05"); //Podró¿owa³em po Myrthanie z oddzia³em wojowników do wynajêcia i sam by³em jednym z nich.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_06"); //Pewnego dnia napotkaliœmy wioskê, któr¹ niszczyli i okradali ludzie Rhobara. Chwyciliœmy za broñ i przepêdziliœmy chciwych ¿o³daków.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_07"); //Jednak gdy dotarliœmy do najbli¿szego miasta ci ¿o³nierze powiadomili ju¿ swoich prze³o¿onych.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_08"); //Gdy przysz³a pora ujêli nas znienacka. Poder¿nêli gard³a kilku ch³opakom ale uznali, ¿e przynajmniej jednemu nale¿y zrobiæ pokazowy proces.
    AI_Output (other, self ,"DIA_Kastagir_QUEST1_Kastagir_15_09"); //To by³eœ ty.
	AI_Output (self, other ,"DIA_Kastagir_QUEST1_Kastagir_03_10"); //Dok³adnie. Proces by³ fars¹ a ten napuszony gruby sukinsyn w ¿ó³tym stroju – Sêdzia nakaza³ niezw³ocznie zrzuciæ mnie do Górniczej Doliny.	
  
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
   description	= "Jak pozna³eœ siê z ludŸmi Wilsona?";
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
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q1_15_01"); //Jak pozna³eœ siê z ludŸmi Wilsona?
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_02"); //Nie by³o zbyt wielu alternatyw. Nie interesowa³ mnie konflikt miêdzy Starym Obozem a Nowym. A Œwiry z Sekty to nie by³o miejsce dla mnie.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_03"); //S³ysza³em te¿ o Bandytach, którzy rzekomo ukrywaj¹ siê gdzieœ w górach ale nigdy ich nie spotka³em.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q1_03_04"); //A wœród ludzi Wilsona odnalaz³em spokój i mog³em ponownie bez przeszkód szlifowaæ umiejêtnoœci bojowe czy to w obozie czy w terenie walcz¹c z Orkami.
  	
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
   description	= "Mia³eœ rzekomo dla mnie jakieœ interesuj¹ce zlecenie. ";
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
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_01"); //Mia³eœ rzekomo dla mnie jakieœ interesuj¹ce zlecenie. 
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_02"); //O tak, mo¿na je tak nazwaæ. Ale zdobycie tamtego miecza to spacerek w porównaniu do tego co teraz ciê czeka. 
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_03"); //Jednak zdecydowanie nagroda bêdzie godna tego wysi³ku.
    AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_04"); //Zatem mów w czym rzecz.
  	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_05"); //Niedaleko znajduje siê pewien pos¹g. Przedstawia orkowego wojownika, ale jest tam coœ jeszcze...
	AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q11_15_06"); //Co takiego?
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_07"); //Na jego szczycie znajduje siê pewien potê¿ny  kryszta³. Zbiera on spor¹ czêœæ magicznej mocy z okolicy.
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_08"); //Nie jest jednak w pe³ni na³adowany. Orkowi Szamani odprawiaj¹ mod³y i wykonuj¹ magiczne obrzêdy, dziêki czemu jego moc wzrasta z ka¿dym dniem.
	AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q11_03_09"); //Gdy jego moc bêdzie pe³na, orkowie zyskaj¹ potê¿n¹ broñ, któr¹ na pewno obróc¹ przeciw nam to znaczy ludziom pod Barier¹.
	
	 Info_ClearChoices (DIA_Kastagir_DOSTAWA_Q11);
	 Info_AddChoice    (DIA_Kastagir_DOSTAWA_Q11,"Co zamierzasz?",DIA_Kastagir_ZLECENIE);
	
};

FUNC VOID DIA_Kastagir_ZLECENIE()
  {
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_00");  //Co zamierzasz?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_01");  //Trzeba spróbowaæ przej¹æ ten artefakt. Najpierw nale¿y pozbyæ siê Szamanów i ich obstawy. 
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_02");  //Zostaje jednak kwestia zabezpieczeñ, jakie orkowi szamani na pewno na³o¿yli na kryszta³.
    AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_03");  //Ale wiem co nale¿y zrobiæ.
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_04");  //Mianowicie?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_05");  //Trzeba pozyskaæ pewn¹ ksiêgê. Informacje o niej ma zapewne Mag Uturiel – samotnik mieszkaj¹cy na ziemiach orków. Prawdopodobnie ukry³ siê w którejœ z grot.
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_06");  //Zdob¹dŸ on niego t¹ ksiêgê, a popchniesz tê sprawê znacz¹co dalej.
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_07");  //A jej tytu³?
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_08");  //,,Potêga Magicznych Kryszta³ów”
	AI_Output (other,self ,"DIA_Kastagir_ZLECENIE_15_09");  //Niech bêdzie, ale pamiêtaj, ¿e nie robiê tego za darmo.
	AI_Output (self ,other,"DIA_Kastagir_ZLECENIE_11_10");  //Nagroda ciê nie ominie, b¹dŸ tego pewien.
	
    AI_StopProcessInfos	     (self);
   
  	    B_LogEntry              (Kastragir,"Dowiedzia³em siê co nieco na temat Kastagira. W koñcu wyjawi³ mi on jakie ma plany wobec mojej osoby. Rzekomo na ziemiach Orków znajduje siê totem na szczycie, którego znajduje siê potê¿ny kryszta³ mocy. Na³adowuje siê on a gdy ju¿ zyska pe³niê swojej magicznej si³y wówczas Orkowie zyskaj¹ potê¿n¹ broñ przeciwko ludziom. Musimy ich zatem powstrzymaæ. Ale bêdzie potrzebna pewna ksiêga by zdj¹æ zabezpieczenia na³o¿one przez Orkowych szamanów. Ma j¹ ponoæ mag Uturiel. Muszê z nim pomówiæ.");

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
   description	= "Oto ksiêga, któr¹ chcia³eœ zdobyæ.";
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
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_01"); //Oto ksiêga, któr¹ chcia³eœ zdobyæ.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_02"); //Wspaniale, daj mi j¹!
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_03"); //Trzymaj.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_04"); //Znakomicie, wreszcie jesteœmy blisko ostatecznego rozstrzygniêcia.
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_05"); //Daj mi 2 dni na przestudiowanie ksiêgi. Potem wróæ a za³atwimy w¹tek kryszta³u orków raz na zawsze.
    AI_Output (other, self ,"DIA_Kastagir_Ksiega_15_06"); //I mojej nagrody...
    AI_Output (self, other ,"DIA_Kastagir_Ksiega_03_07"); //Oczywiœcie, mo¿esz mi zaufaæ. Spotkamy siê przed bram¹ naszego obozowiska.
    B_GiveInvItems (other, self, ItWr_UturielBook, 1);
   	B_LogEntry              (Kastragir,"Kastagir pragnie dok³adnie przestudiowaæ zdobyt¹ ksiêgê. Potrzebuje on na to 2 dni. Po tym czasie mam siê z nim spotkaæ przed g³ówn¹ bram¹ obozowiska £owców Orków.");
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
    
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_02"); //Jestem gotowy. Przewertowa³em dok³adnie ksiêgê i mo¿emy ruszaæ.
	AI_Output (other, self ,"DIA_Kastagir_DOSTAWA_Q12_15_01"); //Zgoda. Tylko b¹dŸmy ostro¿ni.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_03"); //Rozwaga to dobra sprawa ale czasem trzeba dzia³aæ jej na przekór.
    AI_Output (self, other ,"DIA_Kastagir_DOSTAWA_Q12_03_04"); //W drogê.
    AI_StopProcessInfos	(self);
	  	    B_LogEntry              (Kastragir,"Spotka³em siê z Kastagirem. Ruszyliœmy wspólnie do totemu i znajduj¹cego siê na nim kryszta³u. Czeka nas niechybne starcie z Orkami.");

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
   description	= "Orkowie s¹ martwi.";
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
    AI_Output (other, self ,"DIA_Kastagir_KRYSZTAL_MOCY_15_01"); //Orkowie s¹ martwi.
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_02"); //Teraz muszê zdj¹æ przy pomocy ksiêgi zdj¹æ z kryszta³u orkowe zabezpieczenia.
    AI_Output (other, self ,"DIA_Kastagir_KRYSZTAL_MOCY_15_03"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_04"); //O krysztale mocy! Nie b¹dŸ zamkniêty na nowych w³aœcicieli! Niech bramy do twojej potêgi otworz¹ siê dla nas!
    AI_Output (self, other ,"DIA_Kastagir_KRYSZTAL_MOCY_03_05"); //Niech twa si³a stanie siê dostêpna a czary obronne na³o¿one na ciebie niechaj strac¹ sw¹ moc!
  
  
  	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags = 0;
 // fight_tactic	=	FAI_HUMAN_MAGE;
     Info_ClearChoices (DIA_Kastagir_KRYSZTAL_MOCY);
	 Info_AddChoice    (DIA_Kastagir_KRYSZTAL_MOCY,"I co teraz?",DIA_Kastagir_KRYSZTAL_MOCY_ADD);
  
  
  
  

};

FUNC VOID DIA_Kastagir_KRYSZTAL_MOCY_ADD()
  {
	AI_Output (other,self ,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_15_00");  //I co teraz?
	AI_Output (self ,other,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_11_01");  //Gotowe. Teraz u¿yj zaklêcia telekinezy i zdejmij kryszta³ na dó³. Potem daj go mnie.
	AI_Output (other,self ,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_15_02");  //Dobrze... chocia¿...
    AI_Output (self ,other,"DIA_Kastagir_KRYSZTAL_MOCY_ADD_11_03");  //Szybciej!
		
    AI_StopProcessInfos	     (self); 
    B_LogEntry              (Kastragir,"Po walce z Orkami, Kastagir przeprowadzi³ magiczny rytua³. Teraz mo¿na ju¿ dobraæ siê do kryszta³u mocy. Tylko potrzeba do tego zaklêcia telekinezy.");
	
	
	
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
   description	= "Oto kryszta³.";
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
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_01"); //Oto kryszta³.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_02"); //Nareszcie! Nadesz³a dla mnie wielka chwila. Kryszta³ jest mój i tylko mój!
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_03"); //Teraz przy jego pomocy mo¿esz wyeliminowaæ orków?
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_04"); //Mogê wszystko ty marny ludziku! Mogê obaliæ Gomeza i za¿¹daæ od Corristo by wzmocni³ kryszta³ tak bym by³ niepokonany!
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_05"); //Moja w³adza wkrótce rozci¹gnie siê na wszystkich ludzi. Ca³e t³umy bêd¹ œci¹gaæ do mego pa³acu by oddaæ mi pok³on!
    AI_Output (other, self ,"DIA_Kastagir_WALKA_CRYSTAL_15_06"); //Niech to szlag, ty naprawdê oszala³eœ. Co ja narobi³em, Garret jednak mia³ racjê.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_07"); //Garett to dureñ tak jak reszta ,,Wielkich £owców Orków”. Banda œlepców.
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_08"); //Mogê zniszczyæ orków ale by staæ siê w³adc¹ absolutnym bêdê musia³ te¿ zniszczyæ wielu ludzi by ca³e królestwa pada³y na kolana przede mn¹!
    AI_Output (self, other ,"DIA_Kastagir_WALKA_CRYSTAL_03_09"); //Inaczej utopiê ich we krwi! Ka¿dego kto bêdzie œmia³ stawiæ mi opór!
  
	B_GiveInvItems (other, self, OrcCrystal, 1);
    B_GiveXP (150);
	
	
	 Info_ClearChoices (DIA_Kastagir_WALKA_CRYSTAL);
	 Info_AddChoice    (DIA_Kastagir_WALKA_CRYSTAL,"Nie by³bym tego taki pewny!",DIA_Kastagir_WALKA_CRYSTAL_ADD);
  
	
};



FUNC VOID DIA_Kastagir_WALKA_CRYSTAL_ADD()
  {
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_00");  //Nie by³ bym tego taki pewny!
	AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_01");  //Ju¿ dawno zwano mnie najostrzejszym toporem pustyni. Teraz z moc¹ kryszta³u jestem niemal niepokonany.
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_02");  //W³aœnie... Niemal!
    AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_03");  //Zatem stawaj marny psie i zejdŸ z mojej drogi ku zwyciêstwu!
	AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_04");  //Idiota.
    AI_Output (self ,other,"DIA_Kastagir_WALKA_CRYSTAL_ADD_11_05");  //Teraz zdechniesz za t¹ potwarz! A potem wszyscy ludzie zaznaj¹ gniewu i potêgi Kastagira!
    AI_Output (other,self ,"DIA_Kastagir_WALKA_CRYSTAL_ADD_15_06");  //Doœæ tego! Skoñcz z tym be³kotem i poka¿ na co cie staæ, pajacu!
	
	Kastagir_Charged ();
    AI_StopProcessInfos	     (self); 
    B_LogEntry              (Kastragir,"Kastagir oszala³ pod wp³ywem mocy kryszta³u, chc¹c zyskaæ nieskoñczon¹ moc. Musia³em stoczyæ z nim walkê i zabiæ go. Zabra³em magiczny kryszta³. Muszê pomówiæ z Wilsonem.");
	
	
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

