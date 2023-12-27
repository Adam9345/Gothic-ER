//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_KDF_NOV_EXIT(C_INFO)
{
	npc             = STT_2080_KDF_NOV;
	nr              = 999;
	condition	= DIA_KDF_NOV_EXIT_Condition;
	information	= DIA_KDF_NOV_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_KDF_NOV_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_KDF_NOV_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_KDF_NOV_HELLO1 (C_INFO)
{
   npc          = STT_2080_KDF_NOV;
   nr           = 1;
   condition    = DIA_KDF_NOV_HELLO1_Condition;
   information  = DIA_KDF_NOV_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jeste� kurierem Mag�w.";
};

FUNC INT DIA_KDF_NOV_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Cutter_Blachostka_W))
{
    return TRUE;
};
};
FUNC VOID DIA_KDF_NOV_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_KDF_NOV_HELLO1_15_01"); //Jeste� kurierem Mag�w.
    AI_Output (self, other ,"DIA_KDF_NOV_HELLO1_03_02"); //Tak, jestem kurierem. Czego ode mnie chcesz nieznajomy?
    AI_Output (other, self ,"DIA_KDF_NOV_HELLO1_15_03"); //Eee... Chcia�bym wys�a� do kogo� pewn� paczk�. Czy m�g�by� si� tym zaj��?
    AI_Output (self, other ,"DIA_KDF_NOV_HELLO1_03_04"); //Za chwil� wyruszam z poleceniem Mag�w do obozowiska pod Star� Kopalni�.
    AI_Output (self, other ,"DIA_KDF_NOV_HELLO1_03_05"); //Wi�c nie ma mowy. Poza tym pracuje tylko dla Mag�w.
    AI_Output (other, self ,"DIA_KDF_NOV_HELLO1_15_06"); //W porz�dku. Czyli nici z naszego interesu.
    AI_Output (self, other ,"DIA_KDF_NOV_HELLO1_03_07"); //Przykro mi ale dok�adnie tak.
	CreateInvItem (STT_2080_KDF_NOV, ItKe_KUR_BLA);
	CreateInvItem (STT_2080_KDF_NOV, ITKE_Tower_01);
    AI_Output (other, self ,"DIA_KDF_NOV_HELLO1_15_08"); //Zatem do zobaczenia...
    AI_Output (self, other ,"DIA_KDF_NOV_HELLO1_03_09"); //�egnam.
	
	
	B_LogEntry          (Blachostka,"Kurier Mag�w przypadkowo wygada� si�, �e za chwil� wyrusza do Starej Kopalni, Kiedy wyjdzie z obozu musz� go sprz�tn��. I zgarn�� klucz do wie�y Mag�w.");
	Npc_ExchangeRoutine (STT_2080_KDF_NOV,"blachostka");
	
	
	Info_ClearChoices   (DIA_KDF_NOV_HELLO1);
    Info_AddChoice		(DIA_KDF_NOV_HELLO1, "(�led� kuriera)", DIA_KurierBla_Path);

};

FUNC VOID DIA_KurierBla_Path()
{
    AI_StopProcessInfos	    (self);
    Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    AI_Teleport(hero, "PACHOL1" ); 
    AI_Teleport(STT_2080_KDF_NOV, "OW_PATH_249" ); 
	AI_StopProcessInfos	    (self);
   // Info_ClearChoices		(DIA_KDF_NOV_HELLO1);
    AI_StopProcessInfos	    (self);

};
//========================================
//-----------------> Blachostka_las
//========================================

INSTANCE DIA_KDF_NOV_Blachostka_las (C_INFO)
{
   npc          = STT_2080_KDF_NOV;
   nr           = 1;
   condition    = DIA_KDF_NOV_Blachostka_las_Condition;
   information  = DIA_KDF_NOV_Blachostka_las_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_KDF_NOV_Blachostka_las_Condition()
{
if (Npc_KnowsInfo(hero,DIA_KDF_NOV_HELLO1))
&& (Npc_GetDistToWP(hero,"OW_PATH_249")<3000)
{
    return TRUE;
};
};
FUNC VOID DIA_KDF_NOV_Blachostka_las_Info()
{
    AI_Output (self, other ,"DIA_KDF_NOV_Blachostka_las_03_01"); //A tobie co, �ledzisz mnie?
    AI_Output (other, self ,"DIA_KDF_NOV_Blachostka_las_15_02"); //Ja...
    AI_Output (self, other ,"DIA_KDF_NOV_Blachostka_las_03_03"); //Rozumiem, chesz rudy tak? To chod� i j� sobie we�!
	//B_LogEntry               (Blachostka,"");
	AI_StopProcessInfos	(self);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    
};

