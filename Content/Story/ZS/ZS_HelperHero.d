
//////////////////////////////////////////////////////////////////////////
//	B_Helper_AssessPlayer
//	======================
//	Checkt während dem Laufen die Distanz zum Spieler.
//////////////////////////////////////////////////////////////////////////
func void B_Helper_AssessPlayer ()
{
	PrintDebugNpc		(PD_TA_CHECK,	"B_Helper_AssessPlayer");
	PrintGlobals		(PD_TA_CHECK);
	
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...Spieler zu weit entfernt!");
		B_FullStop		(self);
		B_SmartTurnToNpc(self,	hero);
	}
	else if (Npc_CanSeeNpc(self, hero))
	{
		B_AssessSC();
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_Helper_AssessCall
//	====================
//	Spielt einfach eine Heran-Wink-Animation ab.
//////////////////////////////////////////////////////////////////////////
func void B_Helper_AssessCall ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_Helper_AssessCall");		

	AI_TurnToNpc		(self,	other);
	AI_GotoNpc(other,self);
	//AI_PlayAni			(self,	"T_COMEOVERHERE");
};

//////////////////////////////////////////////////////////////////////////
//	ZS_Helper
//	==========
//	Ein TA-Zustand, der zum angegebenen Waypoint geht, aber auf den SC
//	wartet, falls dieser zu weit zurückfällt.
//////////////////////////////////////////////////////////////////////////
func void ZS_Helper ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Helper");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_Helper_AssessPlayer		);
	Npc_SetPercTime		(self,	1);
	self.senses_range	 = HAI_DIST_ASSESS_MONSTER;
	self.senses			 = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	
	// Wahrnehmungen passiv
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 					);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_Helper_AssessCall		);
};

func int ZS_Helper_Loop ()
{	
	PrintDebugNpc		(PD_TA_LOOP,	"ZS_Helper_Loop");
	PrintGlobals		(PD_TA_CHECK);

	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		B_Helper_AssessPlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_StopLookAt	(self);
		AI_GotoWP		(self,	self.wp);
	}
	
	//-------- Ziel erreicht ! --------
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	if (Npc_GetNextTarget(self)) 
	{ 
	var C_NPC Enemy1;	
       //-------- neues Ziel entdeckt ! -------- 

       PrintDebugNpc        (PD_MST_CHECK,    "...neuer Gegner gefunden"); 
       Npc_SetTarget        (self,Enemy1);     
       Npc_ClearAIQueue    (self); 
     //  AI_StartState        (self,ZS_Attack, 0, ""); 
	//print ("namierzanie");
	if (Hlp_GetInstanceID(Enemy1)==Hlp_GetInstanceID(ORG_810_Organisator)) || (Hlp_GetInstanceID(Enemy1)==Hlp_GetInstanceID(ORG_807_Organisator)) || (Hlp_GetInstanceID(Enemy1)==Hlp_GetInstanceID(ORG_828_Bruce))// (Enemy1.guild == GIL_ORG) //
	{
	//print ("Atak na NPC");
		Npc_SetTarget        (self,Enemy1); 
		AI_StartState (self,ZS_Attack,0,"");
	};
	};
	
		AI_Wait				(self,	1);		
	return				LOOP_CONTINUE;
};
	
func int ZS_Helper_End ()
{	
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Helper_End");

	//-------- aktive Wahrnehmungen wieder auf Default zurückstellen -------
	self.senses_range	 = hero.senses_range;
	self.senses			 = hero.senses;
};
/*
func void ZS_HelperHero ()
{


};*/