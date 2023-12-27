//========================================
//-----------------> HelpWithVine
//========================================

INSTANCE DIA_Gulris_HelpWithVine (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_HelpWithVine_Condition;
   information  = DIA_Gulris_HelpWithVine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gulris_HelpWithVine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snaf_Margunios))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HelpWithVine_Info()
{
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_01"); //Hej, ty. S³ysza³em o czym rozmawia³eœ ze Snafem i chyba by³bym w stanie ci pomóc. 
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_15_02"); //Ale?
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_03"); //Koñczy mi siê ruda, a œrednio chce mi siê wracaæ na kolejne tygodnie do rycia w kopalni. 
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_15_04"); //Ile?
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_03_05"); //45 bry³ek.

    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Nie mam tylu.", DIA_Gulris_HelpWithVine_Nope);
	if (Npc_HasItems(hero,itminugget) >=30)
	{
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Dam 30 bry³ek.", DIA_Gulris_HelpWithVine_30Ore);
	};
	if (Npc_HasItems(hero,itminugget) >=45)
	{
    Info_AddChoice		(DIA_Gulris_HelpWithVine, "Masz te 45 bry³ek, tylko gadaj szybko.", DIA_Gulris_HelpWithVine_45Ore);
	};
};

FUNC VOID DIA_Gulris_HelpWithVine_Nope()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_Nope_15_01"); //Nie mam tylu.
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_Nope_03_02"); //To przyjdŸ jak bêdziesz mia³.
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	HeroNeedCollectMoreOre_VLK_560 = true;
};

FUNC VOID DIA_Gulris_HelpWithVine_30Ore()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_30Ore_15_01"); //Dam 30 bry³ek.
    AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieliœmy tutaj takiego jednego, co pracowa³ w winiarni - nazywa³ siê Abel. Jak siê z nim o tym gada³o, to widaæ by³o, ¿e wie o czym mówi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Koleœ jednak zadawa³ siê z Bandytami, wiêc siê stra¿om, delikatnie mówi¹c, narazi³. W ramach kary wys³ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia³ po prostu lepszy dzieñ. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju¿ od kilku miesiêcy i jak go ostatnim razem widzia³em, to jeszcze ¿y³. Jak chcesz, to pogadaj z nim. 
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn¹ pomoc finansow¹ zdradzi³ mi, ¿e niejaki Abel z obozu przed Star¹ Kopalni¹ zna siê na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 30);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (75);
};

FUNC VOID DIA_Gulris_HelpWithVine_45Ore()
{
    AI_Output (other, self ,"DIA_Gulris_HelpWithVine_45Ore_15_01"); //Masz te 45 bry³ek, tylko gadaj szybko.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieliœmy tutaj takiego jednego, co pracowa³ w winiarni - nazywa³ siê Abel. Jak siê z nim o tym gada³o, to widaæ by³o, ¿e wie o czym mówi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Koleœ jednak zadawa³ siê z Bandytami, wiêc siê stra¿om, delikatnie mówi¹c, narazi³. W ramach kary wys³ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia³ po prostu lepszy dzieñ. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju¿ od kilku miesiêcy i jak go ostatnim razem widzia³em, to jeszcze ¿y³. Jak chcesz, to pogadaj z nim. 
    Info_ClearChoices		(DIA_Gulris_HelpWithVine);
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn¹ pomoc finansow¹ zdradzi³ mi, ¿e niejaki Abel z obozu przed Star¹ Kopalni¹ zna siê na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 45);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (50);
};

//========================================
//-----------------> 45OreGive
//========================================

INSTANCE DIA_Gulris_45OreGive (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_45OreGive_Condition;
   information  = DIA_Gulris_45OreGive_Info;
   permanent	= FALSE;
   description	= "Mam przy sobie 45 bry³ek rudy.";
};

