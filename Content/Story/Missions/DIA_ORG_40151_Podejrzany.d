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
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_02"); //M�g�bym ci� zapyta� o to samo.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_03"); //Eeee...To moje ulubione miejsce....Lubi� si� tutaj wyciszy�....
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_04"); //Po dokonanym zab�jstwie?
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_05"); //O czym ty do cholery....
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_06"); //Czego tu w og�le szukasz?
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_07"); //Cz�owieka, kt�ry pr�bowa� zg�adzi� Lee - szefa Najemnik�w.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_08"); //Tutaj go nie ma!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_09"); //Nie strugaj idioty. By�e� jednym z trzech zamachowc�w. 
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_10"); //Nie!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_11"); //Jeszcze jednen uciek� bram�.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_12"); //To on zabi� tego �ysego Najemnika. Musisz go dopa��! Dra� pewnie chce zgarn�� rud� chocia� nasz zadanie....
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_13"); //Wynaj�li was Magnaci prawda?
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_14"); //Id� pod ten Stary Ob�z to mo�e go jeszcze z�apiesz. Mnie pu�� wolno. A jak pomo�esz mi si� st�d wydosta� to jeszcze ci zap�ac�.
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_15"); //Nie ma mowy. Ty i tw�j wsp�lnik musiecie zgin��.
    AI_Output (self, other ,"DIA_Podejrzany_HELLO1_03_16"); //Skoro tak.... To sam st�d uciekn� jak ju� b�dziesz trupem!
    AI_Output (other, self ,"DIA_Podejrzany_HELLO1_15_17"); //Gi�!
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