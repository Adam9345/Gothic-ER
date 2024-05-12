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