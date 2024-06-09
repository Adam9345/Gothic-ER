// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Robin_EXIT(C_INFO)
{
	npc             = STT_40066_Robin;
	nr              = 999;
	condition	= DIA_Robin_EXIT_Condition;
	information	= DIA_Robin_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Robin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Robin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HI_ROBIN
//========================================

INSTANCE DIA_Robin_HI_ROBIN (C_INFO)
{
   npc          = STT_40066_Robin;
   nr           = 1;
   condition    = DIA_Robin_HI_ROBIN_Condition;
   information  = DIA_Robin_HI_ROBIN_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Robin_HI_ROBIN_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Robin_HI_ROBIN_Info()
{
    AI_Output (other, self ,"DIA_Robin_HI_ROBIN_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_02"); //Ja? Jestem wa�nym cz�owiekiem Iana I staram si� mie� otwarte oczy I wiedzie� kiedy nadstawi� ucho. 
    AI_Output (other, self ,"DIA_Robin_HI_ROBIN_15_03"); //Czyli jeste� jego wtyczk�?
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_04"); //Wola�bym raczej okre�lenie wsp�pracownik.
    AI_Output (other, self ,"DIA_Robin_HI_ROBIN_15_05"); //Jak� spraw� teraz badasz?
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_06"); //Co ci do tego. To moja dola I tylko Ian wie co I gdzie robie.
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_07"); //A ty skup si� lepiej by nie dosta� w �eb od Stra�nik�w albo nie sta� si� przystawk� w jad�ospisie pe�zaczy.
    AI_Output (other, self ,"DIA_Robin_HI_ROBIN_15_08"); //Spokojna twoja g�owa. Umiem o siebie zadba�.
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_09"); //Hah zobaczymy co wyjdzie z tego twojego gadania.
    AI_Output (self, other ,"DIA_Robin_HI_ROBIN_03_10"); //Bo wielu ju� obiecywa�o sobie g�ry rudy a ko�czy�o jako truch�o w rynsztoku.
};

//========================================
//-----------------> DWNM
//========================================

INSTANCE DIA_Robin_DWNM (C_INFO)
{
   npc          = STT_40066_Robin;
   nr           = 1;
   condition    = DIA_Robin_DWNM_Condition;
   information  = DIA_Robin_DWNM_Info;
   permanent	= FALSE;
   description	= "Witaj, mam spraw�!";
};

FUNC INT DIA_Robin_DWNM_Condition()
{
if (Npc_KnowsInfo(hero,DIA_IAN_DWNS_FUR))
{
    return TRUE;
};
};
FUNC VOID DIA_Robin_DWNM_Info()
{
    AI_Output (other, self ,"DIA_Robin_DWNM_15_01"); //Witaj, mam spraw�!
    AI_Output (self, other ,"DIA_Robin_DWNM_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Robin_DWNM_15_03"); //Przesy�a mnie Ian. Chodzi o ostatnie podejrzane wydarzenia.
    AI_Output (self, other ,"DIA_Robin_DWNM_03_04"); //Rozumiem. Chodzi o naszego ma�ego niszczyciela b�d� niszczycieli je�li jest ich wi�cej.
    AI_Output (other, self ,"DIA_Robin_DWNM_15_05"); //Tak.
    AI_Output (self, other ,"DIA_Robin_DWNM_03_06"); //Troch� nad tym my�la�em.
    AI_Output (other, self ,"DIA_Robin_DWNM_15_07"); //I?
    AI_Output (self, other ,"DIA_Robin_DWNM_03_08"); //Nale�y rozpu�ci� pewn� plotk� w�r�d bywalc�w kopalni. 
    AI_Output (other, self ,"DIA_Robin_DWNM_15_09"); //Jak�?
    AI_Output (self, other ,"DIA_Robin_DWNM_03_10"); //Tak�, �e jest przygotowywana specjalna dostawa rudy do obozuobozu, kt�ra przyniesie spory zysk.
    AI_Output (self, other ,"DIA_Robin_DWNM_03_11"); //Ja pogadam o tym z paroma Stra�nikami. A Ty z kopaczami, najlepiej ze Snipesem I Alephem.
    AI_Output (other, self ,"DIA_Robin_DWNM_15_12"); //Dobra...
    AI_Output (self, other ,"DIA_Robin_DWNM_03_13"); //W takim razie �ycz� powodzenia.
	B_LogEntry               (Dywersant,"Robin poleci� mi rozpu�ci� pewn� plotk� w�r�d bywalc�w kopalnii. Chodzi o to by dywersant si� ujawni�. Mam si� zaj�� kopaczami a konkretnie Snipesem I Alephem. Oni powinni rozgada� to co im przekaza�em.");
	STT_40066_Robin.flags = NPC_FLAG_IMMORTAL;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DWMN_TWO
//========================================

INSTANCE DIA_Robin_DWMN_TWO (C_INFO)
{
   npc          = STT_40066_Robin;
   nr           = 1;
   condition    = DIA_Robin_DWMN_TWO_Condition;
   information  = DIA_Robin_DWMN_TWO_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z kopaczami.";
};

FUNC INT DIA_Robin_DWMN_TWO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Snipes_DWMN))
&& (Npc_KnowsInfo(hero,DIA_Aleph_DWMN))
{
    return TRUE;
};
};
FUNC VOID DIA_Robin_DWMN_TWO_Info()
{
    AI_Output (other, self ,"DIA_Robin_DWMN_TWO_15_01"); //Rozmawia�em z kopaczami.
    AI_Output (self, other ,"DIA_Robin_DWMN_TWO_03_02"); //Wspaniale. Teraz ci co� poka��.
	STT_40066_Robin.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_Output (other, self ,"DIA_Robin_DWMN_TWO_15_03"); //W porz�dku.
	Npc_ExchangeRoutine(STT_40066_Robin,"Kopiec");
    AI_Output (self, other ,"DIA_Robin_DWMN_TWO_03_04"); //Za mn�.
	//Wld_SendTrigger ("ORE_DYWERSANT"); 
	//B_LogEntry               (Dywersant,"Robin poleci� mi pilnowa� wielkiego stoiska z rud�, znajduj�cego si� pod wyj�ciem z kopalni. Musz� noc� odkry� kto jest dywersantem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DWMN_NUGGET
//========================================

INSTANCE DIA_Robin_DWMN_NUGGET (C_INFO)
{
   npc          = STT_40066_Robin;
   nr           = 2;
   condition    = DIA_Robin_DWMN_NUGGET_Condition;
   information  = DIA_Robin_DWMN_NUGGET_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Robin_DWMN_NUGGET_Condition()
{

if (Npc_GetDistToWP(hero,"OM_CAVE1_20")<500)
&& (Npc_KnowsInfo(hero,DIA_Robin_DWMN_TWO))
{
    return TRUE;
};
};
FUNC VOID DIA_Robin_DWMN_NUGGET_Info()
{
    AI_Output (self, other ,"DIA_Robin_DWMN_NUGGET_03_01"); //Widzisz t� g�r� rudy?
    AI_Output (other, self ,"DIA_Robin_DWMN_NUGGET_15_02"); //Trudno jej nie zauwa�y�.
    AI_Output (self, other ,"DIA_Robin_DWMN_NUGGET_03_03"); //To w�a�nie j� dywersanci obior� za cel.
    AI_Output (self, other ,"DIA_Robin_DWMN_NUGGET_03_04"); //Wr�� tu noc� i troch� poczekaj. Albo poprostu troche sobie odpocznij na tamtej �awce.
    AI_Output (self, other ,"DIA_Robin_DWMN_NUGGET_03_05"); //Ten kto jest niszczycielem z pewno�ci� si� ujawni.
    AI_Output (other, self ,"DIA_Robin_DWMN_NUGGET_15_06"); //Jasne. Wreszcie si� tego dowiemy.
    AI_Output (self, other ,"DIA_Robin_DWMN_NUGGET_03_07"); //Racja.
	Npc_ExchangeRoutine(STT_40066_Robin,"start");
    AI_Output (other, self ,"DIA_Robin_DWMN_NUGGET_15_08"); //Dobra wiem co mam robi�. 
	STT_40066_Robin.aivar[AIV_PARTYMEMBER] = FALSE;
    AI_Output (other, self ,"DIA_Robin_DWMN_NUGGET_15_09"); //Trzymaj si�.
	Npc_ExchangeRoutine(VLK_583_Glen,"Dywersantian");
	 B_LogEntry               (Dywersant,"Robin poleci� mi pilnowa� wielkiego stoiska z rud�. Mog� przeczeka� na �awce w pobli�u do p�na i musz� odkry� kto jest dywersantem.");
    AI_StopProcessInfos	(self);
};

instance dia_robin_pickpocket(c_info) {
    npc = stt_40066_robin;
    nr = 900;
    condition = dia_robin_pickpocket_condition;
    information = dia_robin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_robin_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_robin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_robin_pickpocket);
	info_addchoice(dia_robin_pickpocket, dialog_back, dia_robin_pickpocket_back);
	info_addchoice(dia_robin_pickpocket, dialog_pickpocket, dia_robin_pickpocket_doit);
};

func void dia_robin_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_robin_pickpocket);
};

func void dia_robin_pickpocket_back() {
    info_clearchoices(dia_robin_pickpocket);
};

