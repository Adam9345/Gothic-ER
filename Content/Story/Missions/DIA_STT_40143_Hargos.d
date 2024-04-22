//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hargos_EXIT(C_INFO)
{
	npc             = STT_40143_Hargos;
	nr              = 999;
	condition	= DIA_Hargos_EXIT_Condition;
	information	= DIA_Hargos_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Hargos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hargos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hargos_HELLO1 (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_HELLO1_Condition;
   information  = DIA_Hargos_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Hargos_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hargos_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_02"); //Jestem Hargos i pracuje jako drwal. 
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_03"); //Masz du�o roboty?
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_04"); //Ca�kiem sporo, chocia� pomaga mi Akl. Ponadto, chodz� s�uchy, �e Magnaci planuj� rozbudow� obozowiska przed kopalni�.
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_05"); //A co za tym idzie, b�d� potrzebowali do tego surowc�w, a wi�c g��wnie drewna.
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_06"); //Czyli pewnie b�dziesz mia� pe�ne r�ce roboty.
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_07"); //Tak. Dla wielu by�aby to mord�ga i kolejny pow�d by da� nog� do innego obozu, albo ze sob� sko�czy� C�. Nie dla mnie
};

//========================================
//-----------------> ZND
//========================================

INSTANCE DIA_Hargos_ZND (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 2;
   condition    = DIA_Hargos_ZND_Condition;
   information  = DIA_Hargos_ZND_Info;
   permanent	= FALSE;
   description	= "Czy mog� co� dla ciebie zrobi�?";
};

FUNC INT DIA_Hargos_ZND_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hargos_HELLO1))
&& (Npc_GetTrueGuild(hero) == GIL_GRD)
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_Info()
{
    AI_Output (other, self ,"DIA_Hargos_ZND_15_01"); //Czy mog� co� dla ciebie zrobi�?
    AI_Output (self, other ,"DIA_Hargos_ZND_03_02"); //W sumie tak... Ale to robota tylko dla Stra�nika. To musi by� kto� silny i sprawny. Kto� kto naprawd� si� nie boi le�nych stwor�w.
    AI_Output (other, self ,"DIA_Hargos_ZND_15_03"); //Jak widziesz, jestem stra�nikiem.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_04"); //Dobrze. Umiesz wi�c odpowiednio macha� mieczem i przyj�� na siebie kilka cios�w gdy trzeba.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_05"); //W zwi�zku z dalsz� planowan� rozbudow� obozowiska pod kopalni� potrzeba wielkich ilo�ci drewna.
    AI_Output (other, self ,"DIA_Hargos_ZND_15_06"); //Nie macie go wystarczaj�co?
    AI_Output (self, other ,"DIA_Hargos_ZND_03_07"); //Na dalsze prosperowanie obozowiska w tym kszta�cie a� nadto, ale je�li chcemy je rozbudowa� to potrzeba go wi�cej.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_08"); //Musz� wi�c uda� si� po drewno do lasu. Potrzebuje ochrony.  
};

//========================================
//-----------------> ZND_PRIZE
//========================================

INSTANCE DIA_Hargos_ZND_PRIZE (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 3;
   condition    = DIA_Hargos_ZND_PRIZE_Condition;
   information  = DIA_Hargos_ZND_PRIZE_Info;
   permanent	= FALSE;
   description	= "Dostan� za to jakie� wynagrodzenie?";
};

FUNC INT DIA_Hargos_ZND_PRIZE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hargos_ZND))
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_PRIZE_Info()
{
    AI_Output (other, self ,"DIA_Hargos_ZND_PRIZE_15_01"); //Dostan� za to jakie� wynagrodzenie?
    AI_Output (self, other ,"DIA_Hargos_ZND_PRIZE_03_02"); //Jasne. Po naszym powrocie udaj si� do Spike�a po zap�at�. 
    AI_Output (self, other ,"DIA_Hargos_ZND_PRIZE_03_03"); //To jak b�dzie?
};

//========================================
//-----------------> ZND_GO
//========================================

INSTANCE DIA_Hargos_ZND_GO (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 4;
   condition    = DIA_Hargos_ZND_GO_Condition;
   information  = DIA_Hargos_ZND_GO_Info;
   permanent	= FALSE;
   description	= "Wchodz� w to, ruszajmy.";
};

