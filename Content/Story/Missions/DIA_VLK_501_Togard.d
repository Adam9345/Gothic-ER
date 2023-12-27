//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Togard_EXIT(C_INFO)
{
	npc             = VLK_501_Buddler;
	nr              = 999;
	condition		= DIA_Togard_EXIT_Condition;
	information		= DIA_Togard_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Togard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Togard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//	Need Workers
// **************************************************
INSTANCE DIA_Togard_NeedWorkers (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_NeedWorkers_Condition;
	information		= DIA_Togard_NeedWorkers_Info;
	permanent		= 0;
	important		= 0;
	description		= "S³ysza³em, ¿e w Kopalni mo¿na znaleŸæ cenne minera³y!";
};

FUNC INT DIA_Togard_NeedWorkers_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Snaf_LookingForWorkers) && MIS_ZmianaLorenza == LOG_RUNNING 
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_NeedWorkers_Info()
{
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_00"); //S³ysza³em, ¿e w Kopalni mo¿na znaleŸæ cenne minera³y!
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_01"); //I dlaczego przychodzisz z tym do mnie?
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_02"); //Lorenzo kaza³ mi zorganizowaæ now¹ zmianê. Dowiedzia³em siê, ¿e interesuj¹ ciê takie rzeczy, wiêc postanowi³em zarezerwowaæ dla ciebie miejsce.
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_03"); //(ironicznie) Cholera, pierwszy raz spotykam siê z kimœ, kto siê tak troszczy o innych. 
	AI_Output (other,self,"DIA_Togard_NeedWorkers_15_04"); //Chcia³em pomóc. 
	AI_Output (self,other,"DIA_Togard_NeedWorkers_09_05"); //To przynieœ mi jakiœ dowód. Nie mam zamiaru schodziæ na dó³ na marne. Zw³aszcza, ¿e mam jeszcze trochê rudy.
	B_LogEntry               (CH1_ZmianaLorenza,"Togard chce dowodu na to, ¿e w Kopalni jest coœ co go zainteresuje. ");
};

// **************************************************
//	Give Fake Ore
// **************************************************
INSTANCE DIA_Togard_GiveFakeOre (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_GiveFakeOre_Condition;
	information		= DIA_Togard_GiveFakeOre_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie bry³kê czarnej rudy.";
};

FUNC INT DIA_Togard_GiveFakeOre_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Togard_NeedWorkers) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (other,itmi_Fakeblackore) >=1 && !Npc_KnowsInfo(hero, DIA_Togard_GiveRaport)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_GiveFakeOre_Info()
{
	AI_Output (other,self,"DIA_Togard_GiveFakeOre_15_00"); //Mam dla ciebie bry³kê czarnej rudy.
	AI_Output (self,other,"DIA_Togard_GiveFakeOre_09_01"); //Poka¿ mi to! Naprawdê niesamowite... Wygl¹da inaczej ni¿ te, które bada³em za Barier¹.
	AI_Output (other,self,"DIA_Togard_GiveFakeOre_15_02"); //W takim razie wyruszasz do Kopalni?
	AI_Output (self,other,"DIA_Togard_GiveFakeOre_09_03"); //Oczywiœcie. Spotkamy siê pod chat¹ Lorenzo.  
	B_LogEntry               (CH1_ZmianaLorenza,"Togard przyj¹³ podrobion¹ bry³kê czarnej rudy. Mam nadziejê, ¿e szybko siê nie zorientuje o moim podstêpie.");
	B_GiveXP (50);
	Npc_ExchangeRoutine (self,"lorenzo");
	TogardPrzekonany = true;
	B_GiveInvItems (hero,self,itmi_Fakeblackore,1);
};

// **************************************************
//	Give Raport
// **************************************************
INSTANCE DIA_Togard_GiveRaport (C_INFO)
{
	npc				= VLK_501_Buddler;
	nr				= 2;
	condition		= DIA_Togard_GiveRaport_Condition;
	information		= DIA_Togard_GiveRaport_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam tu raport ze Starej Kopalni.";
};

