//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Quentin_EXIT(C_INFO)
{
	npc             = BAN_1610_Quentin;
	nr              = 999;
	condition	= DIA_Quentin_EXIT_Condition;
	information	= DIA_Quentin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Quentin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Quentin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Dialogi poboczne
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WLADZA
//========================================

INSTANCE DIA_Quentin_WLADZA (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_WLADZA_Condition;
   information  = DIA_Quentin_WLADZA_Info;
   permanent	= FALSE;
   description	= "Ty tu rz�dzisz?";
};

FUNC INT DIA_Quentin_WLADZA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Quentin_WLADZA_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_01"); //Ty tu rz�dzisz?
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_02"); //Wchodzisz tak po prostu do mojego Obozu i pytasz mnie czy tu rz�dz�, tak?
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_03"); //Jakby nie patrze�... to tak. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_04"); //Powiedzia�bym, �e jeste� cholernie bezczelny...
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_05"); //...albo odwa�ny.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_06"); //Nie... bezczelny. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_07"); //Powiem ci tylko, �e nazywam si� Quentin i dowodz� w tym Obozie.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_08"); //Tyle informacji powinno ci wystarczy�.
};

var int log_Quenfight;
//========================================
//-----------------> KnowsNauka
//========================================

INSTANCE DIA_Quentin_KnowsNauka (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 777;
   condition    = DIA_Quentin_KnowsNauka_Condition;
   information  = DIA_Quentin_KnowsNauka_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Quentin_KnowsNauka_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Quentin_KnowsNauka_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KnowsNauka_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Quentin_KnowsNauka_03_02"); //Mog� ci� nauczy� walki broni� jednor�czn�. Oczywi�cie nie za darmo. No i musisz te� nale�e� do Bandy.

	if (log_Quenfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Gdy zostan� Bandyt�, Quentin za kilka bry�ek rudy nauczy mnie walki jednor�cznym or�em.");
		log_Quenfight = TRUE;
	};
	};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> DRAX
//========================================

INSTANCE DIA_Quentin_DOOBOZU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_DRAX_Condition;
   information  = DIA_Quentin_DRAX_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Drax.";
};

FUNC INT DIA_Quentin_DRAX_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_HasItems (other, itmi_joshpocket) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DRAX_Info()
{
    AI_Output (other, self ,"DIA_Quentin_DRAX_15_01"); //Przysy�a mnie Drax. Uzna� mnie za Bandyt� i pokaza� drog� do Obozu. Udowodni�em swoj� lojalno�� wykonuj�c dla niego zadania.
    AI_Output (self, other ,"DIA_Quentin_DRAX_03_02"); //Co? Drax przyj�� kogo� nowego bez mojej wiedzy?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_03"); //Powiedzia�, �e zas�uguj� na wasze zaufanie. Kaza� mi si� zg�osi� po rynsztunek. Jestem gotowy do pracy.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_04"); //Nie m�g� mnie tu przyprowadzi� od razu. W ko�cu wasz Ob�z jest ukryty. 
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_05"); //Kaza� ci co� przekaza�?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_06"); //C�, wydarzy�o si� kilka interesuj�cych rzeczy...
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_07"); //M�w, wszystko mo�e mie� znaczenie.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_08"); //Stra�nikom prawie uda�o si� ustali� miejsce po�o�enia waszego Obozu. Niejaki Trip sporz�dzi� notatk� na ten temat. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_09"); //Na jej podstawie Kopacz Graham rozrysowa� potencjaln� map�, kt�ra trafi�a w r�ce Stra�nik�w z placu wymian. Chcieli j� wykorzysta� do planowania obrony.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_10"); //Zdoby�em obydwa te dokumenty. S� teraz w r�kach Draxa. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_11"); //Jeden z waszych ludzi, niejaki Skaza mia� powa�ne problemy w Starym Obozie. Tamtejsi Cienie chcieli go wygry��. Dzi�ki mojej drobnej pomocy stali si� nieszkodliwi. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_12"); //W zamian otrzyma�em od Skazy raport. Stra�nicy �wi�tynni pomagaj� ludziom Gomeza zabija� pe�zacze w Starej Kopalni. Szukaja tam czego� zwi�zanego z ich chor� religi�.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_13"); //Josh nie �yje. Ian dowiedzia� si� o jego machlojkach i kaza� go zabi�. Zanim go pojmali uda�o mi si� odnale�� rud�, kt�r� zdoby� do tej pory. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_14"); //Jest tego 450 bry�ek rudy. By�o wi�cej, ale pewien Kopacz wszed� w posiadanie tej sakwy i wykorzysta� cz�� rudy. Go�� ju� gryzie piach. Oto sakiewka.
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_15"); //Do��, wystarczy... Jestem pod olbrzymim wra�eniem. Drax podj�� dobr� decyzj�. Daj mi chwil� pomy�le�. Musimy podj�� odpowiednie dzia�ania.
	
	
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Uda�o mi dosta� si� do Quentina. Zanim zostan� przyj�ty, musz� wykona� kilka zada� i przy okazji poprawi� swoj� opini� w Obozie.");
};

//========================================
//-----------------> JensIsKiller
//========================================

INSTANCE DIA_Quentin_JensIsKiller (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 10;
   condition    = DIA_Quentin_JensIsKiller_Condition;
   information  = DIA_Quentin_JensIsKiller_Info;
   permanent	= TRUE;
   description	= "Jens jest zab�jc�.";
};

FUNC INT DIA_Quentin_JensIsKiller_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bandyta_TalkWithJens)) && (JensIsVictimOfKereth)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_JensIsKiller_Info()
{
    AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_01"); //Jens jest zab�jc�.
    AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_02"); //O czym ty do cholery m�wisz?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_03"); //Pomog�em ustali� Kerethowi kto zabi� jego brata. Okaza�o si�, �e to Jens.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_04"); //Sk�adasz do�� powa�ne oskar�enia. Musisz mie� wi�c twarde dowody. Hmm?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_05"); //Na miejscu zbrodni i w pobli�u regularnie niszczonego grobu znalaz�em od�amki miecza, kt�ry Pun sprzeda� kiedy� Jensowi.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_06"); //Ostrze pokruszy�o si�, gdy Jens niszczy� gr�b. Zrobi� to, bo ma na pie�ku z Kerethem...
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_07"); //Tak si� sk�ada, �e przed chwil� rozmawia�em z Jensem. Przedstawi� mi sw�j punkt widzenia.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_08"); //Pewnie powiedzia� ci, �e kto� mu ukrad� miecz. Zgad�em? 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_09"); //Dok�adnie to powiedzia�.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_10"); //Wierzysz w to?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_11"); //A niby dlaczego mia�bym nie wierzy�? Kereth to niez�y kr�tacz i wszyscy w Obozie dobrze o tym wiedz�.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_12"); //My�l�, �e tym razem Kereth ma racj�.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_13"); //I niestety si� mylisz... Jens przedstawi� kilka innych dowod�w. Mianowicie, zar�wno Doyle jak i jego zmiennik po�wiadczyli, �e Jens nie opuszcza� obozu w dniach, w kt�rych dokonano zbezczeszczenia grobu. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_14"); //Po drugie, Smith stwierdzi�, �e w przeddzie� zab�jstwa by� u niego Jens i prosi� o pomoc w odszukaniu miecza. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_15"); //Po trzecie, Briam widzia� jak Kereth chowa miecz Jensa do swojej skrzyni uprzednio oczyszczaj�c go z ziemi. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_16"); //To by�a zwyczajna intryga, ch�opcze. Po prostu da�e� si� oszuka�. Jeste� m�ody, wi�c pewnie nie pierwszy i nie ostatni raz. 
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_17"); //W takim razie kto zabi� Rayana?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_18"); //Nie mam poj�cia. Pewnie nigdy si� tego nie dowiemy. 
	
	MIS_DestroyedGrave = LOG_FAILED;

    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_FAILED);
    B_LogEntry               (CH1_DestroyedGrave,"Okaza�o si�, �e zosta�em oszukany przez Keretha. Jens by� niewinny i Quentin przedstawi� mi na to dowody. Kereth porpostu chcia� si� pozby� Jensa z obozu i najpewniej zaj�� jego stanowisko. Chyba policz� si� z tym oszustem.");
};



 var int Quentin_KnowKerethMurder_Day;
   
   // && (Calash_EasyJoinNC_Day != Wld_GetDay())
//========================================
//-----------------> WhatIsKereth
//========================================

INSTANCE DIA_Quentin_WhatIsKereth (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_WhatIsKereth_Condition;
   information  = DIA_Quentin_WhatIsKereth_Info;
   permanent	= FALSE;
   description	= "Co b�dzie z Kerethem?";
};

FUNC INT DIA_Quentin_WhatIsKereth_Condition()
{
 if (Npc_KnowsInfo (hero, DIA_Jens_BriamsEvidence))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_WhatIsKereth_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_01"); //Co b�dzie z Kerethem?
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_02"); //Badam t� spraw�. P�ki co pewne jest, �e chcia� wrobi� Jensa w zab�jstwo by go wykurzy�. 
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_03"); //Ale nie wiadomo jeszcze czy to on jest mordec�.
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_04"); //Co z nim b�dzie?
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_05"); //P�ki co straci wi�kszo�� swojej rudy w ramach kary.
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_06"); //Ale je�li to on jest morderc� w�wczas czeka go bezw�oczna egzekucja.
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_07"); //Twarde prawo w twardych czasach. Chyba s�usznie. 
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_08"); //Tylko tak Bandyci pozostan� zwart� grup�, kt�ra ma jak�kolwiek przysz�o��.
	 Quentin_KnowKerethMurder_Day = Wld_GetDay();
};


//========================================
//-----------------> QuenKnowKereth
//========================================

INSTANCE DIA_Quentin_QuenKnowKereth (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_QuenKnowKereth_Condition;
   information  = DIA_Quentin_QuenKnowKereth_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_QuenKnowKereth_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Quentin_WhatIsKereth))
   && (Quentin_KnowKerethMurder_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_QuenKnowKereth_Info()
{
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_01"); //Ustalili�my co sta�o za �mierci� Rayana. 
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_02"); //Jak to zrobili�cie?
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_03"); //Connor znalaz� ma�� skrzynk� zakopan� w ziemi. 
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_04"); //Po�r�d paru niezbyt cennych w rudzie przedmiot�w by�a tam kartka.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_05"); //Rayan napisa� tam, �e ma do�� Kolonii, straci� nadzieje na wolno�� i szcz�liwe �ycie.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_06"); //Dalej napisa�, �e wbije sobie sztylet.
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_07"); //Zatem Kereth nie zabi� swojego brata.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_08"); //A� takim bydlakiem nie jest. Ale postanowi� wykorzysta� t� �mier� i wrobi� Jensa.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_09"); //R�wnocze�nie ukry� tamt� skrzynk� z pami�tkami po zmar�ym bracie.
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_10"); //Teraz historia uk�ada si� w logiczn� ca�o��. Dzi�ki za informacj�.
	    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_SUCCESS);
	B_LogEntry               (CH1_DestroyedGrave,"Okaza�o si� �e Rayan pope�ni� samob�jstwo, mia� ju� dosy� kolonii. Jego brat Kereth wykorzysta� t� sytuacj� by wrobic Jensa w jego zab�jstwo. Trzeba mie� tupet...");
	B_GiveXP(200);
	Log_SetTopicStatus    	 (CH1_DestroyedGrave, LOG_SUCCESS);
    MIS_DestroyedGrave = LOG_SUCCESS;
};


//========================================
//-----------------> EQ1
//========================================

INSTANCE DIA_Quentin_EQ1 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 8;
   condition    = DIA_Quentin_EQ1_Condition;
   information  = DIA_Quentin_EQ1_Info;
   permanent	= FALSE;
   description	= "Czy dostan� bro� i pancerz?";
};

FUNC INT DIA_Quentin_EQ1_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_EQ1_Info()
{
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_01"); //Czy dostan� bro� i pancerz? 
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_02"); //Tak. Prosz�, oto one.
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_03"); //To jedyna bro� jak� ci fundujemy. Na lepszy or� b�dziesz musia� sam sobie zapracowa�. Pami�taj, �e z czasem musisz go zmienia�.
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_04"); //Dzi�ki. Na pewno nie zapomn�.
    CreateInvItems (self, ItMw_1H_Mace_03, 1);
    B_GiveInvItems (self, other, ItMw_1H_Mace_03, 1);
    CreateInvItems (self, BAU_ARMOR_L, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_L, 1);
	AI_EquipBestArmor	(hero); 
};

//========================================
//-----------------> EQ2
//========================================
var int pancerooo;
INSTANCE DIA_Quentin_EQ2 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 8;
   condition    = DIA_Quentin_EQ2_Condition;
   information  = DIA_Quentin_EQ2_Info;
   permanent	= 1;
   description	= "Potrzebuj� lepszego pancerza.";
};

