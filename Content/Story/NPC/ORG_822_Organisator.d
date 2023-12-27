instance ORG_822_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_Ambient;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					13;
	id =					822;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	60;
	attribute[ATR_HITPOINTS] =		60;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 74
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Fighter", 135,  2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

B_SetFightSkills(self,30);
	//-------- inventory --------
	                                    
	B_CreateAmbientInv (self);
 	EquipItem (self, ItMw_1H_Mace_War_01);		
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_822;
};

FUNC VOID Rtn_start_822 ()
{
	TA_Sleep		(00,05,08,05,"NC_HUT16_IN");	
	TA_SitCampfire	(08,05,00,05,"NC_HUT16_OUT");
};















