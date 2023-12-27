

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
	description		= "Nie wygl�dasz najlepiej.";
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
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_00"); //Nie wygl�dasz najlepiej.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_01"); //Czego chcesz?!
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_02"); //Dowiedzie� si� co ci si� sta�o.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_03"); //Ja tylko ssspad�em z rrrusztowania...
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_04"); //Snipes twierdzi�, �e b�dziesz bardziej rozmowny.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_05"); //Zostaw mnie!
    AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_06"); //Ja chc� tylko wyja�ni� co dzieje si� z cz�ci� Kopaczy. Wygl�daj� jakby wyszli z sali tortur.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_07"); //Dobrze powiedziane... Niech strac�, mo�e to wszystko si� sko�czy.
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_08"); //Wyja�nij mi wszystko, po kolei.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_09"); //Jaki� czas temu dowiedzia�em si�, �e mo�na sobie dorobi� do pensji. Podobno �atwo i tanim kosztem.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_10"); //M�j znajomy noc� zaprowadzi� mnie na platform� znajduj�c� si� nad bram� z �elazn� krat�, kt�rej pilnuje Ashghan.
	AI_Output (other, self,"DIA_VLK_40010_Elton_LeaveMe_15_11"); //Co tam by�o?
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_12"); //Kilku Kopaczy i paru Stra�nik�w. Patrzyli jak moi znajomi ok�adaj� si� maczugami, kijami i w og�le czym popadnie.
	AI_Output (self, other,"DIA_VLK_40010_Elton_LeaveMe_01_13"); //Widzowie mieli ubaw a ten troglodyta liczy� zyski.

	
	
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
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_01"); //Cesar, silny Stra�nik. Zarz�dca tego ca�ego przedsi�wzi�cia. Szanta�uje Kopaczy zmuszaj�c ich do nielegalnych walk.
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_02"); //Robi� to praktycznie za darmo a na dodatek maj� obowi�zek �ci�ga� nowych nie m�wi�c im w jakie bagno w�a�nie si� pakuj�.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_03"); //Nie mogli�cie donie�� na tego Cesara?
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_04"); //Ma zbyt silne wtyki nie tylko tu ale i w obozie. Bez twardych dowod�w nic nie zrobimy. A zadarcie z kim� takim to wyrok �mierci.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_05"); //Musz� poszuka� na niego jakiego� haczyka.
	AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_06"); //Je�li masz twardy �eb, to spr�buj szcz�cia w jego walkach. Mo�e wtedy si� czego� dowiesz.
    AI_Output (self, other,"DIA_VLK_40010_Elton_Cesar_01_07"); //Pami�taj, �e b�dzie ci� zwodzi� zyskami tak jak wszystkich nowych ale natychmiast ci� oszuka i sam odbierze rud� od obstawiaj�cych walki.
	AI_Output (other, self,"DIA_VLK_40010_Elton_Cesar_15_08"); //Poszukam na niego sposobu.


	  B_LogEntry               (ObitePyski,"Elton pocz�tkowo nie by� ch�tny do rozmowy ale p�niej pu�ci� par� z ust. Okazuje si�, �e na platformie nad bram� przy, kt�rej stoi Asghan odbywaj� si� nielegalne walki. Zarz�dza nimi silny i gro�ny Stra�nik imieniem Cesar. Musz� spr�bowa� wzi�� udzia� w tych walkach. Wtedy dowiem si� wi�cej.");

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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Elton_HI_ELTON_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Elton_HI_ELTON_Info()
{
    AI_Output (other, self ,"DIA_Elton_HI_ELTON_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_02"); //Mr�wk� robotnic� w mrowisku gdzie kr�low� jest Gomez.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_03"); // I nie chce o tym my�le� bo tylko u�wiadamiam sobie jak ma�o znacz� w tym wszystkim.
    AI_Output (other, self ,"DIA_Elton_HI_ELTON_15_04"); //G�owa do g�ry. Mo�e jeszcze nadejdzie tw�j czas.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_05"); //Za ma�o mam sprytu I zr�czno�ci kolego by do��czy� do Cieni. Diego Na pewno by mnie odrzuci�.
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_06"); //Umiem tylko macha� tym przekl�tym kilofem!
    AI_Output (self, other ,"DIA_Elton_HI_ELTON_03_07"); //�ycie da�o mi ju� w ko��. I swoje wiem. A teraz musz� wraca� do pracy.
    AI_StopProcessInfos	(self);
};

















