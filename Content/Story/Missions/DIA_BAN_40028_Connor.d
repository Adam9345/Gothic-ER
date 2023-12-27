//poprawione i sprawdzone - Reflide

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Connor32_EXIT(C_INFO)
{
	npc             = BAN_40028_Connor;
	nr              = 999;
	condition		= DIA_Connor32_EXIT_Condition;
	information		= DIA_Connor32_EXIT_Info;
	permanent		= TRUE;
	description 	= DIALOG_ENDE;
};

FUNC INT DIA_Connor32_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Connor32_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HI_HERO_CH5
//========================================

INSTANCE DIA_Connor_HI_HERO_CH5 (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_HI_HERO_CH5_Condition;
   information  = DIA_Connor_HI_HERO_CH5_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_HI_HERO_CH5_Condition()
{
   if (Npc_GetTrueGuild(hero) == GIL_BAU)
   && (Kapitel == 5)
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_HI_HERO_CH5_Info()
{
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_01"); //Uczestniczysz w wielkich wydarzeniach. Na twoich oczach wiele siê zmienia.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_02"); //Mam nadzieje, ¿e groza I wszelkie niebezpieczeñstwa, które spotykasz nie dadz¹ ci rady.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_03"); //Ufam, ¿e przetrwam t¹ próbê si³. Postaram siê nie daæ satysfakcji tym z, którymi siê mierzê.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_04"); //Powodzenia przyjacielu. Czuje dziwne przeczucia, ¿e najwiêksze próby wci¹¿ przed tob¹.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_05"); //Kto wie jaki los jest mi pisany. Oby nie by³a to rych³a wizyta w królestwie Beliara.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_06"); //Haha... Mam nadzieje, ¿e czeka ciê jeszcze d³ugie I bogate w wydarzenia ¿ycie.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_07"); //Na razie. Wszyskiego dobrego.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_08"); //Nawzajem. Mo¿e jeszcze kiedyœ wyruszymy na wspóln¹ misje...
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> ENEMY
//========================================

INSTANCE DIA_Connor_ENEMY (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_ENEMY_Condition;
   information  = DIA_Connor_ENEMY_Info;
   permanent	= FALSE;
   Description    = "Opowiesz mi coœ o sobie?";
};

FUNC INT DIA_Connor_ENEMY_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Connor_ENEMY_Info()
{
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_01"); //Opowiesz mi coœ o sobie?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_02"); //Mam na imiê Connor. Od pewnego, mo¿e nie zbyt d³ugiego czasu nale¿ê do bandy Quentina.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_03"); //I wreszcie czuje, ¿e jestem we w³aœciwym miejscu. Pierwszy raz od dawna.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_04"); //A gdzie by³eœ wczeœniej?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_05"); //Nie chcê o tym mówiæ...
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_06"); //Mo¿e jednak?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_07"); //Wola³bym nie. To bolesna sprawa.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_08"); //Jeœli ciê coœ gryzie to mo¿e lepiej to z siebie wyrzuciæ.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_09"); //Mo¿e masz racjê. Ale to bêdzie d³uga opowieœæ.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_10"); //Mam czas, nigdzie mi siê nie œpieszy. Bariera raczej dzisiaj nie upadnie.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_11"); //Przed trafieniem do Kolonii nale¿a³em do ulicznej szajki. By³em wtedy ma³olatem.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_12"); //Pewnego dnia okrad³em jednego urzêdnika i wpad³em. Dosta³em wyrok i zrzucono mnie pod barierê. Nikogo nie obchodzi³o, ¿e jestem dzieciakiem z mlekiem pod nosem.
    Info_ClearChoices	(DIA_Connor_ENEMY);
	Info_AddChoice		(DIA_Connor_ENEMY, "Co by³o dalej?", DIA_Connor_First_Add1);
    
};
FUNC VOID DIA_Connor_First_Add1()
{
    AI_Output (other, self ,"DIA_Connor_First_Add1_15_01"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Connor_First_Add1_03_02"); //Przysta³em do pewnej szajki. Nie mia³em wyjœcia wola³em to ni¿ Stary Obóz. Odrzuci³ mnie ju¿ sam chrzest wody nie mówi¹c ju¿ o póŸniejszej perspektywie bycia wyzyskiwanym.
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_03"); //Jak na ironiê najwiêkszy wyzysk czeka³ mnie w mojej nowej grupie. Te zbiry zrobi³y sobie ze mnie podleg³ego im s³ugê.
    AI_Output (self, other ,"DIA_Connor_First_Add1_03_04"); //Ale mia³em swoje zdolnoœci i by³em przydatny. Nie raz uda³o mi siê wykraœæ parê cennych przedmiotów. Pewnego dnia zrobi³em du¿y skok.
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_05"); //Okrad³em obóz przed star¹ kopalni¹. Wróci³em do obozu z ³upami. Te gnoje spi³y mnie i okrad³y. Na dodatek pobi³y tak, ¿e do dziœ czuje to w koœciach.
    AI_Output (other, self ,"DIA_Connor_First_Add1_15_06"); //Co by³o potem?
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_07"); //B³¹ka³em siê po kolonii... A¿ spotka³em Ratforda i Draxa. Przeszed³em test i do³¹czy³em do ludzi Quentina. Teraz jestem zadowolony z tego gdzie jestem.
    AI_Output (other, self ,"DIA_Connor_First_Add1_15_08"); //Mocna historia.
    AI_Output (self, other ,"DIA_Connor_First_Add1_03_09"); //To prawda...
	
};
//========================================
//-----------------> TP_START
//========================================

INSTANCE DIA_Connor_TP_START (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_TP_START_Condition;
   information  = DIA_Connor_TP_START_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_TP_START_Condition()
{
  if (Npc_GetTrueGuild(hero) == GIL_BAU)
  && (kapitel < 3)
  && (Ban_NQuest1_Day != Wld_GetDay())
  && (Npc_KnowsInfo(hero,DIA_Quentin_WLADZA))
//&& (TP_START_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_TP_START_Info()
{
    AI_Output (self, other ,"DIA_Connor_TP_START_03_01"); //Wo³a³ ciê Quentin, chyba ma dla ciebie jakieœ zadanie.
    AI_Output (other, self ,"DIA_Connor_TP_START_15_02"); //W takim razie zajrzê do niego.
	//AI_Output (self, other ,"DIA_Connor_TP_START_03_03"); //Có¿, jeszcze jedno... Dziêki za pomoc w sprawie tej korony, jak widzisz dosta³em w zamian niez³¹ broñ od Quentina.
	//AI_Output (other, self ,"DIA_Connor_TP_START_15_04"); //M³ot kowalski to to nie jest, na mnie ju¿ pora.
	AI_Output (other, self ,"DIA_Connor_TP_START_15_05"); //Trzymaj siê!
	Log_CreateTopic    (TrudnaPrzeszlosc, LOG_MISSION);
	Log_SetTopicStatus (TrudnaPrzeszlosc, LOG_RUNNING);
    B_LogEntry (TrudnaPrzeszlosc,"M³ody Bandyta Connor opowiedzia³ mi co nieco o sobie. To smutna historia ale skoro spotkaliœmy siê tutaj to musia³a ona taka byæ. Wspomnia³ ¿e Quentin czegoœ odemnie chce. Mo¿e dowiem siê o nim nieco wiêcej?");	
	
};



//========================================
//-----------------> ENEMY
//========================================

INSTANCE DIA_Connor_Camp (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_Camp_Condition;
   information  = DIA_Connor_Camp_Info;
   permanent	= FALSE;
   Description    = "W pobli¿e kryjówki dotar³a grupka Cieni...";
};

FUNC INT DIA_Connor_Camp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_POSZUKIWACZE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Connor_Camp_Info()
{
    AI_Output (other, self ,"DIA_Connor_Camp_15_01"); //W pobli¿e kryjówki dotar³a grupka Cieni ze Starego Obozu. Trzeba ich wykurzyæ.
    AI_Output (self, other ,"DIA_Connor_Camp_03_02"); //To po to wo³a³ ciê Quentin, tak? Nie ma problemu. Sprz¹tniemy ich.
    AI_Output (other, self ,"DIA_Connor_Camp_15_03"); //Gotowy?
    AI_Output (self, other ,"DIA_Connor_Camp_03_04"); //Tak, prowadŸ. W razie czego to NIE POZWÓL IM UCIEC.
    Wld_InsertNpc				(Stt_40029_Zwiadowca,"OC1"); 
	Wld_InsertNpc				(Stt_40030_Zwiadowca,"OC1");	  
	Wld_InsertNpc				(Stt_40031_Zwiadowca,"OC1");
	Wld_InsertNpc				(Stt_40134_Schatten,"OC1");
//	Wld_InsertNpc				(Stt_40135_Schatten,"OC1");
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine(BAN_40028_Connor,"Follow");
};


//========================================
//-----------------> ENEMY
//========================================

INSTANCE DIA_Connor_Cienie (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_Cienie_Condition;
   information  = DIA_Connor_Cienie_Info;
   permanent	= FALSE;
   important = TRUE;
};

FUNC INT DIA_Connor_Cienie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Connor_Camp))
	&& (Npc_IsDead (Stt_40029_Zwiadowca))
	&& (Npc_IsDead (Stt_40030_Zwiadowca))
	&& (Npc_IsDead (Stt_40031_Zwiadowca))
	&& (Npc_IsDead (Stt_40134_Schatten))
	&& (Npc_IsDead (Stt_40135_Schatten))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Connor_Cienie_Info()
{
    AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Connor_Cienie_03_01"); //No to ich mamy.
    AI_Output (other, self ,"DIA_Connor_Cienie_15_02"); //Dobrze walczysz.
    AI_Output (self, other ,"DIA_Connor_Cienie_03_03"); //Ty tak¿e. Wiesz co... Wpad³o mi coœ do g³owy!
    AI_Output (other, self ,"DIA_Connor_Cienie_15_04"); //Co takiego?
	AI_Output (self, other ,"DIA_Connor_Cienie_03_05"); //Pora wyrównaæ rachunki z moimi starymi znajomymi.
	AI_Output (other, self ,"DIA_Connor_Cienie_15_06"); //Masz na myœli tamtych, którzy cie pobili?
    AI_Output (self, other ,"DIA_Connor_Cienie_03_07"); //Nie inaczej. Pora im siê odwdziêczyæ. 
    AI_Output (other, self ,"DIA_Connor_Cienie_15_08"); //Dobry pomys³.
	AI_Output (self, other ,"DIA_Connor_Cienie_03_11"); //No to ruszamy w dalsz¹ drogê. Zaprowadzê ciê do moich dawnych przyjació³. Z tego co mi wiadomo niedawno krêcili siê w pobli¿u starej kopalni.
    AI_Output (other, self ,"DIA_Connor_Cienie_15_12"); //No to w drogê.	
	Wld_InsertNpc				(BAN_40032_Herszt,"NC_DAM");
	Wld_InsertNpc				(Org_40136_Organisator,"NC_DAM");
	Wld_InsertNpc				(Org_40137_Organisator,"NC_DAM");
    Npc_ExchangeRoutine(BAN_40028_Connor,"Zemsta");
	B_LogEntry                     (TrudnaPrzeszlosc,"Pozbyliœmy siê wêsz¹cych Cieni. Connor stwierdzi³, ¿e to dobry moment by pozbyæ siê jego dawnych oprawców. Pomogê mu w tym a on mnie do nich doprowadzi.");	

	
};

//========================================
//-----------------> ENEMY
//========================================

INSTANCE DIA_Connor_Items (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_Items_Condition;
   information  = DIA_Connor_Items_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Connor_Items_Condition()
{
    if (Npc_HasItems (hero,ItMi_ConnorItems) >=1)
	&& (Npc_IsDead (BAN_40032_Herszt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Connor_Items_Info()
{
    AI_Output (other, self ,"DIA_Connor_Items_15_01"); //Znalaz³em twoje rzeczy.
    AI_Output (self, other ,"DIA_Connor_Items_03_02"); //A jednak jeszcze je mieli. Mogê je odzyskaæ?
    AI_Output (other, self ,"DIA_Connor_Items_15_03"); //Jasne weŸ.
    AI_Output (self, other ,"DIA_Connor_Items_03_04"); //Dziêki.
	AI_Output (other, self ,"DIA_Connor_Items_15_05"); //Wyrówna³eœ swoje rachunki.
	AI_Output (self, other ,"DIA_Connor_Items_03_06"); //To prawda. Tamten rozdzia³ zosta³ zamkniêty raz na zawsze.
    AI_Output (self, other ,"DIA_Connor_Items_03_07"); //Teraz czuje siê wreszcie naprawdê wolny. Choæ tutaj w kolonii zabrzmi to dziwnie.
    AI_Output (self, other ,"DIA_Connor_Items_03_08"); //Od tej pory mo¿esz nazywaæ siê moim przyjacielem. Nie zapominam innym takich rzeczy.
    AI_Output (self, other ,"DIA_Connor_Items_03_09"); //Jeœli chcesz podszkoliæ siê w akrobatyce i zrêcznoœci to mogê ci w tym pomóc.
	AI_Output (other, self ,"DIA_Connor_Items_15_10"); //Dziêki, równy z ciebie goœæ.
	AI_Output (self, other ,"DIA_Connor_Items_03_11"); //Pora wracaæ do obozu.
    AI_Output (other, self ,"DIA_Connor_Items_15_12"); //Tak, trzeba zdaæ meldunek Quentinowi.
	AI_Output (self, other ,"DIA_Connor_Items_03_13"); //No to idziemy.  
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine(self,"Start");
	Connor_Friend = TRUE;
	B_GiveInvItems          (hero, self, ItMi_ConnorItems, 1);
	Npc_RemoveInvItems      (self, ItMi_ConnorItems,1);
    B_LogEntry              (TrudnaPrzeszlosc,"Dawni ,,przyjaciele” Connora nale¿¹ ju¿ do przesz³oœci. Teraz Connor w podziêce sta³ siê moim dobrym kompanem. Ponadto mo¿e nauczyæ mnie zrêcznoœci i akrobatyki. Przyda mi siê taki towarzysz w tak bezwzglêdnym miejscu jak Kolonia karna. Pora wróciæ i zdaæ raport Quentinowi.");	
     
};

// *********** Talent lernen *******************
INSTANCE DIA_Connor_TalentAcrobat (C_INFO)
{
	npc				= BAN_40028_Connor;
	condition		= DIA_Connor_TalentAcrobat_Condition;
	information		= DIA_Connor_TalentAcrobat_Info;
	important		= 0;
	permanent		= TRUE;
	description		= "Naucz mnie akrobatyki."; 
};

FUNC INT DIA_Connor_TalentAcrobat_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Connor_Camp)) 
	&& (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) == 0)
	&& (Connor_Friend == TRUE)
	{
	return TRUE; 
	};
};

FUNC void DIA_Connor_TalentAcrobat_Info()
{
	
	
    AI_Output (other ,self,"DIA_Connor_TalentAcrobat_15_01"); //Naucz mnie akrobatyki.
	AI_Output (self, other,"DIA_Connor_TalentAcrobat_02_02"); //Poka¿ê ci w jaki sposób mo¿na z³agodziæ efekt upadku z du¿ej wysokoœci. Tylko nie myœl sobie, ¿e bêdziesz móg³ skakaæ bóg wie sk¹d!
	AI_Output (self, other,"DIA_Connor_TalentAcrobat_02_03"); //Akrobatyka przyda ci siê równie¿ w trakcie walki. Poka¿ê ci jak bardzo szybko zmniejszyæ lub zwiêkszyæ odleg³oœæ dziel¹c¹ ciê od przeciwnika. Powodzenia! 
    B_teachthieftalent(self,other,NPC_TALENT_ACROBAT); 


};




//========================================
//-----------------> KH_Sekta
//========================================

INSTANCE DIA_Connor_KH_Sekta (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_Sekta_Condition;
   information  = DIA_Connor_KH_Sekta_Info;
   permanent	= FALSE;
   description	= "Ponoæ przys³a³ ciê tu Quentin w sprawie korony Hrodgira.";
};

FUNC INT DIA_Connor_KH_Sekta_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_KH_Sekta))
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_Sekta_Info()
{
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_01"); //Ponoæ przys³a³ ciê tu Quentin w sprawie korony Hrodgira.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_02"); //Tak. Uda³o mi siê ustaliæ, ¿e trop wiedzie w kierunku, któregoœ z Guru.
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_03"); //Tylko, którego.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_04"); //Powinieneœ pogadaæ z osob¹ godn¹ zaufania w obozie. Z kimœ kto wiele tutaj wie a jednoczeœnie sam nie jest Guru.
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_05"); //Chyba znajdzie siê ktoœ taki.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_06"); //I bardzo dobrze.
	B_LogEntry               (KoronaHrodgira,"Connor powiedzia³, ¿e uda³o mu siê ustaliæ, ¿e o koronie wie, któryœ z Guru. Muszê dopytaæ siê kogoœ zaufanego w obozie o którego baala dok³adnie chodzi.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KH_TALAS_SSIE
//========================================

INSTANCE DIA_Connor_KH_TALAS_SSIE (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_TALAS_SSIE_Condition;
   information  = DIA_Connor_KH_TALAS_SSIE_Info;
   permanent	= FALSE;
   description	= "Wiem kto mo¿e nam pomóc.";
};

FUNC INT DIA_Connor_KH_TALAS_SSIE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Talas_KH_Tirutt))
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_TALAS_SSIE_Info()
{
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_01"); //Wiem kto mo¿e nam pomóc. Tyle ¿e nie wie w którym mjejscu na mapie siê to znajduje.
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_02"); //Móg³by nas tam zaprowadziæ, jednak nie jest do tego zbyt chêtny.
    AI_Output (self, other ,"DIA_Connor_KH_TALAS_SSIE_03_03"); //No to prowadŸ, dodamy mu trochê motywacji.
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_04"); //Za mn¹.
	Npc_ExchangeRoutine(self,"FOLLOWKH");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> KH_Path
//========================================

INSTANCE DIA_Connor_KH_Path (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_Path_Condition;
   information  = DIA_Connor_KH_Path_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_KH_Path_Condition()
{
if  (Npc_KnowsInfo(hero,DIA_Talas_KH_Path))
&&  (Npc_GetDistToWP(hero,"PSI_START")<1000)
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_Path_Info()
{
    AI_GotoNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_01"); //Szkoda, ¿e ten baran nie wie gdzie na³o¿yæ na mapie miejsce ukrycia tego artefaktu.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_02"); //Moglibyœmy daæ tak¹ mapê Quentinowi i umyæ rêce.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_03"); //A tak czeka nas walka z tym przeroœniêtym zêbaczem bydlakiem. 
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_04"); //Tak. Znaj¹c ¿ycie.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_05"); //Mo¿e powinniœmy poprosiæ Quentina o wsparcie paru ludzi?
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_06"); //I przy podziale nagrody równie¿?
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_07"); //Masz racjê. Dlatego musimy pójœæ sami wraz z tym goœciem, który przebiera nogami ze strachu.
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_08"); //Odwaga to nie jest jego dar od Bogów... Ale có¿ nie spodziewam siê, ¿e wspomo¿e nas w walce.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_09"); //Raczej w ewentualnej ucieczce. Ale damy sobie jakoœ radê.
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_10"); //Zatem w drogê. Korona sama siê nie znajdzie.
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> KH_SNAPPER
//========================================

INSTANCE DIA_Connor_KH_SNAPPER (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_SNAPPER_Condition;
   information  = DIA_Connor_KH_SNAPPER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_KH_SNAPPER_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Talas_KH_NAURA))
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_SNAPPER_Info()
{
    AI_Output (self, other ,"DIA_Connor_KH_SNAPPER_03_01"); //Dobra zajmijmy siê tym bydlakiem.
    AI_Output (other, self ,"DIA_Connor_KH_SNAPPER_15_02"); //Nie traæmy czasu.
	AI_StandUp		(Nov_1300_Talas);
	AI_SetWalkmode 	(Nov_1300_Talas,	NPC_RUN);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KH_MAP_TIR
//========================================

INSTANCE DIA_Connor_KH_MAP_TIR (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_MAP_TIR_Condition;
   information  = DIA_Connor_KH_MAP_TIR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_KH_MAP_TIR_Condition()
{
if (TIRR_Zapiski == TRUE)
&& (Npc_KnowsInfo(hero,DIA_Connor_KH_SNAPPER))
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_MAP_TIR_Info()
{
    AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_01"); //No i co?
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_02"); //Nie ma korony. Jest jedynie mapa i zapiski Nowicjusza.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_03"); //Pisze, ¿e nigdy nie mia³ korony a jedynie zna³ rzeczywiste miejsce jej ukrycia.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_04"); //Tyle, ¿e na niewiele mu siê to zda³o. Bo miejsce to jest chronione przez o¿ywieñców.
    AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_05"); //Cholera a jednak to nie koniec.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_07"); //Z tego co widzê to miejsce znajduje siê w pobli¿u nowego obozu...
    AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_08"); //Hmm... Poka¿ mi tê mapê. 
	B_UseFakeScroll();        
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_09"); //Có¿, zaznaczone mjejsce znajduje siê w górach nad obozem i nieopodal kot³a.
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_10"); //Mam wra¿enie ¿e mo¿e to byæ stara wie¿a która niegdyœ nale¿a³a do gwardii królewskiej, w koloni by³o takich kilka.
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_11"); //Mniejsza z tym, spotkajmy siê w tamtejszej karczmie.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_12"); //Niech bêdzie.
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry               (KoronaHrodgira,"Powiedzia³em Connorowi o mapie i zapiskach, mjejsce w którym znajduje siê korona znajduje siê w pobli¿u Nowego Obozu, ten przypuszcza ¿e mo¿e to byæ stara wie¿a gwardii nad obozem, Connor bêdzie czeka³ w tamtejszej karczmie...");
	Npc_ExchangeRoutine(self,"KHINNC");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> KH_MOUTAIN_PATH
//========================================
Func void KH_RESP()
{
Wld_InsertNpc		(Zom_Hrodgir,"WP_KH_BOSS");
};
INSTANCE DIA_Connor_KH_MOUTAIN_PATH (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 2;
   condition    = DIA_Connor_KH_MOUTAIN_PATH_Condition;
   information  = DIA_Connor_KH_MOUTAIN_PATH_Info;
   permanent	= FALSE;
   description	= "Gotów ruszyæ po koronê?";
};

FUNC INT DIA_Connor_KH_MOUTAIN_PATH_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Connor_KH_MAP_TIR))
&& (Npc_GetDistToWP(hero,"WP_CONNOR_NC")<2000)
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_MOUTAIN_PATH_Info()
{
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_01"); //Gotów ruszyæ po koronê?
    AI_Output (self, other ,"DIA_Connor_KH_MOUTAIN_PATH_03_02"); //Nie jestem tchórzem jak Talas. 
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_03"); //To ju¿ wiem. I wielki martwy zêbacz równie¿.
    AI_Output (self, other ,"DIA_Connor_KH_MOUTAIN_PATH_03_04"); //SprawdŸmy te przeklêt¹ wie¿e.
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_05"); //W drogê.
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"KHHROD");
	KH_RESP();
	
};
//========================================
//-----------------> KH_IWAITING
//========================================

