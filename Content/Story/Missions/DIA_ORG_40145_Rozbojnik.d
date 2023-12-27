// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================
func void Bandits_RespawnZND()
{
     AI_DrawWeapon (STT_40143_Hargos);
	// AI_Wait( ORG_40144_Rozbojnik,4);
	// AI_Wait( ORG_40146_Rozbojnik,4);
	 Wld_InsertNpc				(ORG_40144_Rozbojnik,"OW_PATH_256");
	 Wld_InsertNpc				(ORG_40146_Rozbojnik,"WP_ZND_ROZ2");	
	 B_ChangeGuild( ORG_40144_Rozbojnik, GIL_ORCSCOUT);
	 B_ChangeGuild( ORG_40145_Rozbojnik, GIL_ORCSCOUT );
	 B_ChangeGuild( ORG_40146_Rozbojnik, GIL_ORCSCOUT );
};
INSTANCE DIA_Rozbojnik_EXIT(C_INFO)
{
	npc             = ORG_40145_Rozbojnik;
	nr              = 999;
	condition	    = DIA_Rozbojnik_EXIT_Condition;
	information	    = DIA_Rozbojnik_EXIT_Info;
	permanent	    = TRUE;
	description     = "(KONIEC)";
};

FUNC INT DIA_Rozbojnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rozbojnik_EXIT_Info()
{
    
	
	 AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Rozbojnik_HELLO1 (C_INFO)
{
   npc          = ORG_40145_Rozbojnik;
   nr           = 1;
   condition    = DIA_Rozbojnik_HELLO1_Condition;
   information  = DIA_Rozbojnik_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rozbojnik_HELLO1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hargos_Hargos_Get_Wood))
	//&& 
{
    return TRUE;
};
};
FUNC VOID DIA_Rozbojnik_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1_03_01"); //Sta� gnidy. Przejmuje wasze dobra I pozbawiam was �ycia.
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO1_15_02"); //Przejmujesz powiadasz? Mi�o, �e postanowi�e� nas o�wiecie�. Nie domy�li�bym si�...
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1_03_03"); //Zarozumia�y gn�j. No ch�opaki chod�cie tu, we�my im wszystko co maj�!
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Napotkali�my rozb�jnik�w chc�cych nas obrabowa�. Musimy czym pr�dzej pos�a� ich do piachu.");
	STT_40143_Hargos.flags = NPC_FLAG_IMMORTAL;
	AI_StopProcessInfos	(self);
	Bandits_RespawnZND();

};

