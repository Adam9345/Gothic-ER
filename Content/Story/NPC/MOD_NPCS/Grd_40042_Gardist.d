instance GRD_40042_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kusznik";
	npctype 	=	NPCTYPE_main;
	guild 		=	GIL_GOBBO;
	level 		=	15;
	voice 		=	6;
	id 			=	40042;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 460;


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
	//-------- inventory --------
	
    EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);	
	EquipItem	(self, ItRw_Crossbow_04_Z);	
	
	B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_startS_40042;
};

FUNC VOID Rtn_startS_40042 ()
{
    TA_Guard	(08,00,18,00,"WP_ATTACKNC10");  
	TA_Guard	(18,00,08,00,"WP_ATTACKNC10");
};
