/*****************************************
* NSC sucht PLAYTUNE-FP und spielt Laute *
*****************************************/

FUNC VOID ZS_PlayTune()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PlayTune");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);
	if !(Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

FUNC VOID ZS_PlayTune_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_PlayTune_Loop");
	
	if (Npc_HasItems (self,ItMiLute) == 0)
	{
		CreateInvItem ( self, ItMiLute);
	};	
	if !(Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoFp (self,"PLAYTUNE");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	if (!C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		AI_UseItemToState 	(self,ItMiLute,100);
	};
};

FUNC VOID ZS_PlayTune_End() 
{ 
	AI_UseItemToState 	(self,ItMiLute,-1);
	var int liczba_lutni;
	liczba_lutni = Npc_hasitems (self, ItMiLute);
	Npc_RemoveInvItems (self, ItMiLute,liczba_lutni - 1);
	PrintDebugNpc(PD_TA_FRAME,"ZS_PlayTune_End");
};

