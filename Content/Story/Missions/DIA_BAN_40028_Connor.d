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
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_01"); //Uczestniczysz w wielkich wydarzeniach. Na twoich oczach wiele si� zmienia.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_02"); //Mam nadzieje, �e groza I wszelkie niebezpiecze�stwa, kt�re spotykasz nie dadz� ci rady.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_03"); //Ufam, �e przetrwam t� pr�b� si�. Postaram si� nie da� satysfakcji tym z, kt�rymi si� mierz�.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_04"); //Powodzenia przyjacielu. Czuje dziwne przeczucia, �e najwi�ksze pr�by wci�� przed tob�.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_05"); //Kto wie jaki los jest mi pisany. Oby nie by�a to rych�a wizyta w kr�lestwie Beliara.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_06"); //Haha... Mam nadzieje, �e czeka ci� jeszcze d�ugie I bogate w wydarzenia �ycie.
    AI_Output (other, self ,"DIA_Connor_HI_HERO_CH5_15_07"); //Na razie. Wszyskiego dobrego.
    AI_Output (self, other ,"DIA_Connor_HI_HERO_CH5_03_08"); //Nawzajem. Mo�e jeszcze kiedy� wyruszymy na wsp�ln� misje...
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
   Description    = "Opowiesz mi co� o sobie?";
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
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_01"); //Opowiesz mi co� o sobie?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_02"); //Mam na imi� Connor. Od pewnego, mo�e nie zbyt d�ugiego czasu nale�� do bandy Quentina.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_03"); //I wreszcie czuje, �e jestem we w�a�ciwym miejscu. Pierwszy raz od dawna.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_04"); //A gdzie by�e� wcze�niej?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_05"); //Nie chc� o tym m�wi�...
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_06"); //Mo�e jednak?
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_07"); //Wola�bym nie. To bolesna sprawa.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_08"); //Je�li ci� co� gryzie to mo�e lepiej to z siebie wyrzuci�.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_09"); //Mo�e masz racj�. Ale to b�dzie d�uga opowie��.
    AI_Output (other, self ,"DIA_Connor_ENEMY_15_10"); //Mam czas, nigdzie mi si� nie �pieszy. Bariera raczej dzisiaj nie upadnie.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_11"); //Przed trafieniem do Kolonii nale�a�em do ulicznej szajki. By�em wtedy ma�olatem.
    AI_Output (self, other ,"DIA_Connor_ENEMY_03_12"); //Pewnego dnia okrad�em jednego urz�dnika i wpad�em. Dosta�em wyrok i zrzucono mnie pod barier�. Nikogo nie obchodzi�o, �e jestem dzieciakiem z mlekiem pod nosem.
    Info_ClearChoices	(DIA_Connor_ENEMY);
	Info_AddChoice		(DIA_Connor_ENEMY, "Co by�o dalej?", DIA_Connor_First_Add1);
    
};
FUNC VOID DIA_Connor_First_Add1()
{
    AI_Output (other, self ,"DIA_Connor_First_Add1_15_01"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Connor_First_Add1_03_02"); //Przysta�em do pewnej szajki. Nie mia�em wyj�cia wola�em to ni� Stary Ob�z. Odrzuci� mnie ju� sam chrzest wody nie m�wi�c ju� o p�niejszej perspektywie bycia wyzyskiwanym.
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_03"); //Jak na ironi� najwi�kszy wyzysk czeka� mnie w mojej nowej grupie. Te zbiry zrobi�y sobie ze mnie podleg�ego im s�ug�.
    AI_Output (self, other ,"DIA_Connor_First_Add1_03_04"); //Ale mia�em swoje zdolno�ci i by�em przydatny. Nie raz uda�o mi si� wykra�� par� cennych przedmiot�w. Pewnego dnia zrobi�em du�y skok.
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_05"); //Okrad�em ob�z przed star� kopalni�. Wr�ci�em do obozu z �upami. Te gnoje spi�y mnie i okrad�y. Na dodatek pobi�y tak, �e do dzi� czuje to w ko�ciach.
    AI_Output (other, self ,"DIA_Connor_First_Add1_15_06"); //Co by�o potem?
	AI_Output (self, other ,"DIA_Connor_First_Add1_03_07"); //B��ka�em si� po kolonii... A� spotka�em Ratforda i Draxa. Przeszed�em test i do��czy�em do ludzi Quentina. Teraz jestem zadowolony z tego gdzie jestem.
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
    AI_Output (self, other ,"DIA_Connor_TP_START_03_01"); //Wo�a� ci� Quentin, chyba ma dla ciebie jakie� zadanie.
    AI_Output (other, self ,"DIA_Connor_TP_START_15_02"); //W takim razie zajrz� do niego.
	//AI_Output (self, other ,"DIA_Connor_TP_START_03_03"); //C�, jeszcze jedno... Dzi�ki za pomoc w sprawie tej korony, jak widzisz dosta�em w zamian niez�� bro� od Quentina.
	//AI_Output (other, self ,"DIA_Connor_TP_START_15_04"); //M�ot kowalski to to nie jest, na mnie ju� pora.
	AI_Output (other, self ,"DIA_Connor_TP_START_15_05"); //Trzymaj si�!
	Log_CreateTopic    (TrudnaPrzeszlosc, LOG_MISSION);
	Log_SetTopicStatus (TrudnaPrzeszlosc, LOG_RUNNING);
    B_LogEntry (TrudnaPrzeszlosc,"M�ody Bandyta Connor opowiedzia� mi co nieco o sobie. To smutna historia ale skoro spotkali�my si� tutaj to musia�a ona taka by�. Wspomnia� �e Quentin czego� odemnie chce. Mo�e dowiem si� o nim nieco wi�cej?");	
	
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
   Description    = "W pobli�e kryj�wki dotar�a grupka Cieni...";
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
    AI_Output (other, self ,"DIA_Connor_Camp_15_01"); //W pobli�e kryj�wki dotar�a grupka Cieni ze Starego Obozu. Trzeba ich wykurzy�.
    AI_Output (self, other ,"DIA_Connor_Camp_03_02"); //To po to wo�a� ci� Quentin, tak? Nie ma problemu. Sprz�tniemy ich.
    AI_Output (other, self ,"DIA_Connor_Camp_15_03"); //Gotowy?
    AI_Output (self, other ,"DIA_Connor_Camp_03_04"); //Tak, prowad�. W razie czego to NIE POZW�L IM UCIEC.
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
    AI_Output (self, other ,"DIA_Connor_Cienie_03_03"); //Ty tak�e. Wiesz co... Wpad�o mi co� do g�owy!
    AI_Output (other, self ,"DIA_Connor_Cienie_15_04"); //Co takiego?
	AI_Output (self, other ,"DIA_Connor_Cienie_03_05"); //Pora wyr�wna� rachunki z moimi starymi znajomymi.
	AI_Output (other, self ,"DIA_Connor_Cienie_15_06"); //Masz na my�li tamtych, kt�rzy cie pobili?
    AI_Output (self, other ,"DIA_Connor_Cienie_03_07"); //Nie inaczej. Pora im si� odwdzi�czy�. 
    AI_Output (other, self ,"DIA_Connor_Cienie_15_08"); //Dobry pomys�.
	AI_Output (self, other ,"DIA_Connor_Cienie_03_11"); //No to ruszamy w dalsz� drog�. Zaprowadz� ci� do moich dawnych przyjaci�. Z tego co mi wiadomo niedawno kr�cili si� w pobli�u starej kopalni.
    AI_Output (other, self ,"DIA_Connor_Cienie_15_12"); //No to w drog�.	
	Wld_InsertNpc				(BAN_40032_Herszt,"NC_DAM");
	Wld_InsertNpc				(Org_40136_Organisator,"NC_DAM");
	Wld_InsertNpc				(Org_40137_Organisator,"NC_DAM");
    Npc_ExchangeRoutine(BAN_40028_Connor,"Zemsta");
	B_LogEntry                     (TrudnaPrzeszlosc,"Pozbyli�my si� w�sz�cych Cieni. Connor stwierdzi�, �e to dobry moment by pozby� si� jego dawnych oprawc�w. Pomog� mu w tym a on mnie do nich doprowadzi.");	

	
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
    AI_Output (other, self ,"DIA_Connor_Items_15_01"); //Znalaz�em twoje rzeczy.
    AI_Output (self, other ,"DIA_Connor_Items_03_02"); //A jednak jeszcze je mieli. Mog� je odzyska�?
    AI_Output (other, self ,"DIA_Connor_Items_15_03"); //Jasne we�.
    AI_Output (self, other ,"DIA_Connor_Items_03_04"); //Dzi�ki.
	AI_Output (other, self ,"DIA_Connor_Items_15_05"); //Wyr�wna�e� swoje rachunki.
	AI_Output (self, other ,"DIA_Connor_Items_03_06"); //To prawda. Tamten rozdzia� zosta� zamkni�ty raz na zawsze.
    AI_Output (self, other ,"DIA_Connor_Items_03_07"); //Teraz czuje si� wreszcie naprawd� wolny. Cho� tutaj w kolonii zabrzmi to dziwnie.
    AI_Output (self, other ,"DIA_Connor_Items_03_08"); //Od tej pory mo�esz nazywa� si� moim przyjacielem. Nie zapominam innym takich rzeczy.
    AI_Output (self, other ,"DIA_Connor_Items_03_09"); //Je�li chcesz podszkoli� si� w akrobatyce i zr�czno�ci to mog� ci w tym pom�c.
	AI_Output (other, self ,"DIA_Connor_Items_15_10"); //Dzi�ki, r�wny z ciebie go��.
	AI_Output (self, other ,"DIA_Connor_Items_03_11"); //Pora wraca� do obozu.
    AI_Output (other, self ,"DIA_Connor_Items_15_12"); //Tak, trzeba zda� meldunek Quentinowi.
	AI_Output (self, other ,"DIA_Connor_Items_03_13"); //No to idziemy.  
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine(self,"Start");
	Connor_Friend = TRUE;
	B_GiveInvItems          (hero, self, ItMi_ConnorItems, 1);
	Npc_RemoveInvItems      (self, ItMi_ConnorItems,1);
    B_LogEntry              (TrudnaPrzeszlosc,"Dawni ,,przyjaciele� Connora nale�� ju� do przesz�o�ci. Teraz Connor w podzi�ce sta� si� moim dobrym kompanem. Ponadto mo�e nauczy� mnie zr�czno�ci i akrobatyki. Przyda mi si� taki towarzysz w tak bezwzgl�dnym miejscu jak Kolonia karna. Pora wr�ci� i zda� raport Quentinowi.");	
     
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
	AI_Output (self, other,"DIA_Connor_TalentAcrobat_02_02"); //Poka�� ci w jaki spos�b mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!
	AI_Output (self, other,"DIA_Connor_TalentAcrobat_02_03"); //Akrobatyka przyda ci si� r�wnie� w trakcie walki. Poka�� ci jak bardzo szybko zmniejszy� lub zwi�kszy� odleg�o�� dziel�c� ci� od przeciwnika. Powodzenia! 
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
   description	= "Pono� przys�a� ci� tu Quentin w sprawie korony Hrodgira.";
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
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_01"); //Pono� przys�a� ci� tu Quentin w sprawie korony Hrodgira.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_02"); //Tak. Uda�o mi si� ustali�, �e trop wiedzie w kierunku, kt�rego� z Guru.
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_03"); //Tylko, kt�rego.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_04"); //Powiniene� pogada� z osob� godn� zaufania w obozie. Z kim� kto wiele tutaj wie a jednocze�nie sam nie jest Guru.
    AI_Output (other, self ,"DIA_Connor_KH_Sekta_15_05"); //Chyba znajdzie si� kto� taki.
    AI_Output (self, other ,"DIA_Connor_KH_Sekta_03_06"); //I bardzo dobrze.
	B_LogEntry               (KoronaHrodgira,"Connor powiedzia�, �e uda�o mu si� ustali�, �e o koronie wie, kt�ry� z Guru. Musz� dopyta� si� kogo� zaufanego w obozie o kt�rego baala dok�adnie chodzi.");
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
   description	= "Wiem kto mo�e nam pom�c.";
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
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_01"); //Wiem kto mo�e nam pom�c. Tyle �e nie wie w kt�rym mjejscu na mapie si� to znajduje.
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_02"); //M�g�by nas tam zaprowadzi�, jednak nie jest do tego zbyt ch�tny.
    AI_Output (self, other ,"DIA_Connor_KH_TALAS_SSIE_03_03"); //No to prowad�, dodamy mu troch� motywacji.
    AI_Output (other, self ,"DIA_Connor_KH_TALAS_SSIE_15_04"); //Za mn�.
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
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_01"); //Szkoda, �e ten baran nie wie gdzie na�o�y� na mapie miejsce ukrycia tego artefaktu.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_02"); //Mogliby�my da� tak� map� Quentinowi i umy� r�ce.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_03"); //A tak czeka nas walka z tym przero�ni�tym z�baczem bydlakiem. 
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_04"); //Tak. Znaj�c �ycie.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_05"); //Mo�e powinni�my poprosi� Quentina o wsparcie paru ludzi?
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_06"); //I przy podziale nagrody r�wnie�?
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_07"); //Masz racj�. Dlatego musimy p�j�� sami wraz z tym go�ciem, kt�ry przebiera nogami ze strachu.
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_08"); //Odwaga to nie jest jego dar od Bog�w... Ale c� nie spodziewam si�, �e wspomo�e nas w walce.
    AI_Output (self, other ,"DIA_Connor_KH_Path_03_09"); //Raczej w ewentualnej ucieczce. Ale damy sobie jako� rad�.
    AI_Output (other, self ,"DIA_Connor_KH_Path_15_10"); //Zatem w drog�. Korona sama si� nie znajdzie.
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
    AI_Output (self, other ,"DIA_Connor_KH_SNAPPER_03_01"); //Dobra zajmijmy si� tym bydlakiem.
    AI_Output (other, self ,"DIA_Connor_KH_SNAPPER_15_02"); //Nie tra�my czasu.
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
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_03"); //Pisze, �e nigdy nie mia� korony a jedynie zna� rzeczywiste miejsce jej ukrycia.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_04"); //Tyle, �e na niewiele mu si� to zda�o. Bo miejsce to jest chronione przez o�ywie�c�w.
    AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_05"); //Cholera a jednak to nie koniec.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_07"); //Z tego co widz� to miejsce znajduje si� w pobli�u nowego obozu...
    AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_08"); //Hmm... Poka� mi t� map�. 
	B_UseFakeScroll();        
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_09"); //C�, zaznaczone mjejsce znajduje si� w g�rach nad obozem i nieopodal kot�a.
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_10"); //Mam wra�enie �e mo�e to by� stara wie�a kt�ra niegdy� nale�a�a do gwardii kr�lewskiej, w koloni by�o takich kilka.
	AI_Output (self, other ,"DIA_Connor_KH_MAP_TIR_03_11"); //Mniejsza z tym, spotkajmy si� w tamtejszej karczmie.
    AI_Output (other, self ,"DIA_Connor_KH_MAP_TIR_15_12"); //Niech b�dzie.
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry               (KoronaHrodgira,"Powiedzia�em Connorowi o mapie i zapiskach, mjejsce w kt�rym znajduje si� korona znajduje si� w pobli�u Nowego Obozu, ten przypuszcza �e mo�e to by� stara wie�a gwardii nad obozem, Connor b�dzie czeka� w tamtejszej karczmie...");
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
   description	= "Got�w ruszy� po koron�?";
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
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_01"); //Got�w ruszy� po koron�?
    AI_Output (self, other ,"DIA_Connor_KH_MOUTAIN_PATH_03_02"); //Nie jestem tch�rzem jak Talas. 
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_03"); //To ju� wiem. I wielki martwy z�bacz r�wnie�.
    AI_Output (self, other ,"DIA_Connor_KH_MOUTAIN_PATH_03_04"); //Sprawd�my te przekl�t� wie�e.
    AI_Output (other, self ,"DIA_Connor_KH_MOUTAIN_PATH_15_05"); //W drog�.
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
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_01"); //Ja tu na ciebe zaczekam, jeden Innos wie co mo�e nas zaj�� od ty�u.
    AI_Output (other, self ,"DIA_Connor_KH_IWAITING_15_02"); //Tak, tak... a ja za�atwie reszte roboty...
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_03"); //Hej, nie przesadzasz troch�? M�wi� powa�nie, a poza tym to ten �ysy frajer zwia�, nie JA.
    AI_Output (self, other ,"DIA_Connor_KH_IWAITING_03_04"); //Tak�e sprawd� te cholern� wie�e i si� zmywamy do obozu.
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
   description	= "Mam koron�.";
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
    AI_Output (other, self ,"DIA_Connor_KH_GOTCrown_15_01"); //Mam koron�.
    AI_Output (self, other ,"DIA_Connor_KH_GOTCrown_03_02"); //Cholera chod�my ju� z t�d, to mjejsce mnie przera�a.
    AI_Output (other, self ,"DIA_Connor_KH_GOTCrown_15_03"); //Racja, to nie zbyt przyjemne mjejsce na pogaw�dki.
    AI_Output (self, other ,"DIA_Connor_KH_GOTCrown_03_04"); //W takim razie widzimy si� w obozie, mamy to co chcieli�my. 
	Npc_ExchangeRoutine(BAN_40028_Connor,"Start");
	BAN_40028_Connor.aivar[AIV_PARTYMEMBER] = FALSE;
	KHEND_QT = TRUE;
	B_LogEntry               (KoronaHrodgira,"Wraz z Connorem udali�my si� zgodnie z map� i napotkali�my ob�o�onych kl�tw� o�ywie�c�w w tym samego Hrodgira. Po walce uda�o nam si� zdoby� artefakt.");
    
	
	Info_ClearChoices	(DIA_Connor_KH_GOTCrown);
    Info_AddChoice		(DIA_Connor_KH_GOTCrown, "(Wr�� do obozu)", DIA_CONNOR_KH_END);
	Info_AddChoice		(DIA_Connor_KH_GOTCrown, "(Zajmij si� swoimi sprawami)", DIA_CONNOR_KH_ENDGO);
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
    AI_Output (self, other ,"DIA_CONNOR_KH_ENDGO_03_02"); //Uwa�aj na siebie.
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
	description = "Naucz mnie jak by� zr�czniejszym.";
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
		B_LogEntry		(GE_TeacherBAN,	"Connor mo�e mi pom�c w zwi�kszeniu mojej zwinno�ci.");
		log_Connortrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Connor_Teach_15_00"); //Naucz mnie jak by� zr�czniejszym.
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
	AI_Output(self,hero,"Info_Connor_Teach_BACK_11_02"); //Zajrzyj jeszcze kiedy�.
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



