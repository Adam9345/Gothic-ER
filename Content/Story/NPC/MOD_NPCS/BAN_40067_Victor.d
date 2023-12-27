instance BAN_40067_Victor (Npc_Default)
{
	//-------- primary data --------
	//edit by Reflide
	name =					"Victor";
	Npctype			= NPCTYPE_FRIEND;
	guild 		    =	GIL_BAU;        
	level           =					25;

	
	voice =					13;
	id =					40067;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	350;
	attribute[ATR_HITPOINTS] =		350;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//						body mesh,					head mesh,hairmesh,	face-tex,	hair-tex,	skin		
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",108 ,  1, BAU_ARMOR_M);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,70);
	
	//-------- inventory --------   
	                                 

	EquipItem (self, ItRw_Bow_War_02_Z);
	EquipItem (self,ItMw_1H_Sword_Broad_02);
	CreateInvItems (self, ItAmArrow, 20);
    B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40067;
	};

FUNC VOID Rtn_Start_40067 () //
{
    TA_SitAround		(13,00,14,00,"WP_VICTOR");	
    TA_SitAround		(14,00,13,00,"WP_VICTOR");
};
FUNC VOID Rtn_Follow_40067 () //
{
    TA_GuidePC		(06,00,19,00,"JOSEP2");	
   	TA_GuidePC      (21,00,06,00,"JOSEP2");
};

