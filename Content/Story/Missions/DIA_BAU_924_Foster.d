// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Foster_EXIT(C_INFO)
{
	npc             = BAU_924_Foster;
	nr              = 999;
	condition	= DIA_Foster_EXIT_Condition;
	information	= DIA_Foster_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Foster_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Foster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Foster_HELLO1 (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_HELLO1_Condition;
   information  = DIA_Foster_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Foster_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Foster_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Foster_HELLO1_03_02"); //Zbieraczem , kt�ry haruje na tym cholernym poletku!
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_03"); //Mo�e grzeczniej.
    AI_Output (self, other ,"DIA_Foster_HELLO1_03_04"); //Nie ucz mnie grzeczno�ci i zje�d�aj ode mnie!
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_05"); //Kto� tu woli babranie si� w ry�u od normalnej rozmowy. Ach te gusta ludzi....
};

//========================================
//-----------------> PZ
//========================================

INSTANCE DIA_Foster_PZ (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 2;
   condition    = DIA_Foster_PZ_Condition;
   information  = DIA_Foster_PZ_Info;
   permanent	= FALSE;
   description	= "Co wiesz o ostatnich kradzie�ach?";
};

FUNC INT DIA_Foster_PZ_Condition()
{

 if (Npc_KnowsInfo(hero,DIA_Horatio_Poszkodowani))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_PZ_Info()
{
    AI_Output (other, self ,"DIA_Foster_PZ_15_01"); //Co wiesz o ostatnich kradzie�ach?
    AI_Output (self, other ,"DIA_Foster_PZ_03_02"); //Jakich kradzie�ach?!
    AI_Output (other, self ,"DIA_Foster_PZ_15_03"); //Zbieraczom znika ruda i co warto�ciowsze przedmioty. Dziwne by� o tym nie wiedzia�....
    AI_Output (self, other ,"DIA_Foster_PZ_03_04"); //W takim razie jestem dziwny i daj mi w spokoju pracowa�!
    AI_Output (other, self ,"DIA_Foster_PZ_15_05"); //Powiedz jeszcze o....
    AI_Output (self, other ,"DIA_Foster_PZ_03_06"); //Zjed�daj st�d w podskokach!
	B_LogEntry           (PoszkodowaniZbieracze,"Foster by� bardzo nerwowy i chcia� mnie przegna�. Powiem o tym Horacemu.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> I_Catch_You
//========================================

INSTANCE DIA_Foster_I_Catch_You (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_I_Catch_You_Condition;
   information  = DIA_Foster_I_Catch_You_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Foster_I_Catch_You_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Wedge_PZ_KEY))
&& (C_BodyStateContains(hero,BS_STAND))
&& (FosterCathing_Hero == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_I_Catch_You_Info()
{
    AI_Output (self, other ,"DIA_Foster_I_Catch_You_03_01"); //Mam ci� z�odzieju! Z�apany na gor�cym uczynku!
    AI_Output (other, self ,"DIA_Foster_I_Catch_You_15_02"); //Nie robi� tego ze z�odziejskich pobudek.
    AI_Output (self, other ,"DIA_Foster_I_Catch_You_03_03"); //Nie b�d� bezczelny draniu.
    AI_Output (other, self ,"DIA_Foster_I_Catch_You_15_04"); //Rzuc� okiem na twoje pismo. Mo�e ono powie mi co ukrywasz i czemu si� tak zachowujesz....
    AI_Output (self, other ,"DIA_Foster_I_Catch_You_03_05"); //Eeee...
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZ_WRITTEN
//========================================

INSTANCE DIA_Foster_PZ_WRITTEN (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 2;
   condition    = DIA_Foster_PZ_WRITTEN_Condition;
   information  = DIA_Foster_PZ_WRITTEN_Info;
   permanent	= FALSE;
   description	= "Ciekawe pismo.";
};

FUNC INT DIA_Foster_PZ_WRITTEN_Condition()
{
if (Hero_KnowsFosterDeal == TRUE)
&& (Npc_KnowsInfo(hero,DIA_Foster_I_Catch_You))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_PZ_WRITTEN_Info()
{
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_01"); //Ciekawe pismo.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_02"); //Too...
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_03"); //Jeste� cz�onkiem jakiej� bandy?
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_04"); //To nie tak....By�em nim ale ju� nie jestem. Nie mog�em tak okrada� ludzi z, kt�rymi ca�y czas przebywam. 
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_05"); //Przecie� kradzie�e nadal maj� miejsce.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_06"); //Ostatniej kradzie�y dokona�em kilka dni temu ale postanowi�em, �e b�dzie ostatnia. Nie przespa�em paru nocy. Potem jeszcze dosta�em to pismo...
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_07"); //Wydano na ciebie wyrok.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_08"); //Fajna perspektywa co?! Co ja mam teraz robi�...
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_09"); //Wygl�da na to, �e sam si� w to wpakowa�e�.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_10"); //Tak. Nie mam nic na swoj� obron�. Ale nie jestem taki z�y i chc� to odkr�ci�! 
	B_LogEntry           (PoszkodowaniZbieracze,"W kufrze Fostera znalaz�em pismo , kt�re dosta� od rozb�jnik�w. Nale�a� do bandy ale najwyra�niej postanowi� zerwa� z nimi wsp�prac�. Teraz szanta�uj� go i namawiaj� do kradzie�y dokument�w Homerowi. Chodzi o plany fortyfikacji Nowego Obozu. Chc� je sprzeda�  Magnatom. Teraz musz� si� zastanowi� co robi�? Po prostu i�� do Lee i powiedzie� wszystko czy rozwi�za� spraw� dyskretnie. Hmmm...");
};

//========================================
//-----------------> ImNotAngry    

//========================================
var int Dia_ChestEnd;
INSTANCE DIA_Foster_ImNotAngry (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 3;
   condition    = DIA_Foster_ImNotAngry_Condition;
   information  = DIA_Foster_ImNotAngry_Info;
   permanent	= FALSE;
   description	= "Bez cudzej pomocy niczego nie wsk�rasz.";
};

FUNC INT DIA_Foster_ImNotAngry_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Foster_PZ_WRITTEN))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_ImNotAngry_Info()
{
    AI_Output (other, self ,"DIA_Foster_ImNotAngry_15_01"); //Bez cudzej pomocy niczego nie wsk�rasz.
    AI_Output (self, other ,"DIA_Foster_ImNotAngry_03_02"); //Pom� mi a dostaniesz odpowieni� nagrod�. Najlepiej pogadaj z kim� na kim najmocniej mo�esz polegac w Nowym Obozie.
    AI_Output (self, other ,"DIA_Foster_ImNotAngry_03_03"); //Ale oddaj mi rud�, kt�r� zwin��e� z kufra.
	Info_ClearChoices	(DIA_Foster_ImNotAngry);
	Info_AddChoice		(DIA_Foster_ImNotAngry, "Poca�uj mnie w rzy�.", DIA_FosterKissMyAss);
	Info_AddChoice		(DIA_Foster_ImNotAngry, "Dobra masz.", DIA_FosterGiveBack);
};

