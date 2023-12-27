instance SLD_730_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					11;
	id =					730;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 75
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 138, 2, SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente --------
B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_730;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_730 ()
{
	TA_Sleep		(23,00,08,00,"NC_HUT10_IN");
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
};