FUNC INT DIA_Quentin_EQ2_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) && (pancerooo == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_EQ2_Info()
{
    AI_Output (other, self ,"DIA_Quentin_EQ2_15_01"); //Potrzebuj� lepszego pancerza.
	if (kapitel >= 3)
	{
	if (Npc_HasItems (hero, ItMiNugget)>=1800)
	{
    AI_Output (self, other ,"DIA_Quentin_EQ2_03_02"); //To dobry pancerz. Zas�u�y�e� na niego.
    B_GiveInvItems (hero, self, ItMiNugget, 1800);
    CreateInvItems (self, BAU_ARMOR_M, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_M, 1);
	AI_EquipBestArmor	(hero); 
	DIA_Quentin_EQ2.permanent = 0;
	pancerooo = true;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Quentin_EQ2_03_03"); //Taki pancerz to nie byle co. Kosztuje 1800 bry�ek rudy. 
	 DIA_Quentin_EQ2.permanent = 1;
	};
	
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_EQ2_03_04"); //Nie zas�u�y�e� jeszcze na ten pancerz.
	DIA_Quentin_EQ2.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// Zadania dla bandyty
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> QUEST4
//========================================

INSTANCE DIA_Quentin_QUEST4 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 9;
   condition    = DIA_Quentin_QUEST4_Condition;
   information  = DIA_Quentin_QUEST4_Info;
   permanent	= FALSE;
   description	= "Co mam teraz robi�?";
};

FUNC INT DIA_Quentin_QUEST4_Condition()
{
   if (Npc_GetTrueGuild(other) == GIL_BAU)  && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QUEST4_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_01"); //Co mam teraz robi�?
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_02"); //Chyba b�dziemy musieli zaj�� si� tym Bractwem. Ta sprawa jest niepokoj�ca. Ale zanim porz�dnie we�miemy si� do roboty, to popracujesz troch� tutaj.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_03"); //Powiedzia�e�, �e Stra�nicy z placu wymian chcieli wykorzysta� map� od tego Grahama do zaplanowania obrony... Dobrze, zobaczymy jak im to posz�o.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_04"); //Id� do Doyla. P�jdziecie razem na plac wymian i podenerwujecie ludzi Gomeza. Rabuj�c, przegl�daj skrzynie i zwa�aj na wszelkie dokumenty jakie w nich znajdziesz. 
	AI_Output (self, other ,"DIA_Quentin_QUEST4_03_05"); //Je�li co� znajdziesz, przynie� do mnie. Zapami�tasz?
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_06"); //Jasne.

    MIS_AttackOnPlace = LOG_RUNNING;

    Log_CreateTopic          (CH1_Rozpierdol1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol1,"Razem z Doylem mamy wybra� si� na plac wymian, �eby podenerwowa� ludzi Gomeza. Doyle'a znajd� przy bramie do Obozu Bandyt�w. Podczas rabunku mam szuka� dokument�w, kt�re mog� le�e� w skrzyniach b�d� przy Stra�nikach.");
	
	HeroANPWDoyle = true;
};

//========================================
//-----------------> UKONCZONE
//========================================

INSTANCE DIA_Quentin_UKONCZONE (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 12;
   condition    = DIA_Quentin_UKONCZONE_Condition;
   information  = DIA_Quentin_UKONCZONE_Info;
   permanent	= true;
   description	= "Byli�my z Doyle'm na placu wymian.";
};

FUNC INT DIA_Quentin_UKONCZONE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_SPADAMY)) && (MIS_AttackOnPlace == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Plac_Doc1) >=1)
	&& (Npc_HasItems (other, ItMi_Plac_Doc2) >=1)
	&& (Npc_HasItems (other, ItMi_Plac_Doc3) >=1) 
	&& (Npc_HasItems (other, ItMi_Plac_Doc4) >=1)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_UKONCZONE_Info()
{

    B_GiveInvItems (other, self,itmi_plac_doc1,1);
	B_GiveInvItems (other, self,itmi_plac_doc2,1);
	B_GiveInvItems (other, self,itmi_plac_doc3,1);
	B_GiveInvItems (other, self,itmi_plac_doc4,1);
	
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_01"); //Byli�my z Doyle'm na placu wymian.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_02"); //To �wietnie! Jak posz�o? Znalaz�e� dokumenty?

    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_03"); //Tak, we� je. Co teraz mam robi�?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_04"); //Wys�a�em ju� jednego z naszych do Bractwa jako szpiega.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_05"); //Powinien wkr�tce wr�ci�. Tymczasem mam dla ciebie jeszcze jedno zadanie.
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_06"); //Co tym razem?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_07"); //Podobno Gomez wysy�a jaki� transport do Starej Kopalni.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_08"); //My�l�, �e to dobra okazja na atak.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_09"); //Rocky zajmuje si� t� akcj�. Id� do niego i powiedz, �e kaza�em ci mu pom�c.
	
	DIA_Quentin_UKONCZONE.permanent = false;
	MIS_CH1ConvoyAttack = LOG_RUNNING;
    MIS_AttackOnPlace = LOG_SUCCESS;
	
	
	B_LogEntry               (CH1_Rozpierdol1,"Poinformowa�em Quentina o pomy�lnie przeprowadzonym ataku i odda�em mu dokumenty.");
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
  
	Log_CreateTopic          (CH1_ConvoyAttack, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ConvoyAttack, LOG_RUNNING);
    B_LogEntry               (CH1_ConvoyAttack,"Tym razem musz� i�� do Rockiego z kt�rym mam zaatakowa� konw�j ze Starego Obozu. Rocky mieszka w tej samej chacie co Quentin.");
	


    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> POATAKU
//========================================

INSTANCE DIA_Quentin_POATAKU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 13;
   condition    = DIA_Quentin_POATAKU_Condition;
   information  = DIA_Quentin_POATAKU_Info;
   permanent	= FALSE;
   description	= "Zaatakowali�my konw�j.";
};

FUNC INT DIA_Quentin_POATAKU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_WIN_O)) && (Npc_HasItems (hero, eq_z_napadu1) >=1) && (Npc_HasItems (hero, eq_z_napadu2) >=1) && (Npc_HasItems (hero, eq_z_napadu3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_POATAKU_Info()
{
    AI_Output (other, self ,"DIA_Quentin_POATAKU_15_01"); //Zaatakowali�my konw�j.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_02"); //�wietnie. Rozumiem, �e wam si� uda�o.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_03"); //Zajm� si� ekwipunkiem. Przesortuj� go i oddam Martinowi. 
	B_LogEntry                     (CH1_ConvoyAttack,"Quentin by� bardzo zadowolony z naszych osi�gni��. Przyj�� ode mnie rzeczy z dostawy do Starej Kopalni.");	
	MIS_CH1ConvoyAttack = LOG_SUCCESS;
	Log_SetTopicStatus  (CH1_ConvoyAttack, LOG_SUCCESS);
	B_GiveInvItems (other, self, eq_z_napadu1, 1);
	B_GiveInvItems (other, self, eq_z_napadu2, 1);
	B_GiveInvItems (other, self, eq_z_napadu3, 1);
	Ban_NQuest1_Day = Wld_GetDay();

	};
	
//========================================
//-----------------> QUEST5
//========================================

INSTANCE DIA_Quentin_QUEST5 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 11;
   condition    = DIA_Quentin_QUEST5_Condition;
   information  = DIA_Quentin_QUEST5_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jeszcze jakie� zadanie?";
};

FUNC INT DIA_Quentin_QUEST5_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QUEST5_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QUEST5_15_01"); //Masz dla mnie jeszcze jakie� zadanie?
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_02"); //Wiesz przecie�, �e zawsze co� si� znajdzie...
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_03"); //Ostatnio wys�ali�my kilku Bandyt�w po dostaw� z Nowego Obozu, jednak do dzi� nie wr�cili.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_04"); //Przypuszczam, �e schowali si� w jakiej� jaskini z towarem i ani my�l� wraca�.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_05"); //Znajd� ich i przynie� stal, kt�ra nie�li. By�o tego ze 30 pr�t�w. 
    MIS_BanditCave = LOG_RUNNING;

    Log_CreateTopic          (CH1_BanditCave, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BanditCave, LOG_RUNNING);
    B_LogEntry               (CH1_BanditCave,"Quentin kaza� mi znale�� Bandyt�w, kt�rzy mieli przynie�� dostaw� stali z Nowego Obozu.");
};

//========================================
//-----------------> FindIron
//========================================

INSTANCE DIA_Quentin_FindIron (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_FindIron_Condition;
   information  = DIA_Quentin_FindIron_Info;
   permanent	= FALSE;
   description	= "Znalaz�em stal.";
};

FUNC INT DIA_Quentin_FindIron_Condition()
{
    if (Npc_HasItems (other, ItQt_IronPack) >=1) && (MIS_BanditCave == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_FindIron_Info()
{
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_01"); //Znalaz�em stal.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_02"); //By�o tak, jak my�la�e�.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_03"); //Ukryli si� w jaskini przy Nowym Obozie, a stal zamkn�li w skrzyni.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_04"); //Daj mi t� stal.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_05"); //Dobra robota.
    B_GiveInvItems (other, self, ItQt_IronPack, 1);
	
    B_LogEntry               (CH1_BanditCave,"Znalezion� w skrzyni stal przynios�em Quentinowi.");
    Log_SetTopicStatus       (CH1_BanditCave, LOG_SUCCESS);
    MIS_BanditCave = LOG_SUCCESS;

    B_GiveXP (XP_DostawaDoNO);
};

//========================================
//-----------------> IronPackWithoutBAU
//========================================

INSTANCE DIA_Quentin_IronPackWithoutBAU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_IronPackWithoutBAU_Condition;
   information  = DIA_Quentin_IronPackWithoutBAU_Info;
   permanent	= FALSE;
   description	= "To chyba nale�y do ciebie.";
};

FUNC INT DIA_Quentin_IronPackWithoutBAU_Condition()
{
   if (Npc_HasItems ( hero, ItQt_IronPack) >= 1) 
   && (MIS_BanditCave != LOG_RUNNING) 
   && (Npc_GetTrueGuild(hero) != GIL_BAU)
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_IronPackWithoutBAU_Info()
{
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_01"); //To chyba nale�y do ciebie.
    AI_Output (self, other ,"DIA_Quentin_IronPackWithoutBAU_03_02"); //Faktycznie, gdzie to znalaz�e�?
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_03"); //Paczka by�a w skrzyni, kt�rej pilnowa�o kilku bandzior�w.
    AI_Output (self, other ,"DIA_Quentin_IronPackWithoutBAU_03_04"); //Tak jak my�la�em... masz tu drobny upominek za fatyg�.
	B_GiveInvItems(self,hero, ItBe_Addon_Prot_EDGE,1);
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_05"); //Dzi�ki.
	B_GiveXP(250);
};



//========================================
//-----------------> SzpeszialQuest
//========================================

INSTANCE DIA_Quentin_SzpeszialQuest (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_SzpeszialQuest_Condition;
   information  = DIA_Quentin_SzpeszialQuest_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� specjalne zadanie?";
};

FUNC INT DIA_Quentin_SzpeszialQuest_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_BAU) && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_SzpeszialQuest_Info()
{
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_01"); //Masz dla mnie jakie� specjalne zadanie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_02"); //Jest co� takiego.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_03"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_04"); //Magnaci s� w posiadaniu kilku pier�cieni. Pono� te pier�cienie maj� magiczn� moc.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_05"); //Ale nie obchodzi mnie to. Wiem, �e s� bardzo cenne. 
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_06"); //Ci idioci ze Starego Obozu sporo nam za nie zap�ac�.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_07"); //Mam ukra�� pier�cienie i przynie�� je do ciebie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_08"); //Tak. Pogadaj z Miguelem. To nasz cz�owiek w Obozie. Znajdziesz go na targowisku.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_09"); //Go�� zna Stary Ob�z jak w�asn� kiesze�.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_10"); //Dobra. Postaram si� przynie�� ci te pier�cienie jak najszybciej.
    MIS_BaronsRings = LOG_RUNNING;

    Log_CreateTopic            (CH1_BaronsRings, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BaronsRings, LOG_RUNNING);
    B_LogEntry                     (CH1_BaronsRings,"Quentin kaza� mi odszuka� wszystkie magiczne pier�cienie nale��ce do Magnat�w. Pom�c mi w tym ma Miguel. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLORINGS
//========================================

INSTANCE DIA_Quentin_HELLORINGS (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_HELLORINGS_Condition;
   information  = DIA_Quentin_HELLORINGS_Info;
   permanent	= FALSE;
   description	= "Mam pier�cienie.";
};

FUNC INT DIA_Quentin_HELLORINGS_Condition()
{
    if (MIS_BaronsRings == LOG_RUNNING)
    && (Npc_HasItems (other, EBR_Ring1) >=1)
    && (Npc_HasItems (other, EBR_Ring2) >=1)
    && (Npc_HasItems (other, EBR_Ring3) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLORINGS_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_01"); //Mam pier�cienie.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_02"); //Wiedzia�em, �e ci si� uda. 
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_03"); //Te pier�cienie z pewno�ci� si� nam przydadz�.
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_04"); //Co chcesz z nimi zrobi�?
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_05"); //Mam kilka pomys��w, ale musz� to jeszcze przemy�le�.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_06"); //Tymczasem we� swoj� rud�.
  
    MIS_BaronsRings = LOG_SUCCESS;

   
	
	B_GiveInvItems (hero,self, EBR_Ring1, 1);
	B_GiveInvItems (hero,self, EBR_Ring2, 1);
	B_GiveInvItems (hero,self, EBR_Ring3, 1);
    B_GiveInvItems (self, other, ItMiNugget, 100);
	B_LogEntry               (CH1_BaronsRings,"Odda�em skardzione pier�cienie Quentinowi.");
    Log_SetTopicStatus       (CH1_BaronsRings, LOG_SUCCESS);
	B_GiveXP (XP_EBR_Rings);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BRACTWO1
//========================================

INSTANCE DIA_Quentin_BRACTWO1 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 14;
   condition    = DIA_Quentin_BRACTWO1_Condition;
   information  = DIA_Quentin_BRACTWO1_Info;
   permanent	= FALSE;
   description	= "Co z Bractwem?";
};