FUNC VOID DIA_FosterKissMyAss()
{
    AI_Output (other, self ,"DIA_FosterKissMyAss_15_01"); //Poca�uj mnie w rzy�.
    AI_Output (self, other ,"DIA_FosterKissMyAss_03_02"); //Normalnie bym ci przywali� ale nie ja teraz rozdaje karty. Zach�anny z ciebie typ.
	AI_Output (other, self ,"DIA_FosterKissMyAss_15_03"); //I kto to m�wi...
    AI_Output (self, other ,"DIA_FosterKissMyAss_03_04"); //Gadaj co z nasza spraw�!
	Dia_ChestEnd = TRUE;
	Info_ClearChoices	(DIA_Foster_ImNotAngry);
};
FUNC VOID DIA_FosterGiveBack()
{
    AI_Output (other, self ,"DIA_FosterGiveBack_15_01"); //Dobra masz.
	B_GiveInvItems (other,self, itminugget, 50);
    AI_Output (self, other ,"DIA_FosterGiveBack_03_02"); //Dzi�ki. Zachowa�e� sie jak trzeba.
	AI_Output (other, self ,"DIA_FosterGiveBack_15_03"); //Taa odda�em kradzion� rud� z�odziejowi. Fajnie.
    AI_Output (self, other ,"DIA_FosterGiveBack_03_04"); //Nie m�drkuj tylko m�w co dalej!
	Dia_ChestEnd = TRUE;
	Info_ClearChoices	(DIA_Foster_ImNotAngry);
};
//========================================
//-----------------> HomerAndLee
//========================================
var int FChooseOne;
var int FChooseTwo;
INSTANCE DIA_Foster_HomerAndLee (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_HomerAndLee_Condition;
   information  = DIA_Foster_HomerAndLee_Info;
   permanent	= FALSE;
   description	= "Musz� ostrzec Lee i Homera przed rozb�jnikami. A ty tu zosta�.";
};

