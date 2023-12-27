// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Eskel_Exit (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 999;
	condition	= DIA_Eskel_Exit_Condition;
	information	= DIA_Eskel_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Eskel_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Eskel_Exit_Info()
{
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Eskel_Hello (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_Hello_Condition;
	information	= DIA_Eskel_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_Eskel_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Eskel_Hello_Info()
{
	AI_Output (other, self,"DIA_Eskel_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Eskel_Hello_01_01"); //A co ciê to obchodzi? A zreszt¹... Jeszcze niedawno by³em piekarzem i nawet jakoœ sobie radzi³em. Do czasu, gdy mi³oœciwie nam panuj¹cy Rhobar II nie zacz¹³ nak³adaæ coraz to nowych podatków. 
	AI_Output (self, other,"DIA_Eskel_Hello_01_02"); //Wszystko na t¹ wojnê z orkami. Postanowi³em jednak siê nie dawaæ.
	AI_Output (self, other,"DIA_Eskel_Hello_01_03"); //By sobie jakoœ odbijaæ ten królewski haracz, zacz¹³em dosypywaæ piachu do swojej m¹ki. Pewnego ranka do moich drzwi zastuka³a stra¿ i siê skoñczy³o.
	AI_Output (self, other,"DIA_Eskel_Hello_01_04"); //Musia³em siê po¿egnaæ z moj¹ piekarni¹ w Khorinis.
};

INSTANCE DIA_Eskel_GoodPunish (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_GoodPunish_Condition;
	information	= DIA_Eskel_GoodPunish_Info;
	permanent	= 0;
	description = "Nale¿a³o ci siê.";
};                       

FUNC INT DIA_Eskel_GoodPunish_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_GoodPunish_Info()
{
	AI_Output (other, self,"DIA_Eskel_GoodPunish_15_00"); //Nale¿a³o ci siê za to dosypywanie piasku do m¹ki.
	AI_Output (self, other,"DIA_Eskel_GoodPunish_01_01"); //Zje¿d¿aj st¹d!
	
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Eskel_WhoRules (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_WhoRules_Condition;
	information	= DIA_Eskel_WhoRules_Info;
	permanent	= 0;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT DIA_Eskel_WhoRules_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_WhoRules_Info()
{
	AI_Output (other, self,"DIA_Eskel_WhoRules_15_00"); //Kto tu rz¹dzi?
	AI_Output (self, other,"DIA_Eskel_WhoRules_01_01"); //Rz¹dz¹ tutaj Stra¿nicy, a raczej piêœci tych pysza³kowatych siepaczy. To nie Montera, tutaj Stra¿nicy nie dzia³aj¹ w imieniu prawa. Te osi³ki wymuszaj¹ na Kopaczach haracz, w zamian za "ochronê".
	AI_Output (self, other,"DIA_Eskel_WhoRules_01_02"); //Chcesz prze¿yæ w tej parszywej Kolonii, to dam ci dobr¹ rade, ch³opcze. Lepiej im zap³aæ. Wprawdzie jak ktoœ bêdzie chcia³ ci wtedy ukreciæ ³eb, to Sra¿nicy nie popêdz¹ na ratunek, ale przynajmniej mu nie pomog¹.
};

INSTANCE DIA_Eskel_DailyLife (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_DailyLife_Condition;
	information	= DIA_Eskel_DailyLife_Info;
	permanent	= 0;
	description = "Jak wygl¹da ¿ycie tutaj?";
};                       

FUNC INT DIA_Eskel_DailyLife_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Eskel_Hello))
	{
		return 1;
	};
};

func void DIA_Eskel_DailyLife_Info()
{
	AI_Output (other, self,"DIA_Eskel_DailyLife_15_00"); //Jak wygl¹da ¿ycie tutaj?
	AI_Output (self, other,"DIA_Eskel_DailyLife_01_01"); //Jeszcze siê pytasz? Rozejrzyj siê. To jest wiezienie, a my Kopacze jesteœmy na samym pocz¹tku tego ³añcucha pokarmowego. Przeklête miejsce...
};

INSTANCE DIA_Eskel_Teeth (C_INFO)
{
	npc			= VLK_575_Buddler;
	nr			= 1;
	condition	= DIA_Eskel_Teeth_Condition;
	information	= DIA_Eskel_Teeth_Info;
	important	= 1;
//	description = ".";
};                       

FUNC INT DIA_Eskel_Teeth_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jesse_Eskel))
	{
		return 1;
	};
};

FUNC VOID DIA_Eskel_Teeth_Info()
{
	AI_Output (self, other,"DIA_Eskel_Teeth_01_00"); //Aaaa... Moja szczêka!
	AI_Output (other, self,"DIA_Eskel_Teeth_15_01"); //Ooo... Co takiego strasznego ciê spotka³o?
	AI_Output (self, other,"DIA_Eskel_Teeth_01_02"); //Jakiœ drañ dosypa³ mi piasku do m¹ki. Straci³em kilka zêbów! Gdybym ja go dopad³!
	AI_Output (other, self,"DIA_Eskel_Teeth_15_03"); //Ponoæ pewien piekarz z Khorinis robi³ podobnie.
	AI_Output (self, other,"DIA_Eskel_Teeth_01_04"); //Nic mi o tym nie wiadomo.
	AI_Output (other, self,"DIA_Eskel_Teeth_15_05"); //Ciekawe. Zatem ¿yczê mi³ego liczenia zêbów.
	
	AI_StopProcessInfos(self);
};