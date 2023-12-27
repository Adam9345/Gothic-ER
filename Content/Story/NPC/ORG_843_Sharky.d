instance ORG_843_Sharky (Npc_Default)
{
	//-------- primary data --------
	
	name =			"Sharky";
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_ORG;      
	level =			8;
	flags       =   NPC_FLAG_IMMORTAL;
	voice =			10;
	id =			843;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;			
	
	//-------- Talente ----------

B_SetFightSkills(self,30);
				
	
	//-------- inventory --------   
		//----------Handlarz_aivar------
	self.aivar[AIV_NPCISTRADER] = true;
	B_Give_SharkyChapter1Weapons ();                                 
	
	CreateInvItems (self, ItKeLockpick,15);		
	CreateInvItems(self,  ItMiNugget, 50);
	CreateInvItems (self, ItFoRice,10);
	CreateInvItems (self, ItFoBooze, 5);
	CreateInvItems (self, ItLsTorch, 5);
	CreateInvItems (self, ItFo_Potion_Health_01, 5);
	CreateInvItems (self, ItFo_Konfitura, 5);
	CreateInvItems (self, ItFo_Sausage, 8);
	CreateInvItems (self, ItFo_GreenMushroom, 8);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_843;
	};

FUNC VOID Rtn_start_843 ()
{
	TA_Sleep			(03,00,08,00,"NC_HUT25_IN");
	TA_SitAround		(08,00,00,00,"NC_HUT25_OUT");
	TA_StandAround		(00,00,03,00,"NC_TAVERN_BAR"); //trifft Cipher
};

func void Rtn_catch_843 ()
{
	TA_StandAround		(08,00,00,00,"OW_WOODRUIN_SHARKY");
	TA_StandAround		(00,00,08,00,"OW_WOODRUIN_SHARKY"); 
};

func void Rtn_konwoj_843 ()
{
	TA_Lean		(08,00,00,00,"WP_SHARKY_KONWOJ");
	TA_Lean		(00,00,08,00,"WP_SHARKY_KONWOJ"); 
};











