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
// Rozdzia³ 1
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
   description	= "Ty tu rz¹dzisz?";
};

FUNC INT DIA_Quentin_WLADZA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Quentin_WLADZA_Info()
{
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_01"); //Ty tu rz¹dzisz?
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_02"); //Wchodzisz tak po prostu do mojego Obozu i pytasz mnie czy tu rz¹dzê, tak?
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_03"); //Jakby nie patrzeæ... to tak. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_04"); //Powiedzia³bym, ¿e jesteœ cholernie bezczelny...
    AI_Output (other, self ,"DIA_Quentin_WLADZA_15_05"); //...albo odwa¿ny.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_06"); //Nie... bezczelny. 
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_07"); //Powiem ci tylko, ¿e nazywam siê Quentin i dowodzê w tym Obozie.
    AI_Output (self, other ,"DIA_Quentin_WLADZA_03_08"); //Tyle informacji powinno ci wystarczyæ.
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Quentin_KnowsNauka_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Quentin_KnowsNauka_Info()
{
    AI_Output (other, self ,"DIA_Quentin_KnowsNauka_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Quentin_KnowsNauka_03_02"); //Mogê ciê nauczyæ walki broni¹ jednorêczn¹. Oczywiœcie nie za darmo. No i musisz te¿ nale¿eæ do Bandy.

	if (log_Quenfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherBAN,LOG_NOTE);
		B_LogEntry			(GE_TeacherBAN,"Gdy zostanê Bandyt¹, Quentin za kilka bry³ek rudy nauczy mnie walki jednorêcznym orê¿em.");
		log_Quenfight = TRUE;
	};
	};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
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
   description	= "Przysy³a mnie Drax.";
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
    AI_Output (other, self ,"DIA_Quentin_DRAX_15_01"); //Przysy³a mnie Drax. Uzna³ mnie za Bandytê i pokaza³ drogê do Obozu. Udowodni³em swoj¹ lojalnoœæ wykonuj¹c dla niego zadania.
    AI_Output (self, other ,"DIA_Quentin_DRAX_03_02"); //Co? Drax przyj¹³ kogoœ nowego bez mojej wiedzy?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_03"); //Powiedzia³, ¿e zas³ugujê na wasze zaufanie. Kaza³ mi siê zg³osiæ po rynsztunek. Jestem gotowy do pracy.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_04"); //Nie móg³ mnie tu przyprowadziæ od razu. W koñcu wasz Obóz jest ukryty. 
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_05"); //Kaza³ ci coœ przekazaæ?
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_06"); //Có¿, wydarzy³o siê kilka interesuj¹cych rzeczy...
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_07"); //Mów, wszystko mo¿e mieæ znaczenie.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_08"); //Stra¿nikom prawie uda³o siê ustaliæ miejsce po³o¿enia waszego Obozu. Niejaki Trip sporz¹dzi³ notatkê na ten temat. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_09"); //Na jej podstawie Kopacz Graham rozrysowa³ potencjaln¹ mapê, która trafi³a w rêce Stra¿ników z placu wymian. Chcieli j¹ wykorzystaæ do planowania obrony.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_10"); //Zdoby³em obydwa te dokumenty. S¹ teraz w rêkach Draxa. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_11"); //Jeden z waszych ludzi, niejaki Skaza mia³ powa¿ne problemy w Starym Obozie. Tamtejsi Cienie chcieli go wygryŸæ. Dziêki mojej drobnej pomocy stali siê nieszkodliwi. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_12"); //W zamian otrzyma³em od Skazy raport. Stra¿nicy œwi¹tynni pomagaj¹ ludziom Gomeza zabijaæ pe³zacze w Starej Kopalni. Szukaja tam czegoœ zwi¹zanego z ich chor¹ religi¹.
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_13"); //Josh nie ¿yje. Ian dowiedzia³ siê o jego machlojkach i kaza³ go zabiæ. Zanim go pojmali uda³o mi siê odnaleŸæ rudê, któr¹ zdoby³ do tej pory. 
	AI_Output (other, self ,"DIA_Quentin_DRAX_15_14"); //Jest tego 450 bry³ek rudy. By³o wiêcej, ale pewien Kopacz wszed³ w posiadanie tej sakwy i wykorzysta³ czêœæ rudy. Goœæ ju¿ gryzie piach. Oto sakiewka.
	AI_Output (self, other ,"DIA_Quentin_DRAX_03_15"); //Doœæ, wystarczy... Jestem pod olbrzymim wra¿eniem. Drax podj¹³ dobr¹ decyzjê. Daj mi chwilê pomyœleæ. Musimy podj¹æ odpowiednie dzia³ania.
	
	
    //B_LogEntry                     (CH1_BANDITOS_CAMP,"Uda³o mi dostaæ siê do Quentina. Zanim zostanê przyjêty, muszê wykonaæ kilka zadañ i przy okazji poprawiæ swoj¹ opiniê w Obozie.");
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
   description	= "Jens jest zabójc¹.";
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
    AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_01"); //Jens jest zabójc¹.
    AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_02"); //O czym ty do cholery mówisz?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_03"); //Pomog³em ustaliæ Kerethowi kto zabi³ jego brata. Okaza³o siê, ¿e to Jens.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_04"); //Sk³adasz doœæ powa¿ne oskar¿enia. Musisz mieæ wiêc twarde dowody. Hmm?
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_05"); //Na miejscu zbrodni i w pobli¿u regularnie niszczonego grobu znalaz³em od³amki miecza, który Pun sprzeda³ kiedyœ Jensowi.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_06"); //Ostrze pokruszy³o siê, gdy Jens niszczy³ grób. Zrobi³ to, bo ma na pieñku z Kerethem...
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_07"); //Tak siê sk³ada, ¿e przed chwil¹ rozmawia³em z Jensem. Przedstawi³ mi swój punkt widzenia.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_08"); //Pewnie powiedzia³ ci, ¿e ktoœ mu ukrad³ miecz. Zgad³em? 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_09"); //Dok³adnie to powiedzia³.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_10"); //Wierzysz w to?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_11"); //A niby dlaczego mia³bym nie wierzyæ? Kereth to niez³y krêtacz i wszyscy w Obozie dobrze o tym wiedz¹.
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_12"); //Myœlê, ¿e tym razem Kereth ma racjê.
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_13"); //I niestety siê mylisz... Jens przedstawi³ kilka innych dowodów. Mianowicie, zarówno Doyle jak i jego zmiennik poœwiadczyli, ¿e Jens nie opuszcza³ obozu w dniach, w których dokonano zbezczeszczenia grobu. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_14"); //Po drugie, Smith stwierdzi³, ¿e w przeddzieñ zabójstwa by³ u niego Jens i prosi³ o pomoc w odszukaniu miecza. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_15"); //Po trzecie, Briam widzia³ jak Kereth chowa miecz Jensa do swojej skrzyni uprzednio oczyszczaj¹c go z ziemi. 
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_16"); //To by³a zwyczajna intryga, ch³opcze. Po prostu da³eœ siê oszukaæ. Jesteœ m³ody, wiêc pewnie nie pierwszy i nie ostatni raz. 
	AI_Output (other, self ,"DIA_Quentin_JensIsKiller_15_17"); //W takim razie kto zabi³ Rayana?
	AI_Output (self, other ,"DIA_Quentin_JensIsKiller_03_18"); //Nie mam pojêcia. Pewnie nigdy siê tego nie dowiemy. 
	
	MIS_DestroyedGrave = LOG_FAILED;

    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_FAILED);
    B_LogEntry               (CH1_DestroyedGrave,"Okaza³o siê, ¿e zosta³em oszukany przez Keretha. Jens by³ niewinny i Quentin przedstawi³ mi na to dowody. Kereth porpostu chcia³ siê pozbyæ Jensa z obozu i najpewniej zaj¹æ jego stanowisko. Chyba policzê siê z tym oszustem.");
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
   description	= "Co bêdzie z Kerethem?";
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
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_01"); //Co bêdzie z Kerethem?
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_02"); //Badam t¹ sprawê. Póki co pewne jest, ¿e chcia³ wrobiæ Jensa w zabójstwo by go wykurzyæ. 
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_03"); //Ale nie wiadomo jeszcze czy to on jest mordec¹.
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_04"); //Co z nim bêdzie?
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_05"); //Póki co straci wiêkszoœæ swojej rudy w ramach kary.
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_06"); //Ale jeœli to on jest morderc¹ wówczas czeka go bezw³oczna egzekucja.
    AI_Output (other, self ,"DIA_Quentin_WhatIsKereth_15_07"); //Twarde prawo w twardych czasach. Chyba s³usznie. 
    AI_Output (self, other ,"DIA_Quentin_WhatIsKereth_03_08"); //Tylko tak Bandyci pozostan¹ zwart¹ grup¹, która ma jak¹kolwiek przysz³oœæ.
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
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_01"); //Ustaliliœmy co sta³o za œmierci¹ Rayana. 
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_02"); //Jak to zrobiliœcie?
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_03"); //Connor znalaz³ ma³¹ skrzynkê zakopan¹ w ziemi. 
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_04"); //Poœród paru niezbyt cennych w rudzie przedmiotów by³a tam kartka.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_05"); //Rayan napisa³ tam, ¿e ma doœæ Kolonii, straci³ nadzieje na wolnoœæ i szczêœliwe ¿ycie.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_06"); //Dalej napisa³, ¿e wbije sobie sztylet.
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_07"); //Zatem Kereth nie zabi³ swojego brata.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_08"); //A¿ takim bydlakiem nie jest. Ale postanowi³ wykorzystaæ t¹ œmieræ i wrobiæ Jensa.
    AI_Output (self, other ,"DIA_Quentin_QuenKnowKereth_03_09"); //Równoczeœnie ukry³ tamt¹ skrzynkê z pami¹tkami po zmar³ym bracie.
    AI_Output (other, self ,"DIA_Quentin_QuenKnowKereth_15_10"); //Teraz historia uk³ada siê w logiczn¹ ca³oœæ. Dziêki za informacjê.
	    Log_SetTopicStatus       (CH1_DestroyedGrave, LOG_SUCCESS);
	B_LogEntry               (CH1_DestroyedGrave,"Okaza³o siê ¿e Rayan pope³ni³ samobójstwo, mia³ ju¿ dosyæ kolonii. Jego brat Kereth wykorzysta³ tê sytuacjê by wrobic Jensa w jego zabójstwo. Trzeba mieæ tupet...");
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
   description	= "Czy dostanê broñ i pancerz?";
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
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_01"); //Czy dostanê broñ i pancerz? 
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_02"); //Tak. Proszê, oto one.
    AI_Output (self, other ,"DIA_Quentin_EQ1_03_03"); //To jedyna broñ jak¹ ci fundujemy. Na lepszy orê¿ bêdziesz musia³ sam sobie zapracowaæ. Pamiêtaj, ¿e z czasem musisz go zmieniaæ.
    AI_Output (other, self ,"DIA_Quentin_EQ1_15_04"); //Dziêki. Na pewno nie zapomnê.
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
   description	= "Potrzebujê lepszego pancerza.";
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
    AI_Output (other, self ,"DIA_Quentin_EQ2_15_01"); //Potrzebujê lepszego pancerza.
	if (kapitel >= 3)
	{
	if (Npc_HasItems (hero, ItMiNugget)>=1800)
	{
    AI_Output (self, other ,"DIA_Quentin_EQ2_03_02"); //To dobry pancerz. Zas³u¿y³eœ na niego.
    B_GiveInvItems (hero, self, ItMiNugget, 1800);
    CreateInvItems (self, BAU_ARMOR_M, 1);
    B_GiveInvItems (self, other, BAU_ARMOR_M, 1);
	AI_EquipBestArmor	(hero); 
	DIA_Quentin_EQ2.permanent = 0;
	pancerooo = true;
	}
	else
	{
	 AI_Output (self, other ,"DIA_Quentin_EQ2_03_03"); //Taki pancerz to nie byle co. Kosztuje 1800 bry³ek rudy. 
	 DIA_Quentin_EQ2.permanent = 1;
	};
	
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_EQ2_03_04"); //Nie zas³u¿y³eœ jeszcze na ten pancerz.
	DIA_Quentin_EQ2.permanent = 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
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
   description	= "Co mam teraz robiæ?";
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
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_01"); //Co mam teraz robiæ?
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_02"); //Chyba bêdziemy musieli zaj¹æ siê tym Bractwem. Ta sprawa jest niepokoj¹ca. Ale zanim porz¹dnie weŸmiemy siê do roboty, to popracujesz trochê tutaj.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_03"); //Powiedzia³eœ, ¿e Stra¿nicy z placu wymian chcieli wykorzystaæ mapê od tego Grahama do zaplanowania obrony... Dobrze, zobaczymy jak im to posz³o.
    AI_Output (self, other ,"DIA_Quentin_QUEST4_03_04"); //IdŸ do Doyla. Pójdziecie razem na plac wymian i podenerwujecie ludzi Gomeza. Rabuj¹c, przegl¹daj skrzynie i zwa¿aj na wszelkie dokumenty jakie w nich znajdziesz. 
	AI_Output (self, other ,"DIA_Quentin_QUEST4_03_05"); //Jeœli coœ znajdziesz, przynieœ do mnie. Zapamiêtasz?
    AI_Output (other, self ,"DIA_Quentin_QUEST4_15_06"); //Jasne.

    MIS_AttackOnPlace = LOG_RUNNING;

    Log_CreateTopic          (CH1_Rozpierdol1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_RUNNING);
    B_LogEntry               (CH1_Rozpierdol1,"Razem z Doylem mamy wybraæ siê na plac wymian, ¿eby podenerwowaæ ludzi Gomeza. Doyle'a znajdê przy bramie do Obozu Bandytów. Podczas rabunku mam szukaæ dokumentów, które mog¹ le¿eæ w skrzyniach b¹dŸ przy Stra¿nikach.");
	
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
   description	= "Byliœmy z Doyle'm na placu wymian.";
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
	
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_01"); //Byliœmy z Doyle'm na placu wymian.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_02"); //To œwietnie! Jak posz³o? Znalaz³eœ dokumenty?

    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_03"); //Tak, weŸ je. Co teraz mam robiæ?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_04"); //Wys³a³em ju¿ jednego z naszych do Bractwa jako szpiega.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_05"); //Powinien wkrótce wróciæ. Tymczasem mam dla ciebie jeszcze jedno zadanie.
    AI_Output (other, self ,"DIA_Quentin_UKONCZONE_15_06"); //Co tym razem?
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_07"); //Podobno Gomez wysy³a jakiœ transport do Starej Kopalni.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_08"); //Myœlê, ¿e to dobra okazja na atak.
    AI_Output (self, other ,"DIA_Quentin_UKONCZONE_03_09"); //Rocky zajmuje siê t¹ akcj¹. IdŸ do niego i powiedz, ¿e kaza³em ci mu pomóc.
	
	DIA_Quentin_UKONCZONE.permanent = false;
	MIS_CH1ConvoyAttack = LOG_RUNNING;
    MIS_AttackOnPlace = LOG_SUCCESS;
	
	
	B_LogEntry               (CH1_Rozpierdol1,"Poinformowa³em Quentina o pomyœlnie przeprowadzonym ataku i odda³em mu dokumenty.");
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
  
	Log_CreateTopic          (CH1_ConvoyAttack, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ConvoyAttack, LOG_RUNNING);
    B_LogEntry               (CH1_ConvoyAttack,"Tym razem muszê iœæ do Rockiego z którym mam zaatakowaæ konwój ze Starego Obozu. Rocky mieszka w tej samej chacie co Quentin.");
	


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
   description	= "Zaatakowaliœmy konwój.";
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
    AI_Output (other, self ,"DIA_Quentin_POATAKU_15_01"); //Zaatakowaliœmy konwój.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_02"); //Œwietnie. Rozumiem, ¿e wam siê uda³o.
    AI_Output (self, other ,"DIA_Quentin_POATAKU_03_03"); //Zajmê siê ekwipunkiem. Przesortujê go i oddam Martinowi. 
	B_LogEntry                     (CH1_ConvoyAttack,"Quentin by³ bardzo zadowolony z naszych osi¹gniêæ. Przyj¹³ ode mnie rzeczy z dostawy do Starej Kopalni.");	
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
   description	= "Masz dla mnie jeszcze jakieœ zadanie?";
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
    AI_Output (other, self ,"DIA_Quentin_QUEST5_15_01"); //Masz dla mnie jeszcze jakieœ zadanie?
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_02"); //Wiesz przecie¿, ¿e zawsze coœ siê znajdzie...
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_03"); //Ostatnio wys³aliœmy kilku Bandytów po dostawê z Nowego Obozu, jednak do dziœ nie wrócili.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_04"); //Przypuszczam, ¿e schowali siê w jakiejœ jaskini z towarem i ani myœl¹ wracaæ.
    AI_Output (self, other ,"DIA_Quentin_QUEST5_03_05"); //ZnajdŸ ich i przynieœ stal, która nieœli. By³o tego ze 30 prêtów. 
    MIS_BanditCave = LOG_RUNNING;

    Log_CreateTopic          (CH1_BanditCave, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BanditCave, LOG_RUNNING);
    B_LogEntry               (CH1_BanditCave,"Quentin kaza³ mi znaleŸæ Bandytów, którzy mieli przynieœæ dostawê stali z Nowego Obozu.");
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
   description	= "Znalaz³em stal.";
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
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_01"); //Znalaz³em stal.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_02"); //By³o tak, jak myœla³eœ.
    AI_Output (other, self ,"DIA_Quentin_FindIron_15_03"); //Ukryli siê w jaskini przy Nowym Obozie, a stal zamknêli w skrzyni.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_04"); //Daj mi tê stal.
    AI_Output (self, other ,"DIA_Quentin_FindIron_03_05"); //Dobra robota.
    B_GiveInvItems (other, self, ItQt_IronPack, 1);
	
    B_LogEntry               (CH1_BanditCave,"Znalezion¹ w skrzyni stal przynios³em Quentinowi.");
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
   description	= "To chyba nale¿y do ciebie.";
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
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_01"); //To chyba nale¿y do ciebie.
    AI_Output (self, other ,"DIA_Quentin_IronPackWithoutBAU_03_02"); //Faktycznie, gdzie to znalaz³eœ?
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_03"); //Paczka by³a w skrzyni, której pilnowa³o kilku bandziorów.
    AI_Output (self, other ,"DIA_Quentin_IronPackWithoutBAU_03_04"); //Tak jak myœla³em... masz tu drobny upominek za fatygê.
	B_GiveInvItems(self,hero, ItBe_Addon_Prot_EDGE,1);
    AI_Output (other, self ,"DIA_Quentin_IronPackWithoutBAU_15_05"); //Dziêki.
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
   description	= "Masz dla mnie jakieœ specjalne zadanie?";
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
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_01"); //Masz dla mnie jakieœ specjalne zadanie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_02"); //Jest coœ takiego.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_03"); //Co mam zrobiæ?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_04"); //Magnaci s¹ w posiadaniu kilku pierœcieni. Ponoæ te pierœcienie maj¹ magiczn¹ moc.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_05"); //Ale nie obchodzi mnie to. Wiem, ¿e s¹ bardzo cenne. 
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_06"); //Ci idioci ze Starego Obozu sporo nam za nie zap³ac¹.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_07"); //Mam ukraœæ pierœcienie i przynieœæ je do ciebie?
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_08"); //Tak. Pogadaj z Miguelem. To nasz cz³owiek w Obozie. Znajdziesz go na targowisku.
    AI_Output (self, other ,"DIA_Quentin_SzpeszialQuest_03_09"); //Goœæ zna Stary Obóz jak w³asn¹ kieszeñ.
    AI_Output (other, self ,"DIA_Quentin_SzpeszialQuest_15_10"); //Dobra. Postaram siê przynieœæ ci te pierœcienie jak najszybciej.
    MIS_BaronsRings = LOG_RUNNING;

    Log_CreateTopic            (CH1_BaronsRings, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BaronsRings, LOG_RUNNING);
    B_LogEntry                     (CH1_BaronsRings,"Quentin kaza³ mi odszukaæ wszystkie magiczne pierœcienie nale¿¹ce do Magnatów. Pomóc mi w tym ma Miguel. ");
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
   description	= "Mam pierœcienie.";
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
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_01"); //Mam pierœcienie.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_02"); //Wiedzia³em, ¿e ci siê uda. 
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_03"); //Te pierœcienie z pewnoœci¹ siê nam przydadz¹.
    AI_Output (other, self ,"DIA_Quentin_HELLORINGS_15_04"); //Co chcesz z nimi zrobiæ?
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_05"); //Mam kilka pomys³ów, ale muszê to jeszcze przemyœleæ.
    AI_Output (self, other ,"DIA_Quentin_HELLORINGS_03_06"); //Tymczasem weŸ swoj¹ rudê.
  
    MIS_BaronsRings = LOG_SUCCESS;

   
	
	B_GiveInvItems (hero,self, EBR_Ring1, 1);
	B_GiveInvItems (hero,self, EBR_Ring2, 1);
	B_GiveInvItems (hero,self, EBR_Ring3, 1);
    B_GiveInvItems (self, other, ItMiNugget, 100);
	B_LogEntry               (CH1_BaronsRings,"Odda³em skardzione pierœcienie Quentinowi.");
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
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_02"); //Dobrze, ¿e mi przypomnia³eœ. Szpieg powróci³.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_03"); //Y'Berion szuka kogoœ, kto odnajdzie dla niego jakiœ stary artefakt.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_04"); //Poszukuje najemników, poniewa¿ nikt z Bractwa nie da³ rady.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_05"); //Wys³ali chyba jakiegoœ Nowicjusza. Nuras, czy jakiœ tam...
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_06"); //Ale do rzeczy. Za odnalezienie kamienia daje 1000 bry³ek rudy.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_07"); //To bardzo du¿o.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_08"); //IdŸ do Bractwa i przyjmij tê robotê. Przy okazji bêdziesz móg³ tam powêszyæ.
    AI_Output (self, other ,"DIA_Quentin_BRACTWO1_03_09"); //Je¿eli odnajdziesz kamieñ i dostaniesz nagrodê, to podzielimy siê rud¹.
  
    MIS_PSIcampWORK = LOG_RUNNING;

    Log_CreateTopic          (CH1_PSIcampWORK, LOG_MISSION);
    Log_SetTopicStatus       (CH1_PSIcampWORK, LOG_RUNNING);
    B_LogEntry               (CH1_PSIcampWORK,"Mam udaæ siê do obozu na bagnie i przyj¹æ pracê od Y'Beriona. Chodzi o odnalezienie jakiegoœ kamienia. Zadanie powinno byæ dziecinnie proste. Za zlecenie mam otrzymaæ 1000 bry³ek rudy, które zwrócê Quentinowi.");
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
   description	= "Mam rudê.";
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
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_01"); //Mam rudê.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_02"); //Czyli uda³o ci siê wykonaæ zadanie?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_03"); //Tak. Odnalaz³em kamieñ ogniskuj¹cy.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_04"); //A ustali³eœ ju¿ fakty?
    AI_Output (other, self ,"DIA_Quentin_GOLDY_15_05"); //Pracujê nad tym.
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_06"); //Oto twoja dzia³ka.
    B_LogEntry                     (CH1_PSIcampWORK,"Odda³em rudê za zlecenie Quentinowi. Uzyska³em 500 bry³ek wynagrodzenia.");
	B_GiveXP (XP_HelpGUR);
    B_GiveInvItems (other, self, ItMiNugget, 1000);
    CreateInvItems (self, ItMiNugget, 250);
    B_GiveInvItems (self, other, ItMiNugget, 250);
	DIA_Quentin_GOLDY.permanent = false;
	} else {
	AI_Output (other, self ,"DIA_Quentin_GOLDY_15_07"); //Mam rudê. 
    AI_Output (self, other ,"DIA_Quentin_GOLDY_03_08"); //Jesteœ pewien, ¿e jest tu tyle ile potrzeba? Chyba nie przepi³eœ NASZEJ rudy?!
	DIA_Quentin_GOLDY.permanent = true;
};
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Ró¿ne dialogi
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
   description	= "Ustali³em fakty!";
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
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_01"); //By³em w Starej Kopalni. Stra¿nicy dostaj¹ rudê w zamian za zabijanie pe³zaczy.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_02"); //Ludzie z Bractwa szukaj¹ u pe³zaczy czegoœ szczególnego. 
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_03"); //Dziwnym trafem uda³o mi siê wpl¹taæ w tê sprawê.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_04"); //Potrzebna by³a im silniejsza wydzielina, jednak szukali jej w z³ym miejscu.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_05"); //Podj¹³em siê dla Cor Kaloma odnalezienia tego czegoœ, tej wydzieliny.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_06"); //Przynios³em mu jaja królowej pe³zaczy, o czym pewnie ju¿ wiesz.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_07"); //Jestem pe³en podziwu dla twoich czynów, ale opowiedz jeszcze o tym kontrakcie.
    AI_Output (other, self ,"DIA_Quentin_HELLO112_15_08"); //Zasada by³a prosta. Za pomoc Stary Obóz dostawa³ ziele.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_10"); //Nie doœæ, ¿e Stra¿nicy Œwi¹tynni pomagaj¹ Gomezowi w têpieniu pe³zaczy, to jeszcze p³ac¹ mu za to, ¿e jego Stra¿nicy robi¹ to samo.
    AI_Output (self, other ,"DIA_Quentin_HELLO112_03_11"); //WeŸ tê rudê. Spisa³eœ siê. 
	//quest log
    B_LogEntry               (CH1_PSIcampWORK,"Zda³em szczegó³owy raport Quentinowi. Wydajê mi siê jednak, ¿e to jeszcze nie koniec zawirowañ zwi¹zanych z Bractwem i Starym Obozem..");
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
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_02"); //Nie wiem, ch³opcze. Ostatnie wydarzenia nape³ni³y mnie niepokojem. Obawiam siê o to, co dzieje siê w Bractwie.
	
    AI_Output (self, other ,"DIA_Quentin_LOSY_03_03"); //Có¿, pozostaje nam czekaæ na rozwój wydarzeñ.

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
   description	= "Przynoszê wieœci z Bractwa.";
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
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_01"); //Przynoszê wieœci z Bractwa.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_02"); //Co siê tam dzieje? D³ugo ciê nie by³o.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_03"); //Y'Berion nie ¿yje. Zgin¹³ podczas próby przywo³ania Œni¹cego.
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_04"); //Cor Angar dowodzi teraz Bractwem. Mam udaæ siê do Nowego Obozu i za wszelk¹ cenê pomóc Magom Wody.
    AI_Output (self, other ,"DIA_Quentin_BractwoNews_03_05"); //Ta ca³a sytuacja zaczyna mnie niepokoiæ. Czy¿by ucieczka z tej piekielnej doliny by³a ju¿ blisko?
    AI_Output (other, self ,"DIA_Quentin_BractwoNews_15_06"); //Nie mam pojêcia, ale bêdê siê stara³ abyœmy uciekli st¹d jak najprêdzej.
	//experience
    B_GiveXP (XP_YBerionDeath);
};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 4
// W¹tek g³ówny
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
   description	= "Gomez wymordowa³ wszystkich Magów Ognia!";
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
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_01"); //Gomez wymordowa³ wszystkich Magów Ognia!
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_02"); //Co? Jak to siê sta³o?! Dopiero co dowiedzia³em siê o problemach w Starej Kopalni.
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_03"); //Po zawaleniu siê kopalni Gomez wpad³ w sza³. Jego przysz³oœæ jako szefa jest krucha. 
	AI_Output (other, self ,"DIA_Quentin_HELLO35_15_04"); //Wys³a³ oddzia³ Stra¿ników, którzy maj¹ poprzez sekretn¹ œcie¿kê przez góry dotrzeæ do Wolnej Kopalni i zaj¹æ j¹!
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_05"); //Nikt nie ma wstêpu do Starego Obozu, a co wiêcej Stra¿nicy i atakuj¹ ka¿dego, kto nie nosi na sobie czerwonego pancerza.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_06"); //¯a³osny akt desperacji. To w jego stylu. Ale ¿e nie oszczêdzi³ nawet Magów? Hmm...
    AI_Output (other, self ,"DIA_Quentin_HELLO35_15_07"); //Co teraz zrobimy?
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_08"); //Skoro ludzie Gomeza atakuj¹ ka¿dego, to tylko kwestia czasu zanim spróbuj¹ siê dobraæ do naszych ty³ków. Bêdziesz mia³ teraz du¿o pracy.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_09"); //Trzeba powiedzieæ wszystkim, ¿eby wrócili do Obozu i nie zwracali na sobie uwagi. Musisz porozmawiaæ z Ratfordem i Draxem. Ka¿ im siê ukryæ. 
	AI_Output (self, other ,"DIA_Quentin_HELLO35_03_10"); //Ostatnio z Obozu zniknê³o te¿ dwóch Bandytów. To dosyæ podejrzana sprawa. Mam nadziejê, ¿e nie wpadli w sid³a Stra¿ników. 
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_11"); //Niech ostrzeg¹ naszych ¿eby siê nie wychylali. Jeœli Stra¿nicy wziêliby ich do niewoli mogliby siê wygadaæ o naszym Obozie.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_12"); //Z obozu zniknê³o tak¿e kilku moich ludzi. ZnajdŸ ich. Mo¿e Ratford i Drax dadz¹ ci jakieœ wskazówki.
    AI_Output (self, other ,"DIA_Quentin_HELLO35_03_13"); //Na razie to wszystko. Zrób co ci kaza³em. Nie ma czasu do stracenia.
	//log
	//zadanie nie jest ju¿ rozpoczynane u Draxa
	//if (MIS_NewDanger != LOG_RUNNING)
	//{
        MIS_NewDanger = LOG_RUNNING;
        Log_CreateTopic          (CH4_NewDanger, LOG_MISSION);
        Log_SetTopicStatus       (CH4_NewDanger, LOG_RUNNING);
        B_LogEntry               (CH4_NewDanger,"Sytuacja nie wygl¹da zbyt dobrze. W tym ca³ym zamieszaniu Stra¿nicy mog¹ próbowaæ odnaleŸæ Obóz Bandytów. Musimy powzi¹æ œrodki ostro¿noœci. Quentin kaza³ mi porozmawiaæ z Draxem i Ratfordem, obaj maj¹ wróciæ do Obozu. Pryz okazji mam odnaleŸæ kilku Bandytów, którzy zniknêli z Obozu.");  
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
   description	= "Rozmawia³em z Draxem i przy okazji odnalaz³em Bandytów!";
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
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_01"); //Rozmawia³em z Draxem i przy okazji odnalaz³em Bandytów!
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_02"); //A wiêc ¿yj¹? Gdzie s¹?
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_03"); //Ratford zgin¹³ z r¹k Stra¿ników, którzy udali siê w kierunku opuszczonej kopalni.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_04"); //Drax postanowi³ siê zemœciæ na ludziach Gomeza i organizuje atak na patrole Stra¿ników.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_05"); //Zwo³a³ Bandytów i formuj¹ ma³y oddzia³. Ci, którzy zniknêli z Obozu s¹ z nim.
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_06"); //Musisz go jak najszybciej od tego odci¹gn¹æ. Stra¿nicy mog¹ siê teraz ³atwo zorientowaæ o po³o¿eniu naszego obozu!
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_07"); //Ju¿ za póŸno. Próbowa³em przemówiæ mu do rozs¹dku, ale jest opêtany ¿¹dz¹ zemsty.
    AI_Output (other, self ,"DIA_Quentin_DraxInfos_15_08"); //Teraz decyzja nale¿y do ciebie. Chcesz mu pomóc, czy nie?
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_09"); //Pójdziemy z nim. Ja, ty i kliku naprawdê dobrych ludzi. Drax nie jest mistrzem wojennego rzemios³a. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_10"); //Gdybyœmy zostawili go samego, to tak jakbyœmy powiedzieli Gomezowi, gdzie jest nasz Obóz. 
    AI_Output (self, other ,"DIA_Quentin_DraxInfos_03_11"); //IdŸ do niego i powiedz mu, ¿eby na nas poczeka³. Nie pójdê mordowaæ Stra¿ników bez przygotowania.
	//log
    B_LogEntry                     (CH4_NewDanger,"Quentin zgodzi³ siê pomóc Draxowi. W sumie to nie mia³ za du¿ego wyboru... Mam wróciæ do Draxa i powiedzieæ mu, ¿eby poczeka³ na wsparcie z Obozu.");
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
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_02"); //Wszystko przemyœla³em. Pójdê ja, ty, Drax i Pun. Reszta naszych ludzi nie nadaje siê do tego zadania, a ci którzy zostan¹ musz¹ kontrolowaæ sytuacjê podczas mojej nieobecnoœci.
	AI_Output (self, other ,"DIA_Quentin_nextWork22_03_03"); //Musisz teraz pogadaæ z dwiema osobami Jensem i Briamem.
    AI_Output (self, other ,"DIA_Quentin_nextWork22_03_04"); //Jensa poproœ o ciê¿ki pancerz, a Briama o pomocne podczas walki eliksiry.
	//log
    B_LogEntry                     (CH4_NewDanger,"Quentin zezwoli³ mi na otrzymanie ciê¿kiej zbroi Bandyty od Jensa. Briam ponadto da mi kilka eliksirów. Powinienem bez zw³oki z nimi porozmawiaæ.");
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
    AI_Output (self, other ,"DIA_Quentin_Idea_03_01"); //Zaczekaj! Coœ mi siê przypomnia³o.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_02"); //Ca³kiem zapomnia³em, ¿e mam kilku przyjació³ w obozie ³owców orków.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_03"); //Znaliœmy siê z ich dowódc¹ jeszcze w dalekiej przesz³oœci.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_04"); //To dobrzy wojownicy. Z pewnoœci¹ pomog¹ nam pozbyæ siê tych Stra¿ników.
    AI_Output (self, other ,"DIA_Quentin_Idea_03_05"); //IdŸ do nich i poproœ o kilku wojowników. Powo³aj siê na moj¹ znajomoœæ z Wilsonem.
	//quest log
    MIS_SupportFromOrcHunters = LOG_RUNNING;
    Log_CreateTopic      (CH4_SupportFromOrcHunters, LOG_MISSION);
    Log_SetTopicStatus   (CH4_SupportFromOrcHunters, LOG_RUNNING);
    B_LogEntry           (CH4_SupportFromOrcHunters,"Mam odnaleŸæ obóz ³owców orków. Ich szef podobno zna³ siê z Quentinem, dlatego ten teraz liczy na jego pomoc. Obozu mam szukaæ w jaskini bêd¹cej czêœci¹ œciany skalnej oddzielaj¹cej Stary Obóz od Ziem Orków.");
	B_LogEntry           (CH4_NewDanger,"Ju¿ mia³em braæ siê do roboty, gdy nagle ponownie zaczepi³ mnie Quentin. Poprosi³ o odnalezienie obozu ³owców orków i poproszenie ich o pomoc. Obozu mam szukaæ w jaskini bêd¹cej czêœci¹ œciany skalnej oddzielaj¹cej Stary Obóz od Ziem Orków.");
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
   description	= "Dwóch ludzi Wilsona ju¿ tu idzie.";
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
    AI_Output (other, self ,"DIA_Quentin_QuestOk890976_15_01"); //Dwóch ludzi Wilsona ju¿ tu idzie. S¹ to Rakus i Osko, jedni z najlepszych ³owców orków.
    AI_Output (self, other ,"DIA_Quentin_QuestOk890976_03_02"); //To nie tak Ÿle. Wiêksza grupa mog³a by wzbudziæ zamieszanie.
	//log
    B_LogEntry               (CH4_SupportFromOrcHunters,"Powiedzia³em Quentinowi, ¿e uda³o mi siê przekonaæ Wilsona, aby przys³a³ nam kilku ludzi do pomocy. Nasze si³y teraz znacznie wzrosn¹.");
	B_LogEntry               (CH4_NewDanger,"Wilson przyœle do obozu dwóch swoich najlepszych wojowników. Powiedzia³em o tym szefowi.");
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
    if ((Npc_HasItems (hero,BAU_ARMOR_H)>= 1) //warunek zosta³ zmieniony poniewa¿ opcja by³a perm 
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
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_02"); //Œwietnie. Ja za ten czas zaj¹³em siê sprawami organizacyjnymi. Doyle dopilnuje, ¿eby ten ca³y pierdolnik nie rozpad³ siê podczas mojej nieobecnoœci.
	AI_Output (other, self ,"DIA_Quentin_WykonanoXD_15_03"); //Myœlê, ¿e to dobra decyzja.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_04"); //Zostan¹ te¿ Rocky i Emanuel. Powinni sobie poradziæ.
    AI_Output (self, other ,"DIA_Quentin_WykonanoXD_03_05"); //Nie wiem tylko jaki Drax ma plan ataku. Mam nadziejê, ¿e wszystko przygotowa³. Lepiej ju¿ do niego chodŸmy. 
    B_LogEntry               (CH4_NewDanger,"Przygotowa³em wszystko co by³o trzeba. Teraz musimy udaæ siê do Draxa. Quentin powierzy³ mu dowództwo nad ca³¹ wypraw¹. Widzê jednak, ¿e nie jest zachwycony ca³¹ t¹ wypraw¹. Sprawia wra¿enie zamyœlonego. Byæ mo¿e obawia siê konsekwencji ataku na ludzi Gomeza.");
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
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_01"); //Ha Ha! Dawno nie by³o tu takiej rzezi! Dobra robota!
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_02"); //Ch³opaki, zwijajmy siê zanim ktoœ reszta Stra¿ników zorientuje siê co siê sta³o. 
    AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_05"); //Chocia¿ pewnie te dupki s¹ zbyt zajête us³ugiwaniem Gomezowi...
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_06"); //Na mnie ju¿ pora...
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_07"); //Czekaj, gdzie chcesz iœæ? 
	AI_Output (other, self ,"DIA_Quentin_AkcjaUkonczona_15_08"); //Mam jeszcze du¿o spraw do za³atwienia.
	AI_Output (self, other ,"DIA_Quentin_AkcjaUkonczona_03_09"); //Kilka chwil nic nie zmieni. ChodŸ z nami do obozu. Trzeba uczciæ zwyciêstwo.
    
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
	
	Npc_ExchangeRoutine (BAN_1605_Rocky,"ucieczka");//Rocky ucieczka przed obóz
	Npc_RemoveInvItem (BAN_1605_Rocky, BAU_ARMOR_H);//usuniêcie pancerza
	


	//K³opoty Bandytów jednak siê nie skoñczy³y. Stra¿nicy zajêli Obóz i zniewolili Bandytów. Rocky uciek³ i stoi przed Obozem.
	Wld_InsertNpc				(GRD_2271_Stra¿nik,"OC1");	
	Wld_InsertNpc				(GRD_2272_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2273_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2274_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2275_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2276_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2277_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2278_Stra¿nik ,"OC1");	
	Wld_InsertNpc				(GRD_2279_Stra¿nik ,"OC1");
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2282_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2283_Stra¿nik  ,"OC1");	
	Wld_InsertNpc				(GRD_2284_Stra¿nik  ,"OC1");
	Wld_InsertNpc				(GRD_2290_Stra¿nik  ,"OC1");
	Npc_ExchangeRoutine			(GRD_3935_Hector,"misja"); //boss
	
	B_LogEntry               (CH4_GardistsCheckpoints,"Quentin równie¿ ucieszy³ siê z takiego przebiegu wydarzeñ. Nie pozosta³o nam nic innego jak zaszyæ siê ponownie w górskim obozie.");
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
   description	= "Masz ju¿ jakiœ plan?";
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
    AI_Output (other, self ,"DIA_Quentin_Plan_15_01"); //Rozmawia³em z Rocky'm. Masz ju¿ jakiœ plan?
    AI_Output (self, other ,"DIA_Quentin_Plan_03_02"); //Jedynym sensownym wyjœciem wydajê mi siê szybki i nag³y atak. Wci¹¿ mamy kilku dobrych ludzi. Jeœli Stra¿nicy nie zd¹¿¹ siê zabarykadowaæ, to damy radê.
    AI_Output (other, self ,"DIA_Quentin_Plan_15_03"); //Chyba nie mamy innego wyboru. 
    AI_Output (self, other ,"DIA_Quentin_Plan_03_04"); //Dobrze, ¿e siê zgadzamy. Niech wszyscy opatrz¹ rany, zjedz¹ coœ i od razu bierzemy siê do roboty. 
	

	PlanA = true;
	
	B_LogEntry          (CH4_GardistsInBC,"Aby odbiæ nasz Obóz, bêdziemy musieli szybko i skutecznie zaatakowaæ niespodziewaj¹cych siê nas Stra¿ników. Tak swój plan przedstawi³ mi Quentin.");
	
};

