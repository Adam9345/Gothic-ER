//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Erens_EXIT(C_INFO)
{
	npc             = VLK_517_Buddler;
	nr              = 999;
	condition		= DIA_Erens_EXIT_Condition;
	information		= DIA_Erens_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Erens_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Erens_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Erens_HELLO1 (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_HELLO1_Condition;
   information  = DIA_Erens_HELLO1_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Erens_HELLO1_Condition()
{
	if MIS_ZmianaLorenza == LOG_RUNNING
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Erens_HELLO1_03_01"); //A ty co siê tu tak ostatnio krêcisz, nierobie?
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_02"); //Próbujesz mnie sprowokowaæ? 
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_03"); //A nawet jeœli, to co taki s³abeusz mo¿e mi zrobiæ?
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_04"); //Chcesz siê przekonaæ?
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_05"); //Ja ju¿ swoje najlepsze lata mam za sob¹, gówniarzu. Ale jestem gotów daæ sto bry³ek rudy, na które harowa³em pó³ roku za zobaczenie, jak Naldur obija tê weso³¹ buŸkê.
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_06"); //Bardzo chêtnie odci¹¿ê ciê z rudy. 
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_07"); //PrzyjdŸ, gdy bêdziesz mia³ sto bry³ek rudy. Wtedy pójdziemy do Scatty'ego i zamówimy walkê.
	
	MIS_FightWithNaldur = LOG_RUNNING;


	B_LogEntry              		 (CH1_ZmianaLorenza,"Przechodzi³em sobie obok Kopacza Erensa, gdy ten nagle zacz¹³ mnie obra¿aæ i prowokowaæ. Zaproponowa³ mi, ¿e postawi sto bry³ek rudy, ¿eby zobaczyæ jak przegrywam z Naldurem. Nie dam mu tej przyjemnoœci i wygram walkê z jego kole¿k¹. Pozbawienie Erensa rudy to dobry sposób, na zmuszenie go do powrotu do Kopalni.");	
};

//========================================
//-----------------> ORE
//========================================

INSTANCE DIA_Erens_ORE (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_ORE_Condition;
   information  = DIA_Erens_ORE_Info;
   permanent	= 0;
   description	= "Mam rudê.";
};

FUNC INT DIA_Erens_ORE_Condition()
{
	if MIS_FightWithNaldur == LOG_RUNNING && Npc_HasItems (other,itminugget) >= 100
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_ORE_Info()
{
	AI_Output (other, self ,"DIA_Erens_ORE_15_01"); //Mam rudê.
	AI_Output (self, other ,"DIA_Erens_ORE_03_02"); //A wiêc chodŸmy do Scatty'ego.
	B_GiveInvItems (other,self,itminugget,100);
	Npc_RemoveInvItems (self, itminugget,100);
    B_LogEntry               (CH1_FightWithNaldur,"Da³em Erensowi rudê na zak³ad. Mamy siê spotkaæ u Scatty'ego.");
	Npc_ExchangeRoutine (self,"meetscatty");
	Npc_ExchangeRoutine (GRD_210_Scatty,"zaklady");
};

//========================================
//-----------------> NALDURWIN
//========================================

INSTANCE DIA_Erens_NALDURWIN (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_NALDURWIN_Condition;
   information  = DIA_Erens_NALDURWIN_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Erens_NALDURWIN_Condition()
{
	if MIS_FightWithNaldur == LOG_RUNNING && npc_knowsinfo (hero,DIA_Naldur_LOSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_NALDURWIN_Info()
{
	AI_Output (self, other ,"DIA_Erens_NALDURWIN_03_01"); //Co ty sobie myœla³eœ, œmieciu?! Oczywiste by³o, ¿e Naldur ciê pokona. Dziêki tobie mam teraz tyle rudy, ¿e przez kilka tygodni nie bêdê musia³ nawet palcem kiwn¹æ.
	AI_Output (self, other ,"DIA_Erens_NALDURWIN_03_02"); //Dziêki, mój ty wojowniku. Ha ha ha!
	MIS_FightWithNaldur = LOG_FAILED;
	B_LogEntry               (CH1_ZmianaLorenza,"Erens wygra³ zak³ad, a ja nie popisa³em siê zbytnio ani sprytem, ani umiejêtnoœciami walki. Nie uda³o mi siê z Erensem. Przegra³em zak³ad i Kopacz ma teraz wiêcej rudy ni¿ mia³ wczeœniej. ");	
};

//========================================
//-----------------> NALDURLOSE
//========================================

INSTANCE DIA_Erens_NALDURLOSE (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_NALDURLOSE_Condition;
   information  = DIA_Erens_NALDURLOSE_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Erens_NALDURLOSE_Condition()
{
	if MIS_FightWithNaldur == LOG_RUNNING && npc_knowsinfo (hero,DIA_Naldur_WIN)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_NALDURLOSE_Info()
{
	AI_Output (self, other ,"DIA_Erens_NALDURLOSE_03_01"); //Cholera, czego tu jeszcze chcesz?! 
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_02"); //Przyszed³em popatrzeæ jak siê pakujesz.
	AI_Output (self, other ,"DIA_Erens_NALDURLOSE_03_03"); //CO?!
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_04"); //No chyba nie masz ju¿ rudy. Wkrótce bêdziesz musia³ op³aciæ Stra¿ników. Poza tym Snaf te¿ nie da ci nic za darmo. 
	AI_Output (self, other ,"DIA_Erens_NALDURLOSE_03_05"); //Ty gnoju!
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_06"); //No, ruszaj siê. Spotykamy siê pod chat¹ Lorenzo. Wyruszymy, gdy tylko bêdzie gotowa kolejna zmiana. 
	
	MIS_FightWithNaldur = LOG_SUCCESS;
  

	B_LogEntry               (CH1_ZmianaLorenza,"Erens nieŸle siê wkurzy³, gdy dowiedzia³ siê, ¿e wygra³em walkê z Naldurem. Zosta³ pozbawiony rudy. Musi siê teraz wybraæ do pracy w Kopalni, bo inaczej nie bêdzie mia³ za co ¿yæ.");	
	B_GiveXP (100);
	Npc_ExchangeRoutine (self,"lorenzo");
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_Erens_PERM (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 800;
   condition    = DIA_Erens_PERM_Condition;
   information  = DIA_Erens_PERM_Info;
   permanent	= 1;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Erens_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Erens_PERM_Info()
{
    AI_Output (other, self ,"DIA_Erens_PERM_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Erens_PERM_03_02"); //Mniej wiêcej to samo, co piêtnaœcie lat temu, tylko cz³owiekowi przybywa lat na karku i ubywa si³ w ramionach. 
};

//========================================
//-----------------> THISPLACE
//========================================

INSTANCE DIA_Erens_THISPLACE (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_THISPLACE_Condition;
   information  = DIA_Erens_THISPLACE_Info;
   permanent	= 0;
   description	= "Co mo¿esz mi powiedzieæ o tym miejscu?";
};

FUNC INT DIA_Erens_THISPLACE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Erens_NALDURLOSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_THISPLACE_Info()
{
    AI_Output (other, self ,"DIA_Erens_THISPLACE_15_01"); //Co mo¿esz mi powiedzieæ o tym miejscu? 
    AI_Output (self, other ,"DIA_Erens_THISPLACE_03_02"); //W Starym Obozie mo¿na spotkaæ wys³anników z Sekty. Ka¿¹ siê nazywaæ Baalami, lecz tak naprawdê nimi nie s¹. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_03"); //Otó¿ w obozie na bagnie tytu³ Baala przys³uguje jedynie dla Guru, którzy przewodz¹ Sekcie, a ¿aden z Guru nie robi³by w Starym Obozie za handlarza zielem, czy werbownika. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_04"); //Taranowi i Parvezowi pozwolono u¿ywaæ tego tytu³u jedynie poza Obozem i tylko w stosunku do ludzi spoza Sekty. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_05"); //Chodzi pewnie o to by miejscowi bardziej szanowali tych wys³anników Bractwa, ale i tak wszyscy ich traktuj¹ jak zwyk³ych handlarzy i to handlarzy z wypranymi mózgami. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_06"); //A tak, w obozie na bagnie to ci dwaj 'Baalowie' s¹ jedynie zwyk³ymi Nowicjuszami i w niczym nie ró¿ni¹ siê od tych, których zagania siê do pracy przy mieszaniu bagiennego ziela. 
};

//========================================
//-----------------> PSI
//========================================

INSTANCE DIA_Erens_PSI (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_PSI_Condition;
   information  = DIA_Erens_PSI_Info;
   permanent	= 0;
   description	= "Sk¹d masz t¹ wiedzê o Bractwie?";
};

FUNC INT DIA_Erens_PSI_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Erens_THISPLACE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_PSI_Info()
{
    AI_Output (other, self ,"DIA_Erens_PSI_15_01"); //Sk¹d masz t¹ wiedzê o Bractwie?
    AI_Output (self, other ,"DIA_Erens_PSI_03_02"); //Ma siê te znajomoœci, ale nie bêdê wymienia³ ¿adnych imion – to kwestia honoru i lojalnoœci. 
	AI_Output (self, other ,"DIA_Erens_PSI_03_03"); //Wprawdzie jesteœmy skazañcami, lecz pewne wartoœci z tamtego œwiata dziwnie dobrze sprawdzaj¹ siê i tutaj. 
};

//========================================
//-----------------> BOSS
//========================================

INSTANCE DIA_Erens_BOSS (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_BOSS_Condition;
   information  = DIA_Erens_BOSS_Info;
   permanent	= 0;
   description	= "Kto tu rz¹dzi?";
};

FUNC INT DIA_Erens_BOSS_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Erens_NALDURLOSE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_BOSS_Info()
{
    AI_Output (other, self ,"DIA_Erens_BOSS_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Erens_BOSS_03_02"); //To zale¿y kogo spytasz. 
	AI_Output (other, self ,"DIA_Erens_BOSS_15_03"); //A jak spytam ciebie?
	AI_Output (self, other ,"DIA_Erens_BOSS_03_04"); //To odpowiem, ¿e rz¹dzi tu ten, kto bezkarnie mo¿e str¹ciæ ci g³owê z karku. 
};

//========================================
//-----------------> toMine
//========================================

INSTANCE DIA_Erens_toMine (C_INFO)
{
   npc          = VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Erens_toMine_Condition;
   information  = DIA_Erens_toMine_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Erens_toMine_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Lorenzo_GET_GUILD)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Erens_toMine_Info()
{
    AI_Output (self, other ,"DIA_Erens_toMine_03_02"); //No to idziemy!
	//dzielenie xp
    VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	VLK_517_Buddler.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(VLK_517_Buddler,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (VLK_517_Buddler,"tomine");
	
	//dzielenie xp
    VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	VLK_565_Buddler.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(VLK_565_Buddler,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (VLK_565_Buddler,"tomine");
	
	//dzielenie xp
    VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	VLK_501_Buddler.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(VLK_501_Buddler,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (VLK_501_Buddler,"tomine");
	
	//wyjœcie
    AI_StopProcessInfos	(VLK_577_Buddler);
};

//-----------------------------------------------1.6.1--------------------------------------

//========================================
//-----------------> ZL_BOOK
//========================================

INSTANCE DIA_Buddler_ZL_BOOK (C_INFO)
{
   npc          =  VLK_517_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_ZL_BOOK_Condition;
   information  = DIA_Buddler_ZL_BOOK_Info;
   permanent	= FALSE;
   description	= "Hej s³ysza³em, ¿e masz pewn¹ cenn¹ ksiêgê.";
};

FUNC INT DIA_Buddler_ZL_BOOK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Victor_ZL_2))
{
    return TRUE;
};
};
FUNC VOID DIA_Buddler_ZL_BOOK_Info()
{
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_01"); //Hej s³ysza³em, ¿e masz pewn¹ cenn¹ ksiêgê.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_02"); //Mo¿e i mam.
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_03"); //Chcia³bym j¹ kupiæ.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_04"); //Nie jest na sprzeda¿.
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_05"); //Rzuæ jak¹œ sumê.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_06"); //Powiedzia³em, ¿e nie jest na sprzeda¿.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_07"); //Chocia¿...
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_08"); //Chocia¿ co?
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_09"); //Znam ju¿ na pamiêæ formu³ki z niej. Móg³bym ci j¹ sprzedaæ za 300 bry³ek rudy.
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_10"); //Ile?!
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_11"); //Zaraz powiem 350...

};

//========================================
//-----------------> ZL_STATUE
//========================================

INSTANCE DIA_Buddler_ZL_STATUE (C_INFO)
{
   npc          =  VLK_517_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_ZL_STATUE_Condition;
   information  = DIA_Buddler_ZL_STATUE_Info;
   permanent	= FALSE;
   description	= "No dobra dam ci t¹ rudê. ";
};

FUNC INT DIA_Buddler_ZL_STATUE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buddler_ZL_BOOK))
{
    return TRUE;
};
};
FUNC VOID DIA_Buddler_ZL_STATUE_Info()
{
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_01"); //No dobra dam ci t¹ rudê. 
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_02"); //Wiesz co zmieni³em zdanie. Dobijemy targu jeœli coœ dla mnie zrobisz!
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_04"); //Zgubi³em pewien pos¹¿ek gdzieœ przed obozem.
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_05"); //Mam go znaleŸæ?
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_06"); //Tak. Porozgl¹daj siê i popytaj jeœli spotkasz kogoœ w pobli¿u g³ównej bramy obozu. 
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_07"); //Dobra. Tylko, ju¿ bez kolejnych zachcianek!
	Npc_ExchangeRoutine(VLK_40068_Calum,"Ognisko");
	B_LogEntry               (KsiegaDlaVictora,"Erens ¿¹da 300 bry³ek rudy i przyniesienia pewnego pos¹¿ka, który zgubi³ nieopodal g³ównej bramy do Starego Obozu. Muszê siê tam rozejrzeæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_IHAVE
//========================================

INSTANCE DIA_Buddler_ZL_IHAVE (C_INFO)
{
   npc          =  VLK_517_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_ZL_IHAVE_Condition;
   information  = DIA_Buddler_ZL_IHAVE_Info;
   permanent	= FALSE;
   description	= "Mam pos¹¿ek.";
};

FUNC INT DIA_Buddler_ZL_IHAVE_Condition()
{
if (Npc_HasItems (other, ItMi_ZL_Statue) >=1)
&& (Npc_KnowsInfo(hero,DIA_Calum_ZL_NUGGET))
{
    return TRUE;
};
};
FUNC VOID DIA_Buddler_ZL_IHAVE_Info()
{
    AI_Output (other, self ,"DIA_Buddler_ZL_IHAVE_15_01"); //Mam pos¹¿ek.
    AI_Output (self, other ,"DIA_Buddler_ZL_IHAVE_03_02"); //Dawaj.
	B_GiveInvItems (other,self, ItMi_ZL_Statue, 1);
    AI_Output (other, self ,"DIA_Buddler_ZL_IHAVE_15_03"); //Masz.
    AI_Output (self, other ,"DIA_Buddler_ZL_IHAVE_03_04"); //No to teraz mo¿emy wróciæ do tematu ksiêgi.
	Npc_ExchangeRoutine(VLK_40068_Calum,"Start");
	B_LogEntry               (KsiegaDlaVictora,"Da³em figurkê Erensowi. Teraz muszê jeszcze zap³aciæ 300 bry³ek rudy.");
};

//========================================
//-----------------> ZL_GIVE_NUGGET
//========================================

INSTANCE DIA_Buddler_ZL_GIVE_NUGGET (C_INFO)
{
   npc          =  VLK_517_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_ZL_GIVE_NUGGET_Condition;
   information  = DIA_Buddler_ZL_GIVE_NUGGET_Info;
   permanent	= FALSE;
   description	= "Masz tu 300 bry³ek.";
};

FUNC INT DIA_Buddler_ZL_GIVE_NUGGET_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buddler_ZL_IHAVE)) 
&& (Npc_HasItems (other, itminugget) >= 300)
{
    return TRUE;
};
};
FUNC VOID DIA_Buddler_ZL_GIVE_NUGGET_Info()
{
    AI_Output (other, self ,"DIA_Buddler_ZL_GIVE_NUGGET_15_01"); //Masz tu 300 bry³ek.
	B_GiveInvItems (other,self, itminugget, 300);
	B_GiveInvItems (self,other, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Buddler_ZL_GIVE_NUGGET_03_02"); //Dziêki. Trzymaj ksiêgê, tylko j¹ szanuj jest... Unikalna.
    AI_Output (other, self ,"DIA_Buddler_ZL_GIVE_NUGGET_15_03"); //W porz¹dku.
	B_LogEntry               (KsiegaDlaVictora,"Zap³aci³em Erensowi wystarczaj¹co rudy i kupi³em ksiêgê dla Victora.");
    AI_StopProcessInfos	(self);
};

instance dia_vlk_517_pickpocket(c_info) {
    npc = vlk_517_buddler;
    nr = 900;
    condition = dia_vlk_517_pickpocket_condition;
    information = dia_vlk_517_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_517_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_517_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_517_pickpocket);
	info_addchoice(dia_vlk_517_pickpocket, dialog_back, dia_vlk_517_pickpocket_back);
	info_addchoice(dia_vlk_517_pickpocket, dialog_pickpocket, dia_vlk_517_pickpocket_doit);
};

func void dia_vlk_517_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_vlk_517_pickpocket);
};

func void dia_vlk_517_pickpocket_back() {
    info_clearchoices(dia_vlk_517_pickpocket);
};