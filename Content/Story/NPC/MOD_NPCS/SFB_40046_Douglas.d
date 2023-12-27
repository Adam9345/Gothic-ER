instance SFB_40046_Douglas (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Douglas";
	npctype = 						Npctype_main;
	guild =							GIL_SFB;      
	level =							6;
	flags =							0;
	
	voice =							5;
	id =							40046;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 42,  1,SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	B_SetFightSkills(self,10);
	//-------- inventory --------                                    

      
      B_CreateAmbientInv (self);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMw_1H_Nailmace_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_40046;

};

FUNC VOID Rtn_start_40046 ()
{
	TA_Smoke	     (01,00,13,00,	"WP_DOUGLAS");
	TA_StandDrunk	(13,00,01,00,	"WP_DOUGLAS");
};