FUNC INT DIA_Quentin_BRACTWO1_Condition()
{
    if (MIS_CH1ConvoyAttack == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_BRACTWO1_Info()
{
    AI_Output (other, self ,"DIA_Quentin_BRACTWO1_15_01"); //Co z Bractwem?
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_02"); //Dobrze, �e mi przypomnia�e�. Szpieg powr�ci�.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_03"); //Y'Berion szuka kogo�, kto odnajdzie dla niego jaki� stary artefakt.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_04"); //Poszukuje najemnik�w, poniewa� nikt z Bractwa nie da� rady.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_05"); //Wys�ali chyba jakiego� Nowicjusza. Nuras, czy jaki� tam...
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_06"); //Ale do rzeczy. Za odnalezienie kamienia daje 1000 bry�ek rudy.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_07"); //To bardzo du�o.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_08"); //Id� do Bractwa i przyjmij t� robot�. Przy okazji b�dziesz m�g� tam pow�szy�.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_09"); //Je�eli odnajdziesz kamie� i dostaniesz nagrod�, to podzielimy si� rud�.
  
    MIS_PSIcampWORK = LOG_RUNNING;

    Log_CreateTopic          (CH1_PSIcampWORK, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_RUNNING);
    B_LogEntry               (CH1_PSIcampWORK,"Mam uda� si� do obozu na bagnie i przyj�� prac� od Y'Beriona. Chodzi o odnalezienie jakiego� kamienia. Zadanie powinno by� dziecinnie proste. Za zlecenie mam otrzyma� 1000 bry�ek rudy, kt�re zwr�c� Quentinowi.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GOLDY
//========================================

INSTANCE DIA_Quentin_GOLDY (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 15;
   condition    = DIA_Quentin_GOLDY_Condition;
   information  = DIA_Quentin_GOLDY_Info;
   permanent	= FALSE;
   description	= "Mam rud�.";
};

FUNC INT DIA_Quentin_GOLDY_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Yberion_KASADZIADU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_GOLDY_Info()
{
if (Npc_HasItems(other, ItMiNugget) >= 1000)
{
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_01"); //Mam rud�.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_02"); //Czyli uda�o ci si� wykona� zadanie?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_03"); //Tak. Odnalaz�em kamie� ogniskuj�cy.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_04"); //A ustali�e� ju� fakty?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_05"); //Pracuj� nad tym.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_06"); //Oto twoja dzia�ka.
    B_LogEntry                     (CH1_PSIcampWORK,"Odda�em rud� za zlecenie Quentinowi. Uzyska�em 500 bry�ek wynagrodzenia.");
	B_GiveXP (XP_HelpGUR);
    B_GiveInvItems (other, self, ItMiNugget, 1000);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	DIA_Quentin_GOLDY.permanent = false;
	} else {
	AI_Output (other, self ,"DIA_Quentin_GOLDY_15_07"); //Mam rud�. 
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_08"); //Jeste� pewien, �e jest tu tyle ile potrzeba? Chyba nie przepi�e� NASZEJ rudy?!
	DIA_Quentin_GOLDY.permanent = true;
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 1
// R�ne dialogi
///////////////////////////////////////////////////////////////////////////////////////////



//========================================
//-----------------> HELLO112
//========================================

INSTANCE DIA_Quentin_HELLO112 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 16;
   condition    = DIA_Quentin_HELLO112_Condition;
   information  = DIA_Quentin_HELLO112_Info;
   permanent	= FALSE;
   description	= "Ustali�em fakty!";
};

FUNC INT DIA_Quentin_HELLO112_Condition()
{
    if //(Npc_KnowsInfo (hero, DIA_Asghan_SZPIEG2))
  // (Npc_KnowsInfo (hero, DIA_GorNaBar_SZPIEG))
     (MIS_PSIcampWORK == LOG_RUNNING)
	&& (CorKalom_BringMCQBalls == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLO112_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_01"); //By�em w Starej Kopalni. Stra�nicy dostaj� rud� w zamian za zabijanie pe�zaczy.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_02"); //Ludzie z Bractwa szukaj� u pe�zaczy czego� szczeg�lnego. 
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_03"); //Dziwnym trafem uda�o mi si� wpl�ta� w t� spraw�.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_04"); //Potrzebna by�a im silniejsza wydzielina, jednak szukali jej w z�ym miejscu.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_05"); //Podj��em si� dla Cor Kaloma odnalezienia tego czego�, tej wydzieliny.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_06"); //Przynios�em mu jaja kr�lowej pe�zaczy, o czym pewnie ju� wiesz.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_07"); //Jestem pe�en podziwu dla twoich czyn�w, ale opowiedz jeszcze o tym kontrakcie.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_08"); //Zasada by�a prosta. Za pomoc Stary Ob�z dostawa� ziele.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_10"); //Nie do��, �e Stra�nicy �wi�tynni pomagaj� Gomezowi w t�pieniu pe�zaczy, to jeszcze p�ac� mu za to, �e jego Stra�nicy robi� to samo.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_11"); //We� t� rud�. Spisa�e� si�. 
	//quest log
    B_LogEntry               (CH1_PSIcampWORK,"Zda�em szczeg�owy raport Quentinowi. Wydaj� mi si� jednak, �e to jeszcze nie koniec zawirowa� zwi�zanych z Bractwem i Starym Obozem..");
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_SUCCESS);
    MIS_PSIcampWORK = LOG_SUCCESS;
	//prize
	B_GiveInvItems (self, other, ItMiNugget, 130);
    CreateInvItems (self, ItMiNugget, 130);
    B_GiveXP (XP_JobInOldMine);
};

//========================================
//-----------------> LOSY
//========================================

INSTANCE DIA_Quentin_LOSY (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 17;
   condition    = DIA_Quentin_LOSY_Condition;
   information  = DIA_Quentin_LOSY_Info;
   permanent	= FALSE;
   description	= "Co dalej z Bandytami?";
};

FUNC INT DIA_Quentin_LOSY_Condition()
{
    if (MIS_PSIcampWORK == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_LOSY_Info()
{
    AI_Output (other, self ,"DIA_Quentin_LOSY_15_01"); //Co dalej z Bandytami?
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_02"); //Nie wiem, ch�opcze. Ostatnie wydarzenia nape�ni�y mnie niepokojem. Obawiam si� o to, co dzieje si� w Bractwie.
	
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_03"); //C�, pozostaje nam czeka� na rozw�j wydarze�.

};

//========================================
//-----------------> BractwoNews
//========================================

INSTANCE DIA_Quentin_BractwoNews (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 34;
   condition    = DIA_Quentin_BractwoNews_Condition;
   information  = DIA_Quentin_BractwoNews_Info;
   permanent	= FALSE;
   description	= "Przynosz� wie�ci z Bractwa.";
};

FUNC INT DIA_Quentin_BractwoNews_Condition()
{
    if (Npc_KnowsInfo (hero, Info_CorAngar_FindHerb_Success))
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_BractwoNews_Info()
{
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_01"); //Przynosz� wie�ci z Bractwa.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_02"); //Co si� tam dzieje? D�ugo ci� nie by�o.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_03"); //Y'Berion nie �yje. Zgin�� podczas pr�by przywo�ania �ni�cego.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_04"); //Cor Angar dowodzi teraz Bractwem. Mam uda� si� do Nowego Obozu i za wszelk� cen� pom�c Magom Wody.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_05"); //Ta ca�a sytuacja zaczyna mnie niepokoi�. Czy�by ucieczka z tej piekielnej doliny by�a ju� blisko?
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_06"); //Nie mam poj�cia, ale b�d� si� stara� aby�my uciekli st�d jak najpr�dzej.
	//experience
    B_GiveXP (XP_YBerionDeath);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 4
// W�tek g��wny
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> HELLO35
//========================================

INSTANCE DIA_Quentin_HELLO35 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 35;
   condition    = DIA_Quentin_HELLO35_Condition;
   information  = DIA_Quentin_HELLO35_Info;
   permanent	= FALSE;
   description	= "Gomez wymordowa� wszystkich Mag�w Ognia!";
};

FUNC INT DIA_Quentin_HELLO35_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
	&& (MIS_NewDanger != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_HELLO35_Info()
{
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_01"); //Gomez wymordowa� wszystkich Mag�w Ognia!
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_02"); //Co? Jak to si� sta�o?! Dopiero co dowiedzia�em si� o problemach w Starej Kopalni.
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_03"); //Po zawaleniu si� kopalni Gomez wpad� w sza�. Jego przysz�o�� jako szefa jest krucha. 
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_04"); //Wys�a� oddzia� Stra�nik�w, kt�rzy maj� poprzez sekretn� �cie�k� przez g�ry dotrze� do Wolnej Kopalni i zaj�� j�!
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_05"); //Nikt nie ma wst�pu do Starego Obozu, a co wi�cej Stra�nicy i atakuj� ka�dego, kto nie nosi na sobie czerwonego pancerza.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_06"); //�a�osny akt desperacji. To w jego stylu. Ale �e nie oszcz�dzi� nawet Mag�w? Hmm...
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_07"); //Co teraz zrobimy?
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_08"); //Skoro ludzie Gomeza atakuj� ka�dego, to tylko kwestia czasu zanim spr�buj� si� dobra� do naszych ty�k�w. B�dziesz mia� teraz du�o pracy.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_09"); //Trzeba powiedzie� wszystkim, �eby wr�cili do Obozu i nie zwracali na sobie uwagi. Musisz porozmawia� z Ratfordem i Draxem. Ka� im si� ukry�. 
	AI_Output (self, other ,"DIA_Quentin_HELLO35_03_10"); //Ostatnio z Obozu znikn�o te� dw�ch Bandyt�w. To dosy� podejrzana sprawa. Mam nadziej�, �e nie wpadli w sid�a Stra�nik�w. 
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_11"); //Niech ostrzeg� naszych �eby si� nie wychylali. Je�li Stra�nicy wzi�liby ich do niewoli mogliby si� wygada� o naszym Obozie.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_12"); //Z obozu znikn�o tak�e kilku moich ludzi. Znajd� ich. Mo�e Ratford i Drax dadz� ci jakie� wskaz�wki.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_13"); //Na razie to wszystko. Zr�b co ci kaza�em. Nie ma czasu do stracenia.
	//log
	//zadanie nie jest ju� rozpoczynane u Draxa
	//if (MIS_NewDanger != LOG_RUNNING)
	//{
        MIS_NewDanger = LOG_RUNNING;
        Log_CreateTopic          (CH4_NewDanger, LOG_MISSION);
        Log_SetTopicStatus       (CH4_NewDanger, LOG_RUNNING);
        B_LogEntry               (CH4_NewDanger,"Sytuacja nie wygl�da zbyt dobrze. W tym ca�ym zamieszaniu Stra�nicy mog� pr�bowa� odnale�� Ob�z Bandyt�w. Musimy powzi�� �rodki ostro�no�ci. Quentin kaza� mi porozmawia� z Draxem i Ratfordem, obaj maj� wr�ci� do Obozu. Pryz okazji mam odnale�� kilku Bandyt�w, kt�rzy znikn�li z Obozu.");  
	//};
	//experience
	B_GiveXP (XP_FireMagesDeath);
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DraxInfos
//========================================

INSTANCE DIA_Quentin_DraxInfos (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_DraxInfos_Condition;
   information  = DIA_Quentin_DraxInfos_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Draxem i przy okazji odnalaz�em Bandyt�w!";
};

FUNC INT DIA_Quentin_DraxInfos_Condition()
{
    if (MIS_NewDanger == LOG_RUNNING) //(Npc_KnowsInfo (hero, DIA_Quentin_HELLO35))
	&& (Npc_KnowsInfo (hero, DIA_Drax_WTFCH4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_DraxInfos_Info()
{
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_01"); //Rozmawia�em z Draxem i przy okazji odnalaz�em Bandyt�w!
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_02"); //A wi�c �yj�? Gdzie s�?
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_03"); //Ratford zgin�� z r�k Stra�nik�w, kt�rzy udali si� w kierunku opuszczonej kopalni.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_04"); //Drax postanowi� si� zem�ci� na ludziach Gomeza i organizuje atak na patrole Stra�nik�w.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_05"); //Zwo�a� Bandyt�w i formuj� ma�y oddzia�. Ci, kt�rzy znikn�li z Obozu s� z nim.
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_06"); //Musisz go jak najszybciej od tego odci�gn��. Stra�nicy mog� si� teraz �atwo zorientowa� o po�o�eniu naszego obozu!
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_07"); //Ju� za p�no. Pr�bowa�em przem�wi� mu do rozs�dku, ale jest op�tany ��dz� zemsty.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_08"); //Teraz decyzja nale�y do ciebie. Chcesz mu pom�c, czy nie?
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_09"); //P�jdziemy z nim. Ja, ty i kliku naprawd� dobrych ludzi. Drax nie jest mistrzem wojennego rzemios�a. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_10"); //Gdyby�my zostawili go samego, to tak jakby�my powiedzieli Gomezowi, gdzie jest nasz Ob�z. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_11"); //Id� do niego i powiedz mu, �eby na nas poczeka�. Nie p�jd� mordowa� Stra�nik�w bez przygotowania.
	//log
    B_LogEntry                     (CH4_NewDanger,"Quentin zgodzi� si� pom�c Draxowi. W sumie to nie mia� za du�ego wyboru... Mam wr�ci� do Draxa i powiedzie� mu, �eby poczeka� na wsparcie z Obozu.");
	//exit
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> nextWork22
//========================================

INSTANCE DIA_Quentin_nextWork22 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_nextWork22_Condition;
   information  = DIA_Quentin_nextWork22_Info;
   permanent	= FALSE;
   description	= "Drax zaczeka. Co dalej?";
};

FUNC INT DIA_Quentin_nextWork22_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_QUENTINInfosHelp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_nextWork22_Info()
{
    AI_Output (other, self ,"DIA_Quentin_nextWork22_15_01"); //Drax zaczeka. Co dalej?
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_02"); //Wszystko przemy�la�em. P�jd� ja, ty, Drax i Pun. Reszta naszych ludzi nie nadaje si� do tego zadania, a ci kt�rzy zostan� musz� kontrolowa� sytuacj� podczas mojej nieobecno�ci.
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_03"); //Musisz teraz pogada� z dwiema osobami Jensem i Briamem.
    AI_Output (self, other ,"DIA_Quentin_nextWork22_03_04"); //Jensa popro� o ci�ki pancerz, a Briama o pomocne podczas walki eliksiry.
	//log
    B_LogEntry                     (CH4_NewDanger,"Quentin zezwoli� mi na otrzymanie ci�kiej zbroi Bandyty od Jensa. Briam ponadto da mi kilka eliksir�w. Powinienem bez zw�oki z nimi porozmawia�.");
	//exit
	AI_StopProcessInfos	(self);
	//note
	//Emanuel - dialog about food blocked (if ch=10)
	//Rocky - dialog about armors and skins blocked (if ch=10)
};

//========================================
//-----------------> Idea
//========================================

INSTANCE DIA_Quentin_Idea (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Idea_Condition;
   information  = DIA_Quentin_Idea_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_Idea_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Idea_Info()
{
    AI_Output (self, other ,"DIA_Quentin_Idea_03_01"); //Zaczekaj! Co� mi si� przypomnia�o.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_02"); //Ca�kiem zapomnia�em, �e mam kilku przyjaci� w obozie �owc�w ork�w.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_03"); //Znali�my si� z ich dow�dc� jeszcze w dalekiej przesz�o�ci.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_04"); //To dobrzy wojownicy. Z pewno�ci� pomog� nam pozby� si� tych Stra�nik�w.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_05"); //Id� do nich i popro� o kilku wojownik�w. Powo�aj si� na moj� znajomo�� z Wilsonem.
	//quest log
    MIS_SupportFromOrcHunters = LOG_RUNNING;
    Log_CreateTopic      (CH4_SupportFromOrcHunters, LOG_MISSION);
    Log_SetTopicStatus   (CH4_SupportFromOrcHunters, LOG_RUNNING);
    B_LogEntry           (CH4_SupportFromOrcHunters,"Mam odnale�� ob�z �owc�w ork�w. Ich szef podobno zna� si� z Quentinem, dlatego ten teraz liczy na jego pomoc. Obozu mam szuka� w jaskini b�d�cej cz�ci� �ciany skalnej oddzielaj�cej Stary Ob�z od Ziem Ork�w.");
	B_LogEntry           (CH4_NewDanger,"Ju� mia�em bra� si� do roboty, gdy nagle ponownie zaczepi� mnie Quentin. Poprosi� o odnalezienie obozu �owc�w ork�w i poproszenie ich o pomoc. Obozu mam szuka� w jaskini b�d�cej cz�ci� �ciany skalnej oddzielaj�cej Stary Ob�z od Ziem Ork�w.");
	//exit
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> QuestOk890976
//========================================

INSTANCE DIA_Quentin_QuestOk890976 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_QuestOk890976_Condition;
   information  = DIA_Quentin_QuestOk890976_Info;
   permanent	= FALSE;
   description	= "Dw�ch ludzi Wilsona ju� tu idzie.";
};

FUNC INT DIA_Quentin_QuestOk890976_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12)) && (MIS_SupportFromOrcHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_QuestOk890976_Info()
{
    AI_Output (other, self ,"DIA_Quentin_QuestOk890976_15_01"); //Dw�ch ludzi Wilsona ju� tu idzie. S� to Rakus i Osko, jedni z najlepszych �owc�w ork�w.
    AI_Output (self, other ,"DIA_Quentin_QuestOk890976_03_02"); //To nie tak �le. Wi�ksza grupa mog�a by wzbudzi� zamieszanie.
	//log
    B_LogEntry               (CH4_SupportFromOrcHunters,"Powiedzia�em Quentinowi, �e uda�o mi si� przekona� Wilsona, aby przys�a� nam kilku ludzi do pomocy. Nasze si�y teraz znacznie wzrosn�.");
	B_LogEntry               (CH4_NewDanger,"Wilson przy�le do obozu dw�ch swoich najlepszych wojownik�w. Powiedzia�em o tym szefowi.");
    Log_SetTopicStatus       (CH4_SupportFromOrcHunters, LOG_SUCCESS);
    MIS_SupportFromOrcHunters = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_HelpHunters);
};

