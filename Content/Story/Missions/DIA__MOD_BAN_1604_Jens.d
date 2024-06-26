//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Jens_EXIT(C_INFO)
{
	npc             = BAN_1604_Jens;
	nr              = 999;
	condition	= DIA_Jens_EXIT_Condition;
	information	= DIA_Jens_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Jens_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jens_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia� -
// Dialogi og�lne i handel
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Jens_HELLO1 (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_HELLO1_Condition;
   information  = DIA_Jens_HELLO1_Info;
   permanent	= FALSE;
   description	= "Cze��. Czym si� zajmujesz?";
};

FUNC INT DIA_Jens_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jens_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Jens_HELLO1_15_01"); //Cze��. Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Jens_HELLO1_03_02"); //Jeste� tu nowy? Nie widzia�em ci� jeszcze.
	AI_Output (other, self ,"DIA_Jens_HELLO1_15_03"); //Tak, jestem tu od niedawna.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_04"); //Nazywam si� Jens. Oprawiam sk�ry, czyszcz� k�y i sprzedaj�. Pomagam tak�e szy� pancerze.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_05"); //Tak si� sk�ada, �e mam na stanie dobre my�liwskie ubranie. Jeste� zainteresowany?
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_06"); //To ubranie mo�e ci ocali� �ycie!
	AI_Output (other, self ,"DIA_Jens_HELLO1_15_07"); //W jakim sensie?
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_08"); //Przyda ci si�, gdyby� na przyk�ad chcia� si� wybra� do Starego Obozu i pozosta� w ukryciu. Je�li w�o�ysz nasz pancerz, Stra�nicy natychmiast ci� zdemaskuj�.
	AI_Output (self, other ,"DIA_Jens_HELLO1_03_09"); //W tym mysliwskim stroju b�dziesz mia� troszeczk� spokoju. 
	//log
	Log_CreateTopic	(GE_Bandit, LOG_NOTE);
	B_LogEntry		(GE_Bandit, "Jens zajmuje si� oprawianiem sk�r i przygotowywaniem trofe�w. Zaproponowa� mi, �e sprzeda mi my�liwskie ubranie.");
};

//========================================
//-----------------> FirstArmorPrice
//========================================

INSTANCE DIA_Jens_FirstArmorPrice (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_FirstArmorPrice_Condition;
   information  = DIA_Jens_FirstArmorPrice_Info;
   permanent	= FALSE;
   description	= "Ile chcesz za ten pancerz?";
};

FUNC INT DIA_Jens_FirstArmorPrice_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jens_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_FirstArmorPrice_Info()
{
    AI_Output (other, self ,"DIA_Jens_FirstArmorPrice_15_01"); //Ile chcesz za ten pancerz?
    AI_Output (self, other ,"DIA_Jens_FirstArmorPrice_03_02"); //Tylko 750 bry�ek rudy. To niewiele! Nosi�em to ubranie, gdy pracowa�em jako �uczarz w Khorinis.
	AI_Output (self, other ,"DIA_Jens_FirstArmorPrice_03_03"); //Jest warte swojej ceny!
};

var int Jens_SellArmor_OneTime;
//========================================
//-----------------> ArmorLeather
//========================================

INSTANCE DIA_Jens_ArmorLeather (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_ArmorLeather_Condition;
   information  = DIA_Jens_ArmorLeather_Info;
   permanent	= TRUE;
   description	= "Dobrze, daj mi t� zbroj�. (ochrona: bro�: 20, strza�y: 10, koszt: 750)";
};

FUNC INT DIA_Jens_ArmorLeather_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Jens_FirstArmorPrice)) && (Jens_SellArmor_OneTime == FALSE)
	{
        var int AFIP_ShowItem; AFIP_ShowItem = NON_LEATHER_ARMOR_L;
    return TRUE;
	};
};

