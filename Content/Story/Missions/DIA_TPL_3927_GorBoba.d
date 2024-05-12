//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GorBoba_EXIT(C_INFO)
{
	npc             = TPL_3927_GorBoba;
	nr              = 999;
	condition	= DIA_GorBoba_EXIT_Condition;
	information	= DIA_GorBoba_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GorBoba_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GorBoba_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> 3927_HELLO_01
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 1;
   condition    = DIA_GorBoba_3927_HELLO_01_Condition;
   information  = DIA_GorBoba_3927_HELLO_01_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_GorBoba_3927_HELLO_01_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorBoba_3927_HELLO_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_01_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_01_03_02"); //M�wi� na mnie Gor Boba. Jestem Stra�nikiem �wi�tynnym i wiernym s�ug� �ni�cego.
};

//========================================
//-----------------> 3927_HELLO_02
//========================================

INSTANCE DIA_GorBoba_3927_HELLO_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 2;
   condition    = DIA_GorBoba_3927_HELLO_02_Condition;
   information  = DIA_GorBoba_3927_HELLO_02_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_GorBoba_3927_HELLO_02_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_HELLO_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_02_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_02_03_02"); //Trenuj�, by pewnego dnia zdoby� tytu� mistrza areny.
};

//========================================
//-----------------> 3927_TEACH_01
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_01 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 3;
   condition    = DIA_GorBoba_3927_TEACH_01_Condition;
   information  = DIA_GorBoba_3927_TEACH_01_Info;
   permanent	= FALSE;
   description	= "Mo�esz podszkoli� mnie w walce?";
};

FUNC INT DIA_GorBoba_3927_TEACH_01_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_HELLO_01))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorBoba_3927_TEACH_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_01_15_01"); //Mo�esz podszkoli� mnie w walce?
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_02"); //Niestety, nie mam na to czasu.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_03"); //Chocia�... Mog� da� ci pewn� wskaz�wk�, dzi�ki kt�rej b�dziesz zadawa� nieco mocniejsze uderzenia. Powiedz, gdy b�dziesz got�w.
};

//========================================
//-----------------> 3927_TEACH_02
//========================================

INSTANCE DIA_GorBoba_3927_TEACH_02 (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_3927_TEACH_02_Condition;
   information  = DIA_GorBoba_3927_TEACH_02_Info;
   permanent	= FALSE;
   description	= "Jestem got�w.";
};

FUNC INT DIA_GorBoba_3927_TEACH_02_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_GorBoba_3927_TEACH_01))
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_3927_TEACH_02_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_15_01"); //Jestem got�w.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_15_02"); //Przed wyprowadzeniem uderzenia skup si� i we� g��boki wdech. Wyprowadzaj�c atak, wypu�� powietrze z p�uc i pozw�l broni na swobodny ruch w kierunku przeciwnika.
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_03_03"); //Dzi�kuj�.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_03_04"); //Ta wiedza mo�e uratowa� ci �ycie. Korzystaj z niej m�drze.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si�a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
};



//========================================
//-----------------> Srebrny grom
//========================================

INSTANCE DIA_GorBoba_SWORD (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_SWORD_Condition;
   information  = DIA_GorBoba_SWORD_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_GorBoba_SWORD_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NOV)
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_SWORD_Info()
{
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_01"); //Zatrzymaj si� Nowicjuszu. Mam do ciebie pewien interes.
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_03"); //Dowiedzia�em si� od Gor Na Draka pewnej interesuj�cej rzeczy. W starej kopalni odkryto z�o�a pewnego bardzo rzadkiego minera�u. Zw� go ,,srebrny grom�.
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_04"); //Co to ma wsp�lnego z tob�?
	
	AI_Output (self, other ,"DIA_GorBoba_SWORD_15_05"); //S�ysza�em, �e tego minera�u mo�na u�y� do wzmocnienia broni. Chcia�bym wi�c ulepszy� sw�j miecz.
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_06"); //Kowal Darrion m�wi�, �e b�dzie potrzebne 40 bry�ek srebrnego gromu.
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_07"); //Mam jednak kilka spraw na g�owie co utrudnia mi udanie si� do Starej kopalni. Za to ty m�g�by� to zrobi�, prawda?
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_08"); //To zale�y ile za to dostan�.
	
	AI_Output (self, other ,"DIA_GorBoba_SWORD_15_09"); //Odpowiedni� du�� sum�, nie zawiedziesz si�. Mo�esz mi zaufa� jako stra�nikowi �wi�tynnemu.
   
	Info_ClearChoices(DIA_GorBoba_SWORD);
	Info_AddChoice	 (DIA_GorBoba_SWORD, "Mog� popyta� co nieco w Starej kopalni." ,DIA_GorBoba_SWORD_ADD);
	
};