INSTANCE DIA_Connor_KH_IWAITING (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_IWAITING_Condition;
   information  = DIA_Connor_KH_IWAITING_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Connor_KH_IWAITING_Condition()
{
//if (Npc_KnowsInfo(hero,DIA_Connor_KH_MOUTAIN_PATH))
if (Npc_GetDistToWP(hero,"WP_KH12")<3000)
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_IWAITING_Info()
{
    AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_01"); //Ja tu na ciebe zaczekam, jeden Innos wie co mo¿e nas zajœæ od ty³u.
    AI_Output (other, self ,"DIA_Connor_KH_IWAITING_15_02"); //Tak, tak... a ja za³atwie reszte roboty...
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_03"); //Hej, nie przesadzasz trochê? Mówiê powa¿nie, a poza tym to ten ³ysy frajer zwia³, nie JA.
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_04"); //Tak¿e sprawdŸ te cholern¹ wie¿e i siê zmywamy do obozu.
	Npc_ExchangeRoutine(BAN_40028_Connor,"KHWAIT");
    AI_StopProcessInfos	(self);
};

Func void Hero_Teleport_KH()
{

 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
AI_Teleport(BAN_40028_Connor,"BN_NUTA_866");
AI_Teleport(hero,"BN_NUTA_866");
AI_StopProcessInfos(self);
};
//========================================
//-----------------> KH_GOTCrown
//========================================

INSTANCE DIA_Connor_KH_GOTCrown (C_INFO)
{
   npc          = BAN_40028_Connor;
   nr           = 1;
   condition    = DIA_Connor_KH_GOTCrown_Condition;
   information  = DIA_Connor_KH_GOTCrown_Info;
   permanent	= FALSE;
   description	= "Mam koronê.";
};

FUNC INT DIA_Connor_KH_GOTCrown_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Connor_KH_MOUTAIN_PATH))
&& (Npc_HasItems (other, ItHe_Hrodgir) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Connor_KH_GOTCrown_Info()
{
    AI_Output (other, self ,"DIA_Connor_KH_GOTCrown_15_01"); //Mam koronê.
    AI_Output (self, other ,"DIA_Connor_KH_GOTCrown_03_02"); //Cholera chodŸmy ju¿ z t¹d, to mjejsce mnie przera¿a.
    AI_Output (other, self ,"DIA_Connor_KH_GOTCrown_15_03"); //Racja, to nie zbyt przyjemne mjejsce na pogawêdki.
    AI_Output (self, other ,"DIA_Connor_KH_GOTCrown_03_04"); //W takim razie widzimy siê w obozie, mamy to co chcieliœmy. 
	Npc_ExchangeRoutine(BAN_40028_Connor,"Start");
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
	KHEND_QT = TRUE;
	B_LogEntry               (KoronaHrodgira,"Wraz z Connorem udaliœmy siê zgodnie z map¹ i napotkaliœmy ob³o¿onych kl¹tw¹ o¿ywieñców w tym samego Hrodgira. Po walce uda³o nam siê zdobyæ artefakt.");
    
	
	Info_ClearChoices	(DIA_Connor_KH_GOTCrown);
    Info_AddChoice		(DIA_Connor_KH_GOTCrown, "(Wróæ do obozu)", DIA_CONNOR_KH_END);
	Info_AddChoice		(DIA_Connor_KH_GOTCrown, "(Zajmij siê swoimi sprawami)", DIA_CONNOR_KH_ENDGO);
};

FUNC VOID DIA_CONNOR_KH_END()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
AI_StopProcessInfos(self);
AI_Teleport(Hero,"BN_NUTA_866");
Hero_Teleport_KH();
};


