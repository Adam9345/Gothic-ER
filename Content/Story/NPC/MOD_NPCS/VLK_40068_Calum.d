instance VLK_40068_Calum (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Calum";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							40068;


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
	daily_routine = Rtn_start_40068;
};

FUNC VOID Rtn_start_40068 ()
{
	TA_SitAround		(08,00,18,00,"WP_CALUM_OC");
	TA_SitCampfire      (18,00,05,00,"OCR_OUTSIDE_ARENA_HANGAROUND");
    TA_SitAround	    (05,00,08,00,"WP_CALUM_OC");	
};

FUNC VOID Rtn_Ognisko_40068 ()
{
	TA_SitAround		(21,00,04,00,"OC_ROUND_22_CF_1");
    TA_SitAround	    (04,00,21,00,"OC_ROUND_22_CF_1");	
};
