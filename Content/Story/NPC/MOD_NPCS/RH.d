//Mod helper


instance RH (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"RunicznyHelper";
	npctype		=	Npctype_Main;
	guild 		=	GIL_NONE;      

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY]	= 100;
	attribute[ATR_MANA_MAX] 	= 40;
	attribute[ATR_MANA] 		= 4;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS] 	= 250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     		,bdytex	,skin	,head mesh     		,headtex	,teethtex
	Mdl_SetVisualBody (self,"hum_body_Naked0"	,2,	1	,"Hum_Head_Bald"	, 4		,  1,-1);

	start_aistate = ZS_CH_Hangaround;//ustawia preception pod dialogi
	
};
