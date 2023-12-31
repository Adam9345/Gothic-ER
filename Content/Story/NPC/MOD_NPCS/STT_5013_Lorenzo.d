instance STT_5013_Lorenzo (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name 	= "Lorenzo";
Npctype = Npctype_main;
guild 	= GIL_GRD;
level 	= 25;
voice 	= 7;
id 		= 5013;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 75;
attribute[ATR_DEXTERITY] = 40;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 250;
attribute[ATR_HITPOINTS] = 250;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",119, 1,STT_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItAt_Teeth_01,1);
CreateInvItems  (self,ItFoApple,4);
CreateInvItems  (self,itminugget,150);
CreateInvItems  (self,ItFo_Potion_Water_01,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_5013;
};

FUNC VOID Rtn_start_5013 ()
{ //ER_PLAC_WHEEL
TA_SitAround (06,00,17,35,"OCR_HUT_2");
TA_Smalltalk (17,35,21,48,"OCR_HUT_2");
TA_Sleep (21,48,06,00,"OCR_HUT_2");
};
