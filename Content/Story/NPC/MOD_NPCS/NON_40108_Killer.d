instance NON_40108_Killer (Npc_Default)
{

	name =					"Nieznajomy";
	npctype		=			npctype_main;
	guild 		=			GIL_NONE;      
	level =					20;
	voice =					10;
	id =					40108;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	270;
	attribute[ATR_HITPOINTS] =		270;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 142, 0, SNAKE_ARMOR);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

B_SetFightSkills(self,70);
	
	
	//-------- inventory --------   
	                                 
    B_CreateAmbientInv (self);
 	EquipItem (self, ItMw_DaggerOfMurder);		
	EquipItem (self, ItRw_Crossbow_01);
	CreateInvItems (self, ItAm_Quiver, 1);
    CreateInvItems (self, ItWr_NortonToKiller, 1);
	daily_routine = Rtn_start_40108;
};

FUNC VOID Rtn_start_40108 ()
{
	TA_Lean		(23,55,05,30,"WP_ZDJ_KILLER");
	TA_Lean	    (05,30,23,55,"WP_ZDJ_KILLER");
	
};

FUNC VOID Rtn_Ambush_40108 ()
{
	TA_GuidePc		(23,55,05,30,"WP_ADD_02"); //OCC_GUARD_ROOM_FRONT
	TA_GuidePc   	(05,30,23,55,"WP_ADD_02"); //OCC_GUARD_ROOM_FRONT2
};

