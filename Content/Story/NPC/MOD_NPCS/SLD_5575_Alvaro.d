instance SLD_5575_Alvaro (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Alvaro";
	Npctype =				NPCTYPE_main;
	guild =					GIL_ORG;       
	level =					15;
	
	voice =					11;
	id =					5575;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;


	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 10
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 3,"Hum_Head_Pony", 139, 2,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
B_SetFightSkills(self,60);

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_5575;

};

FUNC VOID Rtn_start_5575 ()
{
	TA_Stand 	(07,25,11,30,	"NC_ALVAREZ");
	TA_Skrzynka	(11,30,13,25,	"NC_HUT02_IN");
	TA_RepairHut 	(13,25,17,00,	"NC_ALVAREZ_HUT");
	TA_Stand 	(17,00,20,00,	"NC_ALVAREZ");
	TA_Smoke 	(20,00,22,00,	"NC_ALVAREZ");
	TA_Sleep	(22,00,07,25,	"NC_HUT02_IN");
};

FUNC VOID Rtn_przydupas_5575 ()
{
	TA_Stand		(06,00,12,00,"CHUJ1");
	TA_Stand		(12,00,06,00,"CHUJ1");
};
























