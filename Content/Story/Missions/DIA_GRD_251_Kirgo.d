//poprawione i sprawdzone -  

// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "Czeœæ! Jestem tu nowy.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Czeœæ! Jestem tu nowy.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Naprawdê? Opowiedz mi coœ o Zewnêtrznym Œwiecie! Ju¿ od miesi¹ca nie mia³em ¿adnych wieœci z zewn¹trz.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jestem Kirgo. Walczê na arenie.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "Jesteœ dobry?";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Jesteœ dobry?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //W walce? Nie zajmujê siê tym zbyt d³ugo, ale wygra³em ju¿ swoj¹ pierwsz¹ walkê!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "Chcia³bym ciê wyzwaæ na pojedynek na arenie!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if ((Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1)))	|| (MIS_HanisAsTeacher == LOG_RUNNING)
	// Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Chcia³bym ciê wyzwaæ na pojedynek na arenie!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Co? Ale ja nie chcê z tob¹ walczyæ! Mo¿e napijemy siê po prostu piwa i pogadamy o Zewnêtrznym Œwiecie?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Nie! Chcê siê biæ! Natychmiast!"		,Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dobra, daj mi piwo!"						,Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Nie! Chcê siê biæ! Natychmiast!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //W takim razie... Mo¿emy zaczynaæ, jak tylko bêdziesz gotów.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dobra, daj mi piwo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Proszê bardzo!
	CreateInvItems (Grd_251_Kirgo, ItFoBeer,2);
	B_GiveInvItems (Grd_251_Kirgo, hero, ItFoBeer, 1);
	    AI_UseItem (hero, ItFoBeer);
	    AI_UseItem (self, ItFoBeer); //1.3 fix
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Dziêki! Obawiam siê, ¿e nie mogê ci zbyt wiele powiedzieæ o wydarzeniach na zewn¹trz. Prawie dwa miesi¹ce przesiedzia³em w ciemnicy. Zaraz potem trafi³em tutaj.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Wielka szkoda... Có¿, trudno... Ca³kiem nieŸle siê trzymasz, jak na kogoœ, kto przesiedzia³ w celi dwa miesi¹ce.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //I zamierzam siê postaraæ, ¿eby tak zosta³o.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //To dlaczego tak ci zale¿y na walce z jednym z nas?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chcê zas³u¿yæ na szacunek w Obozie.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //To znaczy, ¿e chcesz przekonaæ do siebie Scatty'ego, tak? To jeden z bardziej wp³ywowych ludzi w Zewnêtrznym Pierœcieniu... Mo¿e bêdzie pod wra¿eniem, jeœli uda ci siê mnie pokonaæ...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale jeœli naprawdê chcesz go do siebie przekonaæ, powinieneœ stawiæ czo³a Kharimowi. Tylko obawiam siê, ¿e on mo¿e byæ dla ciebie za dobry!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Jeœli nadal chcesz ze mn¹ walczyæ, daj mi znaæ! Chocia¿ nie chcia³bym ci robiæ krzywdy.
	
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Chcê z tob¹ walczyæ - jesteœ gotów?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Björn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Chcê z tob¹ walczyæ - jesteœ gotów?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //ChodŸ za mn¹!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};


// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Przesylka_Corristo (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Przesylka_Corristo_Condition;
	information		= Info_Kirgo_Przesylka_Corristo_Info;
	permanent		= 0;
	description 	= "Niedawno dosz³o do kradzie¿y na placu wymian...";
};                       

FUNC INT Info_Kirgo_Przesylka_Corristo_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Orry_Corristo_Przesylka))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Przesylka_Corristo_Info()
{
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_00"); //Niedawno dosz³o do kradzie¿y na placu wymian. By³eœ tam wczeœniej widziany.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_01"); //Chyba mnie nie podejrzewacie?! Nie mam z tym nic wspólnego!
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_02"); //Po co by³eœ na placu wymian?
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_03"); //Odwiedziæ mojego dobrego kumpla.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_04"); //Zauwa¿y³eœ coœ niepokoj¹cego?
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_05"); //Niech pomyœlê... Zauwa¿y³em, ¿e jeden ze stra¿ników wygl¹da na nieŸle zestresowanego.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_06"); //Potem gdy wraca³em do obozu widzia³em go jak wspina³ siê na ska³kach na p³askowy¿ nieopodal placu wymian.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_07"); //To musia³o byæ jeszcze przed kradzie¿¹.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_08"); //To cenna wiadomoœæ. Zatem muszê siê udaæ na ten p³askowy¿.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_09"); //Dziêki za pomoc.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_10"); //Nie ma sprawy.
	
	  B_LogEntry                     (PrzesylkaCorristo ,"Kirgo twierdzi, ¿e nie ma nic wspólnego z kradzie¿¹ na placu wymian. Mówi, ¿e widzia³ jak jakieœ Stra¿nik dziwnie siê zachowywa³ a potem wdrapa³ siê na ska³ki by wejœæ na p³askowy¿ nieopodal. Muszê siê tam udaæ.");
	Wld_InsertNpc                (NON_40002_Rabus,"WP_COR_RAB2");
    Wld_InsertNpc                (NON_40005_Rabus,"WP_COR_RAB1");
    Wld_InsertNpc                (NON_40003_Rabus,"WP_COR_RAB3");
    Wld_InsertNpc                (NON_40004_Przywodca,"WP_COR_RAB4");
	
};

