//========================================
//-----------------> WykonanoXD
//========================================

INSTANCE DIA_Quentin_WykonanoXD (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_WykonanoXD_Condition;
   information  = DIA_Quentin_WykonanoXD_Info;
   permanent	= FALSE;
   description	= "Jestem przygotowany!";
};

FUNC INT DIA_Quentin_WykonanoXD_Condition()
{
    if ((Npc_HasItems (hero,BAU_ARMOR_H)>= 1) //warunek zosta� zmieniony poniewa� opcja by�a perm 
    && (Npc_KnowsInfo (hero, DIA_Bandyta_FreePotions))
	&& (Npc_KnowsInfo (hero, DIA_Quentin_QuestOk890976)))
	|| (devmode_dia_WykonanoXD == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_WykonanoXD_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_01"); //Jestem przygotowany!
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_02"); //�wietnie. Ja za ten czas zaj��em si� sprawami organizacyjnymi. Doyle dopilnuje, �eby ten ca�y pierdolnik nie rozpad� si� podczas mojej nieobecno�ci.
	AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_03"); //My�l�, �e to dobra decyzja.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Zostan� te� Rocky i Emanuel. Powinni sobie poradzi�.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_05"); //Nie wiem tylko jaki Drax ma plan ataku. Mam nadziej�, �e wszystko przygotowa�. Lepiej ju� do niego chod�my. 
    B_LogEntry               (CH4_NewDanger,"Przygotowa�em wszystko co by�o trzeba. Teraz musimy uda� si� do Draxa. Quentin powierzy� mu dow�dztwo nad ca�� wypraw�. Widz� jednak, �e nie jest zachwycony ca�� t� wypraw�. Sprawia wra�enie zamy�lonego. By� mo�e obawia si� konsekwencji ataku na ludzi Gomeza.");
    Log_SetTopicStatus       (CH4_NewDanger, LOG_SUCCESS);
    MIS_NewDanger = LOG_SUCCESS;

    B_GiveXP (XP_WeMustHelpDrax);
	AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (BAN_1610_Quentin,"wait");
	Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
	Npc_ExchangeRoutine (NON_2706_Osko,"atak");
	Npc_ExchangeRoutine (NON_2705_Rakus,"atak");
	

};

//========================================
//-----------------> AkcjaUkonczona
//========================================

INSTANCE DIA_Quentin_AkcjaUkonczona (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_AkcjaUkonczona_Condition;
   information  = DIA_Quentin_AkcjaUkonczona_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_AkcjaUkonczona_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drax_Pokonani3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_AkcjaUkonczona_Info()
{
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_01"); //Ha Ha! Dawno nie by�o tu takiej rzezi! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_02"); //Ch�opaki, zwijajmy si� zanim kto� reszta Stra�nik�w zorientuje si� co si� sta�o. 
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_05"); //Chocia� pewnie te dupki s� zbyt zaj�te us�ugiwaniem Gomezowi...
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_06"); //Na mnie ju� pora...
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_07"); //Czekaj, gdzie chcesz i��? 
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_08"); //Mam jeszcze du�o spraw do za�atwienia.
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_09"); //Kilka chwil nic nie zmieni. Chod� z nami do obozu. Trzeba uczci� zwyci�stwo.
    
    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (BAN_1610_Quentin,"wait");
	BAN_1610_Quentin.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine (NON_2706_Osko,"atak");
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2705_Rakus,"atak");
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine (BAN_1611_Pun,"pupil");
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine (BAN_1613_Doyle,"zwial");//Doyle ucieka do Nowego Obozu
	
	Npc_ExchangeRoutine (BAN_1605_Rocky,"ucieczka");//Rocky ucieczka przed ob�z
	Npc_RemoveInvItem (BAN_1605_Rocky, BAU_ARMOR_H);//usuni�cie pancerza
	


	//K�opoty Bandyt�w jednak si� nie sko�czy�y. Stra�nicy zaj�li Ob�z i zniewolili Bandyt�w. Rocky uciek� i stoi przed Obozem.
	Wld_InsertNpc				(GRD_2271_Stra�nik,"OC1");	
	Wld_InsertNpc				(GRD_2272_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2273_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2274_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2275_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2276_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2277_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2278_Stra�nik ,"OC1");	
	Wld_InsertNpc				(GRD_2279_Stra�nik ,"OC1");
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2282_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra�nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2284_Stra�nik  ,"OC1");
	Wld_InsertNpc				(GRD_2290_Stra�nik  ,"OC1");
	Npc_ExchangeRoutine			(GRD_3935_Hector,"misja"); //boss
	
	B_LogEntry               (CH4_GardistsCheckpoints,"Quentin r�wnie� ucieszy� si� z takiego przebiegu wydarze�. Nie pozosta�o nam nic innego jak zaszy� si� ponownie w g�rskim obozie.");
    Log_SetTopicStatus       (CH4_GardistsCheckpoints, LOG_SUCCESS);
    MIS_GardistsCheckpoints = LOG_SUCCESS;
};

//========================================
//-----------------> Plan
//========================================

INSTANCE DIA_Quentin_Plan (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_Plan_Condition;
   information  = DIA_Quentin_Plan_Info;
   permanent	= FALSE;
   description	= "Masz ju� jaki� plan?";
};

FUNC INT DIA_Quentin_Plan_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_WtfRozwalaWobozie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Plan_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_15_01"); //Rozmawia�em z Rocky'm. Masz ju� jaki� plan?
    AI_Output (self, other ,"DIA_Quentin_Plan_03_02"); //Jedynym sensownym wyj�ciem wydaj� mi si� szybki i nag�y atak. Wci�� mamy kilku dobrych ludzi. Je�li Stra�nicy nie zd��� si� zabarykadowa�, to damy rad�.
    AI_Output (other, self ,"DIA_Quentin_Plan_15_03"); //Chyba nie mamy innego wyboru. 
    AI_Output (self, other ,"DIA_Quentin_Plan_03_04"); //Dobrze, �e si� zgadzamy. Niech wszyscy opatrz� rany, zjedz� co� i od razu bierzemy si� do roboty. 
	

	PlanA = true;
	
	B_LogEntry          (CH4_GardistsInBC,"Aby odbi� nasz Ob�z, b�dziemy musieli szybko i skutecznie zaatakowa� niespodziewaj�cych si� nas Stra�nik�w. Tak sw�j plan przedstawi� mi Quentin.");
	
};

FUNC VOID DIA_Quentin_Plan_PalisadeZbudjmy()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_01"); //Uwi�my Stra�nik�w b�d�cych w kanionie.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_02"); //Jak chcesz to zrobi�?
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_03"); //Zaatakujemy szybko. Wybijemy wszystkich pilnuj�cych wej�cia, po czym w�ski przesmyk zabudujemy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_04"); //To si� mo�e uda�!
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_05"); //Musimy wszystkich zmobilizowa� do budowy.
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_06"); //Jeszcze nie odbili�my Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_07"); //Ju� widz� jak to zrobili�my.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_08"); //Ch�opcze, chyba zas�ugujesz na tak� zbroj� jak moja.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_09"); //Niech ci s�u�y w walce!
    CreateInvItems (self, BAU_ARMOR_H, 2);
    B_GiveInvItems (self, hero, BAU_ARMOR_H, 1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, BAU_ARMOR_H);
	PlanA = true;
    B_LogEntry                     (CH4_GardistsInBC,"Postanowi�em, �e po szybkim ataku uwi�zimy pozosta�ych Stra�nik�w w Obozie.");

    B_GiveXP (1000);
    Info_ClearChoices		(DIA_Quentin_Plan);
};

FUNC VOID DIA_Quentin_Plan_Trolllle()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_01"); //Sprowadzimy g�rskie trolle do Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_Trolllle_03_02"); //Jak chcesz to zrobi�?
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_03"); //Skorzystamy z pomocy Mag�w Wody.
    B_LogEntry                     (CH4_GardistsInBC,"Postanowi�em poprosi� o pomoc Mag�w Wody. Sprowadzimy g�rskie trolle do Obozu. One z pewno�ci� za�atwi� spraw� za nas.");
    PlanB = true;
    B_GiveXP (500);
    Info_ClearChoices		(DIA_Quentin_Plan);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_Plan_Inne()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_01"); //Przygnieciemy ich kamieniami.
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_02"); //Chcesz wywo�a� lawin�?

    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_03"); //Skorzystam z pomocy jakiego� maga.
    
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_04"); //�ycz� ci powodzenia. Przyjd� jak co� przygotujesz.
	B_LogEntry                     (CH4_GardistsInBC,"Uwa�am, �e sprowadzenie lawiny to dobry pomys�. Potrzebuj� tylko jakiego� maga i �r�d�a mocy.");

    B_GiveXP (500);
	Info_ClearChoices	    (DIA_Quentin_Plan);
  AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LetsGo2346567
//========================================

INSTANCE DIA_Quentin_LetsGo2346567 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_LetsGo2346567_Condition;
   information  = DIA_Quentin_LetsGo2346567_Info;
   permanent	= FALSE;
   description	= "Ruszamy?";
};

FUNC INT DIA_Quentin_LetsGo2346567_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_Plan))
    && (PlanA == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_LetsGo2346567_Info()
{
    AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_01"); //Ruszamy?
    AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_02"); //Tak, jednak zanim to zrobimy, powiniene� wiedzie� czego mo�na si� tam spodziewa�. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_03"); //Rocky m�wi� o grupie Stra�nik�w...
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_04"); //S�dzisz, �e przyszli tu sami? Jako niezorganizowana ha�astra? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_05"); //W Obozie jest z pewno�ci� jeszcze kto�.
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_06"); //Czy�by sam Thorus?
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_07"); //By� mo�e... Albo kt�ry� z Magnat�w. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_08"); //Chcesz si� wycofa�? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_09"); //Nie, po prostu lepiej zachowa� czujno��. Skup si� na g��wnym przeciwniku. My zajmiemy si� reszt�. 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_10"); //A teraz prowad�. 
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak");

	B_KillNpc (BAN_1614_Drax);
	
	Npc_ExchangeRoutine (BAN_1605_Rocky , "odb");
	BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = TRUE;
	
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2705_Rakus , "burdel");
	NON_2705_Rakus.guild = GIL_BAU;
	
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (NON_2706_osko , "burdel");
	NON_2706_osko.guild = GIL_BAU;
	
	//pun
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (BAN_1611_Pun,"help");
	
	//ci dwaj chyba stoj� tam gdzie Ratford i Drax i nie brali udzia�u w walce
	ORG_864_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_864_Raeuber,"help");
	
	ORG_869_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (ORG_869_Raeuber,"help");
	
    AI_StopProcessInfos	(self);
	

};

