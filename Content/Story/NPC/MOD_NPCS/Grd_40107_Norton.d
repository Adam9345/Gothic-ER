instance Grd_40107_Norton (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Norton";
	npctype		= 	NPCTYPE_main;
	guild 		=	GIL_GRD;
	level 		=	30;
	voice 		=	13;
	id 			=	40107;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 460;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_L);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03_Old);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40107;
};

FUNC VOID Rtn_start_40107 ()
{
    TA_Guard	(08,00,20,00,"WP_NORTON");	
	TA_Guard	(20,00,08,00,"WP_NORTON");
};



