//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Naldur_EXIT(C_INFO)
{
	npc             = VLK_577_Buddler;
	nr              = 999;
	condition		= DIA_Naldur_EXIT_Condition;
	information		= DIA_Naldur_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Naldur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Naldur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Naldur_HELLO1 (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_HELLO1_Condition;
   information  = DIA_Naldur_HELLO1_Info;
   permanent	= 0;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Naldur_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Naldur_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Naldur_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Naldur_HELLO1_03_02"); //Wspania³e pytanie w jeszcze wspanialszym miejscu.
	AI_Output (other, self ,"DIA_Naldur_HELLO1_15_03"); //Co ciê ugryz³o? 
	AI_Output (self, other ,"DIA_Naldur_HELLO1_03_04"); //To, ¿e przez t¹ lafiryndê i jej kochasia resztê ¿ycia spêdzê w Kolonii Karnej. 
	AI_Output (other, self ,"DIA_Naldur_HELLO1_15_05"); //No có¿...
	AI_Output (self, other ,"DIA_Naldur_HELLO1_03_06"); //Daruj sobie, po prostu nie lubiê tego pytania. 
};

//========================================
//-----------------> PERM
//========================================

INSTANCE DIA_Naldur_PERM (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 800;
   condition    = DIA_Naldur_PERM_Condition;
   information  = DIA_Naldur_PERM_Info;
   permanent	= 1;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Naldur_PERM_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Naldur_PERM_Info()
{
    AI_Output (other, self ,"DIA_Naldur_PERM_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Naldur_PERM_03_02"); //Mniej wiêcej to samo, co piêtnaœcie lat temu, tylko cz³owiekowi przybywa lat na karku i ubywa si³ w ramionach. 
};

//========================================
//-----------------> THISPLACE
//========================================

INSTANCE DIA_Naldur_THISPLACE (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_THISPLACE_Condition;
   information  = DIA_Naldur_THISPLACE_Info;
   permanent	= 0;
   description	= "Co mo¿esz mi powiedzieæ o tym miejscu?";
};

FUNC INT DIA_Naldur_THISPLACE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_HELLO1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_THISPLACE_Info()
{
    AI_Output (other, self ,"DIA_Naldur_THISPLACE_15_01"); //Co mo¿esz mi powiedzieæ o tym miejscu? 
    AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_02"); //W Starym Obozie mo¿na spotkaæ wys³anników z Sekty. Ka¿¹ siê nazywaæ Baalami, lecz tak naprawdê nimi nie s¹. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_03"); //Otó¿ w obozie na bagnie tytu³ Baala przys³uguje jedynie dla Guru, którzy przewodz¹ Sekcie, a ¿aden z Guru nie robi³by w Starym Obozie za handlarza zielem, czy werbownika. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_04"); //Taranowi i Parvezowi pozwolono u¿ywaæ tego tytu³u jedynie poza Obozem i tylko w stosunku do ludzi spoza Sekty. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_05"); //Chodzi pewnie o to, by miejscowi bardziej szanowali tych wys³anników Bractwa, ale i tak wszyscy ich traktuj¹ jak zwyk³ych handlarzy i to handlarzy z wypranymi mózgami. 
	AI_Output (self, other ,"DIA_Naldur_THISPLACE_03_06"); //A tak, w obozie na bagnie to ci dwaj 'Baalowie' s¹ jedynie zwyk³ymi Nowicjuszami i w niczym nie ró¿ni¹ siê od tych, których zagania siê do pracy przy mieszaniu bagiennego ziela. 
};

/*
//========================================
//-----------------> PSI
//========================================

INSTANCE DIA_Naldur_PSI (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_PSI_Condition;
   information  = DIA_Naldur_PSI_Info;
   permanent	= 0;
   description	= "Sk¹d masz t¹ wiedzê o Bractwie?";
};

FUNC INT DIA_Naldur_PSI_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_THISPLACE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_PSI_Info()
{
    AI_Output (other, self ,"DIA_Naldur_PSI_15_01"); //Sk¹d masz t¹ wiedzê o Bractwie?
    AI_Output (self, other ,"DIA_Naldur_PSI_03_02"); //Ma siê te znajomoœci, ale nie bêdê wymienia³ ¿adnych imion – to kwestia honoru i lojalnoœci. 
	AI_Output (self, other ,"DIA_Naldur_PSI_03_03"); //Wprawdzie jesteœmy skazañcami, lecz pewne wartoœci z tamtego œwiata dziwnie dobrze sprawdzaj¹ siê i tutaj. 
};*/

//========================================
//-----------------> BOSS
//========================================

INSTANCE DIA_Naldur_BOSS (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_BOSS_Condition;
   information  = DIA_Naldur_BOSS_Info;
   permanent	= 0;
   description	= "Kto tu rz¹dzi?";
};

FUNC INT DIA_Naldur_BOSS_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_HELLO1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_BOSS_Info()
{
    AI_Output (other, self ,"DIA_Naldur_BOSS_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Naldur_BOSS_03_02"); //Jak to kto? GOMEZ i jego STRA¯NICY!
};

//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Naldur_FIGHT (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_FIGHT_Condition;
   information  = DIA_Naldur_FIGHT_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_FIGHT_Condition()
{
	if Npc_KnowsInfo (hero,TRIA_ZakladyErensa) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN")<500)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Naldur_FIGHT_03_01"); //A wiêc to z tob¹ mam walczyæ? To nie powinno potrwaæ d³ugo. Zaczynajmy!
	
	AI_StopProcessInfos	( self );
	self.npctype = npctype_FRIEND;
	B_ChangeGuild   		 (self,GIL_NONE);  
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

//========================================
//-----------------> WIN
//========================================

INSTANCE DIA_Naldur_WIN (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_WIN_Condition;
   information  = DIA_Naldur_WIN_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_WIN_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_FIGHT) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_WIN_Info()
{
    AI_Output (self, other ,"DIA_Naldur_WIN_03_01"); //Pokona³eœ mnie! Nie doceni³em twojej si³y. 
	
	B_ChangeGuild   		 (self,GIL_VLK);  
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOSE
//========================================

INSTANCE DIA_Naldur_LOSE (C_INFO)
{
   npc          = VLK_577_Buddler;
   nr           = 1;
   condition    = DIA_Naldur_LOSE_Condition;
   information  = DIA_Naldur_LOSE_Info;
   permanent	= 0;
   important 	= 1;
};

FUNC INT DIA_Naldur_LOSE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Naldur_FIGHT) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Naldur_LOSE_Info()
{
    AI_Output (self, other ,"DIA_Naldur_LOSE_03_01"); //Na przysz³oœæ nie zadzieraj ze starym Erensem. 
	
	B_ChangeGuild   		 (self,GIL_VLK);  
	AI_StopProcessInfos	(self);
};