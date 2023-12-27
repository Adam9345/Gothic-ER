//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Nek_EXIT(C_INFO)
{
	npc             = GRD_3085_Nek;
	nr              = 999;
	condition	= DIA_Nek_EXIT_Condition;
	information	= DIA_Nek_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Nek_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nek_HELLO1 (C_INFO)
{
   npc          = GRD_3085_Nek;
   nr           = 1;
   condition    = DIA_Nek_HELLO1_Condition;
   information  = DIA_Nek_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nek_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nek_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_01"); //Czego tu szukasz?
	AI_Output (other, self ,"DIA_Nek_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_02"); //A co ciê to obchodzi?
	AI_Output (other, self ,"DIA_Nek_HELLO1_15_03"); //No dobra. W takim razie nie przeszkadzam...
    AI_Output (self, other ,"DIA_Nek_HELLO1_03_04"); //Masz racjê! IdŸ sobie!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Exposed
//========================================

INSTANCE DIA_Nek_Exposed (C_INFO)
{
   npc          = GRD_3085_Nek;
   nr           = 1;
   condition    = DIA_Nek_Exposed_Condition;
   information  = DIA_Nek_Exposed_Info;
   permanent	= FALSE;
   description	= "W twojej chacie wisi zbroja Stra¿nika.";
};

FUNC INT DIA_Nek_Exposed_Condition()
{
	if ((MIS_WheresNek == LOG_RUNNING) && Npc_KnowsInfo(hero,DIA_Fletcher_WoNek2))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nek_Exposed_Info()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_15_01"); //W twojej chacie wisi zbroja Stra¿nika.
    AI_Output (self, other ,"DIA_Nek_Exposed_03_02"); //To... trofeum... 
	AI_Output (other, self ,"DIA_Nek_Exposed_15_03"); //Jasne... Daruj sobie, Nek. Przysy³aj¹ mnie twoi starzy przyjaciele. 
    AI_Output (self, other ,"DIA_Nek_Exposed_03_04"); //Co chcesz zrobiæ?
	AI_Output (other, self ,"DIA_Nek_Exposed_15_05"); //Fletcher domaga siê twojej g³owy. Przypuszczam, ¿e reszta Stra¿ników równie¿. Z kolei Snaf chce po prostu wiedzieæ, gdzie jesteœ.
	AI_Output (self, other ,"DIA_Nek_Exposed_03_06"); //S³uchaj, nie mam teraz zbyt du¿o rudy. 100 bry³ek wystarczy? Nie mów nikomu, ¿e mnie widzia³eœ.
	
	Info_ClearChoices	(DIA_Nek_Exposed);
	Info_AddChoice		(DIA_Nek_Exposed, "Chc¹ trupa to bêd¹ go mieli.", DIA_Nek_Exposed_KILL);
	Info_AddChoice		(DIA_Nek_Exposed, "Umowa stoi. Powiem im, ¿e nie ¿yjesz.", DIA_Nek_Exposed_OK);
	Info_AddChoice		(DIA_Nek_Exposed, "To trochê za ma³o.", DIA_Nek_Exposed_MONEY);
	
	B_LogEntry               (CH1_WheresNek,"Znalaz³em Neka w Nowym Obozie. Ukry³ siê w chacie Butcha. Na œcianie wisi zbroja cz³onka Starego Obozu. Stra¿nik zaproponowa³ mi uk³ad: ruda w zamian za ¿ycie.");	
	
	GRD_3085_Nek.name = "Nek";
};

func void DIA_Nek_Exposed_KILL ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_KILL_15_01"); //Chc¹ trupa to bêd¹ go mieli.
    AI_Output (self, other ,"DIA_Nek_Exposed_KILL_03_02"); //Szkoda, ¿e nie masz w³asnego rozumu! 
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	B_LogEntry               (CH1_WheresNek,"Nie mia³em w planach dogadywaæ siê z Nekiem. Za swoj¹ ucieczkê powinien zap³aciæ g³ow¹.");	
	
	Info_ClearChoices	(DIA_Nek_Exposed);
};

func void DIA_Nek_Exposed_OK ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_OK_15_01"); //Umowa stoi. Powiem im, ¿e nie ¿yjesz.
    AI_Output (self, other ,"DIA_Nek_Exposed_OK_03_02"); //Rozs¹dna decyzja. Da³bym ci wiêcej, ale nie mam. Naprawdê, dziêki. 
	
	B_LogEntry               (CH1_WheresNek,"Wzi¹³em od Neka 100 bry³ek rudy w zamian za trzymanie jêzyka za zêbami. Jednak to niczego nie zmienia. Decyzjê o tym, czy wydam Neka podejmê ju¿ w Starym Obozie.");	
	
	Info_ClearChoices	(DIA_Nek_Exposed);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
};

func void DIA_Nek_Exposed_MONEY ()
{
	AI_Output (other, self ,"DIA_Nek_Exposed_MONEY_15_01"); //To trochê za ma³o.
    AI_Output (self, other ,"DIA_Nek_Exposed_MONEY_03_02"); //Wybacz kolego, ale nie mam ani bry³ki wiêcej. To jak, dogadamy siê?	
};

