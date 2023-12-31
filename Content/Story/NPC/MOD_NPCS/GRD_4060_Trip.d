instance GRD_4060_Trip (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Trip";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 15;
voice = 5;
id = 4060;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 45;
attribute[ATR_DEXTERITY] = 45;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",2, 1,"Hum_Head_FatBald",1, 1,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03);
EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItMiNugget,15);
CreateInvItems  (self,ItMi_Stuff_Pipe_01,2);
CreateInvItems  (self,ItFoMuttonRaw,1);
CreateInvItems  (self,ItFoBeer,3);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_4060;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_4060 ()
{
TA_SitAround (06,00,18,00,"OCR_HUT_Z5_SIT4");
TA_SitAround (18,00,06,00,"OCR_HUT_Z5_SIT4");
};
FUNC VOID Rtn_guard_4060 ()
{
	TA_Guard	(06,00,07,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(07,00,08,00,"OCR_LADDER_TOP_01");
	TA_Guard	(08,00,09,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(09,00,10,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(10,00,11,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(11,00,12,00,"OCR_LADDER_TOP_01");
	TA_Guard	(12,00,13,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(13,00,14,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(14,00,15,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(15,00,16,00,"OCR_LADDER_TOP_01");
	TA_Guard	(16,00,17,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(17,00,18,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(18,00,19,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(19,00,20,00,"OCR_LADDER_TOP_01");
	TA_Guard	(20,00,21,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(21,00,22,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(22,00,23,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(23,00,00,00,"OCR_LADDER_TOP_01");
	TA_Guard	(00,00,01,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(01,00,02,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(02,00,03,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(03,00,04,00,"OCR_LADDER_TOP_01");
	TA_Guard	(04,00,05,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(05,00,06,00,"OCR_BEHIND_HUT_17");
};