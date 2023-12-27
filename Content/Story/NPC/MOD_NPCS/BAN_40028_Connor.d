instance BAN_40028_Connor (Npc_Default)
{
	//-------- primary data --------
	//edit by Reflide
	name =					"Connor";
	Npctype			= NPCTYPE_FRIEND;
	guild 		    =	GIL_BAU;        
	level           =	40;

	
	voice =					13;
	id =					40028;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	850;
	attribute[ATR_HITPOINTS] =		850;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//						body mesh,					head mesh,hairmesh,	face-tex,	hair-tex,	skin	
	//Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald",38 ,  4, BAU_ARMOR_H);
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",113 ,  4, BAU_ARMOR_H);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

B_SetFightSkills(self,70);
	
	
	//-------- inventory --------   
	                                 
    B_CreateAmbientInv (self);
	CreateInvItems (self, ItFo_Potion_Health_01, 5);	
	EquipItem (self, ItRw_Bow_War_02_Z);
	EquipItem (self,ItMw_1H_Sword_Broad_02);
	CreateInvItems (self, ItAmArrow, 25);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40028;
	};

FUNC VOID Rtn_Start_40028 () //
{
    TA_SitAround		(13,00,14,00,"BN_NUTA_866");	
    TA_SitAround		(14,00,13,00,"BN_NUTA_866");
};
FUNC VOID Rtn_Follow_40028 () //
{
    TA_FollowPC		(06,00,19,00,"WP_STT_BQ1");	
   	TA_FollowPC     (19,00,06,00,"WP_STT_BQ1");
};
FUNC VOID Rtn_Zemsta_40028 () //
{
    TA_GuidePC		(06,00,19,00,"OW_PATH_146");	
   	TA_GuidePC      (19,00,06,00,"OW_PATH_146");
};
FUNC VOID Rtn_Powrot_40028 () //
{
    TA_GuidePC		(06,00,19,00,"LOCATION_11_04");	
   	TA_GuidePC      (19,00,06,00,"LOCATION_11_04");
};

FUNC VOID Rtn_KH_40028 () //
{
    TA_GuidePC		(06,00,19,00,"WP_CONNOR_PSI");	
   	TA_GuidePC      (19,00,06,00,"WP_CONNOR_PSI");
};

FUNC VOID Rtn_FOLLOWKH_40028 () //
{
    TA_FollowPC		(06,00,19,00,"WP_CONNOR_PSI");	
   	TA_FollowPC     (19,00,06,00,"WP_CONNOR_PSI");
};

FUNC VOID Rtn_KHINNC_40028 () //
{
    TA_Lean  		(06,00,19,00,"WP_CONNOR_NC");	
   	TA_Lean         (19,00,06,00,"WP_CONNOR_NC");
};

FUNC VOID Rtn_KHHROD_40028 () //
{
    TA_FollowPC		(06,00,19,00,"WP_KH6");	
   	TA_FollowPC        (19,00,06,00,"WP_KH6");
};
FUNC VOID Rtn_KHWAIT_40028 () //
{
    TA_Guard		(06,00,19,00,"WP_KH6");	
   	TA_Guard        (19,00,06,00,"WP_KH6");
};