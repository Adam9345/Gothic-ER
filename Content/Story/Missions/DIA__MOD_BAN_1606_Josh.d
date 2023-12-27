// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Josh_Exit (C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 999;
	condition		= DIA_Josh_Exit_Condition;
	information		= DIA_Josh_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Josh_Exit_Condition()
{
	return 1;
};

func VOID DIA_Josh_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Josh_Hallo(C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 1;
	condition		= DIA_Josh_Hallo_Condition;
	information		= DIA_Josh_Hallo_Info;
	permanent		= 0;
	important	 	= 1;
};                       

FUNC INT DIA_Josh_Hallo_Condition()
{
	if MIS_OreInOM == LOG_RUNNING
	{
	return 1;
	};
};

func VOID DIA_Josh_Hallo_Info()
{
	AI_Output (self, other,"DIA_Josh_Hallo_04_01"); //Cze��... Spojrza�e� na mnie tak jakby� mnie szuka� z jakiego� powodu.
	AI_Output (other, self,"DIA_Josh_Hallo_15_02"); //Eee... Cze��. Znamy si�? Zaraz ty jeste� Josh?
	AI_Output (self, other,"DIA_Josh_Hallo_04_03"); //Wiedzia�em, �e nasze spotkanie to nie przypadek. Czego ode mnie chcesz?
	AI_Output (other, self,"DIA_Josh_Hallo_15_04"); //Znasz Band... my�liwego Draxa jak mniemam?
	AI_Output (self, other,"DIA_Josh_Hallo_04_05"); //Ha ha! Widz�, �e wyczu�em naszego nowego cz�owieka. Pewnie, �e go znam. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_06"); //Mam odebra� od ciebie rud�. Nie powiniene� by� czasem w Kopalni i j� organizowa�?
	AI_Output (self, other,"DIA_Josh_Hallo_04_07"); //Powinienem, jednak musia�em si� stamt�d zmy�. M�j dawny wsp�lnik Drake postanowi�, �e zn�w b�dzie udawa� lojalnego. Ba� si� , �e go sypn� to nam�wi� Kopaczy od kt�rych zbiera�em rud�, na doniesienie na mnie Ianowi. Ten cholernie si� w�ciek� i wyda� polecenie zabicia mnie. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_08"); //Gdy zauwa�y�em Stra�nik�w id�cych w moj� stron� uzna�em, �e atmosfera zrobi�a si� troch� za gor�ca, wi�c opu�ci�em Kopalni�. Uda�o mi si� ich zwie��. Ukry�em si� za straganem Alberto, kt�ry nie wiedzia� o co chodzi. Gdy Stra�nicy poszli szuka� w innym kierunku, da�em w d�ug� i wybieg�em na powierzchni�.
	AI_Output (self, other,"DIA_Josh_Hallo_04_09"); //Atmosfera nieco ostyg�a ale zaczepi� mnie Artch i powiedzia�, �e ju� nigdy wi�cej nie wpu�ci mnie do Kopalni. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_10"); //Ciekawa historia, ale wola�bym ju� dosta� t� rud�. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_11"); //Ju� jej nie mam. Zgubi�em j� nieopodal wej�cia do Kopalni w�asnie przy okazji mojej pami�tnej ucieczki.
	AI_Output (other, self,"DIA_Josh_Hallo_15_12"); //Mog� przeszuka� najbli�szy teren przy kopalni.
	AI_Output (self, other,"DIA_Josh_Hallo_04_13"); //Czekaj! Przy kopalni jest spore obozowisko. Na pewno j� kto� znalaz�. Musisz mi pom�c dowiedzie� si�, kto to jest. �eby ci u�atwi� robot� mog� doda� , �e nie widzia�em nowych Kopczy w okolicy. Nikt nowy si� tu ni� kr�ci� ani �aden ze sta�ych bywalc�w nie wszed� do kopalni. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_14"); //Wydaje mi si�, �e sakiewki nie odnalaz� �aden Stra�nik. Znaj�c ich obyczaje pewnie taki che�pi� si� tym faktem i zala� w trupa. Nic takiego nie widzia�em wi�c s�dz� , �e rud� znalaz� jaki� Kopacz, kt�ry utrzymuje to w tajemnicy, �eby nikt mu jej nie zabra�.
	AI_Output (self, other,"DIA_Josh_Hallo_04_15"); //Pogadaj z lud�mi. Mo�e czego� si� dowiesz... I spadaj ju�. Nie chc�, �eby ten pieprzony kucharz nas zobaczy�. Gapi si� na mnie od kiedy tu przyszed�em.
	
	
	
	

	
	B_LogEntry               (CH1_OreInOM,"Spotka�em Josha w obozie przed Star� Kopalni�. Okazuje si�, �e wpad� w k�opoty i musia� opu�ci� Kopalni�. Podczas ucieczki zgubi� sakiewk� z ca�� rud�, kt�r� zbiera� od jakiego� czasu. Bandyta uwa�a, �e sakiewk� ju� kto� znalaz�, oraz �e znalazc� na pewno nie jest �aden Stra�nik, a Kopacz. Musz� popyta� w okolicy i znale�� tego Kopacza, zanim ruda opu�ci ob�z.");
};

