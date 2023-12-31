instance BAU_900_Ricelord (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ry�owy Ksi���";
	npctype 	=	NPCTYPE_Main;	
	guild 		=	GIL_ORG;      
	level 		=	10;
	voice 		=	12;
	id 			=	900; 

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 275;
	attribute[ATR_HITPOINTS] 	= 275;

	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"Hum_Body_CookSmith",1,1,"Hum_Head_FatBald",91 ,  0,-1);
	
	B_Scale (self); 
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
	    B_SetFightSkills(self,20);
	

	//-------- inventory --------                                    
		
		CreateInvItems (self, ItFoRice,10);
		CreateInvItem (self, ItFoWine);
		CreateInvItems(self, ItMiNugget,40);
		EquipItem  (self, Heerscherstab); 		
		CreateInvItem (self, ItMi_Alchemy_Moleratlubric_01);
		//CreateInvItem (self,ItKey_RB_01);
		B_CreateAmbientInv (self);
		EquipItem (self, Ring_des_Lebens);
			
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_900;
	
};

FUNC VOID Rtn_start_900 ()
{
	TA_Boss			(07,00,20,00,"NC_RICELORD");
	TA_SitAround	(20,00,24,00,"NC_RICELORD_SIT");
	TA_Sleep		(24,00,07,00,"NC_RICEBUNKER_10");
};

// REBEL
FUNC VOID Rtn_rebel_900 () //smalltalk with Lefty
{
	TA_Smalltalk	(07,00,20,00,"NC_PATH53");
	TA_Smalltalk	(20,00,07,00,"NC_PATH53");
};

FUNC VOID Rtn_bunt_900 ()
{
	TA_Boss			(07,00,20,00,"NC_RICELORD");
	TA_Boss			(20,00,07,00,"NC_RICELORD");
};









