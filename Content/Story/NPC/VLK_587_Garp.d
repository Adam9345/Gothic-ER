instance VLK_587_Garp (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Garp";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							1;
	id =							587;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;
    protection[PROT_FLY]      = 9999;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 72,  4, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
   B_SetFightSkills(self,30);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_587;
};

FUNC VOID Rtn_start_587 ()
{
    TA_PickOre	    (08,00,18,00,"OM_PICKORE_11");  
	TA_PickOre	    (18,00,08,00,"OM_PICKORE_11");
};

FUNC VOID Rtn_wlam_587 ()
{
    TA_Smalltalk	    (08,00,18,00,"OM_CAVE1_75");  
	TA_Smalltalk	    (18,00,08,00,"OM_CAVE1_75");
};

FUNC VOID Rtn_Ian_587 ()
{
    TA_Smalltalk	    (08,00,18,00,"OM_CAVE1_49");  
	TA_Smalltalk	    (18,00,08,00,"OM_CAVE1_49");
};

FUNC VOID Rtn_Siedzi_587 ()
{
    TA_SitAround	    (08,00,12,00,"WP_STRAZ_OM1");  
	TA_Smalltalk	    (18,00,24,00,"OM_CAVE1_49");
	TA_RoastScavenger   (24,00,08,00,"OM_CAVE1_49");
	
	
};








