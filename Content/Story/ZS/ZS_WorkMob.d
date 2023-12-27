/************************************************
*              Rutyna u¿ywania MOBÓW,                *
* 				by gothic1210  *
*************************************************/

func void ZS_WorkMob()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_WorkMob");
	
	B_SetPerception		(self);    
	AI_SetWalkmode 		(self,	NPC_WALK);

	AI_UseMob(self,"BAUMSAEGE",1);
};		

func int ZS_WorkMob_Loop()
{
	AI_Wait				(self, 1);
	return				LOOP_CONTINUE;
};

func void ZS_WorkMOB_End()
{
	PrintDebugNpc 		(PD_TA_FRAME,"ZS_WorkMob_End");
	AI_UseMob			(self,"BAUMSAEGE",-1);
};

	