// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_2_EXIT_Condition;
	information	= Info_Bau_2_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bau_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_2_WichtigePersonen_Condition;
	information	= Info_Bau_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Pracujesz na polach ry�owych z w�asnej woli?";
};                       

FUNC INT Info_Bau_2_WichtigePersonen_Condition()
{
	IF (MIS_BuntZbieraczy != LOG_SUCCESS)
	{
	return 1;
	};
};

FUNC VOID Info_Bau_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Pracujesz na polach ry�owych z w�asnej woli?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Jasne! Lepsze to, ni� zosta� ZMUSZONYM do pracy przez oprych�w Ry�owego Ksi�cia!
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //Rozumiem...
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_2_DasLager_Condition;
	information	= Info_Bau_2_DasLager_Info;
	permanent	= 1;
	description = "Co mo�esz mi powiedzie� o Obozie?";
};                       

FUNC INT Info_Bau_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //Co mo�esz mi powiedzie� o Obozie?
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //Nie�atwo si� tu �yje. Najemnicy Lee i magowie s� w porz�dku, ale Szkodniki daj� si� wszystkim we znaki!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;	
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_2_DieLage_Condition;
	information	= Info_Bau_2_DieLage_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_Bau_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //Co s�ycha�?
	if (MIS_BuntZbieraczy == LOG_SUCCESS)
	{
	AI_Output(self,other,"Info_Bau_2_DieLage_02_03"); //Ry�owy Ksi�e nie �yje! Plan Rufusa si� powi�d�.
	AI_Output(self,other,"Info_Bau_2_DieLage_02_04"); //W ko�cu b�dzie nam si� �y� troch� lepiej.
	}
	else
	{
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //Czego chcesz? Przys�a� ci� Ry�owy Ksi��e? Pracuj� najlepiej jak potrafi�!
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Nikt mnie nie przys�a�! Chc� po prostu porozmawia�!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
	};
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_2_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_2_Wasser_Condition;
	information	= Info_Bau_2_Wasser_Info;
	permanent	= 1;
	description = "Przysy�a mnie Lewus. Przynios�em ci wod�.";
};                       

FUNC INT Info_Bau_2_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Bau_2_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Przysy�a mnie Lewus. Przynios�em ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output			(self,other,"Info_Bau_2_Wasser_02_01"); //O, dzi�ki. Umieram z pragnienia!

		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Woda! Hej, cz�owieku! Nic nie zosta�o! Tylko mi nie m�w, �e znowu wszyscy si� napili, opr�cz mnie!
	};
};
	
// *************************************************************************
// 									CORRUPTION
// *************************************************************************

INSTANCE Info_Bau_2_Corruption(C_INFO) 
{
	nr			= 800;
	condition	= Info_Bau_2_Corruption_Condition;
	information	= Info_Bau_2_Corruption_Info;
	permanent	= 1;
	description = "(przekup)";
};                       

FUNC INT Info_Bau_2_Corruption_Condition()
{
	if	(self.aivar[AIV_MISSION2] == FALSE)
	&& 	(Npc_HasItems(hero, itminugget)>=50)
	&&  (Quest_CorruptRebels == LOG_RUNNING)
	&&  (self.aivar[AIV_MISSION3] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Bau_2_Corruption_Info()
{
	AI_Output(other,self,"Info_Bau_2_Corruption_15_00"); //Mam dla ciebie troch� rudy. Dostaniesz j� je�li od��czysz si� od buntownik�w.
	AI_Output(self,other,"Info_Bau_2_Corruption_02_01"); //A niech ci�. Pe�na sakiewka. Dawaj j�.
	AI_Output(other,self,"Info_Bau_2_Corruption_15_02"); //Wracaj do pracy.
	
	B_GiveInvItems (hero,self, itminugget, 50);
	Npc_RemoveInvItems (self, itminugget,50);
	
	self.aivar[AIV_MISSION2] = TRUE;
	CorruptedBauers = CorruptedBauers + 1;
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_2(var c_NPC slf)
{
	Info_Bau_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_2_Wasser.npc 				= Hlp_GetInstanceID(slf);
	Info_Bau_2_Corruption.npc 			= Hlp_GetInstanceID(slf);
};
