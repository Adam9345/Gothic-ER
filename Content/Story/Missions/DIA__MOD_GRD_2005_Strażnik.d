//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra¿nik_2005_EXIT(C_INFO)
{
	npc             = GRD_2005_Stra¿nik;
	nr              = 999;
	condition	= DIA_Stra¿nik_EXIT_2005_Condition;
	information	= DIA_Stra¿nik_EXIT_2005_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra¿nik_EXIT_2005_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra¿nik_EXIT_2005_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTY
//========================================

INSTANCE DIA_Stra¿nik_KTOTY (C_INFO)
{
   npc          = GRD_2005_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_KTOTY_Condition;
   information  = DIA_Stra¿nik_KTOTY_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_Stra¿nik_KTOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_KTOTY_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_KTOTY_15_03"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Stra¿nik_KTOTY_03_04"); //Pilnujê placu wymian przed takimi nierobami jak ty!
};

//========================================
//-----------------> O_PLACU
//========================================

INSTANCE DIA_Stra¿nik_O_PLACU (C_INFO)
{
   npc          = GRD_2005_Stra¿nik;
   nr           = 2;
   condition    = DIA_Stra¿nik_O_PLACU_Condition;
   information  = DIA_Stra¿nik_O_PLACU_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o placu wymian.";
};

FUNC INT DIA_Stra¿nik_O_PLACU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_KTOTY))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Stra¿nik_O_PLACU_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_O_PLACU_15_01"); //Opowiedz mi o placu wymian.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_02"); //PóŸniej ju¿ sobie pójdziesz?
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_03"); //Prowadzimy tutaj wymianê towarów za rudê ze Œwiatem Zewnêtrznym.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_04"); //Co miesi¹c ³adujemy rudê do skrzyni i wci¹gamy j¹ na górê.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_05"); //W zamian za rudê otrzymujemy paczki z ¿ywnoœci¹ i inne potrzebne do ¿ycia przedmioty.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_06"); //Czasem te¿ kobiety...
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_07"); //Ale to nie dla nas, a szczególnie nie dla takich jak TY!
    AI_Output (other, self ,"DIA_Stra¿nik_O_PLACU_15_08"); //A jeœli ludzie króla nie za³aduj¹ skrzyñ?
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_09"); //Zdarza³o siê i tak.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_10"); //Wtedy w nastêpnym miesi¹cu nie przekazywaliœmy rudy.
    AI_Output (self, other ,"DIA_Stra¿nik_O_PLACU_03_11"); //Ale ch³opcy mieli miny. He he. Nic nie mogli nam zrobiæ.
};


//========================================
//-----------------> OBRONA
//========================================

INSTANCE DIA_Stra¿nik_OBRONA (C_INFO)
{
   npc          = GRD_2005_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_OBRONA_Condition;
   information  = DIA_Stra¿nik_OBRONA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra¿nik_OBRONA_Condition()
{
    if (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_OBRONA_Info()
{
    AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_03_01"); //Przyby³eœ w ostatniej chwili, m³ody. By³oby po nas.
    AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_03_02"); //Rozmawia³eœ z pozosta³ymi?
    if (Npc_KnowsInfo (hero, DIA_Robotnik_OBRONA_2)) 
    {
        AI_Output (other, self ,"DIA_Stra¿nik_OBRONA_15_03"); //Tak.
        AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_03_04"); //W takim razie wszyscy s¹ bezpieczni. Mo¿esz wracaæ do Obozu.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby³em siê Bandytów z placu wymian. Mogê wróciæ do Obozu.");
    }
    else
    {
        AI_Output (other, self ,"DIA_Stra¿nik_OBRONA_15_05"); //Jeszcze nie.
        AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_03_06"); //W takim razie sprawdŸ czy innym te¿ uda³o siê odeprzeæ atak.
        AI_Output (self, other ,"DIA_Stra¿nik_OBRONA_03_07"); //Potem wróæ do Thorusa.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby³em siê Bandytów z placu wymian, jednak wci¹¿ nie rozmawia³em ze Stra¿nikami z pozosta³ych posterunków. Muszê sprawdziæ czy s¹ bezpieczni. Dopiero potem bêdê móg³ wróciæ. ");
		
    };
	B_GiveXP (79);
    AI_StopProcessInfos	(self);
};

instance dia_grd_2005_pickpocket(c_info) {
    npc = grd_2005_stra¿nik;
    nr = 900;
    condition = dia_grd_2005_pickpocket_condition;
    information = dia_grd_2005_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2005_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2005_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2005_pickpocket);
	info_addchoice(dia_grd_2005_pickpocket, dialog_back, dia_grd_2005_pickpocket_back);
	info_addchoice(dia_grd_2005_pickpocket, dialog_pickpocket, dia_grd_2005_pickpocket_doit);
};

func void dia_grd_2005_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_2005_pickpocket);
};

func void dia_grd_2005_pickpocket_back() {
    info_clearchoices(dia_grd_2005_pickpocket);
};