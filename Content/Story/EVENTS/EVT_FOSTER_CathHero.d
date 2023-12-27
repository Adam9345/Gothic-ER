var int FosterCathing_Hero;

FUNC VOID EVT_FOSTER_CathHero_01_S1()
{


AI_Teleport(BAU_924_Foster,"NC_PATH_PEASANT");
Npc_ExchangeRoutine(BAU_924_Foster,"Robber");
FosterCathing_Hero = TRUE;

};

