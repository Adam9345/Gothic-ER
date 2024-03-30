// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_JimTmq_EXIT(C_INFO)
{
	npc             = STT_40149_Jim;
	nr              = 999;
	condition	= DIA_JimTmq_EXIT_Condition;
	information	= DIA_JimTmq_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_JimTmq_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_JimTmq_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> TMQ_HI
//========================================

INSTANCE DIA_Jim_TMQ_HI (C_INFO)
{
   npc          = STT_40149_Jim;
   nr           = 1;
   condition    = DIA_Jim_TMQ_HI_Condition;
   information  = DIA_Jim_TMQ_HI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jim_TMQ_HI_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_TMQ_FLORIAN))
{
    return TRUE;
};
};
FUNC VOID DIA_Jim_TMQ_HI_Info()
{
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_01"); //No prosz�!
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_02"); //Troch� trupia atmosfera, nieprawda�?
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_03"); //Nie spodziewa�em si�, �e dotrzesz tak daleko.
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_04"); //A jednak. Dlaczego to robisz?
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_05"); //Ci cholerni Magowie mnie nie doceniali. Dobrze, �e ich wyr�ni�to.
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_06"); //To ja powinienem by� do nich do��czy� a nie ten sko�czony frajer Milten.
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_07"); //Kto� tu jest ma�ym frustratem...
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_08"); //Zamknij si�...
};

//========================================
//-----------------> TMQ_NEC
//========================================

INSTANCE DIA_Jim_TMQ_NEC (C_INFO)
{
   npc          = STT_40149_Jim;
   nr           = 2;
   condition    = DIA_Jim_TMQ_NEC_Condition;
   information  = DIA_Jim_TMQ_NEC_Info;
   permanent	= FALSE;
   description	= "hs@FF0000 Sk�d masz tak� wiedz� o nekromancji?";
};

FUNC INT DIA_Jim_TMQ_NEC_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jim_TMQ_HI))
{
    return TRUE;
};
};
FUNC VOID DIA_Jim_TMQ_NEC_Info()
{
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_01"); //Sk�d masz tak� wiedz� o nekromancji? 
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_02"); //Kiedy wyci�to Mag�w odnalaz�em ukryt� przez Corristo ksi�g� ,, Mi�dzy �wiatami�.
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_03"); //Traktowa�a o sztuce nekromancji, przywo�ywaniu o�ywie�c�w, ich kontroli i wzmocnieniu bojowemu.
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_04"); //Jeste� tylko marnym imitatorem Maga.
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_05"); //Ten imitator zaraz wy�l� ci� do Beliara!
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_06"); //Bro� si� gnido!
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_07"); //Do us�ug!
	Wld_InsertNpc				(ZombieTMQ3,"WP_TMQ_ZOM4");
	Wld_InsertNpc				(ZombieTMQ2,"WP_TMQ_ZOM2");
	Wld_InsertNpc				(ZombieTMQ4,"WP_TMQ_ZOM3");
    AI_StopProcessInfos	(hero);
    Npc_SetPermAttitude (STT_40149_Jim, ATT_HOSTILE);
    Npc_SetTarget (STT_40149_Jim, other);
    AI_StartState (STT_40149_Jim, ZS_ATTACK, 1, "");
  
};