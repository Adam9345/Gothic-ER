instance STT_2077_Jim (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Jim";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		10;
	flags		=       NPC_FLAG_IMMORTAL;
	
	voice 		=		12;
	id 			=		2077;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		60;
	attribute[ATR_MANA] 			=		60;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MAGE; 
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
	Npc_SetTalentSkill ( self, NPC_TALENT_MAGE,3);	
	//-------- inventory --------
	EquipItem		(self, Miecz1H14);
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2077;
};

FUNC VOID Rtn_start_2077 ()
{
	TA_ReadBook		(23,00,07,30,"OCC_CHAPEL_LEFT_STAIRCASE_BOTTOM");
	TA_SitAround	(07,30,11,00,"NOV_OC");
	TA_Stand		(11,00,17,00,"NOV_OC");
	TA_PracticeMagic	(17,00,23,00,"NOV_OC");	
};

FUNC VOID Rtn_away_2077 ()
{
	TA_PlayTune			(23,00,07,30,"OW_HUN_TOM_JIM_CH4");
	TA_Smoke			(07,30,11,00,"OW_HUN_TOM_JIM_CH4");
	TA_Stand			(11,00,17,00,"OW_HUN_TOM_JIM_CH4");
	TA_PracticeMagic	(17,00,23,00,"OW_HUN_TOM_JIM_CH4");	
};

FUNC VOID Rtn_CH4_2077 ()
{
	TA_ReadBook			(23,00,07,30,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_Smoke			(07,30,11,00,"OCC_CHAPEL_LEFT_ROOM");
	TA_Stand			(11,00,17,00,"OCC_CHAPEL_LEFT_ROOM");
	TA_PracticeMagic	(17,00,23,00,"OCC_CHAPEL_UPSTAIRS");	
};
FUNC VOID Rtn_TMQ_2077 ()
{ 
	TA_Smoke		    (20,30,23,30,"WP_KRZYKACZ_CH4");
	TA_Smoke	     	(23,30,02,30,"WP_KRZYKACZ_CH4");
	TA_Smoke			(02,30,08,00,"WP_KRZYKACZ_CH4");
	TA_Smoke			(08,00,20,30,"WP_KRZYKACZ_CH4");  //auf Stand-FP
};
instance STT_40149_Jim (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Jim";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_NONE;
	level 		=		10;
	//flags		=       NPC_FLAG_IMMORTAL;
	
	voice 		=		12;
	id 			=		40149;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		80;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		1000;
	attribute[ATR_MANA] 			=		1000;
	attribute[ATR_HITPOINTS_MAX] 	=		800;
	attribute[ATR_HITPOINTS] 		=		800;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, KDF_ARMOR_L);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MAGE; 
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
	Npc_SetTalentSkill ( self, NPC_TALENT_MAGE,3);	
	//-------- inventory --------
	EquipItem		(self, ItMw_2H_Staff_FireMage_05);
	CreateInvItems (self, ItArScrollIceWave,1);
	EquipItem     (self, ItArRuneBreathOfDeath);
	CreateInvItems (self, ItArScrollFirestorm,4);
	CreateInvItems (self, ItWr_BetweenWorlds,1);
	

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40149;
};

FUNC VOID Rtn_start_40149 ()
{
	TA_SitAround		(23,00,07,30,"WP_TMQJIM_SIT");
	TA_SitAround	    (07,30,11,00,"WP_TMQJIM_SIT");
};