FUNC VOID DIA_Quentin_Plan_PalisadeZbudjmy()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_01"); //UwiêŸmy Stra¿ników bêd¹cych w kanionie.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_02"); //Jak chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_03"); //Zaatakujemy szybko. Wybijemy wszystkich pilnuj¹cych wejœcia, po czym w¹ski przesmyk zabudujemy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_04"); //To siê mo¿e udaæ!
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_05"); //Musimy wszystkich zmobilizowaæ do budowy.
    AI_Output (other, self ,"DIA_Quentin_Plan_PalisadeZbudjmy_15_06"); //Jeszcze nie odbiliœmy Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_07"); //Ju¿ widzê jak to zrobiliœmy.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_08"); //Ch³opcze, chyba zas³ugujesz na tak¹ zbrojê jak moja.
    AI_Output (self, other ,"DIA_Quentin_Plan_PalisadeZbudjmy_03_09"); //Niech ci s³u¿y w walce!
    CreateInvItems (self, BAU_ARMOR_H, 2);
    B_GiveInvItems (self, hero, BAU_ARMOR_H, 1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, BAU_ARMOR_H);
	PlanA = true;
    B_LogEntry                     (CH4_GardistsInBC,"Postanowi³em, ¿e po szybkim ataku uwiêzimy pozosta³ych Stra¿ników w Obozie.");

    B_GiveXP (1000);
    Info_ClearChoices		(DIA_Quentin_Plan);
};

