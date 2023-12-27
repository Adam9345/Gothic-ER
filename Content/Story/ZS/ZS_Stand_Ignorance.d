func void ZS_Stand_Ignorance()
{
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowPC_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	//Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	//Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);	

	//Npc_PercDisable    	(self,	PERC_ASSESSENEMY);
	Npc_PercDisable   	(self,	PERC_ASSESSMURDER);
 	Npc_PercDisable   	(self,  PERC_ASSESSFIGHTSOUND);
                                                            
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_Stand"))
	{																	
		AI_GotoFP (self, "FP_Stand");
		AI_AlignToFP (self);
	}
	else
	{
		AI_AlignToWP	(self);
	};
	
    AI_PlayAni (self,"T_Stand_Ignorance_2_LGUARD");
};

func void ZS_Stand_Ignorance_loop()
{
	var int zufall;
	zufall = Hlp_Random(100);
	
	if (zufall >= 95)
	{
		//AI_PlayAni (self,"T_LGUARD_2_Stand_Ignorance");
		//AI_PlayAni (self,"T_Stand_Ignorance_2_LGUARD");
	}
	else if (zufall >= 90)
	{
		AI_PlayAni (self,"T_LGUARD_SCRATCH");
	}
	else if (zufall >= 80)
	{
		AI_PlayAni (self,"T_LGUARD_STRETCH");
	}
	else if (zufall >= 70)
	{
		AI_PlayAni (self,"T_LGUARD_CHANGELEG");
	}
	//nowe
	else if (zufall >= 60)
	{
		AI_PlayAni (self,"T_BORINGKICK");
	}
	else if (zufall >= 50)
	{
		AI_PlayAni (self,"R_SCRATCHEGG");
	}
	else if (zufall >= 40)
	{
		AI_PlayAni (self,"R_SCRATCHHEAD");
	};
	
	AI_Wait		(self, 1);
};

func void ZS_Stand_Ignorance_end()
{
	AI_PlayAni (self,"T_LGUARD_2_Stand");	
};
