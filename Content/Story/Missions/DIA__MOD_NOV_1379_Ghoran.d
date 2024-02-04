//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ghoran_EXIT(C_INFO)
{
	npc             = NOV_1379_Ghoran;
	nr              = 999;
	condition		= DIA_Ghoran_EXIT_Condition;
	information		= DIA_Ghoran_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ghoran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ghoran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou2
//========================================

INSTANCE DIA_Ghoran_WhoYou2 (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_WhoYou2_Condition;
   information  = DIA_Ghoran_WhoYou2_Info;
   permanent	= FALSE;
   description	= "Widz�, �e robicie wino.";
};

FUNC INT DIA_Ghoran_WhoYou2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ghoran_WhoYou2_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_01"); //Widz�, �e robicie wino.
    AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_02"); //Dobrze widzisz. Ja i ci Nowicjusze zajmujemy si� upraw� winogron i produkcj� wina. 
	AI_Output (other, self ,"DIA_Ghoran_WhoYou2_15_03"); //Zajmujesz si� te� handlem? 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_04"); //W sensie, czy sprzedaj� wino? Oczywi�cie! Ca�kiem sporo Nowicjuszy si� u mnie zaopatruje. No i oczywi�cie Gor Boba. 
	AI_Output (self, other ,"DIA_Ghoran_WhoYou2_03_05"); //Najlepszy margunios robiony w Kolonii Karnej tylko u mnie, rzecz jasna mo�esz te� kupi� owoce. Zawsze mamy jaki� zapas na produkcj� wina. 

	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);//fix
	B_LogEntry		(GE_TraderPSI,	"U Ghorana kupi� wino i owoce. Handluje w okolicach placu �wi�tynnego. Trudno go przeoczy�.");
};

//========================================
//-----------------> Handel
//========================================

INSTANCE DIA_Ghoran_Handel (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 3;
   condition    = DIA_Ghoran_Handel_Condition;
   information  = DIA_Ghoran_Handel_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� co� kupi�.";
};

FUNC INT DIA_Ghoran_Handel_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Handel_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Handel_15_01"); //Chc� co� kupi�.
    AI_Output (self, other ,"DIA_Ghoran_Handel_03_02"); //Wybieraj.
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> AboutYou
//========================================

INSTANCE DIA_Ghoran_AboutYou (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AboutYou_Condition;
   information  = DIA_Ghoran_AboutYou_Info;
   permanent	= FALSE;
   description	= "Jak trafi�e� do Kolonii Karnej?";
};

FUNC INT DIA_Ghoran_AboutYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_AboutYou_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_01"); //Jak trafi�e� do Kolonii Karnej? 
    AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_02"); //To proste. By�em ch�opem przypisanym do ziemi, kt�ra od pokole� nale�a�a do szlachcica Zandora i jego rodziny. Gdy zbieg�em z jego maj�tku, rozes�a� za mn� list go�czy. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_03"); //Gdy stra�nicy kr�lewscy mnie schwytali, zosta�em wys�any do Kolonii Karnej. 
	AI_Output (other, self ,"DIA_Ghoran_AboutYou_15_04"); //Przecie� Zandor na tym nic nie zyska�. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_05"); //Nie znasz kr�lewskiego prawa? Pojmanego zbiega mo�na albo odes�a� do miejsca jego przypisania, albo w zamian za kilka z�otych monet zrzec si� do niego praw. 
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_06"); //W tym drugim przypadku, zbieg nie jest ju� traktowany jako podleg�y panu, lecz jako przest�pca, wi�c zostaje zes�any tutaj.
	AI_Output (self, other ,"DIA_Ghoran_AboutYou_03_07"); //Widocznie moja praca by�a dla niego mniej warta ni� kilka z�otych monet. 
};

//========================================
//-----------------> Plants
//========================================

INSTANCE DIA_Ghoran_Plants (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Plants_Condition;
   information  = DIA_Ghoran_Plants_Info;
   permanent	= FALSE;
   description	= "Sk�d pozyskujecie winogrona?";
};

FUNC INT DIA_Ghoran_Plants_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Plants_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Plants_15_01"); //Sk�d pozyskujecie winogrona?
    AI_Output (self, other ,"DIA_Ghoran_Plants_03_02"); //Rozejrzyj si�. 
	AI_PlayAni (hero, "T_SEARCH");
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_03"); //Widzisz te zielone pn�cza? No w�a�nie. Kilka lat temu uda�o nam si� sprowadzi� kilka sadzonek. Wi�kszo�� z nich si� przyj�a i chwali� los, dot�d wspaniale owocuj�. 
	AI_Output (other, self ,"DIA_Ghoran_Plants_15_04"); //Przyznasz chyba, �e to do�� nowatorski pomys�, by zak�ada� winnic� na bagnie i to jeszcze w Kolonii Karnej. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_05"); //Fakt, pocz�tkowo wi�kszo�� moich wsp�braci by�a do�� sceptyczna co do pomys�u, by rozpocz�� na bagnach produkcj� wina. 
	AI_Output (self, other ,"DIA_Ghoran_Plants_03_06"); //Nawet m�j kompan, Severio nie dowierza� w to, �e to mo�e si� uda�. A tu prosz� - wszystko wysz�o nawet lepiej, ni� sam si� spodziewa�em.	
};

