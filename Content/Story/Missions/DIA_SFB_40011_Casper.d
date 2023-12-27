// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Casper_EXIT(C_INFO)
{
	npc			= SFB_40011_Casper ;
	nr			= 999;
	condition	= Info_Casper_EXIT_Condition;
	information	= Info_Casper_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Casper_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Casper_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> SFB_H
//========================================

INSTANCE DIA_Casper_SFB_H (C_INFO)
{
   npc          = SFB_40011_Casper;
   nr           = 1;
   condition    = DIA_Casper_SFB_H_Condition;
   information  = DIA_Casper_SFB_H_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Casper_SFB_H_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_SFB)
{
    return TRUE;
};
};
FUNC VOID DIA_Casper_SFB_H_Info()
{
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_01"); //O zatem jeste� teraz jednym z nas!
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_02"); //S�dzisz, �e to dobrze czy �le?
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_03"); //Nie ma jednoznacznej odpowiedzi, ch�opcze.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_04"); //�ycie Kreta nie jest us�ane r�ami. Ci�g�e rycie w ziemi I dobieranie si� do rudy, kt�rej I tak nie dostaniesz...
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_05"); //Ale za masz swoje miejsce w Kolonii. Nie padniesz �upem wyg�odnia�ych wilk�w w��cz�c si� samotnie.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_06"); //Bycie Kretem mo�e ci� ocali� od zguby. Ale to ci�ki kawa�ek czerstwego chleba, musz� powiedzie�.
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_07"); //A s� jakie� plusy?
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_08"); //W ostateczno�ci jako� wy�yjesz. No a jak co nieco zarobisz mo�esz i�� do karczmy na jeziorze da� zarobi� Silasowi.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_09"); //Nie ma to jak zala� gard�o zimnym piwem po wielu tygodniach tyrania w Kotle.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_10"); //I mo�esz tam pogada� z naszymi kumplami, kt�rzy te� tam przesiaduj�.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_11"); //Inne Krety mog� ci opowiedzie� kilka ciekawych historii albo nawet zleci� jak�� fuch� do zrobienia.
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_12"); //Dzi�ki za informacje. Zapami�tam to.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_13"); //Cho� co� mi m�wi, �e nie sp�dzisz du�o czasu w naszych szeregach. Pewnie p�jdziesz dalej w rozwoju. 
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_14"); //Czas poka�e co mnie czeka.
};


// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Casper_Hello(C_INFO)
{
	npc			= SFB_40011_Casper;
	nr			= 1;
	condition	= Info_Casper_Hello_Condition;
	information	= Info_Casper_Hello_Info;
	permanent	= false;
	description = "Wiadomo ci co� o Grabarzu?";
};                       

FUNC INT Info_Casper_Hello_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Schuerfer_HELLO2))
{
	return 1;
};
};
FUNC VOID Info_Casper_Hello_Info()
{	
	AI_Output (other, self,"Info_Casper_Hello_15_00"); //Wiadomo ci co� o Grabarzu?
	AI_Output (self, other,"Info_Casper_Hello_09_01"); //To brutal, grabie�ca i pijak. Nie rozumiem co kto� taki jak on robi pod Woln� Kopalnia gdzie Krety ci�k� pracuj�.
	AI_Output (other, self,"Info_Casper_Hello_15_02"); //Tyle ju� wiem. Interesuj� mnie bardziej szczeg�owe informacje...
	AI_Output (self, other,"Info_Casper_Hello_09_03"); //Ja nic nie wiem. Zostaw mnie!
	AI_Output (other, self,"Info_Casper_Hello_15_04"); //Spokojnie. Mo�e par� bry�ek rudy rozja�ni ci umys�.
	AI_Output (self, other,"Info_Casper_Hello_09_05"); //Daj mi 100 bry�ek. I tuzin sztuk sma�onego mi�sa. Tu w Kotle ci�ko o jedzenie. Ledwo trzymam ten przekl�ty kilof!
		   B_LogEntry               (Cienwboku,"Kret Casper zdaje si� wiedzie� co� co mo�e mi si� przyda� w �ledztwie. Ale najpierw musz� mu da� 100 bry�ek rudy i tuzin sma�onego mi�sa (12 sztuk). Dopiero wtedy ujawni fakty o, kt�rych wie.");
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Casper_Schuerfer(C_INFO)
{
	npc			= SFB_40011_Casper;
	nr			= 1;
	condition	= Info_Casper_Schuerfer_Condition;
	information	= Info_Casper_Schuerfer_Info;
	permanent	= false;
	description = "Prosz�, we� rud� i to mi�so.";
};                       

FUNC INT Info_Casper_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Casper_Hello))
	&& (Npc_HasItems(other,ItFoMutton) >= 12) 
	&& (Npc_HasItems(other,itminugget) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Casper_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Casper_Schuerfer_15_00"); //Prosz�, we� rud� i to mi�so.
		B_GiveInvItems      (hero,self, ItMiNugget, 100);
		B_GiveInvItems      (hero,self, ItFoMutton, 12);
	AI_Output (self, other,"Info_Casper_Schuerfer_09_01"); //Dzi�ki. Wiem, �e Grabarz trzyma z innym silnym Szkodnikiem. To Butch.
	AI_Output (self, other,"Info_Casper_Schuerfer_09_02"); //Razem maj� na sumieniu wiele wyst�pk�w. Dobrali si� sukinsyny...
	AI_Output (other, self,"Info_Casper_Schuerfer_09_03"); //To ju� co�, dzi�ki.
	   B_LogEntry               (Cienwboku,"Kret Casper powiedzia� mi, �e dobrym kompanem Grabarza jest Butch. Mo�e to on ma te kompromituj�ce Swiney�a pismo.");
	CasperButch = true;
};

