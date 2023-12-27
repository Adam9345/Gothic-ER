instance SLD_709_Cord (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Cord";
	Npctype =						Npctype_Main;
	guild =							GIL_SLD;       
	level =							18;
	
	voice =							14;
	id =							709;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	520;
	attribute[ATR_HITPOINTS] =		520;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				49hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald",104 , 1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
B_SetFightSkills(self,100);
	//-------- inventory --------                                    

	EquipItem (self, Cords_Spalter);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 23);
    B_CreateAmbientInv (self);
	CreateInvItems (self, ItFo_Potion_Health_02,8);

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_709;
};

FUNC VOID Rtn_start_709 ()
{
    TA_Sleep	(21,00,07,00,"NC_HUT09_IN");
	TA_Boss		(07,00,21,00,"NC_WATERFALL_TOP01_MOVEMENT");
};

FUNC VOID Rtn_FMTaken_709 ()
{	
	TA_Stay		(00,00,	23,00,"OW_PATH_075");    
	TA_Stay		(23,00,	24,00,"OW_PATH_075");     
};	
FUNC VOID Rtn_mine_709 ()
{	
	TA_Stand_Ignorance		(00,00,	23,00,"CAMP02");    
	TA_Stand_Ignorance		(23,00,	24,00,"CAMP02");     
};	

//Gdy Gorn idzie na spotkanie.
FUNC VOID Rtn_FMDef_709 ()
{	
	TA_GuardPassage	(01,00,13,00,	"FMC_PATH26");
	TA_GuardPassage	(13,00,01,00,	"FMC_PATH26");   
};	


//obóz moroka
FUNC VOID Rtn_droga1_709 ()
{
	TA_FollowPC		(08,00,23,00,"CAMP01");
	TA_FollowPC		(23,00,01,15,"CAMP01");			
};
//polowanie na cieniostwora
FUNC VOID Rtn_CIENIOSTWOR_709 ()
{
	TA_GuidePC		(08,00,23,00,"WP_ADD_PZ_02");
	TA_GuidePC		(23,00,01,15,"WP_ADD_PZ_02");			
};
FUNC VOID Rtn_CIENIOSTWOR2_709 ()
{
	TA_GuidePC		(08,00,23,00,"PTH9");
	TA_GuidePC		(23,00,01,15,"PTH9");			
};
