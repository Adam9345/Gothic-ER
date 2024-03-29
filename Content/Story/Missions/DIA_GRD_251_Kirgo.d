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
	description 	= "Cze��! Jestem tu nowy.";
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
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Cze��! Jestem tu nowy.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Naprawd�? Opowiedz mi co� o Zewn�trznym �wiecie! Ju� od miesi�ca nie mia�em �adnych wie�ci z zewn�trz.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jestem Kirgo. Walcz� na arenie.
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
	description 	= "Jeste� dobry?";
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
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Jeste� dobry?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //W walce? Nie zajmuj� si� tym zbyt d�ugo, ale wygra�em ju� swoj� pierwsz� walk�!
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
	description 	= "Chcia�bym ci� wyzwa� na pojedynek na arenie!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if ((Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1)))	|| (MIS_HanisAsTeacher == LOG_RUNNING)
	// Kapitelfix   ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Chcia�bym ci� wyzwa� na pojedynek na arenie!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Co? Ale ja nie chc� z tob� walczy�! Mo�e napijemy si� po prostu piwa i pogadamy o Zewn�trznym �wiecie?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Nie! Chc� si� bi�! Natychmiast!"		,Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dobra, daj mi piwo!"						,Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Nie! Chc� si� bi�! Natychmiast!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //W takim razie... Mo�emy zaczyna�, jak tylko b�dziesz got�w.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dobra, daj mi piwo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Prosz� bardzo!
	AI_StandUp(Grd_251_Kirgo);
	CreateInvItems (Grd_251_Kirgo, ItFoBeer,2);
	B_GiveInvItems (Grd_251_Kirgo, hero, ItFoBeer, 1);
	    AI_UseItem (hero, ItFoBeer);
	    AI_UseItem (self, ItFoBeer); //1.3 fix
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Dzi�ki! Obawiam si�, �e nie mog� ci zbyt wiele powiedzie� o wydarzeniach na zewn�trz. Prawie dwa miesi�ce przesiedzia�em w ciemnicy. Zaraz potem trafi�em tutaj.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Wielka szkoda... C�, trudno... Ca�kiem nie�le si� trzymasz, jak na kogo�, kto przesiedzia� w celi dwa miesi�ce.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //I zamierzam si� postara�, �eby tak zosta�o.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //To dlaczego tak ci zale�y na walce z jednym z nas?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chc� zas�u�y� na szacunek w Obozie.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //To znaczy, �e chcesz przekona� do siebie Scatty'ego, tak? To jeden z bardziej wp�ywowych ludzi w Zewn�trznym Pier�cieniu... Mo�e b�dzie pod wra�eniem, je�li uda ci si� mnie pokona�...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale je�li naprawd� chcesz go do siebie przekona�, powiniene� stawi� czo�a Kharimowi. Tylko obawiam si�, �e on mo�e by� dla ciebie za dobry!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Je�li nadal chcesz ze mn� walczy�, daj mi zna�! Chocia� nie chcia�bym ci robi� krzywdy.
	
	
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
	description 	= "Chc� z tob� walczy� - jeste� got�w?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Bj�rn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Chc� z tob� walczy� - jeste� got�w?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Chod� za mn�!
	
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
	description 	= "Niedawno dosz�o do kradzie�y na placu wymian...";
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
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_00"); //Niedawno dosz�o do kradzie�y na placu wymian. By�e� tam wcze�niej widziany.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_01"); //Chyba mnie nie podejrzewacie?! Nie mam z tym nic wsp�lnego!
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_02"); //Po co by�e� na placu wymian?
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_03"); //Odwiedzi� mojego dobrego kumpla.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_04"); //Zauwa�y�e� co� niepokoj�cego?
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_05"); //Niech pomy�l�... Zauwa�y�em, �e jeden ze stra�nik�w wygl�da na nie�le zestresowanego.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_06"); //Potem gdy wraca�em do obozu widzia�em go jak wspina� si� na ska�kach na p�askowy� nieopodal placu wymian.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_07"); //To musia�o by� jeszcze przed kradzie��.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_08"); //To cenna wiadomo��. Zatem musz� si� uda� na ten p�askowy�.
	AI_Output (other, self,"Info_Kirgo_Przesylka_Corristo_15_09"); //Dzi�ki za pomoc.
	AI_Output (self, other,"Info_Kirgo_Przesylka_Corristo_05_10"); //Nie ma sprawy.
	
	  B_LogEntry                     (PrzesylkaCorristo ,"Kirgo twierdzi, �e nie ma nic wsp�lnego z kradzie�� na placu wymian. M�wi, �e widzia� jak jakie� Stra�nik dziwnie si� zachowywa� a potem wdrapa� si� na ska�ki by wej�� na p�askowy� nieopodal. Musz� si� tam uda�.");
	Wld_InsertNpc                (NON_40002_Rabus,"WP_COR_RAB2");
    Wld_InsertNpc                (NON_40005_Rabus,"WP_COR_RAB1");
    Wld_InsertNpc                (NON_40003_Rabus,"WP_COR_RAB3");
    Wld_InsertNpc                (NON_40004_Przywodca,"WP_COR_RAB4");
	
};

instance dia_kirgo_pickpocket(c_info) {
    npc = grd_251_kirgo;
    nr = 900;
    condition = dia_kirgo_pickpocket_condition;
    information = dia_kirgo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kirgo_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_kirgo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kirgo_pickpocket);
	info_addchoice(dia_kirgo_pickpocket, dialog_back, dia_kirgo_pickpocket_back);
	info_addchoice(dia_kirgo_pickpocket, dialog_pickpocket, dia_kirgo_pickpocket_doit);
};

func void dia_kirgo_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_kirgo_pickpocket);
};

func void dia_kirgo_pickpocket_back() {
    info_clearchoices(dia_kirgo_pickpocket);
};















