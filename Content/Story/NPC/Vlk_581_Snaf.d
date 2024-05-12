instance VLK_581_Snaf (Npc_Default)
{
	//-------- primary data --------
	name =							"Snaf";
	npctype =						npctype_Main;
	guild =							GIL_VLK;
	level =							5;
	
	
	voice =							1;
	id =							581;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_CookSmith", 	0, 			1,			"Hum_Head_Fighter", 81, 		1, 			-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente -------- 
   B_SetFightSkills(self,30);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_Light_01);
	CreateInvItem	(self, ItMi_Stuff_Cup_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_581;
};

FUNC VOID Rtn_start_581 ()
{
    TA_Cook		(08,00,22,00,"OCR_CAULDRON_2");
	TA_SitAround (22,00,22,30, "OCR_HUT_14");
	TA_Sleep		(22,30,08,00,"OCR_HUT_14");
};
FUNC VOID Rtn_nockruka_581 ()
{
    TA_CookForMe		(08,00,22,00,"SNAF_NK");
	TA_CookForMe		(22,00,08,00,"SNAF_NK");
};

