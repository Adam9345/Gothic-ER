instance GRD_237_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice		=	7;
	id 			=	237;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  2, GRD_ARMOR_H);
        
 	B_Scale (self);
   	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
   B_SetFightSkills(self,70);
			
	//-------- inventory --------
	CreateInvItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
	B_CreateAmbientInv (self);
	
	//------------- ai -------------
	daily_routine	=	Rtn_start_237;
   	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_237 ()
{
	TA_Guard	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_Guard	(06,00,24,00,"SPAWN_PATH_GUARD1");
};
func void rtn_atak_237 ()
{
TA_Guard	(00,00,06,00,"SPAWN_GRD1");
TA_Guard	(06,00,24,00,"SPAWN_GRD1");
};
