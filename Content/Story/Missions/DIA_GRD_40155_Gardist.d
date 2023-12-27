// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gardist_HELLO1v (C_INFO)
{
   npc          = GRD_40155_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_HELLO1v_Condition;
   information  = DIA_Gardist_HELLO1v_Info;
   permanent	= FALSE;
   important = TRUE;
};

FUNC INT DIA_Gardist_HELLO1v_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Balam_Velaya))
{
    return TRUE;
};
};
FUNC VOID DIA_Gardist_HELLO1v_Info()
{
    AI_Output (self, other ,"DIA_Gardist_HELLO1v_03_01"); //O to ten dupek! 
    AI_Output (other, self ,"DIA_Gardist_HELLO1v_15_02"); //Zostawcie j¹ w spokoju!
    AI_Output (self, other ,"DIA_Gardist_HELLO1v_03_03"); //Haha pora siê wyluzowaæ w te niespokojne czasy.
    AI_Output (self, other ,"DIA_Gardist_HELLO1v_03_04"); //Kilka flaszek i naga panienka. Nie ma lepszego sposobu!
    AI_Output (other, self ,"DIA_Gardist_HELLO1v_15_05"); //Precz.
    AI_Output (self, other ,"DIA_Gardist_HELLO1v_03_06"); //No ch³opaki. Mamy dodatkow¹ rozrywkê oprócz napitku i kobiety mamy jeszcze tego œmiecia do ubicia.
    AI_Output (other, self ,"DIA_Gardist_HELLO1v_15_07"); //Pozdrówcie ode mnie Beliara.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
	Npc_SetPermAttitude (GRD_40156_Gardist, ATT_HOSTILE);
	Npc_SetPermAttitude (GRD_40158_Gardist, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};