FUNC INT DIA_Hargos_ZND_GO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hargos_ZND_PRIZE))
{
    return TRUE;
};
};  
FUNC VOID DIA_Hargos_ZND_GO_Info()
{
    AI_Output (other, self ,"DIA_Hargos_ZND_GO_15_01"); //Wchodz� w to, ruszajmy.
    AI_Output (self, other ,"DIA_Hargos_ZND_GO_03_02"); //�wietnie, zatem w drog�. Chod� za mn�.
	Npc_ExchangeRoutine (STT_40143_Hargos,"Forest");
	Wld_SendTrigger     ("ZND_TENT");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY1");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY2");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY3");
    Wld_InsertNpc		(Warg_Znd,"WP_ZND_ENEMY4");
	STT_40143_Hargos.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Drwal Hargos chcia�by uda� si� do lasu by pozyska� nieco drewna do obozowiska pod Star� Kopalni�. Jako Stra�nik, mam go eskortowa�. Przysta�em na jego propozycje.");
	Log_CreateTopic		     (ZapotrzebowanieNaDrewno,	LOG_MISSION);
	Log_SetTopicStatus    	 (ZapotrzebowanieNaDrewno,	LOG_RUNNING);
	// WP_ZND_ENEMY4-1 PlayVideo ("er_cutscene_uturiel.bik"); 
};

//========================================
//-----------------> ZND_FOREST
//========================================

INSTANCE DIA_Hargos_ZND_FOREST (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_ZND_FOREST_Condition;
   information  = DIA_Hargos_ZND_FOREST_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hargos_ZND_FOREST_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hargos_ZND_PRIZE))
&& (Npc_GetDistToWP(self,"OW_PATH_004")<2000)
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_FOREST_Info()
{
    AI_Output (self, other ,"DIA_Hargos_ZND_FOREST_03_01"); //Uwa�aj. Teraz miej oczy szeroko otwarte. To niebezpieczne miejsce. Ja musz� si� skoncentrowa� na pracy, a Ty na tym, bym wyszed� z tego lasu �ywy.
    AI_Output (other, self ,"DIA_Hargos_ZND_FOREST_15_02"); //Damy rad�. Daleko masz swoje stanowisko pracy?
    AI_Output (self, other ,"DIA_Hargos_ZND_FOREST_03_03"); //Niedaleko, na skraju lasu. Mam nadziej� �e nie zal�g�o si� tam - Beliar wie co.
    AI_Output (other, self ,"DIA_Hargos_ZND_FOREST_15_04"); //To si� oka�e, ruszajmy dalej.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarli�my pod las. Teraz musimy by� szczeg�lnie ostro�ni. Nie wiadomo co czai si� dalej.");
	Npc_ExchangeRoutine (self,"Guide");
};
var int Hero_Use_BenchZND;
//========================================
//-----------------> ZND_WORK
//========================================

INSTANCE DIA_Hargos_ZND_WORK (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 2;
   condition    = DIA_Hargos_ZND_WORK_Condition;
   information  = DIA_Hargos_ZND_WORK_Info;
   permanent	= FALSE;
   description	= "Mo�esz teraz pracowa� w spokoju.";
};

