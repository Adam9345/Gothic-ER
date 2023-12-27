instance VLK_40057_Brennus (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Brennus";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							4;
	
	
	voice =							1;
	id =							40057;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	106;
	attribute[ATR_HITPOINTS] =		106;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				67hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 107,  1, -1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, ItFoApple);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40057;
	};

FUNC VOID Rtn_start_40057 ()
{
	TA_SitAround		(00,00,23,00,"WP_BRENNUS1");
	TA_SitAround		(23,00,24,00,"WP_BRENNUS1");
};












