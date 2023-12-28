instance Info_Grd_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_Grd_6_pickpocket_Condition;
	information = Info_Grd_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};

func int Info_Grd_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceGRD, 35);
};

func void Info_Grd_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_Grd_6_pickpocket);
	Info_AddChoice(Info_Grd_6_pickpocket, dialog_back,Info_Grd_6_pickpocket_back);
	Info_AddChoice(Info_Grd_6_pickpocket, dialog_pickpocket,Info_Grd_6_pickpocket_doit);
};

func void Info_Grd_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_Grd_6_pickpocket);
};

func void Info_Grd_6_pickpocket_back() {
    info_clearchoices(Info_Grd_6_pickpocket);
};

func void B_AssignAmbientInfos_GRD_6(var C_Npc slf)
{
	B_AssignAmbientInfos_GRD_6_old(slf);
	Info_Grd_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_GRD_7(var C_Npc slf)
{
	B_AssignAmbientInfos_GRD_7_old(slf);
	Info_Grd_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_GRD_13(var C_Npc slf)
{
	B_AssignAmbientInfos_GRD_13_old(slf);
	Info_Grd_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_STT_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_STT_6_pickpocket_Condition;
	information = Info_STT_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};

func int Info_STT_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceSTT, 20);
};

func void Info_STT_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_STT_6_pickpocket);
	Info_AddChoice(Info_STT_6_pickpocket, dialog_back,Info_STT_6_pickpocket_back);
	Info_AddChoice(Info_STT_6_pickpocket, dialog_pickpocket,Info_STT_6_pickpocket_doit);
};

func void Info_STT_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_STT_6_pickpocket);
};

func void Info_STT_6_pickpocket_back() {
    info_clearchoices(Info_STT_6_pickpocket);
};

func void B_AssignAmbientInfos_STT_10(var C_Npc slf)
{
	B_AssignAmbientInfos_STT_10_old(slf);
	Info_STT_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_STT_12(var C_Npc slf)
{
	B_AssignAmbientInfos_STT_12_old(slf);
	Info_STT_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_VLK_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_VLK_6_pickpocket_Condition;
	information = Info_VLK_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_VLK_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceVLK, 15);
};

func void Info_VLK_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_VLK_6_pickpocket);
	Info_AddChoice(Info_VLK_6_pickpocket, dialog_back,Info_VLK_6_pickpocket_back);
	Info_AddChoice(Info_VLK_6_pickpocket, dialog_pickpocket,Info_VLK_6_pickpocket_doit);
};

func void Info_VLK_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_VLK_6_pickpocket);
};

func void Info_VLK_6_pickpocket_back() {
    info_clearchoices(Info_VLK_6_pickpocket);
};

func void B_AssignAmbientInfos_VLK_1(var C_Npc slf)
{
	B_AssignAmbientInfos_VLK_1_old(slf);
	Info_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_VLK_2(var C_Npc slf)
{
	B_AssignAmbientInfos_VLK_2_old(slf);
	Info_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_VLK_3(var C_Npc slf)
{
	B_AssignAmbientInfos_VLK_3_old(slf);
	Info_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_VLK_4(var C_Npc slf)
{
	B_AssignAmbientInfos_VLK_4_old(slf);
	Info_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_SFB_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_SFB_6_pickpocket_Condition;
	information = Info_SFB_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_SFB_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceSFB, 18);
};

func void Info_SFB_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_SFB_6_pickpocket);
	Info_AddChoice(Info_SFB_6_pickpocket, dialog_back,Info_SFB_6_pickpocket_back);
	Info_AddChoice(Info_SFB_6_pickpocket, dialog_pickpocket,Info_SFB_6_pickpocket_doit);
};

func void Info_SFB_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_SFB_6_pickpocket);
};

func void Info_SFB_6_pickpocket_back() {
    info_clearchoices(Info_SFB_6_pickpocket);
};

func void B_AssignAmbientInfos_SFB_1(var C_Npc slf)
{
	B_AssignAmbientInfos_SFB_1_old(slf);
	Info_SFB_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_SFB_2(var C_Npc slf)
{
	B_AssignAmbientInfos_SFB_2_old(slf);
	Info_SFB_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_SFB_5(var C_Npc slf)
{
	B_AssignAmbientInfos_SFB_5_old(slf);
	Info_SFB_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_NOV_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_NOV_6_pickpocket_Condition;
	information = Info_NOV_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_NOV_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceNOV, 25);
};

func void Info_NOV_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_NOV_6_pickpocket);
	Info_AddChoice(Info_NOV_6_pickpocket, dialog_back,Info_NOV_6_pickpocket_back);
	Info_AddChoice(Info_NOV_6_pickpocket, dialog_pickpocket,Info_NOV_6_pickpocket_doit);
};

func void Info_NOV_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_NOV_6_pickpocket);
};

func void Info_NOV_6_pickpocket_back() {
    info_clearchoices(Info_NOV_6_pickpocket);
};

