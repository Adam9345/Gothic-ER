//****************************
// 		PC_Rest 
//****************************

func void PC_Rest (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))	
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};
	
	PrintS_Ext("Czujesz siê wypoczêty...", COL_Lime);
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
   
	
	
};

func void PC_Rest_ZND (var int t)
{
	//AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))	
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};
	
	PrintS_Ext("Szybko minê³o...", COL_Lime);

   
	
	
};

var int Hargos_End_Work;


func void Rest_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	   PLAYER_MOBSI_PRODUCTION	=	MOBSI_REST;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//-------------------- Gar nicht schlafen -------------------------

INSTANCE PC_Rest_End (c_Info)

{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_Rest_End_Condition;
	information		= PC_Rest_End_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};

FUNC INT PC_Rest_End_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)

    {
		return 1;
	};
};

func VOID PC_Rest_End_Info()
{
	AI_StopProcessInfos (self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
};

//---------------------- morgens --------------------------------------

INSTANCE PC_RestTime_Morning (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_RestTime_Morning_Condition;
	information		= PC_RestTime_Morning_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zaczekaj do nastêpnego poranka"; 
};

FUNC INT PC_RestTime_Morning_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)
&& (Hero_Use_BenchZND != TRUE)
    {
		return 1;
		};
};

func void PC_RestTime_Morning_Info ()
{
	PC_Rest (8);	// SN: geändert, da um 7 Uhr noch keiner der NSCs wach ist!
};

//--------------------- mittags -----------------------------------------

INSTANCE PC_RestTime_Noon (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_RestTime_Noon_Condition;
	information		= PC_RestTime_Noon_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zaczekaj do po³udnia"; 
};

FUNC INT PC_RestTime_Noon_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)
&& (Hero_Use_BenchZND != TRUE)
    {
		return 1;
	};
};

func void PC_RestTime_Noon_Info ()
{
	PC_Rest (12);
};

//---------------------- abend --------------------------------------

INSTANCE PC_RestTime_Evening (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_RestTime_Evening_Condition;
	information		= PC_RestTime_Evening_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zaczekaj do nastêpnego wieczora"; 
};

FUNC INT PC_RestTime_Evening_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)
&& (Hero_Use_BenchZND != TRUE)
    {
		return 1;
		};
};

func void PC_RestTime_Evening_Info ()
{
	PC_Rest (19);
};

//------------------------ nacht -----------------------------------------

instance PC_RestTime_Midnight (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_RestTime_Midnight_Condition;
	information		= PC_RestTime_Midnight_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zaczekaj do pó³nocy"; 
};

FUNC INT PC_RestTime_Midnight_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)
&& (Hero_Use_BenchZND != TRUE)
    {
		return 1;
		};
};

func VOID PC_RestTime_Midnight_Info()
{
	PC_Rest (0);	
};





INSTANCE PC_RestTime_ZND (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_RestTime_ZND_Condition;
	information		= PC_RestTime_ZND_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zaczekaj a¿ Hargos skoñczy pracê."; 
};

FUNC INT PC_RestTime_ZND_Condition()
{		
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_REST)
&& (Hero_Use_BenchZND == TRUE)
    {
		return 1;
	};
};

func void PC_RestTime_ZND_Info ()
{
 //   FF_ApplyOnceExt(Blackscreen, 1, BlackscreenDuration);
    Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	AI_StopProcessInfos (self);
    AI_StandUpQuick(hero);
    //FF_Apply (Blackscreen);
   
    Hero_Use_BenchZND = FALSE;
    Hargos_End_Work = TRUE;
	PC_Rest_ZND (12);
	Wld_InsertItem			(ItMi_HargosWood,"FP_ITEM_ZND_1");
	Wld_InsertItem			(ItMi_HargosWood,"FP_ITEM_ZND_2");
	Wld_InsertItem			(ItMi_HargosWood,"FP_ITEM_ZND_3");
	
	
};









