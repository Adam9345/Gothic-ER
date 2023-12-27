instance Info_TPL_1405_GorNaRan (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	condition	= Info_TPL_1405_GorNaRan_Condition;
	information	= Info_TPL_1405_GorNaRan_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan_Condition()
{
		return TRUE;
};

FUNC VOID Info_TPL_1405_GorNaRan_Info()
{
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_01"); //A dok¹d to siê wybierasz? Nikt nie ma tu prawa wstêpu!
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan2 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan2_Condition;
	information	= Info_TPL_1405_GorNaRan2_Info;
	permanent	= 1;
	description = "A co siê tu tak w ogóle dzieje?";
};                       

FUNC INT Info_TPL_1405_GorNaRan2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan2_Info()
{
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02"); //A co siê tu tak w ogóle dzieje?
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Pytasz, co siê tu dzieje? Padnij na kolana i b³agaj Œni¹cego o litoœæ nad tw¹ grzeszn¹ dusz¹! Oto bowiem nadszed³ moment jego wielkiego przebudzenia!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE1"); //Jesteœ œlepcem! Nie dostrzeg³eœ potêgi Œni¹cego. Gdybyœ rozumia³, co siê tu dzieje, ju¿ dawno sta³byœ po mojej stronie.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE2"); //Nie zauwa¿y³eœ nawet tego cienia, który szed³ za tob¹ od pocz¹tku twojej wêdrówki po Œwi¹tyni.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE3"); //Tak, ten ma³o rozgarniêty cz³owieczek by³ jak twój cieñ. Zawsze krok za tob¹. 
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE4"); //A wiesz, co go tu zaprowadzi³o? Chêæ zemsty za zabicie jego towarzysza. Pewnie znasz tê historiê, pewnie ci j¹ opowiada³...
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE5"); //Ten cz³owiek nie wie tylko, ¿e przyby³ tu na pewn¹ œmieræ. Jestem natchniony przez Œni¹cego. Jestem potêg¹!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03_NE6"); //No proszê, wróæ do niego. Stoi tu¿ za rogiem. I przyprowadŸ go na œmieræ z mojej rêki! Niech pozna potêgê Œni¹cego!
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02_NE6"); //DOŒÆ! 
	AI_StopProcessInfos (self);
	Wld_InsertNpc				( NON_5676_MagnusOT, 	"TPL_319" ); 
};

/*
// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan3 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan3_Condition;
	information	= Info_TPL_1405_GorNaRan3_Info;
	permanent	= 1;
	description = "Chcia³em siê tylko trochê rozejrzeæ.";
};                       

FUNC INT Info_TPL_1405_GorNaRan3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan2 )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan3_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Chcia³em siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Gnido! Tacy jak ty nie maj¹ tu czego szukaæ we wznios³ej chwili ostatecznego triumfu Œni¹cego! Widzê, ¿e muszê ci to wbiæ do g³owy!
	
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 		( self, ZS_Attack, 1 ,"" );
};
*/


INSTANCE Info_TPL_1405_GorNaRan4 (C_INFO)
{
	npc			= TPL_1491_GorNaTokasOT;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan4_Condition;
	information	= Info_TPL_1405_GorNaRan4_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan4_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_MagnusOT_HELLO1 )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan4_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Nie powstrzymasz mnie!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Jak sobie ¿yczysz, ch³opcze, w imiê Œni¹cego!

	B_ChangeGuild    	(self,GIL_GRD);  
	self.guild = GIL_GRD;
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 	( self, ZS_Attack, 1 ,"" );
	
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Kolejnym przeciwnikiem na mojej drodze by³ Gor Na Tokas, Stra¿nik Œwi¹tynny, którego zna³em z obozu na bagnie. Dzier¿y wspania³y i niezwykle szybki miecz, wykuty ku chwale Œni¹cego. Cieszê siê, ¿e jest ze mn¹ Magnus.");
};
