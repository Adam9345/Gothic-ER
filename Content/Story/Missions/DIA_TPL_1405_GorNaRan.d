//poprawione i sprawdzone -  

// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/
var int log_gornarancrossbow;
instance  GRD_205_gornaran_CROSSBOW (C_INFO)
{
	npc				= TPL_1405_GorNaRan;
	condition		= GRD_205_gornaran_CROSSBOW_Condition;
	information		= GRD_205_gornaran_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC int  GRD_205_gornaran_CROSSBOW_Condition()
{	
if (!kapitel == 6)
{
		return TRUE;
	};

};
FUNC void  GRD_205_gornaran_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_Info_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_Info_13_02"); //Mogê ciê nauczyæ strzelania z kuszy. To ciê bêdzie kosztowaæ 200 bry³ek. 
	if (log_gornarancrossbow == FALSE)
	
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Ran poka¿e mi jak strzelaæ z kuszy za 200 bry³ek rudy.");
		log_gornarancrossbow = TRUE;
	};

};  

	//========================================
//-----------------> CROSSBOW_OK
//========================================

INSTANCE DIA_GorNaRan_CROSSBOW_OK (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_CROSSBOW_OK_Condition;
   information  = DIA_GorNaRan_CROSSBOW_OK_Info;
   permanent	= FALSE;
   description	= "Oto ruda. (200 bry³ek)";
};

FUNC INT DIA_GorNaRan_CROSSBOW_OK_Condition()
{
 if (Npc_HasItems (other, itminugget) >=200)
 &&(Npc_KnowsInfo(hero,GRD_205_gornaran_CROSSBOW))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaRan_CROSSBOW_OK_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_CROSSBOW_OK_15_01"); //Oto ruda. (200 bry³ek)
    AI_Output (self,  other,"DIA_GorNaRan_CROSSBOW_OK_15_02"); //Dobra. Bierzmy siê do roboty.
	B_GiveInvItems (other,self, itminugget, 200);	   
    Info_ClearChoices(DIA_GorNaRan_CROSSBOW_OK);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,DIALOG_BACK,DIA_GorNaRan_CROSSBOW_BACK);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_GorNaRan_Teach_Crossbow_1);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_GorNaRan_Teach_Crossbow_5);
	
	
	
};



func void Dia_GorNaRan_Teach_Crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_GorNaRan_CROSSBOW_OK);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,Dialog_Back,DIA_GorNaRan_CROSSBOW_BACK);
	
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_GorNaRan_Teach_Crossbow_1);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_GorNaRan_Teach_Crossbow_5);
};

func void Dia_GorNaRan_Teach_Crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_GorNaRan_CROSSBOW_OK);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,Dialog_Back,DIA_GorNaRan_CROSSBOW_BACK);
	
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_GorNaRan_Teach_Crossbow_1);
	Info_AddChoice(DIA_GorNaRan_CROSSBOW_OK,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_GorNaRan_Teach_Crossbow_5);
};
func void DIA_GorNaRan_CROSSBOW_BACK()
{
	Info_ClearChoices(DIA_GorNaRan_CROSSBOW_OK);
};


// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Co tu robisz?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
if (Npc_GetDistToWP(hero,"PSI_GUARD3")<500)
{
	return TRUE;
};
};
FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Pilnujê, ¿eby b³otne wê¿e nie podp³ywa³y zbyt blisko Obozu.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //Na twoim miejscu trzyma³bym siê od nich z dala. W walce z takim potworem nie masz najmniejszych szans!
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //A teraz idŸ ju¿ sobie. Muszê mieæ oczy szeroko otwarte.
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaRan_HELLO1 (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_HELLO1_Condition;
   information  = DIA_GorNaRan_HELLO1_Info;
   permanent	= FALSE;
   description	= "Dzia³o siê ostatnio coœ ciekawego?";
};

FUNC INT DIA_GorNaRan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaRan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_HELLO1_15_01"); //Dzia³o siê ostatnio coœ ciekawego?
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_02"); //Niestety b³otny w¹¿ po¿ar³ jednego z naszych ludzi. Na moich oczach bestia wy³oni³a siê z bagna i wci¹gnê³a brodz¹cego w wodzie cz³owieka!
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_03"); //Ha! Ta bestia ze¿ar³a nawet miecz! Oby mu tak utkn¹³ w gardle!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fumes
//========================================

INSTANCE DIA_GorNaRan_Fumes (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_Fumes_Condition;
   information  = DIA_GorNaRan_Fumes_Info;
   permanent	= FALSE;
   description	= "Baal Orun wys³a³ mnie za tob¹. Mamy ustaliæ sk¹d unosz¹ siê truj¹ce gazy.";
};

FUNC INT DIA_GorNaRan_Fumes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalOrun_ToxicFumes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaRan_Fumes_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_01"); //Baal Orun wys³a³ mnie za tob¹. Mamy ustaliæ sk¹d unosz¹ siê truj¹ce opary.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_02"); //Ju¿ to zrobi³em.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_03"); //A wiêc?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_04"); //Z oddali widzia³em orków na Cmentarzysku, przewodzi³o im jakiœ szaman. Urz¹dzali jakiœ rytua³.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_05"); //Palili ca³e góry zw³ok innych zielonoskórych. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_06"); //To zapewne efekt mojej niedawnej wizyty w tym miejscu. W takim razie trzeba wys³aæ do Beliara równie¿ i tych orków. Pal¹ truch³a, a opary z nich wkrótce wykoñcz¹ ca³e Bractwo.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_07"); //Chyba musimy siê ich pozbyæ.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_08"); //Jacy my? Otrzyma³em rozkaz, by rozejrzeæ siê i ustaliæ sk¹d wydobywaj¹ siê te truj¹ce gazy.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_09"); //Nikt nie mówi³ mi, ¿e mam walczyæ z orkami. A ju¿ na pewno ty mi tego nie wmówisz.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_10"); //Chyba nie pójdziesz, sobie st¹d od tak?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_11"); //Mi³ej zabawy z orkami. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_12"); //Ty... Niewa¿ne.
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	
	B_LogEntry          (CH4_ToxicFumes,"Spotka³em Gor Na Rana na miejscu. Stwierdzi³, ¿e jakiœ orkowy szaman prowadzi tam wraz z kilkoma orkami rytua³ pogrzebowy. Pal¹ oni cia³a poleg³ych orków. Myœlê, ¿e te trupy pochodz¹ z Cmentarzyska Orków. By³em tam jakiœ czas temu...");
	
	B_GiveXP (100);
};