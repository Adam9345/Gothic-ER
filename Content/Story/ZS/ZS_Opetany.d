//////////////////////////////////////////////////////////////////////////
//	ZS_Stay
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_Opetany ()
{

	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
};

func void ZS_Opetany_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_Opetany_Loop");
	var int zufall2;
	zufall2 = Hlp_Random(100);
	
	if (zufall2 >= 95)
	{
		//AI_PlayAni (self,"T_LGUARD_2_STAND");
		//AI_PlayAni (self,"T_STAND_2_LGUARD");
	}
	else if (zufall2 >= 90)
	{
		AI_PlayAni (self,"T_LGUARD_SCRATCH");
	}
	else if (zufall2 >= 80)
	{
		AI_PlayAni (self,"T_LGUARD_STRETCH");
	}
	else if (zufall2 >= 70)
	{
		AI_PlayAni (self,"T_LGUARD_CHANGELEG");
		}
		else if (zufall2 >= 50)
	{
		    AI_PlayAni (self, "T_SEARCH");
			}
		else if (zufall2 >= 40)
	{
		   AI_PlayAni (self,"T_LGUARD_CHANGELEG");
			}
		else if (zufall2 >= 30)
	{
		     AI_PlayAni (self, "T_SEARCH");
		   
	};
	
   

	
	AI_Wait					(self,	1);
};

func void ZS_Opetany_End ()
{
	AI_PlayAni (self,"T_LGUARD_2_STAND");	
};
