
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gardist232_EXIT(C_INFO)
{
	npc             = GRD_232_Gardist;
	nr              = 999;
	condition		= DIA_Gardist232_EXIT_Condition;
	information		= DIA_Gardist232_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gardist232_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gardist232_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY1 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY1_Condition;
   information  = DIA_Gardist_NIEPOKORNY1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY1_Condition()
{
    if (hero.guild == gil_stt)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY1_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_01"); //Powinni�my porozmawia�.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_03"); //Niedawno do naszego Obozu trafi� pewien cz�owiek imieniem Oned, do��czy� do Kopaczy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_04"); //I co w tym z�ego?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_05"); //Ten palant nie zamierza p�aci� Stra�nikom podatku od bezpiecze�stwa. My�li, �e sam da sobie tu rad�.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_06"); //Czemu wi�c Stra�nicy nie obij� mu porz�dnie pyska?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_07"); //Wkr�tce do tego dojdzie, o ile nic si� nie zmieni. Ale lepiej by�oby gdyby Stra�nicy go nie katowali.
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_08"); //Reszta Kopaczy uzna�aby go za bohatera i pewnie odbi�oby si� to na wydajno�ci ich pracy. 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_09"); //No to jak da� Onedowi nauczk�? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_10"); //C� proponuje ci niez�� sumk� za za�atwienie tej sprawy w odpowiedni spos�b.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_11"); //Masz jakie� wskaz�wki?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_12"); //Oned przyja�ni si� z niejakim Lothem. Mo�e gdyby go przekona� do naszych intencji to Oned z �atwo�ci� wpad�by w nasze �apy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_13"); //Porozmawiam z nim.
    MIS_Niepokorny_Kopacz = LOG_RUNNING;

    Log_CreateTopic          	(CH1_Niepokorny_Kopacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_RUNNING);
    B_LogEntry               		(CH1_Niepokorny_Kopacz,"Zaczepi� mnie Sanias i zleci� pewne zadanie. W Starym Obozie pojawi� si� skazaniec imieniem Oned. Typ jest odwa�ny i nie ma zamiaru p�aci� Stra�nikom za ochron�. Sanias chce to zmieni�, jednak Stra�nicy nie mog� tak po prostu pobi� Oneda. Trzeba to zrobi� r�kami innych Kopaczy. Mam porozmawia� z Lothem, kt�ry kumpluje si� z Onedem. By� mo�e on przem�wi nowemu do rozs�dku zanim stanie mu si� co� z�ego.");
};


//========================================
//-----------------> NIEPOKORNY2
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY2 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY2_Condition;
   information  = DIA_Gardist_NIEPOKORNY2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY2_Condition()
{
    if (NiepokornyKopacz < Wld_GetDay())
    && (Npc_KnowsInfo (hero, DIA_Buddler_BuddlersPaid))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY2_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_01"); //S�ysza�e�?! 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_03"); //O �omocie jaki dosta� Oned. Nast�pnego dnia zap�aci� Stra�nikom i wygl�da na to, �e b�dzie to ju� robi� regularnie.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_04"); //Zatem mi si� uda�o. A skoro tak, to jeste� mi co� winien, czy� nie? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_05"); //Oczywi�cie, oto twoja nagroda. W pe�ni na ni� zas�u�y�e�.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Rozliczy�em si� z Saniasem. By� zadowolony z takiego obrotu spraw. ");
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_SUCCESS);
    MIS_Niepokorny_Kopacz = LOG_SUCCESS;

	CreateInvItems (self, itminugget,40);
	B_GiveInvItems (self,other,itminugget,40);
    B_GiveXP (100);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Gardist_Hello (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_Hello_Condition;
   information  = DIA_Gardist_Hello_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Gardist_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gardist_Hello_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_02"); //Wo�aj� na mnie Sanias.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_03"); //To nie jest twoje prawdziwe imi�?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_04"); //Nie. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_05"); //Wi�c jak naprawd� masz na imi�? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_06"); //Nie wiem. A zreszt� co cie to obchodzi? Zje�d�aj!
    AI_StopProcessInfos	(self);

};
//========================================
//-----------------> BEER_ForSanias
//========================================