FUNC VOID DIA_Quentin_Plan_Trolllle()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_01"); //Sprowadzimy górskie trolle do Obozu.
    AI_Output (self, other ,"DIA_Quentin_Plan_Trolllle_03_02"); //Jak chcesz to zrobiæ?
    AI_Output (other, self ,"DIA_Quentin_Plan_Trolllle_15_03"); //Skorzystamy z pomocy Magów Wody.
    B_LogEntry                     (CH4_GardistsInBC,"Postanowi³em poprosiæ o pomoc Magów Wody. Sprowadzimy górskie trolle do Obozu. One z pewnoœci¹ za³atwi¹ sprawê za nas.");
    PlanB = true;
    B_GiveXP (500);
    Info_ClearChoices		(DIA_Quentin_Plan);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_Plan_Inne()
{
    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_01"); //Przygnieciemy ich kamieniami.
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_02"); //Chcesz wywo³aæ lawinê?

    AI_Output (other, self ,"DIA_Quentin_Plan_Inne_15_03"); //Skorzystam z pomocy jakiegoœ maga.
    
    AI_Output (self, other ,"DIA_Quentin_Plan_Inne_03_04"); //¯yczê ci powodzenia. PrzyjdŸ jak coœ przygotujesz.
	B_LogEntry                     (CH4_GardistsInBC,"Uwa¿am, ¿e sprowadzenie lawiny to dobry pomys³. Potrzebujê tylko jakiegoœ maga i Ÿród³a mocy.");

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
    AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_02"); //Tak, jednak zanim to zrobimy, powinieneœ wiedzieæ czego mo¿na siê tam spodziewaæ. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_03"); //Rocky mówi³ o grupie Stra¿ników...
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_04"); //S¹dzisz, ¿e przyszli tu sami? Jako niezorganizowana ha³astra? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_05"); //W Obozie jest z pewnoœci¹ jeszcze ktoœ.
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_06"); //Czy¿by sam Thorus?
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_07"); //Byæ mo¿e... Albo któryœ z Magnatów. 
	AI_Output (other, self ,"DIA_Quentin_LetsGo2346567_15_08"); //Chcesz siê wycofaæ? 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_09"); //Nie, po prostu lepiej zachowaæ czujnoœæ. Skup siê na g³ównym przeciwniku. My zajmiemy siê reszt¹. 
	AI_Output (self, other ,"DIA_Quentin_LetsGo2346567_03_10"); //A teraz prowadŸ. 
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
	
	//ci dwaj chyba stoj¹ tam gdzie Ratford i Drax i nie brali udzia³u w walce
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
    AI_Output (self, other ,"DIA_Quentin_54_03_01"); //Dobra robota! To ju¿ chyba wszyscy. Reszta albo zwieje, albo zaraz bêdzie gryŸæ ziemiê.
    AI_Output (other, self ,"DIA_Quentin_54_15_02"); //Obóz znów jest nasz!
    AI_Output (self, other ,"DIA_Quentin_54_03_03"); //Kim by³ dowódca Stra¿ników? 
	AI_Output (other, self ,"DIA_Quentin_54_15_04"); //To Skelden, jeden z najbardziej wp³ywowych Stra¿ników w Starym Obozie. 
	AI_Output (self, other ,"DIA_Quentin_54_03_05"); //To nie lada wyczyn wygraæ z kimœ takim. Dobrze, ¿e ten typ ju¿ gryzie piach. 
	//log
    B_LogEntry               (CH4_GardistsInBC,"Podczas gdy Bandyci eliminowali Stra¿ników, jak skupi³em siê na zabiciu niejakiego Skeldena. To silny i doœwiadczony cz³onek przybocznej stra¿y Gomeza. Walka z nim nie by³a ³atwa, jednak ostatecznie uda³o mi siê wys³aæ go w zaœwiaty. Obóz znów jest nasz, jednak teraz czeka nas du¿o pracy z przywróceniem temu miejscu dawnej œwietnoœci.");
    Log_SetTopicStatus       (CH4_GardistsInBC, LOG_SUCCESS);
    MIS_GardistsInBC = LOG_SUCCESS;
	//experience
    B_GiveXP (XP_KillAllgardist);
	//powrót bandytów do obozu
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
	
	//powrót do obozu ³owców
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
   description	= "Wszystko w porz¹dku?";
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
    AI_Output (other, self ,"DIA_Quentin_findFriends_15_01"); //Wszystko w porz¹dku?
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_02"); //Gdzieœ mi znikn¹³ Drax i Doyle. Nikt ich nie widzia³. Czêœæ naszych sprawdza trupy, ale tych dwóch chyba wœród nich nie ma.
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_03"); //Poszukaj ich. Mo¿e uciekli podobnie jak Rocky?
	AI_Output (other, self ,"DIA_Quentin_findFriends_15_04"); //Chwila, przecie¿ Drax by³ z nami. 
	AI_Output (self, other ,"DIA_Quentin_findFriends_03_05"); //Hmm... To siê zgadza, ale przecie¿ nie pojawi³ siê póŸniej. Znikn¹³ mi z oczu, gdy wracaliœmy z okolic Starego Obozu. 
    AI_Output (self, other ,"DIA_Quentin_findFriends_03_06"); //Musisz ich jak najszybciej odnaleŸæ. Mo¿liwe, ¿e potrzebuj¹ naszej pomocy.
	//log
    MIS_FindFriends = LOG_RUNNING;
    Log_CreateTopic          (CH4_FindFriends, LOG_MISSION);
    Log_SetTopicStatus       (CH4_FindFriends, LOG_RUNNING);
    B_LogEntry               (CH4_FindFriends,"W odbitym Obozie nie znaleŸliœmy Doyla. Mo¿liwe, ¿e gdzieœ uciek³ lub porwali go Stra¿nicy. Ponadto zagin¹³ Drax. Muszê odnaleŸæ ich obu. Bez ¿adnych wskazówek to nie bêdzie zbyt proste.");
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
   description	= "Znalaz³em Draxa.";
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
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_01"); //Znalaz³em Draxa.
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_02"); //I co z nim? Gdzie jest?
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_03"); //W szeroko pojêtych zaœwiatach. Pewnie sma¿y siê w kotle Beliara. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_04"); //Zatem nie ¿yje. Hmmm....
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_05"); //Tak, jednak to nie koniec rewelacji. Wbi³ sobie nó¿ prosto w serce, ale zanim to zrobi³, napisa³ doœæ niezgrabny list. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_06"); //List? Có¿ kilku moich ludzi w ogóle nie umiê pisaæ i czytaæ. Drax potrafi³ ale nie lubi³ nazywaj¹c to ,,m¹drzeniem siê"
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_07"); //Wiêc w ostatnich chwilach siê do tego zmusi³. W liœcie przyzna³ siê do tego, ¿e to on zabi³ Ratforda, a nie Stra¿nicy. PóŸniej doszed³ do w¹tpliwego porozumienia ze Stra¿nikami. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_08"); //Mów jaœniej, do cholery. Nie komplikuj jak jakiœ uczony Mag!
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_09"); //Tej historii nie da siê opowiedzieæ jednym zdaniem. Daj mi dokoñczyæ. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_10"); //Stra¿nicy obiecali mu rudê w zamian za wci¹gniêcie mnie w pu³apkê. Podwajali nagrodê, jeœli przyprowadzi³by równie¿ ciebie. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_11"); //Jednak Drax nie spodziewa³ siê, ¿e pójdzie z nami Pun, oraz ludzie z obozu ³owców orków. Ca³a sprawa mia³a siê zakoñczyæ ju¿ na pierwszym posterunku Stra¿ników. Chcieli nas wykoñczyæ.W
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_12"); //Nie uda³o im siê...
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_13"); //Nie wszystko posz³o zgodnie z ich planem. Stra¿nicy ze wszystkich trzech posterunków mieli siê zjawiæ w pierwszym, tak aby mieli znaczn¹ przewagê. Widocznie siê nie dogadali lub coœ stanê³o im na drodze. 
    AI_Output (other, self ,"DIA_Quentin_FoundDrax_15_14"); //Ostatecznie pozostali w trzech grupach, co u³atwi³o nam ich eliminacjê. Po wszystkim Drax do reszty zg³upia³. Nie wiedzia³, co ma z tym zrobiæ, wiêc po tym wszystkim da³ nogê. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_15"); //Nie spodziewa³em siê, ¿e z niego kawa³ takiego sukinsyna. 
    AI_Output (self, other ,"DIA_Quentin_FoundDrax_03_16"); //Po tym co œmia³ zrobiæ swoim kompanom zas³u¿y³ na taki smutny los.
	//log
	B_LogEntry                     (CH4_FindFriends,"Przywódca Bandytów by³ zaskoczony t¹ zdrad¹. Daliœmy siê nieŸle oszukaæ...");
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
   description	= "Odnalaz³em i sprowadzi³em Doyla.";
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
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_01"); //Odnalaz³em i sprowadzi³em Doyla.
    AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_02"); //Postanowi³ udaæ siê do Nowego Obozu i pomóc Najemnikom w walce ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_03"); //Wybra³ sobie œwietny moment... Czy ju¿ nikt w tym cholernym Obozie nie u¿ywa g³owy?!
	AI_Output (other, self ,"DIA_Quentin_iFindDoyle_15_06"); //Kaza³em mu wróciæ do Obozu.
    AI_Output (self, other ,"DIA_Quentin_iFindDoyle_03_07"); //Najwy¿sza pora... Bêdê mia³ dla was jeszcze trochê roboty. 
	//log
    B_LogEntry                     (CH4_FindFriends,"Zg³osi³em Quentinowi, gdzie znalaz³em Doyla. Szef Bandytów by³ na niego nieŸle wkurzony.");
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
   description	= "Dzia³o siê coœ podczas mojej nieobecnoœci?";
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
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_01"); //Dzia³o siê coœ podczas mojej nieobecnoœci?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_02"); //Wróci³o do mnie kilku zwiadowców.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_03"); //Czego siê dowiedzieli?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_04"); //Ponoæ Gomez wys³a³ kilkunastu Stra¿ników wraz z Kopaczami w kierunku placu wymian.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_05"); //Co to mo¿e oznaczaæ?
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_06"); //Opuszczona Kopalnia, ch³opcze. Opuszczona Kopalnia...
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_07"); //Przypuszczam, ¿e chc¹ wznowiæ wydobycie. Nie wiem w jakim stanie jest ta kopalnia, ale to mo¿e im siê udaæ.
    AI_Output (other, self ,"DIA_Quentin_PrzejscieDalej_15_08"); //W takim razie musimy czym prêdzej im przeszkodziæ!
    AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_13"); //Poproœ Doyle'a o pomoc. Eksplorowa³ ju¿ kiedyœ podziemia.
	AI_Output (self, other ,"DIA_Quentin_PrzejscieDalej_03_14"); //Dobrze, ¿e uda³o ci siê go sprowadziæ. 

	MIS_FindFriends = LOG_RUNNING;
    MIS_BanditsInAbadonedMine = LOG_RUNNING;
	
	B_LogEntry         (CH4_FindFriends,"Odnalaz³em obu Bandytów, co koñczy moje zadanie.");
    Log_SetTopicStatus (CH4_FindFriends, LOG_SUCCESS);

    Log_CreateTopic          (CH4_BanditsInAbadonedMine, LOG_MISSION);
    Log_SetTopicStatus       (CH4_BanditsInAbadonedMine, LOG_RUNNING);
    B_LogEntry               (CH4_BanditsInAbadonedMine,"Quentin znów ma plan. Tym razem muszê udaæ siê wraz z grupk¹ Bandytów do Opuszczonej Kopalni. Mamy pozbyæ siê Stra¿ników i zaj¹æ kopalniê dla siebie. Powinienem uprzednio pogadaæ z Doylem.");


	Wld_InsertNpc				(GRD_2291_Stra¿nik,"OC1");
	Wld_InsertNpc				(GRD_2292_Stra¿nik,"OC1");
	Wld_InsertNpc				(GRD_2293_Stra¿nik,"OC1");

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
   description	= "Oczyœci³em kopalniê ze Stra¿ników i o¿ywieñców.";
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
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_01"); //Oczyœci³em kopalniê ze Stra¿ników i o¿ywieñców.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_02"); //O¿ywieñców? Co tam do cholery siê dzia³o?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_03"); //Najprawdopodobniej jeden z wa¿niejszych gwardzistów którzy niegdyœ urzêdowali w kopalni zosta³ przeklêty. Reszty mo¿esz sie domyœleæ.
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_05"); //¯eby ci to wynagrodziæ dam ci coœ w nagrodê, weŸ to. Natychmiast wysy³am oddzia³ Bandytów do kopalni.
	
	B_GiveInvItems (self,other, ItMw_Sword_2h_WarriorFrenzy, 1);
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_06"); //Czym teraz mam siê zaj¹æ?
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_07"); //Potrzebujemy jeszcze jakiegoœ doœwiadczonego Kopacza, który pokierowa³by ludŸmi. 
    AI_Output (self, other ,"DIA_Quentin_MineIsClean_03_08"); //Móg³byœ coœ zorganizowaæ?
    AI_Output (other, self ,"DIA_Quentin_MineIsClean_15_09"); //Postaram siê.
	//log
	MIS_BanditsInAbadonedMine = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_BanditsInAbadonedMine, LOG_SUCCESS);
    B_LogEntry               (CH4_BanditsInAbadonedMine,"Powiedzia³em Quentinowi o wszystkim, co wydarzy³o siê w opuszczonej kopalni. Moje zadanie dobieg³o koñca.");
	//new quest
	MIS_NewEnginer = LOG_RUNNING;
	Log_CreateTopic          (CH4_NewEnginer, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NewEnginer, LOG_RUNNING);
    B_LogEntry               (CH4_NewEnginer,"Quentin natychmiast wys³a³ oddzia³ Bandytów do kopalni. Maj¹ zacz¹æ tam pracê, jednak najpierw potrzebny jest ktoœ z doœwiadczeniem, kto pokieruje wydobyciem. Muszê odnaleŸæ odpowiedniego cz³owieka. Sêk w tym, ¿e najlepsi in¿ynierowie byli w Starym Obozie... Byæ mo¿e któryœ z nich zwia³ do obozu na bagnie, bêdê musia³ siê tam rozejrzeæ...");
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
   description	= "Guy chce dla ciebie pracowaæ.";
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
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_01"); //Guy chce dla ciebie pracowaæ.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_02"); //Kto to taki?
    AI_Output (other, self ,"DIA_Quentin_GuyWork_15_03"); //By³y Kopacz, który uciek³ ze Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_GuyWork_03_04"); //Z pewnoœci¹ ma sporo doœwiadczenia.
	if (Npc_KnowsInfo (hero, DIA_Quentin_NegocjacieNc))
	{
	AI_Output (self, other ,"DIA_Quentin_GuyWork_03_10"); //Powiedz Lee, ¿e wyœlê swoich ludzi.
	};
	//log
	MIS_NewEnginer = LOG_SUCCESS;
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH4_NewEnginer,"Powiedzia³em Quentinowi, ¿e Guy bêdzie dla niego pracowa³. Ten cz³owiek ma du¿e doœwiadczenie.");
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
   description	= "Mo¿na powiedzieæ, ¿e osi¹gnêliœmy sukces.";
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
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_01"); //Mo¿na powiedzieæ, ¿e osi¹gnêliœmy sukces.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_02"); //Masz racjê. Uda³o nam siê zadaæ cios Gomezowi.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_03"); //Jednak wci¹¿ musimy byæ czujni.
    AI_Output (other, self ,"DIA_Quentin_Successasd_15_04"); //Jaki bêdzie kolejny cel Bandytów?
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_05"); //Jak zawsze: prze¿yæ jak najd³u¿ej.
    AI_Output (self, other ,"DIA_Quentin_Successasd_03_06"); //Mam nadziejê, ¿e sytuacja w Kolonii nied³ugo siê uspokoi. A mo¿e wreszcie czeka nas wolnoœæ?

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
   description	= "A co ze Star¹ Kopalni¹?";
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
    AI_Output (other, self ,"DIA_Quentin_OldMine_15_01"); //A co ze Star¹ Kopalni¹?
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_02"); //Od dawna nie mamy stamt¹d ¿adnych wieœci.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_03"); //Wybierz siê tam i zobacz, co siê tam wyprawia.
    AI_Output (self, other ,"DIA_Quentin_OldMine_03_04"); //Tylko nie idŸ prosto do obozu. Obserwuj z daleka. Nie chcia³bym ¿eby po tym wszystkim Stra¿nicy przerobili ciê na pasztet.
	
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
   description	= "By³em w pobli¿u obozu.";
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
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_01"); //By³em w pobli¿u obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_03"); //Podobno Stra¿nicy sprzeciwili siê w³adzy Gomeza.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_04"); //Zabili jakiegoœ Magnata. który mia³ tymczasowo zaj¹æ siê obozem.
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_05"); //Jakikolwiek wp³yw starego obozu na kopalniê odszed³ w zapomnienie.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_07"); //I w³aœnie o to nam chodzi³o, ch³opcze! Gomez wpakowa³ siê w niema³e k³opoty. Zosta³o mu ma³o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_08"); //Nie musimy siê ju¿ obawiaæ Starego Obozu. Jest ich zbyt ma³o, aby cokolwiek zdzia³aæ. Jak dobrze pójdzie, to wybij¹ siê sami.
	
	AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_09"); //A ty, ch³opcze? Czym teraz siê zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_TalkAboutMine_15_10"); //Pewnie bêdê pomaga³ Magom Wody nam siê st¹d wydostaæ.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_11"); //W takim razie, powodzenia. Pamiêtaj, ¿e tutaj zawsze mo¿esz wróciæ.
    AI_Output (self, other ,"DIA_Quentin_TalkAboutMine_03_12"); //Masz tu kilka mikstur na drogê. Zrabowa³em je lata temu.
	
	B_Story_BattleInOldMineCamp ();
    B_LogEntry               (CH4_BackToOldMine,"Potêga Gomeza podupad³a na tyle, ¿e Quentin odetchn¹³ z ulg¹. Obóz Bandytów jest na razie bezpieczny, a moja misja w nim dobiega koñca.");
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
   description	= "Rozmawia³em z Artegorem z obozu przed kopalni¹.";
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

    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_02"); //Rozmawia³em z Artegorem z obozu przed kopalni¹.
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_03"); //Wszyscy nie ¿yj¹. Stra¿nicy wybili siê do nogi. Prze¿y³ tylko on.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_04"); //Wiedzia³em! Wiedzia³em, ¿e nam siê uda!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_05"); //Gomez wpakowa³ siê w niema³e k³opoty. Zosta³o mu ma³o ludzi do obrony obozu.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_06"); //Wkrótce skoñczy ze sztyletem w gardle!
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_07"); //
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_08"); //A ty, ch³opcze? Czym teraz siê zajmiesz?
    AI_Output (other, self ,"DIA_Quentin_KoniecWatkuBandytow_15_09"); //Pewnie bêdê pomaga³ Magom Wody nam siê st¹d wydostaæ.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_10"); //W takim razie, powodzenia. Pamiêtaj, ¿e tutaj zawsze mo¿esz wróciæ.
    AI_Output (self, other ,"DIA_Quentin_KoniecWatkuBandytow_03_11"); //Masz tu kilka mikstur na drogê. Zrabowa³em je lata temu.
	//log
   
};


