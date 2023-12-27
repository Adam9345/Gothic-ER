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
	AI_Output (other, self,"STT_300_Alberto_BUY_Info_15_01"); //Mo¿e masz coœ, co chcia³byœ sprzedaæ?
	AI_Output (self, other,"STT_300_Alberto_BUY_Info_12_02"); //Jasne. Co tylko zechcesz... Jeœli masz doœæ rudy.
	B_ClearTreaderAmmo(self);
	var int log_tradealberto;
	if log_tradealberto == false
	{
	log_tradealberto = true;
	Log_CreateTopic (GE_TraderOM,LOG_NOTE);
    B_LogEntry      (GE_TraderOM,"Kupiec Alberto handluje przedmiotami, które mog¹ mi siê przydaæ w kopalni. Znajdê go w pobli¿u Iana."); 
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
   description	= "Widzê, ¿e znasz siê na handlu. Sk¹d pochodzisz?";
};

FUNC INT DIA_Alberto_STORY_OF_TRADER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alberto_STORY_OF_TRADER_Info()
{
    AI_Output (other, self ,"DIA_Alberto_STORY_OF_TRADER_15_01"); //Widzê, ¿e znasz siê na handlu. Sk¹d pochodzisz?
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_02"); //To prawda, mam ¿y³kê do interesów. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_03"); //Pochodzê z Khorinis. Mia³em kiedyœ stragan w Górnym Mieœcie. 
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_04"); //Handlowa³em najlepsz¹ ¿ywnoœci¹ sprowadzan¹ z kontynentu. Liczne statki handlowe specjalnie j¹ dostarcza³y na moje ¿yczenie.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_05"); //Niestety, pewnego dnia przez pomy³kê sprzeda³em ¿onie gubernatora Lariusa nieœwie¿e owoce. I kobiecie siê zmar³o.
    AI_Output (self, other ,"DIA_Alberto_STORY_OF_TRADER_03_06"); //Reszty mo¿esz siê domyœliæ.
   
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
   description	= "Glen odsprzeda³ ci trochê kruszcu zwanego srebrnym gromem.";
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
    AI_Output (other, self ,"DIA_Alberto_Glen_15_01"); //Glen odsprzeda³ ci trochê kruszcu zwanego srebrnym gromem.
    AI_Output (self, other ,"DIA_Alberto_Glen_03_02"); //Owszem, mam go.
    AI_Output (other, self ,"DIA_Alberto_Glen_15_03"); //Chcia³bym go kupiæ.
    AI_Output (self, other ,"DIA_Alberto_Glen_03_04"); //Za 10 bry³ek, które mam chcê 110 sztuk rudy.
    AI_Output (other, self ,"DIA_Alberto_Glen_15_05"); //A¿ tyle za 10 bry³ek?!
    AI_Output (self, other ,"DIA_Alberto_Glen_03_06"); //Nie przes³ysza³eœ siê. I nie próbuj siê ze mn¹ targowaæ bo cena pójdzie w górê.
	B_LogEntry               (MieczGorBoby,"Alberto chcê 110 bry³ek rudy w zamian za 10 kawa³ków ,,srebrnego gromu”. To droga cena ale muszê j¹ zap³aciæ.");
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
   description	= "Dobra masz tê rudê.";
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
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_01"); //Dobra masz tê rudê.
	B_GiveInvItems (other,self, itminugget, 110);
	B_GiveInvItems (self,other, itmi_SilverNugget, 10);
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_02"); //A to twój rzadki surowiec.
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_03"); //Wiesz coœ wiêcej na temat tego minera³u?
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_04"); //By³o go bardzo ma³o ponoæ zdoby³o go raptem paru ludzi.
    AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_05"); //Wiesz kto?
    AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_06"); //Grimes, Glen...I by³ tu Aleph chcia³ mi odsprzedaæ 10 bry³ek ale ju¿ nie wróci³.
	AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_07"); //Dziêki za informacjê. Pomówiê z nim.
	AI_Output (self, other ,"DIA_Alberto_Silver_Nugget_03_08"); //Do zobaczenia.
	AI_Output (other, self ,"DIA_Alberto_Silver_Nugget_15_09"); //Na razie.
	B_LogEntry               (MieczGorBoby,"Zap³aci³em Alberto i kupi³em trochê ,,srebrnego gromu”. Dowiedzia³em siê te¿, ¿e Aleph mia³ ten surowiec ale z jakiegoœ powodu ju¿ siê nie pojawi³ u handlarza z ofert¹ sprzeda¿y. Muszê go znaleŸæ i o tym pogadaæ.");
	
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
    AI_Output (other, self ,"DIA_Alberto_Oprawca_15_01"); //Poszukuje pewnych informacji na temat niejakiego Winstona. To tutejszy cz³onek stra¿y.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_03_02"); //Coœ by siê znalaz³o, mam oczy i uszy szeroko otwarte. Podobnie jak kieszenie jeœli wiesz co mam na myœli...
    AI_Output (other, self ,"DIA_Alberto_Oprawca_15_03"); //Ile chcesz za tê informacjê?
    AI_Output (self, other ,"DIA_Alberto_Oprawca_03_04"); //Myœlê, ¿e 70 bry³ek to niez³a cena.
	 B_LogEntry               (Oprawca,"Alberto powie mi coœ na temat Winstona ale ¿¹da za to 70 bry³ek rudy.");
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
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_02"); //Dziêki. Có¿ jeœli chodzi o tego Winstona to mo¿na by³o zas³yszeæ o nim pewne plotki w kopalni jakiœ czas temu.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_03"); //Asghan Popad³ w konflikt z Fergusem – kowalem z obozu przed kopalni¹. Dlatego zlecenie na wykucie broni dla stra¿ników musia³o pójœæ do kogoœ innego.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_04"); //Winston dosta³ mnóstwo rudy i mia³ udaæ siê do starego obozu do Skipa by ten kaza³ Stone’owi wykuæ partiê ostrzy.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_05"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_06"); //Winston powróci³ z tragarzami po pewnym czasie. Towar, który sprowadzi³ z obozu by³ relatywnie niskiej jakoœci.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_07"); //Stone to œwietny kowal. Winston zas³ania³ siê, ¿e zrobi³ fuszerkê z nadmiaru pracy ale posz³y g³osy, ¿e to podejrzana sprawa.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_08"); //Niez³y trop. Muszê udaæ siê do starego obozu popytaæ ludzi o t¹ sprawê.
    AI_Output (self, other ,"DIA_Alberto_Oprawca_Ruda_03_09"); //Ale uwa¿aj, Winston to zakapior. Jak mu podpadniesz to mo¿esz srodze tego po¿a³owaæ.
    AI_Output (other, self ,"DIA_Alberto_Oprawca_Ruda_15_10"); //Tak, tak... W zupe³noœci...
	 B_LogEntry               (Oprawca,"Alberto powiedzia³, ¿e Winston by³ odpowiedzialny za sprowadzenie mieczy ze Starego Obozu. By³y przewidziane jako nowy orê¿ dla Stra¿ników w kopalni. Sêk w tym, ¿e sprowadzony towar by³ bardzo s³abej jakoœci. Ponoæ Winston kupi³ je u Skipa. Muszê z nim o tym pomówiæ. Gdyby by³ problem z wejœciem do zamku, móg³bym pomówiæ z kimœ wp³ywowym w obozie kto móg³by mi za³atwiæ takie spotkanie. Myœlê ¿e Gravo to odpowiednia osoba...");
    AI_StopProcessInfos	(self);
};





