instance ORG_825_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype			= NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					8;

	voice =					7;
	id =					825;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_825;
};

FUNC VOID Rtn_start_825 () //Wache: Durchgang zu Lares
{
	TA_GuardPassage	(20,00,08,00,"NC_HUT23_OUT_GUARD2");
	TA_GuardPassage	(08,00,20,00,"NC_HUT23_OUT_GUARD2");
};














