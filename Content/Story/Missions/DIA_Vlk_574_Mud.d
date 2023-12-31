//poprawione i sprawdzone - Reflide

// **************************************************
var int Mud_Nerve;
const int NerveSec = 30;
var int Mud_NerveRealized;
// **************************************************

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mud_Exit (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Exit_Condition;
	information	= DIA_Mud_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mud_Exit_Condition()
{
	//if (Npc_KnowsInfo(hero, DIA_Mud_FirstEXIT))
	//{
		return 1;
	//};
};

FUNC VOID DIA_Mud_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						First + EXIT
// **************************************************

INSTANCE DIA_Mud_FirstEXIT (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_FirstEXIT_Condition;
	information	= DIA_Mud_FirstEXIT_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_FirstEXIT_Info()
{
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_00"); //Hej, kolego! Nowy? Chyba ci� jeszcze tu nie widzia�em.
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_01"); //Przy��cz� si� do ciebie na chwil�, je�li nie masz nic przeciwko. Przyda ci si� przyjaciel...
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	Info_AddChoice	 (DIA_Mud_FirstEXIT, "Spadaj!"			,DIA_Mud_FirstEXIT_Verpiss);
	Info_AddChoice	 (DIA_Mud_FirstEXIT, "Czemu nie? Chod�my!"	,DIA_Mud_FirstEXIT_Komm);
};

func void DIA_Mud_FirstEXIT_Verpiss()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //Spadaj!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //Oho, nie jeste�my w humorze, co? Lepiej b�dzie jak p�jd� z tob�!
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void DIA_Mud_FirstEXIT_Komm()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Komm_15_00"); //Czemu nie? Chod�my!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Komm_07_01"); //�wietnie. Po drodze mo�emy sobie troch� porozmawia�.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

// **************************************************
// 					Shut Up!
// **************************************************

INSTANCE DIA_Mud_ShutUp (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 3;
	condition	= DIA_Mud_ShutUp_Condition;
	information	= DIA_Mud_ShutUp_Info;
	permanent	= 1;
	description	= "Mo�esz si� zamkn�� cho� na chwil�?";
};                       

FUNC INT DIA_Mud_ShutUp_Condition()
{
	
	if (Mud_NerveRealized == TRUE) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_ShutUp_Info()
{
	AI_Output (other, self,"DIA_Mud_ShutUp_15_00"); //Mo�esz si� zamkn�� cho� na chwil�?
	AI_Output (self, other,"DIA_Mud_ShutUp_07_01"); //Jasne.
	Npc_SetRefuseTalk(self, 300);
};

// **************************************************
// 					Verpi� dich
// **************************************************

INSTANCE DIA_Mud_GetLost (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 2;
	condition	= DIA_Mud_GetLost_Condition;
	information	= DIA_Mud_GetLost_Info;
	permanent	= 1;
	description	= "Spadaj!";
};                       

FUNC INT DIA_Mud_GetLost_Condition()
{
	if (kapitel < 4)
	{
	return 1;
	};
};

FUNC VOID DIA_Mud_GetLost_Info()
{
	AI_Output (other, self,"DIA_Mud_GetLost_15_00"); //Spadaj!
	AI_Output (self, other,"DIA_Mud_GetLost_07_01"); //Chcesz by� przez chwil� sam, tak? Rozumiem... B�d� si� trzyma� na uboczu.
};

// **************************************************
// 					DEFEATED
// **************************************************

INSTANCE DIA_Mud_Defeated (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_Defeated_Condition;
	information	= DIA_Mud_Defeated_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_Defeated_Info()
{
	AI_Output (self, other,"DIA_Mud_GetLost_07_00"); //Hej, stary! Czemu mnie bijesz? Co ci takiego zrobi�em?
	AI_Output (other, self,"DIA_Mud_GetLost_15_01"); //Za chwil� znowu ci przy�o��! Bardzo lubi� to robi�!
	AI_Output (self, other,"DIA_Mud_GetLost_07_02"); //Jaki� �wir z ciebie, czy co? Nie chc� mie� z tob� nic wsp�lnego!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
// 						 Nerve 0 
// **************************************************

INSTANCE DIA_Mud_Nerve_0 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_0_Condition;
	information	= DIA_Mud_Nerve_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_0_Condition()
{
	if ( (Mud_Nerve==0) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_0_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_0_07_00"); //Powiedz, dok�d idziemy? A mo�e to niespodzianka?! Uwielbiam niespodzianki!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 1 
// **************************************************

INSTANCE DIA_Mud_Nerve_1 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_1_Condition;
	information	= DIA_Mud_Nerve_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_1_Condition()
{
	if ( (Mud_Nerve==1) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_1_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_1_07_00"); //Nie zwracaj na mnie uwagi. B�d� si� trzyma� ciebie, spokojna g�owa.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 2 
// **************************************************

INSTANCE DIA_Mud_Nerve_2 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_2_Condition;
	information	= DIA_Mud_Nerve_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_2_Condition()
{
	if ( (Mud_Nerve==2) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_2_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_2_07_00"); //Zdecydowa�e� si� wreszcie dok�d chcesz i��?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 3
// **************************************************

INSTANCE DIA_Mud_Nerve_3 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_3_Condition;
	information	= DIA_Mud_Nerve_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_3_Condition()
{
	if ( (Mud_Nerve==3) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_3_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_3_07_00"); //Mo�e szukasz jakiego� spokojnego miejsca, gdzie mogliby�my pogada�?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 4
// **************************************************

INSTANCE DIA_Mud_Nerve_4 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_4_Condition;
	information	= DIA_Mud_Nerve_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_4_Condition()
{
	if ( (Mud_Nerve==4) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_4_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_4_07_00"); //Czy to mo�liwe, �e chodzimy w k�ko... To znaczy, nie wiem dok�d chcesz i��, ale...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 5
// **************************************************

INSTANCE DIA_Mud_Nerve_5 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_5_Condition;
	information	= DIA_Mud_Nerve_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_5_Condition()
{
	if ( (Mud_Nerve==5) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_5_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_5_07_00"); //Ale fajnie! Dzi�ki, �e zabra�e� mnie ze sob�! Mogliby�my robi� to cz�ciej. Nie mam nic do roboty przez wi�kszo�� dnia!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 6
// **************************************************

INSTANCE DIA_Mud_Nerve_6 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_6_Condition;
	information	= DIA_Mud_Nerve_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_6_Condition()
{
	if ( (Mud_Nerve==6) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_6_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_6_07_00"); //Wiesz co? Ju� ci� polubi�em! Prze�yjemy wsp�lnie wiele ciekawych przyg�d! Co nie?! Gdzie nocujesz? Jakby� chcia�, mo�esz przenocowa� u mnie!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 7;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 7
// **************************************************

INSTANCE DIA_Mud_Nerve_7 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_7_Condition;
	information	= DIA_Mud_Nerve_7_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_7_Condition()
{
	if ( (Mud_Nerve==7) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_7_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_7_07_00"); //A tak w og�le, to za co tutaj trafi�e�? Ty te� za bardzo lubisz zwierz�ta? Oni krzywo na to patrz�, wiesz? W�a�nie tak tutaj wyl�dowa�em.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 8;
	AI_StopProcessInfos	( self );
};


// **************************************************
// 						 Nerve 8
// **************************************************

INSTANCE DIA_Mud_Nerve_8 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_8_Condition;
	information	= DIA_Mud_Nerve_8_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_8_Condition()
{
	if ( (Mud_Nerve==8) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_8_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_8_07_00"); //Kilku facet�w bez przerwy pr�buje mnie pobi�. Paskudni ludzie z Nowego Obozu! Bandziory jedne! Nast�pnym razem powiem im, �e kto ze mn� zadziera, b�dzie mia� z tob� do czynienia! To ich nauczy!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 9;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 9
// **************************************************

INSTANCE DIA_Mud_Nerve_9 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_9_Condition;
	information	= DIA_Mud_Nerve_9_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_9_Condition()
{
	if ( (Mud_Nerve==9) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_9_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_9_07_00"); //Ale si� zdziwi� ci z Nowego Obozu, jak im powiem jakiego mam obro�c�! Posikaj� si� ze strachu! Ale b�dzie fajnie. Normalnie zabijaj� ludzi bez mrugni�cia okiem, ale teraz b�d� musieli dobrze si� zastanowi�.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 10;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 10
// **************************************************

INSTANCE DIA_Mud_Nerve_10 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_10_Condition;
	information	= DIA_Mud_Nerve_10_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_10_Condition()
{
	if ( (Mud_Nerve==10) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_10_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_10_07_00"); //Wiesz co? Wy�wiadcz� ci przys�ug�. Wstawi� si� za tob�. Mo�e wtedy zostaniesz przyj�ty do Obozu. W ten spos�b mogliby�my spotyka� si� codziennie.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 11;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 11
// **************************************************

INSTANCE DIA_Mud_Nerve_11 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_11_Condition;
	information	= DIA_Mud_Nerve_11_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_11_Condition()
{
	if ( (Mud_Nerve==11) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_11_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_11_07_00"); //Niekt�rzy tutaj maj� mnie za jakiego� wariata. Ale przecie� kto� taki jak ty nie zadawa�by si� z wariatem, prawda? Teraz wszyscy zrozumiej� jak niesprawiedliwie mnie ocenili.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 12;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 12
// **************************************************

INSTANCE DIA_Mud_Nerve_12 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_12_Condition;
	information	= DIA_Mud_Nerve_12_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_12_Condition()
{
	if ( (Mud_Nerve==12) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_12_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_12_07_00"); //Jestem moim najlepszym kumplem, wiesz? Inni tylko pr�buj� si� mnie pozby�. Jestem ci bardzo wdzi�czny, naprawd�!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 13;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 13
// **************************************************

INSTANCE DIA_Mud_Nerve_13 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_13_Condition;
	information	= DIA_Mud_Nerve_13_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_13_Condition()
{
	if ( (Mud_Nerve==13) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_13_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_13_07_00"); //S�uchaj, ca�e to bieganie zaczyna mnie m�czy�. Mo�e poszukamy sobie jakiego� przytulnego gniazdka i chwil� odpoczniemy, co?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 14;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 14
// **************************************************

INSTANCE DIA_Mud_Nerve_14 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_14_Condition;
	information	= DIA_Mud_Nerve_14_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_14_Condition()
{
	if ( (Mud_Nerve==14) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_14_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_14_07_00"); //Jeste� dla mnie jak starszy brat. Nigdy nie mia�em starszego brata... Ani nawet m�odszego! Moi rodzice mnie nie kochali, ale to musia�o by� dla nich bardzo trudne.
	AI_Output (other, self,"DIA_Mud_Nerve_14_15_01"); //Jaaasne.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 15;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 15
// **************************************************

INSTANCE DIA_Mud_Nerve_15 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_15_Condition;
	information	= DIA_Mud_Nerve_15_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_15_Condition()
{
	if ( (Mud_Nerve==15) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_15_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_15_07_00"); //Sk�d jeste�? Na pewno cieszysz si�, �e znalaz�e� tu bratni� dusz�, kogo�, kto ci� zrozumie. Jestem z Khorinis. By�e� tam kiedy�? Zreszt� - niewa�ne.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 16;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 16
// **************************************************

INSTANCE DIA_Mud_Nerve_16 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_16_Condition;
	information	= DIA_Mud_Nerve_16_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_16_Condition()
{
	if ( (Mud_Nerve==16) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_16_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_16_07_00"); //Masz mo�e dla mnie co� do jedzenia. Jestem jakby twoim go�ciem, wi�c uprzejmo�� nakazywa�aby, aby� mnie czym� pocz�stowa�. Nauczy�em si� tego w Khorinis. Tam mieszkaj� uprzejmi ludzie.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 17;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 17
// **************************************************

INSTANCE DIA_Mud_Nerve_17 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_17_Condition;
	information	= DIA_Mud_Nerve_17_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_17_Condition()
{
	if ( (Mud_Nerve==17) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_17_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_17_07_00"); //My�lisz, �e kto� wpadnie do nas z wizyt�? Pewnie nie, bo nie mogliby wydosta� si� z powrotem, co nie?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 18;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 18
// **************************************************

INSTANCE DIA_Mud_Nerve_18 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_18_Condition;
	information	= DIA_Mud_Nerve_18_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_18_Condition()
{
	if ( (Mud_Nerve==18) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	&& (kapitel < 4) {	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_18_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_18_07_00"); //Teraz, gdy jeste�my razem, mogliby�my pokaza� kilku ludziom, gdzie raki zimuj�. Te skurczybyki nachodz� mnie od lat! Jak zobacz� kt�rego� z nich, dam im do s�uchu!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 19;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 19
// **************************************************

INSTANCE DIA_Mud_Nerve_19 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_19_Condition;
	information	= DIA_Mud_Nerve_19_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_19_Condition()
{
	if ( (Mud_Nerve==19) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE )) && (kapitel < 4)	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_19_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_19_07_00"); //Wiesz co? Stanowimy dobran� par�. Mogliby�my przej�� kontrol� nad ca�ym Starym Obozem. Jeste�my zespo�em, wi�c powinni�my �atwo upora� si� z Magnatami. Obmy�l� jaki� plan.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////
// Chapter 4
///////////////////////////////////////////////

INSTANCE DIA_Mud_FirstIn4Ch (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_FirstIn4Ch_Condition;
	information	= DIA_Mud_FirstIn4Ch_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_FirstIn4Ch_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_FirstIn4Ch_Info()
{
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_00"); //Hej, kolego! Dobrze ci� widzie� �ywego.
	if (Npc_KnowsInfo (hero,DIA_Mud_Defeated))
	{
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_01"); //Zapomnijmy o naszej dawnej sprzeczce. Nie �ywi� urazy.
	}
	else
	{
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_02"); //Pami�tasz jak si� kiedy� przyja�nili�my? Ale by�o fajnie. 
	};
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_03"); //Tym razem nie b�d� ci m�g� towarzyszy�. W tym paskudnym miejscu zrobi�o si� zbyt gro�nie. 
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_04"); //My�l�, �e sam sobie poradzisz... skoro �yjesz. 
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_05"); //To naprawd� fajne!
	AI_Output (self, other,"DIA_Mud_FirstIn4Ch_07_06"); //Ja tu jeszcze troch� zostan�. Pomy�l�, popatrz�... No wiesz! 
	AI_Output (other, self,"DIA_Mud_FirstIn4Ch_12_07"); //Jasne. Powodzenia.
	
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> LSZ_Info
//========================================

INSTANCE DIA_Mud_LSZ_Info (C_INFO)
{
   npc          = Vlk_574_Mud;
   nr           = 1;
   condition    = DIA_Mud_LSZ_Info_Condition;
   information  = DIA_Mud_LSZ_Info_Info;
   permanent	= FALSE;
   description	= "Mam wiadomo�� od twojego brata.";
};

FUNC INT DIA_Mud_LSZ_Info_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Gravo_LSZ_Adolf))
{
    return TRUE;
};
};
FUNC VOID DIA_Mud_LSZ_Info_Info()
{
    AI_Output (other, self ,"DIA_Mud_LSZ_Info_15_01"); //Mam wiadomo�� od twojego brata.
    AI_Output (self, other ,"DIA_Mud_LSZ_Info_03_02"); //O! Co u niego s�ycha�?
    AI_Output (other, self ,"DIA_Mud_LSZ_Info_15_03"); //C�, bywa�o lepiej. Ale jako� �yje.
    AI_Output (self, other ,"DIA_Mud_LSZ_Info_03_04"); //Aaa rozumiem, kolego.
    AI_Output (other, self ,"DIA_Mud_LSZ_Info_15_05"); //Oto ta wiadomo��.
	B_GiveInvItems (other,self, ItWr_LSZ_ZiggyToMud, 1);
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Mud_LSZ_Info_03_06"); //M�j brat chc� mnie odwiedzi�! O bogowie, co teraz?
    AI_Output (self, other ,"DIA_Mud_LSZ_Info_03_07"); //Co on sobie o mnie pomy�li? W ko�cu jest samym zarz�dc� Wolnej Kopalni...
    AI_Output (other, self ,"DIA_Mud_LSZ_Info_15_08"); //Co?! Banda wariat�w...
    AI_Output (self, other ,"DIA_Mud_LSZ_Info_03_09"); //Powiedz Ziggy�emu, �e mam nadmiar obowi�zk�w jako Magnat. Bo... musz� liczy� rud� Gomeza. Ot tak! Hah
    AI_Output (other, self ,"DIA_Mud_LSZ_Info_15_10"); //Nie b�d� tego komentowa�...
	B_LogEntry               (LatwySzmal,"Wrz�d ok�ama� swojego brata, �e jest Magnatem na dodatek Ziggy odwdzi�czy� mu si� tym samym twierdz�c, �e jest szefem Wolnej Kopalni. Ci dwaj debile to na pewno rodzeni bracia. W ka�dym razie Wrz�d poprosi� mnie bym powiedzia� jego bratu, �e ma nadmiar obowi�zk�w I nie mo�e go przyj��. Teraz pytanie co mu powiem, prawd� czy k�amstwo.");
    AI_StopProcessInfos	(self);
};




//========================================
//-----------------> WhatDoYouAsking
//========================================

INSTANCE DIA_Mud_WhatDoYouAsking (C_INFO)
{
   npc          = Vlk_574_Mud;
   nr           = 1;
   condition    = DIA_Mud_WhatDoYouAsking_Condition;
   information  = DIA_Mud_WhatDoYouAsking_Info;
   permanent	= FALSE;
   description	= "Za co ci� tu wrzucono?";
};

FUNC INT DIA_Mud_WhatDoYouAsking_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Mud_WhatDoYouAsking_Info()
{
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_01"); //Za co ci� tu wrzucono?
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_02"); //Za jakie� g�upstwa no!
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_03"); //Nie zrobi�em nic z�ego. Pewnie moja inteligencja i wrodzony spryt byly dla kogo� gro�ne!
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_04"); //Czy�by?
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_05"); //Nie rozumiem czemu pytasz kolego. Chyba widzisz z kim masz do czynienia.
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_06"); //Ekhm...
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_07"); //W�a�nie opracowywuje plan jak zaw�adn�� nad Starym Obozem. Wkr�tce przejmuje ca�y ten bajzel!
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_08"); //Masz jak�� rodzin� lub krewnych?
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_09"); //Ju� nie...Znaczy mia�em kiedy� brata. Nawet by� wa�n� osob� w Nowym Obozie....
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_10"); //Ale od dawna nie mam od niego �adnej wiadomo�ci. Chyba nie �yje....
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_11"); //Tak mi m�wi moja niezawodna intuicja. Ona si� nigdy nie myli.
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_12"); //Chyba pora bym szed� dalej.
    AI_Output (self, other ,"DIA_Mud_WhatDoYouAsking_03_13"); // Zapewne te� my�lisz o tym co dalej ze sob� zrobi�. Wzoruj si� na mnie a daleko zajdziesz!
    AI_Output (other, self ,"DIA_Mud_WhatDoYouAsking_15_14"); //Na razie chc� i�� jak najdalej st�d...
	 AI_StopProcessInfos	(self);
};

instance dia_mud_pickpocket(c_info) {
    npc = vlk_574_mud;
    nr = 900;
    condition = dia_mud_pickpocket_condition;
    information = dia_mud_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mud_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_mud_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mud_pickpocket);
	info_addchoice(dia_mud_pickpocket, dialog_back, dia_mud_pickpocket_back);
	info_addchoice(dia_mud_pickpocket, dialog_pickpocket, dia_mud_pickpocket_doit);
};

func void dia_mud_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_mud_pickpocket);
};

func void dia_mud_pickpocket_back() {
    info_clearchoices(dia_mud_pickpocket);
};