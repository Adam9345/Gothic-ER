
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
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_01"); //Powinniœmy porozmawiaæ.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_03"); //Niedawno do naszego Obozu trafi³ pewien cz³owiek imieniem Oned, do³¹czy³ do Kopaczy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_04"); //I co w tym z³ego?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_05"); //Ten palant nie zamierza p³aciæ Stra¿nikom podatku od bezpieczeñstwa. Myœli, ¿e sam da sobie tu radê.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_06"); //Czemu wiêc Stra¿nicy nie obij¹ mu porz¹dnie pyska?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_07"); //Wkrótce do tego dojdzie, o ile nic siê nie zmieni. Ale lepiej by³oby gdyby Stra¿nicy go nie katowali.
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_08"); //Reszta Kopaczy uzna³aby go za bohatera i pewnie odbi³oby siê to na wydajnoœci ich pracy. 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_09"); //No to jak daæ Onedowi nauczkê? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_10"); //Có¿ proponuje ci niez³¹ sumkê za za³atwienie tej sprawy w odpowiedni sposób.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_11"); //Masz jakieœ wskazówki?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_12"); //Oned przyjaŸni siê z niejakim Lothem. Mo¿e gdyby go przekonaæ do naszych intencji to Oned z ³atwoœci¹ wpad³by w nasze ³apy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_13"); //Porozmawiam z nim.
    MIS_Niepokorny_Kopacz = LOG_RUNNING;

    Log_CreateTopic          	(CH1_Niepokorny_Kopacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_RUNNING);
    B_LogEntry               		(CH1_Niepokorny_Kopacz,"Zaczepi³ mnie Sanias i zleci³ pewne zadanie. W Starym Obozie pojawi³ siê skazaniec imieniem Oned. Typ jest odwa¿ny i nie ma zamiaru p³aciæ Stra¿nikom za ochronê. Sanias chce to zmieniæ, jednak Stra¿nicy nie mog¹ tak po prostu pobiæ Oneda. Trzeba to zrobiæ rêkami innych Kopaczy. Mam porozmawiaæ z Lothem, który kumpluje siê z Onedem. Byæ mo¿e on przemówi nowemu do rozs¹dku zanim stanie mu siê coœ z³ego.");
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
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_01"); //S³ysza³eœ?! 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_03"); //O ³omocie jaki dosta³ Oned. Nastêpnego dnia zap³aci³ Stra¿nikom i wygl¹da na to, ¿e bêdzie to ju¿ robi³ regularnie.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_04"); //Zatem mi siê uda³o. A skoro tak, to jesteœ mi coœ winien, czy¿ nie? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_05"); //Oczywiœcie, oto twoja nagroda. W pe³ni na ni¹ zas³u¿y³eœ.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Rozliczy³em siê z Saniasem. By³ zadowolony z takiego obrotu spraw. ");
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Gardist_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gardist_Hello_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_02"); //Wo³aj¹ na mnie Sanias.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_03"); //To nie jest twoje prawdziwe imiê?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_04"); //Nie. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_05"); //Wiêc jak naprawdê masz na imiê? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_06"); //Nie wiem. A zreszt¹ co cie to obchodzi? Zje¿d¿aj!
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
   description	= "Mo¿e piwo pomog³oby ci na poprawê humoru.";
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
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_15_01"); //Mo¿e piwo pomog³oby ci na poprawê humoru.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_03_02"); //Jedno to za ma³o. Musz¹ byæ co najmniej dwa.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_15_03"); //Opowiesz wtedy wiêcej o sobie?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_03_04"); //Dobra. I tak nic na tym nie stracê. 
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
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_02"); //Dziêki. Wo³aj¹ na mnie jak wo³aj¹ bo nikt nie pamiêta mojego pierwotnego imienia. Mia³em niespe³na 4 lata gdy nasz domek w lesie siê zapali³. Ojciec zgin¹³ w po¿arze.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_03"); //Matka b³¹ka³a siê ze mn¹ ociemnia³a z ¿alu. Dopad³y nas zg³odnia³e wilki. 
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_04"); //I jak to prze¿y³eœ?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_05"); //Zd¹¿y³a mnie ukryæ w jakiejœ szczelinie lecz sama zginê³a. PóŸniej odnalaz³ mnie myœliwy. Da³ wiejskiej rodzinie na wychowanie. Czu³em, ¿e traktowali mnie inaczej ni¿ inne swoje dzieci.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_06"); //Raz ojciec rodziny upi³ siê i powiedzia³ mi prawdê o moim pochodzeniu. Odt¹d sam zacz¹³em piæ.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_07"); //Popad³em w z³e towarzystwo. Wkrótce przy³¹czy³em siê do lokalnej szajki i zabi³em cz³owieka.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_08"); //I st¹d tutaj jesteœ?
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_09"); //Taa...Zd¹¿y³em ukraœæ parê rzeczy i zasztyletowa³em jednego typa. I od razu karna Kolonia.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_10"); //Jak na ironiê tutaj wys³a³em do Beliara wiêcej ludzi a dosta³em jeszcze awans na Stra¿nika.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_11"); //Potem zabi³em kilku Bandytów i Szkodników w obronie konwojów miêdzy obozem a kopalni¹.
    AI_Output (other, self ,"DIA_Gardist_BEER_ForSanias_lifehiis_15_12"); //Rozumiem.
    AI_Output (self, other ,"DIA_Gardist_BEER_ForSanias_lifehiis_03_13"); //Dobra dosyæ tej gadki. Przesz³oœæ to przesz³oœæ a ja jej nienawidzê.
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