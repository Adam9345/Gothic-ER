instance NON_40007_Rabus (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Rabu�";
Npctype = Npctype_Main;
guild = GIL_ORG;
level = 10;
voice = 7;
id = 40007;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 50;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 120;
attribute[ATR_HITPOINTS] = 120;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",12, 1,STT_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_War_02);
CreateInvItems  (self,ItAt_Teeth_01,3);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_MASTER;
daily_routine = Rtn_start_40007;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_40007 ()
{
TA_SitCampfire (00,00,12,00,"WP_BDT_CORR1");
TA_SitCampfire (12,00,00,00,"WP_BDT_CORR1");
};
