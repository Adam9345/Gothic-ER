//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hanson_EXIT(C_INFO)
{
	npc             = NOV_1378_Hanson;
	nr              = 999;
	condition		= DIA_Hanson_EXIT_Condition;
	information		= DIA_Hanson_EXIT_Info;
	permanent		= TRUE;
	description  	= DIALOG_ENDE;
};

FUNC INT DIA_Hanson_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hanson_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////
// DIALOGI OG�LNE
////////////////////////////////////////////////

//========================================
//-----------------> WHO
//========================================

INSTANCE DIA_Hanson_WHO (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_WHO_Condition;
   information  = DIA_Hanson_WHO_Info;
   permanent	= FALSE;
   description	= "Jeste� drwalem?";
};

FUNC INT DIA_Hanson_WHO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_WHO_Info()
{
    AI_Output (other, self ,"DIA_Hanson_WHO_15_01"); //Jeste� drwalem?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_02"); //Nie wida�?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_03"); //Wyci��em ju� po�ow� tego dziadostwa. Drewno z bagien w wi�kszo�ci jest kiepskiej jako�ci. Przegni�e i zbutwia�e...
	AI_Output (self, other ,"DIA_Hanson_WHO_03_04"); //Tylko niekt�re drzewa s� naprawd� w dobrym stanie, ale je z kolei nie spos�b wyci��. S� strasznie twarde, a �aden z tych obibok�w z Obozu nie chce mi pom�c. 
    AI_Output (self, other ,"DIA_Hanson_WHO_03_05"); //Ale gdy kt�ry� chce, �eby mu co� wystruga� z drewna to przychodzi od razu...
};

//========================================
//-----------------> PRACA
//========================================

INSTANCE DIA_Hanson_PRACA (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 2;
   condition    = DIA_Hanson_PRACA_Condition;
   information  = DIA_Hanson_PRACA_Info;
   permanent	= FALSE;
   description	= "Jak praca?";
};

FUNC INT DIA_Hanson_PRACA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_PRACA_Info()
{
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_01"); //Jak praca? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_02"); //Po prostu wspaniale! Siedz� po uszy w b�otnistym g�wnie i wycinam drzewa. Spe�nienie marze�...
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_03"); //Dlaczego ci�gle narzekasz?
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_04"); //Bo jestem chory! �le si� czuj�, a ci�gle przychodzi do mnie kto�, komu potrzebne jest drewno na chat�.
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_05"); //Mo�e powiniene� st�d odej��, skoro ta praca ci nie odpowiada? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_06"); //Nie mam dok�d...
};

////////////////////////////////////////////
// TAJEMNICZY HANDLARZ
////////////////////////////////////////////

//========================================
//-----------------> STEH
//========================================

INSTANCE DIA_Hanson_STEH (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_STEH_Condition;
   information  = DIA_Hanson_STEH_Info;
   permanent	= FALSE;
   description	= "To ty zajmujesz si� handlem artefaktami?!";
};

FUNC INT DIA_Hanson_STEH_Condition()
{
	if (Npc_KnowsInfo (hero, Nov_1371_BaalNetbek_QUEST)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Hanson_STEH_Info()
{
    AI_Output (other, self ,"DIA_Hanson_STEH_15_01"); //To ty zajmujesz si� handlem artefaktami?!
    AI_Output (self, other ,"DIA_Hanson_STEH_03_02"); //Mistrzu, naprawd� nie wiem o czym m�wisz!
	AI_Output (other, self ,"DIA_Hanson_STEH_15_03"); //K�amiesz! Baal Netbek wskaza� na kogo�, kto kr�ci si� w tych okolicach. 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_04"); //Naprawd�? Guru bierze na powa�nie s�owa tego ob��kanego popapra�ca?! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_05"); //Nie mam sobie nic do zarzucenia! Mo�esz przeszuka� mnie i moj� chat�. Nie mam nic do ukrycia! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_06"); //Lepiej zainteresuj si� tym cz�owiekiem, kt�ry od kilku dni przesiaduje przy palisadzie, a normalnym ludziom daj spok�j.
	AI_Output (other, self ,"DIA_Hanson_STEH_15_07"); //Sprawdz� to, ale je�li k�amiesz to wr�c�. 
	B_LogEntry     (CH3_StrangeResearcher,"Rozmawia�em z Hansonem na temat handlu. Wszystkiego si� wypiera. Twierdzi, �e Baal Netbek si� pomyli� i powinienem poszuka� Nowicjusza, kt�ry kr�ci si� przy palisadzie. ");
};

instance dia_hanson_pickpocket(c_info) {
    npc = nov_1378_hanson;
    nr = 900;
    condition = dia_hanson_pickpocket_condition;
    information = dia_hanson_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanson_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_hanson_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanson_pickpocket);
	info_addchoice(dia_hanson_pickpocket, dialog_back, dia_hanson_pickpocket_back);
	info_addchoice(dia_hanson_pickpocket, dialog_pickpocket, dia_hanson_pickpocket_doit);
};

func void dia_hanson_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hanson_pickpocket);
};

func void dia_hanson_pickpocket_back() {
    info_clearchoices(dia_hanson_pickpocket);
};