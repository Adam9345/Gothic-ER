//poprawione i sprawdzone - Reflide

// ************************ EXIT **************************

instance  STT_300_Alberto_Exit (C_INFO)
{
	npc			=  STT_300_Alberto;
	nr			= 999;
	condition	=  STT_300_Alberto_Exit_Condition;
	information	=  STT_300_Alberto_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_300_Alberto_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  STT_300_Alberto_BUY (C_INFO)
{
	npc				= STT_300_Alberto;
	condition		= STT_300_Alberto_BUY_Condition;
	information		= STT_300_Alberto_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_300_Alberto_BUY_Condition()
{
	return 1;
};


FUNC void  STT_300_Alberto_BUY_Info()
{
	AI_Output (other, self,"STT_300_Alberto_BUY_Info_15_01"); //Mo�e masz co�, co chcia�by� sprzeda�?
	AI_Output (self, other,"STT_300_Alberto_BUY_Info_12_02"); //Jasne. Co tylko zechcesz... Je�li masz do�� rudy.
	B_ClearTreaderAmmo(self);
	var int log_tradealberto;
	if log_tradealberto == false
	{
	log_tradealberto = true;
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kupiec Alberto handluje przedmiotami, kt�re mog� mi si� przyda� w kopalni. Znajd� go w pobli�u Iana."); 
	};
	
};

//========================================
//-----------------> STORY_OF_TRADER
//========================================

INSTANCE DIA_Alberto_STORY_OF_TRADER (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_STORY_OF_TRADER_Condition;
   information  = DIA_Alberto_STORY_OF_TRADER_Info;
   permanent	= FALSE;
   description	= "Widz�, �e znasz si� na handlu. Sk�d pochodzisz?";
};

FUNC INT DIA_Alberto_STORY_OF_TRADER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alberto_STORY_OF_TRADER_Info()
{
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_01"); //Widz�, �e znasz si� na handlu. Sk�d pochodzisz?
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_02"); //To prawda, mam �y�k� do interes�w. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_03"); //Pochodz� z Khorinis. Mia�em kiedy� stragan w G�rnym Mie�cie. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_04"); //Handlowa�em najlepsz� �ywno�ci� sprowadzan� z kontynentu. Liczne statki handlowe specjalnie j� dostarcza�y na moje �yczenie.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_05"); //Niestety, pewnego dnia przez pomy�k� sprzeda�em �onie gubernatora Lariusa nie�wie�e owoce. I kobiecie si� zmar�o.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_06"); //Reszty mo�esz si� domy�li�.
   
};



//========================================
//-----------------> STORY_OF_TRADER
//========================================

INSTANCE DIA_Alberto_Glen (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_Glen_Condition;
   information  = DIA_Alberto_Glen_Info;
   permanent	= FALSE;
   description	= "Glen odsprzeda� ci troch� kruszcu zwanego srebrnym gromem.";
};

FUNC INT DIA_Alberto_Glen_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Glen_Silver_Nugget))
{
    return TRUE;
};
};
FUNC VOID DIA_Alberto_Glen_Info()
{
    AI_Output (other, self ,"DIA_Alberto_Glen_15_01"); //Glen odsprzeda� ci troch� kruszcu zwanego srebrnym gromem.
    AI_Output (self, other ,"DIA_Alberto_Glen_03_02"); //Owszem, mam go.
    AI_Output (other, self ,"DIA_Alberto_Glen_15_03"); //Chcia�bym go kupi�.
    AI_Output (self, other ,"DIA_Alberto_Glen_03_04"); //Za 10 bry�ek, kt�re mam chc� 110 sztuk rudy.
    AI_Output (other, self ,"DIA_Alberto_Glen_15_05"); //A� tyle za 10 bry�ek?!
    AI_Output (self, other ,"DIA_Alberto_Glen_03_06"); //Nie przes�ysza�e� si�. I nie pr�buj si� ze mn� targowa� bo cena p�jdzie w g�r�.
	B_LogEntry               (MieczGorBoby,"Alberto chc� 110 bry�ek rudy w zamian za 10 kawa�k�w ,,srebrnego gromu�. To droga cena ale musz� j� zap�aci�.");
};


//========================================
//-----------------> STORY_OF_TRADER
//========================================

INSTANCE DIA_Alberto_Silver_Nugget (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_Silver_Nugget_Condition;
   information  = DIA_Alberto_Silver_Nugget_Info;
   permanent	= FALSE;
   description	= "Dobra masz t� rud�.";
};

