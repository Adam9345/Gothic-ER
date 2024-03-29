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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Torbeld_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Torbeld_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_02"); //Zw¹ mnie Torbeld. Skoro jestem £owc¹ Orków to wiadomo czym siê zajmuje. Oczyszczam œwiat z zielonoskórego gówna najlepiej jak mogê.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_03"); //Jak do³¹czy³eœ do £owców?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_04"); //Pod barier¹ natrafi³em na Wilsona i po czasie spodoba³ mi siê jego projekt. Pocz¹tkowo wydawa³ siê ¿artem lub samobójstwem ale si³a , honor i poœwiêcenie Wilsona przes¹dzi³y.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_05"); //A co robi³eœ przed trafieniem do Kolonii?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_06"); //Moja droga na ka¿dym etapie dawa³a mi coœ co pozwoli³o przetrwaæ tutaj. Jako robotnik w kamienio³omie nabra³em du¿ej si³y a póŸniej jako gladiator wytrzyma³oœci na ból i determinacji.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_07"); //Jak z robotnika sta³eœ siê gladiatorem?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_08"); //By³em m³ody, silny ale t³uczenie i roz³upywanie m³otem kamienia nie by³o mi w smak. Pewien cz³owiek szuka³ talentów do areny gladiatorów swego wuja. Poszed³em tam i nauczy³em siê walki.
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_09"); //PóŸniej nawet by³em mistrzem ale moja alergia na porz¹dkowych sprawi³a, ¿e... Czaszka pewnego stra¿nika miejskiego siê roz³upa³a.
    AI_Output (other, self ,"DIA_Torbeld_HELLO1_15_10"); //Z twoim udzia³em jak mniemam?
    AI_Output (self, other ,"DIA_Torbeld_HELLO1_03_11"); //Taa nikt nie patrzy³, ¿e to szuja. Zabójstwo to zabójstwo. Wyrok i zrzucenie pod barierê. Potem pobyt w Starym Obozie. I gdy mia³em ju¿ zostaæ jego cz³onkiem pojawi³ siê Wilson a reszte ju¿ znasz.
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
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_02"); //A kto ich nie potrzebuje m³ody? Zw³aszcza w kolonii karnej z orkami za miedz¹? 
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_03"); //Nie jestem krynic¹ wiedzy ale wiem, ¿e zada³eœ o to pytanie w stosownym kontekœcie. Tylko g³upiec albo ktoœ niezwykle odwa¿ny móg³ je zadaæ. 
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_04"); //Mogê byæ jednym z nas?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_05"); //To wcale nie takie proste. 
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_06"); //Mówi³eœ, ¿e ka¿dy potrzebuje sprawnych ludzi...
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_07"); //Ka¿dy. Ale my najsprawniejszych. Bój z orkami to nie igraszka.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_08"); //By staæ siê mistrzem w ich eliminowaniu musisz byæ elitarnym wojownikiem. W jeden dzieñ ci siê to nie uda. Niektórzy uzyskuj¹ to latami ¿mudnych æwiczeñ i trudnej praktyki.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_09"); //Póki co w starciu z brutalnoœci¹ kolonii zdaje siê byæ gór¹.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_10"); //Straciliœmy sporo towarzyszy. Wojownik dochodzi do si³y i potêgi d³ugo a czêsto ginie w jednej chwili.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_11"); //I jeszcze jedno. Potrzebujemy dobrych ludzi ale i takich, którzy umiej¹ wspó³pracowaæ w grupie. A ty mi wygl¹dasz na goœcia lubi¹cego dzia³ania w pojedynkê.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_12"); //Twierdzisz, ¿e do was nie pasuje?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_13"); //Tego nie powiedzia³em ale jesteœmy ostro¿ni. Na pocz¹tek trzeba rekruta przeszkoliæ.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_14"); //Musi æwiczyæ i poznaæ nasze zasady, zwyczaje. Tak by we wspólnej akcji komunikowa³ siê bez s³ów. A nie ¿eby swoj¹ niedyskrecj¹ przyczyni³ siê do œmierci swojej i swych towarzyszy.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_15"); //Rozumiem. Ma to sens skoro ryzyko jest tak wielkie.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_16"); //Jest. Ale satysfakcja z ka¿dej prze¿ytej potyczki z orkami tym bardziej.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_17"); //Dajecie sobie radê w tak nieprzyjaznym miejscu bez chocia¿by kowala?
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_18"); // Ano nie mamy ani kowala ani alchemika. Mimo tego nasze umiejêtnoœci pozwoli³y nam przetrwaæ.  Bardzo dbamy o swoj¹ broñ bo ona pozwala nam prze¿yæ. Dlatego potrafi d³ugo nam s³u¿yæ.
    AI_Output (self, other ,"DIA_Torbeld_New_members_03_19"); //A leczymy siê prostymi sposobami. Nie mamy m¹drali warz¹cego eliksiry lecznicze i te podn¹sz¹ce umiejêtnoœci.
    AI_Output (other, self ,"DIA_Torbeld_New_members_15_20"); //To na swój sposób imponuj¹ce by w tak niesprzyjaj¹cych warunkach i okolicznoœciach toczyæ ten bój.
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