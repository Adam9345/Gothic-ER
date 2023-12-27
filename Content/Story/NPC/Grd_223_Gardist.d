instance GRD_223_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	223;
	
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
    B_SetFightSkills(self,40);	
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_223;
};

FUNC VOID Rtn_start_223 ()
{
	TA_GuardPalisade(06,00,23,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");	
	TA_GuardPalisade(23,00,06,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");	
};

FUNC VOID Rtn_OT_223 ()
{
	TA_Guard	(07,00,12,00,"OCC_BARONS_UPSTAIRS_PROMENADE_RIGHT_CORNER");
	TA_Guard	(12,00,19,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_DOOR");
	TA_Guard	(19,00,07,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_CORNER");
};