instance GRD_208_Cutter (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Siekacz";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	8;
	id 			=	208;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 150;
	attribute[ATR_DEXTERITY] 	= 150;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0 , 0,"Hum_Head_Bald", 3, 1, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_208;
};

FUNC VOID Rtn_start_208 ()
{
	TA_Sleep		(23,35,08,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Smalltalk	(08,35,23,35,"OCC_MERCS_ENTRANCE");	
};

FUNC VOID Rtn_OT_208 ()
{
	TA_Guard	(07,00,20,00,"OCC_MERCS_ENTRANCE");
	TA_Guard	(20,00,07,00,"OCC_MERCS_ENTRANCE");
};

FUNC VOID Rtn_bramus_208 ()
{
	TA_FollowPC 	(07,00,20,00,"SPAWN_TOTURIAL_CHICKEN_2_2");
	TA_FollowPC	    (20,00,07,00,"SPAWN_TOTURIAL_CHICKEN_2_2");
};
FUNC VOID Rtn_OC1_208 ()
{
	TA_Guard	(07,00,20,00,"OC1");
	TA_Guard	(20,00,07,00,"OC1");
};

FUNC VOID Rtn_BLA_208 ()
{
	TA_Guard	(07,00,20,00,"WP_SIEKACZ_BLA");
	TA_Guard	(20,00,07,00,"WP_SIEKACZ_BLA");
};

