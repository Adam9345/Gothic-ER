instance STT_3918_Polykacz (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Po�ykacz ognia";
Npctype = Npctype_Main;
guild = GIL_STT;
level = 10;
voice = 5;
id = 3918;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 40;
attribute[ATR_DEXTERITY] = 40;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 100;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",16, 1,STT_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_01);
CreateInvItems  (self,ItAt_Teeth_01,3);
CreateInvItems  (self,ItFoApple,1);
CreateInvItems  (self,ItFoMutton,2);
CreateInvItems  (self,ItFo_Potion_Health_01,1);
CreateInvItems  (self,ItMiNugget,10);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3918;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3918 ()
{
TA_SitAround 	(11,35,13,40,"OCR_ARENABATTLE_LEVER");
TA_Smalltalk 	(13,40,15,20,"OC_TALK_1");
TA_SitAround 	(15,20,20,00,"OCR_ARENABATTLE_LEVER");
TA_Firespit 	(20,00,23,00,"OCR_ARENABATTLE_TRAIN");
TA_Sleep 		(23,00,00,00,"OCR_ARENA_VWHEEL");
};

FUNC VOID Rtn_urlop_3918 ()
{
TA_SitAround 	(11,35,13,40,"OCR_ARENABATTLE_LEVER");
TA_Smalltalk 	(13,40,15,20,"OC_TALK_1");
TA_SitAround 	(15,20,20,00,"OCR_ARENABATTLE_LEVER");
TA_SitAround 	(20,00,23,00,"OCR_ARENABATTLE_LEVER");
TA_Sleep 		(23,00,00,00,"OCR_ARENA_VWHEEL");
};