FUNC INT DIA_Togard_GiveRaport_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Togard_NeedWorkers) && MIS_ZmianaLorenza == LOG_RUNNING && Npc_HasItems (other,itmi_OM_LorenzoRaport) >=1 && !Npc_KnowsInfo(hero, DIA_Togard_GiveFakeOre)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Togard_GiveRaport_Info()
{
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_00"); //Mam tu raport ze Starej Kopalni.
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_01"); //Czemu mia³by mnie on interesowaæ? I dlaczego ryzykowa³eœ kradzie¿ tak wa¿nego dokumentu?
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_02"); //Sam zobacz.
	B_UseFakeScroll();
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_03"); //Mówi³eœ, ¿e zbierasz ludzi do kolejnej zmiany do Kopalni, tak? Dopisz mnie do listy.
	AI_Output (other,self,"DIA_Togard_GiveRaport_15_04"); //Œwietnie. Spotykamy siê pod chat¹ Lorenzo.
	AI_Output (self,other,"DIA_Togard_GiveRaport_09_05"); //Dobra, a teraz zmykaj szybko oddaæ ten raport, bo bêdziesz mia³ k³opoty.
	B_LogEntry               (CH1_ZmianaLorenza,"Togard przeczyta³ raport i zgodzi³ siê udaæ do Kopalni.");
	B_GiveXP (100);
	Npc_ExchangeRoutine (self,"lorenzo");
	TogardPrzekonany = true;
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Togard_HELLO1 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 1;
   condition    = DIA_Togard_HELLO1_Condition;
   information  = DIA_Togard_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Togard_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Togard_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Togard_HELLO1_03_02"); //Jestem Togard i pochodzê z... a zreszt¹ w Kolonii Karnej nie liczy siê sk¹d pochodzisz, no chyba, ¿e wi¹¿e siê to z jakimiœ umiejêtnoœciami. 
    AI_Output (self, other ,"DIA_Togard_HELLO1_03_03"); //W sumie pochodzenie liczy siê jeszcze, gdy jesteœ Varantczykiem – ich nikt tutaj nie lubi. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Togard_HELLO2 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 2;
   condition    = DIA_Togard_HELLO2_Condition;
   information  = DIA_Togard_HELLO2_Info;
   permanent	= FALSE;
   description	= "Czemu w Kolonii nie lubi¹ Varantczyków? ";
};

FUNC INT DIA_Togard_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO2_15_01"); //Czemu w Kolonii nie lubi¹ Varantczyków? 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_02"); //Widaæ nie widzia³eœ zarazy, któr¹ ci nomadzi przywlekli z tej swojej pustyni. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_03"); //Ludzie padali jak muchy i z powodu epidemii trzeba by³o na³o¿yæ kwarantannê na jedn¹ z dzielnic Starego Obozu. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_04"); //Najwiêkszego jednak pecha mieli ci, których oddelegowano do pomocy przy zara¿onych. Bukhart i Jesse siê pochorowali, ale uda³o im siê jakoœ wylizaæ. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_05"); //Mniej szczêœcia mieli Amirg i Kanno. Jak ja dziêkujê, ¿e to nie mnie pos³ano do tej roboty przy dotkniêtych zaraz¹. 
    AI_Output (self, other ,"DIA_Togard_HELLO2_03_06"); //Nie dziw siê wiêc, ¿e ma³o kto lubi tu Varantczyków. W dodatku nie tak dawno Myrtana mia³a z nimi wojnê, wiêc… 
    AI_Output (other, self ,"DIA_Togard_HELLO2_15_07"); //Rozumiem.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Togard_HELLO3 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 3;
   condition    = DIA_Togard_HELLO3_Condition;
   information  = DIA_Togard_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak leci? ";
};

FUNC INT DIA_Togard_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO3_15_01"); //Jak leci? 
    AI_Output (self, other ,"DIA_Togard_HELLO3_03_02"); //Niczego sobie, choæ trudno wymagaæ od ¿ycia w Kolonii zbyt wiele. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Togard_HELLO4 (C_INFO)
{
   npc          = VLK_501_Buddler;
   nr           = 4;
   condition    = DIA_Togard_HELLO4_Condition;
   information  = DIA_Togard_HELLO4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz¹dzi?";
};

FUNC INT DIA_Togard_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Togard_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Togard_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Togard_HELLO4_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Togard_HELLO4_03_02"); //Po co pytasz, jak dobrze wiesz? 
};

