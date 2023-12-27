//#####################################################################
//##
//##							KAPITEL 4|5
//##							=========
//##	
//##						
//##
//#####################################################################
func void B_Story_MorokCamp_CH5_ATT()
{
	//-------- Tagesabläufe austauschen --------
	B_SetPermAttitude	(GRD_7895_Patter,	ATT_NEUTRAL);
	B_SetPermAttitude	(GRD_7894_Morok,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_7896_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_7897_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_7898_Gardist,	ATT_HOSTILE);

	//Npc_SetTrueGuild	(GRD_7894_Morok, GIL_GOBBO);

};
