// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RozbojnikPZ_EXIT(C_INFO)
{
	npc             = Org_40159_Rozbojnik;
	nr              = 999;
	condition	= DIA_RozbojnikPZ_EXIT_Condition;
	information	= DIA_RozbojnikPZ_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RozbojnikPZ_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RozbojnikPZ_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Rozbojnik_HELLO1PZ (C_INFO)
{
   npc          = Org_40159_Rozbojnik;
   nr           = 1;
   condition    = DIA_Rozbojnik_HELLO1PZ_Condition;
   information  = DIA_Rozbojnik_HELLO1PZ_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rozbojnik_HELLO1PZ_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Homer_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Rozbojnik_HELLO1PZ_Info()
{
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1PZ_03_01"); //O prosz�. Chcia�e� pogada� z Fosterem? Za p�no!
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1PZ_03_02"); //Teraz sam Beliar go przepytuje haha!
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO1PZ_15_03"); //Chc� pogada� z waszym szefem.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1PZ_03_04"); //On realizuje tylko swoje cele a ty przeszkadzasz. Zejd� mi z drogi bo po�a�ujesz!
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO1PZ_15_05"); //Jak dobrze ci� zleje to wszystko wy�piewasz.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1PZ_03_06"); //Dobre sobie! �mieszny jeste� ch�optasiu!
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO1PZ_15_07"); //Ch�opta� zaraz zapewni ci par� siniak�w.
	
	  AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Rozbojnik_HELLO2 (C_INFO)
{
   npc          = Org_40159_Rozbojnik;
   nr           = 2;
   condition    = DIA_Rozbojnik_HELLO2_Condition;
   information  = DIA_Rozbojnik_HELLO2_Info;
   permanent	= FALSE;
   description	= "No i co b�dziesz gada�?";
};

FUNC INT DIA_Rozbojnik_HELLO2_Condition()
{
if 	(Npc_KnowsInfo(hero,DIA_Rozbojnik_HELLO1PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Rozbojnik_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO2_15_01"); //No i co b�dziesz gada�?
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO2_03_02"); //Cholera... Ahhhh dawno nikt tak mi nie obi� mordy. 
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO2_15_03"); //Je�li nie chcesz szybkiej powtr�ki to zacznij wsp�pracowa�.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO2_03_04"); //Czego ty chcesz?
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO2_15_05"); //Zaprowad� mnie do waszego obozowiska.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO2_03_06"); //A to po co niby?
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO2_15_07"); //Pogadam z waszym szefem. Wybije mu z g�owy jego pomys� z wa�nymi dokumentami ludzi z Nowego Obozu.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO2_03_08"); //Haha chcia�bym to zobaczy�.
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO2_15_09"); //I zobaczysz. Prowad� mnie do lidera waszej szajki.
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO2_03_10"); //Dobra niech b�dzie. Chcesz to masz...
	B_LogEntry           (PoszkodowaniZbieracze,"Rozb�jnicy zabili Fostera. Skupi�em si� na ostrze�eniu Lee a zbieracz r�wnolegle zosta� zamordowany. Pobi�em morderc� i wymusi�em by zaprowadzi� mnie do kryj�wki jego bandy.");
		
	
	
	
	Info_ClearChoices	(DIA_Rozbojnik_HELLO2);
	Info_AddChoice		(DIA_Rozbojnik_HELLO2, "(Szybka podr�)", DIA_Gorn_PZG);
  //  AI_StopProcessInfos	(self);
};
var int PZ_GoWithRobber;
FUNC VOID DIA_Gorn_PZG()
{
    
    PZ_GoWithRobber = True;
	Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    Npc_ExchangeRoutine(Org_40159_Rozbojnik,"GuidePZ");
	AI_StopProcessInfos	(self);
	AI_Teleport(Org_40159_Rozbojnik,"OW_PATH_039");
	AI_Teleport(hero,"OW_PATH_039");
	Wld_InsertNpc 	(ORG_40160_Szef,        "RUBEN_FRIEND2");
  	Wld_InsertNpc 	(Org_40161_Rozbojnik,   "RUBEN_FRIEND2");
	AI_StopProcessInfos	(self);
	Org_40159_Rozbojnik.attribute[ATR_HITPOINTS] 	= 440;
	Info_ClearChoices	(DIA_PC_Fighter_GOWH_PZ);
};
	
	
	


