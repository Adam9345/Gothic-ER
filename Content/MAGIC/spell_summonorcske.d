func int Spell_Logic_SummonOrcSke(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_SummonOrcSkeleton");
	
	if (manaInvested >= SPL_SENDCAST_SUMMONDEMON) 	
	{ 
	//	print ("inwestuje mana");
		if (Npc_IsPlayer(self))
	    {
	    	Wld_SpawnNpcRange	(self,	SummonbyPCOrcSkeleton,			2,	500);
			Wld_SpawnNpcRange	(self,	SummonbyPCOrcSkeleton,			1,	500);
			//print ("spawnuje orkow przyjaznych graczowi");
		}
		else
		{
	    	Wld_SpawnNpcRange	(self,	SummonOrcSkeleton,			2,	500);
			Wld_SpawnNpcRange	(self,	SummonOrcSkeleton,			1,	500);
		};
		
		return SPL_SENDCAST; 
	}
	else
	{
		return SPL_NEXTLEVEL;	
	};
};