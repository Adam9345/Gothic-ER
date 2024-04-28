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
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_01"); //O idzie nowy kawa� mi�cha dla �cierwojad�w!
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_02"); //Co prosz�?
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_03"); //Bo na Ork�w to ty si� nie natkniesz... Za chudy jeste� w uszach!
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_04"); //Kim jest ten zarozumia�y cz�owiek, kt�ry w�tpi w moje umiej�tno�ci?
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_05"); //Jestem Pascal. Nale�� od niedawna do Najemnik�w Lee. Wcze�niej trzyma�em z Laresem.
    AI_Output (self, other ,"DIA_Pascal_HELLO1_03_06"); //Zanim trafi�em do Kolonii by�em robotnikiem. Budowa�em domy mi�dzy innymi w Silden I Geldern. Ale to stare dzieje...
    AI_Output (other, self ,"DIA_Pascal_HELLO1_15_07"); //Mi�o to wiedzie�, ale chyba ju� pora na mnie!
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
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_01"); //St�j!
    AI_Output (other, self ,"DIA_Pascal_HELLO2_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_03"); //Mo�e przywali� ci w g�b�? Ale nie mam jeszcze powodu by to robi�.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_04"); //Mo�e jednak m�g�bym ci zaoferowa� co� innego. Jest rob�tka.
    AI_Output (other, self ,"DIA_Pascal_HELLO2_15_05"); //Stare przyzwyczajenia cie nie opu�ci�y. Pytanie czy chc� j� dla ciebie wykonywa�.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_06"); //Dostaniesz sporo rudy i mo�liwo�� zyskania cennego do�wiadczenia.
    AI_Output (self, other ,"DIA_Pascal_HELLO2_03_07"); //Ale powiedz noo... Zosta�e� oficjalnie przyj�ty do jakiej� frakcji?
   
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
    AI_Output (self, other ,"DIA_Pascal_PP_YES_03_02"); //Widz�, �e ju� troch� za p�no by zleci� ci to zadanie. Pasuje mi tu �wie�y go�� jeszcze bez gildii synku!
    AI_Output (other, self ,"DIA_Pascal_PP_YES_15_03"); //To ju� tw�j problem. Na razie.
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
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_02"); //No I o to chodzi�o! To znaczy, �e nikt ci� jeszcze zbytnio nie kojarzy.
    AI_Output (other, self ,"DIA_Pascal_PP_NO_15_03"); //Czego ode mnie chcesz?
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_04"); //Dw�ch facet�w zaci�gn�o u mnie d�ug gdy by�em jeszcze Szkodnikiem.
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_05"); //Byli to Cie� Pexton i Kopacz Garp.
    AI_Output (other, self ,"DIA_Pascal_PP_NO_15_06"); //No i co? Mam od nich odebra� nale�no��?
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_07"); //Cz�ciowo. Bo ju� si� tym zaj��em. 
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_08"); //Uda�em si� na spotkanie z Pextonem, Mia� mi zwr�ci� sw�j d�ug. Ale ta menda doby�a �uku I pr�bowa�a mnie ustrzeli� gdy szed�em go powita�.
    AI_Output (self, other ,"DIA_Pascal_PP_NO_03_09"); //Trafi� ale zbroja Najemnika mnie ocali�a. Akurat poprzedniego dnia do��czy�em do ludzi Lee.

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
   description	= "Co by�o dalej?";
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
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_01"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_02"); //Zabi�em gnid�. I odebra�em nale�no��. W furii nie�le pokiereszowa�em zw�oki I powa�nie uszkodzi�em pancerz truposza.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_03"); //Nagle uzna�em jednak, �e cz�owiekowi z mojej gildii przyda si� str�j go�cia z obozu rywala. Wi�c wzi��em ten uszkodzony str�j.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_04"); //I gdy ju� mia�em odej�� zauwa�y� mnie konw�j Stra�nik�w, kt�ry w�a�nie wyrusza� z obozu. W ka�dym razie z�apali za kusz� I musia�em wia�.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_05"); //Ale do rzeczy... To brudne kopaczysko siedzi teraz w Starej Kopalni. Ale po akcji z Pextonem nie mog� pojawi� si� w Starym Obozie czy jego kopalni.
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_06"); //I tu pojawia si� Twoja rola.
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_07"); //O ile wiem nie jest tak �atwo wej�� do Starej Kopalni. 
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_08"); //Wiem i dlatego mam dla ciebie inn� alternatywn� drog� by tam wej��. Zrobi� robot� dla mnie I mo�e co� dla Laresa lub Lee przy okazji.
    AI_Output (other, self ,"DIA_Pascal_PP_WHAT_NEXT_15_09"); //Tylko jak?
    AI_Output (self, other ,"DIA_Pascal_PP_WHAT_NEXT_03_10"); //Przecie� mam zbroj� Cienia. Bardzo sfatygowan� ale zawsze.
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
   description	= "Co ma wsp�lnego Lares ze Star� Kopalni�?";
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
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_01"); //Co ma wsp�lnego Lares ze Star� Kopalni�?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_02"); //Ma tam ukryte interesy I bacznie j� obserwuje.
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_03"); //A Wolna Kopalnia?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_04"); //Ch�opcze czy ty nie wiesz, �e najbardziej cz�owieka kr�ci cudza �ona?
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_05"); //Kopalnia Gomeza przynosi ogromne zyski I daje pot�g� Magnatom.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_06"); //Lares chce co� uszczkn�� dla siebie.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_07"); //A I jeszcze jedno...
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_08"); //Mamy w Starej Kopalni cz�owieka imieniem Calash.
    AI_Output (self, other ,"DIA_Pascal_WHAT_LARES_PP_03_09"); //Je�li chcesz zaimponowa� Laresowi to on powinien ci pom�c.
    AI_Output (other, self ,"DIA_Pascal_WHAT_LARES_PP_15_10"); //To ciekawe. By� mo�e z nim pom�wi� gdy ju� dostan� si� do kopalni.
	B_LogEntry(PrawoPascala,"Pascal powiedzia� �e je�li chc� zaimponowa� Laresowi to szkodnik Calash w Starej kopalni powinien mi pom��.");
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
   description	= "Daj mi ten str�j.";
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
     AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_01"); //Daj mi ten str�j.
     if (hero.attribute[ATR_STRENGTH] > 34) ||  (hero.attribute[ATR_DEXTERITY] > 34)
	 {
	
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_02"); //Masz.
	B_GiveInvItems (self,other, Armor_Stt_pp, 1);
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_03"); //Przecie� ten �ach ledwo si� ze sob� trzyma.
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_04"); //Przecie� m�wi�em, �e mocno wy�y�em si� na niej za nim zrozumia�em, �e mo�e mi si� przyda�.
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_05"); //Czyli mam w tym nazwijmy to pancerzu wej�� do kopalni I odebra� twoj� nale�no��. A co gdy ten Kopacz nie b�dzie mia� rudy?
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_06"); //Zabij jak psa.
    AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_07"); //Chyba ju� wszystko wiesz. Za�� t� zbroj� I przedosta� si� gdzie trzeba. Po sprawie z Garpem wr�� do mnie.
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_08"); //Jasne.
	PP_Mission = LOG_MISSION;
    Pascal_OM = TRUE;
	Hero_PP_Str = TRUE;
	Log_CreateTopic		(PrawoPascala,	LOG_MISSION);
	Log_SetTopicStatus	(PrawoPascala,	LOG_RUNNING);
	B_LogEntry               (PrawoPascala,"Najemnik Pascal ma dla mnie zadanie. Z racji, �e nie mam jeszcze przynale�no�ci do jakiejkolwiek gildii mog� wykona� dla niego poufn� misj� polegaj�c� g��wnie na wej�ciu do Starej Kopalni. W �rodku mam odebra� d�ug od Kopacza Garpa. Musz� za�o�y� uszkodzony pancerz Cienia otrzymany od Pascala (pozosta�o�� po d�u�niku imieniem Pexton, kt�ry pr�bowa� wykiwa� Najemnika) tak by Stra�nicy wpu�cili mnie do �rodka. Wewn�trz mog� te� wykona� inne zadania.");
    AI_StopProcessInfos	(self);
    }
    else
	{
	AI_Output (self, other ,"DIA_Pascal_PP_GIVE_ARMOR_03_09"); //Chyba oszala�e�, najpierw troch� po�wicz bo nic z tego nie b�dzie...
    AI_Output (other, self ,"DIA_Pascal_PP_GIVE_ARMOR_15_10"); //Niech ci b�dzie.
	Hero_PP_Str = FALSE;
	PrintS_Ext("Wymagana si�a: 35", COL_RED);
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
   description	= "Mam twoj� sakiewk�.";
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
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_01"); //Mam twoj� sakiewk�.
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_02"); //No to dawaj.
	B_GiveInvItems (other,self, ItMi_PP_PascalOre, 1);
	
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_03"); //Co do twojej nagrody, to gdzie� j� zapodzia�em po pijaku. Ale spokojnie... znajd�. Przyjd� do mnie jutro.
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_04"); //Niech ci� diabli! Widzimy si� jutro, i nie pr�buj mnie wykiwa�.
    AI_Output (self, other ,"DIA_Pascal_PP_End_03_05"); //Hej, nie zap�dzasz si� troch�? Uspok�j si�, dotrzymam s�owa.
    AI_Output (other, self ,"DIA_Pascal_PP_End_15_06"); //To si� oka�e...
	Npc_SetPermAttitude (Grd_216_Torwache, ATT_NEUTRAL);
	PP_Day = Wld_GetDay();
	B_LogEntry               (PrawoPascala,"Da�em Pascalowi odzyskan� rud� lecz ten rzekomo zapodzia� gdzie� nagrod� dla mnie po pijaku. Mam przyj�� po ni� nast�pnego dnia.");
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
   description	= "I co z t� nagrod�?";
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
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_01"); //I co z t� nagrod�?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_02"); //Mam jak obieca�em. Trzymaj.
	B_GiveInvItems (self,other,ItMi_SilverInnosStatue,1);
	B_GiveInvItems (self,other,ItMi_GoldRing,2);
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_03"); //Ale mam co� wi�cej.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_04"); //Co takiego?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_05"); //Nowe wiadomo�ci. 
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_06"); //Garp doni�s� na Ciebie do Iana, �e bezprawnie wszed�e� do Starej Kopalni I skopa�e� mu ty�ek.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_07"); //Sk�d o tym wiesz?
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_08"); //Widzia�em si� z Joshem, by� w obozie za�atwi� kilka spraw.
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_09"); //Cholera...
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_10"); //Ju� nikt nie wpu�ci Ci� w tej zniszczonej zbroi do Starej Kopalni. Mo�esz mi j� ju� zwr�ci�. Ale nie pope�ni�e� znowu a� takiego strasznego przest�pstwa... 
    AI_Output (other, self ,"DIA_Pascal_PP_DAY_N_15_11"); //Dobrze wiedzie�, we� j�. Na razie.
	B_GiveInvItems (other,self, Armor_Stt_pp, 1);
    AI_Output (self, other ,"DIA_Pascal_PP_DAY_N_03_12"); //Trzymaj si� m�okosie.
	GoToOM     = false;
	Pascal_OM  = false;
	B_GiveXP(250);
	B_LogEntry               (PrawoPascala,"Pascal wynagrodzi� mnie za pomoc w odzyskaniu d�ugu, kt�ry mia� u niego Garp. Niestety uszkodzona zbroja Cienia na nic mi si� ju� nie przyda. Stra�nicy wiedz� ju� o moim podst�pie. Aby ponownie wej�� do Starej Kopalni b�d� potrzebowa� jakiego� wyra�nego pretekstu.");
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
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_03_01"); //Hej. Wzywa ci� Lee. To pono� co� wa�nego.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_15_02"); //Ostatnio wszystkie sprawy s� wa�ne.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_03_03"); //Tak czy siak id� do niego.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_15_04"); //W porz�dku.
	Npc_ExchangeRoutine(NON_5611_Jonas,"NC");
	Npc_ExchangeRoutine(self,"Start");
	Log_CreateTopic		(ZagrozeniMysliwi,	LOG_MISSION);
	Log_SetTopicStatus	(ZagrozeniMysliwi,	LOG_RUNNING);
	B_LogEntry          (ZagrozeniMysliwi,"Pascal uprzedzi� mnie, �e Lee ma do mnie jak�� spraw�. Musz� z nim o tym pom�wi�. ");
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
   description	= "Ja tej wa�nej sprawie przez, kt�r� wzywa� mnie Lee.";
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
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_01"); //Ja tej wa�nej sprawie przez, kt�r� wzywa� mnie Lee.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_03"); //W skr�cie o to, �e my�liwi s� w niebezpiecze�stwie bo stra� zamierza napa�� na ich ob�z.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_04"); //Cholera...
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_05"); //Wyruszysz razem ze mn� i paroma innymi Najemnikami.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_03_06"); //Jasna sprawa. Zbierz reszt� i ruszamy.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WaitForMe_15_07"); //Dobra. Czekaj na mnie przed bram� do obozu.
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
   description	= "W drog�.";
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
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_GoToHunters_15_01"); //W drog�.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_GoToHunters_03_02"); //Mam nadziej� �e jeszcze nie zaatakowali my�liwych.
	B_LogEntry(ZagrozeniMysliwi,"Zebra�em ju� potrzebnych ludzi teraz wraz z Jonasem udamy si� do obozu my�liwych w wiadomym celu");
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
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_01"); //Dali�my im nie�le popali�. To powinno wybi� z g�owy Gomezowi by dr�czy� my�liwych. 
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_02"); //Mam nadzieje, �e Alex nas wynagrodzi.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_15_03"); //Zapewne tak.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_WONGRDS_03_04"); //Wracajmy do ich obozowiska.
	
	B_LogEntry               (ZagrozeniMysliwi,"Pokonali�my Stra� Gomeza po drugiej stronie rzeki, teraz pora by pogada� z Alexem.");
	
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
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_TROPHY_15_02"); //To wasza cz��. We� to i daj r�wnie� Wilkowi i Torlofowi.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_TROPHY_03_03"); //Jasna sprawa.
    AI_Output (other, self ,"DIA_SLD_40129_Pascal_ZM_TROPHY_15_04"); //To by by�o na tyle.
    AI_Output (self, other ,"DIA_SLD_40129_Pascal_ZM_TROPHY_03_05"); //Widzimy si� w obozie.
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
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_01"); //No kto� tu si� szybko pnie w g�r�!
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_02"); //Staram si� I s� efekty.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_03"); //Tylko nie staraj si� za bardzo bo si� spocisz haha Albo Lee zacznie si� ba�, �e ro�nie mu konkurent po�r�d jego ludzi.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_04"); //Spokojnie. Znam swoje miejsce.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_05"); //To dobrze. Trzeba znale�� odpowiedni balans mi�dzy wychylaniem si� a siedzeniem cicho ��todziobie.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_06"); //Taka jest moja rada dla ciebie.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_07"); //Czasem �ycie samo ci�gnie ci� dalej.
    AI_Output (self, other ,"DIA_Pascal_HI_SLD_03_08"); //Wierzysz w przeznaczenie? Bujda. Napijmy si� za tw�j awans. Masz tu piwko.
    AI_Output (other, self ,"DIA_Pascal_HI_SLD_15_09"); //Dzi�ki.
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
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_02"); //Jak krew z nosa m�ody! 
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_03"); //Zawsze staram si� p�yn�� z pr�dem by by� na bie��co w �wicie kolonii.
    AI_Output (self, other ,"DIA_Pascal_WHO_YOU_ARE_03_04"); //Masz do mnie jaki� biznes? Bo nie lubi� gada� po pr�nicy.
    AI_Output (other, self ,"DIA_Pascal_WHO_YOU_ARE_15_05"); //Czy�by? Wygl�dasz na go�cia, kt�ry sporo m�wi. 
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
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_01"); //Cholera! Fritz nie �yje, mam nadzieje �e jest teraz w lepszym �wiecie.
    AI_Output (other, self ,"DIA_Pascal_FritzIsDead_15_02"); //Jak to si� sta�o? 
	if (Fritz_D_pas == TRUE)
	{
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_03"); //Masz czelno�� jeszcze zadawa� tak g�upie pytania? Dobrze wiesz �e Fritz by� chory.
    AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_04"); //Zaufa� ci a ty mu nie pomog�e�, powinienem cie teraz posieka� na kawa�ki, ale oszcz�dz� sobie broni. 
	}
	else
	{
	 AI_Output (self, other ,"DIA_Pascal_FritzIsDead_03_05"); //Nie wiem znalaz�em go martwego, prawdopodobnie kto� go zabi�, niech ja si� tylko dowiem co to za sukinsyn.
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