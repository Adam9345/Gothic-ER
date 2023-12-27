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
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_01"); //O zatem jesteœ teraz jednym z nas!
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_02"); //S¹dzisz, ¿e to dobrze czy Ÿle?
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_03"); //Nie ma jednoznacznej odpowiedzi, ch³opcze.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_04"); //¯ycie Kreta nie jest us³ane ró¿ami. Ci¹g³e rycie w ziemi I dobieranie siê do rudy, której I tak nie dostaniesz...
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_05"); //Ale za masz swoje miejsce w Kolonii. Nie padniesz ³upem wyg³odnia³ych wilków w³ócz¹c siê samotnie.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_06"); //Bycie Kretem mo¿e ciê ocaliæ od zguby. Ale to ciê¿ki kawa³ek czerstwego chleba, muszê powiedzieæ.
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_07"); //A s¹ jakieœ plusy?
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_08"); //W ostatecznoœci jakoœ wy¿yjesz. No a jak co nieco zarobisz mo¿esz iœæ do karczmy na jeziorze daæ zarobiæ Silasowi.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_09"); //Nie ma to jak zalaæ gard³o zimnym piwem po wielu tygodniach tyrania w Kotle.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_10"); //I mo¿esz tam pogadaæ z naszymi kumplami, którzy te¿ tam przesiaduj¹.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_11"); //Inne Krety mog¹ ci opowiedzieæ kilka ciekawych historii albo nawet zleciæ jak¹œ fuchê do zrobienia.
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_12"); //Dziêki za informacje. Zapamiêtam to.
    AI_Output (self, other ,"DIA_Casper_SFB_H_03_13"); //Choæ coœ mi mówi, ¿e nie spêdzisz du¿o czasu w naszych szeregach. Pewnie pójdziesz dalej w rozwoju. 
    AI_Output (other, self ,"DIA_Casper_SFB_H_15_14"); //Czas poka¿e co mnie czeka.
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
	description = "Wiadomo ci coœ o Grabarzu?";
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
	AI_Output (other, self,"Info_Casper_Hello_15_00"); //Wiadomo ci coœ o Grabarzu?
	AI_Output (self, other,"Info_Casper_Hello_09_01"); //To brutal, grabie¿ca i pijak. Nie rozumiem co ktoœ taki jak on robi pod Woln¹ Kopalnia gdzie Krety ciê¿k¹ pracuj¹.
	AI_Output (other, self,"Info_Casper_Hello_15_02"); //Tyle ju¿ wiem. Interesuj¹ mnie bardziej szczegó³owe informacje...
	AI_Output (self, other,"Info_Casper_Hello_09_03"); //Ja nic nie wiem. Zostaw mnie!
	AI_Output (other, self,"Info_Casper_Hello_15_04"); //Spokojnie. Mo¿e parê bry³ek rudy rozjaœni ci umys³.
	AI_Output (self, other,"Info_Casper_Hello_09_05"); //Daj mi 100 bry³ek. I tuzin sztuk sma¿onego miêsa. Tu w Kotle ciê¿ko o jedzenie. Ledwo trzymam ten przeklêty kilof!
		   B_LogEntry               (Cienwboku,"Kret Casper zdaje siê wiedzieæ coœ co mo¿e mi siê przydaæ w œledztwie. Ale najpierw muszê mu daæ 100 bry³ek rudy i tuzin sma¿onego miêsa (12 sztuk). Dopiero wtedy ujawni fakty o, których wie.");
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Casper_Schuerfer(C_INFO)
{
	npc			= SFB_40011_Casper;
	nr			= 1;
	condition	= Info_Casper_Schuerfer_Condition;
	information	= Info_Casper_Schuerfer_Info;
	permanent	= false;
	description = "Proszê, weŸ rudê i to miêso.";
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
	AI_Output (other, self,"Info_Casper_Schuerfer_15_00"); //Proszê, weŸ rudê i to miêso.
		B_GiveInvItems      (hero,self, ItMiNugget, 100);
		B_GiveInvItems      (hero,self, ItFoMutton, 12);
	AI_Output (self, other,"Info_Casper_Schuerfer_09_01"); //Dziêki. Wiem, ¿e Grabarz trzyma z innym silnym Szkodnikiem. To Butch.
	AI_Output (self, other,"Info_Casper_Schuerfer_09_02"); //Razem maj¹ na sumieniu wiele wystêpków. Dobrali siê sukinsyny...
	AI_Output (other, self,"Info_Casper_Schuerfer_09_03"); //To ju¿ coœ, dziêki.
	   B_LogEntry               (Cienwboku,"Kret Casper powiedzia³ mi, ¿e dobrym kompanem Grabarza jest Butch. Mo¿e to on ma te kompromituj¹ce Swiney’a pismo.");
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Casper_HI_CASPER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Casper_HI_CASPER_Info()
{
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_02"); //Mam na imiê Casper I jestem styranym Kretem.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_03"); //Tu w Kotle nie ma przelewek. Masz swoje miejsceI nie musisz siê tu³aæ po ciemnych zakamarkach Kolonii za chlebem ale za to czeka ciê harówka.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_04"); //I to du¿a harówka. Racje ¿ywnoœciowe s¹ skromne a I zap³ata niewielka.
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_05"); //Ciê¿ko siê tu ¿yje jak widzê.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_06"); //Chcia³bym ju¿ byæ w karczmie na jeziorze na jeziorze I móc napiæ siê zimnego piwa!
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_07"); //To o tym myœli ka¿dy z nas gdy wywija kilofem tutaj lub bezpoœrednio w kopalni.
    AI_Output (other, self ,"DIA_Casper_HI_CASPER_15_08"); //Có¿, ka¿dy szuka jakieœ motywacji by ¿yæ dalej.
    AI_Output (self, other ,"DIA_Casper_HI_CASPER_03_09"); //Prawda ch³opcze.
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
   description	= "Z kim z Kot³a warto nawi¹zaæ kontakty?";
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
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_01"); //Z kim z Kot³a warto nawi¹zaæ kontakty?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_02"); //Na pewno z Okylem. Stoi na czele ochrony Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_03"); //Osch³y przy tym wynios³y ale te¿ twardy oraz zdecydowany. 
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_04"); //A to siê ceni w naszej spo³ecznoœci.
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_05"); //Ktoœ jeszcze?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_06"); //Tutejszy in¿ynier Swiney. Ma siê za nie wiadomo co ale faktycznie ma wa¿n¹ pozycje. 
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_07"); //A wiêc ci dwaj to najwa¿niejsze persony tutaj?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_08"); //Zgadza siê. To oni maj¹ najwiêksze wp³ywy w tym nudnym miejscu.
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_09"); //Mo¿esz jeszcze zamieniæ s³owo z Gavilanem.
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_10"); //A co to za facet?
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_11"); //Tutejszy handlarz. Mo¿e ma jakieœ graty , które a nu¿ ci siê przydadz¹. 
    AI_Output (self, other ,"DIA_Casper_CONTACT_03_12"); //Jest jeszcze Snake. Wygl¹da groŸnie ale w³aœciwie nic o nim nie wiem. 
    AI_Output (other, self ,"DIA_Casper_CONTACT_15_13"); //Dziêki za informacje. Mog¹ byæ przydane.
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
   description	= "O widzê, ¿e teraz jesteœ w tym miejscu.";
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
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_01"); //O widzê, ¿e teraz jesteœ w tym miejscu.
    AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_02"); //Dopiero co Swiney wys³a³ mnie po coœ tutaj do obozu.
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_03"); //No tak rozumiem.
    AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_04"); //Trudne czasy mamy. 
    
    AI_Output (other, self ,"DIA_Casper_HELLO_CH4_15_05"); //No có¿ nie sposób siê nie zgodziæ
	AI_Output (self, other ,"DIA_Casper_HELLO_CH4_03_06"); //Mam nadzieje, ¿e jakoœ to przetrzymamy.
};

