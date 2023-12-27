//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Cadar
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Cadar()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Cadar");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Cadar_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Cadar_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         
	
/*	B_Say		( self, NULL, "$KazanieCadar1");
	B_Say		( self, NULL, "$KazanieCadar2");
	B_Say		( self, NULL, "$KazanieCadar3");
	B_Say		( self, NULL, "$KazanieCadar4");
	B_Say		( self, NULL, "$KazanieCadar5");
	B_Say		( self, NULL, "$KazanieCadar6");
	B_Say		( self, NULL, "$KazanieCadar7");
	B_Say		( self, NULL, "$KazanieCadar8");
	B_Say		( self, NULL, "$KazanieCadar9");*/
};


func void ZS_Teaching_Cadar_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Cadar_End");
};
