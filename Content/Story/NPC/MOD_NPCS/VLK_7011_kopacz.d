instance VLK_7011_kopacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name 		= "Akl";
Npctype 	= Npctype_Main;
guild 		= GIL_VLK;
level 		= 2;
voice 		= 4;
id 			= 7011;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 17;
attribute[ATR_DEXTERITY] = 10;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 50;
attribute[ATR_HITPOINTS] = 50;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody 	(self,"hum_body_naked0",0, 2,"Hum_Head_Bald",0, 2,VLK_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);
B_SetFightSkills(self,10);
//----------Ekwipunek----------
EquipItem		(self, ItMwPickaxe);
CreateInvItems  (self,ItAt_Meatbug_01,2);
CreateInvItems  (self,ItForice,3);
CreateInvItems  (self,ItMiNugget,5);
CreateInvItems  (self,ItFo_wineberrys_01,2);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Coward;
daily_routine = Rtn_start_7011;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_7011 ()
{
TA_WorkMOB 			(06,35,13,22,"OMC_WOOD_CUT");
TA_CookforMe 		(13,22,14,15,"OMC_SMALL_PAN");
TA_Smoke		 	(14,15,15,03,"GRD2");
TA_SitCampfire 		(15,03,19,21,"GRD2");
TA_CookforMe 		(19,21,20,00,"OMC_SMALL_PAN");
TA_Sleep			(20,00,06,35,"OMC_BED_VLK");
};

FUNC VOID Rtn_searching_7011 ()
{
TA_PickRice (06,00,12,00,"OW_PATH_265");
TA_PickRice (12,00,21,00,"OW_PATH_265");
TA_Sleep (21,00,06,00,"OMC_BED_VLK");
};

FUNC VOID Rtn_ded_7011 ()
{
TA_Stand (06,00,12,00,"WAR3");
TA_Smoke (12,00,21,00,"WAR3");
TA_Stand (21,00,06,00,"WAR3");
};