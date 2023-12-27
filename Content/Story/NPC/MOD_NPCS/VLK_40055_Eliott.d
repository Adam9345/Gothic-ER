instance VLK_40055_Eliott (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Eliott";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							10;
	id =							40055;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	176;
	attribute[ATR_HITPOINTS] =		176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 72,  1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

B_SetFightSkills(self,20);
	//-------- inventory --------                                    

	
	EquipItem (self, ItMwPickaxe);
	B_CreateAmbientInv (self);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40055;
};

FUNC VOID Rtn_start_40055 ()
{
	TA_PickOre		(22,00,08,00,"WP_KOPACZ_01");
	TA_PickOre		(08,00,22,00,"WP_KOPACZ_01");
};