FUNC INT DIA_Foster_HomerAndLee_Condition()
{ 
if (Dia_ChestEnd == TRUE)
&& (FChooseTwo == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_HomerAndLee_Info()
{
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_01"); //Musz� ostrzec Lee i Homera przed rozb�jnikami. A ty tu zosta�.
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_02"); //Ja te� jestem w niebezpiecze�stwie.
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_03"); //Sam zapewni�e� sobie k�opoty. Przez ciebie jacy� zb�je po�akomili si� na kluczowe dla Nowego Obozu dokumenty.
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_04"); //P�jd� do Lee i powiem mu o wszystkim. A ty czekaj tutaj.  
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_05"); //Pewnie dostan� surow� kar�...
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_06"); //Taki jest skutek twoich dzia�a�. Nic ponadto.
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_07"); //Ale....
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_08"); //I nie kombinuj wi�cej.
	FChooseOne = TRUE;
};

//========================================
//-----------------> GoWMe
//========================================

INSTANCE DIA_Foster_GoWMe (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 2;
   condition    = DIA_Foster_GoWMe_Condition;
   information  = DIA_Foster_GoWMe_Info;
   permanent	= FALSE;
   description	= "Znajd� kogo� zaufanego. Idziesz ze mn�.";
};

FUNC INT DIA_Foster_GoWMe_Condition()
{
if (Dia_ChestEnd == TRUE)
&& (FChooseOne == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_GoWMe_Info()
{
    AI_Output (other, self ,"DIA_Foster_GoWMe_15_01"); //Znajd� kogo� zaufanego. Idziesz ze mn�.
    AI_Output (self, other ,"DIA_Foster_GoWMe_03_02"); //No dobra. Tutaj wkr�tce mo�e nie by� bezpiecznie a z reszt� nigdzie nie jest do cholery!
    AI_Output (other, self ,"DIA_Foster_GoWMe_15_03"); //Otrz��nij si� i chod�.
    AI_Output (self, other ,"DIA_Foster_GoWMe_03_04"); //No dobra.
	B_LogEntry           (PoszkodowaniZbieracze,"Zdecydowa�em si� za�atwi� spraw� po cichu nie mieszaj�c w to Lee. P�jde z Fosterem. Poszukam kogo� godnego zaufania w obozie, na my�l przychodzi mi najemnik Gorn. Razem wymy�limy co dalej.");
	Npc_ExchangeRoutine(BAU_924_Foster,"FollowPZ");
	FChooseTwo = TRUE;
};

//========================================
//-----------------> GO_PZG
//========================================
var int GornFoster_Follow;
INSTANCE DIA_Foster_GO_PZG (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_GO_PZG_Condition;
   information  = DIA_Foster_GO_PZG_Info;
   permanent	= FALSE;
   description	= "Zaprowadzisz nas do obozowiska rozb�jnik�w.";
};

FUNC INT DIA_Foster_GO_PZG_Condition()
{
if  (Npc_KnowsInfo(hero,DIA_PC_Fighter_HELLO_Pz))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_GO_PZG_Info()
{
    AI_Output (other, self ,"DIA_Foster_GO_PZG_15_01"); //Zaprowadzisz nas do obozowiska rozb�jnik�w.
    AI_Output (self, other ,"DIA_Foster_GO_PZG_03_02"); //W�tpliwa atrakcja wraca� w to miejsce. Ale ch�tnie zobacz� jak dostaj� od was po �bie.
    AI_Output (other, self ,"DIA_Foster_GO_PZG_15_03"); //Wi�c rusz si� i poka� nam gdzie oni s�.
    AI_Output (self, other ,"DIA_Foster_GO_PZG_03_04"); //Dobra! Za mn�. 
	B_LogEntry           (PoszkodowaniZbieracze,"Foster zaprowadzi mnie i Gorna do obozowiska rozb�jnik�w. Czas si� z nimi rozprawi�.");
	Npc_ExchangeRoutine(BAU_924_Foster,"GuidePZ");
	GornFoster_Follow = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> PZ_SLOW
//========================================

INSTANCE DIA_Foster_PZ_SLOW (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_PZ_SLOW_Condition;
   information  = DIA_Foster_PZ_SLOW_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Foster_PZ_SLOW_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_PC_Fighter_GOWH_PZ))//(FollowInAroundPZ == TRUE)  //if (Npc_GetDistToWP(hero,"OW_PATH_039")<1500)
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_PZ_SLOW_Info()
{
    AI_Output (self, other ,"DIA_Foster_PZ_SLOW_03_01"); //To tam... Gdybym mia� lepsze wyposa�enie to ch�tnie bym wam pom�g�.
    AI_Output (other, self ,"DIA_Foster_PZ_SLOW_15_02"); //Pozb�dzimy si� ich... Oby, i mam nadziej� �e nic nie kombinujesz... 
    AI_Output (self, other ,"DIA_Foster_PZ_SLOW_03_03"); //I tak ju� w gorszej sytuacji by� nie mog� ale musz� zobaczy� ich pot�uczone �by hehe. Powodzenia w walce.
	
   // AI_Output (other, self ,"DIA_Foster_PZ_SLOW_15_04"); //Dobra, prowad�!
	//Npc_ExchangeRoutine(BAU_924_Foster,"GuidePZ2");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> YouOldFriends
//========================================

INSTANCE DIA_Foster_YouOldFriends (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_YouOldFriends_Condition;
   information  = DIA_Foster_YouOldFriends_Info;
   permanent	= FALSE;
   description	= "Twoi dawni koledzy ju� ci nie zagra�aj�.";
};

FUNC INT DIA_Foster_YouOldFriends_Condition()
{
 if (Npc_IsDead (Org_40161_Rozbojnik))
 && (Npc_IsDead (Org_40159_Rozbojnik))
 && (Npc_IsDead (ORG_40160_Szef))
 && (Npc_KnowsInfo(hero,DIA_Szef_PZ_GORN))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_YouOldFriends_Info()
{
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_01"); //Twoi dawni koledzy ju� ci nie zagra�aj�.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_02"); //Jestem twoim dozgonnym d�u�nikiem. Ju� nigdy nie wpakuje si� w takie bagno. Mo�esz mi wierzy�.
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_03"); //Zobaczymy. O ile wiem wisisz mi rud�.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_04"); //Tak, tak. We� te 100 bry�ek. Tyle samo dam Gornowi.
	B_GiveInvItems (self,other, ItMiNugget, 100);
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_05"); //Z ca�ym szacunkiem zrobi�em w tej sprawie wi�cej ni� on.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_06"); //Zna�em kiedy� Kopacza ze Starego Obozu. Ma na imi� Brennus.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_07"); //Wisi mi 150 bry�ek.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_08"); //Mog� napisa� ci upowa�nienie by wyda� ci t� rud�. Gdyby si� stawia� to powiedz, �e mam w Nowym Obozie kilku kompan�w...
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_09"); //Kiedy mog� odebra� to pismo?
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_10"); //Kto zleci� ci spraw� kradzie�y zbieraczy?
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_11"); //Rufus. 
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_12"); //Najpierw z nim pogadaj. Powiedz, �e rozb�jnicy okradali zbieraczy ale nie wspominaj o mnie. Potem wr�� po upowa�nienie.
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_13"); //Niech b�dzie.
	B_LogEntry           (PoszkodowaniZbieracze,"Wszyscy zb�je s� martwi. Foster wynagrodzi� mnie rud� i to samo ma zrobi� w przypadku Gorna. Powiedzia�, �e napisze wiadomo�� do dawnego d�u�nika - Kopacza Brennusa ze Starego Obozu by da� mi zaleg�� rud�, kt�r� wisi zbieraczowi. W tym czasie mam pogada� z Rufusem.");
	Npc_ExchangeRoutine(BAU_924_Foster,"Start");
};

//========================================
//-----------------> PZ_RUFI
//========================================

INSTANCE DIA_Foster_PZ_RUFI (C_INFO)
{
   npc          = BAU_924_Foster;
   nr           = 1;
   condition    = DIA_Foster_PZ_RUFI_Condition;
   information  = DIA_Foster_PZ_RUFI_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Rufusem.";
};

FUNC INT DIA_Foster_PZ_RUFI_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Rufus_PZEEEND))
{
    return TRUE;
};
};
FUNC VOID DIA_Foster_PZ_RUFI_Info()
{
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_01"); //Rozmawia�em z Rufusem.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_02"); //No i jak?
	B_GiveInvItems (self,other, ItWr_PZ_Brennus, 1);
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_03"); //Powiedzia�em mu o rozb�jnikach. Przyj�� to do wiadomo�ci i da� mi nagrod� za pomoc.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_04"); //Ale ani s�owa o mnie?
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_05"); //Tak. Masz drug� szans� od losu ale tym razem nie podejmuj takich decyzji.
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_06"); //Bo je�li to trafi w moje r�c� to wtedy ci nie odpuszcz�.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_07"); //Dobrze. R�wny z ciebie go��. Masz tu moje pismo do Brennusa.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_08"); //Dzi�ki za pomoc. Trzymaj si� i powodzenia dalej.
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_09"); //Wzajemnie. Bywaj zatem.
	B_LogEntry           (PoszkodowaniZbieracze,"Foster jest mi bardzo wdzi�czny za pomoc z rozb�jnikami i za to, �e nie donios�em na niego Lee. Da� mi pismo dla Brennusa. Odwiedz� tego Kopacza i zgarn� t� rud�.");
    AI_StopProcessInfos	(self);
};

instance dia_foster_pickpocket(c_info) {
    npc = bau_924_foster;
    nr = 900;
    condition = dia_foster_pickpocket_condition;
    information = dia_foster_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_foster_pickpocket_condition() {
	e_beklauen(baseThfChanceBAU, 20);
};

func void dia_foster_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_foster_pickpocket);
	info_addchoice(dia_foster_pickpocket, dialog_back, dia_foster_pickpocket_back);
	info_addchoice(dia_foster_pickpocket, dialog_pickpocket, dia_foster_pickpocket_doit);
};

func void dia_foster_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_foster_pickpocket);
};

func void dia_foster_pickpocket_back() {
    info_clearchoices(dia_foster_pickpocket);
};
