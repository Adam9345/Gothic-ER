instance VLK_40053_Richard (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Richard";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							40053;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		32;
	attribute[ATR_DEXTERITY] =		32;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	135;
	attribute[ATR_HITPOINTS] =		135;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 73,  1, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Sword_Short_05);
    B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40053;
};

FUNC VOID Rtn_start_40053 ()
{
	TA_SitAround		(21,00,04,00,"WP_OM_RICHARD");
    TA_SitAround	    (04,00,21,00,"WP_OM_RICHARD");	
};

FUNC VOID Rtn_Mine_40053 ()
{
	TA_PickOre		(21,00,04,00,"OM_CAVE1_38");
    TA_PickOre	    (04,00,21,00,"OM_CAVE1_38");	
};