//========================================
//-----------------> TheftFind
//========================================

INSTANCE DIA_Josh_TheftFind (C_INFO)
{
   npc          = BAN_1606_Josh;
   nr           = 1;
   condition    = DIA_Josh_TheftFind_Condition;
   information  = DIA_Josh_TheftFind_Info;
   permanent	= FALSE;
   description	= "Wiem, kto ma rud�.";
};

FUNC INT DIA_Josh_TheftFind_Condition()
{
    if (MIS_OreInOM == LOG_RUNNING) && (hero_knows_hysenfinder)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josh_TheftFind_Info()
{
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_01"); //Wiem, kto ma rud�. To Kopacz Hysen. Ukry� j� w jakiej� skrzyni. Klucz ma zapewne przy sobie.
    AI_Output (self, other ,"DIA_Josh_TheftFind_03_02"); //Dobra robota. Ukradnij klucz, znajd� skrzynie, otw�rz j� i zabierajmy si� st�d jak najszybciej. 
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_03"); //Dlaczego ty tego nie zrobisz? Nie jestem zbyt dobrym z�odziejem.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_04"); //Nie mog� opu�ci� obozu. Musz� mie� kilka rzeczy na oku. Ian chyba da� jakie� instrukcje Stra�nikom z obozu. 
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_05"); //Ponadto chcia�em za�atwi� jeszcze dwie rzeczy. Mog� ci� nauczy� kradzie�y kieszonkowej i otwierania zamk�w.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_06"); //Przyda ci si� te� co nieco wiedzy o zr�czno�ci. 
    B_LogEntry                     (CH1_OreInOM,"Josh nie mo�e opu�ci� obozu i uda� si� na poszukiwania skrzyni. Musz� sam ukra�� klucz i znale�� skrzyni�.");

};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Josh_Lehrer (C_INFO)
{
	npc				= BAN_1606_Josh;
	nr				= 2;
	condition		= DIA_Josh_Lehrer_Condition;
	information		= DIA_Josh_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie okrada�."; 
};

FUNC INT DIA_Josh_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Josh_TheftFind))
	{
		return 1;	
	};
};

FUNC VOID DIA_Josh_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_15_00"); //Naucz mnie okrada�.
	AI_Output (self, other,"DIA_Josh_Lehrer_05_02"); //Czego konkretnie chcia�by� si� nauczy�?



	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};

func void DIA_Josh_LehrerDEX5 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};

func void DIA_Josh_LehrerDEX1 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(DIA_Josh_Lehrer );
	Info_AddChoice		(DIA_Josh_Lehrer,DIALOG_BACK																,DIA_Josh_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Josh_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Josh_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Josh_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Josh_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Josh_Lehrer_Schleichen);
	};
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_Josh_LehrerDEX5);
	Info_AddChoice		(DIA_Josh_Lehrer,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,DIA_Josh_LehrerDEX1);
};


func void DIA_Josh_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Josh_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Josh_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Josh_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Josh_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Josh_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Josh_Lehrer );
};