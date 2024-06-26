instance STT_40031_Zwiadowca (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Zwiadowca";
Npctype = Npctype_Main;
guild = GIL_BDT;
level = 15;
voice = 7;
id = 40031;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 90;
attribute[ATR_DEXTERITY] = 50;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 120;
attribute[ATR_HITPOINTS] = 120;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",15, 1,STT_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Short_03_Z);
B_CreateAmbientInv 	(self);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_MASTER;
daily_routine = Rtn_start_40031;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_40031 ()
{
TA_SitCampfire (00,00,12,00,"WP_STT_BQ3");
TA_SitCampfire (12,00,00,00,"WP_STT_BQ3");
};
