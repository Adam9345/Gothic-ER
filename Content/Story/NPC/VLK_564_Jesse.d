instance VLK_564_Jesse (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Jesse";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							4;
	
	
	voice =							3;
	id =							564;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 71,  1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
  B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, Itfo_Potion_Water_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_564;
};



FUNC VOID Rtn_start_564 ()
{
	TA_Sleep		(23,00,06,45,"OCR_HUT_63");
	TA_CookForMe 	(06,45,12,00,"OCR_OUTSIDE_HUT_63_COOK");
	TA_Smalltalk	(12,00,17,00,"OCR_OUTSIDE_HUT_63_COOK");
	TA_SitCampfire 	(17,00,23,00,"OCR_CAMPFIRE_E_2_MOVEMENT");
};
FUNC VOID Rtn_ucieczka_564 ()
{
	TA_PickRice		(07,50,20,50,"NC_PATH82");
	TA_CookForMe 	(06,45,12,00,"NC");
};
FUNC VOID Rtn_cava_564 ()
{
TA_Stand (06,00,13,45,"OW_SAWHUT_MOLERAT_MOVEMENT6");
TA_PracticeSword (13,45,17,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
TA_Smoke (17,00,18,22,"OW_SAWHUT_MOLERAT_MOVEMENT6");
TA_Smoke (18,22,06,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
};





