//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Pascal_EXIT(C_INFO)
{
	npc             = SLD_40129_Pascal;
	nr              = 999;
	condition	= DIA_Pascal_EXIT_Condition;
	information	= DIA_Pascal_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Pascal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pascal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Pascal_HELLO1 (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_Pascal_HELLO1_Condition;
   information  = DIA_Pascal_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pascal_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Pascal_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_01"); //O idzie nowy kawa³ miêcha dla œcierwojadów!
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_02"); //Co proszê?
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_03"); //Bo na Orków to ty siê nie natkniesz... Za chudy jesteœ w uszach!
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_04"); //Kim jest ten zarozumia³y cz³owiek, który w¹tpi w moje umiejêtnoœci?
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_05"); //Jestem Pascal. Nale¿ê od niedawna do Najemników Lee. Wczeœniej trzyma³em z Laresem.
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_06"); //Zanim trafi³em do Kolonii by³em robotnikiem. Budowa³em domy miêdzy innymi w Silden I Geldern. Ale to stare dzieje...
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_07"); //Mi³o to wiedzieæ, ale chyba ju¿ pora na mnie!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Pascal_HELLO2 (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 2;
   condition    = DIA_Pascal_HELLO2_Condition;
   information  = DIA_Pascal_HELLO2_Info;
   permanent	= FALSE;
   important = TRUE;
};

FUNC INT DIA_Pascal_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Pascal_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_HELLO2_Info()
{
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_01"); //Stój!
    AI_Output (other, self ,"DIA_Pascal_HELLO2_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_03"); //Mo¿e przywaliæ ci w gêbê? Ale nie mam jeszcze powodu by to robiæ.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_04"); //Mo¿e jednak móg³bym ci zaoferowaæ coœ innego. Jest robótka.
    AI_Output (other, self ,"DIA_Pascal_HELLO2_15_05"); //Stare przyzwyczajenia cie nie opuœci³y. Pytanie czy chcê j¹ dla ciebie wykonywaæ.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_06"); //Dostaniesz sporo rudy i mo¿liwoœæ zyskania cennego doœwiadczenia.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_07"); //Ale powiedz noo... Zosta³eœ oficjalnie przyjêty do jakiejœ frakcji?
   
};

//========================================
//-----------------> PP_YES
//========================================

INSTANCE DIA_Pascal_PP_YES (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 4;
   condition    = DIA_Pascal_PP_YES_Condition;
   information  = DIA_Pascal_PP_YES_Info;
   permanent	= FALSE;
   description	= "Tak.";
};

FUNC INT DIA_Pascal_PP_YES_Condition()
{
	if (Npc_GetTrueGuild(hero) != GIL_NONE)
	&& (Npc_KnowsInfo(hero,DIA_Pascal_HELLO2))
	&& !(Npc_KnowsInfo(hero,DIA_Pascal_PP_NO))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_YES_Info()
{
    AI_Output (other, self ,"DIA_Pascal_PP_YES_15_01"); //Tak.
    AI_Output (self, other ,"DIA_Pascal_PP_YES_03_02"); //Widzê, ¿e ju¿ trochê za póŸno by zleciæ ci to zadanie. Pasuje mi tu œwie¿y goœæ jeszcze bez gildii synku!
    AI_Output (other, self ,"DIA_Pascal_PP_YES_15_03"); //To ju¿ twój problem. Na razie.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PP_NO
//========================================

INSTANCE DIA_Pascal_PP_NO (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 5;
   condition    = DIA_Pascal_PP_NO_Condition;
   information  = DIA_Pascal_PP_NO_Info;
   permanent	= FALSE;
   description	= "Nie.";
};

FUNC INT DIA_Pascal_PP_NO_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	&& (Npc_KnowsInfo(hero,DIA_Pascal_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_NO_Info()
{
    AI_Output (other, self ,"DIA_Pascal_PP_NO_15_01"); //Nie.
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_02"); //No I o to chodzi³o! To znaczy, ¿e nikt ciê jeszcze zbytnio nie kojarzy.
    AI_Output (other, self ,"DIA_Pascal_PP_NO_15_03"); //Czego ode mnie chcesz?
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_04"); //Dwóch facetów zaci¹gnê³o u mnie d³ug gdy by³em jeszcze Szkodnikiem.
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_05"); //Byli to Cieñ Pexton i Kopacz Garp.
    AI_Output (other, self ,"DIA_Pascal_PP_NO_15_06"); //No i co? Mam od nich odebraæ nale¿noœæ?
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_07"); //Czêœciowo. Bo ju¿ siê tym zaj¹³em. 
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_08"); //Uda³em siê na spotkanie z Pextonem, Mia³ mi zwróciæ swój d³ug. Ale ta menda doby³a ³uku I próbowa³a mnie ustrzeliæ gdy szed³em go powitaæ.
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_09"); //Trafi³ ale zbroja Najemnika mnie ocali³a. Akurat poprzedniego dnia do³¹czy³em do ludzi Lee.

};

//========================================
//-----------------> PP_WHAT_NEXT
//========================================

INSTANCE DIA_Pascal_PP_WHAT_NEXT (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 6;
   condition    = DIA_Pascal_PP_WHAT_NEXT_Condition;
   information  = DIA_Pascal_PP_WHAT_NEXT_Info;
   permanent	= FALSE;
   description	= "Co by³o dalej?";
};

FUNC INT DIA_Pascal_PP_WHAT_NEXT_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Pascal_PP_NO))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_WHAT_NEXT_Info()
{
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_01"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_02"); //Zabi³em gnidê. I odebra³em nale¿noœæ. W furii nieŸle pokiereszowa³em zw³oki I powa¿nie uszkodzi³em pancerz truposza.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_03"); //Nagle uzna³em jednak, ¿e cz³owiekowi z mojej gildii przyda siê strój goœcia z obozu rywala. Wiêc wzi¹³em ten uszkodzony strój.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_04"); //I gdy ju¿ mia³em odejœæ zauwa¿y³ mnie konwój Stra¿ników, który w³aœnie wyrusza³ z obozu. W ka¿dym razie z³apali za kuszê I musia³em wiaæ.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_05"); //Ale do rzeczy... To brudne kopaczysko siedzi teraz w Starej Kopalni. Ale po akcji z Pextonem nie mogê pojawiæ siê w Starym Obozie czy jego kopalni.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_06"); //I tu pojawia siê Twoja rola.
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_07"); //O ile wiem nie jest tak ³atwo wejœæ do Starej Kopalni. 
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_08"); //Wiem i dlatego mam dla ciebie inn¹ alternatywn¹ drogê by tam wejœæ. Zrobiæ robotê dla mnie I mo¿e coœ dla Laresa lub Lee przy okazji.
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_09"); //Tylko jak?
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_10"); //Przecie¿ mam zbrojê Cienia. Bardzo sfatygowan¹ ale zawsze.
};
//========================================
//-----------------> WHAT_LARES_PP
//========================================

INSTANCE DIA_Pascal_WHAT_LARES_PP (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_Pascal_WHAT_LARES_PP_Condition;
   information  = DIA_Pascal_WHAT_LARES_PP_Info;
   permanent	= FALSE;
   description	= "Co ma wspólnego Lares ze Star¹ Kopalni¹?";
};

FUNC INT DIA_Pascal_WHAT_LARES_PP_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Pascal_PP_WHAT_NEXT))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_WHAT_LARES_PP_Info()
{
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_01"); //Co ma wspólnego Lares ze Star¹ Kopalni¹?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_02"); //Ma tam ukryte interesy I bacznie j¹ obserwuje.
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_03"); //A Wolna Kopalnia?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_04"); //Ch³opcze czy ty nie wiesz, ¿e najbardziej cz³owieka krêci cudza ¿ona?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_05"); //Kopalnia Gomeza przynosi ogromne zyski I daje potêgê Magnatom.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_06"); //Lares chce coœ uszczkn¹æ dla siebie.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_07"); //A I jeszcze jedno...
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_08"); //Mamy w Starej Kopalni cz³owieka imieniem Calash.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_09"); //Jeœli chcesz zaimponowaæ Laresowi to on powinien ci pomóc.
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_10"); //To ciekawe. Byæ mo¿e z nim pomówiê gdy ju¿ dostanê siê do kopalni.
	B_LogEntry(PrawoPascala,"Pascal powiedzia³ ¿e jeœli chcê zaimponowaæ Laresowi to szkodnik Calash w Starej kopalni powinien mi pomóæ.");
};


