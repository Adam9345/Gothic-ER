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
    AI_Output (self, other ,"DIA_Erens_HELLO1_03_01"); //A ty co si� tu tak ostatnio kr�cisz, nierobie?
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_02"); //Pr�bujesz mnie sprowokowa�? 
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_03"); //A nawet je�li, to co taki s�abeusz mo�e mi zrobi�?
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_04"); //Chcesz si� przekona�?
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_05"); //Ja ju� swoje najlepsze lata mam za sob�, g�wniarzu. Ale jestem got�w da� sto bry�ek rudy, na kt�re harowa�em p� roku za zobaczenie, jak Naldur obija t� weso�� bu�k�.
	AI_Output (other, self ,"DIA_Erens_HELLO1_15_06"); //Bardzo ch�tnie odci��� ci� z rudy. 
	AI_Output (self, other ,"DIA_Erens_HELLO1_03_07"); //Przyjd�, gdy b�dziesz mia� sto bry�ek rudy. Wtedy p�jdziemy do Scatty'ego i zam�wimy walk�.
	
	MIS_FightWithNaldur = LOG_RUNNING;


	B_LogEntry              		 (CH1_ZmianaLorenza,"Przechodzi�em sobie obok Kopacza Erensa, gdy ten nagle zacz�� mnie obra�a� i prowokowa�. Zaproponowa� mi, �e postawi sto bry�ek rudy, �eby zobaczy� jak przegrywam z Naldurem. Nie dam mu tej przyjemno�ci i wygram walk� z jego kole�k�. Pozbawienie Erensa rudy to dobry spos�b, na zmuszenie go do powrotu do Kopalni.");	
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
   description	= "Mam rud�.";
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
	AI_Output (other, self ,"DIA_Erens_ORE_15_01"); //Mam rud�.
	AI_Output (self, other ,"DIA_Erens_ORE_03_02"); //A wi�c chod�my do Scatty'ego.
	B_GiveInvItems (other,self,itminugget,100);
	Npc_RemoveInvItems (self, itminugget,100);
    B_LogEntry               (CH1_FightWithNaldur,"Da�em Erensowi rud� na zak�ad. Mamy si� spotka� u Scatty'ego.");
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
	AI_Output (self, other ,"DIA_Erens_NALDURWIN_03_01"); //Co ty sobie my�la�e�, �mieciu?! Oczywiste by�o, �e Naldur ci� pokona. Dzi�ki tobie mam teraz tyle rudy, �e przez kilka tygodni nie b�d� musia� nawet palcem kiwn��.
	AI_Output (self, other ,"DIA_Erens_NALDURWIN_03_02"); //Dzi�ki, m�j ty wojowniku. Ha ha ha!
	MIS_FightWithNaldur = LOG_FAILED;
	B_LogEntry               (CH1_ZmianaLorenza,"Erens wygra� zak�ad, a ja nie popisa�em si� zbytnio ani sprytem, ani umiej�tno�ciami walki. Nie uda�o mi si� z Erensem. Przegra�em zak�ad i Kopacz ma teraz wi�cej rudy ni� mia� wcze�niej. ");	
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
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_02"); //Przyszed�em popatrze� jak si� pakujesz.
	AI_Output (self, other ,"DIA_Erens_NALDURLOSE_03_03"); //CO?!
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_04"); //No chyba nie masz ju� rudy. Wkr�tce b�dziesz musia� op�aci� Stra�nik�w. Poza tym Snaf te� nie da ci nic za darmo. 
	AI_Output (self, other ,"DIA_Erens_NALDURLOSE_03_05"); //Ty gnoju!
	AI_Output (other, self ,"DIA_Erens_NALDURLOSE_15_06"); //No, ruszaj si�. Spotykamy si� pod chat� Lorenzo. Wyruszymy, gdy tylko b�dzie gotowa kolejna zmiana. 
	
	MIS_FightWithNaldur = LOG_SUCCESS;
  

	B_LogEntry               (CH1_ZmianaLorenza,"Erens nie�le si� wkurzy�, gdy dowiedzia� si�, �e wygra�em walk� z Naldurem. Zosta� pozbawiony rudy. Musi si� teraz wybra� do pracy w Kopalni, bo inaczej nie b�dzie mia� za co �y�.");	
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
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Erens_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Erens_PERM_Info()
{
    AI_Output (other, self ,"DIA_Erens_PERM_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Erens_PERM_03_02"); //Mniej wi�cej to samo, co pi�tna�cie lat temu, tylko cz�owiekowi przybywa lat na karku i ubywa si� w ramionach. 
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
   description	= "Co mo�esz mi powiedzie� o tym miejscu?";
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
    AI_Output (other, self ,"DIA_Erens_THISPLACE_15_01"); //Co mo�esz mi powiedzie� o tym miejscu? 
    AI_Output (self, other ,"DIA_Erens_THISPLACE_03_02"); //W Starym Obozie mo�na spotka� wys�annik�w z Sekty. Ka�� si� nazywa� Baalami, lecz tak naprawd� nimi nie s�. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_03"); //Ot� w obozie na bagnie tytu� Baala przys�uguje jedynie dla Guru, kt�rzy przewodz� Sekcie, a �aden z Guru nie robi�by w Starym Obozie za handlarza zielem, czy werbownika. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_04"); //Taranowi i Parvezowi pozwolono u�ywa� tego tytu�u jedynie poza Obozem i tylko w stosunku do ludzi spoza Sekty. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_05"); //Chodzi pewnie o to by miejscowi bardziej szanowali tych wys�annik�w Bractwa, ale i tak wszyscy ich traktuj� jak zwyk�ych handlarzy i to handlarzy z wypranymi m�zgami. 
	AI_Output (self, other ,"DIA_Erens_THISPLACE_03_06"); //A tak, w obozie na bagnie to ci dwaj 'Baalowie' s� jedynie zwyk�ymi Nowicjuszami i w niczym nie r�ni� si� od tych, kt�rych zagania si� do pracy przy mieszaniu bagiennego ziela. 
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
   description	= "Sk�d masz t� wiedz� o Bractwie?";
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
    AI_Output (other, self ,"DIA_Erens_PSI_15_01"); //Sk�d masz t� wiedz� o Bractwie?
    AI_Output (self, other ,"DIA_Erens_PSI_03_02"); //Ma si� te znajomo�ci, ale nie b�d� wymienia� �adnych imion � to kwestia honoru i lojalno�ci. 
	AI_Output (self, other ,"DIA_Erens_PSI_03_03"); //Wprawdzie jeste�my skaza�cami, lecz pewne warto�ci z tamtego �wiata dziwnie dobrze sprawdzaj� si� i tutaj. 
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
   description	= "Kto tu rz�dzi?";
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
    AI_Output (other, self ,"DIA_Erens_BOSS_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Erens_BOSS_03_02"); //To zale�y kogo spytasz. 
	AI_Output (other, self ,"DIA_Erens_BOSS_15_03"); //A jak spytam ciebie?
	AI_Output (self, other ,"DIA_Erens_BOSS_03_04"); //To odpowiem, �e rz�dzi tu ten, kto bezkarnie mo�e str�ci� ci g�ow� z karku. 
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
	
	//wyj�cie
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
   description	= "Hej s�ysza�em, �e masz pewn� cenn� ksi�g�.";
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
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_01"); //Hej s�ysza�em, �e masz pewn� cenn� ksi�g�.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_02"); //Mo�e i mam.
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_03"); //Chcia�bym j� kupi�.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_04"); //Nie jest na sprzeda�.
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_05"); //Rzu� jak�� sum�.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_06"); //Powiedzia�em, �e nie jest na sprzeda�.
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_07"); //Chocia�...
    AI_Output (other, self ,"DIA_Buddler_ZL_BOOK_15_08"); //Chocia� co?
    AI_Output (self, other ,"DIA_Buddler_ZL_BOOK_03_09"); //Znam ju� na pami�� formu�ki z niej. M�g�bym ci j� sprzeda� za 300 bry�ek rudy.
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
   description	= "No dobra dam ci t� rud�. ";
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
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_01"); //No dobra dam ci t� rud�. 
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_02"); //Wiesz co zmieni�em zdanie. Dobijemy targu je�li co� dla mnie zrobisz!
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_04"); //Zgubi�em pewien pos��ek gdzie� przed obozem.
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_05"); //Mam go znale��?
    AI_Output (self, other ,"DIA_Buddler_ZL_STATUE_03_06"); //Tak. Porozgl�daj si� i popytaj je�li spotkasz kogo� w pobli�u g��wnej bramy obozu. 
    AI_Output (other, self ,"DIA_Buddler_ZL_STATUE_15_07"); //Dobra. Tylko, ju� bez kolejnych zachcianek!
	Npc_ExchangeRoutine(VLK_40068_Calum,"Ognisko");
	B_LogEntry               (KsiegaDlaVictora,"Erens ��da 300 bry�ek rudy i przyniesienia pewnego pos��ka, kt�ry zgubi� nieopodal g��wnej bramy do Starego Obozu. Musz� si� tam rozejrze�.");
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
   description	= "Mam pos��ek.";
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
    AI_Output (other, self ,"DIA_Buddler_ZL_IHAVE_15_01"); //Mam pos��ek.
    AI_Output (self, other ,"DIA_Buddler_ZL_IHAVE_03_02"); //Dawaj.
	B_GiveInvItems (other,self, ItMi_ZL_Statue, 1);
    AI_Output (other, self ,"DIA_Buddler_ZL_IHAVE_15_03"); //Masz.
    AI_Output (self, other ,"DIA_Buddler_ZL_IHAVE_03_04"); //No to teraz mo�emy wr�ci� do tematu ksi�gi.
	Npc_ExchangeRoutine(VLK_40068_Calum,"Start");
	B_LogEntry               (KsiegaDlaVictora,"Da�em figurk� Erensowi. Teraz musz� jeszcze zap�aci� 300 bry�ek rudy.");
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
   description	= "Masz tu 300 bry�ek.";
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
    AI_Output (other, self ,"DIA_Buddler_ZL_GIVE_NUGGET_15_01"); //Masz tu 300 bry�ek.
	B_GiveInvItems (other,self, itminugget, 300);
	B_GiveInvItems (self,other, ItWr_ZL_Sattik, 1);
    AI_Output (self, other ,"DIA_Buddler_ZL_GIVE_NUGGET_03_02"); //Dzi�ki. Trzymaj ksi�g�, tylko j� szanuj jest... Unikalna.
    AI_Output (other, self ,"DIA_Buddler_ZL_GIVE_NUGGET_15_03"); //W porz�dku.
	B_LogEntry               (KsiegaDlaVictora,"Zap�aci�em Erensowi wystarczaj�co rudy i kupi�em ksi�g� dla Victora.");
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