FUNC VOID DIA_Jens_ArmorLeather_Info()
{
    AI_Output (other, self ,"DIA_Jens_ArmorLeather_15_01"); //Dobrze, daj mi t� zbroj�.
    if (Npc_HasItems (hero, ItMiNugget)>=750)
    {
		CreateInvItem		(hero, NON_LEATHER_ARMOR_L);
	
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
        AI_Output (self, other ,"DIA_Jens_ArmorLeather_03_02"); //Prosz�. Oto ona.
        B_GiveInvItems (other, self, ItMiNugget, 750);
		AI_EquipBestArmor	(hero); 
		Jens_SellArmor_OneTime = TRUE;
		
		Npc_RemoveInvItems	(self, ItMiNugget,750);
    }
    else
    {
        AI_Output (self, other ,"DIA_Jens_ArmorLeather_03_03"); //Nie masz tyle rudy!
    };
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Jens_HELLO2 (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 2;
   condition    = DIA_Jens_HELLO2_Condition;
   information  = DIA_Jens_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o swojej pracy.";
};

FUNC INT DIA_Jens_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Jens_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Jens_HELLO2_15_01"); //Opowiedz mi o swojej pracy.
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_02"); //No c�, zanim zaczniesz prac� ze sk�r�, powiniene� j� wygarbowa�.
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_03"); //Dobry rymarz potrafi rozpozna�, czy sk�ra jest ju� odpowiednia.
    AI_Output (other, self ,"DIA_Jens_HELLO2_15_04"); //Co wyrabiasz ze sk�r?
    AI_Output (self, other ,"DIA_Jens_HELLO2_03_05"); //Zazwyczaj ubrania, pancerze i inne tego typu przedmioty.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia� -
// Zadanie od Keretha (�mier� Rayana)
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> YourSwordPieces
//========================================

INSTANCE DIA_Jens_YourSwordPieces (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_YourSwordPieces_Condition;
   information  = DIA_Jens_YourSwordPieces_Info;
   permanent	= FALSE;
   description	= "Znalaz�em fragmenty twojego miecza.";
};

FUNC INT DIA_Jens_YourSwordPieces_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bandyta_ItsJens)) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Jens_YourSwordPieces_Info()
{
    AI_Output (other, self ,"DIA_Jens_YourSwordPieces_15_01"); //Znalaz�em fragmenty twojego miecza. By�y w pobli�u grobu brata Keretha. Kto� regularnie go rozkopuje. Wiesz co to znaczy?
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_02"); //�e co?! Niby po co mia�by rozkopywa� gr�b? Dobre sobie. Poka� mi te kawa�ki.
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_03"); //Faktycznie kupi�em tak� bro� u Puna, jednak zosta�a mi skradziona w przededniu �mierci Rayana. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_04"); //Kereth pr�buje pos�dzi� mnie o zab�jstwo. Wie, �e je�li nie przedstawi� jakich� dowod�w na swoj� obron� to Bandyci mnie zabij�.
    AI_Output (other, self ,"DIA_Jens_YourSwordPieces_15_05"); //Zabij�?
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_06"); //Takie tu panuj� zasady. �mier� za �mier�. Gdyby mordowanie by�o bezkarne, Quentin nigdy nie zapanowa�by nad t� zgraj�. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_03_07"); //Musisz mi pom�c. Inaczej zostan� pos�dzony o co� czego nie zrobi�em. 
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
    Info_AddChoice		(DIA_Jens_YourSwordPieces, "Nie wierz� ci.", DIA_Jens_YourSwordPieces_Nope);
	Info_AddChoice		(DIA_Jens_YourSwordPieces, "Jak oczy�ci� ci� z zarzut�w?", DIA_Jens_YourSwordPieces_Help);
	
	B_LogEntry               (CH1_DestroyedGrave,"Jens twierdzi, �e miecz mu skradziono w przededniu �mierci Rayana. Bandyta uwa�a, �e Kereth chce si� go pozby� z Obozu. Musz� podj�� decyzj� czy warto zaufa� Jensowi.");
};

