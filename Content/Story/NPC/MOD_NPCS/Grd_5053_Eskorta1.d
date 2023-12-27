instance GRD_5053_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Eskorta";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	13;
	id 			=	5053;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
B_SetFightSkills(self,50);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_5053;
};

FUNC VOID Rtn_start_5053 ()
{
	//siedzi na ziemi
    TA_SitCampfire	(00,00,12,00,"KON3");
    TA_SitCampfire	(12,00,00,00,"KON3"); 
};
FUNC VOID Rtn_las_5053 ()
{
	//misja u Bandytów, czekają w lesie
    TA_Stand	(00,00,18,00,"ESKORTA2");
    TA_Stand	(18,00,00,00,"ESKORTA2");
};
FUNC VOID Rtn_follow_5053 ()
{
	//misja Strażnika, idzie za nami
    TA_FollowPC	(00,05,20,05,"OW_OM_ENTRANCE01");
    TA_FollowPC	(20,05,00,05,"OW_OM_ENTRANCE01"); 
};
