

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_VLK_40010_Elton_Exit (C_INFO)
{
	npc			= VLK_40010_Elton;
	nr			= 999;
	condition	= DIA_VLK_40010_Elton_Exit_Condition;
	information	= DIA_VLK_40010_Elton_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_40010_Elton_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_VLK_40010_Elton_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_VLK_40010_Elton_LeaveMe (C_INFO)
{
	npc				= VLK_40010_Elton;
	nr				= 2;
	condition		= DIA_VLK_40010_Elton_LeaveMe_Condition;
	information		= DIA_VLK_40010_Elton_LeaveMe_Info;
	permanent		= 0;
	description		= "Nie wygl¹dasz najlepiej.";
};

FUNC int DIA_VLK_40010_Elton_LeaveMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_OBITE_PYSKI_RUDA))
	
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_40010_Elton_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_00"); //Nie wygl¹dasz najlepiej.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_01"); //Czego chcesz?!
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_02"); //Dowiedzieæ siê co ci siê sta³o.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_03"); //Ja tylko ssspad³em z rrrusztowania...
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_04"); //Snipes twierdzi³, ¿e bêdziesz bardziej rozmowny.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_05"); //Zostaw mnie!
    AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_06"); //Ja chcê tylko wyjaœniæ co dzieje siê z czêœci¹ Kopaczy. Wygl¹daj¹ jakby wyszli z sali tortur.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_07"); //Dobrze powiedziane... Niech stracê, mo¿e to wszystko siê skoñczy.
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_08"); //Wyjaœnij mi wszystko, po kolei.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_09"); //Jakiœ czas temu dowiedzia³em siê, ¿e mo¿na sobie dorobiæ do pensji. Podobno ³atwo i tanim kosztem.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_10"); //Mój znajomy noc¹ zaprowadzi³ mnie na platformê znajduj¹c¹ siê nad bram¹ z ¿elazn¹ krat¹, której pilnuje Ashghan.
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_11"); //Co tam by³o?
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_12"); //Kilku Kopaczy i paru Stra¿ników. Patrzyli jak moi znajomi ok³adaj¹ siê maczugami, kijami i w ogóle czym popadnie.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_13"); //Widzowie mieli ubaw a ten troglodyta liczy³ zyski.

	
	
};

INSTANCE DIA_VLK_40010_Elton_Cesar (C_INFO)
{
	npc				= VLK_40010_Elton;
	nr				= 3;
	condition		= DIA_VLK_40010_Elton_Cesar_Condition;
	information		= DIA_VLK_40010_Elton_Cesar_Info;
	permanent		= 0;
	description		= "Kto taki?";
};

FUNC int DIA_VLK_40010_Elton_Cesar_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_VLK_40010_Elton_LeaveMe))
	
{
    return TRUE;
};
};

FUNC VOID DIA_VLK_40010_Elton_Cesar_Info()
{
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_00"); //Kto taki?
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_01"); //Cesar, silny Stra¿nik. Zarz¹dca tego ca³ego przedsiêwziêcia. Szanta¿uje Kopaczy zmuszaj¹c ich do nielegalnych walk.
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_02"); //Robi¹ to praktycznie za darmo a na dodatek maj¹ obowi¹zek œci¹gaæ nowych nie mówi¹c im w jakie bagno w³aœnie siê pakuj¹.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_03"); //Nie mogliœcie donieœæ na tego Cesara?
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_04"); //Ma zbyt silne wtyki nie tylko tu ale i w obozie. Bez twardych dowodów nic nie zrobimy. A zadarcie z kimœ takim to wyrok œmierci.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_05"); //Muszê poszukaæ na niego jakiegoœ haczyka.
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_06"); //Jeœli masz twardy ³eb, to spróbuj szczêœcia w jego walkach. Mo¿e wtedy siê czegoœ dowiesz.
    AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_07"); //Pamiêtaj, ¿e bêdzie ciê zwodzi³ zyskami tak jak wszystkich nowych ale natychmiast ciê oszuka i sam odbierze rudê od obstawiaj¹cych walki.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_08"); //Poszukam na niego sposobu.


	  B_LogEntry               (ObitePyski,"Elton pocz¹tkowo nie by³ chêtny do rozmowy ale póŸniej puœci³ parê z ust. Okazuje siê, ¿e na platformie nad bram¹ przy, której stoi Asghan odbywaj¹ siê nielegalne walki. Zarz¹dza nimi silny i groŸny Stra¿nik imieniem Cesar. Muszê spróbowaæ wzi¹æ udzia³ w tych walkach. Wtedy dowiem siê wiêcej.");

	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_ELTON
//========================================

INSTANCE DIA_Elton_HI_ELTON (C_INFO)
{
   npc          = VLK_40010_Elton;
   nr           = 1;
   condition    = DIA_Elton_HI_ELTON_Condition;
   information  = DIA_Elton_HI_ELTON_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Elton_HI_ELTON_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Elton_HI_ELTON_Info()
{
    AI_Output (other, self ,"DIA_Elton_HI_ELTON_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_02"); //Mrówk¹ robotnic¹ w mrowisku gdzie królow¹ jest Gomez.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_03"); // I nie chce o tym myœleæ bo tylko uœwiadamiam sobie jak ma³o znaczê w tym wszystkim.
    AI_Output (other, self ,"DIA_Elton_HI_ELTON_15_04"); //G³owa do góry. Mo¿e jeszcze nadejdzie twój czas.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_05"); //Za ma³o mam sprytu I zrêcznoœci kolego by do³¹czyæ do Cieni. Diego Na pewno by mnie odrzuci³.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_06"); //Umiem tylko machaæ tym przeklêtym kilofem!
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_07"); //¯ycie da³o mi ju¿ w koœæ. I swoje wiem. A teraz muszê wracaæ do pracy.
    AI_StopProcessInfos	(self);
};

