//========================================
//-----------------> Margunios
//========================================

INSTANCE DIA_Ghoran_Margunios (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_Margunios_Condition;
   information  = DIA_Ghoran_Margunios_Info;
   permanent	= FALSE;
   description	= "Co to jest margunios?";
};

FUNC INT DIA_Ghoran_Margunios_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ghoran_WhoYou2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_Margunios_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_Margunios_15_01"); //Co to jest margunios?
    AI_Output (self, other ,"DIA_Ghoran_Margunios_03_02"); //Nie wiesz, co to jest margunios? To jest bia�e wino z okolic Ardei i Cape Dun. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_03"); //Dawniej jego produkcja znajdowa�a si� w r�kach rodu Margunios, ale gdy r�d zubo�a�, to odsprzeda� swe winnice radzie wioski Ardei. 
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_04"); //Niegdy� rywalizowa�o z winem vengardzkim o arystokratyczne sto�y, ale teraz obni�y�o nieco swe loty i jako trunek kr�luje w domach kupc�w oraz drobnego rycerstwa. 
	AI_Output (other, self ,"DIA_Ghoran_Margunios_15_05"); //A ty je teraz tu produkujesz!?
	AI_Output (self, other ,"DIA_Ghoran_Margunios_03_06"); //Tak, ale jego obozow� wersj� na miar� miejsca i warunk�w. 
};



////////////////////////////////////////////
// ZADANIE Z POSZUKIWANIEM WSP�LNIKA
////////////////////////////////////////////

//========================================
//-----------------> VineQuest
//========================================

INSTANCE DIA_Ghoran_VineQuest (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_VineQuest_Condition;
   information  = DIA_Ghoran_VineQuest_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ghoran_VineQuest_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_VineQuest_Info()
{
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_01"); //Bracie, zaczekaj, zaczekaj!
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_03"); //Nowicjusze m�wi�, �e do�� cz�sto opuszczasz Ob�z, wi�c pewnie spotykasz troch� ludzi na swojej drodze. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_04"); //Ca�kiem mo�liwe...
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_05"); //No widzisz. Jest sprawa... i troch� nie wiem od czego zacz��. 
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_06"); //Najlepiej zacznij od pocz�tku.
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_07"); //Od pocz�tku, to by za d�ugo si� zesz�o. Powiem wi�c wprost. Wi�kszo�� moich klient�w to Nowicjusze, je�eli nie liczy� poczciwego Gor Boby. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_08"); //Reszta Stra�nik�w woli kupi� wino pochodz�ce z handlu ze Starym Obozem, czyli importowane ze �wiata Zewn�trznego.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_09"); //Wi�c mo�e spr�buj produkowa� lepsze wino?
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_10"); //Gdyby to wszystko by�o takie proste. To co wiem o produkcji wina... Tego nauczy�em si� w Kolonii od Severio, a i tak m�j przyjaciel zdo�a� mi przekaza� jedynie cz�stk� swojej wiedzy. 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_11"); //Potrzebuj� wi�c kogo�, kto si� dobrze na tym zna.
    AI_Output (other, self ,"DIA_Ghoran_VineQuest_15_12"); //Czyli mam ci znale�� w Kolonii wsp�lnika? 
    AI_Output (self, other ,"DIA_Ghoran_VineQuest_03_13"); //Dok�adnie. I jakby� m�g�, to nie rozpowiadaj w Bractwie o moich poszukiwaniach. Nie chc� by moi wsp�bracia poczuli si� ura�eni. 
	
	MIS_GhoransVine = LOG_RUNNING;
		
    Log_CreateTopic		(CH1_GhoransVine, LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_RUNNING);
	B_LogEntry					(CH1_GhoransVine, "Nowicjusz Ghoran wyrabiaj�cy w Bractwie wino potrzebuje kogo�, kto zna si� lepiej od niego na produkcji. Powinienem popyta� o to kogo� obeznanego. By� mo�e karczmarz ze Starego Obozu b�dzie co� wiedzia�.");
};

//========================================
//-----------------> AbelIsWorker
//========================================

INSTANCE DIA_Ghoran_AbelIsWorker (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_AbelIsWorker_Condition;
   information  = DIA_Ghoran_AbelIsWorker_Info;
   permanent	= FALSE;
   description	= "W Obozie zjawi� si� ju� Abel?";
};

