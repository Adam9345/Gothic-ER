instance GRD_40155_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_ORG;
	level 		=	10;
	voice 		=	7;
	id 			=	40155;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 95;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 660;
	attribute[ATR_HITPOINTS] 	= 660;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, GRD_ARMOR_H);

	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40155;
};

FUNC VOID Rtn_start_40155 ()
{
    TA_StandAround      	  (07,30,20,00,"SERAFIA_GOMEZ");	//2/3
    TA_StandAround		      (20,00,00,00,"SERAFIA_GOMEZ"); //CF1
    TA_StandAround            (00,00,07,30,"SERAFIA_GOMEZ");
};


