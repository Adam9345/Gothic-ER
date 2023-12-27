/*
***************************************
//STARY KOD
****************************************
	//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_EXITFishing(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition	= DIA_PC_Hero_EXITFishing_Condition;
	information	= DIA_PC_Hero_EXITFishing_Info;
	permanent	= TRUE;
	description     = "ZAKOÑCZ";
};

FUNC INT DIA_PC_Hero_EXITFishing_Condition()
{
    if (monolog == Rybactwo)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_EXITFishing_Info()
{
Mdl_ApplyOverlayMDSTimed	(self, "HUMANS.MDS", 5);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Przyneta
//========================================

INSTANCE DIA_PC_Hero_Przyneta (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Przyneta_Condition;
   information  = DIA_PC_Hero_Przyneta_Info;
   permanent	= true;
   description	= "Wybierz przynêtê";
};

FUNC INT DIA_PC_Hero_Przyneta_Condition()
{
    if (monolog == Rybactwo)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Przyneta_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Przyneta);
    Info_AddChoice		(DIA_PC_Hero_Przyneta, "[WRÓÆ]", DIA_PC_Hero_Przyneta_BACK);
	if (Npc_HasItems (other, ItFoLoaf) >=1)
    {
    Info_AddChoice		(DIA_PC_Hero_Przyneta, "Chleb", DIA_PC_Hero_Przyneta_Chleb);
	};
	if (Npc_HasItems (other, ItFoMuttonRaw) >=1)
    {	
    Info_AddChoice		(DIA_PC_Hero_Przyneta, "Surowe miêso", DIA_PC_Hero_Przyneta_SuroweMieso);
	};
	if (Npc_HasItems (other, ItFoRice) >=1)
    {	
    Info_AddChoice		(DIA_PC_Hero_Przyneta, "Ry¿", DIA_PC_Hero_Przyneta_Rice);
	};
};

FUNC VOID DIA_PC_Hero_Przyneta_BACK()
{
    Info_ClearChoices		(DIA_PC_Hero_Przyneta);
};

FUNC VOID DIA_PC_Hero_Przyneta_Chleb()
{
AI_PlayAni (hero, "s_Angel_S0");
Npc_RemoveInvItems (hero, ItFoLoaf, 1);
	Losowanie_fish1 = Hlp_Random (8);
	if (Losowanie_fish1 == 1) || (Losowanie_fish1 == 3) || (Losowanie_fish1 == 4) || (Losowanie_fish1 == 7)
	{
	Print ("Z³owi³eœ p³otkê!");
	B_GiveXP (10);
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish1 == 5) 
	{
	Print ("Z³owi³eœ sandacza!");
	B_GiveXP (10);
	CreateInvItems (hero, ItFo_Fish3, 1);
	};
	if (Losowanie_fish1 == 8) 
	{
	Print ("Wy³owi³eœ glona!");
	B_GiveXP (5);
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish1 == 2) || (Losowanie_fish1 == 6) 
	{
	Print ("Nic nie z³owi³eœ!");
	};
	};
	


FUNC VOID DIA_PC_Hero_Przyneta_SuroweMieso()
{
AI_PlayAni (hero, "s_Angel_S0");
Npc_RemoveInvItems (hero, ItFoMuttonRaw, 1);
	Losowanie_fish2 = Hlp_Random (10);
	if (Losowanie_fish2 == 1) || (Losowanie_fish2 == 3) 
	{
	Print ("Z³owi³eœ p³otkê!");
	B_GiveXP (10);
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish2 == 5) || (Losowanie_fish2 == 4) || (Losowanie_fish2 == 7)
	{
	Print ("Z³owi³eœ ptsr¹ga!");
	B_GiveXP (25);
	CreateInvItems (hero, ItFo_Fish2, 1);
	};
	if (Losowanie_fish2 == 2) 
	{
	Print ("Wy³owi³eœ glona!"); 
	B_GiveXP (5);
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish2 == 8) || (Losowanie_fish2 == 6) 
	{
	Print ("Nic nie z³owi³eœ!");
	};
	if (Losowanie_fish2 == 9) 
	{
	Print ("Z³owi³eœ karasia!");
	B_GiveXP (30);
	CreateInvItems (hero, ItFo_Fish4, 1);
	};
	if (Losowanie_fish2 == 10) 
	{
	Print ("Walczysz z pstr¹giem têczowym!");
	Losowanie_pstragMieso = Hlp_Random (2);
	};
	if Losowanie_pstragMieso 
	{
	Print ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!");
	B_GiveXP (50);
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	Print ("Ryba uciek³a!");
	};
	};


FUNC VOID DIA_PC_Hero_Przyneta_Rice()
{
AI_PlayAni (hero, "s_Angel_S0");
Npc_RemoveInvItems (hero, ItFoRice, 1);
	Losowanie_fish4 = Hlp_Random (12);
	if (Losowanie_fish4 < 5)  
	{
	Print ("Z³owi³eœ p³otkê!");
	B_GiveXP (10);
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish4 == 11) 
	{
	Print ("Wy³owi³eœ glona!"); 
	B_GiveXP (5);
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish4 == 8) || (Losowanie_fish4 == 10) 
	{
	Print ("Nic nie z³owi³eœ!");
	};
	if (Losowanie_fish4 == 9) || (Losowanie_fish4 == 7) 
	{
	Print ("Z³owi³eœ karasia!");
	B_GiveXP (30);
	CreateInvItems (hero, ItFo_Fish4, 1);
	};
	if (Losowanie_fish4 == 12)  || (Losowanie_fish4 == 6) 
	{
	Print ("Walczysz z pstr¹giem têczowym!");
	Losowanie_pstragRice = Hlp_Random (2);
	};
	if Losowanie_pstragRice 
	{
	Print ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!");
	B_GiveXP (50);
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	Print ("Ryba uciek³a!");
	};
};

*/

