func int Spell_Logic_Teleport_BC(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport_OH");
	
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport		(self, "BC_TELEPORT");
		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
//print ("teleport");
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};