//========================================
//-----------------> 54
//========================================

INSTANCE DIA_Quentin_54 (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_54_Condition;
   information  = DIA_Quentin_54_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_54_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_LetsGo2346567))
    && (Npc_IsDead(GRD_3935_Hector))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_54_Info()
{
    AI_Output (self, other ,"DIA_Quentin_54_03_01"); //Dobra robota! To ju� chyba wszyscy. Reszta albo zwieje, albo zaraz b�dzie gry�� ziemi�.
    AI_Output (other, self ,"DIA_Quentin_54_15_02"); //Ob�z zn�w jest nasz!
    AI_Output (self, other ,"DIA_Quentin_54_03_03"); //Kim by� dow�dca Stra�nik�w? 
	AI_Output (other, self ,"DIA_Quentin_54_15_04"); //To Skelden, jeden z najbardziej wp�ywowych Stra�nik�w w Starym Obozie. 
	AI_Output (self, other ,"DIA_Quentin_54_03_05"); //To nie lada wyczyn wygra� z kim� takim. Dobrze, �e ten typ ju� gryzie piach. 
	//log
    B_LogEntry               (CH4_GardistsInBC,"Podczas gdy Bandyci eliminowali Stra�nik�w, jak skupi�em si� na zabiciu niejakiego Skeldena. To silny i do�wiadczony cz�onek przybocznej stra�y Gomeza. Walka z nim nie by�a �atwa, jednak ostatecznie uda�o mi si� wys�a� go w za�wiaty. Ob�z zn�w jest nasz, jednak teraz czeka nas du�o pracy z przywr�ceniem temu miejscu dawnej �wietno�ci.");
    Log_SetTopicStatus       (CH4_GardistsInBC, LOG_SUCCESS);
    MIS_GardistsInBC = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_KillAllgardist);
	//powr�t bandyt�w do obozu
	BAN_1610_Quentin.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1610_Quentin,"start");
	BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1605_Rocky , "start");
	
	ORG_864_Raeuber.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (ORG_864_Raeuber,"start");
	BAN_1611_Pun.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (BAN_1611_Pun,"start");
	ORG_869_Raeuber.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (ORG_869_Raeuber,"start");
	
	//powr�t do obozu �owc�w
	Npc_ExchangeRoutine (NON_2705_Rakus , "start");
	Npc_ExchangeRoutine (NON_2706_osko , "start");
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = false;
	NON_2706_osko.aivar[AIV_PARTYMEMBER] = false;
	

};

//========================================
//-----------------> findFriends
//========================================

INSTANCE DIA_Quentin_findFriends (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_findFriends_Condition;
   information  = DIA_Quentin_findFriends_Info;
   permanent	= FALSE;
   description	= "Wszystko w porz�dku?";
};

FUNC INT DIA_Quentin_findFriends_Condition()
{
    if (MIS_GardistsInBC == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_findFriends_Info()
{
    AI_Output (other, self ,"DIA_Quentin_findFriends_15_01"); //Wszystko w porz�dku?
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_02"); //Gdzie� mi znikn�� Drax i Doyle. Nikt ich nie widzia�. Cz�� naszych sprawdza trupy, ale tych dw�ch chyba w�r�d nich nie ma.
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_03"); //Poszukaj ich. Mo�e uciekli podobnie jak Rocky?
	AI_Output (other, self ,"DIA_Quentin_findFriends_15_04"); //Chwila, przecie� Drax by� z nami. 
	AI_Output (self, other ,"DIA_Quentin_findFriends_03_05"); //Hmm... To si� zgadza, ale przecie� nie pojawi� si� p�niej. Znikn�� mi z oczu, gdy wracali�my z okolic Starego Obozu. 
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_06"); //Musisz ich jak najszybciej odnale��. Mo�liwe, �e potrzebuj� naszej pomocy.
	//log
    MIS_FindFriends = LOG_RUNNING;
    Log_CreateTopic          (CH4_FindFriends, LOG_MISSION);
    Log_SetTopicStatus       (CH4_FindFriends, LOG_RUNNING);
    B_LogEntry               (CH4_FindFriends,"W odbitym Obozie nie znale�li�my Doyla. Mo�liwe, �e gdzie� uciek� lub porwali go Stra�nicy. Ponadto zagin�� Drax. Musz� odnale�� ich obu. Bez �adnych wskaz�wek to nie b�dzie zbyt proste.");
	//story
	B_Story_SoldiersValleyDefense ();
};

//========================================
//-----------------> FoundDrax
//========================================

INSTANCE DIA_Quentin_FoundDrax (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_FoundDrax_Condition;
   information  = DIA_Quentin_FoundDrax_Info;
   permanent	= FALSE;
   description	= "Znalaz�em Draxa.";
};

FUNC INT DIA_Quentin_FoundDrax_Condition()
{
    if (MIS_FindFriends == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_Listdraxa) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_FoundDrax_Info()
{
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_01"); //Znalaz�em Draxa.
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_02"); //I co z nim? Gdzie jest?
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_03"); //W szeroko poj�tych za�wiatach. Pewnie sma�y si� w kotle Beliara. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_04"); //Zatem nie �yje. Hmmm....
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_05"); //Tak, jednak to nie koniec rewelacji. Wbi� sobie n� prosto w serce, ale zanim to zrobi�, napisa� do�� niezgrabny list. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_06"); //List? C� kilku moich ludzi w og�le nie umi� pisa� i czyta�. Drax potrafi� ale nie lubi� nazywaj�c to ,,m�drzeniem si�"
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_07"); //Wi�c w ostatnich chwilach si� do tego zmusi�. W li�cie przyzna� si� do tego, �e to on zabi� Ratforda, a nie Stra�nicy. P�niej doszed� do w�tpliwego porozumienia ze Stra�nikami. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_08"); //M�w ja�niej, do cholery. Nie komplikuj jak jaki� uczony Mag!
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_09"); //Tej historii nie da si� opowiedzie� jednym zdaniem. Daj mi doko�czy�. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_10"); //Stra�nicy obiecali mu rud� w zamian za wci�gni�cie mnie w pu�apk�. Podwajali nagrod�, je�li przyprowadzi�by r�wnie� ciebie. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_11"); //Jednak Drax nie spodziewa� si�, �e p�jdzie z nami Pun, oraz ludzie z obozu �owc�w ork�w. Ca�a sprawa mia�a si� zako�czy� ju� na pierwszym posterunku Stra�nik�w. Chcieli nas wyko�czy�.W
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_12"); //Nie uda�o im si�...
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_13"); //Nie wszystko posz�o zgodnie z ich planem. Stra�nicy ze wszystkich trzech posterunk�w mieli si� zjawi� w pierwszym, tak aby mieli znaczn� przewag�. Widocznie si� nie dogadali lub co� stan�o im na drodze. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_14"); //Ostatecznie pozostali w trzech grupach, co u�atwi�o nam ich eliminacj�. Po wszystkim Drax do reszty zg�upia�. Nie wiedzia�, co ma z tym zrobi�, wi�c po tym wszystkim da� nog�. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_15"); //Nie spodziewa�em si�, �e z niego kawa� takiego sukinsyna. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_16"); //Po tym co �mia� zrobi� swoim kompanom zas�u�y� na taki smutny los.
	//log
	B_LogEntry                     (CH4_FindFriends,"Przyw�dca Bandyt�w by� zaskoczony t� zdrad�. Dali�my si� nie�le oszuka�...");
	//experience
    B_GiveXP (XP_FindDrax);
};

//========================================
//-----------------> iFindDoyle
//========================================

INSTANCE DIA_Quentin_iFindDoyle (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_iFindDoyle_Condition;
   information  = DIA_Quentin_iFindDoyle_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em i sprowadzi�em Doyla.";
};

FUNC INT DIA_Quentin_iFindDoyle_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_backtoCamp)) && (MIS_FindFriends == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_iFindDoyle_Info()
{
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_01"); //Odnalaz�em i sprowadzi�em Doyla.
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_02"); //Postanowi� uda� si� do Nowego Obozu i pom�c Najemnikom w walce ze Stra�nikami.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_03"); //Wybra� sobie �wietny moment... Czy ju� nikt w tym cholernym Obozie nie u�ywa g�owy?!
	AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_06"); //Kaza�em mu wr�ci� do Obozu.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_07"); //Najwy�sza pora... B�d� mia� dla was jeszcze troch� roboty. 
	//log
    B_LogEntry                     (CH4_FindFriends,"Zg�osi�em Quentinowi, gdzie znalaz�em Doyla. Szef Bandyt�w by� na niego nie�le wkurzony.");
	//experience
    B_GiveXP (XP_FindDoyle);
};

//========================================
//-----------------> PrzejscieDalej
//========================================

INSTANCE DIA_Quentin_PrzejscieDalej (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_PrzejscieDalej_Condition;
   information  = DIA_Quentin_PrzejscieDalej_Info;
   permanent	= FALSE;
   description	= "Dzia�o si� co� podczas mojej nieobecno�ci?";
};

FUNC INT DIA_Quentin_PrzejscieDalej_Condition()
{
    if (kapitel == 4) //((Npc_KnowsInfo (hero, DIA_Quentin_iFindDoyle)) && (Npc_KnowsInfo (hero, DIA_Quentin_FoundDrax)) )
	&& (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_PrzejscieDalej_Info()
{
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_01"); //Dzia�o si� co� podczas mojej nieobecno�ci?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_02"); //Wr�ci�o do mnie kilku zwiadowc�w.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_03"); //Czego si� dowiedzieli?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_04"); //Pono� Gomez wys�a� kilkunastu Stra�nik�w wraz z Kopaczami w kierunku placu wymian.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_05"); //Co to mo�e oznacza�?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_06"); //Opuszczona Kopalnia, ch�opcze. Opuszczona Kopalnia...
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_07"); //Przypuszczam, �e chc� wznowi� wydobycie. Nie wiem w jakim stanie jest ta kopalnia, ale to mo�e im si� uda�.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_08"); //W takim razie musimy czym pr�dzej im przeszkodzi�!
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_13"); //Popro� Doyle'a o pomoc. Eksplorowa� ju� kiedy� podziemia.
	AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_14"); //Dobrze, �e uda�o ci si� go sprowadzi�. 

	MIS_FindFriends = LOG_RUNNING;
    MIS_BanditsInAbadonedMine = LOG_RUNNING;
	
	B_LogEntry         (CH4_FindFriends,"Odnalaz�em obu Bandyt�w, co ko�czy moje zadanie.");
    Log_SetTopicStatus (CH4_FindFriends, LOG_SUCCESS);

    Log_CreateTopic          (CH4_BanditsInAbadonedMine, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditsInAbadonedMine, LOG_RUNNING);
    B_LogEntry               (CH4_BanditsInAbadonedMine,"Quentin zn�w ma plan. Tym razem musz� uda� si� wraz z grupk� Bandyt�w do Opuszczonej Kopalni. Mamy pozby� si� Stra�nik�w i zaj�� kopalni� dla siebie. Powinienem uprzednio pogada� z Doylem.");


	Wld_InsertNpc				(GRD_2291_Stra�nik,"OC1");
	Wld_InsertNpc				(GRD_2292_Stra�nik,"OC1");
	Wld_InsertNpc				(GRD_2293_Stra�nik,"OC1");

    AI_StopProcessInfos	(BAN_1610_Quentin);
};

//========================================
//-----------------> MineIsClean
//========================================

INSTANCE DIA_Quentin_MineIsClean (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_MineIsClean_Condition;
   information  = DIA_Quentin_MineIsClean_Info;
   permanent	= FALSE;
   description	= "Oczy�ci�em kopalni� ze Stra�nik�w i o�ywie�c�w.";
};

FUNC INT DIA_Quentin_MineIsClean_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_MineIsClean_Info()
{
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_01"); //Oczy�ci�em kopalni� ze Stra�nik�w i o�ywie�c�w.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_02"); //O�ywie�c�w? Co tam do cholery si� dzia�o?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_03"); //Najprawdopodobniej jeden z wa�niejszych gwardzist�w kt�rzy niegdy� urz�dowali w kopalni zosta� przekl�ty. Reszty mo�esz sie domy�le�.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_05"); //�eby ci to wynagrodzi� dam ci co� w nagrod�, we� to. Natychmiast wysy�am oddzia� Bandyt�w do kopalni.
	
	B_GiveInvItems (self,other, ItMw_Sword_2h_WarriorFrenzy, 1);
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_06"); //Czym teraz mam si� zaj��?
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_07"); //Potrzebujemy jeszcze jakiego� do�wiadczonego Kopacza, kt�ry pokierowa�by lud�mi. 
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_08"); //M�g�by� co� zorganizowa�?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_09"); //Postaram si�.
	//log
	MIS_BanditsInAbadonedMine = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_BanditsInAbadonedMine, LOG_SUCCESS);
    B_LogEntry               (CH4_BanditsInAbadonedMine,"Powiedzia�em Quentinowi o wszystkim, co wydarzy�o si� w opuszczonej kopalni. Moje zadanie dobieg�o ko�ca.");
	//new quest
	MIS_NewEnginer = LOG_RUNNING;
	Log_CreateTopic          (CH4_NewEnginer, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NewEnginer, LOG_RUNNING);
    B_LogEntry               (CH4_NewEnginer,"Quentin natychmiast wys�a� oddzia� Bandyt�w do kopalni. Maj� zacz�� tam prac�, jednak najpierw potrzebny jest kto� z do�wiadczeniem, kto pokieruje wydobyciem. Musz� odnale�� odpowiedniego cz�owieka. S�k w tym, �e najlepsi in�ynierowie byli w Starym Obozie... By� mo�e kt�ry� z nich zwia� do obozu na bagnie, b�d� musia� si� tam rozejrze�...");
	//npcs
	Wld_InsertNpc				(NON_3040_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3042_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3044_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3045_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3030_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3031_Bandyta,"KOPACZ");
	Wld_InsertNpc				(NON_3032_Bandyta,"KOPACZ");	

	Wld_InsertNpc				(NON_3038_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3037_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1615_Luis,"KOPACZ");//luis
	
	Npc_ExchangeRoutine (BAN_1605_Rocky,"start");
	Npc_ExchangeRoutine (BAN_1613_Doyle,"afterstart");
	Npc_ExchangeRoutine (BAN_1607_Chris,"start");
    B_GiveXP (XP_ClearAbMine);
	
};