///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 4
// Obóz bandytów oczami innych obozów
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
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_GUR"); //Guru? Tutaj? Co sprowadza kogoœ takiego jak ty w to niegoœcinne miejsce?
	}
	else if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_KDW"); //Mag Wody w naszym Obozie? Co ciê tu sprowadza?
	}
	else
	{
	AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_01_OTH"); //Czego szukasz w moim Obozie? 
	};
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_02"); //Przybywam z polecenia Doyle'a.
   // AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_03"); //Jak to?
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_04"); //Poprosi³ mnie o sprawdzenie, co siê tu dzieje.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_05"); //Gdzie jest ten dureñ?
   // AI_RemoveWeapon (self);
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_06"); //Uda³ siê do Nowego Obozu, by wspomóc ludzi Lee w walce ze Stra¿nikami.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_07"); //Torlof poprosi³ go o pomoc, a ja mia³em zobaczyæ czy wszystko u was w porz¹dku.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_08"); //Dobrze, ¿e chocia¿ ty wykaza³eœ siê zdrowym rozs¹dkiem. Jak spotkasz Doyla, to powiedz mu, ¿eby przesta³ b³aznowaæ i wróci³ do Obozu.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_09"); //Powiesz mi tak w ogóle co siê tu wydarzy³o?
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_10"); //No wiêc poszliœmy razem z Draxem i kilkoma dobrymi ludŸmi w okolice Starego Obozu.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_11"); //Chcieliœmy pozbyæ siê czêœci patroli, które krêci³y siê w okolicy. Jednak zostaliœmy z³apani w zasadzkê, z której uda³o nam siê wyjœæ ca³o.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_12"); //To ca³a historia.
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_13"); //Tyle mi wystarczy. Ostatnio mam ju¿ tego du¿o na g³owie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_14"); //Jeszcze jedno. W naszym Obozie mo¿esz siê czuæ bezpiecznie. Nikt nie bêdzie ciê tu gnêbi³. Czuj siê tu jak u siebie.
    AI_Output (self, other ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_03_15"); //Gdybyœ potrzebowa³ ekwipunku, pogadaj z Martinem. 
    AI_Output (other, self ,"DIA_Quentin_CO_TY_TU_NAJMENIKU_15_16"); //Bywaj, Quentinie.
    przyjaciel_Bandytow = true;
    B_LogEntry                     (CH4_BanditsInTroubles,"Uda³em siê do Obozu Bandytów, gdzie spotka³em ich przywódcê - Quentina. Poprosi³ mnie, abym przekaza³ Doyle'owi, ¿e ma siê natychmiast pojawiæ w Obozie.");

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
   description	= "Przyszed³em negocjowaæ.";
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
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_01"); //Przyszed³em negocjowaæ.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_02"); //Negocjowaæ? 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_03"); //Przybywam z polecenia Lee. Mam ci z³o¿yæ propozycjê, w jego imieniu rzecz jasna.
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_04"); //Chcemy wznowiæ wydobycie w opuszczonej kopalni, jednak nie mamy robotników. 
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_05"); //Lee obiecuje wam czwart¹ czêœæ urobku w zamian za robotników.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_06"); //Mam wys³aæ moich ludzi do kopalni?
    AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_07"); //Ju¿ mówi³em, ¿e czwart¹ wykopan¹ przez nich czêœæ bêdziecie mogli zatrzymaæ.
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_08"); //No niech bêdzie. Wiêkszoœæ tych obiboków i tak œpi ca³y dzieñ...
    AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_09"); //Powiedz Lee, ¿e wyœlê kilku ludzi, ale przy okazji bêdziesz musia³ coœ dla mnie zrobiæ.
	AI_Output (other, self ,"DIA_Quentin_NegocjacieNc_15_10"); //Co takiego? 
	AI_Output (self, other ,"DIA_Quentin_NegocjacieNc_03_11"); //PrzyprowadŸ do pracy w kopalni jakiegoœ doœwiadczonego górnika. Moi ludzie kompletnie siê na tym nie znaj¹.
 
	
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
    B_LogEntry                     	(CH4_NewEnginer,"Quentin zgodzi³ siê na propozycjê Lee. Przywódca Bandytów wyœle kilku swoich ludzi do kopalni, jednak poprosi³ mnie w zamian o przys³ugê. Mam przyprowadziæ jakiegoœ kompetentnego cz³owieka, który pokieruje jego ludŸmi. Sêk w tym, ¿e najlepsi in¿ynierowie byli w Starym Obozie... Byæ mo¿e któryœ z nich zwia³ do obozu na bagnie, bêdê musia³ siê tam rozejrzeæ...");
    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// BAN_1610_Quentin
