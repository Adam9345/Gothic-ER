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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_GorBoba_3927_HELLO_01_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorBoba_3927_HELLO_01_Info()
{
    AI_Output (other, self ,"DIA_GorBoba_3927_HELLO_01_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_01_03_02"); //Mówi¹ na mnie Gor Boba. Jestem Stra¿nikiem Œwi¹tynnym i wiernym s³ug¹ Œni¹cego.
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
    AI_Output (self, other ,"DIA_GorBoba_3927_HELLO_02_03_02"); //Trenujê, by pewnego dnia zdobyæ tytu³ mistrza areny.
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
   description	= "Mo¿esz podszkoliæ mnie w walce?";
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
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_01_15_01"); //Mo¿esz podszkoliæ mnie w walce?
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_02"); //Niestety, nie mam na to czasu.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_01_03_03"); //Chocia¿... Mogê daæ ci pewn¹ wskazówkê, dziêki której bêdziesz zadawa³ nieco mocniejsze uderzenia. Powiedz, gdy bêdziesz gotów.
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
   description	= "Jestem gotów.";
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
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_15_01"); //Jestem gotów.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_15_02"); //Przed wyprowadzeniem uderzenia skup siê i weŸ g³êboki wdech. Wyprowadzaj¹c atak, wypuœæ powietrze z p³uc i pozwól broni na swobodny ruch w kierunku przeciwnika.
    AI_Output (other, self ,"DIA_GorBoba_3927_TEACH_02_03_03"); //Dziêkujê.
    AI_Output (self, other ,"DIA_GorBoba_3927_TEACH_02_03_04"); //Ta wiedza mo¿e uratowaæ ci ¿ycie. Korzystaj z niej m¹drze.
	other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 1;
	PrintScreen	("Si³a + 1", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_01"); //Zatrzymaj siê Nowicjuszu. Mam do ciebie pewien interes.
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_03"); //Dowiedzia³em siê od Gor Na Draka pewnej interesuj¹cej rzeczy. W starej kopalni odkryto z³o¿a pewnego bardzo rzadkiego minera³u. Zw¹ go ,,srebrny grom”.
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_04"); //Co to ma wspólnego z tob¹?
	
	AI_Output (self, other ,"DIA_GorBoba_SWORD_15_05"); //S³ysza³em, ¿e tego minera³u mo¿na u¿yæ do wzmocnienia broni. Chcia³bym wiêc ulepszyæ swój miecz.
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_06"); //Kowal Darrion mówi³, ¿e bêdzie potrzebne 40 bry³ek srebrnego gromu.
    AI_Output (self, other ,"DIA_GorBoba_SWORD_15_07"); //Mam jednak kilka spraw na g³owie co utrudnia mi udanie siê do Starej kopalni. Za to ty móg³byœ to zrobiæ, prawda?
    AI_Output (other, self ,"DIA_GorBoba_SWORD_15_08"); //To zale¿y ile za to dostanê.
	
	AI_Output (self, other ,"DIA_GorBoba_SWORD_15_09"); //Odpowiedni¹ du¿¹ sumê, nie zawiedziesz siê. Mo¿esz mi zaufaæ jako stra¿nikowi œwi¹tynnemu.
   
	Info_ClearChoices(DIA_GorBoba_SWORD);
	Info_AddChoice	 (DIA_GorBoba_SWORD, "Mogê popytaæ co nieco w Starej kopalni." ,DIA_GorBoba_SWORD_ADD);
	
};

func void DIA_GorBoba_SWORD_ADD()
{
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_00"); //Mogê popytaæ co nieco w Starej kopalni.
	AI_Output (self, other,"DIA_GorBoba_SWORD_ADD_03_01"); //Wspaniale. Bêdê ci bardzo wdziêczny. A teraz pozwól, ¿e powrócê do swoich obowi¹zków.
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_02"); //Do zobaczenia.
	AI_Output (self, other,"DIA_GorBoba_SWORD_ADD_03_03"); //By³bym zapomnia³. Poszukiwania mo¿esz zacz¹æ od hutnika Wê¿a. On mo¿e coœ wiedzieæ.
	AI_Output (other, self,"DIA_GorBoba_SWORD_ADD_15_04"); //Dobra.
	Log_CreateTopic		(MieczGorBoby,	LOG_MISSION);
	Log_SetTopicStatus	(MieczGorBoby,	LOG_RUNNING);
	B_LogEntry               (MieczGorBoby,"Wojownik Œwi¹tynny Gor Boba powiedzia³, ¿e dowiedzia³ siê i¿ w kopalni odkryto cenny minera³ zwany ,,srebrnym gromem”. Gor Boba chcia³by ulepszyæ sobie nim swój miecz. Obozowy kowal Darrion potrzebowa³by do tego 40 bry³ek tego surowca. Muszê udaæ siê do Starej Kopalni i pomówiæ z kilkoma osobami. Poleci³ mi bym zacz¹³ od hutnika Wê¿a.");
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
   description    = "Mam 40 bry³ek srebrnego gromu.";
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
    AI_Output (other, self ,"DIA_GorBoba_IHave_Nugget_15_01"); //Mam 40 bry³ek srebrnego gromu.
    AI_Output (self, other ,"DIA_GorBoba_IHave_Nugget_03_02"); //Genialnie. Zanieœ go kowalowi Darrionowi, on bêdzie wiedzia³ co robiæ. 
    AI_Output (self, other ,"DIA_GorBoba_IHave_Nugget_03_03"); //I weŸ mój miecz.
	B_GiveInvItems (self,other, ItMw_Sword_Boba, 1); 
    AI_Output (other, self ,"DIA_GorBoba_IHave_Nugget_15_04"); //Ehh... niech bêdzie.
	B_LogEntry               (MieczGorBoby,"Gor Boba powiedzia³ bym uda³ siê z cennym kruszcem do Darriona. On wzmocni jego miecz.");
	
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
   description    = "Mam twój wzmocniony miecz.";
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
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_01"); //Mam twój wzmocniony miecz.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_02"); //Wspaniale. Poka¿ mi go.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_03"); //Najpierw ruda.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_04"); //Bierz
	B_GiveInvItems (self,other, ItMiNugget, 500);
	B_GiveInvItems (other,self, ItMwM_Sword_Boba, 1);
	AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_05"); //Oto twój miecz.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_06"); //Dziêki. 
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	
	
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_07"); //Widzê, ¿e to teraz kapitalna broñ. Dziêki za okazan¹ pomoc.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_08"); //Drobiazg.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_09"); //Mylisz siê. Teraz jestem w posiadaniu zabójczego orê¿a, takiego jakiego zawsze chcia³em mieæ.
	AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_10"); //Teraz ka¿dy wróg Bractwa posmakuje mego ostrza.
    AI_Output (other, self ,"DIA_GorBoba_IHave_USW_15_11"); //No to zachwycaj siê nim dalej a ja pójdê ju¿ w swoj¹ stronê.
    AI_Output (self, other ,"DIA_GorBoba_IHave_USW_03_12"); //W porz¹dku. Do zobaczenia.
	TPL_3927_GorBoba.attribute[ATR_STRENGTH] = 150;
	
	BobaSwordR = FALSE;
	B_LogEntry               (MieczGorBoby,"Da³em  Gor Bobie miecz ulepszony minera³em. Ten w zamian wyp³aci³ mi sowit¹ nagrodê.");
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