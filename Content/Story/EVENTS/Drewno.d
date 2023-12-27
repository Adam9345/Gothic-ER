 func void Drewno_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	= MOBSI_WOODWORK;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};
// rutynadoylea LOCATION_11_12
/*
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

*/
//========================================
//-----------------> ENDEWOOD
//========================================

INSTANCE DIA_PC_Hero_ENDEWOOD (C_INFO)
{
   npc          = PC_Hero;
   nr           = 99;
   condition    = DIA_PC_Hero_ENDEWOOD_Condition;
   information  = DIA_PC_Hero_ENDEWOOD_Info;
   permanent	= true;
   description	= DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_ENDEWOOD_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_WOODWORK)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_ENDEWOOD_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WOODWORK1
//========================================

INSTANCE DIA_PC_Hero_WOODWORK1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_WOODWORK1_Condition;
   information  = DIA_PC_Hero_WOODWORK1_Info;
   permanent	= true;
   description	= "Tnij drewno.";
};

FUNC INT DIA_PC_Hero_WOODWORK1_Condition()
{
    if  (PLAYER_MOBSI_PRODUCTION	==	MOBSI_WOODWORK)
	&& (Npc_HasItems (hero, ItMi_Wood_01) >=1)
	&& (hero.attribute[ATR_HITPOINTS] > 11)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_WOODWORK1_Info()
{
PrintScreen ("Poci��e� ga��zie!",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMi_Wood_01, 1);
CreateInvItems (hero, ItMi_Wood_02, 1);
hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 2;
if (hero.attribute[ATR_HITPOINTS] > 20) 
{

} 
else 
{
PrintScreen ("Jeste� troch� zm�czony!",-1,53,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
if (hero.attribute[ATR_HITPOINTS] < 11)
{
PrintScreen ("Jeste� zbyt zm�czony, aby kontynuowa� prac�!",-1,25,"font_old_10_red.tga",3); //fixed?
};
};

