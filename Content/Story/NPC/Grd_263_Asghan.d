instance GRD_263_Asghan (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Asghan";
	npctype		= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice		=	6;
	id 			=	263;
	flags		= NPC_FLAG_IMMORTAL;	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 15, 1, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_263;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

FUNC VOID Rtn_start_263 ()
{
    TA_Stay				(00,00,12,00,"OM_CAVE3_21");	
	TA_Stay				(12,00,24,00,"OM_CAVE3_21");	
};

FUNC VOID Rtn_opengate_263 ()
{
    TA_Stay				(00,00,12,00,"OM_CAVE3_18");	
	TA_Stay				(12,00,24,00,"OM_CAVE3_18");	
};
