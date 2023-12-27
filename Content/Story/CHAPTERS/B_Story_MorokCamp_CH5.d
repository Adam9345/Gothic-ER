//#####################################################################
//##
//##							KAPITEL 4
//##							=========
//##	Jackal und die beiden anderen Gardisten vor der Freien
//##	Mine greifen den Spieler jetzt an. 						
//##
//#####################################################################
func void B_Story_MorokCamp_CH5()
{
	//-------- Tagesabläufe austauschen --------
	B_SetPermAttitude	(GRD_7895_Patter,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7894_Morok,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7896_Gardist,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7897_Gardist,	ATT_FRIENDLY);
	B_SetPermAttitude	(GRD_7898_Gardist,	ATT_FRIENDLY);

	Npc_SetTrueGuild	(GRD_7898_Gardist, GIL_NONE);
	Npc_SetTrueGuild	(GRD_7895_Patter,  GIL_NONE);
	Npc_SetTrueGuild	(GRD_7898_Gardist, GIL_NONE);
	Npc_SetTrueGuild	(GRD_7897_Gardist, GIL_NONE);
	Npc_SetTrueGuild	(GRD_7896_Gardist, GIL_NONE);
	Npc_SetTrueGuild	(GRD_7894_Morok,   GIL_NONE);

};
