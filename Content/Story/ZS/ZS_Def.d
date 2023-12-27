func void ZS_Def()
{	

	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	AI_DrawWeapon (self);

};

func void ZS_Def_loop()
{
//pusto
};

func void ZS_Def_end()
{
       AI_RemoveWeapon (self);

};	