func void B_AssignAmbientInfos_NOV_2(var C_Npc slf)
{
	B_AssignAmbientInfos_NOV_2_old(slf);
	Info_NOV_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	B_AssignAmbientInfos_NOV_3_old(slf);
	Info_NOV_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_NOV_5(var C_Npc slf)
{
	B_AssignAmbientInfos_NOV_5_old(slf);
	Info_NOV_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_TPL_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_TPL_6_pickpocket_Condition;
	information = Info_TPL_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_TPL_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceTPL, 35);
};

func void Info_TPL_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_TPL_6_pickpocket);
	Info_AddChoice(Info_TPL_6_pickpocket, dialog_back,Info_TPL_6_pickpocket_back);
	Info_AddChoice(Info_TPL_6_pickpocket, dialog_pickpocket,Info_TPL_6_pickpocket_doit);
};

func void Info_TPL_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_TPL_6_pickpocket);
};

func void Info_TPL_6_pickpocket_back() {
    info_clearchoices(Info_TPL_6_pickpocket);
};

func void B_AssignAmbientInfos_TPL_8(var C_Npc slf)
{
	B_AssignAmbientInfos_TPL_8_old(slf);
	Info_TPL_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_TPL_13(var C_Npc slf)
{
	B_AssignAmbientInfos_TPL_13_old(slf);
	Info_TPL_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_BAU_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_BAU_6_pickpocket_Condition;
	information = Info_BAU_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_BAU_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceBAU, 15);
};

func void Info_BAU_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_BAU_6_pickpocket);
	Info_AddChoice(Info_BAU_6_pickpocket, dialog_back,Info_BAU_6_pickpocket_back);
	Info_AddChoice(Info_BAU_6_pickpocket, dialog_pickpocket,Info_BAU_6_pickpocket_doit);
};

func void Info_BAU_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_BAU_6_pickpocket);
};

func void Info_BAU_6_pickpocket_back() {
    info_clearchoices(Info_BAU_6_pickpocket);
};

func void B_AssignAmbientInfos_BAU_2(var C_Npc slf)
{
	B_AssignAmbientInfos_BAU_2_old(slf);
	Info_BAU_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_BAU_4(var C_Npc slf)
{
	B_AssignAmbientInfos_BAU_4_old(slf);
	Info_BAU_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_BAU_9(var C_Npc slf)
{
	B_AssignAmbientInfos_BAU_9_old(slf);
	Info_BAU_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_ORG_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_ORG_6_pickpocket_Condition;
	information = Info_ORG_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_ORG_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceORG, 20);
};

func void Info_ORG_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_ORG_6_pickpocket);
	Info_AddChoice(Info_ORG_6_pickpocket, dialog_back,Info_ORG_6_pickpocket_back);
	Info_AddChoice(Info_ORG_6_pickpocket, dialog_pickpocket,Info_ORG_6_pickpocket_doit);
};

func void Info_ORG_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_ORG_6_pickpocket);
};

func void Info_ORG_6_pickpocket_back() {
    info_clearchoices(Info_ORG_6_pickpocket);
};

func void B_AssignAmbientInfos_ORG_6(var C_Npc slf)
{
	B_AssignAmbientInfos_ORG_6_old(slf);
	Info_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_ORG_7(var C_Npc slf)
{
	B_AssignAmbientInfos_ORG_7_old(slf);
	Info_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_ORG_13(var C_Npc slf)
{
	B_AssignAmbientInfos_ORG_13_old(slf);
	Info_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_SLD_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_SLD_6_pickpocket_Condition;
	information = Info_SLD_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_SLD_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceSLD, 30);
};

func void Info_SLD_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_SLD_6_pickpocket);
	Info_AddChoice(Info_SLD_6_pickpocket, dialog_back,Info_SLD_6_pickpocket_back);
	Info_AddChoice(Info_SLD_6_pickpocket, dialog_pickpocket,Info_SLD_6_pickpocket_doit);
};

func void Info_SLD_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_SLD_6_pickpocket);
};

func void Info_SLD_6_pickpocket_back() {
    info_clearchoices(Info_SLD_6_pickpocket);
};

func void B_AssignAmbientInfos_SLD_8(var C_Npc slf)
{
	B_AssignAmbientInfos_SLD_8_old(slf);
	Info_SLD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_SLD_11(var C_Npc slf)
{
	B_AssignAmbientInfos_SLD_11_old(slf);
	Info_SLD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_MINE_GRD_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_MINE_GRD_6_pickpocket_Condition;
	information = Info_MINE_GRD_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};

func int Info_MINE_GRD_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceGRD, 30);
};

func void Info_MINE_GRD_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_MINE_GRD_6_pickpocket);
	Info_AddChoice(Info_MINE_GRD_6_pickpocket, dialog_back,Info_MINE_GRD_6_pickpocket_back);
	Info_AddChoice(Info_MINE_GRD_6_pickpocket, dialog_pickpocket,Info_MINE_GRD_6_pickpocket_doit);
};

func void Info_MINE_GRD_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_MINE_GRD_6_pickpocket);
};

