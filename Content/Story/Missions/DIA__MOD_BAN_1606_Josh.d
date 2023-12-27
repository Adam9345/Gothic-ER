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
	AI_Output (self, other,"DIA_Josh_Hallo_04_01"); //Czeœæ... Spojrza³eœ na mnie tak jakbyœ mnie szuka³ z jakiegoœ powodu.
	AI_Output (other, self,"DIA_Josh_Hallo_15_02"); //Eee... Czeœæ. Znamy siê? Zaraz ty jesteœ Josh?
	AI_Output (self, other,"DIA_Josh_Hallo_04_03"); //Wiedzia³em, ¿e nasze spotkanie to nie przypadek. Czego ode mnie chcesz?
	AI_Output (other, self,"DIA_Josh_Hallo_15_04"); //Znasz Band... myœliwego Draxa jak mniemam?
	AI_Output (self, other,"DIA_Josh_Hallo_04_05"); //Ha ha! Widzê, ¿e wyczu³em naszego nowego cz³owieka. Pewnie, ¿e go znam. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_06"); //Mam odebraæ od ciebie rudê. Nie powinieneœ byæ czasem w Kopalni i j¹ organizowaæ?
	AI_Output (self, other,"DIA_Josh_Hallo_04_07"); //Powinienem, jednak musia³em siê stamt¹d zmyæ. Mój dawny wspólnik Drake postanowi³, ¿e znów bêdzie udawa³ lojalnego. Ba³ siê , ¿e go sypnê to namówi³ Kopaczy od których zbiera³em rudê, na doniesienie na mnie Ianowi. Ten cholernie siê wœciek³ i wyda³ polecenie zabicia mnie. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_08"); //Gdy zauwa¿y³em Stra¿ników id¹cych w moj¹ stronê uzna³em, ¿e atmosfera zrobi³a siê trochê za gor¹ca, wiêc opuœci³em Kopalniê. Uda³o mi siê ich zwieœæ. Ukry³em siê za straganem Alberto, który nie wiedzia³ o co chodzi. Gdy Stra¿nicy poszli szukaæ w innym kierunku, da³em w d³ug¹ i wybieg³em na powierzchniê.
	AI_Output (self, other,"DIA_Josh_Hallo_04_09"); //Atmosfera nieco ostyg³a ale zaczepi³ mnie Artch i powiedzia³, ¿e ju¿ nigdy wiêcej nie wpuœci mnie do Kopalni. 
	AI_Output (other, self,"DIA_Josh_Hallo_15_10"); //Ciekawa historia, ale wola³bym ju¿ dostaæ tê rudê. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_11"); //Ju¿ jej nie mam. Zgubi³em j¹ nieopodal wejœcia do Kopalni w³asnie przy okazji mojej pamiêtnej ucieczki.
	AI_Output (other, self,"DIA_Josh_Hallo_15_12"); //Mogê przeszukaæ najbli¿szy teren przy kopalni.
	AI_Output (self, other,"DIA_Josh_Hallo_04_13"); //Czekaj! Przy kopalni jest spore obozowisko. Na pewno j¹ ktoœ znalaz³. Musisz mi pomóc dowiedzieæ siê, kto to jest. ¯eby ci u³atwiæ robotê mogê dodaæ , ¿e nie widzia³em nowych Kopczy w okolicy. Nikt nowy siê tu niê krêci³ ani ¿aden ze sta³ych bywalców nie wszed³ do kopalni. 
	AI_Output (self, other,"DIA_Josh_Hallo_04_14"); //Wydaje mi siê, ¿e sakiewki nie odnalaz³ ¿aden Stra¿nik. Znaj¹c ich obyczaje pewnie taki che³pi³ siê tym faktem i zala³ w trupa. Nic takiego nie widzia³em wiêc s¹dzê , ¿e rudê znalaz³ jakiœ Kopacz, który utrzymuje to w tajemnicy, ¿eby nikt mu jej nie zabra³.
	AI_Output (self, other,"DIA_Josh_Hallo_04_15"); //Pogadaj z ludŸmi. Mo¿e czegoœ siê dowiesz... I spadaj ju¿. Nie chcê, ¿eby ten pieprzony kucharz nas zobaczy³. Gapi siê na mnie od kiedy tu przyszed³em.
	
	
	
	

	
	B_LogEntry               (CH1_OreInOM,"Spotka³em Josha w obozie przed Star¹ Kopalni¹. Okazuje siê, ¿e wpad³ w k³opoty i musia³ opuœciæ Kopalniê. Podczas ucieczki zgubi³ sakiewkê z ca³¹ rud¹, któr¹ zbiera³ od jakiegoœ czasu. Bandyta uwa¿a, ¿e sakiewkê ju¿ ktoœ znalaz³, oraz ¿e znalazc¹ na pewno nie jest ¿aden Stra¿nik, a Kopacz. Muszê popytaæ w okolicy i znaleŸæ tego Kopacza, zanim ruda opuœci obóz.");
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
   description	= "Wiem, kto ma rudê.";
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
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_01"); //Wiem, kto ma rudê. To Kopacz Hysen. Ukry³ j¹ w jakiejœ skrzyni. Klucz ma zapewne przy sobie.
    AI_Output (self, other ,"DIA_Josh_TheftFind_03_02"); //Dobra robota. Ukradnij klucz, znajdŸ skrzynie, otwórz j¹ i zabierajmy siê st¹d jak najszybciej. 
    AI_Output (other, self ,"DIA_Josh_TheftFind_15_03"); //Dlaczego ty tego nie zrobisz? Nie jestem zbyt dobrym z³odziejem.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_04"); //Nie mogê opuœciæ obozu. Muszê mieæ kilka rzeczy na oku. Ian chyba da³ jakieœ instrukcje Stra¿nikom z obozu. 
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_05"); //Ponadto chcia³em za³atwiæ jeszcze dwie rzeczy. Mogê ciê nauczyæ kradzie¿y kieszonkowej i otwierania zamków.
	AI_Output (self, other ,"DIA_Josh_TheftFind_03_06"); //Przyda ci siê te¿ co nieco wiedzy o zrêcznoœci. 
    B_LogEntry                     (CH1_OreInOM,"Josh nie mo¿e opuœciæ obozu i udaæ siê na poszukiwania skrzyni. Muszê sam ukraœæ klucz i znaleŸæ skrzyniê.");

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
	description		= "Naucz mnie okradaæ."; 
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
	AI_Output (other, self,"DIA_Josh_Lehrer_15_00"); //Naucz mnie okradaæ.
	AI_Output (self, other,"DIA_Josh_Lehrer_05_02"); //Czego konkretnie chcia³byœ siê nauczyæ?



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
	AI_Output (other, self,"DIA_Josh_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Josh_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
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
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
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
	AI_Output (other, self,"DIA_Josh_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Josh_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
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
	AI_Output (other, self,"DIA_Josh_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Josh_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
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
		AI_Output (self, other,"DIA_Josh_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Josh_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Josh_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Josh_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
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