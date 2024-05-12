//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra�nik_2005_EXIT(C_INFO)
{
	npc             = GRD_2005_Stra�nik;
	nr              = 999;
	condition	= DIA_Stra�nik_EXIT_2005_Condition;
	information	= DIA_Stra�nik_EXIT_2005_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra�nik_EXIT_2005_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra�nik_EXIT_2005_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KTOTY
//========================================

INSTANCE DIA_Stra�nik_KTOTY (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_KTOTY_Condition;
   information  = DIA_Stra�nik_KTOTY_Info;
   permanent	= FALSE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Stra�nik_KTOTY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra�nik_KTOTY_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_KTOTY_15_03"); //Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Stra�nik_KTOTY_03_04"); //Pilnuj� placu wymian przed takimi nierobami jak ty!
};

//========================================
//-----------------> O_PLACU
//========================================

INSTANCE DIA_Stra�nik_O_PLACU (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 2;
   condition    = DIA_Stra�nik_O_PLACU_Condition;
   information  = DIA_Stra�nik_O_PLACU_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o placu wymian.";
};

FUNC INT DIA_Stra�nik_O_PLACU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra�nik_KTOTY))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Stra�nik_O_PLACU_Info()
{
    AI_Output (other, self ,"DIA_Stra�nik_O_PLACU_15_01"); //Opowiedz mi o placu wymian.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_02"); //P�niej ju� sobie p�jdziesz?
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_03"); //Prowadzimy tutaj wymian� towar�w za rud� ze �wiatem Zewn�trznym.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_04"); //Co miesi�c �adujemy rud� do skrzyni i wci�gamy j� na g�r�.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_05"); //W zamian za rud� otrzymujemy paczki z �ywno�ci� i inne potrzebne do �ycia przedmioty.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_06"); //Czasem te� kobiety...
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_07"); //Ale to nie dla nas, a szczeg�lnie nie dla takich jak TY!
    AI_Output (other, self ,"DIA_Stra�nik_O_PLACU_15_08"); //A je�li ludzie kr�la nie za�aduj� skrzy�?
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_09"); //Zdarza�o si� i tak.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_10"); //Wtedy w nast�pnym miesi�cu nie przekazywali�my rudy.
    AI_Output (self, other ,"DIA_Stra�nik_O_PLACU_03_11"); //Ale ch�opcy mieli miny. He he. Nic nie mogli nam zrobi�.
};


//========================================
//-----------------> OBRONA
//========================================

INSTANCE DIA_Stra�nik_OBRONA (C_INFO)
{
   npc          = GRD_2005_Stra�nik;
   nr           = 1;
   condition    = DIA_Stra�nik_OBRONA_Condition;
   information  = DIA_Stra�nik_OBRONA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stra�nik_OBRONA_Condition()
{
    if (MIS_ReplacePointDefense == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra�nik_OBRONA_Info()
{
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_01"); //Przyby�e� w ostatniej chwili, m�ody. By�oby po nas.
    AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_02"); //Rozmawia�e� z pozosta�ymi?
    if (Npc_KnowsInfo (hero, DIA_Robotnik_OBRONA_2)) 
    {
        AI_Output (other, self ,"DIA_Stra�nik_OBRONA_15_03"); //Tak.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_04"); //W takim razie wszyscy s� bezpieczni. Mo�esz wraca� do Obozu.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby�em si� Bandyt�w z placu wymian. Mog� wr�ci� do Obozu.");
    }
    else
    {
        AI_Output (other, self ,"DIA_Stra�nik_OBRONA_15_05"); //Jeszcze nie.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_06"); //W takim razie sprawd� czy innym te� uda�o si� odeprze� atak.
        AI_Output (self, other ,"DIA_Stra�nik_OBRONA_03_07"); //Potem wr�� do Thorusa.
		B_LogEntry                     (CH2_ReplacePointDefense,"Pozby�em si� Bandyt�w z placu wymian, jednak wci�� nie rozmawia�em ze Stra�nikami z pozosta�ych posterunk�w. Musz� sprawdzi� czy s� bezpieczni. Dopiero potem b�d� m�g� wr�ci�. ");
		
    };
	B_GiveXP (79);
    AI_StopProcessInfos	(self);
};

instance dia_grd_2005_pickpocket(c_info) {
    npc = grd_2005_stra�nik;
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