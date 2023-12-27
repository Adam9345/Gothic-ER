instance ORG_818_Ratford (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Ratford";
	Npctype =				Npctype_Main;	
	guild =					GIL_ORG;      
	level =					8;

	
	voice =					7;
	id =					818;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Fighter", 9, 3, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	
	
	//-------- inventory --------   
	                                 
B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Small_04);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_818;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_Start_818 ()
{
	TA_Smalltalk (00,00,23,00,"OW_PATH_1_5_A");
	TA_Smalltalk (23,00,00,00,"OW_PATH_1_5_A");
};

