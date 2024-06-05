// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Nieznajomy_EXIT(C_INFO)
{
	npc             = Grd_40150_Nieznajomy;
	nr              = 999;
	condition	= DIA_Nieznajomy_EXIT_Condition;
	information	= DIA_Nieznajomy_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Nieznajomy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nieznajomy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nieznajomy_HELLO1 (C_INFO)
{
   npc          = Grd_40150_Nieznajomy;
   nr           = 1;
   condition    = DIA_Nieznajomy_HELLO1_Condition;
   information  = DIA_Nieznajomy_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nieznajomy_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Glen_DWMN_MAMCIE))
{
    return TRUE;
};
};
FUNC VOID DIA_Nieznajomy_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO1_03_01"); //Wynoœ siê od Ulberta pacanie!
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO1_15_02"); //Muszê z nim pomówiæ w pewnej sprawie.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO1_03_03"); //On jest zajêty.
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO1_15_04"); //Nie widaæ.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO1_03_05"); //I nie chce chce ciê widzieæ a tym bardziej strzêpiæ do ciebie jêzyka.
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO1_15_06"); //Jesteœ jego niañk¹, ¿e gadasz za niego? Co tu robisz i kto ciê przys³a³?
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO1_03_07"); //Ja? Po prostu tu jestem i nic ci do tego æwoku!
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO1_15_08"); //Porozmawiam sobie z Ulbertem a ty zejdŸ mi z drogi.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO1_03_09"); //Jeszcze s³owo i nie rêczê za siebie!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Nieznajomy_HELLO2 (C_INFO)
{
   npc          = Grd_40150_Nieznajomy;
   nr           = 2;
   condition    = DIA_Nieznajomy_HELLO2_Condition;
   information  = DIA_Nieznajomy_HELLO2_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Nieznajomy_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_ULBERT_DWMN_B2))
{
    return TRUE;
};
};
FUNC VOID DIA_Nieznajomy_HELLO2_Info()
{
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO2_03_01"); //Ten je³op da³ siê wykiwaæ. Szef wiedzia³, ¿e mog¹ byæ problemy.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO2_03_02"); //I st¹d tu jestem. W tym wypadku ¿eby ciê powstrzymaæ.
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO2_15_03"); //Na pró¿no bo zaraz pomówiê ze stosownymi osobami.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO2_03_04"); //Nie b¹dŸ tego taki pewien. Poœlê ciê do piek³a i ukryje cia³o.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO2_03_05"); //Potem podrzucê w niebezpiecznym rewirze i bêdzie na pe³zacze!
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO2_15_06"); //Sprytny plan. Ale nie zostanie zrealizowany bo mnie nie zatrzymasz.
    AI_Output (self, other ,"DIA_Nieznajomy_HELLO2_03_07"); //Trzeba by³o tutaj nie przychodziæ i nie wêszyæ. Nakarmiê ciê stal¹ wymoczku!
    AI_Output (other, self ,"DIA_Nieznajomy_HELLO2_15_08"); //Zaraz ¿ycie ciê zweryfikuje.
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

	
};

instance dia_nieznajomy_pickpocket(c_info) {
    npc = grd_40150_nieznajomy;
    nr = 900;
    condition = dia_nieznajomy_pickpocket_condition;
    information = dia_nieznajomy_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nieznajomy_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_nieznajomy_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nieznajomy_pickpocket);
	info_addchoice(dia_nieznajomy_pickpocket, dialog_back, dia_nieznajomy_pickpocket_back);
	info_addchoice(dia_nieznajomy_pickpocket, dialog_pickpocket, dia_nieznajomy_pickpocket_doit);
};

func void dia_nieznajomy_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_nieznajomy_pickpocket);
};

func void dia_nieznajomy_pickpocket_back() {
    info_clearchoices(dia_nieznajomy_pickpocket);
};