// Skrypt nauki broni jednorêcznej
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
	Info_AddChoice(DIA_Quentin_START_TRAIN,"Wróæ",DIA_Quentin_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);
	
	
};

func void DIA_Quentin_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
	Info_AddChoice(DIA_Quentin_START_TRAIN,Dialog_Back,DIA_Quentin_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);

};



func void DIA_Quentin_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
	Info_AddChoice(DIA_Quentin_START_TRAIN,Dialog_Back,DIA_Quentin_START_TRAIN_BACK);

	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Quentin_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Quentin_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Quentin_START_TRAIN_1H_5);


};

func void DIA_Quentin_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Quentin_START_TRAIN);
};
//===========================================================================1.6.1==================================================
//-----------------> Trudna Przesz³osæ
//========================================

INSTANCE DIA_Quentin_POSZUKIWACZE (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 19;
   condition    = DIA_Quentin_POSZUKIWACZE_Condition;
   information  = DIA_Quentin_POSZUKIWACZE_Info;
   permanent	= FALSE;
   description	= "Connor wspomina³ ¿e ponoæ...";
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
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_01"); //Connor wspomina³ ¿e ponoæ mia³eœ do mnie jak¹œ sprawê.
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_02"); //To prawda. Niedaleko naszego obozu zapuœci³a siê grupa cieni zwiadowców. Trzeba ich pos³aæ do piachu nim cokolwiek wywêsz¹. 
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_03"); //Wytypowa³em was do tego zadania. 
    AI_Output (other, self ,"DIA_Quentin_POSZUKIWACZE_15_04"); //Ehh... jak nie jedno to dugie...
    AI_Output (self, other ,"DIA_Quentin_POSZUKIWACZE_03_05"); //Mówi³eœ coœ...? No tak myœla³em, powodzenia.
	B_LogEntry                     (TrudnaPrzeszlosc,"Quentin powiedzia³, ¿e nieopodal obozu zauwa¿ono grupê Cieni-maruderów. Poleci³ mi i Connorowi siê ich pozbyæ. Mo¿e przy okazji zdobêdê jakieœ informacje na jego temat.");	

};
//========================================
//-----------------> Trudna Przesz³osæ
//========================================