//========================================
//-----------------> HI_CASPER
//========================================

INSTANCE DIA_Casper_HI_CASPER (C_INFO)
{
   npc          = SFB_40011_Casper;
   nr           = 1;
   condition    = DIA_Casper_HI_CASPER_Condition;
   information  = DIA_Casper_HI_CASPER_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Casper_HI_CASPER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Casper_HI_CASPER_Info()
{
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_02"); //Mam na imi� Casper I jestem styranym Kretem.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_03"); //Tu w Kotle nie ma przelewek. Masz swoje miejsceI nie musisz si� tu�a� po ciemnych zakamarkach Kolonii za chlebem ale za to czeka ci� har�wka.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_04"); //I to du�a har�wka. Racje �ywno�ciowe s� skromne a I zap�ata niewielka.
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_05"); //Ci�ko si� tu �yje jak widz�.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_06"); //Chcia�bym ju� by� w karczmie na jeziorze na jeziorze I m�c napi� si� zimnego piwa!
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_07"); //To o tym my�li ka�dy z nas gdy wywija kilofem tutaj lub bezpo�rednio w kopalni.
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_08"); //C�, ka�dy szuka jakie� motywacji by �y� dalej.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_09"); //Prawda ch�opcze.
};

//========================================
//-----------------> CONTACT
//========================================

INSTANCE DIA_Casper_CONTACT (C_INFO)
{
   npc          = SFB_40011_Casper;
   nr           = 1;
   condition    = DIA_Casper_CONTACT_Condition;
   information  = DIA_Casper_CONTACT_Info;
   permanent	= FALSE;
   description	= "Z kim z Kot�a warto nawi�za� kontakty?";
};

FUNC INT DIA_Casper_CONTACT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Casper_HI_CASPER))
{
    return TRUE;
};
};
FUNC VOID DIA_Casper_CONTACT_Info()
{
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_01"); //Z kim z Kot�a warto nawi�za� kontakty?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_02"); //Na pewno z Okylem. Stoi na czele ochrony Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_03"); //Osch�y przy tym wynios�y ale te� twardy oraz zdecydowany. 
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_04"); //A to si� ceni w naszej spo�eczno�ci.
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_05"); //Kto� jeszcze?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_06"); //Tutejszy in�ynier Swiney. Ma si� za nie wiadomo co ale faktycznie ma wa�n� pozycje. 
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_07"); //A wi�c ci dwaj to najwa�niejsze persony tutaj?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_08"); //Zgadza si�. To oni maj� najwi�ksze wp�ywy w tym nudnym miejscu.
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_09"); //Mo�esz jeszcze zamieni� s�owo z Gavilanem.
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_10"); //A co to za facet?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_11"); //Tutejszy handlarz. Mo�e ma jakie� graty , kt�re a nu� ci si� przydadz�. 
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_12"); //Jest jeszcze Snake. Wygl�da gro�nie ale w�a�ciwie nic o nim nie wiem. 
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_13"); //Dzi�ki za informacje. Mog� by� przydane.
};

//========================================
//-----------------> HELLO_CH4
//========================================

INSTANCE DIA_Casper_HELLO_CH4 (C_INFO)
{
   npc          = SFB_40011_Casper;
   nr           = 1;
   condition    = DIA_Casper_HELLO_CH4_Condition;
   information  = DIA_Casper_HELLO_CH4_Info;
   permanent	= FALSE;
   description	= "O widz�, �e teraz jeste� w tym miejscu.";
};

FUNC INT DIA_Casper_HELLO_CH4_Condition()
{
if (kapitel >= 4)
{
    return TRUE;
};
};
FUNC VOID DIA_Casper_HELLO_CH4_Info()
{
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_01"); //O widz�, �e teraz jeste� w tym miejscu.
    AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_02"); //Dopiero co Swiney wys�a� mnie po co� tutaj do obozu.
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_03"); //No tak rozumiem.
    AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_04"); //Trudne czasy mamy. 
    
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_05"); //No c� nie spos�b si� nie zgodzi�
	AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_06"); //Mam nadzieje, �e jako� to przetrzymamy.
};

