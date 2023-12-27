// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Calum_EXIT(C_INFO)
{
	npc             = VLK_40068_Calum;
	nr              = 999;
	condition	= DIA_Calum_EXIT_Condition;
	information	= DIA_Calum_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Calum_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Calum_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_STATUE
//========================================

INSTANCE DIA_Calum_ZL_STATUE (C_INFO)
{
   npc          = VLK_40068_Calum;
   nr           = 1;
   condition    = DIA_Calum_ZL_STATUE_Condition;
   information  = DIA_Calum_ZL_STATUE_Info;
   permanent	= FALSE;
   description	= "Szukam pewnego pos¹¿ka.";
};

FUNC INT DIA_Calum_ZL_STATUE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buddler_ZL_STATUE))
{
    return TRUE;
};
};
FUNC VOID DIA_Calum_ZL_STATUE_Info()
{
    AI_Output (other, self ,"DIA_Calum_ZL_STATUE_15_01"); //Szukam pewnego pos¹¿ka.
    AI_Output (self, other ,"DIA_Calum_ZL_STATUE_03_02"); //No i co w zwi¹zku z tym?
    AI_Output (other, self ,"DIA_Calum_ZL_STATUE_15_03"); //Mo¿e go widzia³eœ. 
    AI_Output (self, other ,"DIA_Calum_ZL_STATUE_03_04"); //Mo¿e nawet go mam...
    AI_Output (other, self ,"DIA_Calum_ZL_STATUE_15_05"); //Ile za niego chcesz?
    AI_Output (self, other ,"DIA_Calum_ZL_STATUE_03_06"); //100 bry³ek rudy.
	B_LogEntry               (KsiegaDlaVictora,"Figurkê Erensa ma Kopacz Calum. Chcê za ni¹ 100 bry³ek rudy.");
};

//========================================
//-----------------> ZL_NUGGET
//========================================

INSTANCE DIA_Calum_ZL_NUGGET (C_INFO)
{
   npc          = VLK_40068_Calum;
   nr           = 2;
   condition    = DIA_Calum_ZL_NUGGET_Condition;
   information  = DIA_Calum_ZL_NUGGET_Info;
   permanent	= FALSE;
   description	= "Oto 100 bry³ek rudy.";
};

FUNC INT DIA_Calum_ZL_NUGGET_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Calum_ZL_STATUE))
&& (Npc_HasItems (other, ItMiNugget) >=100)
{
    return TRUE;
};
};
FUNC VOID DIA_Calum_ZL_NUGGET_Info()
{
    AI_Output (other, self ,"DIA_Calum_ZL_NUGGET_15_01"); //Oto 100 bry³ek rudy.
	B_GiveInvItems (other,self, itminugget, 100);
    AI_Output (self, other ,"DIA_Calum_ZL_NUGGET_03_02"); //Trzymaj pos¹¿ek.
	B_GiveInvItems (self,other, ItMi_ZL_Statue, 1);
    AI_Output (self, other ,"DIA_Calum_ZL_NUGGET_03_03"); //Dobry i szybki interes!
    AI_Output (other, self ,"DIA_Calum_ZL_NUGGET_15_04"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Calum_ZL_NUGGET_03_05"); //Na razie.
	B_LogEntry               (KsiegaDlaVictora,"Da³em 100 bry³ek rudy Calumowi i odkupi³em figurkê. Teraz pogadam z Erensem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_CALUM
//========================================

INSTANCE DIA_Calum_HI_CALUM (C_INFO)
{
   npc          = VLK_40068_Calum;
   nr           = 1;
   condition    = DIA_Calum_HI_CALUM_Condition;
   information  = DIA_Calum_HI_CALUM_Info;
   permanent	= FALSE;
   description	= "Co u Ciebie?";
};

FUNC INT DIA_Calum_HI_CALUM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Calum_HI_CALUM_Info()
{
    AI_Output (other, self ,"DIA_Calum_HI_CALUM_15_01"); //Co u Ciebie?
    AI_Output (self, other ,"DIA_Calum_HI_CALUM_03_02"); //Nêdznie. Ale có¿ mo¿e los siê odwróci.
    AI_Output (other, self ,"DIA_Calum_HI_CALUM_15_03"); //Masz jakiœ plan jak to zmieniæ?
    AI_Output (self, other ,"DIA_Calum_HI_CALUM_03_04"); //Nadal szukam recepty na poprawê bytu. Jak wiêszoœæ tej ohydnej Kolonii karnej.
    AI_Output (other, self ,"DIA_Calum_HI_CALUM_15_05"); //Rozumiem. Co porabia³eœ przed trafieniem tutaj?
    AI_Output (self, other ,"DIA_Calum_HI_CALUM_03_06"); //Moje ¿ycie by³o dobre dopóki nie pope³ni³em pewnego b³êdu za co siedzê tu ju¿ od wielu miesiêcy I wegetuje.
    AI_Output (other, self ,"DIA_Calum_HI_CALUM_15_07"); //Co zrobi³eœ?
    AI_Output (self, other ,"DIA_Calum_HI_CALUM_03_08"); //To ju¿ moja sprawa m³ody.
    AI_Output (other, self ,"DIA_Calum_HI_CALUM_15_09"); //W porz¹dku.
};