FUNC VOID DIA_Jens_YourSwordPieces_Help ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Help_15_01"); //Jak oczy�ci� ci� z zarzut�w?
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_02"); //Musisz zbada� okoliczno�ci �mierci Rayana. Z tego co mi wiadomo znaleziono go przed Obozem. 
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_03"); //Mniej wi�cej w tym miejscu, w kt�rym wykopano mu gr�b. Zapytaj Doyle'a czy czego� nie widzia�.
	AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Help_03_04"); //Mo�e dostaniesz jak�� wskaz�wk�. Najlepiej nie m�w nic Kerethowi, bo ta pod�a gnida pewnie zacznie utrudnia� �ledztwo. 
	
	B_LogEntry               (CH1_DestroyedGrave,"Postanowi�em sprawdzi� co na temat oskar�e� ma do powiedzenia Jens. Za�o�y�em, �e mo�e by� niewinny. Dowiedzia�em si�, �e do zab�jstwa Rayana dosz�o przed Obozem w okolicy miejsca w kt�rym Bandyci wykopali gr�b. Co� wi�cej mo�e wiedzie� stra�nik bramy zwany Doyle. Powinienem z nim pogada�.");
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
	
	JensIsVictimOfKereth = false;
};

FUNC VOID DIA_Jens_YourSwordPieces_Nope ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Nope_15_01"); //Nie wierz� ci.
    AI_Output (self, other ,"DIA_Jens_YourSwordPieces_Nope_03_02"); //S�uchaj, nie daj sob� manipulowa�. Jestem niewinny! Mog� to udowodni�. Musisz mi tylko w tym pom�c. 
	
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
    Info_AddChoice		(DIA_Jens_YourSwordPieces, "Nic z tego.", DIA_Jens_YourSwordPieces_Nope2);
	Info_AddChoice		(DIA_Jens_YourSwordPieces, "Jak oczy�ci� ci� z zarzut�w?", DIA_Jens_YourSwordPieces_Help);	
};

