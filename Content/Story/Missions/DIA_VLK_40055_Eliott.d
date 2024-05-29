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
   description	= "Cze��!";
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
    AI_Output (other, self ,"DIA_Eliott_HELLO1_15_01"); //Cze��!
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_02"); //Zostaw mnie w spokoju, ja nic nie mam!
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_03"); //Powiedz swojemu szefowi, �eby zostawi� mnie w spokoju raz na zawsze!
    AI_Output (other, self ,"DIA_Eliott_HELLO1_15_04"); //Ale...
    AI_Output (self, other ,"DIA_Eliott_HELLO1_03_05"); //Cho� wiem, �e on nie spocznie p�ki kto� nie znajdzie mnie martwego.
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
   description	= "Cz�owieku nic od ciebie nie chce. Chcia�em po prostu porozmawia�.";
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
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_01"); //Cz�owieku nic od ciebie nie chce. Chcia�em po prostu porozmawia�. Przysy�a mnie kowal Fergus.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_02"); //Tak? Wybacz, jestem stale osaczony st�d moja nerwowa reakcja.
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_03"); //Przez kogo?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_04"); //Przez stra�nika Winstona i jego kumpli, g��wnie r�wnie� stra�nik�w.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_05"); //Ci�gle dostaje od nich po g�owie i trac� wszystko co warto�ciowe co uda mi si� jako� zdoby�. 
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_06"); //Potrzebujesz pomocy. Nie my�la�e� by uda� si� z tym do kogo� wa�nego?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_07"); //Rozmawia�em z Asghanem. Ale on mnie sp�awi� , nie chcia� zajmowa� si� losem byle kopacza.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_08"); //Przed p�j�ciem do Iana blokuj� mnie gro�by i zastraszenia ze strony Winstona. Wy�ga� by si� z tego a potem mnie sprz�tn��.
    AI_Output (other, self ,"DIA_Eliott_HELLO2_15_09"); //Dlaczego ten typ tak ci� nienawidzi?
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_10"); //Stare dzieje... Jeszcze w Khorinis nale�eli�my do konkurencyjnych, zwalczaj�cych si� grup.
    AI_Output (self, other ,"DIA_Eliott_HELLO2_03_11"); //On by� osi�kiem i r�baj�� w tej drugiej szajce. Par� razy dostali od naszych a on zapami�ta�, �e by�em w�r�d jego wrog�w.
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
   description	= "Co by�o dalej?";
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
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_01"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_02"); //Raz zbytnio si� po�akomi�em na cenny �up. Jego wizja przys�oni�a przezorne my�lenie... no i trafi�em tutaj.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_03"); //Przez kilka miesi�cy nie by�o �le cho� pocz�tki zawsze bywaj� do�� trudne.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_04"); //Jednak p�niej trafi� tu Winston. A, �e pasowa� do tych t�pych si�aczy ze stra�y to w miar� szybko do nich przysta�. 
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_05"); //Tak zacz�o si� moje piek�o. Odt�d bije mnie i upokarza a z nim jego kole�kowie.
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_06"); //Porozmawiam z Winstonem.
    AI_Output (self, other ,"DIA_Eliott_HELLO3_03_07"); //To chyba nie jest dobry pomys�.
    AI_Output (other, self ,"DIA_Eliott_HELLO3_15_08"); //Na razie nie mam lepszego pomys�u.
	B_LogEntry               (Oprawca,"Kopacz Eliott jest stale maltretowany przez Stra�nika Winstona i jego kumpli. Bity i okradany kopacz poprosi� mnie o pomoc. Musze wyperswadowa� Winstonowi dr�czenie Eliotta.");
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
   description	= "Masz ju� spok�j z Winstonem.";
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
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_01"); //Masz ju� spok�j z Winstonem.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_02"); //Jak to?!
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_03"); //Wykry�em, �e bezczelnie oszuka� Asghana i podw�dzi� jego rud�.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_04"); //W zamian dosta� du�� kar� i na dodatek ma da� ci spok�j.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_05"); //Jestem twoim d�u�nikiem, stary. Nikt mi tak nie pom�g� jak ty.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_06"); //Mam jedynie 20 bry�ek rudy. We� je.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_07"); //Ledwo zipiesz, zachowaj t� rud�. Asghan ju� mi zap�aci�.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_08"); //G�upio mi. Szepn� o tobie dobre s�owo Ianowi. Przynajmniej tyle mog� dla ciebie zrobi�.
    AI_Output (other, self ,"DIA_Eliott_Oprawca_End_15_09"); //Dzi�ki. Trzymaj si�.
    AI_Output (self, other ,"DIA_Eliott_Oprawca_End_03_10"); //Do zobaczenia. Strasznie r�wny z ciebie go��, a to dzisiaj bardzo rzadkie.
	B_LogEntry               (Oprawca,"Eliott by� niezwykle uradowany, �e pomog�em mu z Winstonem. Stra�nik powinien dosta� wreszcie to na co mu si� nale�a�o. Ciekawe co na to Fergus...");
	
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
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_01"); //S�ysza�e� nowin�?!
    AI_Output (other, self ,"DIA_Eliott_OP_Wins_Dead_15_02"); //Nie, jak�?
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_03"); //Winston nie �yje. Skurczybyk pad� w walce z kilkoma pe�zaczami w jednym z bocznych szyb�w.
    AI_Output (other, self ,"DIA_Eliott_OP_Wins_Dead_15_04"); //Nie b�d� za nim t�skni�.
    AI_Output (self, other ,"DIA_Eliott_OP_Wins_Dead_03_05"); //Ja te� nie. Wr�cz przeciwnie, we� to piwo i wypij ze mn� za nasze zdrowie.
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
   description	= "Widzia�e� ostatnio tu co� podejrzanego?";
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
    AI_Output (other, self ,"DIA_Eliott_Dywersant_15_01"); //Widzia�e� ostatnio tu co� podejrzanego?
    AI_Output (self, other ,"DIA_Eliott_Dywersant_03_02"); //Je�li chodzi ci o to czy wiem co� o ostatnich nieprzyjemnych sytuacjach w kopalni zwi�zanych z dywersantem...
    AI_Output (self, other ,"DIA_Eliott_Dywersant_03_03"); //Nic mi o tym nie wiadomo, i nie chc� mie� z tym nic wsp�lnego.
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Eliott_HI_ELIOTT_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Eliott_HI_ELIOTT_Info()
{
    AI_Output (other, self ,"DIA_Eliott_HI_ELIOTT_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Eliott_HI_ELIOTT_03_02"); //Zostaw mnie. Chc� �y� w spokoju!
    AI_Output (other, self ,"DIA_Eliott_HI_ELIOTT_15_03"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Eliott_HI_ELIOTT_03_04"); //Ty ju� dobrze wiesz. Id� sobie!
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
