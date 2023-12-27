

instance PotionMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"POTION MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7891;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

B_SetFightSkills(self,70);
	
	//-------- inventory --------
	//tymczasowe
	CreateInvItems	(self, ItFo_PotionTime_Strength_01,99);    
	CreateInvItems	(self, ItFo_PotionTime_Dex_01,99);  
	CreateInvItems	(self, ItFo_PotionTime_Mana_01,99);  
	CreateInvItems	(self, ItFo_PotionTime_Master_01,99);   
	CreateInvItems	(self, ItFo_Potion_HealthTime_01,99);   
	
	CreateInvItems	(self, ItFo_Potion_Mana_04,99); 
	CreateInvItems	(self, ItFo_Potion_Health_04,99);  
};



instance MiscMaster (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"ITEMS MASTER";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	15;
	
	voice 	=	8;
	id 		=	7895;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 

B_SetFightSkills(self,70);
	
	//-------- inventory --------
	//ch1
	CreateInvItem	(self, Pr_Wegiel);    
	CreateInvItem	(self, Gold01);
	CreateInvItem	(self, Pr_SztabkaZlota);    
	CreateInvItem	(self, Pr_SztabkaMagicznejStali);
	CreateInvItem	(self, ItMi_bait_01);    
	CreateInvItem	(self, ItMi_bait_02);
	CreateInvItem	(self, LightEssence);    
	CreateInvItem	(self, ItAm_Quiver);	
	CreateInvItem	(self, ItMiHorn_01);
	CreateInvItem	(self, ItMi_Wood_02);    
	CreateInvItem	(self, ItMi_Wood_01);
	CreateInvItem	(self, ItMi_Saw);    
	CreateInvItem	(self, ItMiGwozdz);	
	CreateInvItem	(self, ItMiJoint_Plant);    
	CreateInvItem	(self, ItMiJoint_Mush);	
	CreateInvItem	(self, ItMiJoint_Honey);
	CreateInvItem	(self, ItMiJoint_Apple);    
	CreateInvItem	(self, ItMi_Tuton_4);
	CreateInvItem	(self, ItMi_Tuton_3);    
	CreateInvItem	(self, ItMi_Tuton_2);
	CreateInvItem	(self, ItMi_Tuton_1);    
	CreateInvItem	(self, ItMi_Tuton);
	CreateInvItem	(self, ItMi_runa0);    
	CreateInvItem	(self, ItMi_PaczkaMiecze1);	
	CreateInvItem	(self, ItMi_Alchemy_trucizna_03);    
	CreateInvItem	(self, ItMi_Alchemy_trucizna_02);	
	CreateInvItem	(self, ItMi_Alchemy_trucizna_01);
	CreateInvItem	(self, ItKe_BROKE_Lockpick);    
	CreateInvItem	(self, ItMi_IglaiNIC);
	CreateInvItem	(self, ItMi_MaterialSlice);    
	CreateInvItem	(self, ItMi_Bandaz60);
	CreateInvItem	(self, ItMi_Bandaz40);	
	CreateInvItem	(self, ItMi_Worek_Plants);
	CreateInvItem	(self, ItMi_Worek_Itemy);    
	CreateInvItem	(self, ItMi_Worek_Wytrychy);
	CreateInvItem	(self, ItMi_Worek_100);    
	CreateInvItem	(self, ItMi_Worek_30);
	CreateInvItem	(self, ItMi_Worek_10);
};
//tarcze strzeleckie 
prototype tarcza_strzelecka (C_NPC)
{
name = "Tarcza";
//attribute[0] = 1; attribute[1] = 1;
flags = NPC_FLAG_IMMORTAL;

	attribute[ATR_STRENGTH] =		1;
	attribute[ATR_DEXTERITY] =		1;
	attribute[ATR_MANA_MAX] =		1;
	attribute[ATR_MANA] =			1;
	attribute[ATR_HITPOINTS_MAX] =	3;
	attribute[ATR_HITPOINTS] =		3;
	//visual				=	"ItAr_Rune_42.3ds";
};

instance tarcza_strzelecka_01 (tarcza_strzelecka){};
instance tarcza_strzelecka_02 (tarcza_strzelecka){};
instance tarcza_strzelecka_03 (tarcza_strzelecka){};
instance tarcza_strzelecka_04 (tarcza_strzelecka){};
instance tarcza_strzelecka_05 (tarcza_strzelecka){};