func void fishing_main_func ()
{

};


/*
func void RYBACTWO_S1 ()
{

var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
if (Npc_GetDistToWP (hero, "POMOST") < 300) || (Npc_GetDistToWP (hero, "POMOST2") < 300) || (Npc_GetDistToWP (hero, "POMOST3") < 300) || (Npc_GetDistToWP (hero, "POMOST4") < 300) || (Npc_GetDistToWP (hero, "POMOST5") < 300)
|| (Npc_GetDistToWP (hero, "POMOST6") < 300) || (Npc_GetDistToWP (hero, "POMOST7") < 300) || (Npc_GetDistToWP (hero, "POMOST8") < 300) || (Npc_GetDistToWP (hero, "POMOST9") < 300) || (Npc_GetDistToWP (hero, "POMOST10") < 300)
 {
 
if (Npc_HasItems (hero, ItMi_bait_02) >=1)
{
	Npc_RemoveInvItems (hero, ItMi_bait_02, 1);
	Losowanie_fish2 = Hlp_Random (10);
	if (Losowanie_fish2 == 1) || (Losowanie_fish2 == 7) 
	{
	Print ("Z³owi³eœ p³otkê!");
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish2 == 2)
	{
	Print ("Z³owi³eœ pstr¹ga!");
	CreateInvItems (hero, ItFo_Fish2, 1);
	};
	if (Losowanie_fish2 == 4) || (Losowanie_fish2 == 10)
	{
	Print ("Wy³owi³eœ glona!"); 
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish2 == 4) 
	{
	Print ("Nic nie z³owi³eœ!");
	};
	if (Losowanie_fish2 == 5) || (Losowanie_fish2 == 9)
	{
	Print ("Z³owi³eœ karasia!");
	CreateInvItems (hero, ItFo_Fish4, 1);
	};
	if (Losowanie_fish2 == 6) || (Losowanie_fish2 == 8)
	{
	Print ("Walczysz z pstr¹giem têczowym!");
	Losowanie_SuperFish = Hlp_Random (2);
	if Losowanie_SuperFish 
	{
	Print ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!");
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	Print ("Ryba uciek³a!");
	};
	};
}
else if (Npc_HasItems (hero, ItMi_bait_01) >=1)
{

Npc_RemoveInvItems (hero, ItMi_bait_01, 1);

	Losowanie_fish4 = Hlp_Random (10);	//100%
	if (Losowanie_fish4 == 1) || (Losowanie_fish4 == 3)  || (Losowanie_fish4 == 6)  || (Losowanie_fish4 == 8)  
	{
	Print ("Z³owi³eœ p³otkê!");
	CreateInvItems (hero, ItFo_Fish6, 1);
	};
	if (Losowanie_fish4 == 2)  || (Losowanie_fish4 == 4)  
	{
	Print ("Wy³owi³eœ glona!"); 
	CreateInvItems (hero, ItFo_Plants_Glon, 1);
	};
	if (Losowanie_fish4 == 4)  || (Losowanie_fish4 == 5)  || (Losowanie_fish4 == 7)  
	{
	Print ("Nic nie z³owi³eœ!");
	};
	if (Losowanie_fish4 == 9)  
	{
	Print ("Walczysz z pstr¹giem têczowym!");
	Losowanie_SuperFish = Hlp_Random (2);
	if Losowanie_SuperFish 
	{
	Print ("Uda³o siê! Z³owi³eœ pstr¹ga têczowego!");
	CreateInvItems (hero, ItFo_Fish5, 1);
	} else {
	Print ("Ryba uciek³a!");
	};
	};
};
print ("napis");	
} 
else
{ 
//print ("WARUNEK_ELSE_DZIA£A");
PrintScreen ("Nie mo¿esz tu ³owiæ!", -1, -1, "Font_New_10_Red.TGA", 1);
};
};
};
*/
