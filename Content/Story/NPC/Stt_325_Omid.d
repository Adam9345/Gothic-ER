instance STT_325_Omid (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Omid";
	npctype 	=		NPCTYPE_FRIEND;
	guild 		=		GIL_VLK;
	level 		=		30;
	
	
	voice 		=		2;
	id 			=		325;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA]		 		=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"Hum_Body_CookSmith", 	0, 		1,		"Hum_Head_Psionic", 16,			1,			-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
   // self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

B_SetFightSkills(self,30);
	//-------- inventory --------
	
//	EquipItem	(self, ItMw_1H_Sword_Short_02);
	
	
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_325;
};

FUNC VOID Rtn_start_325 ()
{
	TA_Cook		(08,05,18,05,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(18,05,08,05,"OCC_KITCHEN");
};

FUNC VOID Rtn_TMQOCC_325 ()
{
	TA_StandAround		(08,05,18,05,"OCC_CHAPEL_LEFT_STAIRCASE_BOTTOM");
	TA_StandAround		(18,05,08,05,"OCC_CHAPEL_LEFT_STAIRCASE_BOTTOM");
};

