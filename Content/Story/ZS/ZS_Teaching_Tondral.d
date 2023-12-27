//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Tondral
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Tondral()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tondral");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Tondral_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Tondral_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral1"); //Jesteœmy ludem wybranym! To do nas bêdzie nale¿eæ wolnoœæ. Œni¹cy wyzwoli³ nas ju¿ z niewoli fa³szywych kultów. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral2"); //Wskaza³ nam drogê i otworzy³ nasze umys³y.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral3"); //Ilu¿ ludzi tkwi jeszcze w wierze w fa³szywych bogów, gdy zbli¿a siê godzina wyzwolenia? 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral4"); //BluŸniercy i czciciele fa³szywych bogów zap³acz¹ wtedy gorzko, gdy¿ Œni¹cy ukarze ich zaœlepienie.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral5"); //Zbudzi siê tedy pewnego dnia, wyzwoli swoich poddanych i str¹ci niewiernych w najczarniejsze czeluœci piekie³.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral6"); //Przeklêci niech bêd¹ k³amcy i bluŸniercy. Ich ³garstwa czyni¹ s³abych ludzi œlepcami. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral7"); //Kto inny chcia³by nosiæ niewolnicze jarzmo nak³adane ludziom przez Magnatów, je¿eli nie ludzie s³abi?
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral8"); //Ludzie ci zniewoleni wyrzekaj¹ siê swojej duszy! Wyrzekasz siê samych siebie! Nie pozwólcie, by strach wami kierowa³!
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral9"); //Ale Œni¹cy jest silniejszy ni¿ ich k³amstwa! Uwolni³ nas spod wp³ywu fa³szywych bogów. Da³ nam moc przejrzeæ na oczy!
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral10"); //Pokaza³ nam jaka moc drzemie w bagiennym zielu i wreszcie obdarzy³ niektórych z nas darem magii. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadTondral11"); //Magii staro¿ytnej i potê¿nej. Ró¿nej od tej, któr¹ wykorzystywali dot¹d magowie tego królestwa.
	*/
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


func void ZS_Teaching_Tondral_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Tondral_End");
};
