instance STT_40066_Robin (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Robin";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		10;
	flags		=       NPC_FLAG_IMMORTAL;
	
	voice 		=		12;
	id 			=		40066;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		60;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		120;
	attribute[ATR_MANA] 			=		120;
	attribute[ATR_HITPOINTS_MAX] 	=		300;
	attribute[ATR_HITPOINTS] 		=		300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 113,  1, STT_ARMOR_M);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
		
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Sword_Short_04_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40066;
};

FUNC VOID Rtn_start_40066 ()
{
	TA_Boss		    (04,00,12,00,"WP_ROBIN_MINE");
    TA_StandAround	(12,00,20,00,"OM_CAVE1_55");  
	TA_StandDrunk	    (20,00,01,00,"OM_CAVE1_51");
	TA_StandAround	(01,00,04,00,"OM_CAVE1_47_IAN");
	
	
	
};

FUNC VOID Rtn_Kopiec_40066 ()
{
	
	TA_GuidePC		(11,00,17,00,"OM_CAVE1_20");
	TA_GuidePC	    (17,00,23,00,"OM_CAVE1_20");	
};



