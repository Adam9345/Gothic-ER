//////////////////////////////////////////////////////////////////////////
//	ZS_Stay
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////

	
	
	func void ZS_Lean ()
{
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	
	if !(Npc_IsOnFP(self,"LEAN"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};			
	if (Wld_IsFPAvailable (self, "LEAN"))
	{
		AI_GotoFP (self,"LEAN");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	
};

func void ZS_Lean_Loop ()
{
   PrintDebugNpc(PD_TA_LOOP,"ZS_PickRice_Loop");
	
	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(2)))
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if (Npc_IsOnFP(self,"LEAN")) && (Wld_IsFPAvailable (self, "LEAN"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP (self, "LEAN");
			AI_PlayAni (self,"S_LEAN");
			
			Npc_SetStateTime (self,0);
		};

		AI_SetWalkmode (self,NPC_WALK);
	}	
	
	if (!Npc_IsOnFP(self,"LEAN") && Wld_IsFPAvailable (self, "LEAN"))
	{
	    AI_GotoFP (self, "LEAN");
	};
	AI_Wait(self,1);
};

func void ZS_Lean_End ()
{
	AI_PlayAni			(self,	"T_LEAN_2_STAND");
	self.senses	=			hero.senses;
	
	C_StopLookAt			(self);
};
	
	
	
	
	
	
	
/*
func void ZS_Lean ()
{
	AI_PlayAni			(self,	"T_STAND_2_LEAN");
	
	//-------- Wahrnehmungen --------
	B_SetPerception			(self);
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Vorbereitungen --------
	if (Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkmode			(self,	NPC_RUN);
	}
	else
	{
		AI_SetWalkmode			(self,	NPC_WALK);
	};
	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func void ZS_Lean_Loop ()
{
	AI_PlayAni			(self,	"S_LEAN");
	
	AI_Wait					(self,	1);
};

func void ZS_Lean_End ()
{
	AI_PlayAni			(self,	"T_LEAN_2_STAND");
	self.senses	=			hero.senses;
	
	C_StopLookAt			(self);
};
*/