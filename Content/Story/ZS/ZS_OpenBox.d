/************************************************
*              NSC benutzt Bett,                *
* wenn kein Bett da, macht der ZS_StandAround   *
*************************************************/

func void ZS_OpenBox()
{
	B_SetPerception		(self);    
	AI_SetWalkmode 		(self,	NPC_WALK);
	if (!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		if (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)== 0)
        	{
			AI_GotoWP	(self, self.wp);
		};
	};
	//PrintScreen     ("START", 10,30,"font_old_10_white.tga",3);
	AI_StartState		(self, ZS_Open_Chest, 1, "");
};		
		
func void ZS_Open_Chest()		
{

	GuardPerception		();

	if (Wld_IsMobAvailable (self,"CHEST"))
	{

		//PrintScreen     ("Jest", 10,40,"font_old_10_white.tga",3);
		AI_UseMob		(self,	"Chest",1);
	}else{
		//PrintScreen     ("Nie ma", 10,40,"font_old_10_white.tga",3);
		AI_StartState	(self, ZS_StandAround, 1, "");
	};

};

func int ZS_Open_Chest_Loop()
{
	if	!C_BodyStateContains(self,BS_MOBINTERACT)
	&&	(Npc_GetStateTime(self) > 300)
	{
		AI_StartState	(self, ZS_SitAround, 1, "");
	};	
	
	AI_Wait				(self, 1);
	return				LOOP_CONTINUE;
};

func void ZS_Open_Chest_End()
{
	AI_UseMob			(self,"Chest",-1);
};
	