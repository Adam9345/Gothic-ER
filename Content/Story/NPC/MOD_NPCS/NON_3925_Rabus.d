instance NON_3925_Rabus (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Nowicjusz - rabu�";
Npctype = Npctype_Main;
guild = GIL_DMB;
level = 10;
voice = 7;
id = 3925;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 40;
attribute[ATR_DEXTERITY] = 40;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 120;
attribute[ATR_HITPOINTS] = 120;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",12, 1,NOV_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);
//----------Ekwipunek----------
EquipItem		(self, ItMwZ_1H_Sword_01);
CreateInvItems  (self,ItAt_Teeth_01,3);
CreateInvItems  (self,ItFoLoaf,3);
CreateInvItems  (self,ItForice,1);
CreateInvItems  (self,ItFoBooze,2);
CreateInvItems  (self,ItFo_Potion_Health_01,2);
CreateInvItems  (self,ItKeLockpick,1);
CreateInvItems  (self,ItMijoint_1,3);
CreateInvItems  (self,ItMiNugget,20);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_MASTER;
daily_routine = Rtn_start_3925;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3925 ()
{
TA_SitCampfire (00,00,12,00,"CAVE_BANDIT_1");
TA_SitCampfire (12,00,00,00,"CAVE_BANDIT_1");
};
