instance GRD_238_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype 	=	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	238;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;



	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 14,  2, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_02);
	CreateInvItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine	=	Rtn_start_238;
   	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_238 ()
{
	TA_Guard	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_Guard	(06,00,24,00,"SPAWN_PATH_GUARD1");
};