//========================================
//-----------------> GuyWork
//========================================

INSTANCE DIA_Quentin_GuyWork (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_GuyWork_Condition;
   information  = DIA_Quentin_GuyWork_Info;
   permanent	= FALSE;
   description	= "Guy chce dla ciebie pracowa�.";
};

FUNC INT DIA_Quentin_GuyWork_Condition()
{
    if (MIS_NewEnginer == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Guy_backToMine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_GuyWork_Info()
{
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_01"); //Guy chce dla ciebie pracowa�.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_03"); //By�y Kopacz, kt�ry uciek� ze Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_04"); //Z pewno�ci� ma sporo do�wiadczenia.
	if (Npc_KnowsInfo (hero, DIA_Quentin_NegocjacieNc))
	{
	AI_Output (self, other ,"DIA_Quentin_GuyWork_03_10"); //Powiedz Lee, �e wy�l� swoich ludzi.
	};
	//log
	MIS_NewEnginer = LOG_SUCCESS;
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH4_NewEnginer,"Powiedzia�em Quentinowi, �e Guy b�dzie dla niego pracowa�. Ten cz�owiek ma du�e do�wiadczenie.");
	Log_SetTopicStatus       (CH4_NewEnginer, LOG_SUCCESS);
	//npc
	B_ExchangeRoutine	(VLK_530_Guy, "delte");
	Wld_InsertNpc		(VLK_599_GuyMine,"LOCATION_11_08");
	//experience
    B_GiveXP (200);
};

//========================================
//-----------------> Successasd
//========================================

INSTANCE DIA_Quentin_Successasd (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 3;
   condition    = DIA_Quentin_Successasd_Condition;
   information  = DIA_Quentin_Successasd_Info;
   permanent	= FALSE;
   description	= "Mo�na powiedzie�, �e osi�gn�li�my sukces.";
};

FUNC INT DIA_Quentin_Successasd_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Successasd_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_01"); //Mo�na powiedzie�, �e osi�gn�li�my sukces.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_02"); //Masz racj�. Uda�o nam si� zada� cios Gomezowi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_03"); //Jednak wci�� musimy by� czujni.
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_04"); //Jaki b�dzie kolejny cel Bandyt�w?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_05"); //Jak zawsze: prze�y� jak najd�u�ej.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_06"); //Mam nadziej�, �e sytuacja w Kolonii nied�ugo si� uspokoi. A mo�e wreszcie czeka nas wolno��?

};

//========================================
//-----------------> OldMine
//========================================

INSTANCE DIA_Quentin_OldMine (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_OldMine_Condition;
   information  = DIA_Quentin_OldMine_Info;
   permanent	= FALSE;
   description	= "A co ze Star� Kopalni�?";
};

FUNC INT DIA_Quentin_OldMine_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_OldMine_Info()
{
    AI_Output (other, self ,"DIA_Quentin_OldMine_15_01"); //A co ze Star� Kopalni�?
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_02"); //Od dawna nie mamy stamt�d �adnych wie�ci.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_03"); //Wybierz si� tam i zobacz, co si� tam wyprawia.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_04"); //Tylko nie id� prosto do obozu. Obserwuj z daleka. Nie chcia�bym �eby po tym wszystkim Stra�nicy przerobili ci� na pasztet.
	
	B_Story_BattleInOldMineCamp ();
};

//========================================
//-----------------> TalkAboutMine
//========================================

INSTANCE DIA_Quentin_TalkAboutMine (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TalkAboutMine_Condition;
   information  = DIA_Quentin_TalkAboutMine_Info;
   permanent	= FALSE;
   description	= "By�em w pobli�u obozu.";
};

FUNC INT DIA_Quentin_TalkAboutMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_Nieidz))
    && (MIS_BackToOldMine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_TalkAboutMine_Info()
{
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_01"); //By�em w pobli�u obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_03"); //Podobno Stra�nicy sprzeciwili si� w�adzy Gomeza.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_04"); //Zabili jakiego� Magnata. kt�ry mia� tymczasowo zaj�� si� obozem.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_05"); //Jakikolwiek wp�yw starego obozu na kopalni� odszed� w zapomnienie.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_07"); //I w�a�nie o to nam chodzi�o, ch�opcze! Gomez wpakowa� si� w niema�e k�opoty. Zosta�o mu ma�o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_08"); //Nie musimy si� ju� obawia� Starego Obozu. Jest ich zbyt ma�o, aby cokolwiek zdzia�a�. Jak dobrze p�jdzie, to wybij� si� sami.
	
	AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_09"); //A ty, ch�opcze? Czym teraz si� zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_10"); //Pewnie b�d� pomaga� Magom Wody nam si� st�d wydosta�.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_11"); //W takim razie, powodzenia. Pami�taj, �e tutaj zawsze mo�esz wr�ci�.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_12"); //Masz tu kilka mikstur na drog�. Zrabowa�em je lata temu.
	
	B_Story_BattleInOldMineCamp ();
    B_LogEntry               (CH4_BackToOldMine,"Pot�ga Gomeza podupad�a na tyle, �e Quentin odetchn�� z ulg�. Ob�z Bandyt�w jest na razie bezpieczny, a moja misja w nim dobiega ko�ca.");
    Log_SetTopicStatus       (CH4_BackToOldMine, LOG_SUCCESS);
    MIS_BackToOldMine = LOG_SUCCESS;
	//experience
    B_GiveXP (5000);
	//prize
    CreateInvItems (self, ItFo_Potion_Dex_02, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Dex_02, 1);
	
	CreateInvItems (self, ItFo_Potion_Health_Perma_02, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Health_Perma_02, 1);
    B_GiveXP (100);
};



//========================================
//-----------------> KoniecWatkuBandytow
//========================================

INSTANCE DIA_Quentin_KoniecWatkuBandytow (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_KoniecWatkuBandytow_Condition;
   information  = DIA_Quentin_KoniecWatkuBandytow_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Artegorem z obozu przed kopalni�.";
};

FUNC INT DIA_Quentin_KoniecWatkuBandytow_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_EveryoneDie))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_KoniecWatkuBandytow_Info()
{

    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_02"); //Rozmawia�em z Artegorem z obozu przed kopalni�.
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_03"); //Wszyscy nie �yj�. Stra�nicy wybili si� do nogi. Prze�y� tylko on.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_04"); //Wiedzia�em! Wiedzia�em, �e nam si� uda!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_05"); //Gomez wpakowa� si� w niema�e k�opoty. Zosta�o mu ma�o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_06"); //Wkr�tce sko�czy ze sztyletem w gardle!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_07"); //
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_08"); //A ty, ch�opcze? Czym teraz si� zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_09"); //Pewnie b�d� pomaga� Magom Wody nam si� st�d wydosta�.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_10"); //W takim razie, powodzenia. Pami�taj, �e tutaj zawsze mo�esz wr�ci�.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_11"); //Masz tu kilka mikstur na drog�. Zrabowa�em je lata temu.
	//log
   
};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia� 4
// Ob�z bandyt�w oczami innych oboz�w
///////////////////////////////////////////////////////////////////////////////////////////

var int przyjaciel_Bandytow;
//========================================
//-----------------> CO_TY_TU_NAJMENIKU
//========================================

INSTANCE DIA_Quentin_CO_TY_TU_NAJMENIKU (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_CO_TY_TU_NAJMENIKU_Condition;
   information  = DIA_Quentin_CO_TY_TU_NAJMENIKU_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_CO_TY_TU_NAJMENIKU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_ZNANY_NAJEMNIK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_CO_TY_TU_NAJMENIKU_Info()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01"); //Co ty tu robisz, Najemniku?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_GUR"); //Guru? Tutaj? Co sprowadza kogo� takiego jak ty w to niego�cinne miejsce?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_KDW"); //Mag Wody w naszym Obozie? Co ci� tu sprowadza?
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_OTH"); //Czego szukasz w moim Obozie? 
	};
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_02"); //Przybywam z polecenia Doyle'a.
   // AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_03"); //Jak to?
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_04"); //Poprosi� mnie o sprawdzenie, co si� tu dzieje.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_05"); //Gdzie jest ten dure�?
   // AI_RemoveWeapon (self);
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_06"); //Uda� si� do Nowego Obozu, by wspom�c ludzi Lee w walce ze Stra�nikami.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_07"); //Torlof poprosi� go o pomoc, a ja mia�em zobaczy� czy wszystko u was w porz�dku.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_08"); //Dobrze, �e chocia� ty wykaza�e� si� zdrowym rozs�dkiem. Jak spotkasz Doyla, to powiedz mu, �eby przesta� b�aznowa� i wr�ci� do Obozu.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_09"); //Powiesz mi tak w og�le co si� tu wydarzy�o?
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_10"); //No wi�c poszli�my razem z Draxem i kilkoma dobrymi lud�mi w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_11"); //Chcieli�my pozby� si� cz�ci patroli, kt�re kr�ci�y si� w okolicy. Jednak zostali�my z�apani w zasadzk�, z kt�rej uda�o nam si� wyj�� ca�o.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_12"); //To ca�a historia.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_13"); //Tyle mi wystarczy. Ostatnio mam ju� tego du�o na g�owie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_14"); //Jeszcze jedno. W naszym Obozie mo�esz si� czu� bezpiecznie. Nikt nie b�dzie ci� tu gn�bi�. Czuj si� tu jak u siebie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_15"); //Gdyby� potrzebowa� ekwipunku, pogadaj z Martinem. 
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_16"); //Bywaj, Quentinie.
    przyjaciel_Bandytow = true;
    B_LogEntry                     (CH4_BanditsInTroubles,"Uda�em si� do Obozu Bandyt�w, gdzie spotka�em ich przyw�dc� - Quentina. Poprosi� mnie, abym przekaza� Doyle'owi, �e ma si� natychmiast pojawi� w Obozie.");

    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NegocjacieNc
//========================================

INSTANCE DIA_Quentin_NegocjacieNc (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_NegocjacieNc_Condition;
   information  = DIA_Quentin_NegocjacieNc_Info;
   permanent	= FALSE;
   description	= "Przyszed�em negocjowa�.";
};

FUNC INT DIA_Quentin_NegocjacieNc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_BRAK_LUDZI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_NegocjacieNc_Info()
{
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_01"); //Przyszed�em negocjowa�.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_02"); //Negocjowa�? 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_03"); //Przybywam z polecenia Lee. Mam ci z�o�y� propozycj�, w jego imieniu rzecz jasna.
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_04"); //Chcemy wznowi� wydobycie w opuszczonej kopalni, jednak nie mamy robotnik�w. 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_05"); //Lee obiecuje wam czwart� cz�� urobku w zamian za robotnik�w.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_06"); //Mam wys�a� moich ludzi do kopalni?
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_07"); //Ju� m�wi�em, �e czwart� wykopan� przez nich cz�� b�dziecie mogli zatrzyma�.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_08"); //No niech b�dzie. Wi�kszo�� tych obibok�w i tak �pi ca�y dzie�...
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_09"); //Powiedz Lee, �e wy�l� kilku ludzi, ale przy okazji b�dziesz musia� co� dla mnie zrobi�.
	AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_10"); //Co takiego? 
	AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_11"); //Przyprowad� do pracy w kopalni jakiego� do�wiadczonego g�rnika. Moi ludzie kompletnie si� na tym nie znaj�.
 
	
	Wld_InsertNpc				(NON_3040_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3042_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3044_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3045_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3030_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3031_Bandyta,"KOPACZ");
	Wld_InsertNpc				(NON_3032_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3038_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(NON_3037_Bandyta,"KOPACZ");	
	Wld_InsertNpc				(BAN_1615_Luis,"KOPACZ");//luis
	
	//zadanie
	MIS_NewEnginer = LOG_RUNNING;
    Log_CreateTopic            		(CH4_NewEnginer, LOG_MISSION);
    Log_SetTopicStatus       		(CH4_NewEnginer, LOG_RUNNING);
    B_LogEntry                     	(CH4_NewEnginer,"Quentin zgodzi� si� na propozycj� Lee. Przyw�dca Bandyt�w wy�le kilku swoich ludzi do kopalni, jednak poprosi� mnie w zamian o przys�ug�. Mam przyprowadzi� jakiego� kompetentnego cz�owieka, kt�ry pokieruje jego lud�mi. S�k w tym, �e najlepsi in�ynierowie byli w Starym Obozie... By� mo�e kt�ry� z nich zwia� do obozu na bagnie, b�d� musia� si� tam rozejrze�...");
    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// BAN_1610_Quentin
// Skrypt nauki broni jednor�cznej
///////////////////////////////////////////////////////////////////////////////////////////

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Quentin_START_TRAIN (C_INFO)
{
	npc			= BAN_1610_Quentin;
	nr			= 10;
	condition	= DIA_Quentin_START_TRAIN_Condition;
	information	= DIA_Quentin_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Quentin_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Quentin_KnowsNauka)) && (Npc_GetTrueGuild(hero) == GIL_BAU) 
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Quentin_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Quentin_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
	Info_AddChoice(DIA_Quentin_START_TRAIN,"Wr��",DIA_Quentin_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);
	
	
};

func void DIA_Quentin_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
	Info_AddChoice(DIA_Quentin_START_TRAIN,Dialog_Back,DIA_Quentin_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);

};



func void DIA_Quentin_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
	Info_AddChoice(DIA_Quentin_START_TRAIN,Dialog_Back,DIA_Quentin_START_TRAIN_BACK);

	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);


};

