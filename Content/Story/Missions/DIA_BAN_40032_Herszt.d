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

    Npc_SetTrueGuild (BAN_40032_Herszt,GIL_ORCSCOUT);
	BAN_40032_Herszt.guild = GIL_ORCSCOUT;
	
   Npc_SetTrueGuild (Org_40137_Organisator,GIL_ORCSCOUT);
	Org_40137_Organisator.guild = GIL_ORCSCOUT;
	
   Npc_SetTrueGuild (Org_40136_Organisator,GIL_ORCSCOUT);
	Org_40136_Organisator.guild = GIL_ORCSCOUT;

	

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

    DIAG_Reset();
	AI_TurnToNpc(self, BAN_40028_Connor);
	AI_Output (self, other, "TRIA_ConnorZemsta_0F"); //O mamy naszego bohatera. Connor powróci³! 
 
    TRIA_Cam("CAMERASTART");
  
    TRIA_Next(Connor);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (self,BAN_40032_Herszt);
    AI_Output (self, other, "TRIA_ConnorZemsta_04"); //Tak pokazaæ wam co znaczy moja zemsta.
	
    TRIA_Next(Herszt);
	DIAG_Reset();
 
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, BAN_40028_Connor);
    AI_Output (self, other, "TRIA_ConnorZemsta_05"); //Taki gamoñ? Trzymajcie mnie bo zdechnê ze œmiechu.
	AI_Output (self, other, "TRIA_ConnorZemsta_06"); //Ciesz siê lepiej, ¿e nikt ciê wtedy nie zabi³. A teraz wynoœ sie st¹d.
  
    TRIA_Cam("");

	TRIA_Next(Connor);
	DIAG_Reset();
    DIAG("Angry", 0, 4);
	AI_TurnToNpc (self,BAN_40032_Herszt);
    AI_Output (self, other, "TRIA_ConnorZemsta_07"); //le mnie zrozumia³eœ przyszed³em was za³atwiæ.

 
	TRIA_Next(Herszt);
    DIAG_Reset();
	AI_TurnToNpc(self, BAN_40028_Connor);
    AI_Output (self, other, "TRIA_ConnorZemsta_08"); //Hahahah! S³yszeliœcie? Ten maminsynek nam grozi!
	AI_Output (self, other, "TRIA_ConnorZemsta_09"); //W takim razie dostaniesz czego chcesz! Braæ tego m³odocianego szczura i jego przydupasa.
	
	TRIA_Next(Connor);
    DIAG_Reset();
	AI_TurnToNpc (self,BAN_40032_Herszt);
	AI_Output (self, other, "TRIA_ConnorZemsta_10"); //GryŸ piach frajerze!
	
    TRIA_Finish(); // und Ende
	CreateInvItems (BAN_40032_Herszt,     ItMi_ConnorItems     ,1);	 
	
	
    B_LogEntry                     (TrudnaPrzeszlosc,"Dotarliœmy do bandziorów, którzy niegdyœ wykiwali Connora. Szykuje siê kolejna walka.");	

	AI_StopProcessInfos (BAN_40032_Herszt);
	CONN_BANN_HOS();
};














