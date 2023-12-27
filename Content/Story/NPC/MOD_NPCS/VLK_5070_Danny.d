instance VLK_5070_Danny (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Danny";
	npctype =						npctype_main;
	guild =							GIL_MEATBUG;      
	level =							8;
	
	flags = 2;
	voice =							1;
	id =							5070;


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
	daily_routine = Rtn_start_5070;
	};

FUNC VOID Rtn_start_5070 ()
{
	//OM_CAVE1_91 - play sound here!!!
	TA_Stand	  	(23,00,02,30,"OM_ADD_01");
	TA_Stand		(02,00,07,30,"OM_ADD_01");
	TA_Stand		(07,30,23,00,"OM_ADD_01");
};

FUNC VOID Rtn_find_5070 ()
{
	TA_SitCampfire	  	(23,00,02,30,"OM_DANNY");
	TA_SitCampfire		(02,00,23,30,"OM_DANNY");
};












