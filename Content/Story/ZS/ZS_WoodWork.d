/*******************************************
*            NSC benutzt Blubber           *
*  wenn keine Blubber da, raucht er Joint  *
*******************************************/

func void ZS_WoodWork ()
{
	B_SetPerception (self); 	
	AI_SetWalkmode 	(self,NPC_WALK);
	CreateInvItem (self,ItMi_Saw);
	
};


func int ZS_WoodWork_Loop ()
{
AI_PLAYANI (SELF, "Hum_Saegen_A01.asc");
};

func void ZS_WoodWork_End ()
{
AI_UseItemToState (self,ItMi_Saw,-1);
};

