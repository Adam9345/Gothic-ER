instance NON_40086_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Robuer;
Npctype = Npctype_Ambient;
guild = GIL_ORCSCOUT;
level = 20;
voice = 8;
id = 40086;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 360;
attribute[ATR_HITPOINTS] = 360;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",2, 1,"Hum_Head_Bald",19, 1,ORG_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_War_03_Z);
EquipItem		(self, ItRw_Bow_Long_02);
CreateInvItems (self, ItAmArrow,15);
B_CreateAmbientInv (self);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_40086;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_40086 ()
{
    TA_Guard (08,05,18,05,"WP_BANDYTA_WIEZA_ER4");
	TA_Stand (18,05,08,05,"WP_BANDYTA_WIEZA_ER4");
};
