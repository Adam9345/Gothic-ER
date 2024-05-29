//poprawione i sprawdzone - Reflide

// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Harlok_Exit (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 999;
	condition	= DIA_Harlok_Exit_Condition;
	information	= DIA_Harlok_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Harlok_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Harlok_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Harlok abholen
// **************************************************

instance  DIA_Harlok_FetchHarlok (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_FetchHarlok_Condition;
	information	= DIA_Harlok_FetchHarlok_Info;
	permanent	= 0;
	description	= "Przysy�a mnie Ghorim.";
};                       

FUNC int  DIA_Harlok_FetchHarlok_Condition()
{
	if	(Ghorim_KickHarlok == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_FetchHarlok_Info()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Przysy�a mnie Ghorim.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //Co?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Rusz dup� do roboty, albo dostaniesz kopa!",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Mam ci przypomnie�, �e powiniene� go wreszcie zluzowa�."			,DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Mam ci przypomnie�, �e powiniene� go wreszcie zluzowa�.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //To bardzo mi�o z twojej strony. Przypomnij mi znowu, jak ju� si� wy�pi�, dobra?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Rusz dup� do roboty, albo dostaniesz kopa!
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //Tylko spr�buj mi podskoczy�, frajerze!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Dobra, dobra.
	Info_ClearChoices (DIA_Harlok_FetchHarlok);
};


// **************************************************
//				Harlok NOCHMAL �berzeugen
// **************************************************

instance  DIA_Harlok_HarlokAgain (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_HarlokAgain_Condition;
	information	= DIA_Harlok_HarlokAgain_Info;
	permanent	= 0;
	description	= "Chcia�em ci tylko przypomnie�, �e masz zmieni� twojego koleg�.";
};                       

FUNC int  DIA_Harlok_HarlokAgain_Condition()
{
	if ( (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) && Npc_KnowsInfo(hero, DIA_Harlok_FetchHarlok) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_HarlokAgain_Info()
{
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //Chcia�em ci tylko przypomnie�, �e masz zmieni� twojego koleg�.
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //S�uchaj, kole�. Kaza�em ci spada�!

	B_LogEntry(CH1_GhorimsRelief,	"Harlok jest nie tylko leniwy, ale i bardzo uparty. Chyba powinienem by� bardziej stanowczy...");
};


// **************************************************
//				Harlok schicken (nach Aufs-Maul)
// **************************************************

instance  DIA_Harlok_SendHarlok (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_SendHarlok_Condition;
	information	= DIA_Harlok_SendHarlok_Info;
	permanent	= 0;
	description	= "No i co? Masz ju� ochot� zmieni� swojego koleg�?";
};                       

FUNC int  DIA_Harlok_SendHarlok_Condition()
{
	if ( (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) && Npc_KnowsInfo(hero, DIA_Harlok_FetchHarlok) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_SendHarlok_Info()
{
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //No i co? Masz ju� ochot� zmieni� swojego koleg�?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //Wiesz co? Jeste� jak wrz�d na ty�ku! Czemu wtykasz nos w nie swoje sprawy?
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Chcia�em tylko zobaczy� ci� przy pracy...
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Dobra, dobra - ju� id�... Frajer!

	B_LogEntry	(CH1_GhorimsRelief,	"Harlok wreszcie ruszy� ty�ek. Wkr�tce zmieni Ghorima.");
	B_GiveXP	(XP_SentHarlok);
	
	Npc_ExchangeRoutine(self,"START");
	var C_NPC Ghorim; Ghorim = Hlp_GetNpc(Nov_1310_Ghorim);
	Npc_ExchangeRoutine(Ghorim,"START");
	Ghorim_KickHarlok = LOG_SUCCESS;
	Npc_SetPermAttitude(Ghorim,ATT_FRIENDLY);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos	(self);
};

// **************************************************
//			Harlok REFUSE TALK - PERM
// **************************************************

instance  DIA_Harlok_Angry (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_Angry_Condition;
	information	= DIA_Harlok_Angry_Info;
	permanent	= 1;
	important 	= 1; 
};                       

FUNC int  DIA_Harlok_Angry_Condition()
{
	if (Npc_IsInState(self,ZS_TALK) && (Ghorim_KickHarlok == LOG_SUCCESS) ) && !(Npc_KnowsInfo(hero,DIA_Darrion_Amulet_Oprawa))
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_Angry_Info()
{
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //Zostaw mnie w spokoju! Przecie� ju� id�!

	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Darrion
//========================================

INSTANCE DIA_Harlok_Darrion (C_INFO)
{
   npc          = Nov_1358_Harlok;
   nr           = 1;
   condition    = DIA_Harlok_Darrion_Condition;
   information  = DIA_Harlok_Darrion_Info;
   permanent	= FALSE;
   description	= "hs@FF0000 Pono� dziwnie kr�ci�e� si� obok Darriona.";
};

FUNC INT DIA_Harlok_Darrion_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Darrion_Amulet_Oprawa))
{
    return TRUE;
};
};
FUNC VOID DIA_Harlok_Darrion_Info()
{
    AI_Output (other, self ,"DIA_Harlok_Darrion_15_01"); //Pono� dziwnie kr�ci�e� si� obok Darriona.
    AI_Output (self, other ,"DIA_Harlok_Darrion_03_02"); //Co to? Ten �wok my�li, �e mam na niego ochot� czy co? 
    AI_Output (other, self ,"DIA_Harlok_Darrion_15_03"); //Zaraz nie b�dzie ci do �miechu. Okrad�e� go zabieraj�c mu sakiewk� i co� co nale�a�o do mnie.
    AI_Output (self, other ,"DIA_Harlok_Darrion_03_04"); //Nawet je�li... Co z tym zrobisz szczurku? Poskar�ysz si� mamusi?!
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Harlok_Darrion_15_05"); //Zaraz wsadz� ci ten miecz w dupe!
    AI_Output (self, other ,"DIA_Harlok_Darrion_03_06"); //No prosz�. Sam si� prosisz o lanie frajerze. 
	CreateInvItem (Nov_1358_Harlok, ItMi_Worek_Darrion);
	CreateInvItem (Nov_1358_Harlok, Amulett_BrandickS_02);
	self.aivar[AIV_WASDEFEATEDBYSC]== FALSE;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    AI_DrawWeapon (other);
    
};

//========================================
//-----------------> AMM
//========================================

INSTANCE DIA_Harlok_AMM (C_INFO)
{
   npc          = Nov_1358_Harlok;
   nr           = 2;
   condition    = DIA_Harlok_AMM_Condition;
   information  = DIA_Harlok_AMM_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Harlok_AMM_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Harlok_Darrion))
   && (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)

{
    return TRUE;
};
};
FUNC VOID DIA_Harlok_AMM_Info()
{
    AI_Output (self, other ,"DIA_Harlok_AMM_03_01"); //Aaaaa... Moje ko�ci...
    AI_Output (other, self ,"DIA_Harlok_AMM_15_02"); //Oooo prosz�. Jednak zgubione rzeczy Darriona si� znalaz�y.
    AI_Output (self, other ,"DIA_Harlok_AMM_03_03"); //Zejd� mi z oczu ty gnido.
    AI_Output (other, self ,"DIA_Harlok_AMM_15_04"); //Co to chcesz powt�rki? 
    AI_Output (self, other ,"DIA_Harlok_AMM_03_05"); //Nie, nie... Id� ju� pewno si� �pieszysz.
    AI_Output (other, self ,"DIA_Harlok_AMM_15_06"); //Przynajmniej teraz masz racj�.
    AI_StopProcessInfos	(self);
};

instance dia_harlok_pickpocket(c_info) {
    npc = nov_1358_harlok;
    nr = 900;
    condition = dia_harlok_pickpocket_condition;
    information = dia_harlok_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_harlok_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_harlok_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_harlok_pickpocket);
	info_addchoice(dia_harlok_pickpocket, dialog_back, dia_harlok_pickpocket_back);
	info_addchoice(dia_harlok_pickpocket, dialog_pickpocket, dia_harlok_pickpocket_doit);
};

func void dia_harlok_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_harlok_pickpocket);
};

func void dia_harlok_pickpocket_back() {
    info_clearchoices(dia_harlok_pickpocket);
};









