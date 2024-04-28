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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Hargos_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hargos_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_02"); //Jestem Hargos i pracuje jako drwal. 
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_03"); //Masz du¿o roboty?
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_04"); //Ca³kiem sporo, chocia¿ pomaga mi Akl. Ponadto, chodz¹ s³uchy, ¿e Magnaci planuj¹ rozbudowê obozowiska przed kopalni¹.
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_05"); //A co za tym idzie, bêd¹ potrzebowali do tego surowców, a wiêc g³ównie drewna.
    AI_Output (other, self ,"DIA_Hargos_HELLO1_15_06"); //Czyli pewnie bêdziesz mia³ pe³ne rêce roboty.
    AI_Output (self, other ,"DIA_Hargos_HELLO1_03_07"); //Tak. Dla wielu by³aby to mordêga i kolejny powód by daæ nogê do innego obozu, albo ze sob¹ skoñczyæ Có¿. Nie dla mnie
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
   description	= "Czy mogê coœ dla ciebie zrobiæ?";
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
    AI_Output (other, self ,"DIA_Hargos_ZND_15_01"); //Czy mogê coœ dla ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Hargos_ZND_03_02"); //W sumie tak... Ale to robota tylko dla Stra¿nika. To musi byæ ktoœ silny i sprawny. Ktoœ kto naprawdê siê nie boi leœnych stworów.
    AI_Output (other, self ,"DIA_Hargos_ZND_15_03"); //Jak widziesz, jestem stra¿nikiem.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_04"); //Dobrze. Umiesz wiêc odpowiednio machaæ mieczem i przyj¹æ na siebie kilka ciosów gdy trzeba.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_05"); //W zwi¹zku z dalsz¹ planowan¹ rozbudow¹ obozowiska pod kopalni¹ potrzeba wielkich iloœci drewna.
    AI_Output (other, self ,"DIA_Hargos_ZND_15_06"); //Nie macie go wystarczaj¹co?
    AI_Output (self, other ,"DIA_Hargos_ZND_03_07"); //Na dalsze prosperowanie obozowiska w tym kszta³cie a¿ nadto, ale jeœli chcemy je rozbudowaæ to potrzeba go wiêcej.
    AI_Output (self, other ,"DIA_Hargos_ZND_03_08"); //Muszê wiêc udaæ siê po drewno do lasu. Potrzebuje ochrony.  
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
   description	= "Dostanê za to jakieœ wynagrodzenie?";
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
    AI_Output (other, self ,"DIA_Hargos_ZND_PRIZE_15_01"); //Dostanê za to jakieœ wynagrodzenie?
    AI_Output (self, other ,"DIA_Hargos_ZND_PRIZE_03_02"); //Jasne. Po naszym powrocie udaj siê do Spike’a po zap³atê. 
    AI_Output (self, other ,"DIA_Hargos_ZND_PRIZE_03_03"); //To jak bêdzie?
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
   description	= "Wchodzê w to, ruszajmy.";
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
    AI_Output (other, self ,"DIA_Hargos_ZND_GO_15_01"); //Wchodzê w to, ruszajmy.
    AI_Output (self, other ,"DIA_Hargos_ZND_GO_03_02"); //Œwietnie, zatem w drogê. ChodŸ za mn¹.
	Npc_ExchangeRoutine (STT_40143_Hargos,"Forest");
	Wld_SendTrigger     ("ZND_TENT");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY1");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY2");
	Wld_InsertNpc		(Wolf,"WP_ZND_ENEMY3");
    Wld_InsertNpc		(Warg_Znd,"WP_ZND_ENEMY4");
	STT_40143_Hargos.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Drwal Hargos chcia³by udaæ siê do lasu by pozyskaæ nieco drewna do obozowiska pod Star¹ Kopalni¹. Jako Stra¿nik, mam go eskortowaæ. Przysta³em na jego propozycje.");
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
    AI_Output (self, other ,"DIA_Hargos_ZND_FOREST_03_01"); //Uwa¿aj. Teraz miej oczy szeroko otwarte. To niebezpieczne miejsce. Ja muszê siê skoncentrowaæ na pracy, a Ty na tym, bym wyszed³ z tego lasu ¿ywy.
    AI_Output (other, self ,"DIA_Hargos_ZND_FOREST_15_02"); //Damy radê. Daleko masz swoje stanowisko pracy?
    AI_Output (self, other ,"DIA_Hargos_ZND_FOREST_03_03"); //Niedaleko, na skraju lasu. Mam nadziejê ¿e nie zalêg³o siê tam - Beliar wie co.
    AI_Output (other, self ,"DIA_Hargos_ZND_FOREST_15_04"); //To siê oka¿e, ruszajmy dalej.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarliœmy pod las. Teraz musimy byæ szczególnie ostro¿ni. Nie wiadomo co czai siê dalej.");
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
   description	= "Mo¿esz teraz pracowaæ w spokoju.";
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
    AI_Output (other, self ,"DIA_Hargos_ZND_WORK_15_01"); //Mo¿esz teraz pracowaæ w spokoju.
    AI_Output (self, other ,"DIA_Hargos_ZND_WORK_03_02"); //Oczywiœcie. Daj mi kika godzin na pracê. Obok jest ³awka, mo¿esz trochê odpocz¹æ.
    AI_Output (self, other ,"DIA_Hargos_ZND_WORK_03_03"); //Mo¿e zd¹¿e skoñczyæ, nim coœ znów tu przylezie.
    AI_Output (other, self ,"DIA_Hargos_ZND_WORK_15_04"); //Dobra.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarliœmy pod stanowisko pracy Hargosa. Wybi³em wszystko, co mog³o nam zagra¿aæ. Teraz mogê chwilê odsapn¹æ a nawet siê zdrzemn¹æ. Drwal popracuje minimum kilka godzin.");
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
   description  = "Skoñczy³eœ ju¿?";
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
    AI_Output (other, self ,"DIA_Hargos_Hargos_Get_Wood_15_01"); //Skoñczy³eœ ju¿?
    AI_Output (self, other ,"DIA_Hargos_Hargos_Get_Wood_03_02"); //Zrobione. Pozyska³em wystarczaj¹co du¿o drewna. 
    AI_Output (self, other ,"DIA_Hargos_Hargos_Get_Wood_03_03"); //WeŸ te deski le¿¹ce obok pnia. Podzielimy siê po po³owie. Oddasz mi je w pod kopalni¹. 
    AI_Output (other, self ,"DIA_Hargos_Hargos_Get_Wood_15_04"); //Jasne.
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Mo¿emy wracaæ do obozu. Hargos da³ mi po³owê desek, które mam zanieœæ pod kopalnie. Nie mogê zapomnieæ, by wci¹¿ go ochraniac.");
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
    AI_Output (self, other ,"DIA_Hargos_ZND_GoBack_03_01"); //Zmywajmy siê st¹d.
    AI_Output (other, self ,"DIA_Hargos_ZND_GoBack_15_02"); //Racja, lepiej ju¿ chodŸmy.
    AI_Output (self, other ,"DIA_Hargos_ZND_GoBack_03_03"); //Wystarczy mi na dziœ tych niemi³ych niespodzianek. Za mn¹.
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
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_01"); //No to jesteœmy.
    AI_Output (other, self ,"DIA_Hargos_ZND_OMINE_15_02"); //Masz resztê tych desek.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_03"); //Dziêki. Œwietny z ciebie wojownik.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_04"); //Lepiej nie da³o siê chyba tego zrobiæ. Teraz bêdê wiedzia³ na kim polegaæ w przysz³oœci.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_05"); //Udaj siê teraz po zap³ate do Spike’a. Ja wracam do swojego stanowiska pracy.
    AI_Output (other, self ,"DIA_Hargos_ZND_OMINE_15_06"); //Tak zrobiê. Na razie.
    AI_Output (self, other ,"DIA_Hargos_ZND_OMINE_03_07"); //Do zobaczenia.

	B_GiveInvItems (other,self, ItMi_HargosWood, 3);
	Npc_RemoveInvItems (STT_40143_Hargos, ItMi_HargosWood,3);
	Npc_ExchangeRoutine(STT_40143_Hargos,"Start");
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Dotarliœmy pod Star¹ Kopalnie. Odda³em niesione deski Hargosowi. Teraz mam udaæ siê po zap³atê do Spike’a. ");
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
    AI_Output (self, other ,"DIA_Hargos_GRD_03_01"); //Wszêdzie Ciê pe³no, co?
    AI_Output (other, self ,"DIA_Hargos_GRD_15_02"); //Na to wychodzi.
    AI_Output (self, other ,"DIA_Hargos_GRD_03_03"); //By³by z ciebie niez³y pracownik.
    AI_Output (other, self ,"DIA_Hargos_GRD_15_04"); //Nie lubiê rutyny. Wolê, gdy coœ siê dzieje.
    AI_Output (self, other ,"DIA_Hargos_GRD_03_05"); //Pan od przygód, co? Mam nadzieje, ¿e nie skoñczy siê to dla ciebie Ÿle.
    AI_Output (other, self ,"DIA_Hargos_GRD_15_06"); //Te¿ bym tak wola³.
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
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_01"); //Hej, dok¹d idziesz?
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_02"); //Za³atwiaæ swoje sprawy.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_03"); //Zatem uwa¿aj, by nie nadziaæ siê na jakiœ patrol Stra¿y. Teraz s¹ zdolni do ka¿dej zbrodni.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_04"); //Co tutaj robisz?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_05"); //Po ostatnich wydarzeniach, zdecydowa³em siê opuœciæ obozowisko, przed Star¹ Kopalni¹.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_06"); //Oficjalnie nie by³em cz³onkiem Starego Obozu. Mia³em za³atwiæ, by formalnie nale¿eæ do Kopaczy ale...
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_07"); //Wiecznie odk³ada³em to na ,,jutro" skoro i tak wiecznie zajmowa³em siê drewnem.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_08"); //Ba³eœ siê o swoje bezpieczeñstwo?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_09"); //Obecnie cz³onkowie Starego Obozu patrz¹ na siebie krzywo a co dopiero na innych. Bêd¹c tam d³u¿ej ryzykowa³em, ¿e odbior¹ mi dobytek, pobij¹ albo gorzej...
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_10"); //Dlatego postanowi³em ukryæ siê u Myœliwego Toma. Chodz¹c po drewno do lasu, zaprzyjaŸni³em siê z nim. Równy facet. A i jeszcze jedno... Widzia³em Thorusa i grupê ludzi jak szli w stronê placu wymian.
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_11"); //Ciekawe, co kombinuj¹. Kto tam by³?
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_12"); //By³em daleko, ale zauwa¿y³em chocia¿by Scatty'ego i Fletchera. 
    AI_Output (other, self ,"DIA_Hargos_HELLO_CH4_15_13"); //Dziêki za informacje. Trzymaj siê i powodzenia.
    AI_Output (self, other ,"DIA_Hargos_HELLO_CH4_03_14"); //Dziêki i wzajemnie.
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
