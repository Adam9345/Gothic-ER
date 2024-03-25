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
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_01"); //No proszê!
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_02"); //Trochê trupia atmosfera, nieprawda¿?
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_03"); //Nie spodziewa³em siê, ¿e dotrzesz tak daleko.
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_04"); //A jednak. Dlaczego to robisz?
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_05"); //Ci cholerni Magowie mnie nie doceniali. Dobrze, ¿e ich wyr¿niêto.
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_06"); //To ja powinienem by³ do nich do³¹czyæ a nie ten skoñczony frajer Milten.
    AI_Output (other, self ,"DIA_Jim_TMQ_HI_15_07"); //Ktoœ tu jest ma³ym frustratem...
    AI_Output (self, other ,"DIA_Jim_TMQ_HI_03_08"); //Zamknij siê...
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
   description	= "hs@FF0000 Sk¹d masz tak¹ wiedzê o nekromancji?";
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
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_01"); //Sk¹d masz tak¹ wiedzê o nekromancji? 
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_02"); //Kiedy wyciêto Magów odnalaz³em ukryt¹ przez Corristo ksiêgê ,, Miêdzy œwiatami”.
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_03"); //Traktowa³a o sztuce nekromancji, przywo³ywaniu o¿ywieñców, ich kontroli i wzmocnieniu bojowemu.
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_04"); //Jesteœ tylko marnym imitatorem Maga.
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_05"); //Ten imitator zaraz wyœlê ciê do Beliara!
    AI_Output (self, other ,"DIA_Jim_TMQ_NEC_03_06"); //Broñ siê gnido!
    AI_Output (other, self ,"DIA_Jim_TMQ_NEC_15_07"); //Do us³ug!
	Wld_InsertNpc				(ZombieTMQ3,"WP_TMQ_ZOM4");
	Wld_InsertNpc				(ZombieTMQ2,"WP_TMQ_ZOM2");
	Wld_InsertNpc				(ZombieTMQ4,"WP_TMQ_ZOM3");
    AI_StopProcessInfos	(hero);
    Npc_SetPermAttitude (STT_40149_Jim, ATT_HOSTILE);
    Npc_SetTarget (STT_40149_Jim, other);
    AI_StartState (STT_40149_Jim, ZS_ATTACK, 1, "");
  
};