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
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1_03_01"); //Staæ gnidy. Przejmuje wasze dobra I pozbawiam was ¿ycia.
    AI_Output (other, self ,"DIA_Rozbojnik_HELLO1_15_02"); //Przejmujesz powiadasz? Mi³o, ¿e postanowi³eœ nas oœwiecieæ. Nie domyœli³bym siê...
    AI_Output (self, other ,"DIA_Rozbojnik_HELLO1_03_03"); //Zarozumia³y gnój. No ch³opaki chodŸcie tu, weŸmy im wszystko co maj¹!
	B_LogEntry               (ZapotrzebowanieNaDrewno,"Napotkaliœmy rozbójników chc¹cych nas obrabowaæ. Musimy czym prêdzej pos³aæ ich do piachu.");
	STT_40143_Hargos.flags = NPC_FLAG_IMMORTAL;
	AI_StopProcessInfos	(self);
	Bandits_RespawnZND();

};

instance dia_rozbojnik_pickpocket(c_info) {
    npc = org_40145_rozbojnik;
    nr = 900;
    condition = dia_rozbojnik_pickpocket_condition;
    information = dia_rozbojnik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rozbojnik_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_rozbojnik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rozbojnik_pickpocket);
	info_addchoice(dia_rozbojnik_pickpocket, dialog_back, dia_rozbojnik_pickpocket_back);
	info_addchoice(dia_rozbojnik_pickpocket, dialog_pickpocket, dia_rozbojnik_pickpocket_doit);
};

func void dia_rozbojnik_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_rozbojnik_pickpocket);
};

func void dia_rozbojnik_pickpocket_back() {
    info_clearchoices(dia_rozbojnik_pickpocket);
};