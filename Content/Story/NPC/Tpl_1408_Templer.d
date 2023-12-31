instance TPL_1408_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NpcType_Main; //idzie z nami do Cytadeli walczyć z Bestią
	guild =							GIL_TPL;
	level =							25;
	flags =							0;
	
	voice =							8;
	id =							1408;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	300;
	attribute[ATR_HITPOINTS] =		300;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_Psionic", 65 , 0, TPL_ARMOR_H);
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_03);
	EquipItem	(self, ItRw_Crossbow_03_Z);//### Palisadenwache
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1408;
};

FUNC VOID Rtn_start_1408 () //Auf Klotz bei Tempelplatz
{
	TA_GuardPalisade		(08,00,22,00,"PSI_GUARD_TEMPLE_5_2"); 
    TA_GuardPalisade		(22,00,08,00,"PSI_GUARD_TEMPLE_5_2"); 
};

FUNC VOID Rtn_ligthmushroom_1408 () //zadanie z polowaniem
{
	TA_Stand		(08,00,22,00,"CASTLE_22"); 
    TA_Stand		(22,00,08,00,"CASTLE_22"); 
};