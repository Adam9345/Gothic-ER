instance GRD_5055_Eskorta (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Stra¿nik konwoju";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	5055;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_L);
        
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
	daily_routine = Rtn_start_5055;
};

FUNC VOID Rtn_start_5055 ()
{
	//siedzi na ³awce na placu zamkowym
    TA_SitAround	(08,00,20,00,"KON1");
    TA_Smalltalk	(20,00,08,00,"KON1"); 
};
FUNC VOID Rtn_las_5055 ()
{
	//misja u Bandytów, czekaj¹ w lesie
    TA_Smalltalk	(07,35,20,05,"ESKORTA1");
    TA_Smalltalk	(20,05,07,35,"ESKORTA1"); 
};
FUNC VOID Rtn_follow_5055 ()
{
	//misja Stra¿nika, idzie za nami
    TA_FollowPC	(00,05,20,05,"OW_OM_ENTRANCE01");
    TA_FollowPC	(20,05,00,05,"OW_OM_ENTRANCE01"); 
};