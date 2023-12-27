// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Mosul_EXIT(C_INFO)
{
	npc			= NOV_40001_Mosul;
	nr			= 999;
	condition	= DIA_Mosul_EXIT_Condition;
	information	= DIA_Mosul_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mosul_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Mosul_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Mosul_Hello(C_INFO)
{
	npc			= NOV_40001_Mosul;
	nr			= 1;
	condition	= DIA_Mosul_Hello_Condition;
	information	= DIA_Mosul_Hello_Info;
	permanent	= false;
	description = "Oddaj figurk�, kt�r� ukrad�e�!";
};                       

FUNC INT DIA_Mosul_Hello_Condition()
{
	if (MosulRobStatue == TRUE)
{
	return 1;
};
};
FUNC VOID DIA_Mosul_Hello_Info()
{	
	AI_Output (other, self,"DIA_Mosul_Hello_15_02"); //Oddaj figurk�, kt�r� ukrad�e�!
	AI_Output (self, other,"DIA_Mosul_Hello_09_03"); //Powiedz Ghorimowi �eby sam sobie po ni� przyszed�. A ty sam odejd� bo rozwal� ci �eb!
	AI_Output (other, self,"DIA_Mosul_Hello_15_04"); //Nie przysy�a mnie Ghorim lecz Brago. Masz odda� jego w�asno��!
	AI_Output (self, other,"DIA_Mosul_Hello_09_05"); //No prosz� nagle okazuje si�, �e...	
	AI_Output (other, self,"DIA_Mosul_Hello_15_06"); //Do�� tego!
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
	
	MosulWalka = TRUE;
};



// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE DIA_Mosul_Figurka(C_INFO)
{
	npc			= NOV_40001_Mosul;
	nr			= 1;
	condition	= DIA_Mosul_Figurka_Condition;
	information	= DIA_Mosul_Figurka_Info;
	permanent	= false;
	description = "Gdyby� by� bardziej uprzejmy nie dosz�o by do tego.";
};                       

FUNC INT DIA_Mosul_Figurka_Condition()
{
	if (NOV_40001_Mosul.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (MosulWalka == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mosul_Figurka_Info()
{	
	AI_Output (other, self,"DIA_Mosul_Figurka_15_00"); //Gdyby� by� bardziej uprzejmy nie dosz�o by do tego. Ale chcia�e� mi co� powiedzie�. Co takiego?		
	AI_Output (self, other,"DIA_Mosul_Figurka_09_01"); //Ju� nic. Opr�cz tego, �e jeste� zwyk�ym naiwniakiem, kt�ry d�ugo nie po�yje w tej Kolonii. 	
	MosulWalka = FALSE;
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Mosul_HELLO1 (C_INFO)
{
   npc          = NOV_40001_Mosul;
   nr           = 1;
   condition    = DIA_Mosul_HELLO1_Condition;
   information  = DIA_Mosul_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co porabiasz?";
};

FUNC INT DIA_Mosul_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mosul_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Mosul_HELLO1_15_01"); //Co porabiasz?
    AI_Output (self, other ,"DIA_Mosul_HELLO1_03_02"); //�yje sobie. A ty zje�d�aj kole�!
    AI_Output (other, self ,"DIA_Mosul_HELLO1_15_03"); //Dlaczego?
    AI_Output (self, other ,"DIA_Mosul_HELLO1_03_04"); //Bo tak mi si� podoba. Won!
    AI_Output (other, self ,"DIA_Mosul_HELLO1_15_05"); //Bo co?
    AI_Output (self, other ,"DIA_Mosul_HELLO1_03_06"); //Bo zawo�am kumpli. Oni ju� si� tob� zajm�. Id� na bagno I pogadaj sobie z b�otynymi w�ami.
    AI_Output (other, self ,"DIA_Mosul_HELLO1_15_07"); //Udzielaj takich rad komu� innemu.
    AI_Output (self, other ,"DIA_Mosul_HELLO1_03_08"); //Wi�c przesta� mi zawraca� dup� I nie marnuj mego czasu.
    AI_StopProcessInfos	(self);
};

