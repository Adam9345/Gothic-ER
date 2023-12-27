//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Tyon
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Tyon()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tyon");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Tyon_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Tyon_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral1"); //Wiele lat temu Œni¹cy przyby³ tu i zes³a³ ludziom prorocz¹ wizjê.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral2"); //Jednak ludzie w swym zaœlepieniu nie chcieli dostrzec potêgi Œni¹cego. Chciwoœæ rudy uczyni³a ich œlepcami.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral3"); //Ale Y'Berion, wraz z nielicznymi us³ucha³ g³osu Œni¹cego i pod¹¿y³ jego œcie¿k¹.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral4"); //A ci co pod¹¿yli stali siê ludem wybranym. Tak powsta³o Bractwo.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral5"); //Œni¹cy wskaza³ Y'Berionowi i jego uczniom miejsce, w którym mieli siê osiedliæ. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral6"); //Wyruszy³ przeto Y'Berion na bagna, gdzie on i wybrani ods³onili prastar¹ œwi¹tyniê i osiedlili u jej podnó¿y.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral7"); //I wznosili wybrani wokó³ œwi¹tyni obóz, który sta³ siê domem wyznawców Œni¹cego.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral8"); //W dniach tych wybrani pracowali bezustannie, niebaczni na niebezpieczeñstwa i zmêczenie.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral9"); //Kolejni ludzie gotowi wys³uchaæ nauk Œni¹cego przybywali na ziemie uœwiêcone jego kultem. A Œni¹cy wskaza³ im drogê do wolnoœci!*/
	
	/*if (guardreaktion >= 900)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_11");
	}
	else if (guardreaktion >= 800)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_15");
	}
	else if (guardreaktion >= 700)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_16");
	}
	else if (guardreaktion >= 600)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_18");
		
	}
	else if (guardreaktion >= 500)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_21");
	}
	else if (guardreaktion >= 400)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_20");
	};*/
	
	AI_Wait				(self,	1);
};


func void ZS_Teaching_Tyon_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tyon_End");
};
