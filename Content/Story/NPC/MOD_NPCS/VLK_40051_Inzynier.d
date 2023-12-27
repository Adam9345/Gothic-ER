instance VLK_40044_Inzynier (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Inzynier;
	npctype =						npctype_main;
	guild =							GIL_GOBBO;      
	level =							10;
	
	
	voice =							3;
	id =							40044;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 68,  1, VLK_ARMOR_h);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talents  --------                                    

B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
    B_CreateAmbientInv (self);

		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40044;
};

FUNC VOID Rtn_start_40044 ()	//FM
{
	TA_StandAround		(08,00,23,00,"OW_PATH_249");
	TA_StandAround		(23,00,08,00,"OW_PATH_249");
};
FUNC VOID Rtn_Konwoj_40044 ()	//FM
{
	TA_StandAround		(13,00,15,00,"OW_PATH_254");
	TA_StandAround		(15,00,24,00,"OW_PATH_254");
};
FUNC VOID Rtn_Konwoj2_40044 ()	//FM
{
	TA_StandAround		(24,00,15,00,"OW_PATH_254");
	TA_StandAround		(15,00,24,00,"OW_PATH_254");
};

FUNC VOID Rtn_Kopalnia_40044 ()	//KOPALNIA
{
	TA_StandAround		(13,00,15,00,"PTH8");
	TA_StandAround		(15,00,24,00,"PTH8");
};













