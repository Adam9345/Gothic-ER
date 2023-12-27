instance GRD_40156_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_ORG;
	level 		=	15;
	voice 		=	6;
	id 			=	40156;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 620;
	attribute[ATR_HITPOINTS] 	= 620;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40156;
};

FUNC VOID Rtn_start_40156 ()
{
	TA_Stand		(23,30,08,30,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_BACK");
	TA_Stand	(08,30,23,30,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_BACK");	
};