func void Info_MINE_GRD_6_pickpocket_back() {
    info_clearchoices(Info_MINE_GRD_6_pickpocket);
};

func void B_AssignAmbientInfos_MINE_GRD_6(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_GRD_6_old(slf);
	Info_MINE_GRD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_GRD_7(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_GRD_7_old(slf);
	Info_MINE_GRD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_GRD_13(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_GRD_13_old(slf);
	Info_MINE_GRD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_MINE_ORG_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_MINE_ORG_6_pickpocket_Condition;
	information = Info_MINE_ORG_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_MINE_ORG_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceORG, 20);
};

func void Info_MINE_ORG_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_MINE_ORG_6_pickpocket);
	Info_AddChoice(Info_MINE_ORG_6_pickpocket, dialog_back,Info_MINE_ORG_6_pickpocket_back);
	Info_AddChoice(Info_MINE_ORG_6_pickpocket, dialog_pickpocket,Info_MINE_ORG_6_pickpocket_doit);
};

func void Info_MINE_ORG_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_MINE_ORG_6_pickpocket);
};

func void Info_MINE_ORG_6_pickpocket_back() {
    info_clearchoices(Info_MINE_ORG_6_pickpocket);
};

func void B_AssignAmbientInfos_MINE_ORG_6(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_ORG_6_old(slf);
	Info_MINE_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_ORG_7(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_ORG_7_old(slf);
	Info_MINE_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_ORG_13(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_ORG_13_old(slf);
	Info_MINE_ORG_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_MINE_SLD_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_MINE_SLD_6_pickpocket_Condition;
	information = Info_MINE_SLD_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_MINE_SLD_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceSLD, 25);
};

func void Info_MINE_SLD_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_MINE_SLD_6_pickpocket);
	Info_AddChoice(Info_MINE_SLD_6_pickpocket, dialog_back,Info_MINE_SLD_6_pickpocket_back);
	Info_AddChoice(Info_MINE_SLD_6_pickpocket, dialog_pickpocket,Info_MINE_SLD_6_pickpocket_doit);
};

func void Info_MINE_SLD_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_MINE_SLD_6_pickpocket);
};

func void Info_MINE_SLD_6_pickpocket_back() {
    info_clearchoices(Info_MINE_SLD_6_pickpocket);
};

func void B_AssignAmbientInfos_MINE_SLD_8(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_SLD_8_old(slf);
	Info_MINE_SLD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_SLD_11(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_SLD_11_old(slf);
	Info_MINE_SLD_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_MINE_VLK_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_MINE_VLK_6_pickpocket_Condition;
	information = Info_MINE_VLK_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_MINE_VLK_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceVLK, 15);
};

func void Info_MINE_VLK_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_MINE_VLK_6_pickpocket);
	Info_AddChoice(Info_MINE_VLK_6_pickpocket, dialog_back,Info_MINE_VLK_6_pickpocket_back);
	Info_AddChoice(Info_MINE_VLK_6_pickpocket, dialog_pickpocket,Info_MINE_VLK_6_pickpocket_doit);
};

func void Info_MINE_VLK_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_MINE_VLK_6_pickpocket);
};

func void Info_MINE_VLK_6_pickpocket_back() {
    info_clearchoices(Info_MINE_VLK_6_pickpocket);
};

func void B_AssignAmbientInfos_MINE_VLK_1(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_VLK_1_old(slf);
	Info_MINE_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_VLK_2(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_VLK_2_old(slf);
	Info_MINE_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_VLK_3(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_VLK_3_old(slf);
	Info_MINE_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

func void B_AssignAmbientInfos_MINE_VLK_4(var C_Npc slf)
{
	B_AssignAmbientInfos_MINE_VLK_4_old(slf);
	Info_MINE_VLK_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};

instance Info_fnov_6_pickpocket(C_Info)
{
	nr = 900;
	condition = Info_fnov_6_pickpocket_Condition;
	information = Info_fnov_6_pickpocket_Info;
	permanent = 1;
	description = pickpocket_final;
};


func int Info_fnov_6_pickpocket_Condition()
{
	c_beklauen(baseThfChanceNOV, 15);
};

func void Info_fnov_6_pickpocket_Info()
{
	b_steal_message();
	Info_ClearChoices(Info_fnov_6_pickpocket);
	Info_AddChoice(Info_fnov_6_pickpocket, dialog_back,Info_fnov_6_pickpocket_back);
	Info_AddChoice(Info_fnov_6_pickpocket, dialog_pickpocket,Info_fnov_6_pickpocket_doit);
};

func void Info_fnov_6_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(Info_fnov_6_pickpocket);
};

func void Info_fnov_6_pickpocket_back() {
    info_clearchoices(Info_fnov_6_pickpocket);
};

func void B_AssignAmbientInfos_fnov_2(var C_Npc slf)
{
	B_AssignAmbientInfos_fnov_2_old(slf);
	Info_fnov_6_pickpocket.npc = Hlp_GetInstanceID(slf);
};