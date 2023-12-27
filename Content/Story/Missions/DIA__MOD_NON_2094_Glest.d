//poprawione i sprawdzone - Reflide

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Glest_EXIT(C_INFO)
{
	npc             = NON_2094_Glest;
	nr              = 999;
	condition	    = DIA_Glest_EXIT_Condition;
	information	    = DIA_Glest_EXIT_Info;
	permanent	    = TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Glest_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Glest_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//dialog nie jest wykorzystywany, poniewa� Glest nie jest ju� spawnowany w Old_camp
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Glest_HELLO1 (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_HELLO1_Condition;
   information  = DIA_Glest_HELLO1_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Glest_HELLO1_Condition()
{
    if (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Glest_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Glest_HELLO1_03_02"); //Nie najgorzej. Kilka dni temu wr�ci�em z kopalni. Mog� sobie teraz troch� odpocz��.  
};


//========================================
//-----------------> First
//========================================

INSTANCE DIA_Glest_First (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_First_Condition;
   information  = DIA_Glest_First_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Glest_First_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_First_Info()
{
    AI_Output (self, other ,"DIA_Glest_First_03_01"); //Co ty tu robisz? Nie wygl�dasz mi na jednego z ludzi Gomeza.
	AI_Output (other, self ,"DIA_Glest_First_15_02"); //Bo nim nie jestem.
    AI_Output (self, other ,"DIA_Glest_First_03_03"); //W takim razie uciekaj st�d, p�ki mo�esz si� rusza�!
    AI_Output (other, self ,"DIA_Glest_First_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Glest_First_03_05"); //To miejsce jest przekl�te. Kr�ci si� tu pe�no tych przekl�tych o�ywie�c�w. Wybili nasz ekspedycj� do nogi!
    AI_Output (self, other ,"DIA_Glest_First_03_06"); //Kilku stra�nik�w na marne pr�buje z nimi walczy�. Na razie zdobyli�my most, ale zosta�a nam ju� tylko garstka ludzi. 
    AI_Output (other, self ,"DIA_Glest_First_15_07"); //Akurat �ycie Stra�nik�w nie bardzo mnie martwi...
    AI_Output (self, other ,"DIA_Glest_First_03_08"); //To nie jest teraz istotne. Teoretycznie jeste�my wrogami, a jednak nie zabi�e� mnie. 
    AI_Output (other, self ,"DIA_Glest_First_15_09"); //By� mo�e masz informacje, kt�re mog� mi si� przyda�. Co ci si� tak w og�le sta�o? Uciek�e� z wn�trza kopalni?
    AI_Output (self, other ,"DIA_Glest_First_03_10"); //Tak, ale solidnie oberwa�em. 
    AI_Output (self, other ,"DIA_Glest_First_03_11"); //M�wi� ci: nie id� dalej pod �adnym pozorem! Czai si� tam wy��cznie �mier�. 
    AI_Output (other, self ,"DIA_Glest_First_15_12"); //Mam tam kilka spraw do za�atwienia. Wiesz mo�e sk�d si� bior� o�ywie�cy? 
	AI_Output (self, other ,"DIA_Glest_First_03_13"); //Wewn�trz kopalni jest olbrzymia sala. Widzia�em tam jakiego� maga w czarnych szatach. W r�ku dzier�y� pi�kny kamie�. 
	AI_Output (self, other ,"DIA_Glest_First_03_14"); //Wydaje mi si�, �e to dzi�ki niemu udaje mu si� przyzywa� tyle nieumar�ych. 
	AI_Output (other, self ,"DIA_Glest_First_15_15"); //B�d� si� musia� z nim rozprawi�. Postaraj si� dotrze� do kogo�, kto b�dzie ci w stanie pom�c. 
	AI_Output (self, other ,"DIA_Glest_First_03_16"); //Dzi�kuj�, nie b�d� ci ju� wchodzi� w drog�. 
 
	//exp
    B_GiveXP (500);
	
	//spawn zombie 2x
	Wld_InsertNpc		(Zombie,"CAMP02"); 
	Wld_InsertNpc		(Zombie,"OW_PATH_1_16"); 
	
	//zadanie - wpis dla bandyty
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	B_LogEntry                     (CH4_BanditsInAbadonedMine,"Zaraz po zej�ciu na d� spotka�em rannego Kopacza. Dowiedzia�em si�, �e Stra�nicy kt�rych wys�a� Gomez zostali niemal�e wybici przez hordy o�ywie�c�w wype�zaj�cych spod ziemi. Kopacz twierdzi i� widzia� jakiego� nekromant� dzier��cego pot�ny artefakt, dzi�ki kt�remu mo�e on przywo�ywa� nieumar�ych. Je�li to prawda, b�d� si� musia� z nim zmierzy�.");
	}
	else 
	{
	B_LogEntry                     (CH4_SupportForQuentin,"Zaraz po zej�ciu na d� spotka�em rannego Kopacza. Dowiedzia�em si�, �e Stra�nicy kt�rych wys�a� Gomez zostali niemal�e wybici przez hordy o�ywie�c�w wype�zaj�cych spod ziemi. Kopacz twierdzi i� widzia� jakiego� nekromant� dzier��cego pot�ny artefakt, dzi�ki kt�remu mo�e on przywo�ywa� nieumar�ych. Je�li to prawda, b�d� si� musia� z nim zmierzy�.");
	};
	
	};

//----------------------------------------------------------------------------1.6.1----------------------------------------------------
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GlestOW_EXIT(C_INFO)
{
	npc             = NON_40139_Glest;
	nr              = 999;
	condition	= DIA_GlestOW_EXIT_Condition;
	information	= DIA_GlestOW_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_GlestOW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GlestOW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zjawa
//========================================

INSTANCE DIA_Glest_Zjawa (C_INFO)
{
   npc          = NON_40139_Glest;
   nr           = 1;
   condition    = DIA_Glest_Zjawa_Condition;
   information  = DIA_Glest_Zjawa_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Glest_Zjawa_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_STT)
{
    return TRUE;
};
};
FUNC VOID DIA_Glest_Zjawa_Info()
{
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_01"); //Hej Cieniu! Powinni�my zamieni� kilka s��w.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_02"); //Dobrze. O co chodzi?
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_03"); //Mam nadzieje, �e podejdziesz do sprawy powa�nie. W przeciwie�stwie do Stra�nik�w, kt�rzy uwa�aj� to za zwyk�e zabobony Kopaczy...
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_04"); //W pobli�u obozu grasuje dziwna zjawa.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_05"); //Co takiego?
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_06"); //Kopacze maj� tego dosy�, widz� dziwn� lataj�c� istot� w okolicach obozu gdy nadchodzi zmierzch.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_07"); //Brzmi jeszcze dziwniej ni� si� spodziewa�em.
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_08"); //Ale to fakt. Cho� sam jej nie widzia�em to wierz� w takie rzeczy.
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_09"); //Kopacze obiecali si� zrzuci� na nagrod� dla �mia�ka, kt�ry przegoni z�ego ducha.
};

