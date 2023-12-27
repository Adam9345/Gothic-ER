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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Foster_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Foster_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Foster_HELLO1_03_02"); //Zbieraczem , który haruje na tym cholernym poletku!
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_03"); //Mo¿e grzeczniej.
    AI_Output (self, other ,"DIA_Foster_HELLO1_03_04"); //Nie ucz mnie grzecznoœci i zje¿d¿aj ode mnie!
    AI_Output (other, self ,"DIA_Foster_HELLO1_15_05"); //Ktoœ tu woli babranie siê w ry¿u od normalnej rozmowy. Ach te gusta ludzi....
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
   description	= "Co wiesz o ostatnich kradzie¿ach?";
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
    AI_Output (other, self ,"DIA_Foster_PZ_15_01"); //Co wiesz o ostatnich kradzie¿ach?
    AI_Output (self, other ,"DIA_Foster_PZ_03_02"); //Jakich kradzie¿ach?!
    AI_Output (other, self ,"DIA_Foster_PZ_15_03"); //Zbieraczom znika ruda i co wartoœciowsze przedmioty. Dziwne byœ o tym nie wiedzia³....
    AI_Output (self, other ,"DIA_Foster_PZ_03_04"); //W takim razie jestem dziwny i daj mi w spokoju pracowaæ!
    AI_Output (other, self ,"DIA_Foster_PZ_15_05"); //Powiedz jeszcze o....
    AI_Output (self, other ,"DIA_Foster_PZ_03_06"); //Zjed¿daj st¹d w podskokach!
	B_LogEntry           (PoszkodowaniZbieracze,"Foster by³ bardzo nerwowy i chcia³ mnie przegnaæ. Powiem o tym Horacemu.");
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
    AI_Output (self, other ,"DIA_Foster_I_Catch_You_03_01"); //Mam ciê z³odzieju! Z³apany na gor¹cym uczynku!
    AI_Output (other, self ,"DIA_Foster_I_Catch_You_15_02"); //Nie robiê tego ze z³odziejskich pobudek.
    AI_Output (self, other ,"DIA_Foster_I_Catch_You_03_03"); //Nie b¹dŸ bezczelny draniu.
    AI_Output (other, self ,"DIA_Foster_I_Catch_You_15_04"); //Rzucê okiem na twoje pismo. Mo¿e ono powie mi co ukrywasz i czemu siê tak zachowujesz....
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
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_03"); //Jesteœ cz³onkiem jakiejœ bandy?
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_04"); //To nie tak....By³em nim ale ju¿ nie jestem. Nie mog³em tak okradaæ ludzi z, którymi ca³y czas przebywam. 
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_05"); //Przecie¿ kradzie¿e nadal maj¹ miejsce.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_06"); //Ostatniej kradzie¿y dokona³em kilka dni temu ale postanowi³em, ¿e bêdzie ostatnia. Nie przespa³em paru nocy. Potem jeszcze dosta³em to pismo...
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_07"); //Wydano na ciebie wyrok.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_08"); //Fajna perspektywa co?! Co ja mam teraz robiæ...
    AI_Output (other, self ,"DIA_Foster_PZ_WRITTEN_15_09"); //Wygl¹da na to, ¿e sam siê w to wpakowa³eœ.
    AI_Output (self, other ,"DIA_Foster_PZ_WRITTEN_03_10"); //Tak. Nie mam nic na swoj¹ obronê. Ale nie jestem taki z³y i chcê to odkrêciæ! 
	B_LogEntry           (PoszkodowaniZbieracze,"W kufrze Fostera znalaz³em pismo , które dosta³ od rozbójników. Nale¿a³ do bandy ale najwyraŸniej postanowi³ zerwaæ z nimi wspó³pracê. Teraz szanta¿uj¹ go i namawiaj¹ do kradzie¿y dokumentów Homerowi. Chodzi o plany fortyfikacji Nowego Obozu. Chc¹ je sprzedaæ  Magnatom. Teraz muszê siê zastanowiæ co robiæ? Po prostu iœæ do Lee i powiedzieæ wszystko czy rozwi¹zaæ sprawê dyskretnie. Hmmm...");
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
   description	= "Bez cudzej pomocy niczego nie wskórasz.";
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
    AI_Output (other, self ,"DIA_Foster_ImNotAngry_15_01"); //Bez cudzej pomocy niczego nie wskórasz.
    AI_Output (self, other ,"DIA_Foster_ImNotAngry_03_02"); //Pomó¿ mi a dostaniesz odpowieni¹ nagrodê. Najlepiej pogadaj z kimœ na kim najmocniej mo¿esz polegac w Nowym Obozie.
    AI_Output (self, other ,"DIA_Foster_ImNotAngry_03_03"); //Ale oddaj mi rudê, któr¹ zwin¹³eœ z kufra.
	Info_ClearChoices	(DIA_Foster_ImNotAngry);
	Info_AddChoice		(DIA_Foster_ImNotAngry, "Poca³uj mnie w rzyæ.", DIA_FosterKissMyAss);
	Info_AddChoice		(DIA_Foster_ImNotAngry, "Dobra masz.", DIA_FosterGiveBack);
};

