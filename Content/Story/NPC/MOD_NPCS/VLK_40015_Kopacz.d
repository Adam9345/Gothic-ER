
instance VLK_40015_Kopacz (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Kopacz";
	npctype =						npctype_main;
	guild =							GIL_NONE;      
	level =							3;
	
	
	voice =							3;
	id =							40015;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	186;
	attribute[ATR_HITPOINTS] =		186;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 108,  3, VLK_ARMOR_H);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talents  --------                                    

B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
    B_CreateAmbientInv (self);


	//-------------Daily Routine-------------
	daily_routine = Rtn_START_40015;
};

FUNC VOID Rtn_START_40015 ()	//FM
{
	TA_Smoke		(00,00,23,00,"FP_SIT_OM_02");
	TA_Smoke		(23,00,24,00,"FP_SIT_OM_02");
};

FUNC VOID Rtn_Walka_40015 ()	//FM
{
	TA_Stand		(00,00,23,00,"WP_MINE_ARENA");
	TA_Stand		(23,00,24,00,"WP_MINE_ARENA");
};








