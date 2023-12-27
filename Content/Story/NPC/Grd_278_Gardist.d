instance GRD_278_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_gardist;
	npctype		= 	NPCTYPE_main;
	guild 		=	GIL_NONE;
	level 		=	10;
	voice 		=	13;
	id 			=	278;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 12,  2, GRD_ARMOR_L);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);	
	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_278;
};

FUNC VOID Rtn_start_278 ()
{
	TA_GuardPalisade		(20,00,07,00,"WP_STRAZ_CESAR");
	TA_GuardPalisade		(07,00,20,00,"WP_STRAZ_CESAR");
};

FUNC VOID Rtn_piwo_278 ()
{
	TA_GuardPalisade		(20,00,07,00,"OM_CAVE1_81");
	TA_GuardPalisade		(07,00,20,00,"OM_CAVE1_81");
};



