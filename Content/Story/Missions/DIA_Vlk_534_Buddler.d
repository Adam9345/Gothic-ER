//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 0;
	description		= "Dlaczego siedzisz tutaj, a nie w Obozie?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Dlaczego siedzisz tutaj, a nie w Obozie?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Czekam, a¿ mój przyjaciel wróci z kopalni. Jest mi winien parê bry³ek rudy.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nie mogê siê pokazaæ w Obozie bez rudy - nie staæ mnie na zap³acenie za ochronê, a wolê nie ryzykowaæ ¿yciem.

	//AI_StopProcessInfos	(self);
};

// **************************************************
// 				Your Friend Name
// **************************************************

INSTANCE DIA_Vlk_534_Quest (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_Quest_Condition;
	information		= DIA_Vlk_534_Quest_Info;
	permanent		= 0;
	description		= "Jak siê nazywa³ twój przyjaciel?";
};

FUNC INT DIA_Vlk_534_Quest_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Vlk_534_LeaveMe)
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_534_Quest_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_Quest_15_00"); //Jak siê nazywa³ twój przyjaciel?
	AI_Output (self, other,"DIA_Vlk_534_Quest_02_01"); //Danny, spokojny goœæ. Powiedzia³, ¿e wkrótce wykopie swoj¹ normê i pojawi siê w Obozie. Czekam i czekam, a jego nie widaæ.
	AI_Output (self, other,"DIA_Vlk_534_Quest_02_02"); //Mam nadziejê, ¿e nie wpad³ w ¿adne k³opoty. 

	MIS_BuddlerDanny = LOG_RUNNING;
	Log_CreateTopic          (CH1_BuddlerDanny, LOG_MISSION);
    Log_SetTopicStatus       (CH1_BuddlerDanny, LOG_RUNNING);
    B_LogEntry               (CH1_BuddlerDanny,"Jeden z Kopaczy siedz¹cych przed Starym Obozem zdradzi³ mi, ¿e czeka na kumpla, który wkrótce mia³ wróciæ z Kopalni. Coœ go jednak powstrzymuje. W sumie to móg³bym go poszukaæ, gdy bêdê w Starej Kopalni.");
};

// **************************************************
// 				Finish Ths Quest
// **************************************************

INSTANCE DIA_Vlk_534_Success (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_Success_Condition;
	information		= DIA_Vlk_534_Success_Info;
	permanent		= 0;
	description		= "Rozmawia³em z twoim kumplem.";
};

FUNC INT DIA_Vlk_534_Success_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Vlk_5070_Quest) && MIS_BuddlerDanny == LOG_RUNNING
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_534_Success_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_Success_15_00"); //Rozmawia³em z twoim kumplem.
	AI_Output (self, other,"DIA_Vlk_534_Success_02_01"); //I co u niego s³ychaæ? Kiedy wreszcie ruszy tu swoje dupsko?
	AI_Output (other, self,"DIA_Vlk_534_Success_15_02"); //Nieprêdko. Wpad³ w ma³e tarapaty i wybrn¹³ z nich, ale straci³ rudê. Bêdziesz musia³ poczekaæ zanim wykopie wszystko od nowa.
	AI_Output (self, other,"DIA_Vlk_534_Success_02_03"); //O cholera! 

	MIS_BuddlerDanny = LOG_Success;
    Log_SetTopicStatus       (CH1_BuddlerDanny, LOG_Success);
    B_LogEntry               (CH1_BuddlerDanny,"Powiedzia³em Kopaczowi sprzed Obozu, ¿e jego kumpel straci³ ca³¹ rudê.");
	B_GiveXP (150);
};