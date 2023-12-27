//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Perrick_EXIT(C_INFO)
{
	npc             = STT_40052_Perrick;
	nr              = 999;
	condition	= DIA_Perrick_EXIT_Condition;
	information	= DIA_Perrick_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Perrick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Perrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DEXTER
//========================================

INSTANCE DIA_Perrick_DEXTER (C_INFO)
{
   npc          = STT_40052_Perrick;
   nr           = 1;
   condition    = DIA_Perrick_DEXTER_Condition;
   information  = DIA_Perrick_DEXTER_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Perrick_DEXTER_Condition()
{
if (Dexter_GetKalomsRecipe == LOG_SUCCESS)//(Npc_KnowsInfo(hero,DIA_Dexter_KalomsRecipeSuccess))
{
    return TRUE;
};
};
FUNC VOID DIA_Perrick_DEXTER_Info()
{
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_01"); //Hej, s³ysza³em o tobie od Dextera.
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_02"); //A niby co takiego?
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_03"); //Podobno jak gdyby nigdy nic wszed³eœ do laboratorium Cor Caloma i gwizdn¹³eœ mu jego cenn¹ recepturê.
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_04"); //To prawda.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_05"); //Dexter jest uradowany ale byæ mo¿e zarozumia³y Calom nawet nie domyœla siê, ¿e to sprawka ludzi z poza Sekty.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_06"); //Co powiesz na ponown¹ wizytê w jego laboratorium i zostawienie mu ma³ego liœcika. 
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_07"); //Ten ³ysy w¹¿ poczyta³by o sobie parê ciekawych rzeczy... Hahahah
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_08"); //Hmmmm, rozumiem ale mam te¿ parê innych spraw na g³owie.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_09"); //Kto powiedzia³, ¿e zrobisz to za darmo? Za ten numer dostaniesz nagrodê.
};

//========================================
//-----------------> CALOM
//========================================

INSTANCE DIA_Perrick_CALOM (C_INFO)
{
   npc          = STT_40052_Perrick;
   nr           = 2;
   condition    = DIA_Perrick_CALOM_Condition;
   information  = DIA_Perrick_CALOM_Info;
   permanent	= FALSE;
   description	= "Có¿, mo¿e jednak z³o¿e wizytê Cor Calomowi. ";
};

FUNC INT DIA_Perrick_CALOM_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Perrick_DEXTER))
{
    return TRUE;
};
};
FUNC VOID DIA_Perrick_CALOM_Info()
{
    AI_Output (other, self ,"DIA_Perrick_CALOM_15_01"); //Có¿, mo¿e jednak z³o¿e wizytê Cor Calomowi. 
    AI_Output (self, other ,"DIA_Perrick_CALOM_03_02"); //Œwietnie, trzymaj ten list z wyrazami uznania. I pamiêtaj by nikt z obstawy Caloma siê nie po³apa³!
	B_GiveInvItems (self,other, ItWr_PerrickToCalom, 1);
    AI_Output (other, self ,"DIA_Perrick_CALOM_15_03"); //Spokojna g³owa.
	PerrickGiftForCalom = LOG_MISSION;
	Log_CreateTopic		(WiazankaDlaCorCaloma,	LOG_MISSION);
	Log_SetTopicStatus	(WiazankaDlaCorCaloma,	LOG_RUNNING);
	 B_LogEntry               (WiazankaDlaCorCaloma,"Cieñ Perrick chcia³by zrobiæ kawa³ Cor Calomowi. Dowiedzia³ siê, ¿e ukrad³em mu pewn¹ cenn¹ recepturê wiêc chcia³by abym wrzuci³ do kufra Caloma pewn¹ obraŸliw¹ notkê. Mogê siê tym zaj¹æ.");
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Perrick_HELLO1 (C_INFO)
{
   npc          = STT_40052_Perrick;
   nr           = 1;
   condition    = DIA_Perrick_HELLO1_Condition;
   information  = DIA_Perrick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Podrzuci³em twój list do skrzyni Cor Caloma.";
};

FUNC INT DIA_Perrick_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Templer_WDC_SWORD))
&& (Mob_HasItems("CALOMCHEST_MIS", ItWr_PerrickToCalom) == 1) 
{
    return TRUE;
};
};
FUNC VOID DIA_Perrick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Perrick_HELLO1_15_01"); //Podrzuci³em twój list do skrzyni Cor Caloma.
	Npc_ExchangeRoutine(Tpl_1406_Templer,"Start");
    AI_Output (self, other ,"DIA_Perrick_HELLO1_03_02"); //Œwietnie, zatem ten zarozumia³y robak pewnie wœcieka siê teraz ze z³oœci.
    AI_Output (self, other ,"DIA_Perrick_HELLO1_03_03"); //Zas³u¿y³eœ na kilka bry³ek, oto one.
	B_GiveInvItems (self,other, itminugget, 100);
    AI_Output (other, self ,"DIA_Perrick_HELLO1_15_04"); //Dziêki.
	PerrickGiftForCalom = LOG_SUCCESS;
	B_LogEntry               (WiazankaDlaCorCaloma,"Wrzuci³em list Perricka do skrzyni Caloma I wróci³em do Cienia. Ten zadowolony wyp³aci³ mi nale¿n¹ nagrodê choæ zapewne nie domyœla siê jak by³o to skomplikowane.");
	B_GiveXP(350);
	Log_SetTopicStatus	(WiazankaDlaCorCaloma,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> HI_PERR
//========================================

INSTANCE DIA_Perrick_HI_PERR (C_INFO)
{
   npc          = STT_40052_Perrick;
   nr           = 1;
   condition    = DIA_Perrick_HI_PERR_Condition;
   information  = DIA_Perrick_HI_PERR_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Perrick_HI_PERR_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Perrick_HI_PERR_Info()
{
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_02"); //Mam na imiê Perrick. Od niedawna nale¿ê do Cieni I póki co nie narzekam zbytnio.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_03"); //Chcia³byœ awansowaæ dalej?
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_04"); //Na razie chce po prostu umocniæ swoj¹ pozycjê w aktualnej gildii.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_05"); //Zastanawiam siê jak tego dokonaæ.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_06"); //Mo¿e porozmawiaj z Diego... Powinien ci coœ doradziæ.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_07"); //Nie. Chcê wymyœleæ coœ co mu siê spodoba bez wczeœniejszej interakcji z nim.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_08"); //Mo¿e mi siê uda. Ale jak mówiê teraz te¿ nie jest Ÿle.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_09"); //S¹ mniej wp³ywowi Cienie ode mnie. Ale te¿ nie mam co rzecz jasna równaæ siê ze Scatty’m, Z³ym, Œiwstakiem czy choæby Dexterem.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_10"); //Jeœli nie pope³nie jakiegoœ b³êdu to powinno byæ w porz¹dku. Kolonia rzadka wybacza b³êdy. Wielu ju¿ siê o tym przekona³o.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_11"); //Zapewne.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_12"); //Wiêc radzê zacisn¹æ zêby i pokazaæ jaja. Tylko to plus g³owa na karku dadz¹ ci godne miejsce pod barier¹.
};










