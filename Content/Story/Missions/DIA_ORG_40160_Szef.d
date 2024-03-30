// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Szef_EXIT(C_INFO)
{
	npc             = ORG_40160_Szef;
	nr              = 999;
	condition	= DIA_Szef_EXIT_Condition;
	information	= DIA_Szef_EXIT_Info;
	permanent	= TRUE;
	description     = "hs@FF0000 KONIEC";
};

FUNC INT DIA_Szef_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Szef_EXIT_Info()
{
    AI_StopProcessInfos	(self);

    B_ChangeGuild   		 (Org_40159_Rozbojnik,GIL_GOBBO);  
	B_ChangeGuild   		 (Org_40161_Rozbojnik,GIL_GOBBO);  
	B_ChangeGuild   		 (ORG_40160_Szef,GIL_GOBBO);  
	
    Npc_SetPermAttitude (Org_40159_Rozbojnik, ATT_HOSTILE);
    Npc_SetPermAttitude (Org_40161_Rozbojnik, ATT_HOSTILE);
    Npc_SetPermAttitude (ORG_40160_Szef, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    Org_40159_Rozbojnik.aivar[AIV_WASDEFEATEDBYSC]==FALSE;
	
};

//========================================
//-----------------> HI_PZ
//========================================

INSTANCE DIA_Szef_HI_PZ (C_INFO)
{
   npc          = ORG_40160_Szef;
   nr           = 1;
   condition    = DIA_Szef_HI_PZ_Condition;
   information  = DIA_Szef_HI_PZ_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Szef_HI_PZ_Condition()
{
if (PZ_GoWithRobber == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Szef_HI_PZ_Info()
{
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_01"); //Ooo a kogó¿ to przywia³o.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_02"); //Wasz kumpel dosta³ trochê po g³ówce i postanowi³ mnie tutaj przyprowadziæ.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_03"); //A có¿ ciê sprowadza?
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_04"); //Nie sprzedacie dokumentów Nowego Obozu Magnatom.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_05"); //Hah ciekawa nowina. Sk¹d pochodzi?
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_06"); //Foster nim go zamordowaliœcie zmieni³ postawê. Odkry³em co go gryzie i przeczyta³em list jaki otrzyma³.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_07"); //Potem ostrzeg³em kogo trzeba. Wiêc nie macie ju¿ czego tam szukaæ.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_08"); //Pfff nie znasz naszych mo¿liwoœci. Jest nas raptem kilku a mo¿emy wp³yn¹æ na wielk¹ politykê haha
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_09"); //Magnaci sowicie nas wynagrodz¹ za te dokumenty. Kwestie ich pozyskania za³atwimy szybko.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_10"); //Wczeœniej to ja za³atwiê was. 
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_11"); //Marzenia. Ch³opcy flaszka dobrej gorza³y dla tego, kto ukatrupi tego m¹drale!
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_12"); //Poka¿cie co potraficie pajace.
	
	EquipItem	(Org_40159_Rozbojnik, ItMw_1H_Sword_04_Z);
	Org_40159_Rozbojnik.attribute[ATR_HITPOINTS] 	= 440;
	B_LogEntry           (PoszkodowaniZbieracze,"Zabi³em wszystkich rozbójników ³¹cznie z pewnym siebie ich szefem. Pora zdaæ raport Lee i rozmówiæ siê z Rufusem.");
   
};

//========================================
//-----------------> PZ_GORN
//========================================

INSTANCE DIA_Szef_PZ_GORN (C_INFO)
{
   npc          = ORG_40160_Szef;
   nr           = 1;
   condition    = DIA_Szef_PZ_GORN_Condition;
   information  = DIA_Szef_PZ_GORN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Szef_PZ_GORN_Condition()
{
if (FollowInAroundPZ == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Szef_PZ_GORN_Info()
{
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_01"); //Ooo nowi koledzy przyszli! Czego chcecie?
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_02"); //Wiemy co zamierzacie zrobiæ. 
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_03"); //Kradzie¿ wa¿nych dokumentów Nowego Obozu chodzi wam po g³owach!
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_04"); //Jakieœ dowody?
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_05"); //Mam wasze pismo do Fostera.
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_06"); //Brawo. No i co?
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_07"); //W wasze ³apy trafia³y ruda i rzeczy kradzione zbieraczom a teraz chcecie cenne dokumenty.
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_08"); //Ruda od Magnatów kusi co?
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_09"); //Zarobek to zarobek. A ty w niczym nam nie przeszkodzisz. 
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_10"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_11"); //Ty i twój kumpel traficie do zimnej gleby. Ju¿ za chwilê...
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_12"); //To siê jeszcze oka¿e!
   
	
//	
};

instance dia_szef_pickpocket(c_info) {
    npc = org_40160_szef;
    nr = 900;
    condition = dia_szef_pickpocket_condition;
    information = dia_szef_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_szef_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_szef_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_szef_pickpocket);
	info_addchoice(dia_szef_pickpocket, dialog_back, dia_szef_pickpocket_back);
	info_addchoice(dia_szef_pickpocket, dialog_pickpocket, dia_szef_pickpocket_doit);
};

func void dia_szef_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_szef_pickpocket);
};

func void dia_szef_pickpocket_back() {
    info_clearchoices(dia_szef_pickpocket);
};