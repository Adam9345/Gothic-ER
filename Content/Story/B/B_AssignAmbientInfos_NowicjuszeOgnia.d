// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_fnov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_fnov_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_fnov_2_EXIT_Condition;
	information	= Info_fnov_2_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_fnov_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_fnov_2_Sytuacja(C_INFO)
{
	nr			= 3;
	condition	= Info_fnov_2_Sytuacja_Condition;
	information	= Info_fnov_2_Sytuacja_Info;
	permanent	= 1;
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_fnov_2_Sytuacja_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_Sytuacja_Info()
{
	AI_Output(other,self,"Info_fnov_2_Sytuacja_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_fnov_2_Sytuacja_02_01"); //Wszystko w porz¹dku bracie. Poszukujemy zbawienia w modlitwie do Innosa i wykonujemy proste zlecenia dla Magów Ognia.
	AI_Output(other,self,"Info_fnov_2_Sytuacja_15_02"); //Zbawienie od czego?
	AI_Output(self,other,"Info_fnov_2_Sytuacja_02_03"); //Aby Innos przebaczy³ nam nasze przewinienia za które znaleŸliœmy siê w tym miejscu i ¿eby pomóg³ nam wydostaæ siê na wolnoœæ.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_fnov_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_fnov_2_DasLager_Condition;
	information	= Info_fnov_2_DasLager_Info;
	permanent	= 1;
	description = "Co mo¿esz mi powiedzieæ o Obozie?";
};                       

FUNC INT Info_fnov_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_fnov_2_DasLager_15_00"); //Co mo¿esz mi powiedzieæ o Obozie?
	AI_Output(self,other,"Info_fnov_2_DasLager_02_01"); //To najwiêkszy obóz w Kolonii. Ma on równie¿ najwiêksze znaczenie, ze wzglêdu na handel ze œwiatem zewnêtrznym. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_02"); //Stary Obóz by³ pierwsz¹ siedzib¹ wiêŸniów w Kolonii. Za³o¿ono go od razu po powstaniu Bariery. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_03"); //Z tego co wiem na zamku wczeœniej mieszkali królewscy ¿o³nierze a zewnêtrzny pierœcieñ by³ siedzib¹ wiêŸniów wrzucanych do Górniczej Doliny. 
	AI_Output(self,other,"Info_fnov_2_DasLager_02_04"); //Ludzie ze Starego Obozu nie przepadaj¹ za Nowym Obozem, wyj¹tkiem s¹ magowie którzy utrzymuj¹ kontakty z Magami Wody.
	AI_Output(self,other,"Info_fnov_2_DasLager_02_05"); //Prowadzimy równie¿ intensywn¹ wymianê handlow¹ z Bractwem. 
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_fnov_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_DieLage_Condition;
	information	= Info_fnov_2_DieLage_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_fnov_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_fnov_2_DieLage_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_fnov_2_DieLage_02_01"); //Masz na myœli Stary Obóz czy nas Nowicjuszy?
	AI_Output(self,other,"Info_fnov_2_DieLage_02_02"); //W Obozie rz¹dz¹ Magnaci, a w szczególnoœci Gomez. To oni handluj¹ ze œwiatem zewnêtrznym i podejmuj¹ wszelkie wa¿ne decyzje odnoœnie obozu.
	AI_Output(self,other,"Info_fnov_2_DieLage_02_03"); //Jeœli chodzi o nas, to podlegamy Magom Ognia. Ich przywódc¹ jest Arcymag o imieniu Corristo. 
	AI_Output(self,other,"Info_fnov_2_DieLage_02_04"); //Musimy jednak s³uchaæ wszystkich Magów i sumiennie wykonywaæ ich polecenia.	
};

	
// *************************************************************************
// 								Zajêcia
// *************************************************************************

INSTANCE Info_fnov_2_Zajecia(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_Zajecia_Condition;
	information	= Info_fnov_2_Zajecia_Info;
	permanent	= 1;
	description = "Czym zajmuj¹ siê Nowicjusze Ognia?";
};                       

FUNC INT Info_fnov_2_Zajecia_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_Zajecia_Info()
{
	AI_Output(other,self,"Info_fnov_2_Zajecia_15_00"); //Czym zajmuj¹ siê Nowicjusze Ognia?
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_01"); //Wykonujemy proste prace, takie jak sprz¹tanie œwi¹tyni oraz sprawujemy opiekê nad zamkow¹ kaplic¹ Innosa. 
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_02"); //Czasami Magowie zlecaj¹ nam ró¿ne misje, które wykonujemy ku chwale Innosa. 
	AI_Output(self,other,"Info_fnov_2_Zajecia_02_03"); //W zamian za s³u¿bê Panu Ognia i jego wybrañcom mo¿emy uczyæ siê magii.
};	

	
// *************************************************************************
// 								Handel-info
// *************************************************************************

INSTANCE Info_fnov_2_handel(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_handel_Condition;
	information	= Info_fnov_2_handel_Info;
	permanent	= 1;
	description = "Gdzie mogê nabyæ przedmioty magiczne?";
};                       

FUNC INT Info_fnov_2_handel_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_handel_Info()
{
	AI_Output(other,self,"Info_fnov_2_handel_15_00"); //Gdzie mogê nabyæ przedmioty magiczne?
	AI_Output(self,other,"Info_fnov_2_handel_02_01"); //Jak chcesz zakupiæ magiczne przedmioty, takie jak mikstury i zwoje magiczne to udaj siê na targowisko. Znajdziesz tam Nowicjusza Jima. 
	AI_Output(self,other,"Info_fnov_2_handel_02_02"); //Zajrzyj tak¿e do Mistrza Torreza, on tak¿e sprzedaje magiczne przedmioty. Znajdziesz go przed œwi¹tyni¹. 
};	

// *************************************************************************
// 								Relacje
// *************************************************************************

INSTANCE Info_fnov_2_relacje(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_fnov_2_relacje_Condition;
	information	= Info_fnov_2_relacje_Info;
	permanent	= 1;
	description = "Jak wygl¹daj¹ wasze relacjê z pozosta³ymi gildiami Starego Obozu?";
};                       

FUNC INT Info_fnov_2_relacje_Condition()
{
	return 1;
};

FUNC VOID Info_fnov_2_relacje_Info()
{
	AI_Output(other,self,"Info_fnov_2_relacje_15_00"); //Jak wygl¹daj¹ wasze relacjê z pozosta³ymi gildiami Starego Obozu?
	AI_Output(self,other,"Info_fnov_2_relacje_02_01"); //No có¿, oczywiœcie musimy s³uchaæ poleceñ Magnatów i Stra¿ników. Jesteœmy Cieniami na us³ugach Magów Ognia. 
	AI_Output(self,other,"Info_fnov_2_relacje_02_02"); //Niewielki wp³yw ma na nas Diego, przywódca Cieni. Jednak on zarz¹dza g³ównie wojownikami. Naszymi prze³o¿onymi s¹ Magowie. 
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_fnov_2(var c_NPC slf)
{
	Info_fnov_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_fnov_2_Sytuacja.npc		= Hlp_GetInstanceID(slf);
	Info_fnov_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_Zajecia.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_handel.npc				= Hlp_GetInstanceID(slf);
	Info_fnov_2_relacje.npc				= Hlp_GetInstanceID(slf);
};
