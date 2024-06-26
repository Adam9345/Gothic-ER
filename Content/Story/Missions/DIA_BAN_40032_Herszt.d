//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_HersztORG_EXIT(C_INFO)
{
	npc             = BAN_40032_Herszt;
	nr              = 999;
	condition		= DIA_HersztORG_EXIT_Condition;
	information		= DIA_HersztORG_EXIT_Info;
	permanent		= TRUE;
	description 	= DIALOG_ENDE;
};

FUNC INT DIA_HersztORG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_HersztORG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ENEMY
//========================================


func void CONN_BANN_HOS()
{

	var c_npc Herszt;    	Herszt = Hlp_GetNpc(BAN_40032_Herszt);
	AI_EquipBestRangedWeapon(Herszt);

    Npc_SetTrueGuild (BAN_40032_Herszt,GIL_BDT);
	Npc_SetPermAttitude (BAN_40032_Herszt, ATT_HOSTILE);
	BAN_40032_Herszt.guild = GIL_BDT;

    Npc_SetTrueGuild (Org_40137_Organisator,GIL_BDT);
	Npc_SetPermAttitude (Org_40137_Organisator, ATT_HOSTILE);
	Org_40137_Organisator.guild = GIL_BDT;
	
    Npc_SetTrueGuild (Org_40136_Organisator,GIL_BDT);
	Npc_SetPermAttitude (Org_40136_Organisator, ATT_HOSTILE);
	Org_40136_Organisator.guild = GIL_BDT;

};


instance TRIA_ConnorZemsta (C_INFO)
{
    npc         = BAN_40032_Herszt;
    nr          = 10;
    condition   = TRIA_ConnorZemsta_condition;
    information = TRIA_ConnorZemsta_info;
    important   = true;
    permanent   = false;
};

func int TRIA_ConnorZemsta_condition()
{
	if (Npc_GetDistToWP(hero,"WP_TP_BAN1")<500)
	&& (Npc_KnowsInfo (hero, DIA_Connor_Cienie))
	{
    return TRUE;
	};
};

func void TRIA_ConnorZemsta_info()
{
    var c_npc Herszt;    	Herszt = Hlp_GetNpc(BAN_40032_Herszt); 
    var c_npc Connor; 		Connor = Hlp_GetNpc(BAN_40028_Connor);	
  
	TRIA_Invite(Herszt);
    TRIA_Invite(Connor); 
    TRIA_Start();    
  
    TRIA_Next(Herszt);

    //DIAG_Reset();
	AI_TurnToNpc(self, BAN_40028_Connor);
	AI_Output (self, other, "TRIA_ConnorZemsta_0F"); //O mamy naszego bohatera. Connor powr�ci�! 
 
    //TRIA_Cam("CAMERASTART");
  
    TRIA_Next(Connor);
	//DIAG_Reset();
	AI_GotoNpc(self, other);
    //DIAG("No", 0, 1);
	AI_TurnToNpc (self,BAN_40032_Herszt);
    AI_Output (self, other, "TRIA_ConnorZemsta_04"); //Tak pokaza� wam co znaczy moja zemsta.
	
    TRIA_Next(Herszt);
	//DIAG_Reset();
 
    //DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, BAN_40028_Connor);
    AI_Output (self, other, "TRIA_ConnorZemsta_05"); //Taki gamo�? Trzymajcie mnie bo zdechn� ze �miechu.
	AI_Output (self, other, "TRIA_ConnorZemsta_06"); //Ciesz si� lepiej, �e nikt ci� wtedy nie zabi�. A teraz wyno� sie st�d.
  
    //TRIA_Cam("");

	TRIA_Next(Connor);
	//DIAG_Reset();
    //DIAG("Angry", 0, 4);
	AI_TurnToNpc (self,BAN_40032_Herszt);
    AI_Output (self, other, "TRIA_ConnorZemsta_07"); //�le mnie zrozumia�e� przyszed�em was za�atwi�.

 
	TRIA_Next(Herszt);
    //DIAG_Reset();
	AI_TurnToNpc(self, BAN_40028_Connor);
    AI_Output (self, other, "TRIA_ConnorZemsta_08"); //Hahahah! S�yszeli�cie? Ten maminsynek nam grozi!
	AI_Output (self, other, "TRIA_ConnorZemsta_09"); //W takim razie dostaniesz czego chcesz! Bra� tego m�odocianego szczura i jego przydupasa.
	
	TRIA_Next(Connor);
    //DIAG_Reset();
	AI_TurnToNpc (self,BAN_40032_Herszt);
	AI_Output (self, other, "TRIA_ConnorZemsta_10"); //Gry� piach frajerze!
	
    TRIA_Finish(); // und Ende
	CreateInvItems (BAN_40032_Herszt,     ItMi_ConnorItems     ,1);	 
	AI_Function(other, CONN_BANN_HOS);
	
    B_LogEntry                     (TrudnaPrzeszlosc,"Dotarli�my do bandzior�w, kt�rzy niegdy� wykiwali Connora. Szykuje si� kolejna walka.");	

	AI_StopProcessInfos (BAN_40032_Herszt);
	
};

instance dia_herszt_pickpocket(c_info) {
    npc = ban_40032_herszt;
    nr = 900;
    condition = dia_herszt_pickpocket_condition;
    information = dia_herszt_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_herszt_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 35);
};

func void dia_herszt_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_herszt_pickpocket);
	info_addchoice(dia_herszt_pickpocket, dialog_back, dia_herszt_pickpocket_back);
	info_addchoice(dia_herszt_pickpocket, dialog_pickpocket, dia_herszt_pickpocket_doit);
};

func void dia_herszt_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_herszt_pickpocket);
};

func void dia_herszt_pickpocket_back() {
    info_clearchoices(dia_herszt_pickpocket);
};