FUNC INT DIA_Gulris_45OreGive_Condition()
{
    if (HeroNeedCollectMoreOre_VLK_560 == true)
    && (Npc_HasItems (hero, ItMiNugget)>=45)
	&& (MIS_GhoransVine == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_45OreGive_Info()
{
    AI_Output (other, self ,"DIA_Gulris_45OreGive_15_01"); //Mam przy sobie 45 bry³ek rudy.
    AI_Output (self, other ,"DIA_Gulris_45OreGive_03_02"); //Dawaj!
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_02"); //No dobra.
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_03"); //Mieliœmy tutaj takiego jednego, co pracowa³ w winiarni - nazywa³ siê Abel. Jak siê z nim o tym gada³o, to widaæ by³o, ¿e wie o czym mówi. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_04"); //Koleœ jednak zadawa³ siê z Bandytami, wiêc siê stra¿om, delikatnie mówi¹c, narazi³. W ramach kary wys³ano go do kopalni, ale bez prawa powrotu. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_05"); //W sumie nie wiem czemu go nie zabili - chyba Thorus mia³ po prostu lepszy dzieñ. 
	AI_Output (self, other ,"DIA_Gulris_HelpWithVine_30Ore_03_06"); //Abel przebywa tam ju¿ od kilku miesiêcy i jak go ostatnim razem widzia³em, to jeszcze ¿y³. Jak chcesz, to pogadaj z nim. 
	
    AI_StopProcessInfos	(self);
	
	B_LogEntry			(CH1_GhoransVine, "Kopacz Gulris w zamian za drobn¹ pomoc finansow¹ zdradzi³ mi, ¿e niejaki Abel z obozu przed Star¹ Kopalni¹ zna siê na rzeczy.");
	
	B_GiveInvItems (other, self, itminugget, 45);
	HeroKnowAbelIsWinemaker = true;
	B_GiveXP (50);
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gulris_EXIT(C_INFO)
{
	npc             = VLK_560_Buddler;
	nr              = 999;
	condition	= DIA_Gulris_EXIT_Condition;
	information	= DIA_Gulris_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gulris_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gulris_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gulris_HELLO1 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 1;
   condition    = DIA_Gulris_HELLO1_Condition;
   information  = DIA_Gulris_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Gulris_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gulris_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gulris_HELLO1_03_02"); //Jestem Gulris, Kopacz i skazaniec, ale to tak jak wszyscy pod t¹ Magiczn¹ Barier¹.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gulris_HELLO2 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 2;
   condition    = DIA_Gulris_HELLO2_Condition;
   information  = DIA_Gulris_HELLO2_Info;
   permanent	= FALSE;
   description	= "Przecie¿ nie wszyscy s¹ Kopaczami. ";
};

FUNC INT DIA_Gulris_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO2_15_01"); //Przecie¿ nie wszyscy s¹ Kopaczami. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_02"); //Ale ¿ycie wszystkich w Kolonii Karnej podporz¹dkowane jest jednemu celowi - wydobyciu magicznej rudy. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_03"); //Magnaci s¹ od tego, by prowadziæ handel rud¹ ze Œwiatem Zewnêtrznym, Stra¿nicy, by pilnowaæ Kopaczy.
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_04"); //A Cienie? No có¿, pe³ni¹ podobn¹ funkcjê jak Stra¿nicy, tylko w przeciwieñstwie do Stra¿ników nie zdzieraj¹ z nas rudy. No mo¿e nie do koñca, bo to w rêkach Cieni le¿y handel w naszym obozie, wiêc i tak na swój sposób nas obdzieraj¹. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_05"); //Po co s¹ Kopacze, to chyba nie muszê ju¿ mówiæ. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_06"); //Jak sam wiêc widzisz, wszystko w Górniczej Dolinie ³¹czy siê z magiczn¹ rud¹. 
    AI_Output (self, other ,"DIA_Gulris_HELLO2_03_07"); //Jak siê na to tak spojrzy, to nawet Magnaci s¹ jedynie trybikiem w tej ca³ej górniczej maszynie. 
    AI_Output (other, self ,"DIA_Gulris_HELLO2_15_08"); //W sumie racja. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gulris_HELLO3 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 3;
   condition    = DIA_Gulris_HELLO3_Condition;
   information  = DIA_Gulris_HELLO3_Info;
   permanent	= FALSE;
   description	= "A co z innymi obozami? ";
};

FUNC INT DIA_Gulris_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO3_15_01"); //A co z innymi obozami? 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_02"); //W Starej Kopalni - ryj¹. W Wolnej Kopalni te¿ ryj¹. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_03"); //Tylko u sekciarzy nie ma ¿adnego wydobycia rudy, ale i oni pe³ni¹ tu pewn¹ rolê. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_04"); //Nawet oni, kiedy z nimi handlujemy, to wszystko odbywa siê za pomoc¹ magicznej rudy. 
    AI_Output (self, other ,"DIA_Gulris_HELLO3_03_05"); //Wszystko wiêc sprowadza siê do jednego. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gulris_HELLO4 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 4;
   condition    = DIA_Gulris_HELLO4_Condition;
   information  = DIA_Gulris_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz¹dzi?";
};

FUNC INT DIA_Gulris_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO4_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Gulris_HELLO4_03_02"); //Magiczna ruda! 
    AI_Output (other, self ,"DIA_Gulris_HELLO4_15_03"); //Gomez z pewnoœci¹ by siê ucieszy³ gdyby to us³ysza³.
	AI_Output (self, other ,"DIA_Gulris_HELLO4_03_04"); //Ej, chwila. Przecie¿ mu tego nie powiesz. Nie masz z nim ¿adnego kontaktu. 
	AI_Output (other, self ,"DIA_Gulris_HELLO4_15_05"); //Jesteœ pewny?
	AI_Output (self, other ,"DIA_Gulris_HELLO4_03_06"); //Ten... no... Za Gomeza! 
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Gulris_HELLO5 (C_INFO)
{
   npc          = VLK_560_Buddler;
   nr           = 5;
   condition    = DIA_Gulris_HELLO5_Condition;
   information  = DIA_Gulris_HELLO5_Info;
   permanent	= 0;
   description	= "Wiêc kto wed³ug ciebie tu rz¹dzi?";
};

FUNC INT DIA_Gulris_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gulris_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gulris_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Gulris_HELLO5_15_01"); //Wiêc kto wed³ug ciebie tu rz¹dzi?
    AI_Output (self, other ,"DIA_Gulris_HELLO5_03_02"); //Gomez... Oczywiœcie, ¿e Gomez.
};

