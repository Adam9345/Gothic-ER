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
	description		= "Mo�esz mnie czego� nauczy�?"; 
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
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_Info_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_Info_13_02"); //Mog� ci� nauczy� strzelania z kuszy. To ci� b�dzie kosztowa� 200 bry�ek. 
	if (log_gornarancrossbow == FALSE)
	
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Ran poka�e mi jak strzela� z kuszy za 200 bry�ek rudy.");
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
   description	= "Oto ruda. (200 bry�ek)";
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
    AI_Output (other, self ,"DIA_GorNaRan_CROSSBOW_OK_15_01"); //Oto ruda. (200 bry�ek)
    AI_Output (self,  other,"DIA_GorNaRan_CROSSBOW_OK_15_02"); //Dobra. Bierzmy si� do roboty.
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
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Pilnuj�, �eby b�otne w�e nie podp�ywa�y zbyt blisko Obozu.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //Na twoim miejscu trzyma�bym si� od nich z dala. W walce z takim potworem nie masz najmniejszych szans!
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //A teraz id� ju� sobie. Musz� mie� oczy szeroko otwarte.
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
   description	= "Dzia�o si� ostatnio co� ciekawego?";
};

FUNC INT DIA_GorNaRan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaRan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_HELLO1_15_01"); //Dzia�o si� ostatnio co� ciekawego?
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_02"); //Niestety b�otny w�� po�ar� jednego z naszych ludzi. Na moich oczach bestia wy�oni�a si� z bagna i wci�gn�a brodz�cego w wodzie cz�owieka!
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_03"); //Ha! Ta bestia ze�ar�a nawet miecz! Oby mu tak utkn�� w gardle!
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
   description	= "Baal Orun wys�a� mnie za tob�. Mamy ustali� sk�d unosz� si� truj�ce gazy.";
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
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_01"); //Baal Orun wys�a� mnie za tob�. Mamy ustali� sk�d unosz� si� truj�ce opary.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_02"); //Ju� to zrobi�em.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_03"); //A wi�c?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_04"); //Z oddali widzia�em ork�w na Cmentarzysku, przewodzi�o im jaki� szaman. Urz�dzali jaki� rytua�.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_05"); //Palili ca�e g�ry zw�ok innych zielonosk�rych. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_06"); //To zapewne efekt mojej niedawnej wizyty w tym miejscu. W takim razie trzeba wys�a� do Beliara r�wnie� i tych ork�w. Pal� truch�a, a opary z nich wkr�tce wyko�cz� ca�e Bractwo.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_07"); //Chyba musimy si� ich pozby�.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_08"); //Jacy my? Otrzyma�em rozkaz, by rozejrze� si� i ustali� sk�d wydobywaj� si� te truj�ce gazy.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_09"); //Nikt nie m�wi� mi, �e mam walczy� z orkami. A ju� na pewno ty mi tego nie wm�wisz.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_10"); //Chyba nie p�jdziesz, sobie st�d od tak?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_11"); //Mi�ej zabawy z orkami. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_12"); //Ty... Niewa�ne.
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	
	B_LogEntry          (CH4_ToxicFumes,"Spotka�em Gor Na Rana na miejscu. Stwierdzi�, �e jaki� orkowy szaman prowadzi tam wraz z kilkoma orkami rytua� pogrzebowy. Pal� oni cia�a poleg�ych ork�w. My�l�, �e te trupy pochodz� z Cmentarzyska Ork�w. By�em tam jaki� czas temu...");
	
	B_GiveXP (100);
};