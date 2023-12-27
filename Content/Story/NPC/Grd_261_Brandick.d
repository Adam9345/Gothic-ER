instance GRD_261_Brandick (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Brandick";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	261;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_261;
	
	

};

FUNC VOID Rtn_start_261 ()
{
    TA_Guard	    (00,00,12,00,"OM_052");	
	TA_Guard    	(12,00,00,00,"OM_052");
};

FUNC VOID Rtn_Watch_261 ()
{
	TA_Guard	    (00,00,12,00,"OM_055");	
	TA_Guard    	(12,00,00,00,"OM_055");
};

FUNC VOID Rtn_FMTAKEN_261 ()
{
    TA_StayNeutral	    (00,00,12,00,"OC1");	
	TA_StayNeutral    	(12,00,00,00,"OC1");
};

FUNC VOID Rtn_FMTAKEN2_261 ()
{
    TA_Stand	    (00,00,12,00,"OC1");	
	TA_Stand    	(12,00,00,00,"OC1");
};