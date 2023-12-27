// ************************ EXIT **************************

instance  Info_Myxir_EXIT (C_INFO)
{
	npc			= KDW_601_Myxir;
	nr			= 999;
	condition	= Info_Myxir_EXIT_Condition;
	information	= Info_Myxir_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Myxir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Myxir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Myxir_HELLO1 (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 1;
   condition    = DIA_Myxir_HELLO1_Condition;
   information  = DIA_Myxir_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj, magu!";
};

FUNC INT DIA_Myxir_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Myxir_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Myxir_HELLO1_15_01"); //Witaj, magu!
    AI_Output (self, other ,"DIA_Myxir_HELLO1_03_02"); //Adanos z tob¹, jestem Myxir, Mag Krêgu Wody. Co ciê do mnie sprowadza?
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Myxir_HELLO2 (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 2;
   condition    = DIA_Myxir_HELLO2_Condition;
   information  = DIA_Myxir_HELLO2_Info;
   permanent	= FALSE;
   description	= "Chcia³bym siê czegoœ dowiedzieæ o Magach Wody.";
};

FUNC INT DIA_Myxir_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Myxir_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Myxir_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Myxir_HELLO2_15_01"); //Chcia³bym siê czegoœ dowiedzieæ o Magach Wody.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_02"); //Rozumiem. Có¿, Kr¹g Magów Wody czerpie sw¹ si³ê z bezgranicznych wód Adanosa. 
	AI_Output (self, other ,"DIA_Myxir_HELLO2_03_03"); //Jesteœmy Stra¿nikami Równowagi tego œwiata i staramy siê, aby konflikt Innosa z Beliarem nie zosta³ przewa¿ony przez któr¹œ ze stron.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_04"); //Jakby któryœ z nich zatryumfowa³, oznacza³oby to pocz¹tki rz¹du chaosu. Na œwiecie istnieje nas oczywiœcie wiêcej, jednak nie tak du¿o jak Magów Ognia.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_05"); //Niektórzy g³osz¹ nauki o bogach w miastach, jak choæby Vatras, drugi najpotê¿niejszy Mag Wody po Saturasie. Z tego co wiem od lat mieszka w Khorinis. 
};


//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Myxir_Help_For_NC (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 2;
   condition    = DIA_Myxir_Help_For_NC_Condition;
   information  = DIA_Myxir_Help_For_NC_Info;
   permanent	= FALSE;
   description	= "W pobli¿u obozu pojawi³y siê...";
};

FUNC INT DIA_Myxir_Help_For_NC_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Saturas_Fire_Varans))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Myxir_Help_For_NC_Info()
{
    AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_01"); //W pobli¿u obozu pojawi³y siê przyzwane ogniste jaszczury i stra¿ Gomeza. NajwyraŸniej szykuj¹ siê do ataku.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_02"); //Wiem ju¿ o wszystkim od Saturasa. Trzeba dzia³aæ niezw³ocznie. 
	AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_03"); //Powinniœmy ruszyæ przed obóz. 
    AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_04"); //Tak, musimy ich powstrzymaæ, co nie bêdzie ³atwe.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_05"); //Zapamiêtaj. ¯ycie Maga Wody nie jest us³ane ró¿ami.
	AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_06"); //Zatem w drogê.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_07"); //Ruszajmy.
	B_LogEntry               (OgnisteJaszczury,"Rozmawia³em z Myxirem. Teraz pora udaæ siê do olbrzymich ognistych jaszczurów i zakoñczyæ ich ¿ywot.");
	Npc_ExchangeRoutine(self,"Follow");
	Wld_InsertNpc				(NCFireWaran1,"OW_PATH_161");
	Wld_InsertNpc				(NCFireWaran2,"WP_NCA_FW1");
	Wld_InsertNpc				(NCFireWaran3,"WP_NCA_FW2"); 
	Wld_InsertNpc				(NCFireWaran4,"WP_NCA_FW3"); 
	KDW_601_Myxir.flags = NPC_FLAG_IMMORTAL;
	KDW_601_Myxir.aivar[AIV_PARTYMEMBER] = TRUE;
	
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Myxir_KillWaransr_NC (C_INFO)
{
   npc          = KDW_601_Myxir;
   nr           = 2;
   condition    = DIA_Myxir_KillWaransr_NC_Condition;
   information  = DIA_Myxir_KillWaransr_NC_Info;
   permanent	= FALSE;
   description	= "Uda³o siê.";
};

FUNC INT DIA_Myxir_KillWaransr_NC_Condition()
{
     if (Npc_IsDead (NCFireWaran1))
	 && (Npc_IsDead (NCFireWaran2))
	 && (Npc_IsDead (NCFireWaran3))
	 && (Npc_IsDead (NCFireWaran4))
	 && (Npc_KnowsInfo (hero, DIA_Myxir_Help_For_NC))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Myxir_KillWaransr_NC_Info()
{
    AI_Output (other, self ,"DIA_Myxir_KillWaransr_NC_15_01"); //Uda³o siê.
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_02"); //To by³a ciê¿ka przeprawa.
	AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_03"); //Zostali jeszcze stra¿nicy w trzech grupach, nadal s¹ w ukryciu i czekaj¹ na moment ataku. W jednej z nich widzia³em Cienia-Magika Jima
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_04"); //Trzeba ich zg³adziæ, ³¹cznie z tym magikiem z doskoku.
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_05"); //Wracam do Saturasa zdaæ raport. Ty zbierz Torlofa, Gorna i Kosê, póki jeszcze jest cicho a potem rozbijcie w py³ stra¿.
	AI_Output (other, self ,"DIA_Myxir_KillWaransr_NC_15_06"); //W porz¹dku, zajmê siê tym najszybciej jak siê da.
		B_LogEntry               (OgnisteJaszczury,"Pokonaliœmy ogniste jaszczury. Myxir poleci³ mi teraz zebraæ Gorna, Torlofa i Kosê a nastêpnie pokonaæ Stra¿ników, którzy zajêli 3 stanowiska nieopodal Nowego Obozu.");
    STT_2077_Jim.flags = 0;
	Npc_ExchangeRoutine(self,"Start");
	KDW_601_Myxir.aivar[AIV_PARTYMEMBER] = FALSE;
	
};

instance dia_myxir_pickpocket(c_info) {
    npc = kdw_601_myxir;
    nr = 900;
    condition = dia_myxir_pickpocket_condition;
    information = dia_myxir_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_myxir_pickpocket_condition() {
	e_beklauen(baseThfChanceKDW, 50);
};

func void dia_myxir_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_myxir_pickpocket);
	info_addchoice(dia_myxir_pickpocket, dialog_back, dia_myxir_pickpocket_back);
	info_addchoice(dia_myxir_pickpocket, dialog_pickpocket, dia_myxir_pickpocket_doit);
};

func void dia_myxir_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_myxir_pickpocket);
};

func void dia_myxir_pickpocket_back() {
    info_clearchoices(dia_myxir_pickpocket);
};