//========================================
//-----------------> PP_GIVE_ARMOR
//========================================
var int Hero_PP_Str;
INSTANCE DIA_Pascal_PP_GIVE_ARMOR (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 7;
   condition    = DIA_Pascal_PP_GIVE_ARMOR_Condition;
   information  = DIA_Pascal_PP_GIVE_ARMOR_Info;
   permanent	= TRUE;
   description	= "Daj mi ten strój.";
};

FUNC INT DIA_Pascal_PP_GIVE_ARMOR_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Pascal_PP_WHAT_NEXT)) && (Hero_PP_Str != TRUE) &&  (Npc_GetTrueGuild(hero) == GIL_NONE)
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_GIVE_ARMOR_Info()
{
     AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_01"); //Daj mi ten strój.
     if (hero.attribute[ATR_STRENGTH] > 34) ||  (hero.attribute[ATR_DEXTERITY] > 34)
	 {
	
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_02"); //Masz.
	B_GiveInvItems (self,other, Armor_Stt_pp, 1);
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_03"); //Przecie¿ ten ³ach ledwo siê ze sob¹ trzyma.
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_04"); //Przecie¿ mówi³em, ¿e mocno wy¿y³em siê na niej za nim zrozumia³em, ¿e mo¿e mi siê przydaæ.
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_05"); //Czyli mam w tym nazwijmy to pancerzu wejœæ do kopalni I odebraæ twoj¹ nale¿noœæ. A co gdy ten Kopacz nie bêdzie mia³ rudy?
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_06"); //Zabij jak psa.
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_07"); //Chyba ju¿ wszystko wiesz. Za³ó¿ tê zbrojê I przedostañ siê gdzie trzeba. Po sprawie z Garpem wróæ do mnie.
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_08"); //Jasne.
	PP_Mission = LOG_MISSION;
    Pascal_OM = TRUE;
	Hero_PP_Str = TRUE;
	Log_CreateTopic		(PrawoPascala,	LOG_MISSION);
	Log_SetTopicStatus	(PrawoPascala,	LOG_RUNNING);
	B_LogEntry               (PrawoPascala,"Najemnik Pascal ma dla mnie zadanie. Z racji, ¿e nie mam jeszcze przynale¿noœci do jakiejkolwiek gildii mogê wykonaæ dla niego poufn¹ misjê polegaj¹c¹ g³ównie na wejœciu do Starej Kopalni. W œrodku mam odebraæ d³ug od Kopacza Garpa. Muszê za³o¿yæ uszkodzony pancerz Cienia otrzymany od Pascala (pozosta³oœæ po d³u¿niku imieniem Pexton, który próbowa³ wykiwaæ Najemnika) tak by Stra¿nicy wpuœcili mnie do œrodka. Wewn¹trz mogê te¿ wykonaæ inne zadania.");
    AI_StopProcessInfos	(self);
    }
    else
	{
	AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_09"); //Chyba oszala³eœ, najpierw trochê poæwicz bo nic z tego nie bêdzie...
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_10"); //Niech ci bêdzie.
	Hero_PP_Str = FALSE;
	PrintS_Ext("Wymagana si³a: 35", COL_RED);
	};
   
};