FUNC INT DIA_Hargos_ZND_WORK_Condition()
{
if (Npc_IsDead (Warg_Znd))
&& (Npc_KnowsInfo(hero,DIA_Hargos_ZND_FOREST))
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_WORK_Info()
{
    AI_Output (other, self ,"DIA_Hargos_ZND_WORK_15_01"); //Mo�esz teraz pracowa� w spokoju.
    AI_Output (self, other ,"DIA_Hargos_ZND_WORK_03_02"); //Oczywi�cie. Daj mi kika godzin na prac�. Obok jest �awka, mo�esz troch� odpocz��.
    AI_Output (self, other ,"DIA_Hargos_ZND_WORK_03_03"); //Mo�e zd��e sko�czy�, nim co� zn�w tu przylezie.
    AI_Output (other, self ,"DIA_Hargos_ZND_WORK_15_04"); //Dobra.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarli�my pod stanowisko pracy Hargosa. Wybi�em wszystko, co mog�o nam zagra�a�. Teraz mog� chwil� odsapn�� a nawet si� zdrzemn��. Drwal popracuje minimum kilka godzin.");
	Npc_ExchangeRoutine (self,"WORK");
	Hero_Use_BenchZND = TRUE;
};

//========================================
//-----------------> Hargos_Get_Wood
//========================================

INSTANCE DIA_Hargos_Hargos_Get_Wood (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 3;
   condition    = DIA_Hargos_Hargos_Get_Wood_Condition;
   information  = DIA_Hargos_Hargos_Get_Wood_Info;
   permanent	= FALSE;
   description  = "Sko�czy�e� ju�?";
};

FUNC INT DIA_Hargos_Hargos_Get_Wood_Condition()
{
    if (Hargos_End_Work == TRUE) 
	//&& (Npc_GetDistToWP(hero,"LOCATION_11_04")<3000)
	//&& (
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_Hargos_Get_Wood_Info()
{
    AI_Output (other, self ,"DIA_Hargos_Hargos_Get_Wood_15_01"); //Sko�czy�e� ju�?
    AI_Output (self, other ,"DIA_Hargos_Hargos_Get_Wood_03_02"); //Zrobione. Pozyska�em wystarczaj�co du�o drewna. 
    AI_Output (self, other ,"DIA_Hargos_Hargos_Get_Wood_03_03"); //We� te deski le��ce obok pnia. Podzielimy si� po po�owie. Oddasz mi je w pod kopalni�. 
    AI_Output (other, self ,"DIA_Hargos_Hargos_Get_Wood_15_04"); //Jasne.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Mo�emy wraca� do obozu. Hargos da� mi po�ow� desek, kt�re mam zanie�� pod kopalnie. Nie mog� zapomnie�, by wci�� go ochraniac.");
	Wld_InsertNpc				(ORG_40145_Rozbojnik,"WP_ZND_ROZ1");			
			
	Npc_ExchangeRoutine(STT_40143_Hargos,"GuideBack");
};

//========================================
//-----------------> ZND_GoBack
//========================================

INSTANCE DIA_Hargos_ZND_GoBack (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_ZND_GoBack_Condition;
   information  = DIA_Hargos_ZND_GoBack_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hargos_ZND_GoBack_Condition()
{
 if (Npc_IsDead (ORG_40144_Rozbojnik))
 && (Npc_IsDead (ORG_40145_Rozbojnik))
 && (Npc_IsDead (ORG_40146_Rozbojnik))
 && (Npc_KnowsInfo(hero,DIA_Rozbojnik_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_GoBack_Info()
{
    AI_Output (self, other ,"DIA_Hargos_ZND_GoBack_03_01"); //Zmywajmy si� st�d.
    AI_Output (other, self ,"DIA_Hargos_ZND_GoBack_15_02"); //Racja, lepiej ju� chod�my.
    AI_Output (self, other ,"DIA_Hargos_ZND_GoBack_03_03"); //Wystarczy mi na dzi� tych niemi�ych niespodzianek. Za mn�.
	Npc_ExchangeRoutine(self,"GuideBackC");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZND_OMINE
//========================================

INSTANCE DIA_Hargos_ZND_OMINE (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_ZND_OMINE_Condition;
   information  = DIA_Hargos_ZND_OMINE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hargos_ZND_OMINE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hargos_ZND_GoBack))
&& (Npc_GetDistToWP(STT_40143_Hargos,"ENTER_CAMP")<300)
&& (Npc_HasItems (other, ItMi_HargosWood) >=3)
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_ZND_OMINE_Info()
{
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_01"); //No to jeste�my.
    AI_Output (other, self ,"DIA_Hargos_ZND_OMINE_15_02"); //Masz reszt� tych desek.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_03"); //Dzi�ki. �wietny z ciebie wojownik.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_04"); //Lepiej nie da�o si� chyba tego zrobi�. Teraz b�d� wiedzia� na kim polega� w przysz�o�ci.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_05"); //Udaj si� teraz po zap�ate do Spike�a. Ja wracam do swojego stanowiska pracy.
    AI_Output (other, self ,"DIA_Hargos_ZND_OMINE_15_06"); //Tak zrobi�. Na razie.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_07"); //Do zobaczenia.

	B_GiveInvItems (other,self, ItMi_HargosWood, 3);
	Npc_RemoveInvItems (STT_40143_Hargos, ItMi_HargosWood,3);
	Npc_ExchangeRoutine(STT_40143_Hargos,"Start");
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarli�my pod Star� Kopalnie. Odda�em niesione deski Hargosowi. Teraz mam uda� si� po zap�at� do Spike�a. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GRD
//========================================

INSTANCE DIA_Hargos_GRD (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_GRD_Condition;
   information  = DIA_Hargos_GRD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hargos_GRD_Condition()
{
  if (Npc_GetTrueGuild(hero) == GIL_GRD)
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_GRD_Info()
{
    AI_Output (self, other ,"DIA_Hargos_GRD_03_01"); //Wsz�dzie Ci� pe�no, co?
    AI_Output (other, self ,"DIA_Hargos_GRD_15_02"); //Na to wychodzi.
    AI_Output (self, other ,"DIA_Hargos_GRD_03_03"); //By�by z ciebie niez�y pracownik.
    AI_Output (other, self ,"DIA_Hargos_GRD_15_04"); //Nie lubi� rutyny. Wol�, gdy co� si� dzieje.
    AI_Output (self, other ,"DIA_Hargos_GRD_03_05"); //Pan od przyg�d, co? Mam nadzieje, �e nie sko�czy si� to dla ciebie �le.
    AI_Output (other, self ,"DIA_Hargos_GRD_15_06"); //Te� bym tak wola�.
};


//========================================
//-----------------> HELLO_CH4
//========================================

INSTANCE DIA_Hargos_HELLO_CH4 (C_INFO)
{
   npc          = STT_40143_Hargos;
   nr           = 1;
   condition    = DIA_Hargos_HELLO_CH4_Condition;
   information  = DIA_Hargos_HELLO_CH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Hargos_HELLO_CH4_Condition()
{
if (kapitel >= 4)
{
    return TRUE;
};
};
FUNC VOID DIA_Hargos_HELLO_CH4_Info()
{
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_01"); //Hej, dok�d idziesz?
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_02"); //Za�atwia� swoje sprawy.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_03"); //Zatem uwa�aj, by nie nadzia� si� na jaki� patrol Stra�y. Teraz s� zdolni do ka�dej zbrodni.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_04"); //Co tutaj robisz?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_05"); //Po ostatnich wydarzeniach, zdecydowa�em si� opu�ci� obozowisko, przed Star� Kopalni�.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_06"); //Oficjalnie nie by�em cz�onkiem Starego Obozu. Mia�em za�atwi�, by formalnie nale�e� do Kopaczy ale...
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_07"); //Wiecznie odk�ada�em to na ,,jutro" skoro i tak wiecznie zajmowa�em si� drewnem.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_08"); //Ba�e� si� o swoje bezpiecze�stwo?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_09"); //Obecnie cz�onkowie Starego Obozu patrz� na siebie krzywo a co dopiero na innych. B�d�c tam d�u�ej ryzykowa�em, �e odbior� mi dobytek, pobij� albo gorzej...
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_10"); //Dlatego postanowi�em ukry� si� u My�liwego Toma. Chodz�c po drewno do lasu, zaprzyja�ni�em si� z nim. R�wny facet. A i jeszcze jedno... Widzia�em Thorusa i grup� ludzi jak szli w stron� placu wymian.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_11"); //Ciekawe, co kombinuj�. Kto tam by�?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_12"); //By�em daleko, ale zauwa�y�em chocia�by Scatty'ego i Fletchera. 
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_13"); //Dzi�ki za informacje. Trzymaj si� i powodzenia.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_14"); //Dzi�ki i wzajemnie.
	Npc_ExchangeRoutine(STT_40143_Hargos,"CH4Tom");
    AI_StopProcessInfos	(self);
};

instance dia_hargos_pickpocket(c_info) {
    npc = stt_40143_hargos;
    nr = 900;
    condition = dia_hargos_pickpocket_condition;
    information = dia_hargos_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hargos_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_hargos_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hargos_pickpocket);
	info_addchoice(dia_hargos_pickpocket, dialog_back, dia_hargos_pickpocket_back);
	info_addchoice(dia_hargos_pickpocket, dialog_pickpocket, dia_hargos_pickpocket_doit);
};

func void dia_hargos_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hargos_pickpocket);
};

func void dia_hargos_pickpocket_back() {
    info_clearchoices(dia_hargos_pickpocket);
};
