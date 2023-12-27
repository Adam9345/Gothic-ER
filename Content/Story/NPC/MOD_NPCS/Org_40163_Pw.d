instance ORG_40163_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	6;
	id 			=	40163;
	
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
	daily_routine = Rtn_start_40163;
};

FUNC VOID Rtn_start_40163 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_ADD_PZ_01");
	TA_Stand (13,00,00,00, "WP_ADD_PZ_01");
};


instance ORG_40164_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_MEATBUG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40164;
	
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
	daily_routine = Rtn_start_40164;
};

FUNC VOID Rtn_start_40164 ()	//FM
{
	TA_LEAN (0,00,13,00,  "WP_ADD_PZ_02");
	TA_LEAN (13,00,00,00, "WP_ADD_PZ_02");
};

instance ORG_40165_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	10;
	id 			=	40165;
	
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
	daily_routine = Rtn_start_40165;
};

FUNC VOID Rtn_start_40165 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_ADD_PZ_03");
	TA_Stand (13,00,00,00, "WP_ADD_PZ_03");
};

instance ORG_40166_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Robuer;
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	7;
	id 			=	40166;
	
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",16 ,  4, ORG_ARMOR_L);
        
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
	daily_routine = Rtn_start_40166;
};

FUNC VOID Rtn_start_40166 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_ADD_PZ_04");
	TA_Stand (13,00,00,00, "WP_ADD_PZ_04");
};

instance SLD_40167_Najemnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ranny najemnik";
	guild 		=	GIL_SLD;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40167;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 350;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  4, SLD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,6);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_03_Z);
//	B_CreateAmbientInv (self);
	//EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40167;
};

FUNC VOID Rtn_start_40167 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_ADD_PZ_05");
	TA_Stand (13,00,00,00, "WP_ADD_PZ_05");
};
FUNC VOID Rtn_EndPW_40167 ()	//FM
{
	TA_Stand (0,00,13,00,  "WP_KRZYKACZ_CH4");
	TA_Stand (13,00,00,00, "WP_KRZYKACZ_CH4");
};