func void DIA_GorBoba_SWORD_ADD()
{
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_00"); //Mog� popyta� co nieco w Starej kopalni.
	AI_Output (self, other,"DIA_GorBoba_SWORD_ADD_03_01"); //Wspaniale. B�d� ci bardzo wdzi�czny. A teraz pozw�l, �e powr�c� do swoich obowi�zk�w.
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_02"); //Do zobaczenia.
	AI_Output (self, other,"DIA_GorBoba_SWORD_ADD_03_03"); //By�bym zapomnia�. Poszukiwania mo�esz zacz�� od hutnika W�a. On mo�e co� wiedzie�.
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_04"); //Dobra.
	Log_CreateTopic		(MieczGorBoby,	LOG_MISSION);
	Log_SetTopicStatus	(MieczGorBoby,	LOG_RUNNING);
	B_LogEntry               (MieczGorBoby,"Wojownik �wi�tynny Gor Boba powiedzia�, �e dowiedzia� si� i� w kopalni odkryto cenny minera� zwany ,,srebrnym gromem�. Gor Boba chcia�by ulepszy� sobie nim sw�j miecz. Obozowy kowal Darrion potrzebowa�by do tego 40 bry�ek tego surowca. Musz� uda� si� do Starej Kopalni i pom�wi� z kilkoma osobami. Poleci� mi bym zacz�� od hutnika W�a.");
	BobaSwordR = TRUE;
	
    AI_StopProcessInfos	(self);
	
	
};




//========================================
//-----------------> Srebrny grom
//========================================

INSTANCE DIA_GorBoba_IHave_Nugget (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_IHave_Nugget_Condition;
   information  = DIA_GorBoba_IHave_Nugget_Info;
   permanent	= FALSE;
   description    = "Mam 40 bry�ek srebrnego gromu.";
};

FUNC INT DIA_GorBoba_IHave_Nugget_Condition()
{
	if (Npc_HasItems (other, ItMi_SilverNugget) >=40)
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_IHave_Nugget_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_IHave_Nugget_15_01"); //Mam 40 bry�ek srebrnego gromu.
    AI_Output (self, other ,"DIA_GorBoba_IHave_Nugget_03_02"); //Genialnie. Zanie� go kowalowi Darrionowi, on b�dzie wiedzia� co robi�. 
    AI_Output (self, other ,"DIA_GorBoba_IHave_Nugget_03_03"); //I we� m�j miecz.
	B_GiveInvItems (self,other, ItMw_Sword_Boba, 1); 
    AI_Output (other, self ,"DIA_GorBoba_IHave_Nugget_15_04"); //Ehh... niech b�dzie.
	B_LogEntry               (MieczGorBoby,"Gor Boba powiedzia� bym uda� si� z cennym kruszcem do Darriona. On wzmocni jego miecz.");
	
};


//========================================
//-----------------> Srebrny grom
//========================================

INSTANCE DIA_GorBoba_IHave_USW (C_INFO)
{
   npc          = TPL_3927_GorBoba;
   nr           = 4;
   condition    = DIA_GorBoba_IHave_USW_Condition;
   information  = DIA_GorBoba_IHave_USW_Info;
   permanent	= FALSE;
   description    = "Mam tw�j wzmocniony miecz.";
};

FUNC INT DIA_GorBoba_IHave_USW_Condition()
{
	if (Npc_HasItems (other, ItMwM_Sword_Boba) >=1) && (Npc_KnowsInfo(hero,DIA_Darrion_Boba_Sword_Done))
	
{
    return TRUE;   
};
};

FUNC VOID DIA_GorBoba_IHave_USW_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_01"); //Mam tw�j wzmocniony miecz.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_02"); //Wspaniale. Poka� mi go.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_03"); //Najpierw ruda.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_04"); //Bierz
	B_GiveInvItems (self,other, ItMiNugget, 500);
	B_GiveInvItems (other,self, ItMwM_Sword_Boba, 1);
	AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_05"); //Oto tw�j miecz.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_06"); //Dzi�ki. 
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	
	
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_07"); //Widz�, �e to teraz kapitalna bro�. Dzi�ki za okazan� pomoc.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_08"); //Drobiazg.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_09"); //Mylisz si�. Teraz jestem w posiadaniu zab�jczego or�a, takiego jakiego zawsze chcia�em mie�.
	AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_10"); //Teraz ka�dy wr�g Bractwa posmakuje mego ostrza.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_11"); //No to zachwycaj si� nim dalej a ja p�jd� ju� w swoj� stron�.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_12"); //W porz�dku. Do zobaczenia.
	TPL_3927_GorBoba.attribute[ATR_STRENGTH] = 150;
	
	BobaSwordR = FALSE;
	B_LogEntry               (MieczGorBoby,"Da�em  Gor Bobie miecz ulepszony minera�em. Ten w zamian wyp�aci� mi sowit� nagrod�.");
	Log_SetTopicStatus	(MieczGorBoby,	LOG_SUCCESS);
	B_GiveXP(450);
};

instance dia_tpl_3927_pickpocket(c_info) {
    npc = tpl_3927_gorboba;
    nr = 900;
    condition = dia_tpl_3927_pickpocket_condition;
    information = dia_tpl_3927_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_3927_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_3927_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_3927_pickpocket);
	info_addchoice(dia_tpl_3927_pickpocket, dialog_back, dia_tpl_3927_pickpocket_back);
	info_addchoice(dia_tpl_3927_pickpocket, dialog_pickpocket, dia_tpl_3927_pickpocket_doit);
};

func void dia_tpl_3927_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_tpl_3927_pickpocket);
};

func void dia_tpl_3927_pickpocket_back() {
    info_clearchoices(dia_tpl_3927_pickpocket);
};