instance VLK_582_Melvin(Npc_Default)
{
	//-------- primary data --------
	
	name =							"Melvin";
	npctype =						npctype_main;
	guild =							GIL_NOV;   //SN: Absicht, da Melvin übergelaufen!!!   
	level =							25;
	
	
	voice =							3;
	id =							582;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	300;
	attribute[ATR_HITPOINTS] =		300;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody	(self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 74,  3, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness	(self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
   B_SetFightSkills(self,30);
	
	//-------- inventory --------                                    

	EquipItem			(self, ItMw_1h_Club_01);
	B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_582;
};

FUNC VOID Rtn_start_582 () //ST: Joru-Schüler
{
	TA_Sleep		(00,00,08,00,"PSI_12_HUT_IN_BED");
	TA_Listen		(08,00,00,00,"PSI_12_HUT_EX_TEACH");
};

FUNC VOID Rtn_BG_582 () //ST: Joru-Schüler
{
	TA_GuidePC		(00,00,08,00,"PATH_AROUND_PSI17");
	TA_GuidePC		(08,00,00,00,"PATH_AROUND_PSI17");
};










