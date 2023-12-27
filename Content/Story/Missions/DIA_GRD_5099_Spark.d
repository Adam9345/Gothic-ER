//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_KwatermistrzPlac_EXIT(C_INFO)
{
	npc             = GRD_5099_Kwatermistrz;
	nr              = 999;
	condition		= DIA_KwatermistrzPlac_EXIT_Condition;
	information		= DIA_KwatermistrzPlac_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_KwatermistrzPlac_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_KwatermistrzPlac_HELLO1 (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_HELLO1_Condition;
   information  = DIA_KwatermistrzPlac_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_KwatermistrzPlac_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_02"); //Nazywam siê Spark, zajmujê siê rozporz¹dzaniem dostawami, organizowaniem konwojów, takie tam.
	AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_03"); //Wydajesz siê byæ milszy ni¿ pozosta³a czêœæ Stra¿ników. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_04"); //Tak, ch³opcy zgrywaj¹ twardzieli przed nowymi. W³aœnie dlatego maj¹ szacunek, poprzez zastraszanie...
	AI_Output (other, self ,"DIA_KwatermistrzPlac_HELLO1_15_05"); //A ciebie szacunek nie obchodzi?
	AI_Output (self, other ,"DIA_KwatermistrzPlac_HELLO1_03_06"); //Obchodzi, ale przyda³aby siê mi twoja pomoc...
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_KwatermistrzPlac_PERM (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_PERM_Condition;
   information  = DIA_KwatermistrzPlac_PERM_Info;
   permanent	= 1;
   description	= "Jak leci?";
};

FUNC INT DIA_KwatermistrzPlac_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_KwatermistrzPlac_PERM_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_PERM_15_01"); //Jak leci?
	if (MIS_FirstQuest == LOG_SUCCESS) 
	{
    AI_Output (self, other ,"DIA_KwatermistrzPlac_PERM_03_02"); //Dobrze! W dalszym ci¹gu mam z nich ubaw! Ha ha...
	}
	else
	{
	AI_Output (self, other ,"DIA_KwatermistrzPlac_PERM_03_03"); //Gdyby Stra¿nicy mnie nie wkurzali, by³oby lepiej.
	};
};

//========================================
//-----------------> QUEST
//========================================

INSTANCE DIA_KwatermistrzPlac_QUEST (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_QUEST_Condition;
   information  = DIA_KwatermistrzPlac_QUEST_Info;
   permanent	= 0;
   description	= "A wiêc w czym mogê ci pomóc?";
};

FUNC INT DIA_KwatermistrzPlac_QUEST_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_NONE) && (Npc_KnowsInfo (hero, DIA_KwatermistrzPlac_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_KwatermistrzPlac_QUEST_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_QUEST_15_01"); //A wiêc w czym mogê ci pomóc?
    AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_02"); //Jak widzisz mam tu trochê zapasów. Wszystko, co siê znajduje w skrzyniach i beczkach jest spisane w ksi¹¿kach, które le¿¹ na stole. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_03"); //Co jakiœ czas muszê to wszystko podliczaæ. Praktycznie zawsze wyniki siê nie zgadzaj¹, a to dlatego, ¿e co chwila przy³azi tu jakiœ Stra¿nik i bierze coœ do ¿arcia.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_04"); //Podbieraj¹ nie tylko jab³ka, ale tak¿e szynkê dostarczan¹ prosto od rzeŸnika z Khorinis. Myœlê, ¿e nie daliby rady zjeœæ na raz tyle miêsa.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_05"); //Na pewno maj¹ tu gdzieœ kryjówkê, w której ukrywaj¹ smako³yki. Poszukasz jej dla mnie? W spisie brakuje mi piêæ du¿ych kawa³ków szynki. 
	AI_Output (self, other ,"DIA_KwatermistrzPlac_QUEST_03_06"); //Przy okazji pozbieraj te¿ jab³ka, które porozrzucali po okolicy. Zgodnie ze spisem powinno byæ ich dziesiêæ sztuk. 
	
	//log
	MIS_FirstQuest = LOG_RUNNING;
	Log_CreateTopic          (Ch1_FirstQuest, LOG_MISSION);
    Log_SetTopicStatus       (Ch1_FirstQuest, LOG_RUNNING);
    B_LogEntry               (Ch1_FirstQuest,"Kwatermistrz z placu wymian poprosi³ mnie o ma³¹ przys³ugê. Stra¿nicy obs³uguj¹cy plac wymian podkradaj¹ z jego zapasów jedzenie. Spark twierdzi, ¿e maj¹ gdzieœ w okolicy kryjówkê, w której ukrywaj¹ smako³yki. Muszê j¹ odnaleŸæ i przynieœæ kilka kawa³ków szynki, które powinny w niej byæ. Powinienem tak¿e pozbieraæ jab³ka le¿¹ce w okolicy.");
};

//========================================
//-----------------> SUCCESS
//========================================

INSTANCE DIA_KwatermistrzPlac_SUCCESS (C_INFO)
{
   npc          = GRD_5099_Kwatermistrz;
   nr           = 1;
   condition    = DIA_KwatermistrzPlac_SUCCESS_Condition;
   information  = DIA_KwatermistrzPlac_SUCCESS_Info;
   permanent	= 0;
   description	= "Mam jab³ka i odnalaz³em kryjówkê.";
};

FUNC INT DIA_KwatermistrzPlac_SUCCESS_Condition()
{
	if (Npc_GetTrueGuild    (hero) == GIL_NONE) && (MIS_FirstQuest == LOG_RUNNING) && Npc_HasItems (other,itfoapple) >=10 && Npc_HasItems (other,itfo_mutton_01) >= 5
	{
    return TRUE;
	};
};

FUNC VOID DIA_KwatermistrzPlac_SUCCESS_Info()
{
    AI_Output (other, self ,"DIA_KwatermistrzPlac_SUCCESS_15_01"); //Mam jab³ka i odnalaz³em kryjówkê.
    AI_Output (self, other ,"DIA_KwatermistrzPlac_SUCCESS_03_02"); //Œwietnie, gdzie by³a?
	AI_Output (other, self ,"DIA_KwatermistrzPlac_SUCCESS_15_03"); //W krzakach ko³o bramy.
	AI_Output (self, other ,"DIA_KwatermistrzPlac_SUCCESS_03_04"); //Ha ha, ch³opcy siê nieŸle zdziwi¹! Dziêki za pomoc. Bêd¹ z ciebie ludzie. Masz tu 15 bry³ek rudy.
	
	//items
	B_GiveInvItems (other,self,itfoapple,10);
	B_GiveInvItems (other,self,itfo_mutton_01,5);
	//prize
	B_GiveInvItems (self,other,itminugget,15);
	B_GiveXP (75);
	//log
	MIS_FirstQuest = LOG_SUCCESS;
    Log_SetTopicStatus       (Ch1_FirstQuest, LOG_SUCCESS);
    B_LogEntry               (Ch1_FirstQuest,"Kwatermistrz Spark by³ bardzo zadowolony z tego, ¿e przynios³em mu jab³ka i szynkê.");
};
