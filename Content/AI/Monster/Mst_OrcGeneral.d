/*************************************************************************
**	Orc WARRIOR Prototype												**
*************************************************************************/
//edit by Reflide

PROTOTYPE Mst_Default_OrcGeneral(C_Npc)			
{
	name							=	"Ork-dowódca";
	guild							=	GIL_ORCSCOUT;
    npctype							=	NPCTYPE_MAIN;
	voice							=	18;
	level							=	45;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	110;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	550;
	attribute	[ATR_HITPOINTS]		=	550;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	120;
	protection	[PROT_FIRE]			=	65;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	40;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_MASTER;
//---------------------------------------------------------
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
//-------------------------------------------------------------
func void Set_OrcGeneral_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYGENERALS",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Orc Warrior 1 - Fighter    														**
*************************************************************************/
INSTANCE OrcGeneral_Rest	(Mst_Default_OrcGeneral)
{
	//-------- general --------
	name							=	"Ork-dowódca";
	level							=	45;
   // guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcGeneral_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcGeneral_Sword" ersetzen.

};

//              Przegrupowania Orków
//*************************************************************************/
INSTANCE OrcGeneral_Move_01	(Mst_Default_OrcGeneral)
{
	name							=	"Ork-dowódca";
    level							=	45;
   // guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcGeneral_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //W
};

INSTANCE OrcGeneral_Move_02	(Mst_Default_OrcGeneral)
{
	name							=	"Ork-dowódca";
    level							=	45;
   // guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcGeneral_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //W
};


INSTANCE OrcGeneral_Move_03	(Mst_Default_OrcGeneral)
{
	
 	name							=	"Ork-dowódca";
    level							=	45;
   // guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcGeneral_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //W
};

INSTANCE OrcGeneral_Move_04_Map	(Mst_Default_OrcGeneral)
{
	//-------- general --------
	name							=	"Starszy ork-dowódca";
	level							=	45;
  //  guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcGeneral_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02);
	CreateInvItem (self, ItWr_Map_Przegrupowania);
	
};
