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
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_01"); //Ooo a kog� to przywia�o.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_02"); //Wasz kumpel dosta� troch� po g��wce i postanowi� mnie tutaj przyprowadzi�.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_03"); //A c� ci� sprowadza?
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_04"); //Nie sprzedacie dokument�w Nowego Obozu Magnatom.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_05"); //Hah ciekawa nowina. Sk�d pochodzi?
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_06"); //Foster nim go zamordowali�cie zmieni� postaw�. Odkry�em co go gryzie i przeczyta�em list jaki otrzyma�.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_07"); //Potem ostrzeg�em kogo trzeba. Wi�c nie macie ju� czego tam szuka�.
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_08"); //Pfff nie znasz naszych mo�liwo�ci. Jest nas raptem kilku a mo�emy wp�yn�� na wielk� polityk� haha
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_09"); //Magnaci sowicie nas wynagrodz� za te dokumenty. Kwestie ich pozyskania za�atwimy szybko.
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_10"); //Wcze�niej to ja za�atwi� was. 
    AI_Output (self, other ,"DIA_Szef_HI_PZ_03_11"); //Marzenia. Ch�opcy flaszka dobrej gorza�y dla tego, kto ukatrupi tego m�drale!
    AI_Output (other, self ,"DIA_Szef_HI_PZ_15_12"); //Poka�cie co potraficie pajace.
	
	EquipItem	(Org_40159_Rozbojnik, ItMw_1H_Sword_04_Z);
	Org_40159_Rozbojnik.attribute[ATR_HITPOINTS] 	= 440;
	B_LogEntry           (PoszkodowaniZbieracze,"Zabi�em wszystkich rozb�jnik�w ��cznie z pewnym siebie ich szefem. Pora zda� raport Lee i rozm�wi� si� z Rufusem.");
   
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
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_02"); //Wiemy co zamierzacie zrobi�. 
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_03"); //Kradzie� wa�nych dokument�w Nowego Obozu chodzi wam po g�owach!
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_04"); //Jakie� dowody?
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_05"); //Mam wasze pismo do Fostera.
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_06"); //Brawo. No i co?
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_07"); //W wasze �apy trafia�y ruda i rzeczy kradzione zbieraczom a teraz chcecie cenne dokumenty.
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_08"); //Ruda od Magnat�w kusi co?
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_09"); //Zarobek to zarobek. A ty w niczym nam nie przeszkodzisz. 
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_10"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Szef_PZ_GORN_03_11"); //Ty i tw�j kumpel traficie do zimnej gleby. Ju� za chwil�...
    AI_Output (other, self ,"DIA_Szef_PZ_GORN_15_12"); //To si� jeszcze oka�e!
   
	
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