INSTANCE DIA_Gardist_BEER_ForSanias (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_BEER_ForSanias_Condition;
   information  = DIA_Gardist_BEER_ForSanias_Info;
   permanent	= FALSE;
   description	= "Mo�e piwo pomog�oby ci na popraw� humoru.";
};

FUNC INT DIA_Gardist_BEER_ForSanias_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Gardist_Hello))
{
    return TRUE;
};
};
FUNC VOID DIA_Gardist_BEER_ForSanias_Info()
{
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_15_01"); //Mo�e piwo pomog�oby ci na popraw� humoru.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_03_02"); //Jedno to za ma�o. Musz� by� co najmniej dwa.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_15_03"); //Opowiesz wtedy wi�cej o sobie?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_03_04"); //Dobra. I tak nic na tym nie strac�. 
};

//========================================
//-----------------> BEER_ForSanias_lifehiis
//========================================

INSTANCE DIA_Gardist_BEER_ForSanias_lifehiis (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 2;
   condition    = DIA_Gardist_BEER_ForSanias_lifehiis_Condition;
   information  = DIA_Gardist_BEER_ForSanias_lifehiis_Info;
   permanent	= FALSE;
   description	= "Masz te dwa piwa.";
};

FUNC INT DIA_Gardist_BEER_ForSanias_lifehiis_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Gardist_BEER_ForSanias))
&&  (Npc_HasItems (other, ItFoBeer) >=2)
{
    return TRUE;
};
};
FUNC VOID DIA_Gardist_BEER_ForSanias_lifehiis_Info()
{
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_01"); //Masz te dwa piwa.
		B_GiveInvItems (self,other, ItFoBeer, 2);
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_02"); //Dzi�ki. Wo�aj� na mnie jak wo�aj� bo nikt nie pami�ta mojego pierwotnego imienia. Mia�em niespe�na 4 lata gdy nasz domek w lesie si� zapali�. Ojciec zgin�� w po�arze.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_03"); //Matka b��ka�a si� ze mn� ociemnia�a z �alu. Dopad�y nas zg�odnia�e wilki. 
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_04"); //I jak to prze�y�e�?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_05"); //Zd��y�a mnie ukry� w jakiej� szczelinie lecz sama zgin�a. P�niej odnalaz� mnie my�liwy. Da� wiejskiej rodzinie na wychowanie. Czu�em, �e traktowali mnie inaczej ni� inne swoje dzieci.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_06"); //Raz ojciec rodziny upi� si� i powiedzia� mi prawd� o moim pochodzeniu. Odt�d sam zacz��em pi�.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_07"); //Popad�em w z�e towarzystwo. Wkr�tce przy��czy�em si� do lokalnej szajki i zabi�em cz�owieka.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_08"); //I st�d tutaj jeste�?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_09"); //Taa...Zd��y�em ukra�� par� rzeczy i zasztyletowa�em jednego typa. I od razu karna Kolonia.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_10"); //Jak na ironi� tutaj wys�a�em do Beliara wi�cej ludzi a dosta�em jeszcze awans na Stra�nika.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_11"); //Potem zabi�em kilku Bandyt�w i Szkodnik�w w obronie konwoj�w mi�dzy obozem a kopalni�.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_12"); //Rozumiem.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_13"); //Dobra dosy� tej gadki. Przesz�o�� to przesz�o�� a ja jej nienawidz�.
	B_GiveXp(25);
    AI_StopProcessInfos	(self);
};

instance dia_grd_232_pickpocket(c_info) {
    npc = grd_232_gardist;
    nr = 900;
    condition = dia_grd_232_pickpocket_condition;
    information = dia_grd_232_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_232_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_232_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_232_pickpocket);
	info_addchoice(dia_grd_232_pickpocket, dialog_back, dia_grd_232_pickpocket_back);
	info_addchoice(dia_grd_232_pickpocket, dialog_pickpocket, dia_grd_232_pickpocket_doit);
};

func void dia_grd_232_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_232_pickpocket);
};

func void dia_grd_232_pickpocket_back() {
    info_clearchoices(dia_grd_232_pickpocket);
};