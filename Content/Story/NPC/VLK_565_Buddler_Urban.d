instance VLK_565_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Urban";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							8;
	
	
	voice =							1;
	id =							565;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	120;
	attribute[ATR_HITPOINTS] =		120;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic", 69,  3, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talents --------                                    

  B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, ItFoApple);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_565;
	};

FUNC VOID Rtn_start_565 ()
{
	TA_Stand	  	(23,00,02,30,"OCR_HUT_Z5");
	TA_Sleep		(02,00,07,30,"OCR_HUT_52");
	TA_StandAround	(07,30,23,00,"OCR_OUTSIDE_HUT_52");
};

FUNC VOID Rtn_follow_565 ()
{
	TA_FollowPC	  	(23,00,02,30,"OCR_HUT_Z5_SIT4");
	TA_FollowPC		(02,00,07,30,"OCR_HUT_Z5_SIT4");
	TA_FollowPC		(07,30,23,00,"OCR_HUT_Z5_SIT4");
};

FUNC void rtn_lorenzo_565 ()
{
	TA_STAND (16,00,23,30,"OC_TOM_URBAN");
	TA_STAND (23,00,16,30,"OC_TOM_URBAN");
};

FUNC void rtn_tomine_565 ()
{
	TA_FollowPC (16,00,23,30,"OC_TOM_URBAN");
	TA_FollowPC (23,00,16,30,"OC_TOM_URBAN");
};

FUNC void rtn_camp_565 ()
{
	TA_PickOre 	(05,40,18,30,"KOP9");
	TA_SitAround (18,30,05,40,"OW_OM_ENTRANCE02_WHEEL_USE");
};