FUNC INT DIA_Ghoran_AbelIsWorker_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Abel_Win))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ghoran_AbelIsWorker_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_01"); //W Obozie zjawi� si� ju� Abel?
    AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_02"); //Tak. Jestem ci naprawd� wdzi�czny. Ten go�� naprawd� ma poj�cie o winie. My�l�, �e b�dzie nam si� dobrze pracowa�.
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_03"); //Da�em mu troch� czasu na wytchnienie i zapoznanie si� z Obozem. Sk�d�e ty� go wzi��? Nerwowy jakby uciek� z kr�lewskiego wi�zienia.
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_04"); //To d�uga historia. Mo�e sam ci kiedy� opowie...
	AI_Output (self, other ,"DIA_Ghoran_AbelIsWorker_03_05"); //Mam nadziej�. Od�o�y�em dla ciebie troch� rudy ze sprzeda�y wina. My�l�, �e to wystarczy na pokrycie koszt�w. 
	AI_Output (other, self ,"DIA_Ghoran_AbelIsWorker_15_06"); //Miliony to to nie s�, ale zadowol� si�.
	
	CreateInvItems (self, itminugget,100);
    B_GiveInvItems (self, hero, itminugget, 100);
	
	MIS_GhoransVine = LOG_SUCCESS;
		
	Log_SetTopicStatus	(CH1_GhoransVine, LOG_SUCCESS);
	B_LogEntry			(CH1_GhoransVine, "Ghoran wynagrodzi� mnie za sprowadzenie mu pomocnika. My�l�, �e dogadaj� si� razem z Ablem.");
	
	B_GiveXP (220);
	
    AI_StopProcessInfos	(self);
	
	B_ChangeGuild    (VLK_7003_Abel,GIL_NOV);  
	B_SetPermAttitude	(VLK_7003_Abel,	ATT_FRIENDLY);
};


//========================================
//-----------------> BG_STEAL
//========================================

INSTANCE DIA_Ghoran_BG_STEAL (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_BG_STEAL_Condition;
   information  = DIA_Ghoran_BG_STEAL_Info;
   permanent	= FALSE;
   description	= "Przychodzimy ci pom�c w sprawie kradzie�y.";
};

FUNC INT DIA_Ghoran_BG_STEAL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Templer_BG_Ghoran))
{
    return TRUE;
};
};
FUNC VOID DIA_Ghoran_BG_STEAL_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_BG_STEAL_15_01"); //Przychodzimy ci pom�c w sprawie kradzie�y.
    AI_Output (self, other ,"DIA_Ghoran_BG_STEAL_03_02"); //Eehhh...
    AI_Output (other, self ,"DIA_Ghoran_BG_STEAL_15_03"); //Wi�cej wiary. Wszystko da si� jeszcze naprawi�.
    AI_Output (self, other ,"DIA_Ghoran_BG_STEAL_03_04"); //Tylko jak?
  
    Info_ClearChoices	(DIA_Ghoran_BG_STEAL);
    Info_AddChoice		(DIA_Ghoran_BG_STEAL, "Trzeba namierzy� z�odzieja.", DIA_Ghoran_BG_STEAL_BG_HOW);
};

FUNC VOID DIA_Ghoran_BG_STEAL_BG_HOW()
{
    AI_Output (self, other ,"DIA_Ghoran_BG_STEAL_BG_HOW_03_01"); //Gdyby to by�o takie proste. W�tpie by ktokolwiek wytatu�owa� sobie na czole napis ,,Z�odziej�...
    AI_Output (other, self ,"DIA_Ghoran_BG_STEAL_BG_HOW_15_02"); //S�ysza�em, �e tw�j pazerny przyjaciel nie stroni od na�og�w. O co chodzi?
    AI_Output (self, other ,"DIA_Ghoran_BG_STEAL_BG_HOW_03_03"); //Tak. Gor Na Pol odkry�, �e po ka�dym ataku w pobli�u znajduj� si� ma�e ka�u�y jakiego� mocnego alkoholu. 
    AI_Output (self, other ,"DIA_Ghoran_BG_STEAL_BG_HOW_03_04"); //Ostatniej nocy r�wnie� by� atak. Proponuje by�cie si� rozejrzeli wok� mojego stanowiska handlowego.
    AI_Output (other, self ,"DIA_Ghoran_BG_STEAL_BG_HOW_15_05"); //Niech b�dzie.
	Wld_InsertItem			(ItMi_Cloth_BG,"FP_ITEM_BG_CLOTH");
	B_LogEntry               (BagienneGolemy,"Ghoran jest za�amany. Poleci� mi jednak przeszuka� teren wok� jego stoiska. Musz� tam pow�szy�");
};

