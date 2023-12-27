func int Spell_Logic_Teleport_OH(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport_OH");
	
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport		(self, "LOCATION_02_16");
		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
//print ("teleport");
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};