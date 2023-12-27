FUNC VOID EVT_JORU_ROU_01_S1()
{
if (ZW_JORU_ROUTINE  == FALSE)
	{
	
		AI_GotoWP(Nov_1305_Joru, "PSI_14_HUT_IN");
		Npc_ExchangeRoutine (NOV_1305_Joru, "start");
		ZW_JORU_ROUTINE = TRUE;
	    
	
	};
    
};

