
func void zs_die()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Die");
	if(self.aivar[AIV_INVINCIBLE] == TRUE)
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC spricht ");
		AI_ContinueRoutine(self);
		return;
	};
	C_ZSInit();
};

func int zs_die_loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Die_Loop");
	if(self.aivar[AIV_INVINCIBLE] == FALSE)
	{
		PrintDebugNpc(PD_ZS_Check,"...Dialog zuende !");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_die_end()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk_End");
	B_KillNpc(self);
};