func void DIA_Quentin_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
};
//===========================================================================1.6.1==================================================
//-----------------> Trudna Przesz�os�
//========================================

INSTANCE DIA_Quentin_POSZUKIWACZE (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 19;
   condition    = DIA_Quentin_POSZUKIWACZE_Condition;
   information  = DIA_Quentin_POSZUKIWACZE_Info;
   permanent	= FALSE;
   description	= "Connor wspomina� �e pono�...";
};

FUNC INT DIA_Quentin_POSZUKIWACZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Connor_TP_START))
    && (Npc_GetTrueGuild(hero) == GIL_BAU)
	//&& (KHEND_QT == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_POSZUKIWACZE_Info()
{
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_01"); //Connor wspomina� �e pono� mia�e� do mnie jak�� spraw�.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_02"); //To prawda. Niedaleko naszego obozu zapu�ci�a si� grupa cieni zwiadowc�w. Trzeba ich pos�a� do piachu nim cokolwiek wyw�sz�. 
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_03"); //Wytypowa�em was do tego zadania. 
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_04"); //Ehh... jak nie jedno to dugie...
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_05"); //M�wi�e� co�...? No tak my�la�em, powodzenia.
	B_LogEntry                     (TrudnaPrzeszlosc,"Quentin powiedzia�, �e nieopodal obozu zauwa�ono grup� Cieni-maruder�w. Poleci� mi i Connorowi si� ich pozby�. Mo�e przy okazji zdob�d� jakie� informacje na jego temat.");	

};
//========================================
//-----------------> Trudna Przesz�os�
//========================================

INSTANCE DIA_Quentin_Cienie (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 19;
   condition    = DIA_Quentin_Cienie_Condition;
   information  = DIA_Quentin_Cienie_Info;
   permanent	= FALSE;
   description	= "Zwiadowcy ze starego obozu nie �yj�.";
};

FUNC INT DIA_Quentin_Cienie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Connor_Items))
    && (Npc_IsDead (Stt_40029_Zwiadowca))
	&& (Npc_IsDead (Stt_40030_Zwiadowca))
	&& (Npc_IsDead (Stt_40031_Zwiadowca))
	&& (Npc_IsDead (Stt_40134_Schatten))
	&& (Npc_IsDead (Stt_40135_Schatten))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Quentin_Cienie_Info()
{
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_01"); //Zwiadowcy ze starego obozu nie �yj�.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_02"); //Dobra robota. Stawili twardy op�r?
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_03"); //To cieniasy. Posz�o �atwo zw�aszcza, �e Connor to zdolny ch�opak.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_04"); //Dobrze. Nale�y si� wam nagroda. We� t� rud�.
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_05"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_06"); //Za chwil� wynagrodz� tak�e Connora.
	AI_Output (self, other ,"DIA_Quentin_Cienie_03_07"); //Jak b�d� ci� potrzebowa� to dam zna�.
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_08"); //Jasne.
	B_GiveInvItems (self,hero, ItMiNugget, 80);
	MIS_TP = LOG_SUCCESS;
    B_LogEntry         (TrudnaPrzeszlosc,"Zda�em raport Quentinowi. By� zadowolony i wyp�aci� mi nale�n� nagrod�.");	
	Log_SetTopicStatus (TrudnaPrzeszlosc, LOG_SUCCESS);
    B_GiveXP (250);
};

//--------------------------------------
//
//=========Korona Hrodgira
//
//--------------------------------------


//========================================
//-----------------> KH_Korona
//========================================

INSTANCE DIA_Quentin_KH_Korona (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_KH_Korona_Condition;
   information  = DIA_Quentin_KH_Korona_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_KH_Korona_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_BAU)
&& (MIS_ZL == LOG_SUCCESS)
&& (Kapitel < 4)
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_KH_Korona_Info()
{
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_01"); //Powinni�my pom�wi�.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_03"); //O pewnym cennym przedmiocie zwanym ,,Koron� Hrodgira�.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_04"); //Co to takiego? I kim by� Hrodgir?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_05"); //To niezwykle cenny artefakt. Nale�a� do jednego z tutejszych lord�w. By� pono� ow�adni�ty mani� posiadania korony na w�asno��.
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_06"); //Ws�awi� si� zar�wno ogromnym m�stwem w obronie Innosa jak i du�� pych� bo chodzi� w sporz�dzonej dla siebie koronie.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_07"); //Po co ci ta korona?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_08"); //Kiedy� Bariera upadnie. Wtedy m�g�bym odsprzeda� j� Paladynom w Khorinis albo Magom Ognia. W ko�cu Hrodgir by� obro�c� Innosa.
	AI_Teleport(BAN_40028_Connor,"WP_CONNOR_PSI");
};

//========================================
//-----------------> KH_Sekta
//========================================

INSTANCE DIA_Quentin_KH_Sekta (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_KH_Sekta_Condition;
   information  = DIA_Quentin_KH_Sekta_Info;
   permanent	= FALSE;
   description	= "Wszystko pi�knie i �adnie. Tylko gdzie szuka� tej korony.";
};

FUNC INT DIA_Quentin_KH_Sekta_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Quentin_KH_Korona))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_KH_Sekta_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KH_Sekta_15_01"); //Wszystko pi�knie i �adnie. Tylko gdzie szuka� tej korony.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_02"); //Poszlaki prowadz� do obozu Sekty. Pos�a�em tam ju� Connora na zwiady. Mia� si� czego� dowiedzie�.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_03"); //Udasz si� tam i do��czysz do niego. Potem dowiecie si� gdzie jest Korona Hrodgira i mi j� przyniesiecie. 
    AI_Output (other, self ,"DIA_Quentin_KH_Sekta_15_04"); //Hmm... Niech b�dzie ale nie robi� tego za darmo.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_05"); //Spokojnie, otrzymasz stosown� zap�at�.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_06"); //Id� do Sekty pogada� z Connorem.
	
	Npc_ExchangeRoutine(BAN_40028_Connor,"KH");
	Log_CreateTopic		(KoronaHrodgira,	LOG_MISSION);
	Log_SetTopicStatus	(KoronaHrodgira,	LOG_RUNNING);
	B_LogEntry               (KoronaHrodgira,"Quentin powiedzia� mi o tak zwanej koronie Hrodgira. To artefakt nale��cy ongi� do pot�nego paladyna. Chcia�by on j� zdoby�. Pono� maj� o niej informacj� ludzie z Sekty. Quentin wys�a� tam ju� Connora , mam do niego do��czy� i dowiedzie� si� wi�cej o koronie.");
};

//========================================
//-----------------> KH_END
//========================================

INSTANCE DIA_Quentin_KH_END (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_KH_END_Condition;
   information  = DIA_Quentin_KH_END_Info;
   permanent	= FALSE;
   description	= "Uda�o nam si� zdoby� te przekl�t� koron�.";
};

FUNC INT DIA_Quentin_KH_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Connor_KH_GOTCrown))
&& (Npc_HasItems (other, ItHe_Hrodgir) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_KH_END_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_01"); //Uda�o nam si� zdoby� te przekl�t� koron�.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_02"); //Znakomicie.
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_03"); //Oto ona.
	B_GiveInvItems (other,self, ItHe_Hrodgir, 1);
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_04"); //A to twoja zap�ata, zaraz i Connor dostanie swoj� cz��.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_05"); //Jak uda�o si� wam j� zdoby�?
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_06"); //Zaliczyli�my bli�sze spotkanie z przero�ni�tym z�baczem oraz z samym Hrodgirem reszt� jego bandy...
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_07"); //To on �y�?
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_08"); //I tak i nie. Zapewne pad� ofiar� kl�twy. Wraz ze swoimi lud�mi.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_09"); //C�, ciekawa historia. Szcz�cie wam sprzyja�o, �e jakims cudem wyszliscie z tego ca�o.
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_10"); //Racja, na mnie ju� pora. 
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_11"); //Wkr�tce b�d� mia� dla Ciebie kolejn� spraw� do za�atwienia. Masz talent ch�opcze. 
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_12"); //Chyba do pakowania si� w k�opoty... Do zobaczenia.
	B_LogEntry               (KoronaHrodgira,"Wr�ci�em do obozu i przekaza�em koron� Hrodgira Quentinowi. By� niezwykle uradowany i wyp�aci� mi nale�n� rud�.");
	//TP_START_Day = Wld_GetDay();
	CreateInvItem (BAN_40028_Connor, ItMw_1h_hammer_100);
	AI_EquipBestMeleeWeapon	(BAN_40028_Connor);                    
	MIS_KoronaHrodgira = LOG_SUCCESS;
	Log_SetTopicStatus	(KoronaHrodgira,LOG_SUCCESS);
	B_GiveXP(500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL
//========================================

INSTANCE DIA_Quentin_ZL (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_ZL_Condition;
   information  = DIA_Quentin_ZL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_ZL_Condition()
{
if (Kapitel == 2)
&& (Npc_GetTrueGuild(hero) == GIL_BAU)
&& (MIS_TP == LOG_SUCCESS)
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_ZL_Info()
{
    AI_Output (self, other ,"DIA_Quentin_ZL_03_01"); //Zauwa�y�em co� niepokoj�cego.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_02"); //Co takiego?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_03"); //Paru moich ludzi znikn�o ostatnio w dziwnych okoliczno�ciach.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_04"); //Mo�e udali si� na misj� i zgin�li?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_05"); //S�k w tym, �e nie... Wieczorem ka�dy z nich z osobna by� w obozie a rano ju� go nie by�o.
    AI_Output (self, other ,"DIA_Quentin_ZL_03_06"); //To dzieje si� ju� od kilku tygodni. 
    AI_Output (other, self ,"DIA_Quentin_ZL_15_07"); //Co proponujesz?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_08"); //Miej oczy i uszy otwarte. Wybadaj czy nie dzieje si� co� dziwnego w obozie.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_09"); //W porz�dku. Zajm� si� tym.
	Log_CreateTopic		(ZnikajacyLudzie,	LOG_MISSION);
	Log_SetTopicStatus	(ZnikajacyLudzie,	LOG_RUNNING);
	B_LogEntry               (ZnikajacyLudzie,"Quentin zauwa�y� co� niepokoj�cego. Jego ludzie zacz�li znika� w tajemniczych i budz�cych w�tpliwo�ci okoliczno�ciach. Poleci� mi bym by� wyczulony i stara� si� wybada� wszystko co podejrzane.");
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> ZL_IKNOW
//========================================

INSTANCE DIA_Quentin_ZL_IKNOW (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_ZL_IKNOW_Condition;
   information  = DIA_Quentin_ZL_IKNOW_Info;
   permanent	= FALSE;
   description	= "Wiem co dzia�o si� ze znikaj�cymi lud�mi.";
};

FUNC INT DIA_Quentin_ZL_IKNOW_Condition()
{
if (Npc_HasItems (other, ItWr_ZL_Book) >=1) 
&& (VictorBook == TRUE)
&& (Npc_IsDead (BAN_40067_Victor))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_ZL_IKNOW_Info()
{
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_01"); //Wiem co dzia�o si� ze znikaj�cymi lud�mi.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_02"); //Doprawdy? Co takiego?
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_03"); //Mordowa� ich ten pajac Victor i sk�ada� w ofierze jakiemu� b�stwu. 
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_04"); //A masz na to jaki� dow�d?
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_05"); //Jego dziennik.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_06"); //A to sukinsyn! Gdzie on jest?!
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_07"); //Ju� go zabi�em. Wi�c trafi� ju� gdzie chcia� czyli do Beliara.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_08"); //Szkoda bo ukatrupi�bym go osobi�cie.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_09"); //Tak czy siak �wietnie ci posz�o. Rozwi�za�e� t� zagadk� i ocali�e� od �mierci nast�pnych moich ludzi a mo�e i mnie samego.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_10"); //We� t� nagrod�. Jest twoja.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Health_03, 3);
	B_GiveInvItems (self,other, ItAt_Snapper_Skin, 2);
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_11"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_12"); //Zdolniacha z ciebie m�ody.
	MIS_ZL = LOG_SUCCESS;
	B_LogEntry               (ZnikajacyLudzie,"Poszed�em do Quentina i powiedzia�em, �e to Victor mordowa� jego ludzi. Na dow�d da�em jego dziennik. Quentin by� rozw�cieczony ale i zadowolony, �e ta sprawa nie przybierze wi�kszych rozmiar�w. Wynagrodzi� mnie nale�ycie za wykonanie misji.");
	Log_SetTopicStatus	(ZnikajacyLudzie,	LOG_SUCCESS);
	Log_SetTopicStatus	(KsiegaDlaVictora,	LOG_SUCCESS);
	B_GiveXP(380);
};


//========================================
//-----------------> ZL_VICTORBOOK
//========================================

INSTANCE DIA_Quentin_ZL_VICTORBOOK (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_ZL_VICTORBOOK_Condition;
   information  = DIA_Quentin_ZL_VICTORBOOK_Info;
   permanent	= FALSE;
   description	= "Mam co� co ci� zainteresuje.";
};

FUNC INT DIA_Quentin_ZL_VICTORBOOK_Condition()
{
if (Npc_HasItems (other, ItWr_ZL_Sattik) >=1) 
&& (SattikBook ==TRUE)
&& (!Npc_KnowsInfo(hero,DIA_Victor_ZL_PRAY))
&& (Npc_KnowsInfo(hero,DIA_PC_MAGE_ZL_TRANSLATE))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_ZL_VICTORBOOK_Info()
{
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_01"); //Mam co� co ci� zainteresuje.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_03"); //T� ksi�g�. Victor chcia� bym j� dla niego zdoby�.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_04"); //Poka�.
	B_GiveInvItems (other,self, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_05"); //Ale to jaki� nieznany mi j�zyk...
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_06"); //To prastary demoniczny dialekt. Pisz� w nim o z�o�eniu ofiary z cz�owieka dla b�stwa imieniem Sattik.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_07"); //Cholera... Ka�� natychmiast przes�ucha� i przeszuka� Victora!
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_08"); //I prawid�owo. On co� ewidentnie ukrywa.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_09"); //Przyjd� do mnie jutro a dowiesz si� co dalej z Victorem.
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_10"); //Dobra.
	  Npc_ExchangeRoutine(BAN_1609_Smith,"VICTOR");
	  Npc_ExchangeRoutine(BAN_1605_Rocky,"VICTOR");
	QuentinZL_Day<=(Wld_GetDay()-1); 
	B_LogEntry               (ZnikajacyLudzie,"Uda�em si� do Quentina i da�em mroczn� ksi�g� Victora. Wyja�ni�em, �e chodzi o jego dziwne zachowanie. Quentin poleci� go przes�ucha� i przeszuka�. Mam si� do niego zg�osi� jutro.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_NDAY
//========================================

INSTANCE DIA_Quentin_ZL_NDAY (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_ZL_NDAY_Condition;
   information  = DIA_Quentin_ZL_NDAY_Info;
   permanent	= FALSE;
   description	= "No i co ze spraw� Victora?";
};

FUNC INT DIA_Quentin_ZL_NDAY_Condition()
{
if (!Npc_KnowsInfo(hero,DIA_Victor_ZL_PRAY))
&& (Npc_KnowsInfo(hero,DIA_Quentin_ZL_VICTORBOOK))
&& (QuentinZL_Day<=(Wld_GetDay()-1)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_ZL_NDAY_Info()
{
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_01"); //No i co ze spraw� Victora?
	
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_02"); //Znale�li�my przy nim jego dziennik. Ten bydlak zarzyna� naszych ludzi i sk�ada� w ofierze jakiemu� mrocznemu bo�kowi!
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_03"); //Dzi�ki tobie nie zabije ju� nikogo.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_04"); //A co si� z nim dzieje?
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_05"); //Moi ludzie poszatkowali tego odszczepie�ca,i dos�ownie chwil� temu.
	B_KillNpc(BAN_40067_Victor); 
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_06"); //Jeden pajac mniej...
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_07"); //Teraz czas na przyjemniejsze rzeczy. Wy�wiadczy�e� nam du�� przys�ug�.
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_08"); //We� to w nagrod�.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Health_03, 3);
	B_GiveInvItems (self,other, ItAt_Snapper_Skin, 2);
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_09"); //Niedosz�e ofiary Victora powinny by� ci wdzi�czne.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_10"); //Dzi�ki, Kto wie kogo spr�bowa�by zaszlachtowa� i z�o�y� w ofierze.
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_11"); //Mo�e nawet mnie. Dzi�ki za pomoc.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_12"); //Zrobi�em to co powinienem. 
	 AI_StandUp( BAN_40067_Victor );
    Npc_ExchangeRoutine(BAN_1609_Smith,"start");
	Npc_ExchangeRoutine(BAN_1605_Rocky,"start");
	MIS_ZL = LOG_SUCCESS;
	B_LogEntry               (ZnikajacyLudzie,"Quentin powiedzia� mi, �e odnaleziono przy Victorze jego dziennik, z kt�rego wynika, �e mordowa� ludzi Quentina i sk�ada� ich w ofierze b�stwu. Quentin kaza� go niezw�ocznie zabi� za to co robi�. Mnie za� sowiecie wynagrodzi� za rozwi�zanie zagadki znikaj�cych ludzi.");
	B_GiveXP(800);
	Log_SetTopicStatus	(ZnikajacyLudzie,	LOG_SUCCESS);
	Log_SetTopicStatus	(KsiegaDlaVictora,	LOG_SUCCESS);
};



//========================================
//-----------------> TMQ_NO
//========================================

INSTANCE DIA_Quentin_TMQ_NO (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TMQ_NO_Condition;
   information  = DIA_Quentin_TMQ_NO_Info;
   permanent	= FALSE;
   description	= "Pono� szykujesz si� do wa�nej misji.";
};

FUNC INT DIA_Quentin_TMQ_NO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Rocky_TMQ_MISSION))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_NO_Info()
{
    AI_Output (other, self ,"DIA_Quentin_TMQ_NO_15_01"); //Pono� szykujesz si� do wa�nej misji.
    AI_Output (self, other ,"DIA_Quentin_TMQ_NO_03_02"); //Tak. To prawda.
    AI_Output (other, self ,"DIA_Quentin_TMQ_NO_15_03"); //Co to za misja?
    AI_Output (self, other ,"DIA_Quentin_TMQ_NO_03_04"); //Na razie wola�bym tego nie zdradza�.
	
};

