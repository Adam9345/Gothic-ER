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
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_01"); //Hej, s�ysza�em o tobie od Dextera.
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_02"); //A niby co takiego?
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_03"); //Podobno jak gdyby nigdy nic wszed�e� do laboratorium Cor Caloma i gwizdn��e� mu jego cenn� receptur�.
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_04"); //To prawda.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_05"); //Dexter jest uradowany ale by� mo�e zarozumia�y Calom nawet nie domy�la si�, �e to sprawka ludzi z poza Sekty.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_06"); //Co powiesz na ponown� wizyt� w jego laboratorium i zostawienie mu ma�ego li�cika. 
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_07"); //Ten �ysy w�� poczyta�by o sobie par� ciekawych rzeczy... Hahahah
    AI_Output (other, self ,"DIA_Perrick_DEXTER_15_08"); //Hmmmm, rozumiem ale mam te� par� innych spraw na g�owie.
    AI_Output (self, other ,"DIA_Perrick_DEXTER_03_09"); //Kto powiedzia�, �e zrobisz to za darmo? Za ten numer dostaniesz nagrod�.
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
   description	= "C�, mo�e jednak z�o�e wizyt� Cor Calomowi. ";
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
    AI_Output (other, self ,"DIA_Perrick_CALOM_15_01"); //C�, mo�e jednak z�o�e wizyt� Cor Calomowi. 
    AI_Output (self, other ,"DIA_Perrick_CALOM_03_02"); //�wietnie, trzymaj ten list z wyrazami uznania. I pami�taj by nikt z obstawy Caloma si� nie po�apa�!
	B_GiveInvItems (self,other, ItWr_PerrickToCalom, 1);
    AI_Output (other, self ,"DIA_Perrick_CALOM_15_03"); //Spokojna g�owa.
	PerrickGiftForCalom = LOG_MISSION;
	Log_CreateTopic		(WiazankaDlaCorCaloma,	LOG_MISSION);
	Log_SetTopicStatus	(WiazankaDlaCorCaloma,	LOG_RUNNING);
	 B_LogEntry               (WiazankaDlaCorCaloma,"Cie� Perrick chcia�by zrobi� kawa� Cor Calomowi. Dowiedzia� si�, �e ukrad�em mu pewn� cenn� receptur� wi�c chcia�by abym wrzuci� do kufra Caloma pewn� obra�liw� notk�. Mog� si� tym zaj��.");
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
   description	= "Podrzuci�em tw�j list do skrzyni Cor Caloma.";
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
    AI_Output (other, self ,"DIA_Perrick_HELLO1_15_01"); //Podrzuci�em tw�j list do skrzyni Cor Caloma.
	Npc_ExchangeRoutine(Tpl_1406_Templer,"Start");
    AI_Output (self, other ,"DIA_Perrick_HELLO1_03_02"); //�wietnie, zatem ten zarozumia�y robak pewnie w�cieka si� teraz ze z�o�ci.
    AI_Output (self, other ,"DIA_Perrick_HELLO1_03_03"); //Zas�u�y�e� na kilka bry�ek, oto one.
	B_GiveInvItems (self,other, itminugget, 100);
    AI_Output (other, self ,"DIA_Perrick_HELLO1_15_04"); //Dzi�ki.
	PerrickGiftForCalom = LOG_SUCCESS;
	B_LogEntry               (WiazankaDlaCorCaloma,"Wrzuci�em list Perricka do skrzyni Caloma I wr�ci�em do Cienia. Ten zadowolony wyp�aci� mi nale�n� nagrod� cho� zapewne nie domy�la si� jak by�o to skomplikowane.");
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Perrick_HI_PERR_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Perrick_HI_PERR_Info()
{
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_02"); //Mam na imi� Perrick. Od niedawna nale�� do Cieni I p�ki co nie narzekam zbytnio.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_03"); //Chcia�by� awansowa� dalej?
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_04"); //Na razie chce po prostu umocni� swoj� pozycj� w aktualnej gildii.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_05"); //Zastanawiam si� jak tego dokona�.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_06"); //Mo�e porozmawiaj z Diego... Powinien ci co� doradzi�.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_07"); //Nie. Chc� wymy�le� co� co mu si� spodoba bez wcze�niejszej interakcji z nim.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_08"); //Mo�e mi si� uda. Ale jak m�wi� teraz te� nie jest �le.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_09"); //S� mniej wp�ywowi Cienie ode mnie. Ale te� nie mam co rzecz jasna r�wna� si� ze Scatty�m, Z�ym, �iwstakiem czy cho�by Dexterem.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_10"); //Je�li nie pope�nie jakiego� b��du to powinno by� w porz�dku. Kolonia rzadka wybacza b��dy. Wielu ju� si� o tym przekona�o.
    AI_Output (other, self ,"DIA_Perrick_HI_PERR_15_11"); //Zapewne.
    AI_Output (self, other ,"DIA_Perrick_HI_PERR_03_12"); //Wi�c radz� zacisn�� z�by i pokaza� jaja. Tylko to plus g�owa na karku dadz� ci godne miejsce pod barier�.
};