FUNC VOID DIA_CONNOR_KH_ENDGO()
{
  
	AI_Output (other, self ,"DIA_CONNOR_KH_ENDGO_15_01"); //Na razie.
    AI_Output (self, other ,"DIA_CONNOR_KH_ENDGO_03_02"); //Uwa¿aj na siebie.
	AI_StopProcessInfos(self);
};



// ************************************************************
// 							Connor = Lehrer
// ************************************************************
var int Connor_Merke_DEX;
// ************************************************************

INSTANCE Info_Connor_Teach(C_INFO)
{
	npc			= BAN_40028_Connor;
	nr			= 100;
	condition	= Info_Connor_Teach_Condition;
	information	= Info_Connor_Teach_Info;
	permanent	= 1;
	description = "Naucz mnie jak byæ zrêczniejszym.";
};                       

FUNC INT Info_Connor_Teach_Condition()
{
	if (Connor_Friend == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Connor_Teach_Info()
{	
	if	(log_Connortrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,	"Connor mo¿e mi pomóc w zwiêkszeniu mojej zwinnoœci.");
		log_Connortrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Connor_Teach_15_00"); //Naucz mnie jak byæ zrêczniejszym.
	AI_Output(self,hero,"Info_Connor_Teach_11_01"); //Jasne.
	

	Connor_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Connor_Teach);
	Info_AddChoice		(Info_Connor_Teach,DIALOG_BACK,Info_Connor_Teach_BACK);

	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_5);
	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_1);
	
	
};

func void Info_Connor_Teach_BACK()
{
	
	if (Connor_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Connor_Teach_BACK_11_01"); //Coraz lepiej ci idzie.
	};
	AI_Output(self,hero,"Info_Connor_Teach_BACK_11_02"); //Zajrzyj jeszcze kiedyœ.
	Info_ClearChoices	(Info_Connor_Teach);
};


func void Info_Connor_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Connor_Teach);
	Info_AddChoice		(Info_Connor_Teach,DIALOG_BACK									,Info_Connor_Teach_BACK);
	
	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_5);
	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_1);
};

func void Info_Connor_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Connor_Teach);
	Info_AddChoice		(Info_Connor_Teach,DIALOG_BACK									,Info_Connor_Teach_BACK);
	
	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_5);
	Info_AddChoice		(Info_Connor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Connor_Teach_DEX_1);
};



