//poprawione i sprawdzone -  

// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_GRD_275_PreExit (C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 999;
	condition	= Info_GRD_275_PreExit_Condition;
	information	= Info_GRD_275_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_GRD_275_PreExit_Condition()
{
	if ( (Kapitel<=1) )
	{
		return 1;
	};
};

FUNC VOID Info_GRD_275_PreExit_Info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01"); //IdŸ jak najszybciej do Starego Obozu! Tam ju¿ czekaj¹ na ciebie z nowiuteñkim kilofem. Hi hi hi!
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------

INSTANCE Info_GRD_275_Exit (C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 999;
	condition	= Info_GRD_275_Exit_Condition;
	information	= Info_GRD_275_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_GRD_275_Exit_Condition()
{
	if ( (Kapitel>1)||Npc_KnowsInfo(hero,Info_GRD_275_PreExit) )
	{
		return 1;
	};
};

FUNC VOID Info_GRD_275_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 							Was macht ihr hier?
// *****************************************************************

INSTANCE Info_GRD_275_WasMachtIhrHier (C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 1;
	condition	= Info_GRD_275_WasMachtIhrHier_Condition;
	information	= Info_GRD_275_WasMachtIhrHier_Info;
	permanent	= 1;
	description = "Czym siê tutaj zajmujecie?";
};                       

FUNC INT Info_GRD_275_WasMachtIhrHier_Condition()
{
	return 1;
};

FUNC VOID Info_GRD_275_WasMachtIhrHier_Info()
{
	AI_Output (other,self,"Info_GRD_275_WasMachtIhrHier_15_00"); //Czym siê tutaj zajmujecie?
	AI_Output (self,other,"Info_GRD_275_WasMachtIhrHier_06_01"); //A na co ci to wygl¹da? Pilnujemy mostu!
	AI_Output (self,other,"Info_GRD_275_WasMachtIhrHier_06_02"); //Pilnujemy, ¿eby ¿adne paskudztwa nie przedosta³y siê na drug¹ stronê.
};

// *****************************************************************
// 								Tips
// *****************************************************************

INSTANCE Info_GRD_275_Tips(C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 1;
	condition	= Info_GRD_275_Tips_Condition;
	information	= Info_GRD_275_Tips_Info;
	permanent	= 1;
	description = "Masz dla mnie jakieœ dobre rady?";
};                       

FUNC INT Info_GRD_275_Tips_Condition()
{
	return 1;
};

FUNC VOID Info_GRD_275_Tips_Info()
{
	AI_Output (other,self,"Info_GRD_275_Tips_15_00"); //Masz dla mnie jakieœ dobre rady?
	AI_Output (self,other,"Info_GRD_275_Tips_06_01"); //Tak. Nie zapuszczaj siê do lasu w pojedynkê.
	AI_Output (self,other,"Info_GRD_275_Tips_06_02"); //Chyba, ¿e jesteœ wystarczaj¹co silny, ¿eby daæ sobie radê ze zwierzakami.
};




//========================================
//-----------------> CONVOY
//========================================

INSTANCE DIA_Brueckenwache_CONVOY (C_INFO)
{
   npc          = GRD_275_Brueckenwache;
   nr           = 1;
   condition    = DIA_Brueckenwache_CONVOY_Condition;
   information  = DIA_Brueckenwache_CONVOY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brueckenwache_CONVOY_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Gamal_GoToMine))
{
    return TRUE;
};
};
FUNC VOID DIA_Brueckenwache_CONVOY_Info()
{
    AI_Output (self, other ,"DIA_Brueckenwache_CONVOY_03_01"); //Oto i konwój. W zasiêgu naszego wzroku jesteœcie bezpieczni.
    AI_Output (self, other ,"DIA_Brueckenwache_CONVOY_03_02"); //Ale w lesie bêdziecie zdani na w³asne si³y. 
    AI_Output (other, self ,"DIA_Brueckenwache_CONVOY_15_03"); //Jesteœmy tego œwiadomi.
    AI_Output (self, other ,"DIA_Brueckenwache_CONVOY_03_04"); //Obyœcie ujrzeli jeszcze za ¿ycia Star¹ Kopalnie.
    AI_Output (other, self ,"DIA_Brueckenwache_CONVOY_15_05"); //Mo¿e nie jest to widok marzeñ ale wszystko przed nami.
    AI_Output (self, other ,"DIA_Brueckenwache_CONVOY_03_06"); //Powodzenia zatem.
};




/*
	AI_Output(other,self,"Info_GRD_275_PreExit_15_02"); //Ich werde bestimmt nicht in den Minen für euch schuften.
	AI_Output(self,other,"Info_GRD_275_PreExit_06_03"); //In dem Fall bist du wohl unser zukünftiger Kollege? Dann sei schön lieb zu uns, wir sind nämlich morgen auch noch da, hehe.
	AI_Output(other,self,"Info_GRD_275_PreExit_15_04"); //Ich habe gehört es gibt auch noch andere Lager...
	AI_Output(self,other,"Info_GRD_275_PreExit_06_05"); //So wie du rumläufst schaffst Du es nicht mal bis dahin zu kommen. Und jetzt weg mit dir.
*/
