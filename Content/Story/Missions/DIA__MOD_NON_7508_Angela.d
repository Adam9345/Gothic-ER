// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Angela_EXIT(C_INFO)
{
	npc             = NON_7508_Angela;
	nr              = 999;
	condition	= DIA_Angela_EXIT_Condition;
	information	= DIA_Angela_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Angela_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Angela_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Angela_HELLO1 (C_INFO)
{
   npc          = NON_7508_Angela;
   nr           = 1;
   condition    = DIA_Angela_HELLO1_Condition;
   information  = DIA_Angela_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj, nieznajoma.";
};

FUNC INT DIA_Angela_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Angela_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_01"); //Witaj, nieznajoma.
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_02"); //No proszê. Widzê, ¿e komuœ uda³o siê odnaleŸæ jaskiniê Gilberta. Mam nadzieje, ¿e nie pracujesz dla Magnatów, bo inaczej poder¿nê ci gard³o.
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_03"); //Widzê, ¿e jesteœ bardzo wygadana jak na kobietê.
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_04"); //Chyba nie trafi³am do tej zasranej Kolonii przez przypadek, prawda? Wspó³pracowa³am z Gildi¹ Z³odziei w Khorinis, wiêc znam parê sztuczek. 
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_05"); //Jak uda³o ci siê wymkn¹æ Magnatom?
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_06"); //No wiesz, poczeka³am a¿ zapadnie zmrok. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_07"); //Gomez poszed³ do Zewnêtrznego Pierœcienia ogl¹daæ jakieœ pokazy na arenie, Kruk zajêty by³ czytaniem ksi¹¿ki, Blizna i Arto gadali o jakiœ pierdo³ach, a Bartholo strofowa³ kucharzy w kuchni. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_08"); //Postanowi³am siê wymkn¹æ. Przemknê³am szybko przez dziedziniec zamkowy. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_09"); //Okaza³o siê, ¿e w pobli¿u zawalonej wie¿y jest rusztowanie. Magnaci wynajêli paru roboli, aby naprawili wie¿ê, w ten sposób dziêki swej zwinnoœci zesz³am na dó³. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_10"); //Szybko upora³am siê tak¿e ze stra¿nikami bramy, jeden z nich to prawdziwy imbecyl, a drugi dosta³ ode mnie kopniaka pomiêdzy nogi. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_11"); //Gdy siê im wymknê³am, zobaczy³em Gilberta poluj¹cego na œcierwojady dla ich miêsa. Powiedzia³, ¿e mogê schroniæ siê w jaskini na górze, wiêc skorzysta³am z oferty. I tak tkwiê tu od tego czasu.
    AI_Output (other, self ,"DIA_Angela_HELLO1_03_12"); //Ciekawa historia. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_13"); //Dobra dobra, nie podlizuj siê. A teraz daj mi spokój, chcê odpocz¹æ od tej paplaniny.
};

