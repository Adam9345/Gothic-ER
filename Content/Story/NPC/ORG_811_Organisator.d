//### Trademodul checken, wenn die Stärke der Armbrust und Rüstungen feststeht
//### Eintrag in das Journal wegen Tauschhandel

instance ORG_811_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_Ambient;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					6;
	id =					811;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 79
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald", 136, 1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
B_SetFightSkills(self,30);
	
	//-------- inventory --------
	                                    
	B_CreateAmbientInv (self);
 	EquipItem (self, ItMw_1H_Mace_War_01);		
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_811;
};

FUNC VOID Rtn_start_811()
{
	TA_Sleep		(23,55,08,05,"NC_HUT17_IN");
	TA_Smalltalk	(08,05,23,55,"NC_HUT17_OUT");
};


