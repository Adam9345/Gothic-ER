// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Torbeld_EXIT(C_INFO)
{
	npc             = NON_40154_Torbeld;
	nr              = 999;
	condition	= DIA_Torbeld_EXIT_Condition;
	information	= DIA_Torbeld_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Torbeld_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Torbeld_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Torbeld_HELLO1 (C_INFO)
{
   npc          = NON_40154_Torbeld;
   nr           = 1;
   condition    = DIA_Torbeld_HELLO1_Condition;
   information  = DIA_Torbeld_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Torbeld_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Torbeld_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_02"); //Zw� mnie Torbeld. Skoro jestem �owc� Ork�w to wiadomo czym si� zajmuje. Oczyszczam �wiat z zielonosk�rego g�wna najlepiej jak mog�.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_03"); //Jak do��czy�e� do �owc�w?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_04"); //Pod barier� natrafi�em na Wilsona i po czasie spodoba� mi si� jego projekt. Pocz�tkowo wydawa� si� �artem lub samob�jstwem ale si�a , honor i po�wi�cenie Wilsona przes�dzi�y.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_05"); //A co robi�e� przed trafieniem do Kolonii?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_06"); //Moja droga na ka�dym etapie dawa�a mi co� co pozwoli�o przetrwa� tutaj. Jako robotnik w kamienio�omie nabra�em du�ej si�y a p�niej jako gladiator wytrzyma�o�ci na b�l i determinacji.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_07"); //Jak z robotnika sta�e� si� gladiatorem?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_08"); //By�em m�ody, silny ale t�uczenie i roz�upywanie m�otem kamienia nie by�o mi w smak. Pewien cz�owiek szuka� talent�w do areny gladiator�w swego wuja. Poszed�em tam i nauczy�em si� walki.
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_09"); //P�niej nawet by�em mistrzem ale moja alergia na porz�dkowych sprawi�a, �e... Czaszka pewnego stra�nika miejskiego si� roz�upa�a.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_10"); //Z twoim udzia�em jak mniemam?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_11"); //Taa nikt nie patrzy�, �e to szuja. Zab�jstwo to zab�jstwo. Wyrok i zrzucenie pod barier�. Potem pobyt w Starym Obozie. I gdy mia�em ju� zosta� jego cz�onkiem pojawi� si� Wilson a reszte ju� znasz.
};

//========================================
//-----------------> New_members
//========================================

INSTANCE DIA_Torbeld_New_members (C_INFO)
{
   npc          = NON_40154_Torbeld;
   nr           = 1;
   condition    = DIA_Torbeld_New_members_Condition;
   information  = DIA_Torbeld_New_members_Info;
   permanent	= FALSE;
   description	= "Nie potrzebujecie sprawnych ludzi?";
};

FUNC INT DIA_Torbeld_New_members_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Torbeld_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Torbeld_New_members_Info()
{
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_01"); //Nie potrzebujecie sprawnych ludzi?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_02"); //A kto ich nie potrzebuje m�ody? Zw�aszcza w kolonii karnej z orkami za miedz�? 
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_03"); //Nie jestem krynic� wiedzy ale wiem, �e zada�e� o to pytanie w stosownym kontek�cie. Tylko g�upiec albo kto� niezwykle odwa�ny m�g� je zada�. 
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_04"); //Mog� by� jednym z nas?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_05"); //To wcale nie takie proste. 
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_06"); //M�wi�e�, �e ka�dy potrzebuje sprawnych ludzi...
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_07"); //Ka�dy. Ale my najsprawniejszych. B�j z orkami to nie igraszka.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_08"); //By sta� si� mistrzem w ich eliminowaniu musisz by� elitarnym wojownikiem. W jeden dzie� ci si� to nie uda. Niekt�rzy uzyskuj� to latami �mudnych �wicze� i trudnej praktyki.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_09"); //P�ki co w starciu z brutalno�ci� kolonii zdaje si� by� g�r�.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_10"); //Stracili�my sporo towarzyszy. Wojownik dochodzi do si�y i pot�gi d�ugo a cz�sto ginie w jednej chwili.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_11"); //I jeszcze jedno. Potrzebujemy dobrych ludzi ale i takich, kt�rzy umiej� wsp�pracowa� w grupie. A ty mi wygl�dasz na go�cia lubi�cego dzia�ania w pojedynk�.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_12"); //Twierdzisz, �e do was nie pasuje?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_13"); //Tego nie powiedzia�em ale jeste�my ostro�ni. Na pocz�tek trzeba rekruta przeszkoli�.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_14"); //Musi �wiczy� i pozna� nasze zasady, zwyczaje. Tak by we wsp�lnej akcji komunikowa� si� bez s��w. A nie �eby swoj� niedyskrecj� przyczyni� si� do �mierci swojej i swych towarzyszy.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_15"); //Rozumiem. Ma to sens skoro ryzyko jest tak wielkie.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_16"); //Jest. Ale satysfakcja z ka�dej prze�ytej potyczki z orkami tym bardziej.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_17"); //Dajecie sobie rad� w tak nieprzyjaznym miejscu bez chocia�by kowala?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_18"); // Ano nie mamy ani kowala ani alchemika. Mimo tego nasze umiej�tno�ci pozwoli�y nam przetrwa�.  Bardzo dbamy o swoj� bro� bo ona pozwala nam prze�y�. Dlatego potrafi d�ugo nam s�u�y�.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_19"); //A leczymy si� prostymi sposobami. Nie mamy m�drali warz�cego eliksiry lecznicze i te podn�sz�ce umiej�tno�ci.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_20"); //To na sw�j spos�b imponuj�ce by w tak niesprzyjaj�cych warunkach i okoliczno�ciach toczy� ten b�j.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_21"); //A i widzisz.
};

instance dia_torbeld_pickpocket(c_info) {
    npc = non_40154_torbeld;
    nr = 900;
    condition = dia_torbeld_pickpocket_condition;
    information = dia_torbeld_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_torbeld_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 35);
};

func void dia_torbeld_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_torbeld_pickpocket);
	info_addchoice(dia_torbeld_pickpocket, dialog_back, dia_torbeld_pickpocket_back);
	info_addchoice(dia_torbeld_pickpocket, dialog_pickpocket, dia_torbeld_pickpocket_doit);
};

func void dia_torbeld_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_torbeld_pickpocket);
};

func void dia_torbeld_pickpocket_back() {
    info_clearchoices(dia_torbeld_pickpocket);
};