//========================================
//-----------------> Zjawa_2
//========================================

INSTANCE DIA_Glest_Zjawa_2 (C_INFO)
{
   npc          = NON_40139_Glest;
   nr           = 2;
   condition    = DIA_Glest_Zjawa_2_Condition;
   information  = DIA_Glest_Zjawa_2_Info;
   permanent	= FALSE;
   description	= "W ostateczno�ci mog� si� tym zaj��. Mo�e to zwyk�e zabobony.";
};

FUNC INT DIA_Glest_Zjawa_2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Glest_Zjawa))
{
    return TRUE;
};
};
FUNC VOID DIA_Glest_Zjawa_2_Info()
{
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_01"); //W ostateczno�ci mog� si� tym zaj��. Mo�e to zwyk�e zabobony.
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_02"); //Przekonasz si�, �e nie...
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_03"); //Z kim powinienem pom�wi�?
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_04"); //Radzi�bym pom�wi� z Gravo to stary i m�dry cz�owiek.
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_05"); //Porozmawiam z nim.
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_06"); //Oby� spe�ni� oczekiwania.
	Log_CreateTopic		(Zjawa,	LOG_MISSION);
	Log_SetTopicStatus	(Zjawa,	LOG_RUNNING);
	B_LogEntry               (Zjawa,"Kopacz Glest powiedzia� mi, �e kopacze uskar�aj� si� na nocne widzenia jakiego� widma. Stra�nicy twierdz�, �e to zwyk�a bujda (sam mam r�wnie� podobne skojarzenia). Ale zaszkodzi sprawdzi� co si� za tym kryje, zw�aszcza je�eli dostan� za t� jak�� rud�. Powinienem pom�wi� z Gravo. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Z_END
//========================================

INSTANCE DIA_Glest_Z_END (C_INFO)
{
   npc          = NON_40139_Glest;
   nr           = 1;
   condition    = DIA_Glest_Z_END_Condition;
   information  = DIA_Glest_Z_END_Info;
   permanent	= FALSE;
   description	= "Pokona�em wasz� zjaw�.";
};

FUNC INT DIA_Glest_Z_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Grim_Z_KILL)) && (Npc_IsDead (SkeletonMage_Glest))
{
    return TRUE;
};
};
FUNC VOID DIA_Glest_Z_END_Info()
{
    AI_Output (other, self ,"DIA_Glest_Z_END_15_01"); //Pokona�em wasz� zjaw�.
    AI_Output (self, other ,"DIA_Glest_Z_END_03_02"); //Tak? Na pewno?
    AI_Output (other, self ,"DIA_Glest_Z_END_15_03"); //Mam Grima za �wiadka.
    AI_Output (self, other ,"DIA_Glest_Z_END_03_04"); //To �wietne wie�ci. Jeste�my twoimi d�u�nikami.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_05"); //No w�a�nie...
    CreateInvItems (self, ItMiNugget, 115);
    B_GiveInvItems (self, other, ItMiNugget, 115);
    AI_Output (self, other ,"DIA_Glest_Z_END_03_06"); //Zebra�em t� rud� od kopaczy. We� j� w podzi�ce za okazany wysi�ek.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_07"); //Dzi�kuje. Zatem op�aca�o si� miesza� w t� ca�� spraw� z widziad�em. 
    AI_Output (self, other ,"DIA_Glest_Z_END_03_08"); //Bywaj ch�opcze i jeszcze raz dzi�ki za okazan� pomoc.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_09"); //W porz�dku. Na razie.
	B_LogEntry               (Zjawa,"Poinformowa�em Glesta o pokonaniu ich zjawy. Kopacz by� szczerze uradowany i wyp�aci� mi nale�n� rud� na, kt�r� zrzucili si� przestraszeni Kopacze.");
	Log_SetTopicStatus	(Zjawa,	LOG_SUCCESS);
	B_GiveXP(250);
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> HI_Glest
//========================================

INSTANCE DIA_Glest_HI_Glest (C_INFO)
{
   npc          = NON_40139_Glest;
   nr           = 1;
   condition    = DIA_Glest_HI_Glest_Condition;
   information  = DIA_Glest_HI_Glest_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Glest_HI_Glest_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Glest_HI_Glest_Info()
{
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_02"); //�miertelna nuda. Gorsza jest chyba tylko �mier�.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_03"); //Nie masz �adnego pola do rozwoju?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_04"); //Nie porywam si� z motyk� na s�o�ce. Znam swoje miejsce w szeregu. P�ki si� nie wychylam to ta cholerna Kolonia mo�e nie po�re mnie i wydali.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_05"); //Czyli nie chcesz polepszy� swojego bytu bo boisz si� zmian na gorsze?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_06"); //�ycie jest przewrotne. Powiedzia�oby ci to wielu tych po, kt�rych cz�sto chodzimy bo poch�on�a ich gleba.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_07"); //Nie wracasz pracowa� do kopalni?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_08"); //Dzi�ki Bogom nie. P�ki co mam spok�j bo do codziennego g�wnianego �ywota musia�bym do�o�y� pe�zacze.
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_09"); //Te cholerne, mordercze podziemne stwory.
};