FUNC VOID DIA_FosterKissMyAss()
{
    AI_Output (other, self ,"DIA_FosterKissMyAss_15_01"); //Poca³uj mnie w rzyæ.
    AI_Output (self, other ,"DIA_FosterKissMyAss_03_02"); //Normalnie bym ci przywali³ ale nie ja teraz rozdaje karty. Zach³anny z ciebie typ.
	AI_Output (other, self ,"DIA_FosterKissMyAss_15_03"); //I kto to mówi...
    AI_Output (self, other ,"DIA_FosterKissMyAss_03_04"); //Gadaj co z nasza spraw¹!
	Dia_ChestEnd = TRUE;
	Info_ClearChoices	(DIA_Foster_ImNotAngry);
};
FUNC VOID DIA_FosterGiveBack()
{
    AI_Output (other, self ,"DIA_FosterGiveBack_15_01"); //Dobra masz.
	B_GiveInvItems (other,self, itminugget, 50);
    AI_Output (self, other ,"DIA_FosterGiveBack_03_02"); //Dziêki. Zachowa³eœ sie jak trzeba.
	AI_Output (other, self ,"DIA_FosterGiveBack_15_03"); //Taa odda³em kradzion¹ rudê z³odziejowi. Fajnie.
    AI_Output (self, other ,"DIA_FosterGiveBack_03_04"); //Nie mêdrkuj tylko mów co dalej!
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
   description	= "Muszê ostrzec Lee i Homera przed rozbójnikami. A ty tu zostañ.";
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
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_01"); //Muszê ostrzec Lee i Homera przed rozbójnikami. A ty tu zostañ.
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_02"); //Ja te¿ jestem w niebezpieczeñstwie.
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_03"); //Sam zapewni³eœ sobie k³opoty. Przez ciebie jacyœ zbóje po³akomili siê na kluczowe dla Nowego Obozu dokumenty.
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_04"); //Pójdê do Lee i powiem mu o wszystkim. A ty czekaj tutaj.  
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_05"); //Pewnie dostanê surow¹ karê...
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_06"); //Taki jest skutek twoich dzia³añ. Nic ponadto.
    AI_Output (self, other ,"DIA_Foster_HomerAndLee_03_07"); //Ale....
    AI_Output (other, self ,"DIA_Foster_HomerAndLee_15_08"); //I nie kombinuj wiêcej.
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
   description	= "Znajdê kogoœ zaufanego. Idziesz ze mn¹.";
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
    AI_Output (other, self ,"DIA_Foster_GoWMe_15_01"); //Znajdê kogoœ zaufanego. Idziesz ze mn¹.
    AI_Output (self, other ,"DIA_Foster_GoWMe_03_02"); //No dobra. Tutaj wkrótce mo¿e nie byæ bezpiecznie a z reszt¹ nigdzie nie jest do cholery!
    AI_Output (other, self ,"DIA_Foster_GoWMe_15_03"); //Otrz¹œnij siê i chodŸ.
    AI_Output (self, other ,"DIA_Foster_GoWMe_03_04"); //No dobra.
	B_LogEntry           (PoszkodowaniZbieracze,"Zdecydowa³em siê za³atwiæ sprawê po cichu nie mieszaj¹c w to Lee. Pójde z Fosterem. Poszukam kogoœ godnego zaufania w obozie, na myœl przychodzi mi najemnik Gorn. Razem wymyœlimy co dalej.");
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
   description	= "Zaprowadzisz nas do obozowiska rozbójników.";
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
    AI_Output (other, self ,"DIA_Foster_GO_PZG_15_01"); //Zaprowadzisz nas do obozowiska rozbójników.
    AI_Output (self, other ,"DIA_Foster_GO_PZG_03_02"); //W¹tpliwa atrakcja wracaæ w to miejsce. Ale chêtnie zobaczê jak dostaj¹ od was po ³bie.
    AI_Output (other, self ,"DIA_Foster_GO_PZG_15_03"); //Wiêc rusz siê i poka¿ nam gdzie oni s¹.
    AI_Output (self, other ,"DIA_Foster_GO_PZG_03_04"); //Dobra! Za mn¹. 
	B_LogEntry           (PoszkodowaniZbieracze,"Foster zaprowadzi mnie i Gorna do obozowiska rozbójników. Czas siê z nimi rozprawiæ.");
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
    AI_Output (self, other ,"DIA_Foster_PZ_SLOW_03_01"); //To tam... Gdybym mia³ lepsze wyposa¿enie to chêtnie bym wam pomóg³.
    AI_Output (other, self ,"DIA_Foster_PZ_SLOW_15_02"); //Pozbêdzimy siê ich... Oby, i mam nadziejê ¿e nic nie kombinujesz... 
    AI_Output (self, other ,"DIA_Foster_PZ_SLOW_03_03"); //I tak ju¿ w gorszej sytuacji byæ nie mogê ale muszê zobaczyæ ich pot³uczone ³by hehe. Powodzenia w walce.
	
   // AI_Output (other, self ,"DIA_Foster_PZ_SLOW_15_04"); //Dobra, prowadŸ!
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
   description	= "Twoi dawni koledzy ju¿ ci nie zagra¿aj¹.";
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
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_01"); //Twoi dawni koledzy ju¿ ci nie zagra¿aj¹.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_02"); //Jestem twoim dozgonnym d³u¿nikiem. Ju¿ nigdy nie wpakuje siê w takie bagno. Mo¿esz mi wierzyæ.
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_03"); //Zobaczymy. O ile wiem wisisz mi rudê.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_04"); //Tak, tak. WeŸ te 100 bry³ek. Tyle samo dam Gornowi.
	B_GiveInvItems (self,other, ItMiNugget, 100);
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_05"); //Z ca³ym szacunkiem zrobi³em w tej sprawie wiêcej ni¿ on.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_06"); //Zna³em kiedyœ Kopacza ze Starego Obozu. Ma na imiê Brennus.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_07"); //Wisi mi 150 bry³ek.
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_08"); //Mogê napisaæ ci upowa¿nienie by wyda³ ci tê rudê. Gdyby siê stawia³ to powiedz, ¿e mam w Nowym Obozie kilku kompanów...
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_09"); //Kiedy mogê odebraæ to pismo?
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_10"); //Kto zleci³ ci sprawê kradzie¿y zbieraczy?
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_11"); //Rufus. 
    AI_Output (self, other ,"DIA_Foster_YouOldFriends_03_12"); //Najpierw z nim pogadaj. Powiedz, ¿e rozbójnicy okradali zbieraczy ale nie wspominaj o mnie. Potem wróæ po upowa¿nienie.
    AI_Output (other, self ,"DIA_Foster_YouOldFriends_15_13"); //Niech bêdzie.
	B_LogEntry           (PoszkodowaniZbieracze,"Wszyscy zbóje s¹ martwi. Foster wynagrodzi³ mnie rud¹ i to samo ma zrobiæ w przypadku Gorna. Powiedzia³, ¿e napisze wiadomoœæ do dawnego d³u¿nika - Kopacza Brennusa ze Starego Obozu by da³ mi zaleg³¹ rudê, któr¹ wisi zbieraczowi. W tym czasie mam pogadaæ z Rufusem.");
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
   description	= "Rozmawia³em z Rufusem.";
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
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_01"); //Rozmawia³em z Rufusem.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_02"); //No i jak?
	B_GiveInvItems (self,other, ItWr_PZ_Brennus, 1);
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_03"); //Powiedzia³em mu o rozbójnikach. Przyj¹³ to do wiadomoœci i da³ mi nagrodê za pomoc.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_04"); //Ale ani s³owa o mnie?
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_05"); //Tak. Masz drug¹ szansê od losu ale tym razem nie podejmuj takich decyzji.
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_06"); //Bo jeœli to trafi w moje rêcê to wtedy ci nie odpuszczê.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_07"); //Dobrze. Równy z ciebie goœæ. Masz tu moje pismo do Brennusa.
    AI_Output (self, other ,"DIA_Foster_PZ_RUFI_03_08"); //Dziêki za pomoc. Trzymaj siê i powodzenia dalej.
    AI_Output (other, self ,"DIA_Foster_PZ_RUFI_15_09"); //Wzajemnie. Bywaj zatem.
	B_LogEntry           (PoszkodowaniZbieracze,"Foster jest mi bardzo wdziêczny za pomoc z rozbójnikami i za to, ¿e nie donios³em na niego Lee. Da³ mi pismo dla Brennusa. Odwiedzê tego Kopacza i zgarnê t¹ rudê.");
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