FUNC INT DIA_Alberto_Silver_Nugget_Condition()
{

if (Npc_KnowsInfo (hero, DIA_Alberto_Glen)) &&  (Npc_HasItems (other, ItMiNugget) >=110)
{
    return TRUE;
};
};
FUNC VOID DIA_Alberto_Silver_Nugget_Info()
{
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_01"); //Dobra masz t� rud�.
	B_GiveInvItems (other,self, itminugget, 110);
	B_GiveInvItems (self,other, itmi_SilverNugget, 10);
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_02"); //A to tw�j rzadki surowiec.
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_03"); //Wiesz co� wi�cej na temat tego minera�u?
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_04"); //By�o go bardzo ma�o pono� zdoby�o go raptem paru ludzi.
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_05"); //Wiesz kto?
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_06"); //Grimes, Glen...I by� tu Aleph chcia� mi odsprzeda� 10 bry�ek ale ju� nie wr�ci�.
	AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_07"); //Dzi�ki za informacj�. Pom�wi� z nim.
	AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_08"); //Do zobaczenia.
	AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_09"); //Na razie.
	B_LogEntry               (MieczGorBoby,"Zap�aci�em Alberto i kupi�em troch� ,,srebrnego gromu�. Dowiedzia�em si� te�, �e Aleph mia� ten surowiec ale z jakiego� powodu ju� si� nie pojawi� u handlarza z ofert� sprzeda�y. Musz� go znale�� i o tym pogada�.");
	
};

//========================================
//-----------------> Oprawca
//========================================

INSTANCE DIA_Alberto_Oprawca (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 1;
   condition    = DIA_Alberto_Oprawca_Condition;
   information  = DIA_Alberto_Oprawca_Info;
   permanent	= FALSE;
   description	= "Poszukuje pewnych informacji na temat niejakiego Winstona.";
};

FUNC INT DIA_Alberto_Oprawca_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Winston_Eliott))
{
    return TRUE;
};
};
FUNC VOID DIA_Alberto_Oprawca_Info()
{
    AI_Output (other, self ,"DIA_Alberto_Oprawca_15_01"); //Poszukuje pewnych informacji na temat niejakiego Winstona. To tutejszy cz�onek stra�y.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_03_02"); //Co� by si� znalaz�o, mam oczy i uszy szeroko otwarte. Podobnie jak kieszenie je�li wiesz co mam na my�li...
    AI_Output (other, self ,"DIA_Alberto_Oprawca_15_03"); //Ile chcesz za t� informacj�?
    AI_Output (self, other ,"DIA_Alberto_Oprawca_03_04"); //My�l�, �e 70 bry�ek to niez�a cena.
	 B_LogEntry               (Oprawca,"Alberto powie mi co� na temat Winstona ale ��da za to 70 bry�ek rudy.");
};

//========================================
//-----------------> Oprawca_Ruda
//========================================

INSTANCE DIA_Alberto_Oprawca_Ruda (C_INFO)
{
   npc          = STT_300_Alberto;
   nr           = 2;
   condition    = DIA_Alberto_Oprawca_Ruda_Condition;
   information  = DIA_Alberto_Oprawca_Ruda_Info;
   permanent	= FALSE;
   description	= "Trzymaj skoro musisz.";
};

FUNC INT DIA_Alberto_Oprawca_Ruda_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Alberto_Oprawca)) && (Npc_HasItems (other, ItMiNugget) >=70)
{
    return TRUE;
};
};
FUNC VOID DIA_Alberto_Oprawca_Ruda_Info()
{
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_01"); //Trzymaj skoro musisz.
	B_GiveInvItems (other,self, itminugget, 70);
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_02"); //Dzi�ki. C� je�li chodzi o tego Winstona to mo�na by�o zas�ysze� o nim pewne plotki w kopalni jaki� czas temu.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_03"); //Asghan Popad� w konflikt z Fergusem � kowalem z obozu przed kopalni�. Dlatego zlecenie na wykucie broni dla stra�nik�w musia�o p�j�� do kogo� innego.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_04"); //Winston dosta� mn�stwo rudy i mia� uda� si� do starego obozu do Skipa by ten kaza� Stone�owi wyku� parti� ostrzy.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_05"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_06"); //Winston powr�ci� z tragarzami po pewnym czasie. Towar, kt�ry sprowadzi� z obozu by� relatywnie niskiej jako�ci.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_07"); //Stone to �wietny kowal. Winston zas�ania� si�, �e zrobi� fuszerk� z nadmiaru pracy ale posz�y g�osy, �e to podejrzana sprawa.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_08"); //Niez�y trop. Musz� uda� si� do starego obozu popyta� ludzi o t� spraw�.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_09"); //Ale uwa�aj, Winston to zakapior. Jak mu podpadniesz to mo�esz srodze tego po�a�owa�.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_10"); //Tak, tak... W zupe�no�ci...
	 B_LogEntry               (Oprawca,"Alberto powiedzia�, �e Winston by� odpowiedzialny za sprowadzenie mieczy ze Starego Obozu. By�y przewidziane jako nowy or� dla Stra�nik�w w kopalni. S�k w tym, �e sprowadzony towar by� bardzo s�abej jako�ci. Pono� Winston kupi� je u Skipa. Musz� z nim o tym pom�wi�. Gdyby by� problem z wej�ciem do zamku, m�g�bym pom�wi� z kim� wp�ywowym w obozie kto m�g�by mi za�atwi� takie spotkanie. My�l� �e Gravo to odpowiednia osoba...");
    AI_StopProcessInfos	(self);
};





