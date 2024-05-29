//poprawione i sprawdzone - Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Eliott_Exit (C_INFO)
{
	npc			= VLK_40055_Eliott;
	nr			= 999;
	condition	= DIA_Eliott_Exit_Condition;
	information	= DIA_Eliott_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Eliott_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Eliott_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Eliott_HELLO1 (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 1;
   condition    = DIA_Eliott_HELLO1_Condition;
   information  = DIA_Eliott_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czeœæ!";
};

FUNC INT DIA_Eliott_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fergus_HELLO1)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Eliott_HELLO1_15_01"); //Czeœæ!
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_02"); //Zostaw mnie w spokoju, ja nic nie mam!
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_03"); //Powiedz swojemu szefowi, ¿eby zostawi³ mnie w spokoju raz na zawsze!
    AI_Output (other, self ,"DIA_Eliott_HELLO1_15_04"); //Ale...
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_05"); //Choæ wiem, ¿e on nie spocznie póki ktoœ nie znajdzie mnie martwego.
};


//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Eliott_HELLO2 (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 2;
   condition    = DIA_Eliott_HELLO2_Condition;
   information  = DIA_Eliott_HELLO2_Info;
   permanent	= FALSE;
   description	= "Cz³owieku nic od ciebie nie chce. Chcia³em po prostu porozmawiaæ.";
};

FUNC INT DIA_Eliott_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Eliott_HELLO1)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_01"); //Cz³owieku nic od ciebie nie chce. Chcia³em po prostu porozmawiaæ. Przysy³a mnie kowal Fergus.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_02"); //Tak? Wybacz, jestem stale osaczony st¹d moja nerwowa reakcja.
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_03"); //Przez kogo?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_04"); //Przez stra¿nika Winstona i jego kumpli, g³ównie równie¿ stra¿ników.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_05"); //Ci¹gle dostaje od nich po g³owie i tracê wszystko co wartoœciowe co uda mi siê jakoœ zdobyæ. 
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_06"); //Potrzebujesz pomocy. Nie myœla³eœ by udaæ siê z tym do kogoœ wa¿nego?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_07"); //Rozmawia³em z Asghanem. Ale on mnie sp³awi³ , nie chcia³ zajmowaæ siê losem byle kopacza.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_08"); //Przed pójœciem do Iana blokuj¹ mnie groŸby i zastraszenia ze strony Winstona. Wy³ga³ by siê z tego a potem mnie sprz¹tn¹³.
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_09"); //Dlaczego ten typ tak ciê nienawidzi?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_10"); //Stare dzieje... Jeszcze w Khorinis nale¿eliœmy do konkurencyjnych, zwalczaj¹cych siê grup.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_11"); //On by³ osi³kiem i rêbaj³¹ w tej drugiej szajce. Parê razy dostali od naszych a on zapamiêta³, ¿e by³em wœród jego wrogów.
};


//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Eliott_HELLO3 (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 3;
   condition    = DIA_Eliott_HELLO3_Condition;
   information  = DIA_Eliott_HELLO3_Info;
   permanent	= FALSE;
   description	= "Co by³o dalej?";
};

FUNC INT DIA_Eliott_HELLO3_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Eliott_HELLO2)) 
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_01"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_02"); //Raz zbytnio siê po³akomi³em na cenny ³up. Jego wizja przys³oni³a przezorne myœlenie... no i trafi³em tutaj.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_03"); //Przez kilka miesiêcy nie by³o Ÿle choæ pocz¹tki zawsze bywaj¹ doœæ trudne.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_04"); //Jednak póŸniej trafi³ tu Winston. A, ¿e pasowa³ do tych têpych si³aczy ze stra¿y to w miarê szybko do nich przysta³. 
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_05"); //Tak zaczê³o siê moje piek³o. Odt¹d bije mnie i upokarza a z nim jego kole¿kowie.
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_06"); //Porozmawiam z Winstonem.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_07"); //To chyba nie jest dobry pomys³.
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_08"); //Na razie nie mam lepszego pomys³u.
	B_LogEntry               (Oprawca,"Kopacz Eliott jest stale maltretowany przez Stra¿nika Winstona i jego kumpli. Bity i okradany kopacz poprosi³ mnie o pomoc. Musze wyperswadowaæ Winstonowi drêczenie Eliotta.");
};


//========================================
//-----------------> Oprawca_End
//========================================

INSTANCE DIA_Eliott_Oprawca_End (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 1;
   condition    = DIA_Eliott_Oprawca_End_Condition;
   information  = DIA_Eliott_Oprawca_End_Info;
   permanent	= FALSE;
   description	= "Masz ju¿ spokój z Winstonem.";
};

