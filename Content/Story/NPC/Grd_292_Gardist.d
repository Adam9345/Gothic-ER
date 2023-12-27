instance GRD_292_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	npctype_guard;
	level 		=	20;
	voice		=	6;
	id 			=	292;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  1, GRD_ARMOR_H);
        
	B_Scale (self);
   	Mdl_SetModelFatness(self,0);
    	
   	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem		(self, ItMw_1H_Sword_03);
B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_292;
};

FUNC VOID Rtn_FMstart_292 ()	//FM
{
	TA_Guard (0,00,13,00,  "FM_03");
	TA_Guard (13,00,00,00, "FM_03");
};