//========================================
//-----------------> PP_End
//========================================

INSTANCE DIA_Pascal_PP_End (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_Pascal_PP_End_Condition;
   information  = DIA_Pascal_PP_End_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ sakiewkê.";
};

FUNC INT DIA_Pascal_PP_End_Condition()
{
   if (Npc_HasItems (other, ItMi_PP_PascalOre) >=1)
   && (Npc_KnowsInfo(hero,DIA_Danny_PP_Sacke))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_End_Info()
{
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_01"); //Mam twoj¹ sakiewkê.
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_02"); //No to dawaj.
	B_GiveInvItems (other,self, ItMi_PP_PascalOre, 1);
	
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_03"); //Co do twojej nagrody, to gdzieœ j¹ zapodzia³em po pijaku. Ale spokojnie... znajdê. PrzyjdŸ do mnie jutro.
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_04"); //Niech ciê diabli! Widzimy siê jutro, i nie próbuj mnie wykiwaæ.
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_05"); //Hej, nie zapêdzasz siê trochê? Uspokój siê, dotrzymam s³owa.
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_06"); //To siê oka¿e...
	Npc_SetPermAttitude (Grd_216_Torwache, ATT_NEUTRAL);
	PP_Day = Wld_GetDay();
	B_LogEntry               (PrawoPascala,"Da³em Pascalowi odzyskan¹ rudê lecz ten rzekomo zapodzia³ gdzieœ nagrodê dla mnie po pijaku. Mam przyjœæ po ni¹ nastêpnego dnia.");
};

//========================================
//-----------------> PP_DAY_N
//========================================

INSTANCE DIA_Pascal_PP_DAY_N (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 2;
   condition    = DIA_Pascal_PP_DAY_N_Condition;
   information  = DIA_Pascal_PP_DAY_N_Info;
   permanent	= FALSE;
   description	= "I co z t¹ nagrod¹?";
};

FUNC INT DIA_Pascal_PP_DAY_N_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Pascal_PP_End))
	&& (PP_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_PP_DAY_N_Info()
{
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_01"); //I co z t¹ nagrod¹?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_02"); //Mam jak obieca³em. Trzymaj.
	B_GiveInvItems (self,other,ItMi_SilverInnosStatue,1);
	B_GiveInvItems (self,other,ItMi_GoldRing,2);
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_03"); //Ale mam coœ wiêcej.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_04"); //Co takiego?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_05"); //Nowe wiadomoœci. 
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_06"); //Garp doniós³ na Ciebie do Iana, ¿e bezprawnie wszed³eœ do Starej Kopalni I skopa³eœ mu ty³ek.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_07"); //Sk¹d o tym wiesz?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_08"); //Widzia³em siê z Joshem, by³ w obozie za³atwiæ kilka spraw.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_09"); //Cholera...
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_10"); //Ju¿ nikt nie wpuœci Ciê w tej zniszczonej zbroi do Starej Kopalni. Mo¿esz mi j¹ ju¿ zwróciæ. Ale nie pope³ni³eœ znowu a¿ takiego strasznego przestêpstwa... 
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_11"); //Dobrze wiedzieæ, weŸ j¹. Na razie.
	B_GiveInvItems (other,self, Armor_Stt_pp, 1);
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_12"); //Trzymaj siê m³okosie.
	GoToOM     = false;
	Pascal_OM  = false;
	B_GiveXP(250);
	B_LogEntry               (PrawoPascala,"Pascal wynagrodzi³ mnie za pomoc w odzyskaniu d³ugu, który mia³ u niego Garp. Niestety uszkodzona zbroja Cienia na nic mi siê ju¿ nie przyda. Stra¿nicy wiedz¹ ju¿ o moim podstêpie. Aby ponownie wejœæ do Starej Kopalni bêdê potrzebowa³ jakiegoœ wyraŸnego pretekstu.");
	Log_SetTopicStatus	     (PrawoPascala,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZM
//========================================

INSTANCE DIA_SLD_40129_Pascal_ZM (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_SLD_40129_Pascal_ZM_Condition;
   information  = DIA_SLD_40129_Pascal_ZM_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SLD_40129_Pascal_ZM_Condition()
{
 if (Kapitel == 5)
 && (Npc_KnowsInfo(hero,DIA_Alex_Ratunek))
 && (ZM_PASCAL == TRUE)
 && (Npc_GetTrueGuild(hero) == GIL_SLD)
{
    return TRUE;
};
};
FUNC VOID DIA_SLD_40129_Pascal_ZM_Info()
{
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_03_01"); //Hej. Wzywa ciê Lee. To ponoæ coœ wa¿nego.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_15_02"); //Ostatnio wszystkie sprawy s¹ wa¿ne.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_03_03"); //Tak czy siak idŸ do niego.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_15_04"); //W porz¹dku.
	Npc_ExchangeRoutine(NON_5611_Jonas,"NC");
	Npc_ExchangeRoutine(self,"Start");
	Log_CreateTopic		(ZagrozeniMysliwi,	LOG_MISSION);
	Log_SetTopicStatus	(ZagrozeniMysliwi,	LOG_RUNNING);
	B_LogEntry          (ZagrozeniMysliwi,"Pascal uprzedzi³ mnie, ¿e Lee ma do mnie jak¹œ sprawê. Muszê z nim o tym pomówiæ. ");
};

//========================================
//-----------------> ZM_WaitForMe
//========================================

INSTANCE DIA_SLD_40129_Pascal_ZM_WaitForMe (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_SLD_40129_Pascal_ZM_WaitForMe_Condition;
   information  = DIA_SLD_40129_Pascal_ZM_WaitForMe_Info;
   permanent	= FALSE;
   description	= "Ja tej wa¿nej sprawie przez, któr¹ wzywa³ mnie Lee.";
};

FUNC INT DIA_SLD_40129_Pascal_ZM_WaitForMe_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_ZM_YouHear))
{
    return TRUE;
};
};
FUNC VOID DIA_SLD_40129_Pascal_ZM_WaitForMe_Info()
{
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_01"); //Ja tej wa¿nej sprawie przez, któr¹ wzywa³ mnie Lee.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_03"); //W skrócie o to, ¿e myœliwi s¹ w niebezpieczeñstwie bo stra¿ zamierza napaœæ na ich obóz.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_04"); //Cholera...
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_05"); //Wyruszysz razem ze mn¹ i paroma innymi Najemnikami.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_06"); //Jasna sprawa. Zbierz resztê i ruszamy.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_07"); //Dobra. Czekaj na mnie przed bram¹ do obozu.
	Npc_ExchangeRoutine(SLD_40129_Pascal,"WaitZM");
    AI_StopProcessInfos	(self);
};

