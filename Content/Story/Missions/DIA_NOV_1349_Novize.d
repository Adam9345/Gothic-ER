// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Novize_EXIT(C_INFO)
{
	npc             = NOV_1349_Novize;
	nr              = 999;
	condition	= DIA_Novize_EXIT_Condition;
	information	= DIA_Novize_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Novize_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Novize_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloDude
//========================================

INSTANCE DIA_Novize_HelloDude (C_INFO)
{
   npc          = NOV_1349_Novize;
   nr           = 1;
   condition    = DIA_Novize_HelloDude_Condition;
   information  = DIA_Novize_HelloDude_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Novize_HelloDude_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HelloDude_Info()
{
    AI_Output (other, self ,"DIA_Novize_HelloDude_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Novize_HelloDude_03_02"); //Jestem Donato, jeden z Nowicjuszy Bractwa.
    AI_Output (self, other ,"DIA_Novize_HelloDude_03_03"); //Zajmujê siê zadaniami specjalnymi.
};

//========================================
//-----------------> YourWork
//========================================

INSTANCE DIA_Novize_YourWork (C_INFO)
{
   npc          = NOV_1349_Novize;
   nr           = 2;
   condition    = DIA_Novize_YourWork_Condition;
   information  = DIA_Novize_YourWork_Info;
   permanent	= FALSE;
   description	= "Czym dok³adnie siê tu zajmujesz?";
};

FUNC INT DIA_Novize_YourWork_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HelloDude))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_YourWork_Info()
{
    AI_Output (other, self ,"DIA_Novize_YourWork_15_01"); //Czym dok³adnie siê tu zajmujesz?
    AI_Output (self, other ,"DIA_Novize_YourWork_03_02"); //Nie mogê ci tego powiedzieæ. 
    AI_Output (self, other ,"DIA_Novize_YourWork_03_03"); //Cor Angar i Mistrz Y'Berion nie byliby zadowoleni.
    AI_Output (self, other ,"DIA_Novize_YourWork_03_04"); //Byæ mo¿e przyjdzie czas, gdy dowiesz siê wszystkiego.
    AI_Output (other, self ,"DIA_Novize_YourWork_15_05"); //W takim razie ruszam w dalsz¹ drogê.
};

