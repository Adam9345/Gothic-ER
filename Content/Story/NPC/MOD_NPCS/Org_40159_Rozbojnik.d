instance Org_40159_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rozbójnik";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_ORG;
	level 		=	43;
	voice 		=	13;
	id 			=	40159;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 55;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, ORG_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_04_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40159;
};

FUNC VOID Rtn_start_40159 ()
{
	//siedzi na ziemiSPAWN_GRD4
    TA_Stand	(00,00,12,00,"NC_PATH_PEASANT");
    TA_Stand	(12,00,00,00,"NC_PATH_PEASANT"); 
};

FUNC VOID Rtn_standpz_40159 ()
{
	//siedzi na ziemiSPAWN_GRD4
    TA_Stand	(00,00,12,00,"RUBEN_FRIEND1");
    TA_Stand	(12,00,00,00,"RUBEN_FRIEND1"); 
};

FUNC VOID Rtn_GuidePZ_40159 ()
{
	//siedzi na ziemi
    TA_GuidePC	(00,00,12,00,"RUBEN_FRIEND1");
    TA_GuidePC	(12,00,00,00,"RUBEN_FRIEND1"); 
};
instance Org_40161_Rozbojnik (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rozbójnik";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_ORG;
	level 		=	30;
	voice 		=	13;
	id 			=	40161;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 95;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 4,  1,ORG_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,7);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03_Old);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40161;
};

FUNC VOID Rtn_start_40161 ()
{
	//siedzi na ziemi
    TA_Stand	(00,00,12,00,"RUBEN_FRIEND2");
    TA_Stand	(12,00,00,00,"RUBEN_FRIEND2"); 
};
