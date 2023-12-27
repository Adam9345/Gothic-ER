instance Grd_40150_Nieznajomy (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Nieznajomy";
	npctype		= 	NpcType_MAIN;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice		=	7;
	id 			=	40150;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 300;
	attribute[ATR_HITPOINTS] 	= 300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 2, NON_LEATHER_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_Master;

	//-------- Talente -------- 
				

B_SetFightSkills(self,70);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 15);
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40150;
};

FUNC VOID Rtn_start_40150 ()
{
	TA_Stand	(06,00,21,00,"OM_014A"); 
	TA_Stand	(21,00,06,00,"OM_014A"); 
};