FUNC INT DIA_Eliott_Oprawca_End_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Asghan_Oprawca_Nagroda))
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_Oprawca_End_Info()
{
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_01"); //Masz ju¿ spokój z Winstonem.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_02"); //Jak to?!
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_03"); //Wykry³em, ¿e bezczelnie oszuka³ Asghana i podwêdzi³ jego rudê.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_04"); //W zamian dosta³ du¿¹ karê i na dodatek ma daæ ci spokój.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_05"); //Jestem twoim d³u¿nikiem, stary. Nikt mi tak nie pomóg³ jak ty.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_06"); //Mam jedynie 20 bry³ek rudy. WeŸ je.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_07"); //Ledwo zipiesz, zachowaj tê rudê. Asghan ju¿ mi zap³aci³.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_08"); //G³upio mi. Szepnê o tobie dobre s³owo Ianowi. Przynajmniej tyle mogê dla ciebie zrobiæ.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_09"); //Dziêki. Trzymaj siê.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_10"); //Do zobaczenia. Strasznie równy z ciebie goœæ, a to dzisiaj bardzo rzadkie.
	B_LogEntry               (Oprawca,"Eliott by³ niezwykle uradowany, ¿e pomog³em mu z Winstonem. Stra¿nik powinien dostaæ wreszcie to na co mu siê nale¿a³o. Ciekawe co na to Fergus...");
	
    B_GiveXP(200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OP_Wins_Dead
//========================================

INSTANCE DIA_Eliott_OP_Wins_Dead (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 1;
   condition    = DIA_Eliott_OP_Wins_Dead_Condition;
   information  = DIA_Eliott_OP_Wins_Dead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Eliott_OP_Wins_Dead_Condition()
{
 if (Npc_IsDead (GRD_40056_Winston))
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_OP_Wins_Dead_Info()
{
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_01"); //S³ysza³eœ nowinê?!
    AI_Output (other, self ,"DIA_Eliott_OP_Wins_Dead_15_02"); //Nie, jak¹?
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_03"); //Winston nie ¿yje. Skurczybyk pad³ w walce z kilkoma pe³zaczami w jednym z bocznych szybów.
    AI_Output (other, self ,"DIA_Eliott_OP_Wins_Dead_15_04"); //Nie bêdê za nim têskni³.
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_05"); //Ja te¿ nie. Wrêcz przeciwnie, weŸ to piwo i wypij ze mn¹ za nasze zdrowie.
    AI_Output (other, self ,"DIA_Eliott_OP_Wins_Dead_15_06"); //Pewnie.
    CreateInvItems (self, ItfoBeer, 1);
    B_GiveInvItems (self, other, ItfoBeer, 1);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Dywersant
//========================================

INSTANCE DIA_Eliott_Dywersant (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 1;
   condition    = DIA_Eliott_Dywersant_Condition;
   information  = DIA_Eliott_Dywersant_Info;
   permanent	= FALSE;
   description	= "Widzia³eœ ostatnio tu coœ podejrzanego?";
};

FUNC INT DIA_Eliott_Dywersant_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Robin_DWMN_NUGGET))
{
    return TRUE;
};
};
FUNC VOID DIA_Eliott_Dywersant_Info()
{
    AI_Output (other, self ,"DIA_Eliott_Dywersant_15_01"); //Widzia³eœ ostatnio tu coœ podejrzanego?
    AI_Output (self, other ,"DIA_Eliott_Dywersant_03_02"); //Jeœli chodzi ci o to czy wiem coœ o ostatnich nieprzyjemnych sytuacjach w kopalni zwi¹zanych z dywersantem...
    AI_Output (self, other ,"DIA_Eliott_Dywersant_03_03"); //Nic mi o tym nie wiadomo, i nie chcê mieæ z tym nic wspólnego.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_ELIOTT
//========================================

INSTANCE DIA_Eliott_HI_ELIOTT (C_INFO)
{
   npc          = VLK_40055_Eliott;
   nr           = 1;
   condition    = DIA_Eliott_HI_ELIOTT_Condition;
   information  = DIA_Eliott_HI_ELIOTT_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Eliott_HI_ELIOTT_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Eliott_HI_ELIOTT_Info()
{
    AI_Output (other, self ,"DIA_Eliott_HI_ELIOTT_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Eliott_HI_ELIOTT_03_02"); //Zostaw mnie. Chcê ¿yæ w spokoju!
    AI_Output (other, self ,"DIA_Eliott_HI_ELIOTT_15_03"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Eliott_HI_ELIOTT_03_04"); //Ty ju¿ dobrze wiesz. IdŸ sobie!
    AI_StopProcessInfos	(self);
};

instance dia_eliott_pickpocket(c_info) {
    npc = vlk_40055_eliott;
    nr = 900;
    condition = dia_eliott_pickpocket_condition;
    information = dia_eliott_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_eliott_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 25);
};

func void dia_eliott_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_eliott_pickpocket);
	info_addchoice(dia_eliott_pickpocket, dialog_back, dia_eliott_pickpocket_back);
	info_addchoice(dia_eliott_pickpocket, dialog_pickpocket, dia_eliott_pickpocket_doit);
};

func void dia_eliott_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_eliott_pickpocket);
};

func void dia_eliott_pickpocket_back() {
    info_clearchoices(dia_eliott_pickpocket);
};
