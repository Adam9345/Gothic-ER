instance Grd_40076_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_ORCSCOUT;
	level 		=	50;
	voice 		=	13;
	id 			=	40076;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 125;
	attribute[ATR_DEXTERITY] 	= 95;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 640;
	attribute[ATR_HITPOINTS] 	= 640;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40076;
};

FUNC VOID Rtn_start_40076 ()
{
	//siedzi na ziemi
    TA_PickRice	(00,00,12,00,"GHOST_OLDBANDIT");
    TA_PickRice	(12,00,00,00,"GHOST_OLDBANDIT"); 
};
