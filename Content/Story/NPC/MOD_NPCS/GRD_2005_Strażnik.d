instance GRD_2005_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 13;
voice = 7;
id = 2005;

//----------Statystyki----------

	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 30;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  2, GRD_ARMOR_L);
        
 	B_Scale (self);
   	Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
//EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItFoLoaf,1);
CreateInvItems  (self,ItForice,1);
//CreateInvItems  (self,Schutzring_Geschosse1,1);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2005;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2005 ()
{
TA_Stand (06,00,15,00,"PLAC1");
TA_Smoke (15,00,16,00,"PLAC1");
TA_Smoke (16,00,20,00,"PLAC2");
TA_SitCampfire (20,00,06,00,"PLAC2");
};
FUNC VOID Rtn_atak_2005 ()
{
TA_Stay (06,00,15,00,"OW_PATH_1_16_4");
TA_Stay (15,00,16,00,"OW_PATH_1_16_4");
TA_Boss (16,00,20,00,"OW_PATH_1_16_4");
TA_Boss (20,00,06,00,"OW_PATH_1_16_4");
};
