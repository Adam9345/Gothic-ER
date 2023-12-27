func void B_SetBabeDefaultPerceptions()
{
Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter				);
	
	// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster	 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessFighter				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessFighter				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	ZS_CatchThief 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_ObserveSuspect			);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_ObserveIntruder 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	ZS_ReactToCall				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessEnterRoom			);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob				    );			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_MoveNpc				    );	

	Npc_SetPercTime		(self,	0.5);
	
};

/*
func void B_SetBabeDefaultPerceptions()
{
	Npc_PercEnable( self, PERC_ASSESSTALK		 , B_Babe_RefuseTalk   		);
//	Npc_PercEnable( self, PERC_ASSESSPLAYER		 , B_Babe_AssessPlayer		);		

	Npc_PercEnable( self, PERC_ASSESSDAMAGE		 , ZS_Babe_Flee 		  	);		
	Npc_PercEnable( self, PERC_DRAWWEAPON		 , ZS_Babe_Flee        	  	);
//	Npc_PercEnable( self, PERC_ASSESSMAGIC		 , ZS_Babe_Flee 		  	);

//	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE, ZS_Babe_Flee 			);
//	Npc_PercEnable( self, PERC_ASSESSTHREAT		 , ZS_Babe_Flee 			);	
//	Npc_PercEnable( self, PERC_ASSESSWARN		 , ZS_Babe_Flee 		  	);			
		
//	Npc_PercEnable( self, PERC_OBSERVEINTRUDER	 , B_Babe_ObserveIntruder	);		
//	Npc_PercEnable( self, PERC_OBSERVESUSPECT	 , ZS_Babe_Flee     	  	);		
//	Npc_PercEnable( self, PERC_ASSESSSURPRISE	 , ZS_Babe_Flee     		);	
	
};


*/ 