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

//dialog nie jest wykorzystywany, poniewa¿ Glest nie jest ju¿ spawnowany w Old_camp
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
    AI_Output (self, other ,"DIA_Glest_HELLO1_03_02"); //Nie najgorzej. Kilka dni temu wróci³em z kopalni. Mogê sobie teraz trochê odpocz¹æ.  
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
    AI_Output (self, other ,"DIA_Glest_First_03_01"); //Co ty tu robisz? Nie wygl¹dasz mi na jednego z ludzi Gomeza.
	AI_Output (other, self ,"DIA_Glest_First_15_02"); //Bo nim nie jestem.
    AI_Output (self, other ,"DIA_Glest_First_03_03"); //W takim razie uciekaj st¹d, póki mo¿esz siê ruszaæ!
    AI_Output (other, self ,"DIA_Glest_First_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Glest_First_03_05"); //To miejsce jest przeklête. Krêci siê tu pe³no tych przeklêtych o¿ywieñców. Wybili nasz ekspedycjê do nogi!
    AI_Output (self, other ,"DIA_Glest_First_03_06"); //Kilku stra¿ników na marne próbuje z nimi walczyæ. Na razie zdobyliœmy most, ale zosta³a nam ju¿ tylko garstka ludzi. 
    AI_Output (other, self ,"DIA_Glest_First_15_07"); //Akurat ¿ycie Stra¿ników nie bardzo mnie martwi...
    AI_Output (self, other ,"DIA_Glest_First_03_08"); //To nie jest teraz istotne. Teoretycznie jesteœmy wrogami, a jednak nie zabi³eœ mnie. 
    AI_Output (other, self ,"DIA_Glest_First_15_09"); //Byæ mo¿e masz informacje, które mog¹ mi siê przydaæ. Co ci siê tak w ogóle sta³o? Uciek³eœ z wnêtrza kopalni?
    AI_Output (self, other ,"DIA_Glest_First_03_10"); //Tak, ale solidnie oberwa³em. 
    AI_Output (self, other ,"DIA_Glest_First_03_11"); //Mówiê ci: nie idŸ dalej pod ¿adnym pozorem! Czai siê tam wy³¹cznie œmieræ. 
    AI_Output (other, self ,"DIA_Glest_First_15_12"); //Mam tam kilka spraw do za³atwienia. Wiesz mo¿e sk¹d siê bior¹ o¿ywieñcy? 
	AI_Output (self, other ,"DIA_Glest_First_03_13"); //Wewn¹trz kopalni jest olbrzymia sala. Widzia³em tam jakiegoœ maga w czarnych szatach. W rêku dzier¿y³ piêkny kamieñ. 
	AI_Output (self, other ,"DIA_Glest_First_03_14"); //Wydaje mi siê, ¿e to dziêki niemu udaje mu siê przyzywaæ tyle nieumar³ych. 
	AI_Output (other, self ,"DIA_Glest_First_15_15"); //Bêdê siê musia³ z nim rozprawiæ. Postaraj siê dotrzeæ do kogoœ, kto bêdzie ci w stanie pomóc. 
	AI_Output (self, other ,"DIA_Glest_First_03_16"); //Dziêkujê, nie bêdê ci ju¿ wchodzi³ w drogê. 
 
	//exp
    B_GiveXP (500);
	
	//spawn zombie 2x
	Wld_InsertNpc		(Zombie,"CAMP02"); 
	Wld_InsertNpc		(Zombie,"OW_PATH_1_16"); 
	
	//zadanie - wpis dla bandyty
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	B_LogEntry                     (CH4_BanditsInAbadonedMine,"Zaraz po zejœciu na dó³ spotka³em rannego Kopacza. Dowiedzia³em siê, ¿e Stra¿nicy których wys³a³ Gomez zostali niemal¿e wybici przez hordy o¿ywieñców wype³zaj¹cych spod ziemi. Kopacz twierdzi i¿ widzia³ jakiegoœ nekromantê dzier¿¹cego potê¿ny artefakt, dziêki któremu mo¿e on przywo³ywaæ nieumar³ych. Jeœli to prawda, bêdê siê musia³ z nim zmierzyæ.");
	}
	else 
	{
	B_LogEntry                     (CH4_SupportForQuentin,"Zaraz po zejœciu na dó³ spotka³em rannego Kopacza. Dowiedzia³em siê, ¿e Stra¿nicy których wys³a³ Gomez zostali niemal¿e wybici przez hordy o¿ywieñców wype³zaj¹cych spod ziemi. Kopacz twierdzi i¿ widzia³ jakiegoœ nekromantê dzier¿¹cego potê¿ny artefakt, dziêki któremu mo¿e on przywo³ywaæ nieumar³ych. Jeœli to prawda, bêdê siê musia³ z nim zmierzyæ.");
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
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_01"); //Hej Cieniu! Powinniœmy zamieniæ kilka s³ów.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_02"); //Dobrze. O co chodzi?
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_03"); //Mam nadzieje, ¿e podejdziesz do sprawy powa¿nie. W przeciwieñstwie do Stra¿ników, którzy uwa¿aj¹ to za zwyk³e zabobony Kopaczy...
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_04"); //W pobli¿u obozu grasuje dziwna zjawa.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_05"); //Co takiego?
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_06"); //Kopacze maj¹ tego dosyæ, widz¹ dziwn¹ lataj¹c¹ istotê w okolicach obozu gdy nadchodzi zmierzch.
    AI_Output (other, self ,"DIA_Glest_Zjawa_15_07"); //Brzmi jeszcze dziwniej ni¿ siê spodziewa³em.
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_08"); //Ale to fakt. Choæ sam jej nie widzia³em to wierzê w takie rzeczy.
    AI_Output (self, other ,"DIA_Glest_Zjawa_03_09"); //Kopacze obiecali siê zrzuciæ na nagrodê dla œmia³ka, który przegoni z³ego ducha.
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
   description	= "W ostatecznoœci mogê siê tym zaj¹æ. Mo¿e to zwyk³e zabobony.";
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
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_01"); //W ostatecznoœci mogê siê tym zaj¹æ. Mo¿e to zwyk³e zabobony.
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_02"); //Przekonasz siê, ¿e nie...
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_03"); //Z kim powinienem pomówiæ?
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_04"); //Radzi³bym pomówiæ z Gravo to stary i m¹dry cz³owiek.
    AI_Output (other, self ,"DIA_Glest_Zjawa_2_15_05"); //Porozmawiam z nim.
    AI_Output (self, other ,"DIA_Glest_Zjawa_2_03_06"); //Obyœ spe³ni³ oczekiwania.
	Log_CreateTopic		(Zjawa,	LOG_MISSION);
	Log_SetTopicStatus	(Zjawa,	LOG_RUNNING);
	B_LogEntry               (Zjawa,"Kopacz Glest powiedzia³ mi, ¿e kopacze uskar¿aj¹ siê na nocne widzenia jakiegoœ widma. Stra¿nicy twierdz¹, ¿e to zwyk³a bujda (sam mam równie¿ podobne skojarzenia). Ale zaszkodzi sprawdziæ co siê za tym kryje, zw³aszcza je¿eli dostanê za t¹ jak¹œ rudê. Powinienem pomówiæ z Gravo. ");
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
   description	= "Pokona³em wasz¹ zjawê.";
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
    AI_Output (other, self ,"DIA_Glest_Z_END_15_01"); //Pokona³em wasz¹ zjawê.
    AI_Output (self, other ,"DIA_Glest_Z_END_03_02"); //Tak? Na pewno?
    AI_Output (other, self ,"DIA_Glest_Z_END_15_03"); //Mam Grima za œwiadka.
    AI_Output (self, other ,"DIA_Glest_Z_END_03_04"); //To œwietne wieœci. Jesteœmy twoimi d³u¿nikami.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_05"); //No w³aœnie...
    CreateInvItems (self, ItMiNugget, 115);
    B_GiveInvItems (self, other, ItMiNugget, 115);
    AI_Output (self, other ,"DIA_Glest_Z_END_03_06"); //Zebra³em tê rudê od kopaczy. WeŸ j¹ w podziêce za okazany wysi³ek.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_07"); //Dziêkuje. Zatem op³aca³o siê mieszaæ w t¹ ca³¹ sprawê z widziad³em. 
    AI_Output (self, other ,"DIA_Glest_Z_END_03_08"); //Bywaj ch³opcze i jeszcze raz dziêki za okazan¹ pomoc.
    AI_Output (other, self ,"DIA_Glest_Z_END_15_09"); //W porz¹dku. Na razie.
	B_LogEntry               (Zjawa,"Poinformowa³em Glesta o pokonaniu ich zjawy. Kopacz by³ szczerze uradowany i wyp³aci³ mi nale¿n¹ rudê na, któr¹ zrzucili siê przestraszeni Kopacze.");
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
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_02"); //Œmiertelna nuda. Gorsza jest chyba tylko œmieræ.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_03"); //Nie masz ¿adnego pola do rozwoju?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_04"); //Nie porywam siê z motyk¹ na s³oñce. Znam swoje miejsce w szeregu. Póki siê nie wychylam to ta cholerna Kolonia mo¿e nie po¿re mnie i wydali.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_05"); //Czyli nie chcesz polepszyæ swojego bytu bo boisz siê zmian na gorsze?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_06"); //¯ycie jest przewrotne. Powiedzia³oby ci to wielu tych po, których czêsto chodzimy bo poch³onê³a ich gleba.
    AI_Output (other, self ,"DIA_Glest_HI_Glest_15_07"); //Nie wracasz pracowaæ do kopalni?
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_08"); //Dziêki Bogom nie. Póki co mam spokój bo do codziennego gównianego ¿ywota musia³bym do³o¿yæ pe³zacze.
    AI_Output (self, other ,"DIA_Glest_HI_Glest_03_09"); //Te cholerne, mordercze podziemne stwory.
};

