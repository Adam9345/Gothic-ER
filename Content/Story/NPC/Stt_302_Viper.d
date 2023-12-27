instance STT_302_Viper (Npc_Default)
{
	//-------- primary data --------
	name 		=		"W¹¿";
	npctype 	=	        NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		7;
	
	voice 		=		11;
	id 			=		302;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh     ,bdytex,skin,			head mesh     ,headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 	1,			"Hum_Head_Pony", 		58,  	1, 		-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
B_SetFightSkills(self,30);
	Npc_SetTalentSkill	(self,NPC_TALENT_SNEAK,	1);			
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 		
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 		
	
	//-------- inventory --------
	
	CreateInvItems (self,ItMinugget,750);
	CreateInvItem  (self,ItMw_1H_Sword_Short_04);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_302;
};

FUNC VOID Rtn_start_302 () 
{

    TA_MineBellows	(08,00,18,00,"OM_CAVE1_82");  
	TA_MineBellows	(18,00,08,00,"OM_CAVE1_82"); 
	
};
FUNC VOID Rtn_cave_302 () 
{
    TA_Stand	(08,00,18,00,"LOCATION_15_IN_2");  
	TA_Smoke	(18,00,08,00,"LOCATION_15_IN_2"); 
	
};

