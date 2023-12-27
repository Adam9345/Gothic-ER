instance STT_40143_Hargos (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Hargos";
	guild 		=	GIL_NONE;
	npctype		=	NPCTYPE_MAIN;
	level 		=	20;
	voice 		=	13;
	id 			=	40143;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	🙂
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 149,  1, NON_LEATHER_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,60);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_03_Z);
//	B_CreateAmbientInv (self);
//  EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40143;
};

FUNC VOID Rtn_start_40143 ()	//FM
{
	TA_PICKRICE     (06,00,08,00,  "WP_HARGOS_PICK");
	TA_SitCampfire  (08,00,13,22, "WP_HARGOS_CAMP");
	TA_WorkMOB      (13,22,15,30, "OMC_WOOD_CUT");
	TA_Smoke        (15,30,18,30, "WP_ADD_64");
	TA_StandAround  (18,30,06,00, "WP_HARGOS_CAMP");
	
};
FUNC VOID Rtn_Forest_40143 ()	//FM
{
	TA_GuidePC (0,00,13,00,  "OW_PATH_004");
	TA_GuidePC (13,00,00,00, "OW_PATH_004");
};


FUNC VOID Rtn_Guide_40143 ()	//RMF-FM
{
	TA_GuidePC (0,00,13,00,  "WP_HARGOS_WORKING");
	TA_GuidePC (13,00,00,00, "WP_HARGOS_WORKING");
};

FUNC VOID Rtn_WORK_40143 ()	//RMF-FM
{
	TA_WorkMOB (0,00,13,00,  "WP_HARGOS_WORKING");
	TA_WorkMOB (13,00,00,00, "WP_HARGOS_WORKING");
};

FUNC VOID Rtn_GuideBack_40143 ()	//RMF-FM
{
	TA_GuidePC (0,00,13,00,  "OW_PATH_258");
	TA_GuidePC (13,00,00,00, "OW_PATH_258");
};
FUNC VOID Rtn_GuideBackC_40143 ()	//RMF-FM
{
	TA_GuidePC (0,00,13,00,  "ENTER_CAMP");
	TA_GuidePC (13,00,00,00, "ENTER_CAMP");
};



FUNC VOID Rtn_CH4_40143 ()	//FM
{
	
	TA_StandAround  (18,30,06,00, "OW_PATH_1_5_11");
	TA_StandAround  (06,00,18,30, "OW_PATH_1_5_11");
	
};

FUNC VOID Rtn_CH4Tom_40143 ()	//FM
{
TA_Stand (06,00,08,33,"MYSLIWY_3");
TA_Stand (08,33,12,21,"MYSLIWY3");
TA_HerbAlchemy (12,21,16,00,"MYSLIWY_2");
TA_Sleep (16,00,18,00,"MYSLIWY_1");
TA_HerbAlchemy (18,00,20,00,"MYSLIWY_2");
TA_Smoke (20,00,23,00,"MYSLIWY_3");
TA_Sleep (23,00,06,00,"MYSLIWY_1");
	
};