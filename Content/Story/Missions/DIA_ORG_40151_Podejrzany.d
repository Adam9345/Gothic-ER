// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Podejrzany_EXIT(C_INFO)
{
	npc             = ORG_40151_Podejrzany;
	nr              = 999;
	condition	= DIA_Podejrzany_EXIT_Condition;
	information	= DIA_Podejrzany_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Podejrzany_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Podejrzany_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Podejrzany_HELLO1 (C_INFO)
{
   npc          = ORG_40151_Podejrzany;
   nr           = 1;
   condition    = DIA_Podejrzany_HELLO1_Condition;
   information  = DIA_Podejrzany_HELLO1_Info;
   permanent	= FALSE;
   important = TRUE;
};

FUNC INT DIA_Podejrzany_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Florian_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Podejrzany_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_15_01"); //Co tu robisz?
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_02"); //Móg³bym ciê zapytaæ o to samo.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_03"); //Eeee...To moje ulubione miejsce....Lubiê siê tutaj wyciszyæ....
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_04"); //Po dokonanym zabójstwie?
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_05"); //O czym ty do cholery....
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_06"); //Czego tu w ogóle szukasz?
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_07"); //Cz³owieka, który próbowa³ zg³adziæ Lee - szefa Najemników.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_08"); //Tutaj go nie ma!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_09"); //Nie strugaj idioty. By³eœ jednym z trzech zamachowców. 
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_10"); //Nie!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_11"); //Jeszcze jednen uciek³ bram¹.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_12"); //To on zabi³ tego ³ysego Najemnika. Musisz go dopaœæ! Drañ pewnie chce zgarn¹æ rudê chocia¿ nasz zadanie....
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_13"); //Wynajêli was Magnaci prawda?
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_14"); //IdŸ pod ten Stary Obóz to mo¿e go jeszcze z³apiesz. Mnie puœæ wolno. A jak pomo¿esz mi siê st¹d wydostaæ to jeszcze ci zap³acê.
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_15"); //Nie ma mowy. Ty i twój wspólnik musiecie zgin¹æ.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_16"); //Skoro tak.... To sam st¹d ucieknê jak ju¿ bêdziesz trupem!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_17"); //Giñ!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    
};

instance dia_podejrzany_pickpocket(c_info) {
    npc = org_40151_podejrzany;
    nr = 900;
    condition = dia_podejrzany_pickpocket_condition;
    information = dia_podejrzany_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_podejrzany_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_podejrzany_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_podejrzany_pickpocket);
	info_addchoice(dia_podejrzany_pickpocket, dialog_back, dia_podejrzany_pickpocket_back);
	info_addchoice(dia_podejrzany_pickpocket, dialog_pickpocket, dia_podejrzany_pickpocket_doit);
};

func void dia_podejrzany_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_podejrzany_pickpocket);
};

func void dia_podejrzany_pickpocket_back() {
    info_clearchoices(dia_podejrzany_pickpocket);
};