func void Hunters_attack()
{

    Npc_ExchangeRoutine(SLD_737_Torlof,   "ZMHuntersAttack");
	Npc_ExchangeRoutine(ORG_855_Wolf,     "ZMFollow");
	Npc_ExchangeRoutine(SLD_40129_Pascal, "ZMFollowToH");
 	Npc_ExchangeRoutine(NON_5611_Jonas,   "HuntersCamp");
	
	GRD_3934_Berg.guild = GIL_GOBBO;
	
	SLD_737_Torlof.Npctype                  = NPCTYPE_FRIEND;
    SLD_737_Torlof.aivar[AIV_PARTYMEMBER]   = TRUE;
    SLD_40129_Pascal.aivar[AIV_PARTYMEMBER] = TRUE;
    ORG_855_Wolf.aivar[AIV_PARTYMEMBER]     = TRUE;
    NON_5611_Jonas.aivar[AIV_PARTYMEMBER]   = TRUE;
	
	
	
	Wld_InsertNpc				(Grd_40116_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(Grd_40117_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(Grd_40118_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(Grd_40119_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(Grd_40120_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	Wld_InsertNpc				(Grd_40121_Gardist,"SPAWN_TALL_PATH_BANDITOS2");
	
};
//========================================
//-----------------> ZM_GoToHunters
//========================================

INSTANCE DIA_SLD_40129_Pascal_ZM_GoToHunters (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_SLD_40129_Pascal_ZM_GoToHunters_Condition;
   information  = DIA_SLD_40129_Pascal_ZM_GoToHunters_Info;
   permanent	= FALSE;
   description	= "W drogê.";
};

FUNC INT DIA_SLD_40129_Pascal_ZM_GoToHunters_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_SLD_40129_Pascal_ZM_WaitForMe))
    && (Npc_KnowsInfo(hero,DIA_Torlof_ZM_Camp)) 
    && (Npc_KnowsInfo(hero,DIA_Wolf_ZM_Guards))
{
    return TRUE;
};
};
FUNC VOID DIA_SLD_40129_Pascal_ZM_GoToHunters_Info()
{
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_GoToHunters_15_01"); //W drogê.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_GoToHunters_03_02"); //Mam nadziejê ¿e jeszcze nie zaatakowali myœliwych.
	B_LogEntry(ZagrozeniMysliwi,"Zebra³em ju¿ potrzebnych ludzi teraz wraz z Jonasem udamy siê do obozu myœliwych w wiadomym celu");
    Hunters_attack();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZM_WONGRDS
//========================================

INSTANCE DIA_SLD_40129_Pascal_ZM_WONGRDS (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_SLD_40129_Pascal_ZM_WONGRDS_Condition;
   information  = DIA_SLD_40129_Pascal_ZM_WONGRDS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SLD_40129_Pascal_ZM_WONGRDS_Condition()
{
 if (Npc_IsDead (GRD_40122_Gardist))
 && (Npc_IsDead (GRD_40123_Gardist))
 && (Npc_IsDead (GRD_40124_Gardist))
 && (Npc_IsDead (GRD_40125_Gardist))
 && (Npc_IsDead (STT_40126_Schatten))
 && (Npc_IsDead (GRD_40127_Dowodca))
 && (Npc_IsDead (STT_40128_Schatten))
 && (Npc_KnowsInfo(hero,DIA_Alex_ZM_GATT))
{
    return TRUE;
};
};
FUNC VOID DIA_SLD_40129_Pascal_ZM_WONGRDS_Info()
{
    AI_GotoNpc			(self, hero);
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_01"); //Daliœmy im nieŸle popaliæ. To powinno wybiæ z g³owy Gomezowi by drêczyæ myœliwych. 
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_02"); //Mam nadzieje, ¿e Alex nas wynagrodzi.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_15_03"); //Zapewne tak.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_04"); //Wracajmy do ich obozowiska.
	
	B_LogEntry               (ZagrozeniMysliwi,"Pokonaliœmy Stra¿ Gomeza po drugiej stronie rzeki, teraz pora by pogadaæ z Alexem.");
	
};


func void ZM_StartRoutines()
{

    SLD_737_Torlof.aivar[AIV_PARTYMEMBER]   = FALSE;
    SLD_40129_Pascal.aivar[AIV_PARTYMEMBER] = FALSE;
    ORG_855_Wolf.aivar[AIV_PARTYMEMBER]     = FALSE;
   
	Npc_ExchangeRoutine(SLD_737_Torlof,"Start");
	Npc_ExchangeRoutine(ORG_855_Wolf,"Start");
	
};

//========================================
//-----------------> ZM_TROPHY
//========================================

INSTANCE DIA_SLD_40129_Pascal_ZM_TROPHY (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_SLD_40129_Pascal_ZM_TROPHY_Condition;
   information  = DIA_SLD_40129_Pascal_ZM_TROPHY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_SLD_40129_Pascal_ZM_TROPHY_Condition()
{
    if (Npc_HasItems (other, ItMi_Throphy_PartyMembers) >=3)
	&& (Npc_KnowsInfo(hero,DIA_Alex_ZM_GARDISTS_DEAD))
{
    return TRUE;
};
};
FUNC VOID DIA_SLD_40129_Pascal_ZM_TROPHY_Info()
{
    AI_GotoNpc			(self, hero);
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_TROPHY_03_01"); //No i co?
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_TROPHY_15_02"); //To wasza czêœæ. WeŸ to i daj równie¿ Wilkowi i Torlofowi.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_TROPHY_03_03"); //Jasna sprawa.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_TROPHY_15_04"); //To by by³o na tyle.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_TROPHY_03_05"); //Widzimy siê w obozie.
	Npc_ExchangeRoutine(SLD_40129_Pascal,"Start");
	ZM_StartRoutines();
	B_GiveInvItems (other,self, ItMi_Throphy_PartyMembers, 3);

};

//========================================
//-----------------> HI_SLD
//========================================

INSTANCE DIA_Pascal_HI_SLD (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_Pascal_HI_SLD_Condition;
   information  = DIA_Pascal_HI_SLD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pascal_HI_SLD_Condition()
{
	if (Npc_GetTrueGuild(hero) == GIL_SLD)
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_HI_SLD_Info()
{
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_01"); //No ktoœ tu siê szybko pnie w górê!
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_02"); //Staram siê I s¹ efekty.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_03"); //Tylko nie staraj siê za bardzo bo siê spocisz haha Albo Lee zacznie siê baæ, ¿e roœnie mu konkurent poœród jego ludzi.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_04"); //Spokojnie. Znam swoje miejsce.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_05"); //To dobrze. Trzeba znaleŸæ odpowiedni balans miêdzy wychylaniem siê a siedzeniem cicho ¿ó³todziobie.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_06"); //Taka jest moja rada dla ciebie.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_07"); //Czasem ¿ycie samo ci¹gnie ciê dalej.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_08"); //Wierzysz w przeznaczenie? Bujda. Napijmy siê za twój awans. Masz tu piwko.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_09"); //Dziêki.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_10"); //Twoje zdrowie.
    AI_UseItem (self, ItFoBeer);
};

//========================================
//-----------------> WHO_YOU_ARE
//========================================

INSTANCE DIA_Pascal_WHO_YOU_ARE (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 2;
   condition    = DIA_Pascal_WHO_YOU_ARE_Condition;
   information  = DIA_Pascal_WHO_YOU_ARE_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Pascal_WHO_YOU_ARE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Pascal_WHO_YOU_ARE_Info()
{
    AI_Output (other, self ,"DIA_Pascal_WHO_YOU_ARE_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_02"); //Jak krew z nosa m³ody! 
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_03"); //Zawsze staram siê p³yn¹æ z pr¹dem by byæ na bie¿¹co w œwicie kolonii.
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_04"); //Masz do mnie jakiœ biznes? Bo nie lubiê gadaæ po pró¿nicy.
    AI_Output (other, self ,"DIA_Pascal_WHO_YOU_ARE_15_05"); //Czy¿by? Wygl¹dasz na goœcia, który sporo mówi. 
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_06"); //Taaa... Chyba nie masz nic konkretnego co?
};

//========================================
//-----------------> FritzIsDead
//========================================

INSTANCE DIA_Pascal_FritzIsDead (C_INFO)
{
   npc          = SLD_40129_Pascal;
   nr           = 1;
   condition    = DIA_Pascal_FritzIsDead_Condition;
   information  = DIA_Pascal_FritzIsDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pascal_FritzIsDead_Condition()
{
  if (Npc_IsDead (SLD_40064_Fritz))
{
    return TRUE;
};
};
FUNC VOID DIA_Pascal_FritzIsDead_Info()
{
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_01"); //Cholera! Fritz nie ¿yje, mam nadzieje ¿e jest teraz w lepszym œwiecie.
    AI_Output (other, self ,"DIA_Pascal_FritzIsDead_15_02"); //Jak to siê sta³o? 
	if (Fritz_D_pas == TRUE)
	{
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_03"); //Masz czelnoœæ jeszcze zadawaæ tak g³upie pytania? Dobrze wiesz ¿e Fritz by³ chory.
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_04"); //Zaufa³ ci a ty mu nie pomog³eœ, powinienem cie teraz posiekaæ na kawa³ki, ale oszczêdzê sobie broni. 
	}
	else
	{
	 AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_05"); //Nie wiem znalaz³em go martwego, prawdopodobnie ktoœ go zabi³, niech ja siê tylko dowiem co to za sukinsyn.
	};
};

instance dia_pascal_pickpocket(c_info) {
    npc = sld_40129_pascal;
    nr = 900;
    condition = dia_pascal_pickpocket_condition;
    information = dia_pascal_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pascal_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_pascal_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pascal_pickpocket);
	info_addchoice(dia_pascal_pickpocket, dialog_back, dia_pascal_pickpocket_back);
	info_addchoice(dia_pascal_pickpocket, dialog_pickpocket, dia_pascal_pickpocket_doit);
};

func void dia_pascal_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_pascal_pickpocket);
};

func void dia_pascal_pickpocket_back() {
    info_clearchoices(dia_pascal_pickpocket);
};