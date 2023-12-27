func void ZS_PracticeBow ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow");
    
	B_SetPerception (self);    	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand 
	if !(Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
/*
	if (Wld_IsFPAvailable (self, "PRACTICEBOW"))
	{
		AI_GotoFP (self,"PRACTICEBOW");	
		AI_AlignToFP( self );				//Richte Dich aus
	};
*/
	AI_AlignToWP (self);//odwracanie siê w strone strza³ki WP
	if (Npc_HasItems (self, ItAmArrow) ==0)
	{
	CreateInvItem (self, ItAmArrow);
	};
	AI_ReadyRangedWeapon(self);
	//Npc_SetToFightMode (self, Npc_GetEquippedRangedWeapon (self));
	AI_PlayAni			(self,"T_BOWWALK_2_BOWAIM");
	AI_PlayAni	(self,"s_BOWAIM");//namierzanie
	AI_Wait(self,2);

};

func void ZS_PracticeBow_Loop ()
{

	AI_PlayAni  (self,"T_BOWRELOAD");//strza³ / ³adowanie

	AI_Wait(self,2);

	AI_PlayAni	(self,"s_BOWAIM");//namierzanie

	var int los_czekania;//d³ugoœc mierzenia do celu
	los_czekania = Hlp_Random(2);

	if (los_czekania == 0) {

		AI_Wait(self,2);

	}else if (los_czekania == 2) {

		AI_Wait(self,4);

	}else if (los_czekania == 1) {

		AI_Wait(self,8);

	};

if Npc_IsInFightMode(self, FMODE_FAR){
	Snd_Play3D  (self, "BOW_FIRE_02");//dŸwiêk wystrza³u zawsze wykonuje sie na POCZATKU funkcji	
};

};

func void ZS_PracticeBow_End ()
{
   	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow_End");
	AI_PlayAni			(self,"T_BOWAIM_2_BOWWALK");
	B_FullStop			(self);
	B_RemoveWeapon		(self);

};
