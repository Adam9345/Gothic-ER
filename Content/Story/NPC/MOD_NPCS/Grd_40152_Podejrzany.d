instance ORG_40152_Podejrzany (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Zamachowiec";
	npctype		=	NPCTYPE_Main;
	guild 		=	GIL_NONE;
	level 		=	10;
	voice 		=	7;
	id 			=	40152;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 105;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 560;
	attribute[ATR_HITPOINTS] 	= 560;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, ORG_ARMOR_M);

	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 20);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40152;
};

FUNC VOID Rtn_start_40152 ()
{
    TA_StandAround	       (07,30,20,00,"SPAWN_GRD999");	//2/3
    TA_StandAround	    	(20,00,00,00,"SPAWN_GRD999"); //CF1
    TA_StandAround            (00,00,07,30,"SPAWN_GRD999");
};


