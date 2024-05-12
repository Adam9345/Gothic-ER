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
// DIALOGI OGÓLNE
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
   description	= "Jesteœ drwalem?";
};

FUNC INT DIA_Hanson_WHO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_WHO_Info()
{
    AI_Output (other, self ,"DIA_Hanson_WHO_15_01"); //Jesteœ drwalem?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_02"); //Nie widaæ?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_03"); //Wyci¹³em ju¿ po³owê tego dziadostwa. Drewno z bagien w wiêkszoœci jest kiepskiej jakoœci. Przegni³e i zbutwia³e...
	AI_Output (self, other ,"DIA_Hanson_WHO_03_04"); //Tylko niektóre drzewa s¹ naprawdê w dobrym stanie, ale je z kolei nie sposób wyci¹æ. S¹ strasznie twarde, a ¿aden z tych obiboków z Obozu nie chce mi pomóc. 
    AI_Output (self, other ,"DIA_Hanson_WHO_03_05"); //Ale gdy któryœ chce, ¿eby mu coœ wystrugaæ z drewna to przychodzi od razu...
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
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_02"); //Po prostu wspaniale! Siedzê po uszy w b³otnistym gównie i wycinam drzewa. Spe³nienie marzeñ...
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_03"); //Dlaczego ci¹gle narzekasz?
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_04"); //Bo jestem chory! le siê czujê, a ci¹gle przychodzi do mnie ktoœ, komu potrzebne jest drewno na chatê.
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_05"); //Mo¿e powinieneœ st¹d odejœæ, skoro ta praca ci nie odpowiada? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_06"); //Nie mam dok¹d...
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
   description	= "To ty zajmujesz siê handlem artefaktami?!";
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
    AI_Output (other, self ,"DIA_Hanson_STEH_15_01"); //To ty zajmujesz siê handlem artefaktami?!
    AI_Output (self, other ,"DIA_Hanson_STEH_03_02"); //Mistrzu, naprawdê nie wiem o czym mówisz!
	AI_Output (other, self ,"DIA_Hanson_STEH_15_03"); //K³amiesz! Baal Netbek wskaza³ na kogoœ, kto krêci siê w tych okolicach. 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_04"); //Naprawdê? Guru bierze na powa¿nie s³owa tego ob³¹kanego popaprañca?! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_05"); //Nie mam sobie nic do zarzucenia! Mo¿esz przeszukaæ mnie i moj¹ chatê. Nie mam nic do ukrycia! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_06"); //Lepiej zainteresuj siê tym cz³owiekiem, który od kilku dni przesiaduje przy palisadzie, a normalnym ludziom daj spokój.
	AI_Output (other, self ,"DIA_Hanson_STEH_15_07"); //Sprawdzê to, ale jeœli k³amiesz to wrócê. 
	B_LogEntry     (CH3_StrangeResearcher,"Rozmawia³em z Hansonem na temat handlu. Wszystkiego siê wypiera. Twierdzi, ¿e Baal Netbek siê pomyli³ i powinienem poszukaæ Nowicjusza, który krêci siê przy palisadzie. ");
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