//========================================
//-----------------> BG_GHOGET
//========================================

INSTANCE DIA_Ghoran_BG_GHOGET (C_INFO)
{
   npc          = NOV_1379_Ghoran;
   nr           = 1;
   condition    = DIA_Ghoran_BG_GHOGET_Condition;
   information  = DIA_Ghoran_BG_GHOGET_Info;
   permanent	= FALSE;
   description	= "Mam twoje skradzione towary.";
};

FUNC INT DIA_Ghoran_BG_GHOGET_Condition()
{
    if (Npc_HasItems (other, ItMi_Items_BG) >=5)
	&& (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_IHAVEIT))
{
    return TRUE;
};
};
FUNC VOID DIA_Ghoran_BG_GHOGET_Info()
{
    AI_Output (other, self ,"DIA_Ghoran_BG_GHOGET_15_01"); //Mam twoje skradzione towary.
    AI_Output (self, other ,"DIA_Ghoran_BG_GHOGET_03_02"); //Niemo�liwe!
    AI_Output (self, other ,"DIA_Ghoran_BG_GHOGET_03_03"); //Nawet nie uszkodzone. Jestem pod wra�eniem.
    AI_Output (self, other ,"DIA_Ghoran_BG_GHOGET_03_04"); //W nagrod� we� t� butelk� wina. To moja specjalna receptura.
	B_GiveInvItems (self,other, ItFo_GhoranWine,1);
    AI_Output (other, self ,"DIA_Ghoran_BG_GHOGET_15_05"); //Wino? Zawsze co�.
	B_LogEntry               (BagienneGolemy,"Odda�em Ghoranowi jego towary by� niezwykle uradowany. Teraz pora wreszcie wyruszy� na polowanie na bagienne golemy.");
	B_GiveInvItems (other,self, itmi_items_bg,5);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA KRADZIE�Y
//========================================

var int Ghoran_Theft;

INSTANCE DIA_Ghoran_PICKPOCKET(C_INFO)
{
	npc          = NOV_1379_Ghoran;
	nr           = 900;
	condition    = DIA_Ghoran_PICKPOCKET_Condition;
	information  = DIA_Ghoran_PICKPOCKET_Info;
	permanent    = TRUE;
	 description = "Kradzie� kiesz.";
};

FUNC INT DIA_Ghoran_PICKPOCKET_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Ghoran_Margunios))
    && (Ghoran_Theft == FALSE)
	
    {
    return TRUE;
    };
};

FUNC VOID DIA_Ghoran_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_Ghoran_PICKPOCKET);
	Info_AddChoice		(DIA_Ghoran_PICKPOCKET, DIALOG_BACK 	                                    ,DIA_Ghoran_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ghoran_PICKPOCKET, "(Kradzie� tej receptury b�dzie do�� ryzykowna.)"	,DIA_Ghoran_PICKPOCKET_DoIt);
};

FUNC VOID DIA_Ghoran_PICKPOCKET_DoIt()
{
	

	if (hero.attribute[ATR_DEXTERITY] > 59)
 	{
	     B_GiveInvItems (self,hero, ItWr_GhoranWine, 1);
		 B_GiveXP(20);
         Ghoran_Theft = TRUE;
		 AI_StopProcessInfos	(self);
		 	 
	}
	else
	{
		 AI_Output (self, other ,"DIA_Ghoran_PICKPOCKET_DoIt_03_01"); //Ty parszywy z�odzieju! Czekaj no!
		 AI_StopProcessInfos	(self);
         Npc_SetTarget (self, other);
         AI_StartState (self, ZS_ATTACK, 1, "");

	};
};

FUNC VOID DIA_Ghoran_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Ghoran_PICKPOCKET);
};

instance dia_ghoran_pickpocket2(c_info) {
    npc = nov_1379_ghoran;
    nr = 900;
    condition = dia_ghoran_pickpocket2_condition;
    information = dia_ghoran_pickpocket2_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ghoran_pickpocket2_condition() {
	e_beklauen(baseThfChanceNOV, 25);
};

func void dia_ghoran_pickpocket2_info() {
	b_steal_message();
	info_clearchoices(dia_ghoran_pickpocket2);
	info_addchoice(dia_ghoran_pickpocket2, dialog_back, dia_ghoran_pickpocket2_back);
	info_addchoice(dia_ghoran_pickpocket2, dialog_pickpocket, dia_ghoran_pickpocket2_doit);
};

func void dia_ghoran_pickpocket2_doit() {
    d_beklauen();
    info_clearchoices(dia_ghoran_pickpocket2);
};

func void dia_ghoran_pickpocket2_back() {
    info_clearchoices(dia_ghoran_pickpocket2);
};