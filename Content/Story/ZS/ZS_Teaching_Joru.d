//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching_Joru
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching_Joru()
{	
    PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Joru");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching_Joru_Loop ()
{
    PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching_Joru_Loop");
	
	B_GotoFP 			(self,	"TEACHING");         

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	/*AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru1"); //Dawno temu Œni¹cy ukaza³ siê Y'Berionowi. Jaœnieoœwiecony by³ wtedy jednym z kopaczy i podobnie jak ci co za nim pod¹¿yli pragn¹³ wolnoœci.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru2"); //On i ci co zaufali s³owu Œni¹cego, nie chcieli d³u¿ej trwaæ w niewoli magnatów, nie chcieli s³uchaæ ich k³amstw. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru3"); //Osiedli wtedy tu - u podnó¿y staro¿ytnej œwi¹tyni i miejsce to sta³o siê ich domem. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru4"); //Da³ im niezale¿noœæ - od tej pory ¿aden z nas nie musi pracowaæ pod ziemi¹. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru5"); //Od tej pory przybywali tu ludzie, którzy nie chcieli d³u¿ej nosiæ jarzma nak³adanego na nich przez magnatów. 
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru6"); //Ludzie, którzy nie chcieli pozwoliæ, by strach nimi kierowa³.
	AI_Output(self, NULL, "ZS_Meditate_KazanieReloadJoru7"); //A Œni¹cy wskaza³ im drogê...
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


func void ZS_Teaching_Joru_End ()
{
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching_Joru_End");
};
