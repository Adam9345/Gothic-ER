//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stra¿nik_2001_EXIT(C_INFO)
{
	npc             = GRD_2001_Stra¿nik;
	nr              = 999;
	condition	= DIA_Stra¿nik_2001_EXIT_Condition;
	information	= DIA_Stra¿nik_2001_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stra¿nik_2001_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stra¿nik_2001_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Kim_jestes
//========================================

INSTANCE DIA_Stra¿nik_Kim_jestes (C_INFO)
{
   npc          = GRD_2001_Stra¿nik;
   nr           = 1;
   condition    = DIA_Stra¿nik_Kim_jestes_Condition;
   information  = DIA_Stra¿nik_Kim_jestes_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Stra¿nik_Kim_jestes_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stra¿nik_Kim_jestes_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_Kim_jestes_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_02"); //Pilnujê kopalni.
    AI_Output (other, self ,"DIA_Stra¿nik_Kim_jestes_15_03"); //Czy ta kopalnia wci¹¿ dzia³a?
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_04"); //No w³aœnie nie. Nie dzia³a ju¿ od wielu lat.
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_05"); //Pewnego dnia nie wytrzyma³y podpory i wszystko siê zawali³o.
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_06"); //Podobno zniszczenia odkry³y podziemn¹ grotê pe³n¹ plugawych istot.
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_07"); //Od tamtej pory kopalnia nie funkcjonuje.
    AI_Output (other, self ,"DIA_Stra¿nik_Kim_jestes_15_08"); //Wierzysz w to?
    AI_Output (self, other ,"DIA_Stra¿nik_Kim_jestes_03_09"); //Jak mam nie wierzyæ? W nocy z g³êbi kopalni s³ychaæ straszliwe dŸwiêki.
};

//========================================
//-----------------> ODBUDOWA
//========================================

INSTANCE DIA_Stra¿nik_ODBUDOWA (C_INFO)
{
   npc          = GRD_2001_Stra¿nik;
   nr           = 2;
   condition    = DIA_Stra¿nik_ODBUDOWA_Condition;
   information  = DIA_Stra¿nik_ODBUDOWA_Info;
   permanent	= FALSE;
   description	= "Nie próbowaliœcie odbudowaæ kopalni?";
};

FUNC INT DIA_Stra¿nik_ODBUDOWA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_Kim_jestes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_ODBUDOWA_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_ODBUDOWA_15_01"); //Nie próbowaliœcie odbudowaæ kopalni?
    AI_Output (self, other ,"DIA_Stra¿nik_ODBUDOWA_03_02"); //Oczywiœcie, ¿e próbowaliœmy. Pamiêtam to.
    AI_Output (self, other ,"DIA_Stra¿nik_ODBUDOWA_03_03"); //By³em wtedy Cieniem. Gomez wys³a³ oddzia³ Stra¿ników, który mia³ wypêdziæ te istoty.
    AI_Output (self, other ,"DIA_Stra¿nik_ODBUDOWA_03_04"); //Wszyscy zginêli. Z³o¿a by³y i tak na wyczerpaniu. Wiêcej prób nie podjêto.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Stra¿nik_HELLO3 (C_INFO)
{
   npc          = GRD_2001_Stra¿nik;
   nr           = 3;
   condition    = DIA_Stra¿nik_HELLO3_Condition;
   information  = DIA_Stra¿nik_HELLO3_Info;
   permanent	= FALSE;
   description	= "Co mi powiesz o Gomezie?";
};

FUNC INT DIA_Stra¿nik_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_ODBUDOWA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_HELLO3_15_01"); //Co mi powiesz o Gomezie?
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO3_03_02"); //To najpotê¿niejszy z Magnatów. Ma wszystko, czego chce.
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO3_03_03"); //Wykorzystuje Stra¿ników do za³atwiania brudnej roboty.
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO3_03_04"); //Ma oczywiœcie swoich pomocników.
    AI_Output (other, self ,"DIA_Stra¿nik_HELLO3_15_05"); //Warto siê go baæ?
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO3_03_06"); //Oczywiœcie. Jest potê¿nym wojownikiem, ale rzadko walczy.
    AI_Output (self, other ,"DIA_Stra¿nik_HELLO3_03_07"); //Woli kazaæ Stra¿nikom rozszarpaæ kogoœ na kawa³eczki.
};

//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Stra¿nik_SYTUACJA (C_INFO)
{
   npc          = GRD_2001_Stra¿nik;
   nr           = 4;
   condition    = DIA_Stra¿nik_SYTUACJA_Condition;
   information  = DIA_Stra¿nik_SYTUACJA_Info;
   permanent	= TRUE;
   description	= "Jak sytuacja w kopalni?";
};

FUNC INT DIA_Stra¿nik_SYTUACJA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stra¿nik_Kim_jestes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stra¿nik_SYTUACJA_Info()
{
    AI_Output (other, self ,"DIA_Stra¿nik_SYTUACJA_15_01"); //Jak sytuacja w kopalni?
    AI_Output (self, other ,"DIA_Stra¿nik_SYTUACJA_15_02"); //Na razie nie jest Ÿle. Chocia¿ dŸwiêki nasilaj¹ siê z ka¿dym dniem.
};