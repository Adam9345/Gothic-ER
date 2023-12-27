instance SLD_708_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_AMBIENT;
	guild =					GIL_SLD;      
	level =					8;
	
	voice =					11;
	id =					856;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, SLD_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,50);

	//-------- inventory --------   
	                                 
B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_708;
};

FUNC VOID Rtn_start_708 ()
{
	TA_Sleep		    (00,00,08,00,"NC_HUT07_IN");
	TA_SitAround		(08,00,00,00,"NC_PLACE03");
};













