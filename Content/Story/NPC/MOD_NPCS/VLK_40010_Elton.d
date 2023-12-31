instance VLK_40010_Elton (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Elton";
	npctype =						npctype_main;
	guild =							GIL_GRD;      
	level =							3;
	
	
	voice =							3;
	id =							40010;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 102,  3, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talents  --------                                    

B_SetFightSkills(self,50);                       

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);


	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40010;
};

FUNC VOID Rtn_FMstart_40010 ()	//FM
{
	TA_PickOre		(00,00,23,00,"OM_023A");
	TA_PickOre		(23,00,24,00,"OM_023A");
};














