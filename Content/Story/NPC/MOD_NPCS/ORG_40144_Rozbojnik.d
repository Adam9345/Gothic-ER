instance ORG_40144_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40144;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 0,  1, ORG_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_01_Z);
//	B_CreateAmbientInv (self);
	//EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40144;
};

FUNC VOID Rtn_start_40144 ()	//FM
{
	TA_Stand (0,00,13,00,  "OW_PATH_256");
	TA_Stand (13,00,00,00, "OW_PATH_256");
};


instance ORG_40145_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_MEATBUG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40145;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 151,  1, ORG_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z );
//	B_CreateAmbientInv (self);
	//EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40145;
};

FUNC VOID Rtn_start_40145 ()	//FM
{
	TA_LEAN (0,00,13,00,  "WP_ZND_ROZ1");
	TA_LEAN (13,00,00,00, "WP_ZND_ROZ1");
};

instance ORG_40146_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40146;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 150,  1, ORG_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_01_Z);
//	B_CreateAmbientInv (self);
	//EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40146;
};

FUNC VOID Rtn_start_40146 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_ZND_ROZ2");
	TA_Stand (13,00,00,00, "WP_ZND_ROZ2");
};
