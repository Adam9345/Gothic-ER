/*
Bandyci - Gothic:Edycja rozszerzona
Skrypty NPC Ambient
Rozdzia� 4
26 lipiec 2012
Opuszczona kopalnia
*/

//Szef kopalni - Kerteh


instance NON_3045_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 7;
id = 3045;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Fighter",12, 3,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,70);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3045;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3045 ()
{
	TA_PickOre		(22,00,08,00,"ZL9");
	TA_PickOre		(08,00,22,00,"ZL9");
};

instance NON_3031_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 6;
id = 3031;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Thief",101, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3031;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3031 ()
{
	TA_PickOre		(22,00,08,00,"ZL10");
	TA_PickOre		(08,00,22,00,"ZL10");
};
instance NON_3037_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 7;
id = 3037;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 3,"Hum_Head_Fighter",10, 3,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3037;
//Generated by Gothic NPC Maker
};
func void Rtn_start_3037 ()
{
	TA_PickOre		(22,00,08,00,"ZL11");
	TA_PickOre		(08,00,22,00,"ZL11");
};

instance NON_3032_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Bicz";
Npctype = npctype_main;
guild = GIL_BAU;
level = 30;
voice = 7;
id = 3032;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 2,"Hum_Head_Fighter",0, 3,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3032;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3032 ()
{
	TA_PickOre		(22,00,08,00,"ZL6");
	TA_PickOre		(08,00,22,00,"ZL6");
};



instance NON_3044_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 6;
id = 3044;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 0,"Hum_Head_Pony",18, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3044;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3044 ()
{
	TA_PickOre		(22,00,08,00,"ZL8");
	TA_PickOre		(08,00,22,00,"ZL8");
};
/*
instance BAN_1608_Kereth (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Raeuber;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 6;
id = 3033;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 0,"Hum_Head_Bald",103, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3033;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_3033 ()
{
	TA_PickOre		(22,00,08,00,"ZL1");
	TA_PickOre		(08,00,22,00,"ZL1");
};
*/
instance NON_3038_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 7;
id = 3038;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",102, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3038;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3038 ()
{
	TA_PickOre		(22,00,08,00,"ZL2");
	TA_PickOre		(08,00,22,00,"ZL2");
};

instance NON_3040_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 7;
id = 3040;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Thief",104, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3040;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3040 ()
{
	TA_PickOre		(22,00,08,00,"ZL3");
	TA_PickOre		(08,00,22,00,"ZL3");
};

instance NON_3042_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 6;
id = 3042;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Fighter",2, 3,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3042;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3042 ()
{
	TA_PickOre		(22,00,08,00,"ZL4");
	TA_PickOre		(08,00,22,00,"ZL4");
};

instance NON_3030_Bandyta (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Buddler;
Npctype = npctype_ambient;
guild = GIL_BAU;
level = 30;
voice = 6;
id = 3030;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Pony",102, 1,bau_armor_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

Npc_SetTalentSkill (self, NPC_TALENT_1H,7);
Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3030;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3030 ()
{
	TA_PickOre		(22,00,08,00,"ZL5");
	TA_PickOre		(08,00,22,00,"ZL5");
};