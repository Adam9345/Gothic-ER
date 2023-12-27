instance Grd_40054_Fergus (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fergus";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	3;
	id 			=	40054;
	flags       =   NPC_FLAG_IMMORTAL;	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 150;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,            head mesh,      headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 1,"Hum_Head_Pony", 1,  1,-1);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	//EquipItem	(self, ItRw_Crossbow_01);
	//CreateInvItems	(self, ItAmBolt, 30);
    B_CreateAmbientInv (self);
	//DEN SCHLÜSSEL HAT SKIP
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40054;
};

FUNC VOID Rtn_start_40054 ()
{
	TA_Smith_Fire	(08,00,08,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(08,10,08,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(08,20,08,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(08,30,08,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(08,40,08,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(08,50,08,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(08,55,09,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(09,00,09,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(09,10,09,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(09,20,09,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(09,30,09,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(09,40,09,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(09,50,09,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(09,55,10,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(10,00,10,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(10,10,10,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(10,20,10,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(10,30,10,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(10,40,10,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(10,50,10,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(10,55,11,00,"WP_FERGUS_KOWADLO");
          
	TA_Smith_Fire	(11,00,11,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(11,10,11,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(11,20,11,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(11,30,11,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(11,40,11,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(11,50,11,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(11,55,12,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(12,00,12,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(12,10,12,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(12,20,12,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(12,30,12,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(12,40,12,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(12,50,12,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(12,55,13,00,"WP_FERGUS_KOWADLO");
          
	TA_Smith_Fire	(13,00,13,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(13,10,13,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(13,20,13,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(13,30,13,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(13,40,13,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(13,50,13,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(13,55,14,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(14,00,14,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(14,10,14,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(14,20,14,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(14,30,14,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(14,40,14,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(14,50,14,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(14,55,15,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(15,00,15,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(15,10,15,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(15,20,15,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(15,30,15,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(15,40,15,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(15,50,15,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(15,55,16,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(16,00,16,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(16,10,16,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(16,20,16,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(16,30,16,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(16,40,16,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(16,50,16,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(16,55,17,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(17,00,17,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(17,10,17,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(17,20,17,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(17,30,17,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(17,40,17,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(17,50,17,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(17,55,18,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(18,00,18,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(18,10,18,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(18,20,18,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(18,30,18,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(18,40,18,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(18,50,18,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(18,55,19,00,"WP_FERGUS_KOWADLO");

	TA_Smith_Fire	(19,00,19,10,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(19,10,19,20,"WP_FERGUS_KOWADLO");
	TA_Smith_Fire	(19,20,19,30,"WP_FERGUS_PIEC");
	TA_Smith_Anvil	(19,30,19,40,"WP_FERGUS_KOWADLO");
	TA_Smith_Cool	(19,40,19,50,"WP_FERGUS_WODA");
        TA_Smith_Sharp	(19,50,19,55,"WP_FERGUS_OSELKA");
        TA_SitAround	(19,55,08,00,"WP_FERGUS_SIT");
   
	
};
