instance VLK_5607_Szwacz (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Martwy szwacz";
	npctype =						npctype_Main;
	guild =							GIL_VLK;      
	level =							2;
	
	voice =							1;
	id =							5607;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 67,  1, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
			
	//-------- Talents --------                                    

	B_SetFightSkills(self,70);
	
	//-------- inventory --------                                    

	
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMi_SzwaczNote);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_5607;
	};

FUNC VOID Rtn_start_5607 ()
{
	TA_Sleep		(22,00,08,00,"SZWALNIA1");
	TA_Smalltalk	(08,00,22,00,"SZWALNIA1");
};

instance VLK_5604_Szwacz (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Martwy szwacz";
	npctype =						npctype_Main;
	guild =							GIL_VLK;      
	level =							2;
	
	voice =							1;
	id =							5604;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 67,  1, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
			
	//-------- Talents --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,4);
	
	//-------- inventory --------                                    

	
	EquipItem (self, ItMwPickaxe);
	
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	CreateInvItems (self, ItMi_MaterialSlice,12);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_5604;
	};

FUNC VOID Rtn_start_5604 ()
{
	TA_Sleep		(22,00,08,00,"SZWALNIA2");
	TA_Smalltalk	(08,00,22,00,"SZWALNIA2");
};

