FUNC VOID DIA_Jens_YourSwordPieces_Nope2 ()
{
	AI_Output (other, self ,"DIA_Jens_YourSwordPieces_Nope2_15_01"); //Nic z tego.
	
	B_LogEntry               (CH1_DestroyedGrave,"Jens uparcie twierdzi�, �e jest niewinny. Stwierdzi�em, �e to paplanina, gdy� dowody s� wiarygodne.");
	JensIsVictimOfKereth = true;
	Info_ClearChoices	(DIA_Jens_YourSwordPieces);
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> DoyleAboutJens
//========================================

INSTANCE DIA_Jens_DoyleAboutJens (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_DoyleAboutJens_Condition;
   information  = DIA_Jens_DoyleAboutJens_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Doylem. ";
};

FUNC INT DIA_Jens_DoyleAboutJens_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_RayansDie))
    && (JensIsVictimOfKereth == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_DoyleAboutJens_Info()
{
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_01"); //Rozmawia�em z Doylem. 
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_02"); //I co ci powiedzia�?
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_03"); //Faktycznie po�wiadczy�, �e nie wychodzi�e� tego dnia z Obozu. 
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_04"); //Mia�em wtedy du�o pracy nad pewnym sk�rzanym pancerzem. Poza tym Briam chcia�, �ebym mu na szybko uszy� nowy fartuch, bo poplami� zbroj�.
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_05"); //Czy ten dow�d wystarczy?
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_06"); //Chcia�bym �eby� porozmawia� jeszcze ze Smithem. Gdy skradziono mi miecz, by�em u niego i prosi�em go o pomoc w poszukiwaniach.
    AI_Output (self, other ,"DIA_Jens_DoyleAboutJens_03_07"); //Jego zeznanie b�dzie �wiadczy�o w mojej obronie.
    AI_Output (other, self ,"DIA_Jens_DoyleAboutJens_15_08"); //Zaraz z nim pogadam. 
    B_LogEntry                     (CH1_DestroyedGrave,"Jens chce, abym pogada� ze Smithem, kt�rego zeznania mog� okaza� si� pomocne. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TalkWithSmith
//========================================

INSTANCE DIA_Jens_TalkWithSmith (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_TalkWithSmith_Condition;
   information  = DIA_Jens_TalkWithSmith_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jens_TalkWithSmith_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Smith_FindSwordAlibi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_TalkWithSmith_Info()
{
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_01"); //I co powiedzia� Smith?
    AI_Output (other, self ,"DIA_Jens_TalkWithSmith_15_02"); //�e w razie czego powie jak by�o. Nie przepada za Kerethem. 
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_03"); //Ca�e szcz�cie. Obawia�em si�, �e tamten dra� ju� go przekupi�. 
    AI_Output (other, self ,"DIA_Jens_TalkWithSmith_15_04"); //Z kim� jeszcze mam porozmawia�? 
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_05"); //Potrzebujemy jeszcze jakiego� dowodu przeciwko Kerethowi. Co� co zdemaskuje jego intryg�. Mo�e kto� co� wie?
    AI_Output (self, other ,"DIA_Jens_TalkWithSmith_03_06"); //Pogadaj z lud�mi w Obozie. 
    B_LogEntry                     (CH1_DestroyedGrave,"Jens szuka jeszcze jakiego� dowodu przeciwko Kerethowi. Nie da� mi jednak dok�adanych wskaz�wek. Najlepiej b�dzie po prostu ci�gn�� wszystkich za j�zyk. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BriamsEvidence
//========================================

INSTANCE DIA_Jens_BriamsEvidence (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_BriamsEvidence_Condition;
   information  = DIA_Jens_BriamsEvidence_Info;
   permanent	= FALSE;
   description	= "Briam powiedzia� mi co� ciekawego.";
};

FUNC INT DIA_Jens_BriamsEvidence_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Briam_RAYAN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_BriamsEvidence_Info()
{
    AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_01"); //Briam powiedzia� mi co� ciekawego.
    AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_02"); //Mianowicie?
    AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_03"); //Widzia� jak Kereth wraca sk�d� p�n� noc�, a p�niej chowa tw�j miecz do swojej skrzyni. 
    AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_04"); //Dobra robota. Wykorzystam to przeciwko Kerethowi. Quentin powinien mi ju� uwierzy�. 
	AI_Output (other, self ,"DIA_Jens_BriamsEvidence_15_05"); //Czyli moja robota sko�czona? Poradzisz sobie dalej sam?
	
	if (Jens_SellArmor_OneTime == FALSE)
	{
	AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_06"); //Tak, naprawd� bardzo mi pomog�e�. Jestem twoim d�u�nikiem. We� w nagrod� ten pancerz. Mo�esz go sprzeda�, je�li ci si� nie przyda. 
	CreateInvItem		(self, NON_LEATHER_ARMOR_L);
	B_GiveInvItems      (self, hero, NON_LEATHER_ARMOR_L, 1);
	}
	else
	{
	AI_Output (self, other ,"DIA_Jens_BriamsEvidence_03_07"); //Tak, jestem twoim d�u�nikiem. We� te sk�ry w nagrod�.
	CreateInvItems		(self, ItAt_Wolf_02,5);
	B_GiveInvItems      (self, hero, ItAt_Wolf_02, 5);
	};
	
    B_LogEntry             		(CH1_DestroyedGrave,"Zeznania Briama oka�� si� kluczowe dla rozwi�zania ca�ej sprawy. Jens by� mi bardzo wdzi�czny za pomoc. Szkoda tylko, �e dalej nie mam pewno�ci co do tego jak zgin�� Rayan.");
	
	
	B_GiveXP (275);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia� 2
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia� 4
// Zadania poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Idziesz
//========================================

INSTANCE DIA_Jens_Idziesz (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_Idziesz_Condition;
   information  = DIA_Jens_Idziesz_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn� do kopalni?";
};

FUNC INT DIA_Jens_Idziesz_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_Idziesz_Info()
{
    AI_Output (other, self ,"DIA_Jens_Idziesz_15_01"); //Idziesz ze mn� do kopalni?
    AI_Output (self, other ,"DIA_Jens_Idziesz_03_02"); //Niestety, mam du�o pracy.
    if (Npc_IsDead(BAN_1602_Emanuel))
    {
        AI_Output (self, other ,"DIA_Jens_Idziesz_03_03"); //Musz� gotowa� za Emanuela i zaj�� si� naszym ekwipunkiem.
        AI_Output (other, self ,"DIA_Jens_Idziesz_15_04"); //Rozumiem.
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HeavyArmor
//========================================

INSTANCE DIA_Jens_HeavyArmor (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_HeavyArmor_Condition;
   information  = DIA_Jens_HeavyArmor_Info;
   permanent	= FALSE;
   description	= "Mam od ciebie dosta� ci�ki pancerz.";
};

FUNC INT DIA_Jens_HeavyArmor_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jens_HeavyArmor_Info()
{
    AI_Output (other, self ,"DIA_Jens_HeavyArmor_15_01"); //Mam od ciebie dosta� ci�ki pancerz.
    AI_Output (self, other ,"DIA_Jens_HeavyArmor_03_02"); //Nie mog� ci go odda� za darmo. W�o�y�em w niego du�o pracy.
	AI_Output (other, self ,"DIA_Jens_HeavyArmor_15_03"); //Ile?
    AI_Output (self, other ,"DIA_Jens_HeavyArmor_03_04"); //Trzy tysi�ce bry�ek rudy.
	B_LogEntry     (CH4_NewDanger,"Pancerz od Jesna b�dzie mnie kosztowa� 3000 bry�ek rudy.");
};

//========================================
//-----------------> BuyHeavyArmor
//========================================

INSTANCE DIA_Jens_BuyHeavyArmor (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_BuyHeavyArmor_Condition;
   information  = DIA_Jens_BuyHeavyArmor_Info;
   permanent	= 1;
   description	= "Daj mi ten pancerz. (3000 bry�ek rudy)";
};

FUNC INT DIA_Jens_BuyHeavyArmor_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_HeavyArmor))
    {
        var int AFIP_ShowItem; AFIP_ShowItem = BAU_ARMOR_H;
        return TRUE;
    };
};


FUNC VOID DIA_Jens_BuyHeavyArmor_Info()
{
    AI_Output (other, self ,"DIA_Jens_BuyHeavyArmor_15_01"); //Daj mi ten pancerz.
	if (Npc_HasItems (hero,itminugget)>= 3000)
	{
    AI_Output (self, other ,"DIA_Jens_BuyHeavyArmor_03_02"); //Niech ci s�u�y.
	//log
	B_LogEntry     (CH4_NewDanger,"Kupi�em od Jensa ci�k� zbroj� Bandyty.");
	//pay
	B_GiveInvItems (hero,self,itminugget,3000);
	//armor
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,BAU_ARMOR_H);
	AI_EquipBestArmor	(other); 
	//dialog
	DIA_Jens_BuyHeavyArmor.permanent = 0;
	}
	else
	{
    AI_Output (self, other ,"DIA_Jens_BuyHeavyArmor_03_03"); //Przygotuj wi�cej rudy!
	//dialog
	DIA_Jens_BuyHeavyArmor.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Jens
// Rozdzia� -
// Dialog og�lny - ambient
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Jens_SYTUACJA (C_INFO)
{
   npc          = BAN_1604_Jens;
   nr           = 1;
   condition    = DIA_Jens_SYTUACJA_Condition;
   information  = DIA_Jens_SYTUACJA_Info;
   permanent	= true;
   description	= "Jak tam?";
};

FUNC INT DIA_Jens_SYTUACJA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Jens_SYTUACJA_Info()
{
AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_01"); //Jak tam?
  if (hero.guild == GIL_BAU)
    {
    
    if (kapitel == 1)
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_02"); //Nie jest �le. Mam tu wprawdzie troch� roboty ze sk�rami, ale nie narzekam.
    }
    else if (kapitel == 3)
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_03"); //Rytua� przywo�ania ju� si� odby�? To doprawdy imponuj�ce. Nigdy nie wierzy�em zbytnio w magi� i te zabobony.
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_04"); //Mam gdzie� bog�w! Gdyby naprawd� pragn�li szcz�cia ludzi, �y�oby nam si� inaczej. 
        AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_05"); //Ca�kowicie odrzucasz ich istnienie?
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_06"); //Nie, ale ignoruj� ich. Nie wierz� w przeznaczenie. �wi�ta wojna! Te� mi co�. A wszystkiemu winni s� magowie.
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_07"); //Posiadaj� pot�n� moc. Mogliby obr�ci� j� przeciw bogom. Wygna� ich z tego �wiata. Pozby� si� raz na zawsze albo uwi�zi�. 
        AI_Output (other, self ,"DIA_Jens_SYTUACJA_15_08"); //Chyba przesadzasz. 
    }
    else if (Npc_KnowsInfo (hero, DIA_Jens_DobraRobota))
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_09"); //Dobrze. Ciesz� si� z naszego wsp�lnego interesu. Przynosi nam coraz wi�ksze korzy�ci.
    }
    else if (Npc_KnowsInfo (hero, DIA_Quentin_DraxInfos))
    {
        AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_10"); //No nie�le si� porobi�o. Drax chce sam zaatakowa� Ob�z? Nie podoba mi si� to.
    }
else if (Npc_KnowsInfo (hero, DIA_Quentin_findFriends))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_13"); //Nasze ostatnie przygody nap�dzi�y mi niez�ego stracha. 
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_14"); //Najpierw prowadzimy ma�� grup� akcje bojowe przeciw pot�dze Gomeza, potem zajmuj� nasz Ob�z.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_15"); //Musimy by� bardziej ostro�ni. Najgorsze jest to, �e wyda�a si� pozycja naszego Obozu. 
}
else if (Npc_KnowsInfo (hero, DIA_Quentin_FoundDrax))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_16"); //Dowiedzia�em si�, �e Drax nie �yje. To naprawd� okropne. Nie do��, �e mogli�my straci� wielu ludzi, to jeszcze samob�jcza �mier�.
}
else if (Npc_KnowsInfo (hero, DIA_Quentin_Successasd))
{
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_17"); //Opuszczona Kopalnia w naszych r�kach. Kto by pomy�la�. Bandyci maj� w�asn� kopalni�. Ha! Stali�my si� pot�g�.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_18"); //Czekaj tylko, a� Bariera upadnie. Zbierzemy wszystko, sprzedamy w Khorinis i wejdziemy na pok�ad pierwszej lepszej �odzi.
    AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_19"); //My�l�, �e Nordmar by�by dla mnie idealnym miejscem. Cisza g�r... To musi by� wspania�e miejsce. 
};
}
else 
{
		AI_Output (self, other ,"DIA_Jens_SYTUACJA_03_20"); //Nie gadam z takimi jak ty! Zje�d�aj.
};
};

instance dia_jens_pickpocket(c_info) {
    npc = ban_1604_jens;
    nr = 900;
    condition = dia_jens_pickpocket_condition;
    information = dia_jens_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jens_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_jens_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jens_pickpocket);
	info_addchoice(dia_jens_pickpocket, dialog_back, dia_jens_pickpocket_back);
	info_addchoice(dia_jens_pickpocket, dialog_pickpocket, dia_jens_pickpocket_doit);
};

func void dia_jens_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_jens_pickpocket);
};

func void dia_jens_pickpocket_back() {
    info_clearchoices(dia_jens_pickpocket);
};