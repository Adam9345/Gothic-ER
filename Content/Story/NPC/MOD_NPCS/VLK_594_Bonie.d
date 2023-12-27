instance VLK_594_Bonie (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bonie";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							594;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		32;
	attribute[ATR_DEXTERITY] =		32;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	155;
	attribute[ATR_HITPOINTS] =		155;

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
B_SetFightSkills(self,30);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Sword_Short_05);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItems (self, itminugget,65);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_594;
};

FUNC VOID Rtn_start_594 ()
{
	TA_Boss		(21,00,04,00,"OCR_TO_HUT_53");
    TA_Boss	    (04,00,21,00,"OCR_TO_HUT_53");	
};

FUNC VOID Rtn_cave_594 ()
{
	TA_Stand		(21,00,04,00,"POSLANIEC");
    TA_Stand	    (04,00,21,00,"POSLANIEC");	
};