//========================================
//-----------------> TMQ_LO
//========================================

INSTANCE DIA_Quentin_TMQ_LO (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_TMQ_LO_Condition;
   information  = DIA_Quentin_TMQ_LO_Info;
   permanent	= FALSE;
   description	= "Udowodni�em ju� swoj� warto�� i lojalno��.";
};

FUNC INT DIA_Quentin_TMQ_LO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_TMQ_NO))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_LO_Info()
{
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_01"); //Udowodni�em ju� swoj� warto�� i lojalno��. Mo�esz mi powiedzie� co to za zadanie.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_02"); //No dobrze. Wkr�tce wyrusz� poza ob�z w bardzo wa�nej intencji.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_03"); //Udam si� do Nowego Obozu na narad�. B�d� w niej uczestniczy� Lee, jego najlepsi Najemnicy oraz ja.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_04"); //Rozumiem. Nie zabierasz ze sob� jakiej� obstawy?
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_05"); //My�la�em o tym ale to za bardzo rzuca�oby si� w oczy gdybym zabra� ze sob� oddzia� Bandyt�w.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_06"); //Dlatego p�jd� sam w przebraniu Cienia. 
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_07"); //Oby ci si� poszcz�ci�o.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_08"); //Mam tak� nadzieje. W czasie mojej nieobecno�ci ty i Rocky staniecie na czele Bandyt�w.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_09"); //To spore wyr�nienie.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_10"); //Licz�, �e mu sprostacie. 
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_11"); //Ja tymczasem b�d� si� przygotowywa� do wyprawy. Wyruszam ju� zaraz.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_12"); //Powodzenia.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_13"); //Dzi�ki.
	Npc_ExchangeRoutine(self,"TMQ1");
	Quentin_TMQ_Day = Wld_GetDay();
	B_LogEntry               (TajnaMisjaQuentina,"Quentin powiedzia�, �e wybiera si� do Nowego Obozu by stawi� si� na naradzie z Najemnikami. W tym czasie ja i Rocky mamy stan�� na czele Bandyt�w. Quentin za chwil� opu�ci ob�z.");
	//Npc_ExchangeRoutine(self,"Start");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TMQ_BLOOD
//========================================

INSTANCE DIA_Quentin_TMQ_BLOOD (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TMQ_BLOOD_Condition;
   information  = DIA_Quentin_TMQ_BLOOD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_TMQ_BLOOD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Aidan_TMQ_BOSS))
&& (Npc_IsDead (Grd_40075_Gardist))
&& (Npc_IsDead (Grd_40076_Gardist))
&& (Npc_IsDead (Grd_40077_Gardist))
&& (Npc_IsDead (Grd_40078_Gardist))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_BLOOD_Info()
{
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_01"); //No... W Sam� por�!
    AI_Output (other, self ,"DIA_Quentin_TMQ_BLOOD_15_02"); //C� postanowili�my zak��ci� t� imprez�. Bo widz�, �e nie dla wszystkich uk�ada�a si� po my�li!
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_03"); //Dobra, do�� tych �art�w. Potrzebuje napoju uzdrawiaj�cego.
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_04"); //Oberwa�em gdy mnie pojmali a potem mnie zaci�gn�li tu si�� wi�c upu�cili mi troch� krwi...
	CreateInvItem (hero, ItFo_Potion_Health_01);
	B_ChangeGuild    (Ban_1610_Quentin,GIL_BAU);
   B_LogEntry               (TajnaMisjaQuentina,"Uratowali�my Quentina. Zosta� do�� mocno pobity przez Stra�nik�w. Poprosi� mnie o nap�j uzdrawiaj�cy.");
};

//========================================
//-----------------> TMQ_POTION
//========================================

INSTANCE DIA_Quentin_TMQ_POTION (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 2;
   condition    = DIA_Quentin_TMQ_POTION_Condition;
   information  = DIA_Quentin_TMQ_POTION_Info;
   permanent	= FALSE;
   description	= "Masz ten nap�j uzdrawiaj�cy.";
};

FUNC INT DIA_Quentin_TMQ_POTION_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Quentin_TMQ_BLOOD))
&& (Npc_HasItems (other, ItFo_Potion_Health_01) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_POTION_Info()
{
    AI_StandUp(BAN_1610_Quentin); 
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_01"); //Masz ten nap�j uzdrawiaj�cy.
	B_GiveInvItems (other,self, ItFo_Potion_Health_01, 1);
	AI_UseItem (self, ItFo_Potion_Health_01);
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_02"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_03"); //Teraz niech Rocky wr�ci do obozu i przejmie dow�dztwo. A ja i ty ruszamy do Nowego Obozu na narad� z Najemnikami.
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_04"); //W porz�dku. Zatem chod�my. 
	Npc_ExchangeRoutine(self,"TMQNO");
	Npc_ExchangeRoutine(BAN_1605_Rocky,"Start");
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_05"); //Na pewno czekaj� ju� na nas. A ja nie lubi� si� sp�nia�. 
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_06"); //Zamiast narady trafi�e� prawie na sw�j pogrzeb.
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_07"); //S�uchaj no... A mniejsza... Za mn�.
	B_LogEntry (TajnaMisjaQuentina,"Quentin poleci� mi bym uda� si� z nim do Nowego Obozu na narad�. W tym czasie Rocky ma zarz�dza� Bandytami.");
	
	 Info_ClearChoices	(DIA_Quentin_TMQ_POTION);
     Info_AddChoice		(DIA_Quentin_TMQ_POTION, "(Szybka podr� - Do Lee)", DIA_Quen_TMQ_FastTravel);
	
   // AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quen_TMQ_FastTravel()
{
 
	Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    Npc_ExchangeRoutine (BAN_1610_Quentin,"TMQNO");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(BAN_1610_Quentin,"NC_SMALL_CAVE_CENTER");
	AI_Teleport(hero,"NC_SMALL_CAVE_CENTER");

};
//========================================
//-----------------> TMQ_SO
//========================================

INSTANCE DIA_Quentin_TMQ_SO (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TMQ_SO_Condition;
   information  = DIA_Quentin_TMQ_SO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Quentin_TMQ_SO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_TMQ_FLORIAN))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_SO_Info()
{
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_01"); //Czyli wyruszasz do Starego Obozu.
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_02"); //Tak.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_03"); //Do gniazda gdzie rezyduje ta �mija Gomez. Musisz mie� du�o szcz�cia je�li chcesz wyj�� z tego �ywy.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_04"); //Ale ju� nie raz udowodni�e�, �e stworzono ci� do wielkich zada�.
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_05"); //Musze temu sprosta�.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_06"); //Ja tymczasem wracam do naszego obozu.
	Npc_ExchangeRoutine(self,"Start");
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_07"); //Wszyscy Bandyci b�d� trzyma� za ciebie kciuki.
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_08"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_09"); //Powodzenia, przyjacielu...
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_10"); //Spokojnie...
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_11"); //Ahh... Spieprzaj ju�...
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_12"); //Odrazu lepiej.
	B_LogEntry(TajnaMisjaQuentina,"Quentin �yczy� mi powodzenia przed wypraw� do Starego Obozu. Teraz ma powr�ci� do obozu Bandyt�w i zn�w mu przewodzi�.");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> TMQ_END
//========================================

INSTANCE DIA_Quentin_TMQ_END (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 1;
   condition    = DIA_Quentin_TMQ_END_Condition;
   information  = DIA_Quentin_TMQ_END_Info;
   permanent	= FALSE;
   description	= "Mag Gomeza ju� nie �yje.";
};

FUNC INT DIA_Quentin_TMQ_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jim_TMQ_HI))
&& (Npc_IsDead (STT_40149_Jim))
{
    return TRUE;
};
};
FUNC VOID DIA_Quentin_TMQ_END_Info()
{
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_01"); //Mag Gomeza ju� nie �yje.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_02"); //Czyli poradzi�e� sobie.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_03"); //Zgadza si�.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_04"); //Jestem pod wra�eniem.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_05"); //Masz talent. A poza tym jakie� nadnaturalne si�y zdaj� ci si� sprzyja�.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_06"); //No nie wiem...
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_07"); //We� to w nagrod�, zosta�o z ostatniego napadu. Jak nikt zas�u�y�e� na to a nawet i na wi�ksze splendory.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItMi_JeweleryChest_03, 3);
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_08"); //Dzi�kuje.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_09"); //Czuje, �e wkr�tce to wszystko si� sko�czy.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_10"); //A tymczasem trzymaj si�. Na pewno masz du�o do roboty.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_11"); //Na razie.
	B_LogEntry(TajnaMisjaQuentina,"Quentin pogratulowa� mi sukcesu w misji z Jimem i o�ywie�cami. Wyp�aci� mi te� sowit� nagrod�.");
	Log_SetTopicStatus	(TajnaMisjaQuentina,LOG_SUCCESS);
	B_GiveXP(1000);
    AI_StopProcessInfos	(self);
};

instance dia_quentin_pickpocket(c_info) {
    npc = ban_1610_quentin;
    nr = 900;
    condition = dia_quentin_pickpocket_condition;
    information = dia_quentin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_quentin_pickpocket_condition() {
	e_beklauen(baseThfChanceORG - 10, 40);
};

func void dia_quentin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_quentin_pickpocket);
	info_addchoice(dia_quentin_pickpocket, dialog_back, dia_quentin_pickpocket_back);
	info_addchoice(dia_quentin_pickpocket, dialog_pickpocket, dia_quentin_pickpocket_doit);
};

func void dia_quentin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_quentin_pickpocket);
};

func void dia_quentin_pickpocket_back() {
    info_clearchoices(dia_quentin_pickpocket);
};

