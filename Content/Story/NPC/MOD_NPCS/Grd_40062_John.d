instance Grd_40062_John (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"John";
	npctype		= 	npctype_main;
	guild 		=	GIL_ORG;
	level 		=	40;
	voice 		=	13;
	id 			=	40062;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 1000;
	attribute[ATR_MANA] 		= 1000;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40062;
};

FUNC VOID Rtn_start_40062 ()
{

    TA_SitAround	(00,00,12,00,"WP_JOHN_START");
    TA_SitAround	(12,00,00,00,"WP_JOHN_START"); 
};

FUNC VOID Rtn_fight_40062 ()
{
	TA_STAND (16,00,23,30,"OCR_ARENA_BUY");
	TA_STAND (23,00,16,30,"OCR_ARENA_BUY");
};
FUNC VOID Rtn_Arena_40062 ()
{
	TA_Guidepc (16,00,23,30,"OCR_ARENABATTLE_TRAIN");
	TA_Guidepc (23,00,16,30,"OCR_ARENABATTLE_TRAIN");
};
