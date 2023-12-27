instance GRD_40088_Gardist (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Strażnik";
Npctype = Npctype_Ambient;
guild = GIL_SKELETON;
level = 20;
voice = 8;
id = 40088;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 80;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 460;
attribute[ATR_HITPOINTS] = 460;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",2, 1,"Hum_Head_Bald",112, 1,GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,70);

//----------Ekwipunek----------
EquipItem		(self, ItMw_2H_Sword_New_05_Z);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems (self, ItAmBolt,15);
B_CreateAmbientInv (self);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Master;
daily_routine = Rtn_start_40088;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_40088 ()
{
    TA_Guard (08,05,18,05,"WP_BLO_GRD1");
	TA_Stand (18,05,08,05,"WP_BLO_GRD1");
};