INSTANCE DIA_Quentin_Cienie (C_INFO)
{
   npc          = BAN_1610_Quentin;
   nr           = 19;
   condition    = DIA_Quentin_Cienie_Condition;
   information  = DIA_Quentin_Cienie_Info;
   permanent	= FALSE;
   description	= "Zwiadowcy ze starego obozu nie ¿yj¹.";
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
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_01"); //Zwiadowcy ze starego obozu nie ¿yj¹.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_02"); //Dobra robota. Stawili twardy opór?
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_03"); //To cieniasy. Posz³o ³atwo zw³aszcza, ¿e Connor to zdolny ch³opak.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_04"); //Dobrze. Nale¿y siê wam nagroda. WeŸ tê rudê.
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_05"); //Dziêki.
    AI_Output (self, other ,"DIA_Quentin_Cienie_03_06"); //Za chwilê wynagrodzê tak¿e Connora.
	AI_Output (self, other ,"DIA_Quentin_Cienie_03_07"); //Jak bêdê ciê potrzebowa³ to dam znaæ.
    AI_Output (other, self ,"DIA_Quentin_Cienie_15_08"); //Jasne.
	B_GiveInvItems (self,hero, ItMiNugget, 80);
	MIS_TP = LOG_SUCCESS;
    B_LogEntry         (TrudnaPrzeszlosc,"Zda³em raport Quentinowi. By³ zadowolony i wyp³aci³ mi nale¿n¹ nagrodê.");	
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
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_01"); //Powinniœmy pomówiæ.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_03"); //O pewnym cennym przedmiocie zwanym ,,Koron¹ Hrodgira”.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_04"); //Co to takiego? I kim by³ Hrodgir?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_05"); //To niezwykle cenny artefakt. Nale¿a³ do jednego z tutejszych lordów. By³ ponoæ ow³adniêty mani¹ posiadania korony na w³asnoœæ.
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_06"); //Ws³awi³ siê zarówno ogromnym mêstwem w obronie Innosa jak i du¿¹ pych¹ bo chodzi³ w sporz¹dzonej dla siebie koronie.
    AI_Output (other, self ,"DIA_Quentin_KH_Korona_15_07"); //Po co ci ta korona?
    AI_Output (self, other ,"DIA_Quentin_KH_Korona_03_08"); //Kiedyœ Bariera upadnie. Wtedy móg³bym odsprzedaæ j¹ Paladynom w Khorinis albo Magom Ognia. W koñcu Hrodgir by³ obroñc¹ Innosa.
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
   description	= "Wszystko piêknie i ³adnie. Tylko gdzie szukaæ tej korony.";
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
    AI_Output (other, self ,"DIA_Quentin_KH_Sekta_15_01"); //Wszystko piêknie i ³adnie. Tylko gdzie szukaæ tej korony.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_02"); //Poszlaki prowadz¹ do obozu Sekty. Pos³a³em tam ju¿ Connora na zwiady. Mia³ siê czegoœ dowiedzieæ.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_03"); //Udasz siê tam i do³¹czysz do niego. Potem dowiecie siê gdzie jest Korona Hrodgira i mi j¹ przyniesiecie. 
    AI_Output (other, self ,"DIA_Quentin_KH_Sekta_15_04"); //Hmm... Niech bêdzie ale nie robiê tego za darmo.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_05"); //Spokojnie, otrzymasz stosown¹ zap³atê.
    AI_Output (self, other ,"DIA_Quentin_KH_Sekta_03_06"); //IdŸ do Sekty pogadaæ z Connorem.
	
	Npc_ExchangeRoutine(BAN_40028_Connor,"KH");
	Log_CreateTopic		(KoronaHrodgira,	LOG_MISSION);
	Log_SetTopicStatus	(KoronaHrodgira,	LOG_RUNNING);
	B_LogEntry               (KoronaHrodgira,"Quentin powiedzia³ mi o tak zwanej koronie Hrodgira. To artefakt nale¿¹cy ongiœ do potê¿nego paladyna. Chcia³by on j¹ zdobyæ. Ponoæ maj¹ o niej informacjê ludzie z Sekty. Quentin wys³a³ tam ju¿ Connora , mam do niego do³¹czyæ i dowiedzieæ siê wiêcej o koronie.");
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
   description	= "Uda³o nam siê zdobyæ te przeklêt¹ koronê.";
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
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_01"); //Uda³o nam siê zdobyæ te przeklêt¹ koronê.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_02"); //Znakomicie.
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_03"); //Oto ona.
	B_GiveInvItems (other,self, ItHe_Hrodgir, 1);
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_04"); //A to twoja zap³ata, zaraz i Connor dostanie swoj¹ czêœæ.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_05"); //Jak uda³o siê wam j¹ zdobyæ?
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_06"); //Zaliczyliœmy bli¿sze spotkanie z przeroœniêtym zêbaczem oraz z samym Hrodgirem reszt¹ jego bandy...
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_07"); //To on ¿y³?
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_08"); //I tak i nie. Zapewne pad³ ofiar¹ kl¹twy. Wraz ze swoimi ludŸmi.
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_09"); //Có¿, ciekawa historia. Szczêœcie wam sprzyja³o, ¿e jakims cudem wyszliscie z tego ca³o.
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_10"); //Racja, na mnie ju¿ pora. 
    AI_Output (self, other ,"DIA_Quentin_KH_END_03_11"); //Wkrótce bêdê mia³ dla Ciebie kolejn¹ sprawê do za³atwienia. Masz talent ch³opcze. 
    AI_Output (other, self ,"DIA_Quentin_KH_END_15_12"); //Chyba do pakowania siê w k³opoty... Do zobaczenia.
	B_LogEntry               (KoronaHrodgira,"Wróci³em do obozu i przekaza³em koronê Hrodgira Quentinowi. By³ niezwykle uradowany i wyp³aci³ mi nale¿n¹ rudê.");
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
    AI_Output (self, other ,"DIA_Quentin_ZL_03_01"); //Zauwa¿y³em coœ niepokoj¹cego.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_02"); //Co takiego?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_03"); //Paru moich ludzi zniknê³o ostatnio w dziwnych okolicznoœciach.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_04"); //Mo¿e udali siê na misjê i zginêli?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_05"); //Sêk w tym, ¿e nie... Wieczorem ka¿dy z nich z osobna by³ w obozie a rano ju¿ go nie by³o.
    AI_Output (self, other ,"DIA_Quentin_ZL_03_06"); //To dzieje siê ju¿ od kilku tygodni. 
    AI_Output (other, self ,"DIA_Quentin_ZL_15_07"); //Co proponujesz?
    AI_Output (self, other ,"DIA_Quentin_ZL_03_08"); //Miej oczy i uszy otwarte. Wybadaj czy nie dzieje siê coœ dziwnego w obozie.
    AI_Output (other, self ,"DIA_Quentin_ZL_15_09"); //W porz¹dku. Zajmê siê tym.
	Log_CreateTopic		(ZnikajacyLudzie,	LOG_MISSION);
	Log_SetTopicStatus	(ZnikajacyLudzie,	LOG_RUNNING);
	B_LogEntry               (ZnikajacyLudzie,"Quentin zauwa¿y³ coœ niepokoj¹cego. Jego ludzie zaczêli znikaæ w tajemniczych i budz¹cych w¹tpliwoœci okolicznoœciach. Poleci³ mi bym by³ wyczulony i stara³ siê wybadaæ wszystko co podejrzane.");
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
   description	= "Wiem co dzia³o siê ze znikaj¹cymi ludŸmi.";
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
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_01"); //Wiem co dzia³o siê ze znikaj¹cymi ludŸmi.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_02"); //Doprawdy? Co takiego?
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_03"); //Mordowa³ ich ten pajac Victor i sk³ada³ w ofierze jakiemuœ bóstwu. 
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_04"); //A masz na to jakiœ dowód?
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_05"); //Jego dziennik.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_06"); //A to sukinsyn! Gdzie on jest?!
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_07"); //Ju¿ go zabi³em. Wiêc trafi³ ju¿ gdzie chcia³ czyli do Beliara.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_08"); //Szkoda bo ukatrupi³bym go osobiœcie.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_09"); //Tak czy siak œwietnie ci posz³o. Rozwi¹za³eœ tê zagadkê i ocali³eœ od œmierci nastêpnych moich ludzi a mo¿e i mnie samego.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_10"); //WeŸ tê nagrodê. Jest twoja.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Health_03, 3);
	B_GiveInvItems (self,other, ItAt_Snapper_Skin, 2);
    AI_Output (other, self ,"DIA_Quentin_ZL_IKNOW_15_11"); //Dziêki.
    AI_Output (self, other ,"DIA_Quentin_ZL_IKNOW_03_12"); //Zdolniacha z ciebie m³ody.
	MIS_ZL = LOG_SUCCESS;
	B_LogEntry               (ZnikajacyLudzie,"Poszed³em do Quentina i powiedzia³em, ¿e to Victor mordowa³ jego ludzi. Na dowód da³em jego dziennik. Quentin by³ rozwœcieczony ale i zadowolony, ¿e ta sprawa nie przybierze wiêkszych rozmiarów. Wynagrodzi³ mnie nale¿ycie za wykonanie misji.");
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
   description	= "Mam coœ co ciê zainteresuje.";
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
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_01"); //Mam coœ co ciê zainteresuje.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_03"); //T¹ ksiêgê. Victor chcia³ bym j¹ dla niego zdoby³.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_04"); //Poka¿.
	B_GiveInvItems (other,self, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_05"); //Ale to jakiœ nieznany mi jêzyk...
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_06"); //To prastary demoniczny dialekt. Piszê w nim o z³o¿eniu ofiary z cz³owieka dla bóstwa imieniem Sattik.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_07"); //Cholera... Ka¿ê natychmiast przes³uchaæ i przeszukaæ Victora!
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_08"); //I prawid³owo. On coœ ewidentnie ukrywa.
    AI_Output (self, other ,"DIA_Quentin_ZL_VICTORBOOK_03_09"); //PrzyjdŸ do mnie jutro a dowiesz siê co dalej z Victorem.
    AI_Output (other, self ,"DIA_Quentin_ZL_VICTORBOOK_15_10"); //Dobra.
	  Npc_ExchangeRoutine(BAN_1609_Smith,"VICTOR");
	  Npc_ExchangeRoutine(BAN_1605_Rocky,"VICTOR");
	QuentinZL_Day<=(Wld_GetDay()-1); 
	B_LogEntry               (ZnikajacyLudzie,"Uda³em siê do Quentina i da³em mroczn¹ ksiêgê Victora. Wyjaœni³em, ¿e chodzi o jego dziwne zachowanie. Quentin poleci³ go przes³uchaæ i przeszukaæ. Mam siê do niego zg³osiæ jutro.");
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
   description	= "No i co ze spraw¹ Victora?";
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
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_01"); //No i co ze spraw¹ Victora?
	
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_02"); //ZnaleŸliœmy przy nim jego dziennik. Ten bydlak zarzyna³ naszych ludzi i sk³ada³ w ofierze jakiemuœ mrocznemu bo¿kowi!
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_03"); //Dziêki tobie nie zabije ju¿ nikogo.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_04"); //A co siê z nim dzieje?
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_05"); //Moi ludzie poszatkowali tego odszczepieñca,i dos³ownie chwilê temu.
	B_KillNpc(BAN_40067_Victor); 
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_06"); //Jeden pajac mniej...
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_07"); //Teraz czas na przyjemniejsze rzeczy. Wyœwiadczy³eœ nam du¿¹ przys³ugê.
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_08"); //WeŸ to w nagrodê.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Health_03, 3);
	B_GiveInvItems (self,other, ItAt_Snapper_Skin, 2);
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_09"); //Niedosz³e ofiary Victora powinny byæ ci wdziêczne.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_10"); //Dziêki, Kto wie kogo spróbowa³by zaszlachtowaæ i z³o¿yæ w ofierze.
    AI_Output (self, other ,"DIA_Quentin_ZL_NDAY_03_11"); //Mo¿e nawet mnie. Dziêki za pomoc.
    AI_Output (other, self ,"DIA_Quentin_ZL_NDAY_15_12"); //Zrobi³em to co powinienem. 
	 AI_StandUp( BAN_40067_Victor );
    Npc_ExchangeRoutine(BAN_1609_Smith,"start");
	Npc_ExchangeRoutine(BAN_1605_Rocky,"start");
	MIS_ZL = LOG_SUCCESS;
	B_LogEntry               (ZnikajacyLudzie,"Quentin powiedzia³ mi, ¿e odnaleziono przy Victorze jego dziennik, z którego wynika, ¿e mordowa³ ludzi Quentina i sk³ada³ ich w ofierze bóstwu. Quentin kaza³ go niezw³ocznie zabiæ za to co robi³. Mnie zaœ sowiecie wynagrodzi³ za rozwi¹zanie zagadki znikaj¹cych ludzi.");
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
   description	= "Ponoæ szykujesz siê do wa¿nej misji.";
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
    AI_Output (other, self ,"DIA_Quentin_TMQ_NO_15_01"); //Ponoæ szykujesz siê do wa¿nej misji.
    AI_Output (self, other ,"DIA_Quentin_TMQ_NO_03_02"); //Tak. To prawda.
    AI_Output (other, self ,"DIA_Quentin_TMQ_NO_15_03"); //Co to za misja?
    AI_Output (self, other ,"DIA_Quentin_TMQ_NO_03_04"); //Na razie wola³bym tego nie zdradzaæ.
	
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
   description	= "Udowodni³em ju¿ swoj¹ wartoœæ i lojalnoœæ.";
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
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_01"); //Udowodni³em ju¿ swoj¹ wartoœæ i lojalnoœæ. Mo¿esz mi powiedzieæ co to za zadanie.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_02"); //No dobrze. Wkrótce wyruszê poza obóz w bardzo wa¿nej intencji.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_03"); //Udam siê do Nowego Obozu na naradê. Bêd¹ w niej uczestniczyæ Lee, jego najlepsi Najemnicy oraz ja.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_04"); //Rozumiem. Nie zabierasz ze sob¹ jakiejœ obstawy?
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_05"); //Myœla³em o tym ale to za bardzo rzuca³oby siê w oczy gdybym zabra³ ze sob¹ oddzia³ Bandytów.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_06"); //Dlatego pójdê sam w przebraniu Cienia. 
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_07"); //Oby ci siê poszczêœci³o.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_08"); //Mam tak¹ nadzieje. W czasie mojej nieobecnoœci ty i Rocky staniecie na czele Bandytów.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_09"); //To spore wyró¿nienie.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_10"); //Liczê, ¿e mu sprostacie. 
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_11"); //Ja tymczasem bêdê siê przygotowywa³ do wyprawy. Wyruszam ju¿ zaraz.
    AI_Output (other, self ,"DIA_Quentin_TMQ_LO_15_12"); //Powodzenia.
    AI_Output (self, other ,"DIA_Quentin_TMQ_LO_03_13"); //Dziêki.
	Npc_ExchangeRoutine(self,"TMQ1");
	Quentin_TMQ_Day = Wld_GetDay();
	B_LogEntry               (TajnaMisjaQuentina,"Quentin powiedzia³, ¿e wybiera siê do Nowego Obozu by stawiæ siê na naradzie z Najemnikami. W tym czasie ja i Rocky mamy stan¹æ na czele Bandytów. Quentin za chwilê opuœci obóz.");
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
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_01"); //No... W Sam¹ porê!
    AI_Output (other, self ,"DIA_Quentin_TMQ_BLOOD_15_02"); //Có¿ postanowiliœmy zak³óciæ tê imprezê. Bo widzê, ¿e nie dla wszystkich uk³ada³a siê po myœli!
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_03"); //Dobra, doœæ tych ¿artów. Potrzebuje napoju uzdrawiaj¹cego.
    AI_Output (self, other ,"DIA_Quentin_TMQ_BLOOD_03_04"); //Oberwa³em gdy mnie pojmali a potem mnie zaci¹gnêli tu si³¹ wiêc upuœcili mi trochê krwi...
	CreateInvItem (hero, ItFo_Potion_Health_01);
	B_ChangeGuild    (Ban_1610_Quentin,GIL_BAU);
   B_LogEntry               (TajnaMisjaQuentina,"Uratowaliœmy Quentina. Zosta³ doœæ mocno pobity przez Stra¿ników. Poprosi³ mnie o napój uzdrawiaj¹cy.");
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
   description	= "Masz ten napój uzdrawiaj¹cy.";
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
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_01"); //Masz ten napój uzdrawiaj¹cy.
	B_GiveInvItems (other,self, ItFo_Potion_Health_01, 1);
	AI_UseItem (self, ItFo_Potion_Health_01);
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_02"); //Dziêki.
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_03"); //Teraz niech Rocky wróci do obozu i przejmie dowództwo. A ja i ty ruszamy do Nowego Obozu na naradê z Najemnikami.
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_04"); //W porz¹dku. Zatem chodŸmy. 
	Npc_ExchangeRoutine(self,"TMQNO");
	Npc_ExchangeRoutine(BAN_1605_Rocky,"Start");
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_05"); //Na pewno czekaj¹ ju¿ na nas. A ja nie lubiê siê spóŸniaæ. 
    AI_Output (other, self ,"DIA_Quentin_TMQ_POTION_15_06"); //Zamiast narady trafi³eœ prawie na swój pogrzeb.
    AI_Output (self, other ,"DIA_Quentin_TMQ_POTION_03_07"); //S³uchaj no... A mniejsza... Za mn¹.
	B_LogEntry (TajnaMisjaQuentina,"Quentin poleci³ mi bym uda³ siê z nim do Nowego Obozu na naradê. W tym czasie Rocky ma zarz¹dzaæ Bandytami.");
	
	 Info_ClearChoices	(DIA_Quentin_TMQ_POTION);
     Info_AddChoice		(DIA_Quentin_TMQ_POTION, "(Szybka podró¿ - Do Lee)", DIA_Quen_TMQ_FastTravel);
	
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
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_03"); //Do gniazda gdzie rezyduje ta ¿mija Gomez. Musisz mieæ du¿o szczêœcia jeœli chcesz wyjœæ z tego ¿ywy.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_04"); //Ale ju¿ nie raz udowodni³eœ, ¿e stworzono ciê do wielkich zadañ.
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_05"); //Musze temu sprostaæ.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_06"); //Ja tymczasem wracam do naszego obozu.
	Npc_ExchangeRoutine(self,"Start");
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_07"); //Wszyscy Bandyci bêd¹ trzymaæ za ciebie kciuki.
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_08"); //Dziêki.
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_09"); //Powodzenia, przyjacielu...
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_10"); //Spokojnie...
    AI_Output (self, other ,"DIA_Quentin_TMQ_SO_03_11"); //Ahh... Spieprzaj ju¿...
    AI_Output (other, self ,"DIA_Quentin_TMQ_SO_15_12"); //Odrazu lepiej.
	B_LogEntry(TajnaMisjaQuentina,"Quentin ¿yczy³ mi powodzenia przed wypraw¹ do Starego Obozu. Teraz ma powróciæ do obozu Bandytów i znów mu przewodziæ.");
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
   description	= "Mag Gomeza ju¿ nie ¿yje.";
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
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_01"); //Mag Gomeza ju¿ nie ¿yje.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_02"); //Czyli poradzi³eœ sobie.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_03"); //Zgadza siê.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_04"); //Jestem pod wra¿eniem.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_05"); //Masz talent. A poza tym jakieœ nadnaturalne si³y zdaj¹ ci siê sprzyjaæ.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_06"); //No nie wiem...
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_07"); //WeŸ to w nagrodê, zosta³o z ostatniego napadu. Jak nikt zas³u¿y³eœ na to a nawet i na wiêksze splendory.
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItMi_JeweleryChest_03, 3);
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_08"); //Dziêkuje.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_09"); //Czuje, ¿e wkrótce to wszystko siê skoñczy.
    AI_Output (self, other ,"DIA_Quentin_TMQ_END_03_10"); //A tymczasem trzymaj siê. Na pewno masz du¿o do roboty.
    AI_Output (other, self ,"DIA_Quentin_TMQ_END_15_11"); //Na razie.
	B_LogEntry(TajnaMisjaQuentina,"Quentin pogratulowa³ mi sukcesu w misji z Jimem i o¿ywieñcami. Wyp³aci³ mi te¿ sowit¹ nagrodê.");
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

