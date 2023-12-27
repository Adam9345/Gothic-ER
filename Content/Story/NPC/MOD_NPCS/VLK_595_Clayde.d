instance VLK_595_Clayde (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Clayde";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							595;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		27;
	attribute[ATR_DEXTERITY] =		24;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	130;
	attribute[ATR_HITPOINTS] =		130;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Psionic", 0,  1, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Sword_Short_05);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItems (self, itminugget,35);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_595;
};

FUNC VOID Rtn_start_595 ()
{
	TA_Stand		(21,00,04,00,"OC_WELL_CLAYDE");
    TA_Stand	    (04,00,21,00,"OC_WELL_CLAYDE");	
};

FUNC VOID Rtn_cave_595 ()
{
	TA_Boss		(21,00,04,00,"CAVE_SNIPES");
    TA_Boss	    (04,00,21,00,"CAVE_SNIPES");	
};
