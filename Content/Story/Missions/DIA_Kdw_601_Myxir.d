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
    AI_Output (self, other ,"DIA_Myxir_HELLO1_03_02"); //Adanos z tob�, jestem Myxir, Mag Kr�gu Wody. Co ci� do mnie sprowadza?
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
   description	= "Chcia�bym si� czego� dowiedzie� o Magach Wody.";
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
    AI_Output (other, self ,"DIA_Myxir_HELLO2_15_01"); //Chcia�bym si� czego� dowiedzie� o Magach Wody.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_02"); //Rozumiem. C�, Kr�g Mag�w Wody czerpie sw� si�� z bezgranicznych w�d Adanosa. 
	AI_Output (self, other ,"DIA_Myxir_HELLO2_03_03"); //Jeste�my Stra�nikami R�wnowagi tego �wiata i staramy si�, aby konflikt Innosa z Beliarem nie zosta� przewa�ony przez kt�r�� ze stron.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_04"); //Jakby kt�ry� z nich zatryumfowa�, oznacza�oby to pocz�tki rz�du chaosu. Na �wiecie istnieje nas oczywi�cie wi�cej, jednak nie tak du�o jak Mag�w Ognia.
    AI_Output (self, other ,"DIA_Myxir_HELLO2_03_05"); //Niekt�rzy g�osz� nauki o bogach w miastach, jak cho�by Vatras, drugi najpot�niejszy Mag Wody po Saturasie. Z tego co wiem od lat mieszka w Khorinis. 
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
   description	= "W pobli�u obozu pojawi�y si�...";
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
    AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_01"); //W pobli�u obozu pojawi�y si� przyzwane ogniste jaszczury i stra� Gomeza. Najwyra�niej szykuj� si� do ataku.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_02"); //Wiem ju� o wszystkim od Saturasa. Trzeba dzia�a� niezw�ocznie. 
	AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_03"); //Powinni�my ruszy� przed ob�z. 
    AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_04"); //Tak, musimy ich powstrzyma�, co nie b�dzie �atwe.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_05"); //Zapami�taj. �ycie Maga Wody nie jest us�ane r�ami.
	AI_Output (other, self ,"DIA_Myxir_Help_For_NC_15_06"); //Zatem w drog�.
    AI_Output (self, other ,"DIA_Myxir_Help_For_NC_03_07"); //Ruszajmy.
	B_LogEntry               (OgnisteJaszczury,"Rozmawia�em z Myxirem. Teraz pora uda� si� do olbrzymich ognistych jaszczur�w i zako�czy� ich �ywot.");
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
   description	= "Uda�o si�.";
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
    AI_Output (other, self ,"DIA_Myxir_KillWaransr_NC_15_01"); //Uda�o si�.
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_02"); //To by�a ci�ka przeprawa.
	AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_03"); //Zostali jeszcze stra�nicy w trzech grupach, nadal s� w ukryciu i czekaj� na moment ataku. W jednej z nich widzia�em Cienia-Magika Jima
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_04"); //Trzeba ich zg�adzi�, ��cznie z tym magikiem z doskoku.
    AI_Output (self, other ,"DIA_Myxir_KillWaransr_NC_03_05"); //Wracam do Saturasa zda� raport. Ty zbierz Torlofa, Gorna i Kos�, p�ki jeszcze jest cicho a potem rozbijcie w py� stra�.
	AI_Output (other, self ,"DIA_Myxir_KillWaransr_NC_15_06"); //W porz�dku, zajm� si� tym najszybciej jak si� da.
		B_LogEntry               (OgnisteJaszczury,"Pokonali�my ogniste jaszczury. Myxir poleci� mi teraz zebra� Gorna, Torlofa i Kos� a nast�pnie pokona� Stra�nik�w, kt�rzy zaj�li 3 stanowiska nieopodal Nowego Obozu.");
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