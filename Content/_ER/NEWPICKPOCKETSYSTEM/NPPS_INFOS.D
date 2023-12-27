META{
	MergeMode = TRUE;
};

instance dia_grim_pickpocket(c_info) {
    npc = vlk_580_grim;
    nr = 900;
    condition = dia_grim_pickpocket_condition;
    information = dia_grim_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grim_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 15);
};

func void dia_grim_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grim_pickpocket);
	info_addchoice(dia_grim_pickpocket, dialog_back, dia_grim_pickpocket_back);
	info_addchoice(dia_grim_pickpocket, dialog_pickpocket, dia_grim_pickpocket_doit);
};

func void dia_grim_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grim_pickpocket);
};

func void dia_grim_pickpocket_back() {
    info_clearchoices(dia_grim_pickpocket);
};

instance dia_rocky_pickpocket(c_info) {
    npc = ban_1605_rocky;
    nr = 900;
    condition = dia_rocky_pickpocket_condition;
    information = dia_rocky_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rocky_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_rocky_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rocky_pickpocket);
	info_addchoice(dia_rocky_pickpocket, dialog_back, dia_rocky_pickpocket_back);
	info_addchoice(dia_rocky_pickpocket, dialog_pickpocket, dia_rocky_pickpocket_doit);
};

func void dia_rocky_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rocky_pickpocket);
};

func void dia_rocky_pickpocket_back() {
    info_clearchoices(dia_rocky_pickpocket);
};

instance dia_quentin_pickpocket(c_info) {
    npc = ban_1610_quentin;
    nr = 900;
    condition = dia_quentin_pickpocket_condition;
    information = dia_quentin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_quentin_pickpocket_condition() {
	c_beklauen(baseThfChanceORG - 10, 40);
};

func void dia_quentin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_quentin_pickpocket);
	info_addchoice(dia_quentin_pickpocket, dialog_back, dia_quentin_pickpocket_back);
	info_addchoice(dia_quentin_pickpocket, dialog_pickpocket, dia_quentin_pickpocket_doit);
};

func void dia_quentin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_quentin_pickpocket);
};

func void dia_quentin_pickpocket_back() {
    info_clearchoices(dia_quentin_pickpocket);
};

instance dia_connor_pickpocket(c_info) {
    npc = ban_40028_connor;
    nr = 900;
    condition = dia_connor_pickpocket_condition;
    information = dia_connor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_connor_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_connor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_connor_pickpocket);
	info_addchoice(dia_connor_pickpocket, dialog_back, dia_connor_pickpocket_back);
	info_addchoice(dia_connor_pickpocket, dialog_pickpocket, dia_connor_pickpocket_doit);
};

func void dia_connor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_connor_pickpocket);
};

func void dia_connor_pickpocket_back() {
    info_clearchoices(dia_connor_pickpocket);
};

instance dia_herszt_pickpocket(c_info) {
    npc = ban_40032_herszt;
    nr = 900;
    condition = dia_herszt_pickpocket_condition;
    information = dia_herszt_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_herszt_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_herszt_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_herszt_pickpocket);
	info_addchoice(dia_herszt_pickpocket, dialog_back, dia_herszt_pickpocket_back);
	info_addchoice(dia_herszt_pickpocket, dialog_pickpocket, dia_herszt_pickpocket_doit);
};

func void dia_herszt_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_herszt_pickpocket);
};

func void dia_herszt_pickpocket_back() {
    info_clearchoices(dia_herszt_pickpocket);
};

instance dia_victor_pickpocket(c_info) {
    npc = ban_40067_victor;
    nr = 900;
    condition = dia_victor_pickpocket_condition;
    information = dia_victor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_victor_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_victor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_victor_pickpocket);
	info_addchoice(dia_victor_pickpocket, dialog_back, dia_victor_pickpocket_back);
	info_addchoice(dia_victor_pickpocket, dialog_pickpocket, dia_victor_pickpocket_doit);
};

func void dia_victor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_victor_pickpocket);
};

func void dia_victor_pickpocket_back() {
    info_clearchoices(dia_victor_pickpocket);
};

instance dia_dillon_pickpocket(c_info) {
    npc = bau_40140_dillon;
    nr = 900;
    condition = dia_dillon_pickpocket_condition;
    information = dia_dillon_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dillon_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 10);
};

func void dia_dillon_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dillon_pickpocket);
	info_addchoice(dia_dillon_pickpocket, dialog_back, dia_dillon_pickpocket_back);
	info_addchoice(dia_dillon_pickpocket, dialog_pickpocket, dia_dillon_pickpocket_doit);
};

func void dia_dillon_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_dillon_pickpocket);
};

func void dia_dillon_pickpocket_back() {
    info_clearchoices(dia_dillon_pickpocket);
};

instance dia_ricelord_pickpocket(c_info) {
    npc = bau_900_ricelord;
    nr = 900;
    condition = dia_ricelord_pickpocket_condition;
    information = dia_ricelord_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ricelord_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 25);
};

func void dia_ricelord_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ricelord_pickpocket);
	info_addchoice(dia_ricelord_pickpocket, dialog_back, dia_ricelord_pickpocket_back);
	info_addchoice(dia_ricelord_pickpocket, dialog_pickpocket, dia_ricelord_pickpocket_doit);
};

func void dia_ricelord_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ricelord_pickpocket);
};

func void dia_ricelord_pickpocket_back() {
    info_clearchoices(dia_ricelord_pickpocket);
};

instance dia_horatio_pickpocket(c_info) {
    npc = bau_901_horatio;
    nr = 900;
    condition = dia_horatio_pickpocket_condition;
    information = dia_horatio_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_horatio_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 18);
};

func void dia_horatio_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_horatio_pickpocket);
	info_addchoice(dia_horatio_pickpocket, dialog_back, dia_horatio_pickpocket_back);
	info_addchoice(dia_horatio_pickpocket, dialog_pickpocket, dia_horatio_pickpocket_doit);
};

func void dia_horatio_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_horatio_pickpocket);
};

func void dia_horatio_pickpocket_back() {
    info_clearchoices(dia_horatio_pickpocket);
};

instance dia_pock_pickpocket(c_info) {
    npc = bau_902_pock;
    nr = 900;
    condition = dia_pock_pickpocket_condition;
    information = dia_pock_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pock_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 15);
};

func void dia_pock_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pock_pickpocket);
	info_addchoice(dia_pock_pickpocket, dialog_back, dia_pock_pickpocket_back);
	info_addchoice(dia_pock_pickpocket, dialog_pickpocket, dia_pock_pickpocket_doit);
};

func void dia_pock_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pock_pickpocket);
};

func void dia_pock_pickpocket_back() {
    info_clearchoices(dia_pock_pickpocket);
};

instance dia_rufus_pickpocket(c_info) {
    npc = bau_903_rufus;
    nr = 900;
    condition = dia_rufus_pickpocket_condition;
    information = dia_rufus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rufus_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 18);
};

func void dia_rufus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rufus_pickpocket);
	info_addchoice(dia_rufus_pickpocket, dialog_back, dia_rufus_pickpocket_back);
	info_addchoice(dia_rufus_pickpocket, dialog_pickpocket, dia_rufus_pickpocket_doit);
};

func void dia_rufus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rufus_pickpocket);
};

func void dia_rufus_pickpocket_back() {
    info_clearchoices(dia_rufus_pickpocket);
};

instance dia_jeremiah_pickpocket(c_info) {
    npc = bau_912_jeremiah;
    nr = 900;
    condition = dia_jeremiah_pickpocket_condition;
    information = dia_jeremiah_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jeremiah_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 20);
};

func void dia_jeremiah_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jeremiah_pickpocket);
	info_addchoice(dia_jeremiah_pickpocket, dialog_back, dia_jeremiah_pickpocket_back);
	info_addchoice(dia_jeremiah_pickpocket, dialog_pickpocket, dia_jeremiah_pickpocket_doit);
};

func void dia_jeremiah_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jeremiah_pickpocket);
};

func void dia_jeremiah_pickpocket_back() {
    info_clearchoices(dia_jeremiah_pickpocket);
};

instance dia_foster_pickpocket(c_info) {
    npc = bau_924_foster;
    nr = 900;
    condition = dia_foster_pickpocket_condition;
    information = dia_foster_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_foster_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 20);
};

func void dia_foster_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_foster_pickpocket);
	info_addchoice(dia_foster_pickpocket, dialog_back, dia_foster_pickpocket_back);
	info_addchoice(dia_foster_pickpocket, dialog_pickpocket, dia_foster_pickpocket_doit);
};

func void dia_foster_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_foster_pickpocket);
};

func void dia_foster_pickpocket_back() {
    info_clearchoices(dia_foster_pickpocket);
};

instance dia_homer_pickpocket(c_info) {
    npc = bau_935_homer;
    nr = 900;
    condition = dia_homer_pickpocket_condition;
    information = dia_homer_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_homer_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 20);
};

func void dia_homer_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_homer_pickpocket);
	info_addchoice(dia_homer_pickpocket, dialog_back, dia_homer_pickpocket_back);
	info_addchoice(dia_homer_pickpocket, dialog_pickpocket, dia_homer_pickpocket_doit);
};

func void dia_homer_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_homer_pickpocket);
};

func void dia_homer_pickpocket_back() {
    info_clearchoices(dia_homer_pickpocket);
};

instance dia_gomez_pickpocket(c_info) {
    npc = ebr_100_gomez;
    nr = 900;
    condition = dia_gomez_pickpocket_condition;
    information = dia_gomez_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gomez_pickpocket_condition() {
	c_beklauen(baseThfChanceEBR - 5, 50);
};

func void dia_gomez_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gomez_pickpocket);
	info_addchoice(dia_gomez_pickpocket, dialog_back, dia_gomez_pickpocket_back);
	info_addchoice(dia_gomez_pickpocket, dialog_pickpocket, dia_gomez_pickpocket_doit);
};

func void dia_gomez_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gomez_pickpocket);
};

func void dia_gomez_pickpocket_back() {
    info_clearchoices(dia_gomez_pickpocket);
};

instance dia_scar_pickpocket(c_info) {
    npc = ebr_101_scar;
    nr = 900;
    condition = dia_scar_pickpocket_condition;
    information = dia_scar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scar_pickpocket_condition() {
	c_beklauen(baseThfChanceEBR, 45);
};

func void dia_scar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scar_pickpocket);
	info_addchoice(dia_scar_pickpocket, dialog_back, dia_scar_pickpocket_back);
	info_addchoice(dia_scar_pickpocket, dialog_pickpocket, dia_scar_pickpocket_doit);
};

func void dia_scar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_scar_pickpocket);
};

func void dia_scar_pickpocket_back() {
    info_clearchoices(dia_scar_pickpocket);
};

instance dia_arto_pickpocket(c_info) {
    npc = ebr_102_arto;
    nr = 900;
    condition = dia_arto_pickpocket_condition;
    information = dia_arto_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_arto_pickpocket_condition() {
	c_beklauen(baseThfChanceEBR, 45);
};

func void dia_arto_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_arto_pickpocket);
	info_addchoice(dia_arto_pickpocket, dialog_back, dia_arto_pickpocket_back);
	info_addchoice(dia_arto_pickpocket, dialog_pickpocket, dia_arto_pickpocket_doit);
};

func void dia_arto_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_arto_pickpocket);
};

func void dia_arto_pickpocket_back() {
    info_clearchoices(dia_arto_pickpocket);
};

instance dia_raven_pickpocket(c_info) {
    npc = ebr_105_raven;
    nr = 900;
    condition = dia_raven_pickpocket_condition;
    information = dia_raven_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_raven_pickpocket_condition() {
	c_beklauen(baseThfChanceEBR, 45);
};

func void dia_raven_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_raven_pickpocket);
	info_addchoice(dia_raven_pickpocket, dialog_back, dia_raven_pickpocket_back);
	info_addchoice(dia_raven_pickpocket, dialog_pickpocket, dia_raven_pickpocket_doit);
};

func void dia_raven_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_raven_pickpocket);
};

func void dia_raven_pickpocket_back() {
    info_clearchoices(dia_raven_pickpocket);
};

instance dia_bartholo_pickpocket(c_info) {
    npc = ebr_106_bartholo;
    nr = 900;
    condition = dia_bartholo_pickpocket_condition;
    information = dia_bartholo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bartholo_pickpocket_condition() {
	c_beklauen(baseThfChanceEBR, 40);
};

func void dia_bartholo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bartholo_pickpocket);
	info_addchoice(dia_bartholo_pickpocket, dialog_back, dia_bartholo_pickpocket_back);
	info_addchoice(dia_bartholo_pickpocket, dialog_pickpocket, dia_bartholo_pickpocket_doit);
};

func void dia_bartholo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bartholo_pickpocket);
};

func void dia_bartholo_pickpocket_back() {
    info_clearchoices(dia_bartholo_pickpocket);
};

instance dia_velaya_pickpocket(c_info) {
    npc = ebr_108_velaya;
    nr = 900;
    condition = dia_velaya_pickpocket_condition;
    information = dia_velaya_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_velaya_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_velaya_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_velaya_pickpocket);
	info_addchoice(dia_velaya_pickpocket, dialog_back, dia_velaya_pickpocket_back);
	info_addchoice(dia_velaya_pickpocket, dialog_pickpocket, dia_velaya_pickpocket_doit);
};

func void dia_velaya_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_velaya_pickpocket);
};

func void dia_velaya_pickpocket_back() {
    info_clearchoices(dia_velaya_pickpocket);
};

instance dia_syra_pickpocket(c_info) {
    npc = ebr_109_syra;
    nr = 900;
    condition = dia_syra_pickpocket_condition;
    information = dia_syra_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_syra_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_syra_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_syra_pickpocket);
	info_addchoice(dia_syra_pickpocket, dialog_back, dia_syra_pickpocket_back);
	info_addchoice(dia_syra_pickpocket, dialog_pickpocket, dia_syra_pickpocket_doit);
};

func void dia_syra_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_syra_pickpocket);
};

func void dia_syra_pickpocket_back() {
    info_clearchoices(dia_syra_pickpocket);
};

instance dia_seraphia_pickpocket(c_info) {
    npc = ebr_110_seraphia;
    nr = 900;
    condition = dia_seraphia_pickpocket_condition;
    information = dia_seraphia_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_seraphia_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_seraphia_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_seraphia_pickpocket);
	info_addchoice(dia_seraphia_pickpocket, dialog_back, dia_seraphia_pickpocket_back);
	info_addchoice(dia_seraphia_pickpocket, dialog_pickpocket, dia_seraphia_pickpocket_doit);
};

func void dia_seraphia_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_seraphia_pickpocket);
};

func void dia_seraphia_pickpocket_back() {
    info_clearchoices(dia_seraphia_pickpocket);
};

instance dia_thorus_pickpocket(c_info) {
    npc = grd_200_thorus;
    nr = 900;
    condition = dia_thorus_pickpocket_condition;
    information = dia_thorus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_thorus_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_thorus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_thorus_pickpocket);
	info_addchoice(dia_thorus_pickpocket, dialog_back, dia_thorus_pickpocket_back);
	info_addchoice(dia_thorus_pickpocket, dialog_pickpocket, dia_thorus_pickpocket_doit);
};

func void dia_thorus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_thorus_pickpocket);
};

func void dia_thorus_pickpocket_back() {
    info_clearchoices(dia_thorus_pickpocket);
};

instance dia_jackal_pickpocket(c_info) {
    npc = grd_201_jackal;
    nr = 900;
    condition = dia_jackal_pickpocket_condition;
    information = dia_jackal_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jackal_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_jackal_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jackal_pickpocket);
	info_addchoice(dia_jackal_pickpocket, dialog_back, dia_jackal_pickpocket_back);
	info_addchoice(dia_jackal_pickpocket, dialog_pickpocket, dia_jackal_pickpocket_doit);
};

func void dia_jackal_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jackal_pickpocket);
};

func void dia_jackal_pickpocket_back() {
    info_clearchoices(dia_jackal_pickpocket);
};

instance dia_bullit_pickpocket(c_info) {
    npc = grd_203_bullit;
    nr = 900;
    condition = dia_bullit_pickpocket_condition;
    information = dia_bullit_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bullit_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_bullit_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bullit_pickpocket);
	info_addchoice(dia_bullit_pickpocket, dialog_back, dia_bullit_pickpocket_back);
	info_addchoice(dia_bullit_pickpocket, dialog_pickpocket, dia_bullit_pickpocket_doit);
};

func void dia_bullit_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bullit_pickpocket);
};

func void dia_bullit_pickpocket_back() {
    info_clearchoices(dia_bullit_pickpocket);
};

instance dia_scorpio_pickpocket(c_info) {
    npc = grd_205_scorpio;
    nr = 900;
    condition = dia_scorpio_pickpocket_condition;
    information = dia_scorpio_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scorpio_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_scorpio_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scorpio_pickpocket);
	info_addchoice(dia_scorpio_pickpocket, dialog_back, dia_scorpio_pickpocket_back);
	info_addchoice(dia_scorpio_pickpocket, dialog_pickpocket, dia_scorpio_pickpocket_doit);
};

func void dia_scorpio_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_scorpio_pickpocket);
};

func void dia_scorpio_pickpocket_back() {
    info_clearchoices(dia_scorpio_pickpocket);
};

instance dia_cutter_pickpocket(c_info) {
    npc = grd_208_cutter;
    nr = 900;
    condition = dia_cutter_pickpocket_condition;
    information = dia_cutter_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cutter_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_cutter_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cutter_pickpocket);
	info_addchoice(dia_cutter_pickpocket, dialog_back, dia_cutter_pickpocket_back);
	info_addchoice(dia_cutter_pickpocket, dialog_pickpocket, dia_cutter_pickpocket_doit);
};

func void dia_cutter_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cutter_pickpocket);
};

func void dia_cutter_pickpocket_back() {
    info_clearchoices(dia_cutter_pickpocket);
};

instance dia_scatty_pickpocket(c_info) {
    npc = grd_210_scatty;
    nr = 900;
    condition = dia_scatty_pickpocket_condition;
    information = dia_scatty_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scatty_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 40);
};

func void dia_scatty_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scatty_pickpocket);
	info_addchoice(dia_scatty_pickpocket, dialog_back, dia_scatty_pickpocket_back);
	info_addchoice(dia_scatty_pickpocket, dialog_pickpocket, dia_scatty_pickpocket_doit);
};

func void dia_scatty_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_scatty_pickpocket);
};

func void dia_scatty_pickpocket_back() {
    info_clearchoices(dia_scatty_pickpocket);
};

instance dia_kirgo_pickpocket(c_info) {
    npc = grd_251_kirgo;
    nr = 900;
    condition = dia_kirgo_pickpocket_condition;
    information = dia_kirgo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kirgo_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_kirgo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kirgo_pickpocket);
	info_addchoice(dia_kirgo_pickpocket, dialog_back, dia_kirgo_pickpocket_back);
	info_addchoice(dia_kirgo_pickpocket, dialog_pickpocket, dia_kirgo_pickpocket_doit);
};

func void dia_kirgo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kirgo_pickpocket);
};

func void dia_kirgo_pickpocket_back() {
    info_clearchoices(dia_kirgo_pickpocket);
};

instance dia_kharim_pickpocket(c_info) {
    npc = sld_729_kharim;
    nr = 900;
    condition = dia_kharim_pickpocket_condition;
    information = dia_kharim_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kharim_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_kharim_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kharim_pickpocket);
	info_addchoice(dia_kharim_pickpocket, dialog_back, dia_kharim_pickpocket_back);
	info_addchoice(dia_kharim_pickpocket, dialog_pickpocket, dia_kharim_pickpocket_doit);
};

func void dia_kharim_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kharim_pickpocket);
};

func void dia_kharim_pickpocket_back() {
    info_clearchoices(dia_kharim_pickpocket);
};

instance dia_hanis_pickpocket(c_info) {
    npc = tpl_1422_gorhanis;
    nr = 900;
    condition = dia_hanis_pickpocket_condition;
    information = dia_hanis_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanis_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_hanis_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanis_pickpocket);
	info_addchoice(dia_hanis_pickpocket, dialog_back, dia_hanis_pickpocket_back);
	info_addchoice(dia_hanis_pickpocket, dialog_pickpocket, dia_hanis_pickpocket_doit);
};

func void dia_hanis_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_hanis_pickpocket);
};

func void dia_hanis_pickpocket_back() {
    info_clearchoices(dia_hanis_pickpocket);
};

instance dia_skip_pickpocket(c_info) {
    npc = grd_211_skip;
    nr = 900;
    condition = dia_skip_pickpocket_condition;
    information = dia_skip_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_skip_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_skip_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_skip_pickpocket);
	info_addchoice(dia_skip_pickpocket, dialog_back, dia_skip_pickpocket_back);
	info_addchoice(dia_skip_pickpocket, dialog_pickpocket, dia_skip_pickpocket_doit);
};

func void dia_skip_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_skip_pickpocket);
};

func void dia_skip_pickpocket_back() {
    info_clearchoices(dia_skip_pickpocket);
};

instance dia_grd_212_pickpocket(c_info) {
    npc = grd_212_torwache;
    nr = 900;
    condition = dia_grd_212_pickpocket_condition;
    information = dia_grd_212_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_212_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_212_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_212_pickpocket);
	info_addchoice(dia_grd_212_pickpocket, dialog_back, dia_grd_212_pickpocket_back);
	info_addchoice(dia_grd_212_pickpocket, dialog_pickpocket, dia_grd_212_pickpocket_doit);
};

func void dia_grd_212_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_212_pickpocket);
};

func void dia_grd_212_pickpocket_back() {
    info_clearchoices(dia_grd_212_pickpocket);
};

instance dia_grd_213_pickpocket(c_info) {
    npc = grd_213_torwache;
    nr = 900;
    condition = dia_grd_213_pickpocket_condition;
    information = dia_grd_213_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_213_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_213_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_213_pickpocket);
	info_addchoice(dia_grd_213_pickpocket, dialog_back, dia_grd_213_pickpocket_back);
	info_addchoice(dia_grd_213_pickpocket, dialog_pickpocket, dia_grd_213_pickpocket_doit);
};

func void dia_grd_213_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_213_pickpocket);
};

func void dia_grd_213_pickpocket_back() {
    info_clearchoices(dia_grd_213_pickpocket);
};

instance dia_grd_214_pickpocket(c_info) {
    npc = grd_214_torwache;
    nr = 900;
    condition = dia_grd_214_pickpocket_condition;
    information = dia_grd_214_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_214_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_214_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_214_pickpocket);
	info_addchoice(dia_grd_214_pickpocket, dialog_back, dia_grd_214_pickpocket_back);
	info_addchoice(dia_grd_214_pickpocket, dialog_pickpocket, dia_grd_214_pickpocket_doit);
};

func void dia_grd_214_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_214_pickpocket);
};

func void dia_grd_214_pickpocket_back() {
    info_clearchoices(dia_grd_214_pickpocket);
};

instance dia_grd_215_pickpocket(c_info) {
    npc = grd_215_torwache;
    nr = 900;
    condition = dia_grd_215_pickpocket_condition;
    information = dia_grd_215_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_215_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_215_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_215_pickpocket);
	info_addchoice(dia_grd_215_pickpocket, dialog_back, dia_grd_215_pickpocket_back);
	info_addchoice(dia_grd_215_pickpocket, dialog_pickpocket, dia_grd_215_pickpocket_doit);
};

func void dia_grd_215_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_215_pickpocket);
};

func void dia_grd_215_pickpocket_back() {
    info_clearchoices(dia_grd_215_pickpocket);
};

instance dia_grd_216_pickpocket(c_info) {
    npc = grd_216_torwache;
    nr = 900;
    condition = dia_grd_216_pickpocket_condition;
    information = dia_grd_216_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_216_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_216_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_216_pickpocket);
	info_addchoice(dia_grd_216_pickpocket, dialog_back, dia_grd_216_pickpocket_back);
	info_addchoice(dia_grd_216_pickpocket, dialog_pickpocket, dia_grd_216_pickpocket_doit);
};

func void dia_grd_216_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_216_pickpocket);
};

func void dia_grd_216_pickpocket_back() {
    info_clearchoices(dia_grd_216_pickpocket);
};

instance dia_grd_217_pickpocket(c_info) {
    npc = grd_217_torwache;
    nr = 900;
    condition = dia_grd_217_pickpocket_condition;
    information = dia_grd_217_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_217_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_217_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_217_pickpocket);
	info_addchoice(dia_grd_217_pickpocket, dialog_back, dia_grd_217_pickpocket_back);
	info_addchoice(dia_grd_217_pickpocket, dialog_pickpocket, dia_grd_217_pickpocket_doit);
};

func void dia_grd_217_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_217_pickpocket);
};

func void dia_grd_217_pickpocket_back() {
    info_clearchoices(dia_grd_217_pickpocket);
};

instance dia_grd_218_pickpocket(c_info) {
    npc = grd_218_gardist;
    nr = 900;
    condition = dia_grd_218_pickpocket_condition;
    information = dia_grd_218_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_218_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_218_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_218_pickpocket);
	info_addchoice(dia_grd_218_pickpocket, dialog_back, dia_grd_218_pickpocket_back);
	info_addchoice(dia_grd_218_pickpocket, dialog_pickpocket, dia_grd_218_pickpocket_doit);
};

func void dia_grd_218_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_218_pickpocket);
};

func void dia_grd_218_pickpocket_back() {
    info_clearchoices(dia_grd_218_pickpocket);
};

instance dia_grd_219_stone_pickpocket(c_info) {
    npc = grd_219_stone;
    nr = 900;
    condition = dia_grd_219_stone_pickpocket_condition;
    information = dia_grd_219_stone_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_219_stone_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_219_stone_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_219_stone_pickpocket);
	info_addchoice(dia_grd_219_stone_pickpocket, dialog_back, dia_grd_219_stone_pickpocket_back);
	info_addchoice(dia_grd_219_stone_pickpocket, dialog_pickpocket, dia_grd_219_stone_pickpocket_doit);
};

func void dia_grd_219_stone_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_219_stone_pickpocket);
};

func void dia_grd_219_stone_pickpocket_back() {
    info_clearchoices(dia_grd_219_stone_pickpocket);
};

instance dia_pacho_pickpocket(c_info) {
    npc = grd_224_pacho;
    nr = 900;
    condition = dia_pacho_pickpocket_condition;
    information = dia_pacho_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pacho_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 25);
};

func void dia_pacho_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pacho_pickpocket);
	info_addchoice(dia_pacho_pickpocket, dialog_back, dia_pacho_pickpocket_back);
	info_addchoice(dia_pacho_pickpocket, dialog_pickpocket, dia_pacho_pickpocket_doit);
};

func void dia_pacho_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pacho_pickpocket);
};

func void dia_pacho_pickpocket_back() {
    info_clearchoices(dia_pacho_pickpocket);
};

instance dia_grd_232_pickpocket(c_info) {
    npc = grd_232_gardist;
    nr = 900;
    condition = dia_grd_232_pickpocket_condition;
    information = dia_grd_232_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_232_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_232_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_232_pickpocket);
	info_addchoice(dia_grd_232_pickpocket, dialog_back, dia_grd_232_pickpocket_back);
	info_addchoice(dia_grd_232_pickpocket, dialog_pickpocket, dia_grd_232_pickpocket_doit);
};

func void dia_grd_232_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_232_pickpocket);
};

func void dia_grd_232_pickpocket_back() {
    info_clearchoices(dia_grd_232_pickpocket);
};

instance dia_bloodwyn_pickpocket(c_info) {
    npc = grd_233_bloodwyn;
    nr = 900;
    condition = dia_bloodwyn_pickpocket_condition;
    information = dia_bloodwyn_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bloodwyn_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_bloodwyn_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bloodwyn_pickpocket);
	info_addchoice(dia_bloodwyn_pickpocket, dialog_back, dia_bloodwyn_pickpocket_back);
	info_addchoice(dia_bloodwyn_pickpocket, dialog_pickpocket, dia_bloodwyn_pickpocket_doit);
};

func void dia_bloodwyn_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bloodwyn_pickpocket);
};

func void dia_bloodwyn_pickpocket_back() {
    info_clearchoices(dia_bloodwyn_pickpocket);
};

instance dia_grd_245_pickpocket(c_info) {
    npc = grd_245_gardist;
    nr = 900;
    condition = dia_grd_245_pickpocket_condition;
    information = dia_grd_245_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_245_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_245_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_245_pickpocket);
	info_addchoice(dia_grd_245_pickpocket, dialog_back, dia_grd_245_pickpocket_back);
	info_addchoice(dia_grd_245_pickpocket, dialog_pickpocket, dia_grd_245_pickpocket_doit);
};

func void dia_grd_245_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_245_pickpocket);
};

func void dia_grd_245_pickpocket_back() {
    info_clearchoices(dia_grd_245_pickpocket);
};

instance dia_orry_pickpocket(c_info) {
    npc = grd_254_orry;
    nr = 900;
    condition = dia_orry_pickpocket_condition;
    information = dia_orry_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_orry_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_orry_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_orry_pickpocket);
	info_addchoice(dia_orry_pickpocket, dialog_back, dia_orry_pickpocket_back);
	info_addchoice(dia_orry_pickpocket, dialog_pickpocket, dia_orry_pickpocket_doit);
};

func void dia_orry_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_orry_pickpocket);
};

func void dia_orry_pickpocket_back() {
    info_clearchoices(dia_orry_pickpocket);
};

instance dia_fletcher_pickpocket(c_info) {
    npc = grd_255_fletcher;
    nr = 900;
    condition = dia_fletcher_pickpocket_condition;
    information = dia_fletcher_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fletcher_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_fletcher_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fletcher_pickpocket);
	info_addchoice(dia_fletcher_pickpocket, dialog_back, dia_fletcher_pickpocket_back);
	info_addchoice(dia_fletcher_pickpocket, dialog_pickpocket, dia_fletcher_pickpocket_doit);
};

func void dia_fletcher_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fletcher_pickpocket);
};

func void dia_fletcher_pickpocket_back() {
    info_clearchoices(dia_fletcher_pickpocket);
};

instance dia_drake_pickpocket(c_info) {
    npc = grd_260_drake;
    nr = 900;
    condition = dia_drake_pickpocket_condition;
    information = dia_drake_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_drake_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_drake_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_drake_pickpocket);
	info_addchoice(dia_drake_pickpocket, dialog_back, dia_drake_pickpocket_back);
	info_addchoice(dia_drake_pickpocket, dialog_pickpocket, dia_drake_pickpocket_doit);
};

func void dia_drake_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_drake_pickpocket);
};

func void dia_drake_pickpocket_back() {
    info_clearchoices(dia_drake_pickpocket);
};

instance dia_brandick_pickpocket(c_info) {
    npc = grd_261_brandick;
    nr = 900;
    condition = dia_brandick_pickpocket_condition;
    information = dia_brandick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brandick_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_brandick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brandick_pickpocket);
	info_addchoice(dia_brandick_pickpocket, dialog_back, dia_brandick_pickpocket_back);
	info_addchoice(dia_brandick_pickpocket, dialog_pickpocket, dia_brandick_pickpocket_doit);
};

func void dia_brandick_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_brandick_pickpocket);
};

func void dia_brandick_pickpocket_back() {
    info_clearchoices(dia_brandick_pickpocket);
};

instance dia_aaron_pickpocket(c_info) {
    npc = grd_262_aaron;
    nr = 900;
    condition = dia_aaron_pickpocket_condition;
    information = dia_aaron_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_aaron_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_aaron_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_aaron_pickpocket);
	info_addchoice(dia_aaron_pickpocket, dialog_back, dia_aaron_pickpocket_back);
	info_addchoice(dia_aaron_pickpocket, dialog_pickpocket, dia_aaron_pickpocket_doit);
};

func void dia_aaron_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_aaron_pickpocket);
};

func void dia_aaron_pickpocket_back() {
    info_clearchoices(dia_aaron_pickpocket);
};

instance dia_asghan_pickpocket(c_info) {
    npc = grd_263_asghan;
    nr = 900;
    condition = dia_asghan_pickpocket_condition;
    information = dia_asghan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_asghan_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_asghan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_asghan_pickpocket);
	info_addchoice(dia_asghan_pickpocket, dialog_back, dia_asghan_pickpocket_back);
	info_addchoice(dia_asghan_pickpocket, dialog_pickpocket, dia_asghan_pickpocket_doit);
};

func void dia_asghan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_asghan_pickpocket);
};

func void dia_asghan_pickpocket_back() {
    info_clearchoices(dia_asghan_pickpocket);
};

instance dia_ulbert_pickpocket(c_info) {
    npc = grd_271_ulbert;
    nr = 900;
    condition = dia_ulbert_pickpocket_condition;
    information = dia_ulbert_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ulbert_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_ulbert_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ulbert_pickpocket);
	info_addchoice(dia_ulbert_pickpocket, dialog_back, dia_ulbert_pickpocket_back);
	info_addchoice(dia_ulbert_pickpocket, dialog_pickpocket, dia_ulbert_pickpocket_doit);
};

func void dia_ulbert_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ulbert_pickpocket);
};

func void dia_ulbert_pickpocket_back() {
    info_clearchoices(dia_ulbert_pickpocket);
};

instance dia_grd_275_pickpocket(c_info) {
    npc = grd_275_brueckenwache;
    nr = 900;
    condition = dia_grd_275_pickpocket_condition;
    information = dia_grd_275_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_275_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_275_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_275_pickpocket);
	info_addchoice(dia_grd_275_pickpocket, dialog_back, dia_grd_275_pickpocket_back);
	info_addchoice(dia_grd_275_pickpocket, dialog_pickpocket, dia_grd_275_pickpocket_doit);
};

func void dia_grd_275_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_275_pickpocket);
};

func void dia_grd_275_pickpocket_back() {
    info_clearchoices(dia_grd_275_pickpocket);
};

instance dia_grd_276_pickpocket(c_info) {
    npc = grd_276_brueckenwache;
    nr = 900;
    condition = dia_grd_276_pickpocket_condition;
    information = dia_grd_276_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_276_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_276_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_276_pickpocket);
	info_addchoice(dia_grd_276_pickpocket, dialog_back, dia_grd_276_pickpocket_back);
	info_addchoice(dia_grd_276_pickpocket, dialog_pickpocket, dia_grd_276_pickpocket_doit);
};

func void dia_grd_276_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_276_pickpocket);
};

func void dia_grd_276_pickpocket_back() {
    info_clearchoices(dia_grd_276_pickpocket);
};

instance dia_grd_278_pickpocket(c_info) {
    npc = grd_278_gardist;
    nr = 900;
    condition = dia_grd_278_pickpocket_condition;
    information = dia_grd_278_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_278_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_278_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_278_pickpocket);
	info_addchoice(dia_grd_278_pickpocket, dialog_back, dia_grd_278_pickpocket_back);
	info_addchoice(dia_grd_278_pickpocket, dialog_pickpocket, dia_grd_278_pickpocket_doit);
};

func void dia_grd_278_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_278_pickpocket);
};

func void dia_grd_278_pickpocket_back() {
    info_clearchoices(dia_grd_278_pickpocket);
};

instance dia_grd_281_pickpocket(c_info) {
    npc = grd_281_gardist;
    nr = 900;
    condition = dia_grd_281_pickpocket_condition;
    information = dia_grd_281_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_281_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_281_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_281_pickpocket);
	info_addchoice(dia_grd_281_pickpocket, dialog_back, dia_grd_281_pickpocket_back);
	info_addchoice(dia_grd_281_pickpocket, dialog_pickpocket, dia_grd_281_pickpocket_doit);
};

func void dia_grd_281_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_281_pickpocket);
};

func void dia_grd_281_pickpocket_back() {
    info_clearchoices(dia_grd_281_pickpocket);
};

instance dia_cesar_pickpocket(c_info) {
    npc = grd_40011_cesar;
    nr = 900;
    condition = dia_cesar_pickpocket_condition;
    information = dia_cesar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cesar_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_cesar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cesar_pickpocket);
	info_addchoice(dia_cesar_pickpocket, dialog_back, dia_cesar_pickpocket_back);
	info_addchoice(dia_cesar_pickpocket, dialog_pickpocket, dia_cesar_pickpocket_doit);
};

func void dia_cesar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cesar_pickpocket);
};

func void dia_cesar_pickpocket_back() {
    info_clearchoices(dia_cesar_pickpocket);
};

instance dia_fergus_pickpocket(c_info) {
    npc = grd_40054_fergus;
    nr = 900;
    condition = dia_fergus_pickpocket_condition;
    information = dia_fergus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fergus_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_fergus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fergus_pickpocket);
	info_addchoice(dia_fergus_pickpocket, dialog_back, dia_fergus_pickpocket_back);
	info_addchoice(dia_fergus_pickpocket, dialog_pickpocket, dia_fergus_pickpocket_doit);
};

func void dia_fergus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fergus_pickpocket);
};

func void dia_fergus_pickpocket_back() {
    info_clearchoices(dia_fergus_pickpocket);
};

instance dia_winston_pickpocket(c_info) {
    npc = grd_40056_winston;
    nr = 900;
    condition = dia_winston_pickpocket_condition;
    information = dia_winston_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_winston_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_winston_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_winston_pickpocket);
	info_addchoice(dia_winston_pickpocket, dialog_back, dia_winston_pickpocket_back);
	info_addchoice(dia_winston_pickpocket, dialog_pickpocket, dia_winston_pickpocket_doit);
};

func void dia_winston_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_winston_pickpocket);
};

func void dia_winston_pickpocket_back() {
    info_clearchoices(dia_winston_pickpocket);
};

instance dia_john_pickpocket(c_info) {
    npc = grd_40062_john;
    nr = 900;
    condition = dia_john_pickpocket_condition;
    information = dia_john_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_john_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_john_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_john_pickpocket);
	info_addchoice(dia_john_pickpocket, dialog_back, dia_john_pickpocket_back);
	info_addchoice(dia_john_pickpocket, dialog_pickpocket, dia_john_pickpocket_doit);
};

func void dia_john_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_john_pickpocket);
};

func void dia_john_pickpocket_back() {
    info_clearchoices(dia_john_pickpocket);
};

instance dia_grd_40093_pickpocket(c_info) {
    npc = grd_40093_gardist;
    nr = 900;
    condition = dia_grd_40093_pickpocket_condition;
    information = dia_grd_40093_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_40093_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_40093_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_40093_pickpocket);
	info_addchoice(dia_grd_40093_pickpocket, dialog_back, dia_grd_40093_pickpocket_back);
	info_addchoice(dia_grd_40093_pickpocket, dialog_pickpocket, dia_grd_40093_pickpocket_doit);
};

func void dia_grd_40093_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_40093_pickpocket);
};

func void dia_grd_40093_pickpocket_back() {
    info_clearchoices(dia_grd_40093_pickpocket);
};

instance dia_norton_pickpocket(c_info) {
    npc = grd_40107_norton;
    nr = 900;
    condition = dia_norton_pickpocket_condition;
    information = dia_norton_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_norton_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_norton_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_norton_pickpocket);
	info_addchoice(dia_norton_pickpocket, dialog_back, dia_norton_pickpocket_back);
	info_addchoice(dia_norton_pickpocket, dialog_pickpocket, dia_norton_pickpocket_doit);
};

func void dia_norton_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_norton_pickpocket);
};

func void dia_norton_pickpocket_back() {
    info_clearchoices(dia_norton_pickpocket);
};

instance dia_nieznajomy_pickpocket(c_info) {
    npc = grd_40150_nieznajomy;
    nr = 900;
    condition = dia_nieznajomy_pickpocket_condition;
    information = dia_nieznajomy_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nieznajomy_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_nieznajomy_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nieznajomy_pickpocket);
	info_addchoice(dia_nieznajomy_pickpocket, dialog_back, dia_nieznajomy_pickpocket_back);
	info_addchoice(dia_nieznajomy_pickpocket, dialog_pickpocket, dia_nieznajomy_pickpocket_doit);
};

func void dia_nieznajomy_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nieznajomy_pickpocket);
};

func void dia_nieznajomy_pickpocket_back() {
    info_clearchoices(dia_nieznajomy_pickpocket);
};

instance dia_kwatermistrz_pickpocket(c_info) {
    npc = grd_5099_kwatermistrz;
    nr = 900;
    condition = dia_kwatermistrz_pickpocket_condition;
    information = dia_kwatermistrz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kwatermistrz_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_kwatermistrz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kwatermistrz_pickpocket);
	info_addchoice(dia_kwatermistrz_pickpocket, dialog_back, dia_kwatermistrz_pickpocket_back);
	info_addchoice(dia_kwatermistrz_pickpocket, dialog_pickpocket, dia_kwatermistrz_pickpocket_doit);
};

func void dia_kwatermistrz_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kwatermistrz_pickpocket);
};

func void dia_kwatermistrz_pickpocket_back() {
    info_clearchoices(dia_kwatermistrz_pickpocket);
};

instance dia_morok_pickpocket(c_info) {
    npc = grd_7894_morok;
    nr = 900;
    condition = dia_morok_pickpocket_condition;
    information = dia_morok_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_morok_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_morok_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_morok_pickpocket);
	info_addchoice(dia_morok_pickpocket, dialog_back, dia_morok_pickpocket_back);
	info_addchoice(dia_morok_pickpocket, dialog_pickpocket, dia_morok_pickpocket_doit);
};

func void dia_morok_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_morok_pickpocket);
};

func void dia_morok_pickpocket_back() {
    info_clearchoices(dia_morok_pickpocket);
};

instance dia_patter_pickpocket(c_info) {
    npc = grd_7895_patter;
    nr = 900;
    condition = dia_patter_pickpocket_condition;
    information = dia_patter_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_patter_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_patter_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_patter_pickpocket);
	info_addchoice(dia_patter_pickpocket, dialog_back, dia_patter_pickpocket_back);
	info_addchoice(dia_patter_pickpocket, dialog_pickpocket, dia_patter_pickpocket_doit);
};

func void dia_patter_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_patter_pickpocket);
};

func void dia_patter_pickpocket_back() {
    info_clearchoices(dia_patter_pickpocket);
};

instance dia_yberion_pickpocket(c_info) {
    npc = gur_1200_yberion;
    nr = 900;
    condition = dia_yberion_pickpocket_condition;
    information = dia_yberion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_yberion_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR - 5, 50);
};

func void dia_yberion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_yberion_pickpocket);
	info_addchoice(dia_yberion_pickpocket, dialog_back, dia_yberion_pickpocket_back);
	info_addchoice(dia_yberion_pickpocket, dialog_pickpocket, dia_yberion_pickpocket_doit);
};

func void dia_yberion_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_yberion_pickpocket);
};

func void dia_yberion_pickpocket_back() {
    info_clearchoices(dia_yberion_pickpocket);
};

instance dia_corkalom_pickpocket(c_info) {
    npc = gur_1201_corkalom;
    nr = 900;
    condition = dia_corkalom_pickpocket_condition;
    information = dia_corkalom_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_corkalom_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 40);
};

func void dia_corkalom_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_corkalom_pickpocket);
	info_addchoice(dia_corkalom_pickpocket, dialog_back, dia_corkalom_pickpocket_back);
	info_addchoice(dia_corkalom_pickpocket, dialog_pickpocket, dia_corkalom_pickpocket_doit);
};

func void dia_corkalom_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_corkalom_pickpocket);
};

func void dia_corkalom_pickpocket_back() {
    info_clearchoices(dia_corkalom_pickpocket);
};

instance dia_corangar_pickpocket(c_info) {
    npc = gur_1202_corangar;
    nr = 900;
    condition = dia_corangar_pickpocket_condition;
    information = dia_corangar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_corangar_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_corangar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_corangar_pickpocket);
	info_addchoice(dia_corangar_pickpocket, dialog_back, dia_corangar_pickpocket_back);
	info_addchoice(dia_corangar_pickpocket, dialog_pickpocket, dia_corangar_pickpocket_doit);
};

func void dia_corangar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_corangar_pickpocket);
};

func void dia_corangar_pickpocket_back() {
    info_clearchoices(dia_corangar_pickpocket);
};

instance dia_baaltondral_pickpocket(c_info) {
    npc = gur_1203_baaltondral;
    nr = 900;
    condition = dia_baaltondral_pickpocket_condition;
    information = dia_baaltondral_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baaltondral_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_baaltondral_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baaltondral_pickpocket);
	info_addchoice(dia_baaltondral_pickpocket, dialog_back, dia_baaltondral_pickpocket_back);
	info_addchoice(dia_baaltondral_pickpocket, dialog_pickpocket, dia_baaltondral_pickpocket_doit);
};

func void dia_baaltondral_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baaltondral_pickpocket);
};

func void dia_baaltondral_pickpocket_back() {
    info_clearchoices(dia_baaltondral_pickpocket);
};

instance dia_baalnamib_pickpocket(c_info) {
    npc = gur_1204_baalnamib;
    nr = 900;
    condition = dia_baalnamib_pickpocket_condition;
    information = dia_baalnamib_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalnamib_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_baalnamib_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalnamib_pickpocket);
	info_addchoice(dia_baalnamib_pickpocket, dialog_back, dia_baalnamib_pickpocket_back);
	info_addchoice(dia_baalnamib_pickpocket, dialog_pickpocket, dia_baalnamib_pickpocket_doit);
};

func void dia_baalnamib_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalnamib_pickpocket);
};

func void dia_baalnamib_pickpocket_back() {
    info_clearchoices(dia_baalnamib_pickpocket);
};

instance dia_chani_pickpocket(c_info) {
    npc = gur_1205_chani;
    nr = 900;
    condition = dia_chani_pickpocket_condition;
    information = dia_chani_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_chani_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_chani_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_chani_pickpocket);
	info_addchoice(dia_chani_pickpocket, dialog_back, dia_chani_pickpocket_back);
	info_addchoice(dia_chani_pickpocket, dialog_pickpocket, dia_chani_pickpocket_doit);
};

func void dia_chani_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_chani_pickpocket);
};

func void dia_chani_pickpocket_back() {
    info_clearchoices(dia_chani_pickpocket);
};

instance dia_natalia_pickpocket(c_info) {
    npc = gur_1207_natalia;
    nr = 900;
    condition = dia_natalia_pickpocket_condition;
    information = dia_natalia_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_natalia_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_natalia_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_natalia_pickpocket);
	info_addchoice(dia_natalia_pickpocket, dialog_back, dia_natalia_pickpocket_back);
	info_addchoice(dia_natalia_pickpocket, dialog_pickpocket, dia_natalia_pickpocket_doit);
};

func void dia_natalia_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_natalia_pickpocket);
};

func void dia_natalia_pickpocket_back() {
    info_clearchoices(dia_natalia_pickpocket);
};

instance dia_baalcadar_pickpocket(c_info) {
    npc = gur_1208_baalcadar;
    nr = 900;
    condition = dia_baalcadar_pickpocket_condition;
    information = dia_baalcadar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalcadar_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_baalcadar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalcadar_pickpocket);
	info_addchoice(dia_baalcadar_pickpocket, dialog_back, dia_baalcadar_pickpocket_back);
	info_addchoice(dia_baalcadar_pickpocket, dialog_pickpocket, dia_baalcadar_pickpocket_doit);
};

func void dia_baalcadar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalcadar_pickpocket);
};

func void dia_baalcadar_pickpocket_back() {
    info_clearchoices(dia_baalcadar_pickpocket);
};

instance dia_baalorun_pickpocket(c_info) {
    npc = gur_1209_baalorun;
    nr = 900;
    condition = dia_baalorun_pickpocket_condition;
    information = dia_baalorun_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalorun_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_baalorun_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalorun_pickpocket);
	info_addchoice(dia_baalorun_pickpocket, dialog_back, dia_baalorun_pickpocket_back);
	info_addchoice(dia_baalorun_pickpocket, dialog_pickpocket, dia_baalorun_pickpocket_doit);
};

func void dia_baalorun_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalorun_pickpocket);
};

func void dia_baalorun_pickpocket_back() {
    info_clearchoices(dia_baalorun_pickpocket);
};

instance dia_baaltyon_pickpocket(c_info) {
    npc = gur_1210_baaltyon;
    nr = 900;
    condition = dia_baaltyon_pickpocket_condition;
    information = dia_baaltyon_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baaltyon_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 35);
};

func void dia_baaltyon_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baaltyon_pickpocket);
	info_addchoice(dia_baaltyon_pickpocket, dialog_back, dia_baaltyon_pickpocket_back);
	info_addchoice(dia_baaltyon_pickpocket, dialog_pickpocket, dia_baaltyon_pickpocket_doit);
};

func void dia_baaltyon_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baaltyon_pickpocket);
};

func void dia_baaltyon_pickpocket_back() {
    info_clearchoices(dia_baaltyon_pickpocket);
};

instance dia_ie_397_announcer_pickpocket(c_info) {
    npc = ie_397_announcer;
    nr = 900;
    condition = dia_ie_397_announcer_pickpocket_condition;
    information = dia_ie_397_announcer_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ie_397_announcer_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 15);
};

func void dia_ie_397_announcer_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ie_397_announcer_pickpocket);
	info_addchoice(dia_ie_397_announcer_pickpocket, dialog_back, dia_ie_397_announcer_pickpocket_back);
	info_addchoice(dia_ie_397_announcer_pickpocket, dialog_pickpocket, dia_ie_397_announcer_pickpocket_doit);
};

func void dia_ie_397_announcer_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ie_397_announcer_pickpocket);
};

func void dia_ie_397_announcer_pickpocket_back() {
    info_clearchoices(dia_ie_397_announcer_pickpocket);
};

instance dia_rodriguez_pickpocket(c_info) {
    npc = kdf_400_rodriguez;
    nr = 900;
    condition = dia_rodriguez_pickpocket_condition;
    information = dia_rodriguez_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rodriguez_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF, 40);
};

func void dia_rodriguez_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rodriguez_pickpocket);
	info_addchoice(dia_rodriguez_pickpocket, dialog_back, dia_rodriguez_pickpocket_back);
	info_addchoice(dia_rodriguez_pickpocket, dialog_pickpocket, dia_rodriguez_pickpocket_doit);
};

func void dia_rodriguez_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rodriguez_pickpocket);
};

func void dia_rodriguez_pickpocket_back() {
    info_clearchoices(dia_rodriguez_pickpocket);
};

instance dia_damarok_pickpocket(c_info) {
    npc = kdf_401_damarok;
    nr = 900;
    condition = dia_damarok_pickpocket_condition;
    information = dia_damarok_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_damarok_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF, 40);
};

func void dia_damarok_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_damarok_pickpocket);
	info_addchoice(dia_damarok_pickpocket, dialog_back, dia_damarok_pickpocket_back);
	info_addchoice(dia_damarok_pickpocket, dialog_pickpocket, dia_damarok_pickpocket_doit);
};

func void dia_damarok_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_damarok_pickpocket);
};

func void dia_damarok_pickpocket_back() {
    info_clearchoices(dia_damarok_pickpocket);
};

instance dia_corristo_pickpocket(c_info) {
    npc = kdf_402_corristo;
    nr = 900;
    condition = dia_corristo_pickpocket_condition;
    information = dia_corristo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_corristo_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF - 5, 50);
};

func void dia_corristo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_corristo_pickpocket);
	info_addchoice(dia_corristo_pickpocket, dialog_back, dia_corristo_pickpocket_back);
	info_addchoice(dia_corristo_pickpocket, dialog_pickpocket, dia_corristo_pickpocket_doit);
};

func void dia_corristo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_corristo_pickpocket);
};

func void dia_corristo_pickpocket_back() {
    info_clearchoices(dia_corristo_pickpocket);
};

instance dia_drago_pickpocket(c_info) {
    npc = kdf_403_drago;
    nr = 900;
    condition = dia_drago_pickpocket_condition;
    information = dia_drago_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_drago_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF, 35);
};

func void dia_drago_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_drago_pickpocket);
	info_addchoice(dia_drago_pickpocket, dialog_back, dia_drago_pickpocket_back);
	info_addchoice(dia_drago_pickpocket, dialog_pickpocket, dia_drago_pickpocket_doit);
};

func void dia_drago_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_drago_pickpocket);
};

func void dia_drago_pickpocket_back() {
    info_clearchoices(dia_drago_pickpocket);
};

instance dia_xardas_pickpocket(c_info) {
    npc = kdf_404_xardas;
    nr = 900;
    condition = dia_xardas_pickpocket_condition;
    information = dia_xardas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_xardas_pickpocket_condition() {
	c_beklauen(baseThfChanceDMB - 3, 100);
};

func void dia_xardas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_xardas_pickpocket);
	info_addchoice(dia_xardas_pickpocket, dialog_back, dia_xardas_pickpocket_back);
	info_addchoice(dia_xardas_pickpocket, dialog_pickpocket, dia_xardas_pickpocket_doit);
};

func void dia_xardas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_xardas_pickpocket);
};

func void dia_xardas_pickpocket_back() {
    info_clearchoices(dia_xardas_pickpocket);
};

instance dia_torrez_pickpocket(c_info) {
    npc = kdf_405_torrez;
    nr = 900;
    condition = dia_torrez_pickpocket_condition;
    information = dia_torrez_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_torrez_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF, 40);
};

func void dia_torrez_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_torrez_pickpocket);
	info_addchoice(dia_torrez_pickpocket, dialog_back, dia_torrez_pickpocket_back);
	info_addchoice(dia_torrez_pickpocket, dialog_pickpocket, dia_torrez_pickpocket_doit);
};

func void dia_torrez_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_torrez_pickpocket);
};

func void dia_torrez_pickpocket_back() {
    info_clearchoices(dia_torrez_pickpocket);
};

instance dia_saturas_pickpocket(c_info) {
    npc = kdw_600_saturas;
    nr = 900;
    condition = dia_saturas_pickpocket_condition;
    information = dia_saturas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_saturas_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW - 5, 150);
};

func void dia_saturas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_saturas_pickpocket);
	info_addchoice(dia_saturas_pickpocket, dialog_back, dia_saturas_pickpocket_back);
	info_addchoice(dia_saturas_pickpocket, dialog_pickpocket, dia_saturas_pickpocket_doit);
};

func void dia_saturas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_saturas_pickpocket);
};

func void dia_saturas_pickpocket_back() {
    info_clearchoices(dia_saturas_pickpocket);
};

instance dia_myxir_pickpocket(c_info) {
    npc = kdw_601_myxir;
    nr = 900;
    condition = dia_myxir_pickpocket_condition;
    information = dia_myxir_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_myxir_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW, 50);
};

func void dia_myxir_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_myxir_pickpocket);
	info_addchoice(dia_myxir_pickpocket, dialog_back, dia_myxir_pickpocket_back);
	info_addchoice(dia_myxir_pickpocket, dialog_pickpocket, dia_myxir_pickpocket_doit);
};

func void dia_myxir_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_myxir_pickpocket);
};

func void dia_myxir_pickpocket_back() {
    info_clearchoices(dia_myxir_pickpocket);
};

instance dia_nefarius_pickpocket(c_info) {
    npc = kdw_603_nefarius;
    nr = 900;
    condition = dia_nefarius_pickpocket_condition;
    information = dia_nefarius_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nefarius_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW, 40);
};

func void dia_nefarius_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nefarius_pickpocket);
	info_addchoice(dia_nefarius_pickpocket, dialog_back, dia_nefarius_pickpocket_back);
	info_addchoice(dia_nefarius_pickpocket, dialog_pickpocket, dia_nefarius_pickpocket_doit);
};

func void dia_nefarius_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nefarius_pickpocket);
};

func void dia_nefarius_pickpocket_back() {
    info_clearchoices(dia_nefarius_pickpocket);
};

instance dia_cronos_pickpocket(c_info) {
    npc = kdw_604_cronos;
    nr = 900;
    condition = dia_cronos_pickpocket_condition;
    information = dia_cronos_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cronos_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW, 50);
};

func void dia_cronos_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cronos_pickpocket);
	info_addchoice(dia_cronos_pickpocket, dialog_back, dia_cronos_pickpocket_back);
	info_addchoice(dia_cronos_pickpocket, dialog_pickpocket, dia_cronos_pickpocket_doit);
};

func void dia_cronos_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cronos_pickpocket);
};

func void dia_cronos_pickpocket_back() {
    info_clearchoices(dia_cronos_pickpocket);
};

instance dia_riordian_pickpocket(c_info) {
    npc = kdw_605_riordian;
    nr = 900;
    condition = dia_riordian_pickpocket_condition;
    information = dia_riordian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_riordian_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW, 40);
};

func void dia_riordian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_riordian_pickpocket);
	info_addchoice(dia_riordian_pickpocket, dialog_back, dia_riordian_pickpocket_back);
	info_addchoice(dia_riordian_pickpocket, dialog_pickpocket, dia_riordian_pickpocket_doit);
};

func void dia_riordian_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_riordian_pickpocket);
};

func void dia_riordian_pickpocket_back() {
    info_clearchoices(dia_riordian_pickpocket);
};

instance dia_merdarion_pickpocket(c_info) {
    npc = kdw_602_merdarion;
    nr = 900;
    condition = dia_merdarion_pickpocket_condition;
    information = dia_merdarion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_merdarion_pickpocket_condition() {
	c_beklauen(baseThfChanceKDW, 55);
};

func void dia_merdarion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_merdarion_pickpocket);
	info_addchoice(dia_merdarion_pickpocket, dialog_back, dia_merdarion_pickpocket_back);
	info_addchoice(dia_merdarion_pickpocket, dialog_pickpocket, dia_merdarion_pickpocket_doit);
};

func void dia_merdarion_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_merdarion_pickpocket);
};

func void dia_merdarion_pickpocket_back() {
    info_clearchoices(dia_merdarion_pickpocket);
};

instance dia_gilbert_pickpocket(c_info) {
    npc = non_1500_gilbert;
    nr = 900;
    condition = dia_gilbert_pickpocket_condition;
    information = dia_gilbert_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gilbert_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 25);
};

func void dia_gilbert_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gilbert_pickpocket);
	info_addchoice(dia_gilbert_pickpocket, dialog_back, dia_gilbert_pickpocket_back);
	info_addchoice(dia_gilbert_pickpocket, dialog_pickpocket, dia_gilbert_pickpocket_doit);
};

func void dia_gilbert_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gilbert_pickpocket);
};

func void dia_gilbert_pickpocket_back() {
    info_clearchoices(dia_gilbert_pickpocket);
};

instance dia_patrick_pickpocket(c_info) {
    npc = non_2056_patrick;
    nr = 900;
    condition = dia_patrick_pickpocket_condition;
    information = dia_patrick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_patrick_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_patrick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_patrick_pickpocket);
	info_addchoice(dia_patrick_pickpocket, dialog_back, dia_patrick_pickpocket_back);
	info_addchoice(dia_patrick_pickpocket, dialog_pickpocket, dia_patrick_pickpocket_doit);
};

func void dia_patrick_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_patrick_pickpocket);
};

func void dia_patrick_pickpocket_back() {
    info_clearchoices(dia_patrick_pickpocket);
};

instance dia_szefu_pickpocket(c_info) {
    npc = non_2702_szefu;
    nr = 900;
    condition = dia_szefu_pickpocket_condition;
    information = dia_szefu_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_szefu_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 25);
};

func void dia_szefu_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_szefu_pickpocket);
	info_addchoice(dia_szefu_pickpocket, dialog_back, dia_szefu_pickpocket_back);
	info_addchoice(dia_szefu_pickpocket, dialog_pickpocket, dia_szefu_pickpocket_doit);
};

func void dia_szefu_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_szefu_pickpocket);
};

func void dia_szefu_pickpocket_back() {
    info_clearchoices(dia_szefu_pickpocket);
};

instance dia_prin_pickpocket(c_info) {
    npc = non_2703_mysliwy;
    nr = 900;
    condition = dia_prin_pickpocket_condition;
    information = dia_prin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_prin_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_prin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_prin_pickpocket);
	info_addchoice(dia_prin_pickpocket, dialog_back, dia_prin_pickpocket_back);
	info_addchoice(dia_prin_pickpocket, dialog_pickpocket, dia_prin_pickpocket_doit);
};

func void dia_prin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_prin_pickpocket);
};

func void dia_prin_pickpocket_back() {
    info_clearchoices(dia_prin_pickpocket);
};

instance dia_rakus_pickpocket(c_info) {
    npc = non_2705_rakus;
    nr = 900;
    condition = dia_rakus_pickpocket_condition;
    information = dia_rakus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rakus_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_rakus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rakus_pickpocket);
	info_addchoice(dia_rakus_pickpocket, dialog_back, dia_rakus_pickpocket_back);
	info_addchoice(dia_rakus_pickpocket, dialog_pickpocket, dia_rakus_pickpocket_doit);
};

func void dia_rakus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rakus_pickpocket);
};

func void dia_rakus_pickpocket_back() {
    info_clearchoices(dia_rakus_pickpocket);
};

instance dia_osko_pickpocket(c_info) {
    npc = non_2706_osko;
    nr = 900;
    condition = dia_osko_pickpocket_condition;
    information = dia_osko_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_osko_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_osko_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_osko_pickpocket);
	info_addchoice(dia_osko_pickpocket, dialog_back, dia_osko_pickpocket_back);
	info_addchoice(dia_osko_pickpocket, dialog_pickpocket, dia_osko_pickpocket_doit);
};

func void dia_osko_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_osko_pickpocket);
};

func void dia_osko_pickpocket_back() {
    info_clearchoices(dia_osko_pickpocket);
};

instance dia_hugo_pickpocket2(c_info) {
    npc = non_3930_hugo;
    nr = 900;
    condition = dia_hugo_pickpocket2_condition;
    information = dia_hugo_pickpocket2_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hugo_pickpocket2_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_hugo_pickpocket2_info() {
	b_steal_message();
	info_clearchoices(dia_hugo_pickpocket2);
	info_addchoice(dia_hugo_pickpocket2, dialog_back, dia_hugo_pickpocket2_back);
	info_addchoice(dia_hugo_pickpocket2, dialog_pickpocket, dia_hugo_pickpocket2_doit);
};

func void dia_hugo_pickpocket2_doit() {
    b_beklauen();
    info_clearchoices(dia_hugo_pickpocket2);
};

func void dia_hugo_pickpocket2_back() {
    info_clearchoices(dia_hugo_pickpocket2);
};

instance dia_przywodca_pickpocket(c_info) {
    npc = non_40004_przywodca;
    nr = 900;
    condition = dia_przywodca_pickpocket_condition;
    information = dia_przywodca_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_przywodca_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_przywodca_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_przywodca_pickpocket);
	info_addchoice(dia_przywodca_pickpocket, dialog_back, dia_przywodca_pickpocket_back);
	info_addchoice(dia_przywodca_pickpocket, dialog_pickpocket, dia_przywodca_pickpocket_doit);
};

func void dia_przywodca_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_przywodca_pickpocket);
};

func void dia_przywodca_pickpocket_back() {
    info_clearchoices(dia_przywodca_pickpocket);
};

instance dia_przywodcas_pickpocket(c_info) {
    npc = non_40006_przywodca;
    nr = 900;
    condition = dia_przywodcas_pickpocket_condition;
    information = dia_przywodcas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_przywodcas_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_przywodcas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_przywodcas_pickpocket);
	info_addchoice(dia_przywodcas_pickpocket, dialog_back, dia_przywodcas_pickpocket_back);
	info_addchoice(dia_przywodcas_pickpocket, dialog_pickpocket, dia_przywodcas_pickpocket_doit);
};

func void dia_przywodcas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_przywodcas_pickpocket);
};

func void dia_przywodcas_pickpocket_back() {
    info_clearchoices(dia_przywodcas_pickpocket);
};

instance dia_kastagir_pickpocket(c_info) {
    npc = non_40009_kastagir;
    nr = 900;
    condition = dia_kastagir_pickpocket_condition;
    information = dia_kastagir_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kastagir_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 35);
};

func void dia_kastagir_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kastagir_pickpocket);
	info_addchoice(dia_kastagir_pickpocket, dialog_back, dia_kastagir_pickpocket_back);
	info_addchoice(dia_kastagir_pickpocket, dialog_pickpocket, dia_kastagir_pickpocket_doit);
};

func void dia_kastagir_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kastagir_pickpocket);
};

func void dia_kastagir_pickpocket_back() {
    info_clearchoices(dia_kastagir_pickpocket);
};

instance dia_non_40027_pickpocket(c_info) {
    npc = non_40027_rabus;
    nr = 900;
    condition = dia_non_40027_pickpocket_condition;
    information = dia_non_40027_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_40027_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_non_40027_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_40027_pickpocket);
	info_addchoice(dia_non_40027_pickpocket, dialog_back, dia_non_40027_pickpocket_back);
	info_addchoice(dia_non_40027_pickpocket, dialog_pickpocket, dia_non_40027_pickpocket_doit);
};

func void dia_non_40027_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_40027_pickpocket);
};

func void dia_non_40027_pickpocket_back() {
    info_clearchoices(dia_non_40027_pickpocket);
};

instance dia_arnold_pickpocket(c_info) {
    npc = non_40034_arnold;
    nr = 900;
    condition = dia_arnold_pickpocket_condition;
    information = dia_arnold_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_arnold_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_arnold_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_arnold_pickpocket);
	info_addchoice(dia_arnold_pickpocket, dialog_back, dia_arnold_pickpocket_back);
	info_addchoice(dia_arnold_pickpocket, dialog_pickpocket, dia_arnold_pickpocket_doit);
};

func void dia_arnold_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_arnold_pickpocket);
};

func void dia_arnold_pickpocket_back() {
    info_clearchoices(dia_arnold_pickpocket);
};

instance dia_killer_pickpocket(c_info) {
    npc = non_40108_killer;
    nr = 900;
    condition = dia_killer_pickpocket_condition;
    information = dia_killer_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_killer_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_killer_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_killer_pickpocket);
	info_addchoice(dia_killer_pickpocket, dialog_back, dia_killer_pickpocket_back);
	info_addchoice(dia_killer_pickpocket, dialog_pickpocket, dia_killer_pickpocket_doit);
};

func void dia_killer_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_killer_pickpocket);
};

func void dia_killer_pickpocket_back() {
    info_clearchoices(dia_killer_pickpocket);
};

instance dia_torbeld_pickpocket(c_info) {
    npc = non_40154_torbeld;
    nr = 900;
    condition = dia_torbeld_pickpocket_condition;
    information = dia_torbeld_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_torbeld_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 35);
};

func void dia_torbeld_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_torbeld_pickpocket);
	info_addchoice(dia_torbeld_pickpocket, dialog_back, dia_torbeld_pickpocket_back);
	info_addchoice(dia_torbeld_pickpocket, dialog_pickpocket, dia_torbeld_pickpocket_doit);
};

func void dia_torbeld_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_torbeld_pickpocket);
};

func void dia_torbeld_pickpocket_back() {
    info_clearchoices(dia_torbeld_pickpocket);
};

instance dia_pirat2_pickpocket(c_info) {
    npc = non_5025_pirat2;
    nr = 900;
    condition = dia_pirat2_pickpocket_condition;
    information = dia_pirat2_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pirat2_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 45);
};

func void dia_pirat2_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pirat2_pickpocket);
	info_addchoice(dia_pirat2_pickpocket, dialog_back, dia_pirat2_pickpocket_back);
	info_addchoice(dia_pirat2_pickpocket, dialog_pickpocket, dia_pirat2_pickpocket_doit);
};

func void dia_pirat2_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pirat2_pickpocket);
};

func void dia_pirat2_pickpocket_back() {
    info_clearchoices(dia_pirat2_pickpocket);
};

instance dia_alex_pickpocket(c_info) {
    npc = non_5600_alex;
    nr = 900;
    condition = dia_alex_pickpocket_condition;
    information = dia_alex_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_alex_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 45);
};

func void dia_alex_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_alex_pickpocket);
	info_addchoice(dia_alex_pickpocket, dialog_back, dia_alex_pickpocket_back);
	info_addchoice(dia_alex_pickpocket, dialog_pickpocket, dia_alex_pickpocket_doit);
};

func void dia_alex_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_alex_pickpocket);
};

func void dia_alex_pickpocket_back() {
    info_clearchoices(dia_alex_pickpocket);
};

instance dia_stanley_pickpocket(c_info) {
    npc = non_5602_stanley;
    nr = 900;
    condition = dia_stanley_pickpocket_condition;
    information = dia_stanley_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stanley_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_stanley_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stanley_pickpocket);
	info_addchoice(dia_stanley_pickpocket, dialog_back, dia_stanley_pickpocket_back);
	info_addchoice(dia_stanley_pickpocket, dialog_pickpocket, dia_stanley_pickpocket_doit);
};

func void dia_stanley_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stanley_pickpocket);
};

func void dia_stanley_pickpocket_back() {
    info_clearchoices(dia_stanley_pickpocket);
};

instance dia_claw_pickpocket(c_info) {
    npc = non_5603_claw;
    nr = 900;
    condition = dia_claw_pickpocket_condition;
    information = dia_claw_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_claw_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_claw_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_claw_pickpocket);
	info_addchoice(dia_claw_pickpocket, dialog_back, dia_claw_pickpocket_back);
	info_addchoice(dia_claw_pickpocket, dialog_pickpocket, dia_claw_pickpocket_doit);
};

func void dia_claw_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_claw_pickpocket);
};

func void dia_claw_pickpocket_back() {
    info_clearchoices(dia_claw_pickpocket);
};

instance dia_olivier_pickpocket(c_info) {
    npc = non_5613_olivier;
    nr = 900;
    condition = dia_olivier_pickpocket_condition;
    information = dia_olivier_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_olivier_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_olivier_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_olivier_pickpocket);
	info_addchoice(dia_olivier_pickpocket, dialog_back, dia_olivier_pickpocket_back);
	info_addchoice(dia_olivier_pickpocket, dialog_pickpocket, dia_olivier_pickpocket_doit);
};

func void dia_olivier_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_olivier_pickpocket);
};

func void dia_olivier_pickpocket_back() {
    info_clearchoices(dia_olivier_pickpocket);
};

instance dia_talas_pickpocket(c_info) {
    npc = nov_1300_talas;
    nr = 900;
    condition = dia_talas_pickpocket_condition;
    information = dia_talas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_talas_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_talas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_talas_pickpocket);
	info_addchoice(dia_talas_pickpocket, dialog_back, dia_talas_pickpocket_back);
	info_addchoice(dia_talas_pickpocket, dialog_pickpocket, dia_talas_pickpocket_doit);
};

func void dia_talas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_talas_pickpocket);
};

func void dia_talas_pickpocket_back() {
    info_clearchoices(dia_talas_pickpocket);
};

instance dia_caine_pickpocket(c_info) {
    npc = nov_1301_caine;
    nr = 900;
    condition = dia_caine_pickpocket_condition;
    information = dia_caine_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_caine_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_caine_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_caine_pickpocket);
	info_addchoice(dia_caine_pickpocket, dialog_back, dia_caine_pickpocket_back);
	info_addchoice(dia_caine_pickpocket, dialog_pickpocket, dia_caine_pickpocket_doit);
};

func void dia_caine_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_caine_pickpocket);
};

func void dia_caine_pickpocket_back() {
    info_clearchoices(dia_caine_pickpocket);
};

instance dia_viran_pickpocket(c_info) {
    npc = nov_1302_viran;
    nr = 900;
    condition = dia_viran_pickpocket_condition;
    information = dia_viran_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_viran_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_viran_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_viran_pickpocket);
	info_addchoice(dia_viran_pickpocket, dialog_back, dia_viran_pickpocket_back);
	info_addchoice(dia_viran_pickpocket, dialog_pickpocket, dia_viran_pickpocket_doit);
};

func void dia_viran_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_viran_pickpocket);
};

func void dia_viran_pickpocket_back() {
    info_clearchoices(dia_viran_pickpocket);
};

instance dia_nyras_pickpocket(c_info) {
    npc = nov_1303_nyras;
    nr = 900;
    condition = dia_nyras_pickpocket_condition;
    information = dia_nyras_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nyras_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_nyras_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nyras_pickpocket);
	info_addchoice(dia_nyras_pickpocket, dialog_back, dia_nyras_pickpocket_back);
	info_addchoice(dia_nyras_pickpocket, dialog_pickpocket, dia_nyras_pickpocket_doit);
};

func void dia_nyras_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nyras_pickpocket);
};

func void dia_nyras_pickpocket_back() {
    info_clearchoices(dia_nyras_pickpocket);
};

instance dia_balor_pickpocket(c_info) {
    npc = nov_1304_balor;
    nr = 900;
    condition = dia_balor_pickpocket_condition;
    information = dia_balor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_balor_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_balor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_balor_pickpocket);
	info_addchoice(dia_balor_pickpocket, dialog_back, dia_balor_pickpocket_back);
	info_addchoice(dia_balor_pickpocket, dialog_pickpocket, dia_balor_pickpocket_doit);
};

func void dia_balor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_balor_pickpocket);
};

func void dia_balor_pickpocket_back() {
    info_clearchoices(dia_balor_pickpocket);
};

instance dia_joru_pickpocket(c_info) {
    npc = nov_1305_joru;
    nr = 900;
    condition = dia_joru_pickpocket_condition;
    information = dia_joru_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_joru_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_joru_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_joru_pickpocket);
	info_addchoice(dia_joru_pickpocket, dialog_back, dia_joru_pickpocket_back);
	info_addchoice(dia_joru_pickpocket, dialog_pickpocket, dia_joru_pickpocket_doit);
};

func void dia_joru_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_joru_pickpocket);
};

func void dia_joru_pickpocket_back() {
    info_clearchoices(dia_joru_pickpocket);
};

instance dia_ghorim_pickpocket(c_info) {
    npc = nov_1310_ghorim;
    nr = 900;
    condition = dia_ghorim_pickpocket_condition;
    information = dia_ghorim_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ghorim_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_ghorim_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ghorim_pickpocket);
	info_addchoice(dia_ghorim_pickpocket, dialog_back, dia_ghorim_pickpocket_back);
	info_addchoice(dia_ghorim_pickpocket, dialog_pickpocket, dia_ghorim_pickpocket_doit);
};

func void dia_ghorim_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ghorim_pickpocket);
};

func void dia_ghorim_pickpocket_back() {
    info_clearchoices(dia_ghorim_pickpocket);
};

instance dia_darrion_pickpocket(c_info) {
    npc = nov_1312_darrion;
    nr = 900;
    condition = dia_darrion_pickpocket_condition;
    information = dia_darrion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_darrion_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_darrion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_darrion_pickpocket);
	info_addchoice(dia_darrion_pickpocket, dialog_back, dia_darrion_pickpocket_back);
	info_addchoice(dia_darrion_pickpocket, dialog_pickpocket, dia_darrion_pickpocket_doit);
};

func void dia_darrion_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_darrion_pickpocket);
};

func void dia_darrion_pickpocket_back() {
    info_clearchoices(dia_darrion_pickpocket);
};

instance dia_davson_pickpocket(c_info) {
    npc = nov_1324_novize;
    nr = 900;
    condition = dia_davson_pickpocket_condition;
    information = dia_davson_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_davson_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_davson_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_davson_pickpocket);
	info_addchoice(dia_davson_pickpocket, dialog_back, dia_davson_pickpocket_back);
	info_addchoice(dia_davson_pickpocket, dialog_pickpocket, dia_davson_pickpocket_doit);
};

func void dia_davson_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_davson_pickpocket);
};

func void dia_davson_pickpocket_back() {
    info_clearchoices(dia_davson_pickpocket);
};

instance dia_baalparvez_pickpocket(c_info) {
    npc = nov_1330_baalparvez;
    nr = 900;
    condition = dia_baalparvez_pickpocket_condition;
    information = dia_baalparvez_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalparvez_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalparvez_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalparvez_pickpocket);
	info_addchoice(dia_baalparvez_pickpocket, dialog_back, dia_baalparvez_pickpocket_back);
	info_addchoice(dia_baalparvez_pickpocket, dialog_pickpocket, dia_baalparvez_pickpocket_doit);
};

func void dia_baalparvez_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalparvez_pickpocket);
};

func void dia_baalparvez_pickpocket_back() {
    info_clearchoices(dia_baalparvez_pickpocket);
};

instance dia_baaltaran_pickpocket(c_info) {
    npc = nov_1331_baaltaran;
    nr = 900;
    condition = dia_baaltaran_pickpocket_condition;
    information = dia_baaltaran_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baaltaran_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_baaltaran_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baaltaran_pickpocket);
	info_addchoice(dia_baaltaran_pickpocket, dialog_back, dia_baaltaran_pickpocket_back);
	info_addchoice(dia_baaltaran_pickpocket, dialog_pickpocket, dia_baaltaran_pickpocket_doit);
};

func void dia_baaltaran_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baaltaran_pickpocket);
};

func void dia_baaltaran_pickpocket_back() {
    info_clearchoices(dia_baaltaran_pickpocket);
};

instance dia_baalkagan_pickpocket(c_info) {
    npc = nov_1332_baalkagan;
    nr = 900;
    condition = dia_baalkagan_pickpocket_condition;
    information = dia_baalkagan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalkagan_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalkagan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalkagan_pickpocket);
	info_addchoice(dia_baalkagan_pickpocket, dialog_back, dia_baalkagan_pickpocket_back);
	info_addchoice(dia_baalkagan_pickpocket, dialog_pickpocket, dia_baalkagan_pickpocket_doit);
};

func void dia_baalkagan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalkagan_pickpocket);
};

func void dia_baalkagan_pickpocket_back() {
    info_clearchoices(dia_baalkagan_pickpocket);
};

instance dia_baalisidro_pickpocket(c_info) {
    npc = nov_1333_baalisidro;
    nr = 900;
    condition = dia_baalisidro_pickpocket_condition;
    information = dia_baalisidro_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalisidro_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalisidro_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalisidro_pickpocket);
	info_addchoice(dia_baalisidro_pickpocket, dialog_back, dia_baalisidro_pickpocket_back);
	info_addchoice(dia_baalisidro_pickpocket, dialog_pickpocket, dia_baalisidro_pickpocket_doit);
};

func void dia_baalisidro_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalisidro_pickpocket);
};

func void dia_baalisidro_pickpocket_back() {
    info_clearchoices(dia_baalisidro_pickpocket);
};

instance dia_nov_1345_pickpocket(c_info) {
    npc = nov_1345_novize;
    nr = 900;
    condition = dia_nov_1345_pickpocket_condition;
    information = dia_nov_1345_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nov_1345_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_nov_1345_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nov_1345_pickpocket);
	info_addchoice(dia_nov_1345_pickpocket, dialog_back, dia_nov_1345_pickpocket_back);
	info_addchoice(dia_nov_1345_pickpocket, dialog_pickpocket, dia_nov_1345_pickpocket_doit);
};

func void dia_nov_1345_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nov_1345_pickpocket);
};

func void dia_nov_1345_pickpocket_back() {
    info_clearchoices(dia_nov_1345_pickpocket);
};

instance dia_nov_1349_pickpocket(c_info) {
    npc = nov_1349_novize;
    nr = 900;
    condition = dia_nov_1349_pickpocket_condition;
    information = dia_nov_1349_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nov_1349_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_nov_1349_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nov_1349_pickpocket);
	info_addchoice(dia_nov_1349_pickpocket, dialog_back, dia_nov_1349_pickpocket_back);
	info_addchoice(dia_nov_1349_pickpocket, dialog_pickpocket, dia_nov_1349_pickpocket_doit);
};

func void dia_nov_1349_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nov_1349_pickpocket);
};

func void dia_nov_1349_pickpocket_back() {
    info_clearchoices(dia_nov_1349_pickpocket);
};

instance dia_shrat_pickpocket(c_info) {
    npc = nov_1356_shrat;
    nr = 900;
    condition = dia_shrat_pickpocket_condition;
    information = dia_shrat_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_shrat_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 40);
};

func void dia_shrat_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_shrat_pickpocket);
	info_addchoice(dia_shrat_pickpocket, dialog_back, dia_shrat_pickpocket_back);
	info_addchoice(dia_shrat_pickpocket, dialog_pickpocket, dia_shrat_pickpocket_doit);
};

func void dia_shrat_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_shrat_pickpocket);
};

func void dia_shrat_pickpocket_back() {
    info_clearchoices(dia_shrat_pickpocket);
};

instance dia_fortuno_pickpocket(c_info) {
    npc = nov_1357_fortuno;
    nr = 900;
    condition = dia_fortuno_pickpocket_condition;
    information = dia_fortuno_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fortuno_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 40);
};

func void dia_fortuno_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fortuno_pickpocket);
	info_addchoice(dia_fortuno_pickpocket, dialog_back, dia_fortuno_pickpocket_back);
	info_addchoice(dia_fortuno_pickpocket, dialog_pickpocket, dia_fortuno_pickpocket_doit);
};

func void dia_fortuno_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fortuno_pickpocket);
};

func void dia_fortuno_pickpocket_back() {
    info_clearchoices(dia_fortuno_pickpocket);
};

instance dia_harlok_pickpocket(c_info) {
    npc = nov_1358_harlok;
    nr = 900;
    condition = dia_harlok_pickpocket_condition;
    information = dia_harlok_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_harlok_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_harlok_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_harlok_pickpocket);
	info_addchoice(dia_harlok_pickpocket, dialog_back, dia_harlok_pickpocket_back);
	info_addchoice(dia_harlok_pickpocket, dialog_pickpocket, dia_harlok_pickpocket_doit);
};

func void dia_harlok_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_harlok_pickpocket);
};

func void dia_harlok_pickpocket_back() {
    info_clearchoices(dia_harlok_pickpocket);
};

instance dia_baalnetbek_pickpocket(c_info) {
    npc = nov_1371_baalnetbek;
    nr = 900;
    condition = dia_baalnetbek_pickpocket_condition;
    information = dia_baalnetbek_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalnetbek_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalnetbek_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalnetbek_pickpocket);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_back, dia_baalnetbek_pickpocket_back);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_pickpocket, dia_baalnetbek_pickpocket_doit);
};

func void dia_baalnetbek_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baalnetbek_pickpocket);
};

func void dia_baalnetbek_pickpocket_back() {
    info_clearchoices(dia_baalnetbek_pickpocket);
};

instance dia_brago_pickpocket(c_info) {
    npc = nov_40000_brago;
    nr = 900;
    condition = dia_brago_pickpocket_condition;
    information = dia_brago_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brago_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 35);
};

func void dia_brago_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brago_pickpocket);
	info_addchoice(dia_brago_pickpocket, dialog_back, dia_brago_pickpocket_back);
	info_addchoice(dia_brago_pickpocket, dialog_pickpocket, dia_brago_pickpocket_doit);
};

func void dia_brago_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_brago_pickpocket);
};

func void dia_brago_pickpocket_back() {
    info_clearchoices(dia_brago_pickpocket);
};

instance dia_mosul_pickpocket(c_info) {
    npc = nov_40001_mosul;
    nr = 900;
    condition = dia_mosul_pickpocket_condition;
    information = dia_mosul_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mosul_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 35);
};

func void dia_mosul_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mosul_pickpocket);
	info_addchoice(dia_mosul_pickpocket, dialog_back, dia_mosul_pickpocket_back);
	info_addchoice(dia_mosul_pickpocket, dialog_pickpocket, dia_mosul_pickpocket_doit);
};

func void dia_mosul_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mosul_pickpocket);
};

func void dia_mosul_pickpocket_back() {
    info_clearchoices(dia_mosul_pickpocket);
};

instance dia_sakhar_pickpocket(c_info) {
    npc = nov_40033_sakhar;
    nr = 900;
    condition = dia_sakhar_pickpocket_condition;
    information = dia_sakhar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sakhar_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_sakhar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sakhar_pickpocket);
	info_addchoice(dia_sakhar_pickpocket, dialog_back, dia_sakhar_pickpocket_back);
	info_addchoice(dia_sakhar_pickpocket, dialog_pickpocket, dia_sakhar_pickpocket_doit);
};

func void dia_sakhar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sakhar_pickpocket);
};

func void dia_sakhar_pickpocket_back() {
    info_clearchoices(dia_sakhar_pickpocket);
};

instance dia_cpun_pickpocket(c_info) {
    npc = nov_40065_cpun;
    nr = 900;
    condition = dia_cpun_pickpocket_condition;
    information = dia_cpun_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cpun_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 10);
};

func void dia_cpun_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cpun_pickpocket);
	info_addchoice(dia_cpun_pickpocket, dialog_back, dia_cpun_pickpocket_back);
	info_addchoice(dia_cpun_pickpocket, dialog_pickpocket, dia_cpun_pickpocket_doit);
};

func void dia_cpun_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cpun_pickpocket);
};

func void dia_cpun_pickpocket_back() {
    info_clearchoices(dia_cpun_pickpocket);
};

instance dia_zagol_pickpocket(c_info) {
    npc = nov_40148_zagol;
    nr = 900;
    condition = dia_zagol_pickpocket_condition;
    information = dia_zagol_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_zagol_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 15);
};

func void dia_zagol_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_zagol_pickpocket);
	info_addchoice(dia_zagol_pickpocket, dialog_back, dia_zagol_pickpocket_back);
	info_addchoice(dia_zagol_pickpocket, dialog_pickpocket, dia_zagol_pickpocket_doit);
};

func void dia_zagol_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_zagol_pickpocket);
};

func void dia_zagol_pickpocket_back() {
    info_clearchoices(dia_zagol_pickpocket);
};

instance dia_pomocnik_pickpocket(c_info) {
    npc = org_40017_pomocnik;
    nr = 900;
    condition = dia_pomocnik_pickpocket_condition;
    information = dia_pomocnik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pomocnik_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_pomocnik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pomocnik_pickpocket);
	info_addchoice(dia_pomocnik_pickpocket, dialog_back, dia_pomocnik_pickpocket_back);
	info_addchoice(dia_pomocnik_pickpocket, dialog_pickpocket, dia_pomocnik_pickpocket_doit);
};

func void dia_pomocnik_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pomocnik_pickpocket);
};

func void dia_pomocnik_pickpocket_back() {
    info_clearchoices(dia_pomocnik_pickpocket);
};

instance dia_org_40022_pickpocket(c_info) {
    npc = org_40022_szkodnik;
    nr = 900;
    condition = dia_org_40022_pickpocket_condition;
    information = dia_org_40022_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40022_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40022_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40022_pickpocket);
	info_addchoice(dia_org_40022_pickpocket, dialog_back, dia_org_40022_pickpocket_back);
	info_addchoice(dia_org_40022_pickpocket, dialog_pickpocket, dia_org_40022_pickpocket_doit);
};

func void dia_org_40022_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40022_pickpocket);
};

func void dia_org_40022_pickpocket_back() {
    info_clearchoices(dia_org_40022_pickpocket);
};

instance dia_org_40023_pickpocket(c_info) {
    npc = org_40023_szkodnik;
    nr = 900;
    condition = dia_org_40023_pickpocket_condition;
    information = dia_org_40023_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40023_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40023_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40023_pickpocket);
	info_addchoice(dia_org_40023_pickpocket, dialog_back, dia_org_40023_pickpocket_back);
	info_addchoice(dia_org_40023_pickpocket, dialog_pickpocket, dia_org_40023_pickpocket_doit);
};

func void dia_org_40023_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40023_pickpocket);
};

func void dia_org_40023_pickpocket_back() {
    info_clearchoices(dia_org_40023_pickpocket);
};

instance dia_org_40021_pickpocket(c_info) {
    npc = org_40021_szkodnik;
    nr = 900;
    condition = dia_org_40021_pickpocket_condition;
    information = dia_org_40021_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40021_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40021_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40021_pickpocket);
	info_addchoice(dia_org_40021_pickpocket, dialog_back, dia_org_40021_pickpocket_back);
	info_addchoice(dia_org_40021_pickpocket, dialog_pickpocket, dia_org_40021_pickpocket_doit);
};

func void dia_org_40021_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40021_pickpocket);
};

func void dia_org_40021_pickpocket_back() {
    info_clearchoices(dia_org_40021_pickpocket);
};

instance dia_grabarz_pickpocket(c_info) {
    npc = org_40045_grabarz;
    nr = 900;
    condition = dia_grabarz_pickpocket_condition;
    information = dia_grabarz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grabarz_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_grabarz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grabarz_pickpocket);
	info_addchoice(dia_grabarz_pickpocket, dialog_back, dia_grabarz_pickpocket_back);
	info_addchoice(dia_grabarz_pickpocket, dialog_pickpocket, dia_grabarz_pickpocket_doit);
};

func void dia_grabarz_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grabarz_pickpocket);
};

func void dia_grabarz_pickpocket_back() {
    info_clearchoices(dia_grabarz_pickpocket);
};

instance dia_gavilan_pickpocket(c_info) {
    npc = org_40138_gavilan;
    nr = 900;
    condition = dia_gavilan_pickpocket_condition;
    information = dia_gavilan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gavilan_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_gavilan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gavilan_pickpocket);
	info_addchoice(dia_gavilan_pickpocket, dialog_back, dia_gavilan_pickpocket_back);
	info_addchoice(dia_gavilan_pickpocket, dialog_pickpocket, dia_gavilan_pickpocket_doit);
};

func void dia_gavilan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gavilan_pickpocket);
};

func void dia_gavilan_pickpocket_back() {
    info_clearchoices(dia_gavilan_pickpocket);
};

instance dia_rozbojnik_pickpocket(c_info) {
    npc = org_40145_rozbojnik;
    nr = 900;
    condition = dia_rozbojnik_pickpocket_condition;
    information = dia_rozbojnik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rozbojnik_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_rozbojnik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rozbojnik_pickpocket);
	info_addchoice(dia_rozbojnik_pickpocket, dialog_back, dia_rozbojnik_pickpocket_back);
	info_addchoice(dia_rozbojnik_pickpocket, dialog_pickpocket, dia_rozbojnik_pickpocket_doit);
};

func void dia_rozbojnik_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rozbojnik_pickpocket);
};

func void dia_rozbojnik_pickpocket_back() {
    info_clearchoices(dia_rozbojnik_pickpocket);
};

instance dia_podejrzany_pickpocket(c_info) {
    npc = org_40151_podejrzany;
    nr = 900;
    condition = dia_podejrzany_pickpocket_condition;
    information = dia_podejrzany_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_podejrzany_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_podejrzany_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_podejrzany_pickpocket);
	info_addchoice(dia_podejrzany_pickpocket, dialog_back, dia_podejrzany_pickpocket_back);
	info_addchoice(dia_podejrzany_pickpocket, dialog_pickpocket, dia_podejrzany_pickpocket_doit);
};

func void dia_podejrzany_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_podejrzany_pickpocket);
};

func void dia_podejrzany_pickpocket_back() {
    info_clearchoices(dia_podejrzany_pickpocket);
};

instance dia_org_40152_pickpocket(c_info) {
    npc = org_40152_podejrzany;
    nr = 900;
    condition = dia_org_40152_pickpocket_condition;
    information = dia_org_40152_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40152_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40152_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40152_pickpocket);
	info_addchoice(dia_org_40152_pickpocket, dialog_back, dia_org_40152_pickpocket_back);
	info_addchoice(dia_org_40152_pickpocket, dialog_pickpocket, dia_org_40152_pickpocket_doit);
};

func void dia_org_40152_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40152_pickpocket);
};

func void dia_org_40152_pickpocket_back() {
    info_clearchoices(dia_org_40152_pickpocket);
};

instance dia_org_40159_pickpocket(c_info) {
    npc = org_40159_rozbojnik;
    nr = 900;
    condition = dia_org_40159_pickpocket_condition;
    information = dia_org_40159_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40159_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40159_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40159_pickpocket);
	info_addchoice(dia_org_40159_pickpocket, dialog_back, dia_org_40159_pickpocket_back);
	info_addchoice(dia_org_40159_pickpocket, dialog_pickpocket, dia_org_40159_pickpocket_doit);
};

func void dia_org_40159_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40159_pickpocket);
};

func void dia_org_40159_pickpocket_back() {
    info_clearchoices(dia_org_40159_pickpocket);
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
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_szef_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_szef_pickpocket);
	info_addchoice(dia_szef_pickpocket, dialog_back, dia_szef_pickpocket_back);
	info_addchoice(dia_szef_pickpocket, dialog_pickpocket, dia_szef_pickpocket_doit);
};

func void dia_szef_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_szef_pickpocket);
};

func void dia_szef_pickpocket_back() {
    info_clearchoices(dia_szef_pickpocket);
};

instance dia_org_40164_pickpocket(c_info) {
    npc = org_40164_rozbojnik;
    nr = 900;
    condition = dia_org_40164_pickpocket_condition;
    information = dia_org_40164_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40164_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40164_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40164_pickpocket);
	info_addchoice(dia_org_40164_pickpocket, dialog_back, dia_org_40164_pickpocket_back);
	info_addchoice(dia_org_40164_pickpocket, dialog_pickpocket, dia_org_40164_pickpocket_doit);
};

func void dia_org_40164_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_40164_pickpocket);
};

func void dia_org_40164_pickpocket_back() {
    info_clearchoices(dia_org_40164_pickpocket);
};

instance dia_lares_pickpocket(c_info) {
    npc = org_801_lares;
    nr = 900;
    condition = dia_lares_pickpocket_condition;
    information = dia_lares_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lares_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_lares_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lares_pickpocket);
	info_addchoice(dia_lares_pickpocket, dialog_back, dia_lares_pickpocket_back);
	info_addchoice(dia_lares_pickpocket, dialog_pickpocket, dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back() {
    info_clearchoices(dia_lares_pickpocket);
};

instance dia_org_804_pickpocket(c_info) {
    npc = org_804_organisator;
    nr = 900;
    condition = dia_org_804_pickpocket_condition;
    information = dia_org_804_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_804_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_804_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_804_pickpocket);
	info_addchoice(dia_org_804_pickpocket, dialog_back, dia_org_804_pickpocket_back);
	info_addchoice(dia_org_804_pickpocket, dialog_pickpocket, dia_org_804_pickpocket_doit);
};

func void dia_org_804_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_804_pickpocket);
};

func void dia_org_804_pickpocket_back() {
    info_clearchoices(dia_org_804_pickpocket);
};

instance dia_ratford_pickpocket(c_info) {
    npc = org_818_ratford;
    nr = 900;
    condition = dia_ratford_pickpocket_condition;
    information = dia_ratford_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ratford_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_ratford_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ratford_pickpocket);
	info_addchoice(dia_ratford_pickpocket, dialog_back, dia_ratford_pickpocket_back);
	info_addchoice(dia_ratford_pickpocket, dialog_pickpocket, dia_ratford_pickpocket_doit);
};

func void dia_ratford_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ratford_pickpocket);
};

func void dia_ratford_pickpocket_back() {
    info_clearchoices(dia_ratford_pickpocket);
};

instance dia_org_825_pickpocket(c_info) {
    npc = org_825_organisator;
    nr = 900;
    condition = dia_org_825_pickpocket_condition;
    information = dia_org_825_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_825_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_825_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_825_pickpocket);
	info_addchoice(dia_org_825_pickpocket, dialog_back, dia_org_825_pickpocket_back);
	info_addchoice(dia_org_825_pickpocket, dialog_pickpocket, dia_org_825_pickpocket_doit);
};

func void dia_org_825_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_825_pickpocket);
};

func void dia_org_825_pickpocket_back() {
    info_clearchoices(dia_org_825_pickpocket);
};

instance dia_mordrag_pickpocket(c_info) {
    npc = org_826_mordrag;
    nr = 900;
    condition = dia_mordrag_pickpocket_condition;
    information = dia_mordrag_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mordrag_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_mordrag_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mordrag_pickpocket);
	info_addchoice(dia_mordrag_pickpocket, dialog_back, dia_mordrag_pickpocket_back);
	info_addchoice(dia_mordrag_pickpocket, dialog_pickpocket, dia_mordrag_pickpocket_doit);
};

func void dia_mordrag_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mordrag_pickpocket);
};

func void dia_mordrag_pickpocket_back() {
    info_clearchoices(dia_mordrag_pickpocket);
};

instance dia_bruce_pickpocket(c_info) {
    npc = org_828_bruce;
    nr = 900;
    condition = dia_bruce_pickpocket_condition;
    information = dia_bruce_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bruce_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_bruce_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bruce_pickpocket);
	info_addchoice(dia_bruce_pickpocket, dialog_back, dia_bruce_pickpocket_back);
	info_addchoice(dia_bruce_pickpocket, dialog_pickpocket, dia_bruce_pickpocket_doit);
};

func void dia_bruce_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bruce_pickpocket);
};

func void dia_bruce_pickpocket_back() {
    info_clearchoices(dia_bruce_pickpocket);
};

instance dia_org_829_pickpocket(c_info) {
    npc = org_829_organisator;
    nr = 900;
    condition = dia_org_829_pickpocket_condition;
    information = dia_org_829_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_829_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_org_829_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_829_pickpocket);
	info_addchoice(dia_org_829_pickpocket, dialog_back, dia_org_829_pickpocket_back);
	info_addchoice(dia_org_829_pickpocket, dialog_pickpocket, dia_org_829_pickpocket_doit);
};

func void dia_org_829_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_829_pickpocket);
};

func void dia_org_829_pickpocket_back() {
    info_clearchoices(dia_org_829_pickpocket);
};

instance dia_org_830_pickpocket(c_info) {
    npc = org_830_organisator;
    nr = 900;
    condition = dia_org_830_pickpocket_condition;
    information = dia_org_830_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_830_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_org_830_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_830_pickpocket);
	info_addchoice(dia_org_830_pickpocket, dialog_back, dia_org_830_pickpocket_back);
	info_addchoice(dia_org_830_pickpocket, dialog_pickpocket, dia_org_830_pickpocket_doit);
};

func void dia_org_830_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_830_pickpocket);
};

func void dia_org_830_pickpocket_back() {
    info_clearchoices(dia_org_830_pickpocket);
};

instance dia_org_831_pickpocket(c_info) {
    npc = org_831_organisator;
    nr = 900;
    condition = dia_org_831_pickpocket_condition;
    information = dia_org_831_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_831_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_org_831_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_831_pickpocket);
	info_addchoice(dia_org_831_pickpocket, dialog_back, dia_org_831_pickpocket_back);
	info_addchoice(dia_org_831_pickpocket, dialog_pickpocket, dia_org_831_pickpocket_doit);
};

func void dia_org_831_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_831_pickpocket);
};

func void dia_org_831_pickpocket_back() {
    info_clearchoices(dia_org_831_pickpocket);
};

instance dia_buster_pickpocket(c_info) {
    npc = org_833_buster;
    nr = 900;
    condition = dia_buster_pickpocket_condition;
    information = dia_buster_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_buster_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_buster_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_buster_pickpocket);
	info_addchoice(dia_buster_pickpocket, dialog_back, dia_buster_pickpocket_back);
	info_addchoice(dia_buster_pickpocket, dialog_pickpocket, dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back() {
    info_clearchoices(dia_buster_pickpocket);
};

instance dia_roscoe_pickpocket(c_info) {
    npc = org_840_roscoe;
    nr = 900;
    condition = dia_roscoe_pickpocket_condition;
    information = dia_roscoe_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_roscoe_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_roscoe_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_roscoe_pickpocket);
	info_addchoice(dia_roscoe_pickpocket, dialog_back, dia_roscoe_pickpocket_back);
	info_addchoice(dia_roscoe_pickpocket, dialog_pickpocket, dia_roscoe_pickpocket_doit);
};

func void dia_roscoe_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_roscoe_pickpocket);
};

func void dia_roscoe_pickpocket_back() {
    info_clearchoices(dia_roscoe_pickpocket);
};

instance dia_silas_pickpocket(c_info) {
    npc = org_841_silas;
    nr = 900;
    condition = dia_silas_pickpocket_condition;
    information = dia_silas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_silas_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_silas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_silas_pickpocket);
	info_addchoice(dia_silas_pickpocket, dialog_back, dia_silas_pickpocket_back);
	info_addchoice(dia_silas_pickpocket, dialog_pickpocket, dia_silas_pickpocket_doit);
};

func void dia_silas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_silas_pickpocket);
};

func void dia_silas_pickpocket_back() {
    info_clearchoices(dia_silas_pickpocket);
};

instance dia_org_842_pickpocket(c_info) {
    npc = org_842_shrike;
    nr = 900;
    condition = dia_org_842_pickpocket_condition;
    information = dia_org_842_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_842_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_842_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_842_pickpocket);
	info_addchoice(dia_org_842_pickpocket, dialog_back, dia_org_842_pickpocket_back);
	info_addchoice(dia_org_842_pickpocket, dialog_pickpocket, dia_org_842_pickpocket_doit);
};

func void dia_org_842_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_842_pickpocket);
};

func void dia_org_842_pickpocket_back() {
    info_clearchoices(dia_org_842_pickpocket);
};

instance dia_sharky_pickpocket(c_info) {
    npc = org_843_sharky;
    nr = 900;
    condition = dia_sharky_pickpocket_condition;
    information = dia_sharky_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sharky_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_sharky_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sharky_pickpocket);
	info_addchoice(dia_sharky_pickpocket, dialog_back, dia_sharky_pickpocket_back);
	info_addchoice(dia_sharky_pickpocket, dialog_pickpocket, dia_sharky_pickpocket_doit);
};

func void dia_sharky_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sharky_pickpocket);
};

func void dia_sharky_pickpocket_back() {
    info_clearchoices(dia_sharky_pickpocket);
};

instance dia_lefty_pickpocket(c_info) {
    npc = org_844_lefty;
    nr = 900;
    condition = dia_lefty_pickpocket_condition;
    information = dia_lefty_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lefty_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_lefty_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lefty_pickpocket);
	info_addchoice(dia_lefty_pickpocket, dialog_back, dia_lefty_pickpocket_back);
	info_addchoice(dia_lefty_pickpocket, dialog_pickpocket, dia_lefty_pickpocket_doit);
};

func void dia_lefty_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_lefty_pickpocket);
};

func void dia_lefty_pickpocket_back() {
    info_clearchoices(dia_lefty_pickpocket);
};

instance dia_org_876_pickpocket(c_info) {
    npc = org_876_tuersteher;
    nr = 900;
    condition = dia_org_876_pickpocket_condition;
    information = dia_org_876_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_876_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_876_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_876_pickpocket);
	info_addchoice(dia_org_876_pickpocket, dialog_back, dia_org_876_pickpocket_back);
	info_addchoice(dia_org_876_pickpocket, dialog_pickpocket, dia_org_876_pickpocket_doit);
};

func void dia_org_876_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_876_pickpocket);
};

func void dia_org_876_pickpocket_back() {
    info_clearchoices(dia_org_876_pickpocket);
};

instance dia_org_845_pickpocket(c_info) {
    npc = org_845_schlaeger;
    nr = 900;
    condition = dia_org_845_pickpocket_condition;
    information = dia_org_845_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_845_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_845_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_845_pickpocket);
	info_addchoice(dia_org_845_pickpocket, dialog_back, dia_org_845_pickpocket_back);
	info_addchoice(dia_org_845_pickpocket, dialog_pickpocket, dia_org_845_pickpocket_doit);
};

func void dia_org_845_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_845_pickpocket);
};

func void dia_org_845_pickpocket_back() {
    info_clearchoices(dia_org_845_pickpocket);
};

instance dia_org_846_pickpocket(c_info) {
    npc = org_846_schlaeger;
    nr = 900;
    condition = dia_org_846_pickpocket_condition;
    information = dia_org_846_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_846_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_846_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_846_pickpocket);
	info_addchoice(dia_org_846_pickpocket, dialog_back, dia_org_846_pickpocket_back);
	info_addchoice(dia_org_846_pickpocket, dialog_pickpocket, dia_org_846_pickpocket_doit);
};

func void dia_org_846_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_846_pickpocket);
};

func void dia_org_846_pickpocket_back() {
    info_clearchoices(dia_org_846_pickpocket);
};

instance dia_wedge_pickpocket(c_info) {
    npc = org_850_wedge;
    nr = 900;
    condition = dia_wedge_pickpocket_condition;
    information = dia_wedge_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_wedge_pickpocket_condition() {
	c_beklauen(10, 30);
};

func void dia_wedge_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_wedge_pickpocket);
	info_addchoice(dia_wedge_pickpocket, dialog_back, dia_wedge_pickpocket_back);
	info_addchoice(dia_wedge_pickpocket, dialog_pickpocket, dia_wedge_pickpocket_doit);
};

func void dia_wedge_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_wedge_pickpocket);
};

func void dia_wedge_pickpocket_back() {
    info_clearchoices(dia_wedge_pickpocket);
};

instance dia_butch_pickpocket(c_info) {
    npc = org_851_butch;
    nr = 900;
    condition = dia_butch_pickpocket_condition;
    information = dia_butch_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_butch_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_butch_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_butch_pickpocket);
	info_addchoice(dia_butch_pickpocket, dialog_back, dia_butch_pickpocket_back);
	info_addchoice(dia_butch_pickpocket, dialog_pickpocket, dia_butch_pickpocket_doit);
};

func void dia_butch_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_butch_pickpocket);
};

func void dia_butch_pickpocket_back() {
    info_clearchoices(dia_butch_pickpocket);
};

instance dia_wolf_pickpocket(c_info) {
    npc = org_855_wolf;
    nr = 900;
    condition = dia_wolf_pickpocket_condition;
    information = dia_wolf_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_wolf_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_wolf_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_wolf_pickpocket);
	info_addchoice(dia_wolf_pickpocket, dialog_back, dia_wolf_pickpocket_back);
	info_addchoice(dia_wolf_pickpocket, dialog_pickpocket, dia_wolf_pickpocket_doit);
};

func void dia_wolf_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_wolf_pickpocket);
};

func void dia_wolf_pickpocket_back() {
    info_clearchoices(dia_wolf_pickpocket);
};

instance dia_aidan_pickpocket(c_info) {
    npc = org_859_aidan;
    nr = 900;
    condition = dia_aidan_pickpocket_condition;
    information = dia_aidan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_aidan_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 35);
};

func void dia_aidan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_aidan_pickpocket);
	info_addchoice(dia_aidan_pickpocket, dialog_back, dia_aidan_pickpocket_back);
	info_addchoice(dia_aidan_pickpocket, dialog_pickpocket, dia_aidan_pickpocket_doit);
};

func void dia_aidan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_aidan_pickpocket);
};

func void dia_aidan_pickpocket_back() {
    info_clearchoices(dia_aidan_pickpocket);
};

instance dia_renyu_pickpocket(c_info) {
    npc = org_860_renyu;
    nr = 900;
    condition = dia_renyu_pickpocket_condition;
    information = dia_renyu_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_renyu_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_renyu_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_renyu_pickpocket);
	info_addchoice(dia_renyu_pickpocket, dialog_back, dia_renyu_pickpocket_back);
	info_addchoice(dia_renyu_pickpocket, dialog_pickpocket, dia_renyu_pickpocket_doit);
};

func void dia_renyu_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_renyu_pickpocket);
};

func void dia_renyu_pickpocket_back() {
    info_clearchoices(dia_renyu_pickpocket);
};

instance dia_killian_pickpocket(c_info) {
    npc = org_861_killian;
    nr = 900;
    condition = dia_killian_pickpocket_condition;
    information = dia_killian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_killian_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_killian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_killian_pickpocket);
	info_addchoice(dia_killian_pickpocket, dialog_back, dia_killian_pickpocket_back);
	info_addchoice(dia_killian_pickpocket, dialog_pickpocket, dia_killian_pickpocket_doit);
};

func void dia_killian_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_killian_pickpocket);
};

func void dia_killian_pickpocket_back() {
    info_clearchoices(dia_killian_pickpocket);
};

instance dia_jacko_pickpocket(c_info) {
    npc = org_862_jacko;
    nr = 900;
    condition = dia_jacko_pickpocket_condition;
    information = dia_jacko_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jacko_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_jacko_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jacko_pickpocket);
	info_addchoice(dia_jacko_pickpocket, dialog_back, dia_jacko_pickpocket_back);
	info_addchoice(dia_jacko_pickpocket, dialog_pickpocket, dia_jacko_pickpocket_doit);
};

func void dia_jacko_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jacko_pickpocket);
};

func void dia_jacko_pickpocket_back() {
    info_clearchoices(dia_jacko_pickpocket);
};

instance dia_cipher_pickpocket(c_info) {
    npc = org_873_cipher;
    nr = 900;
    condition = dia_cipher_pickpocket_condition;
    information = dia_cipher_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cipher_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_cipher_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cipher_pickpocket);
	info_addchoice(dia_cipher_pickpocket, dialog_back, dia_cipher_pickpocket_back);
	info_addchoice(dia_cipher_pickpocket, dialog_pickpocket, dia_cipher_pickpocket_doit);
};

func void dia_cipher_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cipher_pickpocket);
};

func void dia_cipher_pickpocket_back() {
    info_clearchoices(dia_cipher_pickpocket);
};

instance dia_org_875_pickpocket(c_info) {
    npc = org_875_tuersteher;
    nr = 900;
    condition = dia_org_875_pickpocket_condition;
    information = dia_org_875_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_875_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_875_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_875_pickpocket);
	info_addchoice(dia_org_875_pickpocket, dialog_back, dia_org_875_pickpocket_back);
	info_addchoice(dia_org_875_pickpocket, dialog_pickpocket, dia_org_875_pickpocket_doit);
};

func void dia_org_875_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_875_pickpocket);
};

func void dia_org_875_pickpocket_back() {
    info_clearchoices(dia_org_875_pickpocket);
};

instance dia_org_888_pickpocket(c_info) {
    npc = org_888_erpresser;
    nr = 900;
    condition = dia_org_888_pickpocket_condition;
    information = dia_org_888_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_888_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_888_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_888_pickpocket);
	info_addchoice(dia_org_888_pickpocket, dialog_back, dia_org_888_pickpocket_back);
	info_addchoice(dia_org_888_pickpocket, dialog_pickpocket, dia_org_888_pickpocket_doit);
};

func void dia_org_888_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_888_pickpocket);
};

func void dia_org_888_pickpocket_back() {
    info_clearchoices(dia_org_888_pickpocket);
};

instance dia_org_889_pickpocket(c_info) {
    npc = org_889_coerpresser;
    nr = 900;
    condition = dia_org_889_pickpocket_condition;
    information = dia_org_889_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_889_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_889_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_889_pickpocket);
	info_addchoice(dia_org_889_pickpocket, dialog_back, dia_org_889_pickpocket_back);
	info_addchoice(dia_org_889_pickpocket, dialog_pickpocket, dia_org_889_pickpocket_doit);
};

func void dia_org_889_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_889_pickpocket);
};

func void dia_org_889_pickpocket_back() {
    info_clearchoices(dia_org_889_pickpocket);
};

instance dia_org_950_pickpocket(c_info) {
    npc = org_950_organisator;
    nr = 900;
    condition = dia_org_950_pickpocket_condition;
    information = dia_org_950_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_950_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_950_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_950_pickpocket);
	info_addchoice(dia_org_950_pickpocket, dialog_back, dia_org_950_pickpocket_back);
	info_addchoice(dia_org_950_pickpocket, dialog_pickpocket, dia_org_950_pickpocket_doit);
};

func void dia_org_950_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_950_pickpocket);
};

func void dia_org_950_pickpocket_back() {
    info_clearchoices(dia_org_950_pickpocket);
};

instance dia_org_951_pickpocket(c_info) {
    npc = org_951_organisator;
    nr = 900;
    condition = dia_org_951_pickpocket_condition;
    information = dia_org_951_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_951_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_951_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_951_pickpocket);
	info_addchoice(dia_org_951_pickpocket, dialog_back, dia_org_951_pickpocket_back);
	info_addchoice(dia_org_951_pickpocket, dialog_pickpocket, dia_org_951_pickpocket_doit);
};

func void dia_org_951_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_951_pickpocket);
};

func void dia_org_951_pickpocket_back() {
    info_clearchoices(dia_org_951_pickpocket);
};

instance dia_gorn_pickpocket(c_info) {
    npc = pc_fighter;
    nr = 900;
    condition = dia_gorn_pickpocket_condition;
    information = dia_gorn_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gorn_pickpocket_condition() {
	c_beklauen(20, 40);
};

func void dia_gorn_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gorn_pickpocket);
	info_addchoice(dia_gorn_pickpocket, dialog_back, dia_gorn_pickpocket_back);
	info_addchoice(dia_gorn_pickpocket, dialog_pickpocket, dia_gorn_pickpocket_doit);
};

func void dia_gorn_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gorn_pickpocket);
};

func void dia_gorn_pickpocket_back() {
    info_clearchoices(dia_gorn_pickpocket);
};

instance dia_milten_pickpocket(c_info) {
    npc = pc_mage;
    nr = 900;
    condition = dia_milten_pickpocket_condition;
    information = dia_milten_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_milten_pickpocket_condition() {
	c_beklauen(15, 40);
};

func void dia_milten_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_milten_pickpocket);
	info_addchoice(dia_milten_pickpocket, dialog_back, dia_milten_pickpocket_back);
	info_addchoice(dia_milten_pickpocket, dialog_pickpocket, dia_milten_pickpocket_doit);
};

func void dia_milten_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_milten_pickpocket);
};

func void dia_milten_pickpocket_back() {
    info_clearchoices(dia_milten_pickpocket);
};

instance dia_lester_pickpocket(c_info) {
    npc = pc_psionic;
    nr = 900;
    condition = dia_lester_pickpocket_condition;
    information = dia_lester_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lester_pickpocket_condition() {
	c_beklauen(15, 40);
};

func void dia_lester_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lester_pickpocket);
	info_addchoice(dia_lester_pickpocket, dialog_back, dia_lester_pickpocket_back);
	info_addchoice(dia_lester_pickpocket, dialog_pickpocket, dia_lester_pickpocket_doit);
};

func void dia_lester_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_lester_pickpocket);
};

func void dia_lester_pickpocket_back() {
    info_clearchoices(dia_lester_pickpocket);
};

instance dia_diego_pickpocket(c_info) {
    npc = pc_thief;
    nr = 900;
    condition = dia_diego_pickpocket_condition;
    information = dia_diego_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_diego_pickpocket_condition() {
	c_beklauen(10, 35);
};

func void dia_diego_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_diego_pickpocket);
	info_addchoice(dia_diego_pickpocket, dialog_back, dia_diego_pickpocket_back);
	info_addchoice(dia_diego_pickpocket, dialog_pickpocket, dia_diego_pickpocket_doit);
};

func void dia_diego_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_diego_pickpocket);
};

func void dia_diego_pickpocket_back() {
    info_clearchoices(dia_diego_pickpocket);
};

instance dia_senyan_pickpocket(c_info) {
    npc = sfb_1000_senyan;
    nr = 900;
    condition = dia_senyan_pickpocket_condition;
    information = dia_senyan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_senyan_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 20);
};

func void dia_senyan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_senyan_pickpocket);
	info_addchoice(dia_senyan_pickpocket, dialog_back, dia_senyan_pickpocket_back);
	info_addchoice(dia_senyan_pickpocket, dialog_pickpocket, dia_senyan_pickpocket_doit);
};

func void dia_senyan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_senyan_pickpocket);
};

func void dia_senyan_pickpocket_back() {
    info_clearchoices(dia_senyan_pickpocket);
};

instance dia_sfb_1001_pickpocket(c_info) {
    npc = sfb_1001_schuerfer;
    nr = 900;
    condition = dia_sfb_1001_pickpocket_condition;
    information = dia_sfb_1001_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sfb_1001_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 20);
};

func void dia_sfb_1001_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sfb_1001_pickpocket);
	info_addchoice(dia_sfb_1001_pickpocket, dialog_back, dia_sfb_1001_pickpocket_back);
	info_addchoice(dia_sfb_1001_pickpocket, dialog_pickpocket, dia_sfb_1001_pickpocket_doit);
};

func void dia_sfb_1001_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sfb_1001_pickpocket);
};

func void dia_sfb_1001_pickpocket_back() {
    info_clearchoices(dia_sfb_1001_pickpocket);
};

instance dia_swiney_pickpocket(c_info) {
    npc = sfb_1037_swiney;
    nr = 900;
    condition = dia_swiney_pickpocket_condition;
    information = dia_swiney_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_swiney_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 30);
};

func void dia_swiney_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_swiney_pickpocket);
	info_addchoice(dia_swiney_pickpocket, dialog_back, dia_swiney_pickpocket_back);
	info_addchoice(dia_swiney_pickpocket, dialog_pickpocket, dia_swiney_pickpocket_doit);
};

func void dia_swiney_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_swiney_pickpocket);
};

func void dia_swiney_pickpocket_back() {
    info_clearchoices(dia_swiney_pickpocket);
};

instance dia_roger_pickpocket(c_info) {
    npc = sfb_1040_schuerfer;
    nr = 900;
    condition = dia_roger_pickpocket_condition;
    information = dia_roger_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_roger_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 20);
};

func void dia_roger_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_roger_pickpocket);
	info_addchoice(dia_roger_pickpocket, dialog_back, dia_roger_pickpocket_back);
	info_addchoice(dia_roger_pickpocket, dialog_pickpocket, dia_roger_pickpocket_doit);
};

func void dia_roger_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_roger_pickpocket);
};

func void dia_roger_pickpocket_back() {
    info_clearchoices(dia_roger_pickpocket);
};

instance dia_casper_pickpocket(c_info) {
    npc = sfb_40011_casper;
    nr = 900;
    condition = dia_casper_pickpocket_condition;
    information = dia_casper_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_casper_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 25);
};

func void dia_casper_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_casper_pickpocket);
	info_addchoice(dia_casper_pickpocket, dialog_back, dia_casper_pickpocket_back);
	info_addchoice(dia_casper_pickpocket, dialog_pickpocket, dia_casper_pickpocket_doit);
};

func void dia_casper_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_casper_pickpocket);
};

func void dia_casper_pickpocket_back() {
    info_clearchoices(dia_casper_pickpocket);
};

instance dia_douglas_pickpocket(c_info) {
    npc = sfb_40046_douglas;
    nr = 900;
    condition = dia_douglas_pickpocket_condition;
    information = dia_douglas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_douglas_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 30);
};

func void dia_douglas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_douglas_pickpocket);
	info_addchoice(dia_douglas_pickpocket, dialog_back, dia_douglas_pickpocket_back);
	info_addchoice(dia_douglas_pickpocket, dialog_pickpocket, dia_douglas_pickpocket_doit);
};

func void dia_douglas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_douglas_pickpocket);
};

func void dia_douglas_pickpocket_back() {
    info_clearchoices(dia_douglas_pickpocket);
};

instance dia_ziggy_pickpocket(c_info) {
    npc = sfb_40063_ziggy;
    nr = 900;
    condition = dia_ziggy_pickpocket_condition;
    information = dia_ziggy_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ziggy_pickpocket_condition() {
	c_beklauen(baseThfChanceSFB, 20);
};

func void dia_ziggy_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ziggy_pickpocket);
	info_addchoice(dia_ziggy_pickpocket, dialog_back, dia_ziggy_pickpocket_back);
	info_addchoice(dia_ziggy_pickpocket, dialog_pickpocket, dia_ziggy_pickpocket_doit);
};

func void dia_ziggy_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ziggy_pickpocket);
};

func void dia_ziggy_pickpocket_back() {
    info_clearchoices(dia_ziggy_pickpocket);
};

instance dia_stuart_pickpocket(c_info) {
    npc = sld_40047_stuart;
    nr = 900;
    condition = dia_stuart_pickpocket_condition;
    information = dia_stuart_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stuart_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_stuart_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stuart_pickpocket);
	info_addchoice(dia_stuart_pickpocket, dialog_back, dia_stuart_pickpocket_back);
	info_addchoice(dia_stuart_pickpocket, dialog_pickpocket, dia_stuart_pickpocket_doit);
};

func void dia_stuart_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stuart_pickpocket);
};

func void dia_stuart_pickpocket_back() {
    info_clearchoices(dia_stuart_pickpocket);
};

instance dia_fritz_pickpocket(c_info) {
    npc = sld_40064_fritz;
    nr = 900;
    condition = dia_fritz_pickpocket_condition;
    information = dia_fritz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fritz_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_fritz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fritz_pickpocket);
	info_addchoice(dia_fritz_pickpocket, dialog_back, dia_fritz_pickpocket_back);
	info_addchoice(dia_fritz_pickpocket, dialog_pickpocket, dia_fritz_pickpocket_doit);
};

func void dia_fritz_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fritz_pickpocket);
};

func void dia_fritz_pickpocket_back() {
    info_clearchoices(dia_fritz_pickpocket);
};

instance dia_florian_pickpocket(c_info) {
    npc = sld_40070_florian;
    nr = 900;
    condition = dia_florian_pickpocket_condition;
    information = dia_florian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_florian_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_florian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_florian_pickpocket);
	info_addchoice(dia_florian_pickpocket, dialog_back, dia_florian_pickpocket_back);
	info_addchoice(dia_florian_pickpocket, dialog_pickpocket, dia_florian_pickpocket_doit);
};

func void dia_florian_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_florian_pickpocket);
};

func void dia_florian_pickpocket_back() {
    info_clearchoices(dia_florian_pickpocket);
};

instance dia_pascal_pickpocket(c_info) {
    npc = sld_40129_pascal;
    nr = 900;
    condition = dia_pascal_pickpocket_condition;
    information = dia_pascal_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pascal_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_pascal_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pascal_pickpocket);
	info_addchoice(dia_pascal_pickpocket, dialog_back, dia_pascal_pickpocket_back);
	info_addchoice(dia_pascal_pickpocket, dialog_pickpocket, dia_pascal_pickpocket_doit);
};

func void dia_pascal_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pascal_pickpocket);
};

func void dia_pascal_pickpocket_back() {
    info_clearchoices(dia_pascal_pickpocket);
};

instance dia_zerron_pickpocket(c_info) {
    npc = sld_40130_zerron;
    nr = 900;
    condition = dia_zerron_pickpocket_condition;
    information = dia_zerron_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_zerron_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_zerron_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_zerron_pickpocket);
	info_addchoice(dia_zerron_pickpocket, dialog_back, dia_zerron_pickpocket_back);
	info_addchoice(dia_zerron_pickpocket, dialog_pickpocket, dia_zerron_pickpocket_doit);
};

func void dia_zerron_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_zerron_pickpocket);
};

func void dia_zerron_pickpocket_back() {
    info_clearchoices(dia_zerron_pickpocket);
};

instance dia_sld_40167_pickpocket(c_info) {
    npc = sld_40167_najemnik;
    nr = 900;
    condition = dia_sld_40167_pickpocket_condition;
    information = dia_sld_40167_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_40167_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_sld_40167_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_40167_pickpocket);
	info_addchoice(dia_sld_40167_pickpocket, dialog_back, dia_sld_40167_pickpocket_back);
	info_addchoice(dia_sld_40167_pickpocket, dialog_pickpocket, dia_sld_40167_pickpocket_doit);
};

func void dia_sld_40167_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_40167_pickpocket);
};

func void dia_sld_40167_pickpocket_back() {
    info_clearchoices(dia_sld_40167_pickpocket);
};

instance dia_lee_pickpocket(c_info) {
    npc = sld_700_lee;
    nr = 900;
    condition = dia_lee_pickpocket_condition;
    information = dia_lee_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lee_pickpocket_condition() {
	c_beklauen(10, 50);
};

func void dia_lee_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lee_pickpocket);
	info_addchoice(dia_lee_pickpocket, dialog_back, dia_lee_pickpocket_back);
	info_addchoice(dia_lee_pickpocket, dialog_pickpocket, dia_lee_pickpocket_doit);
};

func void dia_lee_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_lee_pickpocket);
};

func void dia_lee_pickpocket_back() {
    info_clearchoices(dia_lee_pickpocket);
};

instance dia_orik_pickpocket(c_info) {
    npc = sld_701_orik;
    nr = 900;
    condition = dia_orik_pickpocket_condition;
    information = dia_orik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_orik_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 40);
};

func void dia_orik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_orik_pickpocket);
	info_addchoice(dia_orik_pickpocket, dialog_back, dia_orik_pickpocket_back);
	info_addchoice(dia_orik_pickpocket, dialog_pickpocket, dia_orik_pickpocket_doit);
};

func void dia_orik_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_orik_pickpocket);
};

func void dia_orik_pickpocket_back() {
    info_clearchoices(dia_orik_pickpocket);
};

instance dia_sld_702_pickpocket(c_info) {
    npc = sld_702_soeldner;
    nr = 900;
    condition = dia_sld_702_pickpocket_condition;
    information = dia_sld_702_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_702_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_702_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_702_pickpocket);
	info_addchoice(dia_sld_702_pickpocket, dialog_back, dia_sld_702_pickpocket_back);
	info_addchoice(dia_sld_702_pickpocket, dialog_pickpocket, dia_sld_702_pickpocket_doit);
};

func void dia_sld_702_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_702_pickpocket);
};

func void dia_sld_702_pickpocket_back() {
    info_clearchoices(dia_sld_702_pickpocket);
};

instance dia_blade_pickpocket(c_info) {
    npc = sld_704_blade;
    nr = 900;
    condition = dia_blade_pickpocket_condition;
    information = dia_blade_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_blade_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_blade_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_blade_pickpocket);
	info_addchoice(dia_blade_pickpocket, dialog_back, dia_blade_pickpocket_back);
	info_addchoice(dia_blade_pickpocket, dialog_pickpocket, dia_blade_pickpocket_doit);
};

func void dia_blade_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_blade_pickpocket);
};

func void dia_blade_pickpocket_back() {
    info_clearchoices(dia_blade_pickpocket);
};

instance dia_cord_pickpocket(c_info) {
    npc = sld_709_cord;
    nr = 900;
    condition = dia_cord_pickpocket_condition;
    information = dia_cord_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cord_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_cord_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cord_pickpocket);
	info_addchoice(dia_cord_pickpocket, dialog_back, dia_cord_pickpocket_back);
	info_addchoice(dia_cord_pickpocket, dialog_pickpocket, dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back() {
    info_clearchoices(dia_cord_pickpocket);
};

instance dia_jarvis_pickpocket(c_info) {
    npc = sld_728_jarvis;
    nr = 900;
    condition = dia_jarvis_pickpocket_condition;
    information = dia_jarvis_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jarvis_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_jarvis_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jarvis_pickpocket);
	info_addchoice(dia_jarvis_pickpocket, dialog_back, dia_jarvis_pickpocket_back);
	info_addchoice(dia_jarvis_pickpocket, dialog_pickpocket, dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back() {
    info_clearchoices(dia_jarvis_pickpocket);
};

instance dia_sld_732_pickpocket(c_info) {
    npc = sld_732_soeldner;
    nr = 900;
    condition = dia_sld_732_pickpocket_condition;
    information = dia_sld_732_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_732_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_732_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_732_pickpocket);
	info_addchoice(dia_sld_732_pickpocket, dialog_back, dia_sld_732_pickpocket_back);
	info_addchoice(dia_sld_732_pickpocket, dialog_pickpocket, dia_sld_732_pickpocket_doit);
};

func void dia_sld_732_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_732_pickpocket);
};

func void dia_sld_732_pickpocket_back() {
    info_clearchoices(dia_sld_732_pickpocket);
};

instance dia_torlof_pickpocket(c_info) {
    npc = sld_737_torlof;
    nr = 900;
    condition = dia_torlof_pickpocket_condition;
    information = dia_torlof_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_torlof_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_torlof_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_torlof_pickpocket);
	info_addchoice(dia_torlof_pickpocket, dialog_back, dia_torlof_pickpocket_back);
	info_addchoice(dia_torlof_pickpocket, dialog_pickpocket, dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back() {
    info_clearchoices(dia_torlof_pickpocket);
};

instance dia_sld_751_pickpocket(c_info) {
    npc = sld_751_soeldner;
    nr = 900;
    condition = dia_sld_751_pickpocket_condition;
    information = dia_sld_751_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_751_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_751_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_751_pickpocket);
	info_addchoice(dia_sld_751_pickpocket, dialog_back, dia_sld_751_pickpocket_back);
	info_addchoice(dia_sld_751_pickpocket, dialog_pickpocket, dia_sld_751_pickpocket_doit);
};

func void dia_sld_751_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_751_pickpocket);
};

func void dia_sld_751_pickpocket_back() {
    info_clearchoices(dia_sld_751_pickpocket);
};

instance dia_okyl_pickpocket(c_info) {
    npc = sld_752_okyl;
    nr = 900;
    condition = dia_okyl_pickpocket_condition;
    information = dia_okyl_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_okyl_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_okyl_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_okyl_pickpocket);
	info_addchoice(dia_okyl_pickpocket, dialog_back, dia_okyl_pickpocket_back);
	info_addchoice(dia_okyl_pickpocket, dialog_pickpocket, dia_okyl_pickpocket_doit);
};

func void dia_okyl_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_okyl_pickpocket);
};

func void dia_okyl_pickpocket_back() {
    info_clearchoices(dia_okyl_pickpocket);
};

instance dia_baloro_pickpocket(c_info) {
    npc = sld_753_baloro;
    nr = 900;
    condition = dia_baloro_pickpocket_condition;
    information = dia_baloro_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baloro_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_baloro_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baloro_pickpocket);
	info_addchoice(dia_baloro_pickpocket, dialog_back, dia_baloro_pickpocket_back);
	info_addchoice(dia_baloro_pickpocket, dialog_pickpocket, dia_baloro_pickpocket_doit);
};

func void dia_baloro_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baloro_pickpocket);
};

func void dia_baloro_pickpocket_back() {
    info_clearchoices(dia_baloro_pickpocket);
};

instance dia_sld_760_pickpocket(c_info) {
    npc = sld_760_soeldner;
    nr = 900;
    condition = dia_sld_760_pickpocket_condition;
    information = dia_sld_760_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_760_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_760_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_760_pickpocket);
	info_addchoice(dia_sld_760_pickpocket, dialog_back, dia_sld_760_pickpocket_back);
	info_addchoice(dia_sld_760_pickpocket, dialog_pickpocket, dia_sld_760_pickpocket_doit);
};

func void dia_sld_760_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_760_pickpocket);
};

func void dia_sld_760_pickpocket_back() {
    info_clearchoices(dia_sld_760_pickpocket);
};

instance dia_sld_761_pickpocket(c_info) {
    npc = sld_761_soeldner;
    nr = 900;
    condition = dia_sld_761_pickpocket_condition;
    information = dia_sld_761_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_761_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_761_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_761_pickpocket);
	info_addchoice(dia_sld_761_pickpocket, dialog_back, dia_sld_761_pickpocket_back);
	info_addchoice(dia_sld_761_pickpocket, dialog_pickpocket, dia_sld_761_pickpocket_doit);
};

func void dia_sld_761_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sld_761_pickpocket);
};

func void dia_sld_761_pickpocket_back() {
    info_clearchoices(dia_sld_761_pickpocket);
};

instance dia_flint_pickpocket(c_info) {
    npc = stt_2046_flint;
    nr = 900;
    condition = dia_flint_pickpocket_condition;
    information = dia_flint_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_flint_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_flint_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_flint_pickpocket);
	info_addchoice(dia_flint_pickpocket, dialog_back, dia_flint_pickpocket_back);
	info_addchoice(dia_flint_pickpocket, dialog_pickpocket, dia_flint_pickpocket_doit);
};

func void dia_flint_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_flint_pickpocket);
};

func void dia_flint_pickpocket_back() {
    info_clearchoices(dia_flint_pickpocket);
};

instance dia_jim_pickpocket(c_info) {
    npc = stt_2077_jim;
    nr = 900;
    condition = dia_jim_pickpocket_condition;
    information = dia_jim_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jim_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT - 5, 40);
};

func void dia_jim_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jim_pickpocket);
	info_addchoice(dia_jim_pickpocket, dialog_back, dia_jim_pickpocket_back);
	info_addchoice(dia_jim_pickpocket, dialog_pickpocket, dia_jim_pickpocket_doit);
};

func void dia_jim_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jim_pickpocket);
};

func void dia_jim_pickpocket_back() {
    info_clearchoices(dia_jim_pickpocket);
};

instance dia_stt_2080_pickpocket(c_info) {
    npc = stt_2080_kdf_nov;
    nr = 900;
    condition = dia_stt_2080_pickpocket_condition;
    information = dia_stt_2080_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_2080_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 40);
};

func void dia_stt_2080_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_2080_pickpocket);
	info_addchoice(dia_stt_2080_pickpocket, dialog_back, dia_stt_2080_pickpocket_back);
	info_addchoice(dia_stt_2080_pickpocket, dialog_pickpocket, dia_stt_2080_pickpocket_doit);
};

func void dia_stt_2080_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_2080_pickpocket);
};

func void dia_stt_2080_pickpocket_back() {
    info_clearchoices(dia_stt_2080_pickpocket);
};

instance dia_alberto_pickpocket(c_info) {
    npc = stt_300_alberto;
    nr = 900;
    condition = dia_alberto_pickpocket_condition;
    information = dia_alberto_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_alberto_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 40);
};

func void dia_alberto_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_alberto_pickpocket);
	info_addchoice(dia_alberto_pickpocket, dialog_back, dia_alberto_pickpocket_back);
	info_addchoice(dia_alberto_pickpocket, dialog_pickpocket, dia_alberto_pickpocket_doit);
};

func void dia_alberto_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_alberto_pickpocket);
};

func void dia_alberto_pickpocket_back() {
    info_clearchoices(dia_alberto_pickpocket);
};

instance dia_ian_pickpocket(c_info) {
    npc = stt_301_ian;
    nr = 900;
    condition = dia_ian_pickpocket_condition;
    information = dia_ian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ian_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT - 10, 30);
};

func void dia_ian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ian_pickpocket);
	info_addchoice(dia_ian_pickpocket, dialog_back, dia_ian_pickpocket_back);
	info_addchoice(dia_ian_pickpocket, dialog_pickpocket, dia_ian_pickpocket_doit);
};

func void dia_ian_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ian_pickpocket);
};

func void dia_ian_pickpocket_back() {
    info_clearchoices(dia_ian_pickpocket);
};

instance dia_viper_pickpocket(c_info) {
    npc = stt_302_viper;
    nr = 900;
    condition = dia_viper_pickpocket_condition;
    information = dia_viper_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_viper_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_viper_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_viper_pickpocket);
	info_addchoice(dia_viper_pickpocket, dialog_back, dia_viper_pickpocket_back);
	info_addchoice(dia_viper_pickpocket, dialog_pickpocket, dia_viper_pickpocket_doit);
};

func void dia_viper_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_viper_pickpocket);
};

func void dia_viper_pickpocket_back() {
    info_clearchoices(dia_viper_pickpocket);
};

instance dia_whistler_pickpocket(c_info) {
    npc = stt_309_whistler;
    nr = 900;
    condition = dia_whistler_pickpocket_condition;
    information = dia_whistler_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_whistler_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_whistler_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_whistler_pickpocket);
	info_addchoice(dia_whistler_pickpocket, dialog_back, dia_whistler_pickpocket_back);
	info_addchoice(dia_whistler_pickpocket, dialog_pickpocket, dia_whistler_pickpocket_doit);
};

func void dia_whistler_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_whistler_pickpocket);
};

func void dia_whistler_pickpocket_back() {
    info_clearchoices(dia_whistler_pickpocket);
};

instance dia_fisk_pickpocket(c_info) {
    npc = stt_311_fisk;
    nr = 900;
    condition = dia_fisk_pickpocket_condition;
    information = dia_fisk_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fisk_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_fisk_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fisk_pickpocket);
	info_addchoice(dia_fisk_pickpocket, dialog_back, dia_fisk_pickpocket_back);
	info_addchoice(dia_fisk_pickpocket, dialog_pickpocket, dia_fisk_pickpocket_doit);
};

func void dia_fisk_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fisk_pickpocket);
};

func void dia_fisk_pickpocket_back() {
    info_clearchoices(dia_fisk_pickpocket);
};

instance dia_ralph_pickpocket(c_info) {
    npc = stt_313_schatten;
    nr = 900;
    condition = dia_ralph_pickpocket_condition;
    information = dia_ralph_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ralph_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_ralph_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ralph_pickpocket);
	info_addchoice(dia_ralph_pickpocket, dialog_back, dia_ralph_pickpocket_back);
	info_addchoice(dia_ralph_pickpocket, dialog_pickpocket, dia_ralph_pickpocket_doit);
};

func void dia_ralph_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ralph_pickpocket);
};

func void dia_ralph_pickpocket_back() {
    info_clearchoices(dia_ralph_pickpocket);
};

instance dia_sly_pickpocket(c_info) {
    npc = stt_315_sly;
    nr = 900;
    condition = dia_sly_pickpocket_condition;
    information = dia_sly_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sly_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_sly_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sly_pickpocket);
	info_addchoice(dia_sly_pickpocket, dialog_back, dia_sly_pickpocket_back);
	info_addchoice(dia_sly_pickpocket, dialog_pickpocket, dia_sly_pickpocket_doit);
};

func void dia_sly_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_sly_pickpocket);
};

func void dia_sly_pickpocket_back() {
    info_clearchoices(dia_sly_pickpocket);
};

instance dia_stt_316_pickpocket(c_info) {
    npc = stt_316_schatten;
    nr = 900;
    condition = dia_stt_316_pickpocket_condition;
    information = dia_stt_316_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_316_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_316_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_316_pickpocket);
	info_addchoice(dia_stt_316_pickpocket, dialog_back, dia_stt_316_pickpocket_back);
	info_addchoice(dia_stt_316_pickpocket, dialog_pickpocket, dia_stt_316_pickpocket_doit);
};

func void dia_stt_316_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_316_pickpocket);
};

func void dia_stt_316_pickpocket_back() {
    info_clearchoices(dia_stt_316_pickpocket);
};

instance dia_stt_322_pickpocket(c_info) {
    npc = stt_322_schatten;
    nr = 900;
    condition = dia_stt_322_pickpocket_condition;
    information = dia_stt_322_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_322_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_322_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_322_pickpocket);
	info_addchoice(dia_stt_322_pickpocket, dialog_back, dia_stt_322_pickpocket_back);
	info_addchoice(dia_stt_322_pickpocket, dialog_pickpocket, dia_stt_322_pickpocket_doit);
};

func void dia_stt_322_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_322_pickpocket);
};

func void dia_stt_322_pickpocket_back() {
    info_clearchoices(dia_stt_322_pickpocket);
};

instance dia_balam_pickpocket(c_info) {
    npc = stt_324_balam;
    nr = 900;
    condition = dia_balam_pickpocket_condition;
    information = dia_balam_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_balam_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_balam_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_balam_pickpocket);
	info_addchoice(dia_balam_pickpocket, dialog_back, dia_balam_pickpocket_back);
	info_addchoice(dia_balam_pickpocket, dialog_pickpocket, dia_balam_pickpocket_doit);
};

func void dia_balam_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_balam_pickpocket);
};

func void dia_balam_pickpocket_back() {
    info_clearchoices(dia_balam_pickpocket);
};

instance dia_omid_pickpocket(c_info) {
    npc = stt_325_omid;
    nr = 900;
    condition = dia_omid_pickpocket_condition;
    information = dia_omid_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_omid_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_omid_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_omid_pickpocket);
	info_addchoice(dia_omid_pickpocket, dialog_back, dia_omid_pickpocket_back);
	info_addchoice(dia_omid_pickpocket, dialog_pickpocket, dia_omid_pickpocket_doit);
};

func void dia_omid_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_omid_pickpocket);
};

func void dia_omid_pickpocket_back() {
    info_clearchoices(dia_omid_pickpocket);
};

instance dia_dexter_pickpocket(c_info) {
    npc = stt_329_dexter;
    nr = 900;
    condition = dia_dexter_pickpocket_condition;
    information = dia_dexter_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dexter_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_dexter_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dexter_pickpocket);
	info_addchoice(dia_dexter_pickpocket, dialog_back, dia_dexter_pickpocket_back);
	info_addchoice(dia_dexter_pickpocket, dialog_pickpocket, dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back() {
    info_clearchoices(dia_dexter_pickpocket);
};

instance dia_fingers_pickpocket(c_info) {
    npc = stt_331_fingers;
    nr = 900;
    condition = dia_fingers_pickpocket_condition;
    information = dia_fingers_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fingers_pickpocket_condition() {
	c_beklauen(5, 45);
};

func void dia_fingers_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fingers_pickpocket);
	info_addchoice(dia_fingers_pickpocket, dialog_back, dia_fingers_pickpocket_back);
	info_addchoice(dia_fingers_pickpocket, dialog_pickpocket, dia_fingers_pickpocket_doit);
};

func void dia_fingers_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fingers_pickpocket);
};

func void dia_fingers_pickpocket_back() {
    info_clearchoices(dia_fingers_pickpocket);
};

instance dia_santino_pickpocket(c_info) {
    npc = stt_335_santino;
    nr = 900;
    condition = dia_santino_pickpocket_condition;
    information = dia_santino_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_santino_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_santino_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_santino_pickpocket);
	info_addchoice(dia_santino_pickpocket, dialog_back, dia_santino_pickpocket_back);
	info_addchoice(dia_santino_pickpocket, dialog_pickpocket, dia_santino_pickpocket_doit);
};

func void dia_santino_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_santino_pickpocket);
};

func void dia_santino_pickpocket_back() {
    info_clearchoices(dia_santino_pickpocket);
};

instance dia_cavalorn_pickpocket(c_info) {
    npc = stt_336_cavalorn;
    nr = 900;
    condition = dia_cavalorn_pickpocket_condition;
    information = dia_cavalorn_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cavalorn_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT - 5, 30);
};

func void dia_cavalorn_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cavalorn_pickpocket);
	info_addchoice(dia_cavalorn_pickpocket, dialog_back, dia_cavalorn_pickpocket_back);
	info_addchoice(dia_cavalorn_pickpocket, dialog_pickpocket, dia_cavalorn_pickpocket_doit);
};

func void dia_cavalorn_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cavalorn_pickpocket);
};

func void dia_cavalorn_pickpocket_back() {
    info_clearchoices(dia_cavalorn_pickpocket);
};

instance dia_stt_3918_pickpocket(c_info) {
    npc = stt_3918_polykacz;
    nr = 900;
    condition = dia_stt_3918_pickpocket_condition;
    information = dia_stt_3918_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_3918_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_3918_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_3918_pickpocket);
	info_addchoice(dia_stt_3918_pickpocket, dialog_back, dia_stt_3918_pickpocket_back);
	info_addchoice(dia_stt_3918_pickpocket, dialog_pickpocket, dia_stt_3918_pickpocket_doit);
};

func void dia_stt_3918_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_3918_pickpocket);
};

func void dia_stt_3918_pickpocket_back() {
    info_clearchoices(dia_stt_3918_pickpocket);
};

instance dia_stt_3919_pickpocket(c_info) {
    npc = stt_3919_polykacz;
    nr = 900;
    condition = dia_stt_3919_pickpocket_condition;
    information = dia_stt_3919_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_3919_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_stt_3919_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_3919_pickpocket);
	info_addchoice(dia_stt_3919_pickpocket, dialog_back, dia_stt_3919_pickpocket_back);
	info_addchoice(dia_stt_3919_pickpocket, dialog_pickpocket, dia_stt_3919_pickpocket_doit);
};

func void dia_stt_3919_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_3919_pickpocket);
};

func void dia_stt_3919_pickpocket_back() {
    info_clearchoices(dia_stt_3919_pickpocket);
};

instance dia_perrick_pickpocket(c_info) {
    npc = stt_40052_perrick;
    nr = 900;
    condition = dia_perrick_pickpocket_condition;
    information = dia_perrick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_perrick_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_perrick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_perrick_pickpocket);
	info_addchoice(dia_perrick_pickpocket, dialog_back, dia_perrick_pickpocket_back);
	info_addchoice(dia_perrick_pickpocket, dialog_pickpocket, dia_perrick_pickpocket_doit);
};

func void dia_perrick_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_perrick_pickpocket);
};

func void dia_perrick_pickpocket_back() {
    info_clearchoices(dia_perrick_pickpocket);
};

instance dia_robin_pickpocket(c_info) {
    npc = stt_40066_robin;
    nr = 900;
    condition = dia_robin_pickpocket_condition;
    information = dia_robin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_robin_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_robin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_robin_pickpocket);
	info_addchoice(dia_robin_pickpocket, dialog_back, dia_robin_pickpocket_back);
	info_addchoice(dia_robin_pickpocket, dialog_pickpocket, dia_robin_pickpocket_doit);
};

func void dia_robin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_robin_pickpocket);
};

func void dia_robin_pickpocket_back() {
    info_clearchoices(dia_robin_pickpocket);
};

instance dia_hargos_pickpocket(c_info) {
    npc = stt_40143_hargos;
    nr = 900;
    condition = dia_hargos_pickpocket_condition;
    information = dia_hargos_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hargos_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_hargos_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hargos_pickpocket);
	info_addchoice(dia_hargos_pickpocket, dialog_back, dia_hargos_pickpocket_back);
	info_addchoice(dia_hargos_pickpocket, dialog_pickpocket, dia_hargos_pickpocket_doit);
};

func void dia_hargos_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_hargos_pickpocket);
};

func void dia_hargos_pickpocket_back() {
    info_clearchoices(dia_hargos_pickpocket);
};

instance dia_lorenzo_pickpocket(c_info) {
    npc = stt_5013_lorenzo;
    nr = 900;
    condition = dia_lorenzo_pickpocket_condition;
    information = dia_lorenzo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_lorenzo_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 35);
};

func void dia_lorenzo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_lorenzo_pickpocket);
	info_addchoice(dia_lorenzo_pickpocket, dialog_back, dia_lorenzo_pickpocket_back);
	info_addchoice(dia_lorenzo_pickpocket, dialog_pickpocket, dia_lorenzo_pickpocket_doit);
};

func void dia_lorenzo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_lorenzo_pickpocket);
};

func void dia_lorenzo_pickpocket_back() {
    info_clearchoices(dia_lorenzo_pickpocket);
};

instance dia_gornabar_pickpocket(c_info) {
    npc = tpl_1400_gornabar;
    nr = 900;
    condition = dia_gornabar_pickpocket_condition;
    information = dia_gornabar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornabar_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornabar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornabar_pickpocket);
	info_addchoice(dia_gornabar_pickpocket, dialog_back, dia_gornabar_pickpocket_back);
	info_addchoice(dia_gornabar_pickpocket, dialog_pickpocket, dia_gornabar_pickpocket_doit);
};

func void dia_gornabar_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornabar_pickpocket);
};

func void dia_gornabar_pickpocket_back() {
    info_clearchoices(dia_gornabar_pickpocket);
};

instance dia_gornakosh_pickpocket(c_info) {
    npc = tpl_1401_gornakosh;
    nr = 900;
    condition = dia_gornakosh_pickpocket_condition;
    information = dia_gornakosh_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornakosh_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornakosh_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornakosh_pickpocket);
	info_addchoice(dia_gornakosh_pickpocket, dialog_back, dia_gornakosh_pickpocket_back);
	info_addchoice(dia_gornakosh_pickpocket, dialog_pickpocket, dia_gornakosh_pickpocket_doit);
};

func void dia_gornakosh_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornakosh_pickpocket);
};

func void dia_gornakosh_pickpocket_back() {
    info_clearchoices(dia_gornakosh_pickpocket);
};

instance dia_gornatoth_pickpocket(c_info) {
    npc = tpl_1402_gornatoth;
    nr = 900;
    condition = dia_gornatoth_pickpocket_condition;
    information = dia_gornatoth_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornatoth_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornatoth_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornatoth_pickpocket);
	info_addchoice(dia_gornatoth_pickpocket, dialog_back, dia_gornatoth_pickpocket_back);
	info_addchoice(dia_gornatoth_pickpocket, dialog_pickpocket, dia_gornatoth_pickpocket_doit);
};

func void dia_gornatoth_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornatoth_pickpocket);
};

func void dia_gornatoth_pickpocket_back() {
    info_clearchoices(dia_gornatoth_pickpocket);
};

instance dia_gornaran_pickpocket(c_info) {
    npc = tpl_1405_gornaran;
    nr = 900;
    condition = dia_gornaran_pickpocket_condition;
    information = dia_gornaran_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornaran_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornaran_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornaran_pickpocket);
	info_addchoice(dia_gornaran_pickpocket, dialog_back, dia_gornaran_pickpocket_back);
	info_addchoice(dia_gornaran_pickpocket, dialog_pickpocket, dia_gornaran_pickpocket_doit);
};

func void dia_gornaran_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornaran_pickpocket);
};

func void dia_gornaran_pickpocket_back() {
    info_clearchoices(dia_gornaran_pickpocket);
};

instance dia_kalomsguard_pickpocket(c_info) {
    npc = tpl_1406_templer;
    nr = 900;
    condition = dia_kalomsguard_pickpocket_condition;
    information = dia_kalomsguard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kalomsguard_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_kalomsguard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kalomsguard_pickpocket);
	info_addchoice(dia_kalomsguard_pickpocket, dialog_back, dia_kalomsguard_pickpocket_back);
	info_addchoice(dia_kalomsguard_pickpocket, dialog_pickpocket, dia_kalomsguard_pickpocket_doit);
};

func void dia_kalomsguard_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kalomsguard_pickpocket);
};

func void dia_kalomsguard_pickpocket_back() {
    info_clearchoices(dia_kalomsguard_pickpocket);
};

instance dia_tpl_1408_pickpocket(c_info) {
    npc = tpl_1408_templer;
    nr = 900;
    condition = dia_tpl_1408_pickpocket_condition;
    information = dia_tpl_1408_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1408_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1408_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1408_pickpocket);
	info_addchoice(dia_tpl_1408_pickpocket, dialog_back, dia_tpl_1408_pickpocket_back);
	info_addchoice(dia_tpl_1408_pickpocket, dialog_pickpocket, dia_tpl_1408_pickpocket_doit);
};

func void dia_tpl_1408_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1408_pickpocket);
};

func void dia_tpl_1408_pickpocket_back() {
    info_clearchoices(dia_tpl_1408_pickpocket);
};

instance dia_tpl_1411_pickpocket(c_info) {
    npc = tpl_1411_templer;
    nr = 900;
    condition = dia_tpl_1411_pickpocket_condition;
    information = dia_tpl_1411_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1411_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1411_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1411_pickpocket);
	info_addchoice(dia_tpl_1411_pickpocket, dialog_back, dia_tpl_1411_pickpocket_back);
	info_addchoice(dia_tpl_1411_pickpocket, dialog_pickpocket, dia_tpl_1411_pickpocket_doit);
};

func void dia_tpl_1411_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1411_pickpocket);
};

func void dia_tpl_1411_pickpocket_back() {
    info_clearchoices(dia_tpl_1411_pickpocket);
};

instance dia_tpl_1412_pickpocket(c_info) {
    npc = tpl_1412_templer;
    nr = 900;
    condition = dia_tpl_1412_pickpocket_condition;
    information = dia_tpl_1412_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1412_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1412_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1412_pickpocket);
	info_addchoice(dia_tpl_1412_pickpocket, dialog_back, dia_tpl_1412_pickpocket_back);
	info_addchoice(dia_tpl_1412_pickpocket, dialog_pickpocket, dia_tpl_1412_pickpocket_doit);
};

func void dia_tpl_1412_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1412_pickpocket);
};

func void dia_tpl_1412_pickpocket_back() {
    info_clearchoices(dia_tpl_1412_pickpocket);
};

instance dia_tpl_1414_pickpocket(c_info) {
    npc = tpl_1414_templer;
    nr = 900;
    condition = dia_tpl_1414_pickpocket_condition;
    information = dia_tpl_1414_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1414_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1414_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1414_pickpocket);
	info_addchoice(dia_tpl_1414_pickpocket, dialog_back, dia_tpl_1414_pickpocket_back);
	info_addchoice(dia_tpl_1414_pickpocket, dialog_pickpocket, dia_tpl_1414_pickpocket_doit);
};

func void dia_tpl_1414_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1414_pickpocket);
};

func void dia_tpl_1414_pickpocket_back() {
    info_clearchoices(dia_tpl_1414_pickpocket);
};

instance dia_tpl_1415_pickpocket(c_info) {
    npc = tpl_1415_templer;
    nr = 900;
    condition = dia_tpl_1415_pickpocket_condition;
    information = dia_tpl_1415_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1415_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1415_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1415_pickpocket);
	info_addchoice(dia_tpl_1415_pickpocket, dialog_back, dia_tpl_1415_pickpocket_back);
	info_addchoice(dia_tpl_1415_pickpocket, dialog_pickpocket, dia_tpl_1415_pickpocket_doit);
};

func void dia_tpl_1415_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1415_pickpocket);
};

func void dia_tpl_1415_pickpocket_back() {
    info_clearchoices(dia_tpl_1415_pickpocket);
};

instance dia_tpl_1416_pickpocket(c_info) {
    npc = tpl_1416_templer;
    nr = 900;
    condition = dia_tpl_1416_pickpocket_condition;
    information = dia_tpl_1416_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1416_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1416_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1416_pickpocket);
	info_addchoice(dia_tpl_1416_pickpocket, dialog_back, dia_tpl_1416_pickpocket_back);
	info_addchoice(dia_tpl_1416_pickpocket, dialog_pickpocket, dia_tpl_1416_pickpocket_doit);
};

func void dia_tpl_1416_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1416_pickpocket);
};

func void dia_tpl_1416_pickpocket_back() {
    info_clearchoices(dia_tpl_1416_pickpocket);
};

instance dia_tpl_1419_pickpocket(c_info) {
    npc = tpl_1419_templer;
    nr = 900;
    condition = dia_tpl_1419_pickpocket_condition;
    information = dia_tpl_1419_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1419_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1419_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1419_pickpocket);
	info_addchoice(dia_tpl_1419_pickpocket, dialog_back, dia_tpl_1419_pickpocket_back);
	info_addchoice(dia_tpl_1419_pickpocket, dialog_pickpocket, dia_tpl_1419_pickpocket_doit);
};

func void dia_tpl_1419_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1419_pickpocket);
};

func void dia_tpl_1419_pickpocket_back() {
    info_clearchoices(dia_tpl_1419_pickpocket);
};

instance dia_gornavid_pickpocket(c_info) {
    npc = tpl_1433_gornavid;
    nr = 900;
    condition = dia_gornavid_pickpocket_condition;
    information = dia_gornavid_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornavid_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornavid_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornavid_pickpocket);
	info_addchoice(dia_gornavid_pickpocket, dialog_back, dia_gornavid_pickpocket_back);
	info_addchoice(dia_gornavid_pickpocket, dialog_pickpocket, dia_gornavid_pickpocket_doit);
};

func void dia_gornavid_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornavid_pickpocket);
};

func void dia_gornavid_pickpocket_back() {
    info_clearchoices(dia_gornavid_pickpocket);
};

instance dia_tpl_1436_pickpocket(c_info) {
    npc = tpl_1436_templer;
    nr = 900;
    condition = dia_tpl_1436_pickpocket_condition;
    information = dia_tpl_1436_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1436_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1436_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1436_pickpocket);
	info_addchoice(dia_tpl_1436_pickpocket, dialog_back, dia_tpl_1436_pickpocket_back);
	info_addchoice(dia_tpl_1436_pickpocket, dialog_pickpocket, dia_tpl_1436_pickpocket_doit);
};

func void dia_tpl_1436_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1436_pickpocket);
};

func void dia_tpl_1436_pickpocket_back() {
    info_clearchoices(dia_tpl_1436_pickpocket);
};

instance dia_tpl_1437_pickpocket(c_info) {
    npc = tpl_1437_templer;
    nr = 900;
    condition = dia_tpl_1437_pickpocket_condition;
    information = dia_tpl_1437_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1437_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1437_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1437_pickpocket);
	info_addchoice(dia_tpl_1437_pickpocket, dialog_back, dia_tpl_1437_pickpocket_back);
	info_addchoice(dia_tpl_1437_pickpocket, dialog_pickpocket, dia_tpl_1437_pickpocket_doit);
};

func void dia_tpl_1437_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1437_pickpocket);
};

func void dia_tpl_1437_pickpocket_back() {
    info_clearchoices(dia_tpl_1437_pickpocket);
};

instance dia_tpl_1438_pickpocket(c_info) {
    npc = tpl_1438_templer;
    nr = 900;
    condition = dia_tpl_1438_pickpocket_condition;
    information = dia_tpl_1438_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1438_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1438_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1438_pickpocket);
	info_addchoice(dia_tpl_1438_pickpocket, dialog_back, dia_tpl_1438_pickpocket_back);
	info_addchoice(dia_tpl_1438_pickpocket, dialog_pickpocket, dia_tpl_1438_pickpocket_doit);
};

func void dia_tpl_1438_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_1438_pickpocket);
};

func void dia_tpl_1438_pickpocket_back() {
    info_clearchoices(dia_tpl_1438_pickpocket);
};

instance dia_gornadrak_pickpocket(c_info) {
    npc = tpl_1439_gornadrak;
    nr = 900;
    condition = dia_gornadrak_pickpocket_condition;
    information = dia_gornadrak_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornadrak_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornadrak_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornadrak_pickpocket);
	info_addchoice(dia_gornadrak_pickpocket, dialog_back, dia_gornadrak_pickpocket_back);
	info_addchoice(dia_gornadrak_pickpocket, dialog_pickpocket, dia_gornadrak_pickpocket_doit);
};

func void dia_gornadrak_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornadrak_pickpocket);
};

func void dia_gornadrak_pickpocket_back() {
    info_clearchoices(dia_gornadrak_pickpocket);
};

instance dia_tpl_3927_pickpocket(c_info) {
    npc = tpl_3927_gorboba;
    nr = 900;
    condition = dia_tpl_3927_pickpocket_condition;
    information = dia_tpl_3927_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_3927_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_3927_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_3927_pickpocket);
	info_addchoice(dia_tpl_3927_pickpocket, dialog_back, dia_tpl_3927_pickpocket_back);
	info_addchoice(dia_tpl_3927_pickpocket, dialog_pickpocket, dia_tpl_3927_pickpocket_doit);
};

func void dia_tpl_3927_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_3927_pickpocket);
};

func void dia_tpl_3927_pickpocket_back() {
    info_clearchoices(dia_tpl_3927_pickpocket);
};

instance dia_tpl_40079_pickpocket(c_info) {
    npc = tpl_40079_templeguard;
    nr = 900;
    condition = dia_tpl_40079_pickpocket_condition;
    information = dia_tpl_40079_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_40079_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_40079_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_40079_pickpocket);
	info_addchoice(dia_tpl_40079_pickpocket, dialog_back, dia_tpl_40079_pickpocket_back);
	info_addchoice(dia_tpl_40079_pickpocket, dialog_pickpocket, dia_tpl_40079_pickpocket_doit);
};

func void dia_tpl_40079_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_40079_pickpocket);
};

func void dia_tpl_40079_pickpocket_back() {
    info_clearchoices(dia_tpl_40079_pickpocket);
};

instance dia_tpl_40080_pickpocket(c_info) {
    npc = tpl_40080_templeguard;
    nr = 900;
    condition = dia_tpl_40080_pickpocket_condition;
    information = dia_tpl_40080_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_40080_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_40080_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_40080_pickpocket);
	info_addchoice(dia_tpl_40080_pickpocket, dialog_back, dia_tpl_40080_pickpocket_back);
	info_addchoice(dia_tpl_40080_pickpocket, dialog_pickpocket, dia_tpl_40080_pickpocket_doit);
};

func void dia_tpl_40080_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_40080_pickpocket);
};

func void dia_tpl_40080_pickpocket_back() {
    info_clearchoices(dia_tpl_40080_pickpocket);
};

instance dia_tpl_40082_pickpocket(c_info) {
    npc = tpl_40082_templeguard;
    nr = 900;
    condition = dia_tpl_40082_pickpocket_condition;
    information = dia_tpl_40082_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_40082_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_40082_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_40082_pickpocket);
	info_addchoice(dia_tpl_40082_pickpocket, dialog_back, dia_tpl_40082_pickpocket_back);
	info_addchoice(dia_tpl_40082_pickpocket, dialog_pickpocket, dia_tpl_40082_pickpocket_doit);
};

func void dia_tpl_40082_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_40082_pickpocket);
};

func void dia_tpl_40082_pickpocket_back() {
    info_clearchoices(dia_tpl_40082_pickpocket);
};

instance dia_gornapol_pickpocket(c_info) {
    npc = tpl_40115_gornapol;
    nr = 900;
    condition = dia_gornapol_pickpocket_condition;
    information = dia_gornapol_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornapol_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornapol_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornapol_pickpocket);
	info_addchoice(dia_gornapol_pickpocket, dialog_back, dia_gornapol_pickpocket_back);
	info_addchoice(dia_gornapol_pickpocket, dialog_pickpocket, dia_gornapol_pickpocket_doit);
};

func void dia_gornapol_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornapol_pickpocket);
};

func void dia_gornapol_pickpocket_back() {
    info_clearchoices(dia_gornapol_pickpocket);
};

instance dia_tpl_7899_pickpocket(c_info) {
    npc = tpl_7899_templer;
    nr = 900;
    condition = dia_tpl_7899_pickpocket_condition;
    information = dia_tpl_7899_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_7899_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_7899_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_7899_pickpocket);
	info_addchoice(dia_tpl_7899_pickpocket, dialog_back, dia_tpl_7899_pickpocket_back);
	info_addchoice(dia_tpl_7899_pickpocket, dialog_pickpocket, dia_tpl_7899_pickpocket_doit);
};

func void dia_tpl_7899_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tpl_7899_pickpocket);
};

func void dia_tpl_7899_pickpocket_back() {
    info_clearchoices(dia_tpl_7899_pickpocket);
};

instance dia_elton_pickpocket(c_info) {
    npc = vlk_40010_elton;
    nr = 900;
    condition = dia_elton_pickpocket_condition;
    information = dia_elton_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_elton_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_elton_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_elton_pickpocket);
	info_addchoice(dia_elton_pickpocket, dialog_back, dia_elton_pickpocket_back);
	info_addchoice(dia_elton_pickpocket, dialog_pickpocket, dia_elton_pickpocket_doit);
};

func void dia_elton_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_elton_pickpocket);
};

func void dia_elton_pickpocket_back() {
    info_clearchoices(dia_elton_pickpocket);
};

instance dia_vlk_40012_pickpocket(c_info) {
    npc = vlk_40012_kopacz;
    nr = 900;
    condition = dia_vlk_40012_pickpocket_condition;
    information = dia_vlk_40012_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_40012_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_40012_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_40012_pickpocket);
	info_addchoice(dia_vlk_40012_pickpocket, dialog_back, dia_vlk_40012_pickpocket_back);
	info_addchoice(dia_vlk_40012_pickpocket, dialog_pickpocket, dia_vlk_40012_pickpocket_doit);
};

func void dia_vlk_40012_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_40012_pickpocket);
};

func void dia_vlk_40012_pickpocket_back() {
    info_clearchoices(dia_vlk_40012_pickpocket);
};

instance dia_vlk_40013_pickpocket(c_info) {
    npc = vlk_40013_kopacz;
    nr = 900;
    condition = dia_vlk_40013_pickpocket_condition;
    information = dia_vlk_40013_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_40013_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_40013_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_40013_pickpocket);
	info_addchoice(dia_vlk_40013_pickpocket, dialog_back, dia_vlk_40013_pickpocket_back);
	info_addchoice(dia_vlk_40013_pickpocket, dialog_pickpocket, dia_vlk_40013_pickpocket_doit);
};

func void dia_vlk_40013_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_40013_pickpocket);
};

func void dia_vlk_40013_pickpocket_back() {
    info_clearchoices(dia_vlk_40013_pickpocket);
};

instance dia_vlk_40014_pickpocket(c_info) {
    npc = vlk_40014_kopacz;
    nr = 900;
    condition = dia_vlk_40014_pickpocket_condition;
    information = dia_vlk_40014_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_40014_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_40014_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_40014_pickpocket);
	info_addchoice(dia_vlk_40014_pickpocket, dialog_back, dia_vlk_40014_pickpocket_back);
	info_addchoice(dia_vlk_40014_pickpocket, dialog_pickpocket, dia_vlk_40014_pickpocket_doit);
};

func void dia_vlk_40014_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_40014_pickpocket);
};

func void dia_vlk_40014_pickpocket_back() {
    info_clearchoices(dia_vlk_40014_pickpocket);
};

instance dia_vlk_40015_pickpocket(c_info) {
    npc = vlk_40015_kopacz;
    nr = 900;
    condition = dia_vlk_40015_pickpocket_condition;
    information = dia_vlk_40015_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_40015_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_40015_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_40015_pickpocket);
	info_addchoice(dia_vlk_40015_pickpocket, dialog_back, dia_vlk_40015_pickpocket_back);
	info_addchoice(dia_vlk_40015_pickpocket, dialog_pickpocket, dia_vlk_40015_pickpocket_doit);
};

func void dia_vlk_40015_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_40015_pickpocket);
};

func void dia_vlk_40015_pickpocket_back() {
    info_clearchoices(dia_vlk_40015_pickpocket);
};

instance dia_richard_pickpocket(c_info) {
    npc = vlk_40053_richard;
    nr = 900;
    condition = dia_richard_pickpocket_condition;
    information = dia_richard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_richard_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_richard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_richard_pickpocket);
	info_addchoice(dia_richard_pickpocket, dialog_back, dia_richard_pickpocket_back);
	info_addchoice(dia_richard_pickpocket, dialog_pickpocket, dia_richard_pickpocket_doit);
};

func void dia_richard_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_richard_pickpocket);
};

func void dia_richard_pickpocket_back() {
    info_clearchoices(dia_richard_pickpocket);
};

instance dia_eliott_pickpocket(c_info) {
    npc = vlk_40055_eliott;
    nr = 900;
    condition = dia_eliott_pickpocket_condition;
    information = dia_eliott_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_eliott_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 25);
};

func void dia_eliott_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_eliott_pickpocket);
	info_addchoice(dia_eliott_pickpocket, dialog_back, dia_eliott_pickpocket_back);
	info_addchoice(dia_eliott_pickpocket, dialog_pickpocket, dia_eliott_pickpocket_doit);
};

func void dia_eliott_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_eliott_pickpocket);
};

func void dia_eliott_pickpocket_back() {
    info_clearchoices(dia_eliott_pickpocket);
};

instance dia_brennus_pickpocket(c_info) {
    npc = vlk_40057_brennus;
    nr = 900;
    condition = dia_brennus_pickpocket_condition;
    information = dia_brennus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brennus_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_brennus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brennus_pickpocket);
	info_addchoice(dia_brennus_pickpocket, dialog_back, dia_brennus_pickpocket_back);
	info_addchoice(dia_brennus_pickpocket, dialog_pickpocket, dia_brennus_pickpocket_doit);
};

func void dia_brennus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_brennus_pickpocket);
};

func void dia_brennus_pickpocket_back() {
    info_clearchoices(dia_brennus_pickpocket);
};

instance dia_calum_pickpocket(c_info) {
    npc = vlk_40068_calum;
    nr = 900;
    condition = dia_calum_pickpocket_condition;
    information = dia_calum_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_calum_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_calum_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_calum_pickpocket);
	info_addchoice(dia_calum_pickpocket, dialog_back, dia_calum_pickpocket_back);
	info_addchoice(dia_calum_pickpocket, dialog_pickpocket, dia_calum_pickpocket_doit);
};

func void dia_calum_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_calum_pickpocket);
};

func void dia_calum_pickpocket_back() {
    info_clearchoices(dia_calum_pickpocket);
};

instance dia_fallon_pickpocket(c_info) {
    npc = vlk_40069_fallon;
    nr = 900;
    condition = dia_fallon_pickpocket_condition;
    information = dia_fallon_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fallon_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_fallon_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fallon_pickpocket);
	info_addchoice(dia_fallon_pickpocket, dialog_back, dia_fallon_pickpocket_back);
	info_addchoice(dia_fallon_pickpocket, dialog_pickpocket, dia_fallon_pickpocket_doit);
};

func void dia_fallon_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fallon_pickpocket);
};

func void dia_fallon_pickpocket_back() {
    info_clearchoices(dia_fallon_pickpocket);
};

instance dia_herek_pickpocket(c_info) {
    npc = vlk_511_herek;
    nr = 900;
    condition = dia_herek_pickpocket_condition;
    information = dia_herek_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_herek_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_herek_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_herek_pickpocket);
	info_addchoice(dia_herek_pickpocket, dialog_back, dia_herek_pickpocket_back);
	info_addchoice(dia_herek_pickpocket, dialog_pickpocket, dia_herek_pickpocket_doit);
};

func void dia_herek_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_herek_pickpocket);
};

func void dia_herek_pickpocket_back() {
    info_clearchoices(dia_herek_pickpocket);
};

instance dia_vlk_520_pickpocket(c_info) {
    npc = vlk_520_buddler;
    nr = 900;
    condition = dia_vlk_520_pickpocket_condition;
    information = dia_vlk_520_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_520_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_520_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_520_pickpocket);
	info_addchoice(dia_vlk_520_pickpocket, dialog_back, dia_vlk_520_pickpocket_back);
	info_addchoice(dia_vlk_520_pickpocket, dialog_pickpocket, dia_vlk_520_pickpocket_doit);
};

func void dia_vlk_520_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_520_pickpocket);
};

func void dia_vlk_520_pickpocket_back() {
    info_clearchoices(dia_vlk_520_pickpocket);
};

instance dia_dusty_pickpocket(c_info) {
    npc = vlk_524_dusty;
    nr = 900;
    condition = dia_dusty_pickpocket_condition;
    information = dia_dusty_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dusty_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_dusty_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dusty_pickpocket);
	info_addchoice(dia_dusty_pickpocket, dialog_back, dia_dusty_pickpocket_back);
	info_addchoice(dia_dusty_pickpocket, dialog_pickpocket, dia_dusty_pickpocket_doit);
};

func void dia_dusty_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_dusty_pickpocket);
};

func void dia_dusty_pickpocket_back() {
    info_clearchoices(dia_dusty_pickpocket);
};

instance dia_guy_pickpocket(c_info) {
    npc = vlk_530_guy;
    nr = 900;
    condition = dia_guy_pickpocket_condition;
    information = dia_guy_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_guy_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_guy_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_guy_pickpocket);
	info_addchoice(dia_guy_pickpocket, dialog_back, dia_guy_pickpocket_back);
	info_addchoice(dia_guy_pickpocket, dialog_pickpocket, dia_guy_pickpocket_doit);
};

func void dia_guy_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_guy_pickpocket);
};

func void dia_guy_pickpocket_back() {
    info_clearchoices(dia_guy_pickpocket);
};

instance dia_vlk_534_pickpocket(c_info) {
    npc = vlk_534_buddler;
    nr = 900;
    condition = dia_vlk_534_pickpocket_condition;
    information = dia_vlk_534_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_534_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_534_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_534_pickpocket);
	info_addchoice(dia_vlk_534_pickpocket, dialog_back, dia_vlk_534_pickpocket_back);
	info_addchoice(dia_vlk_534_pickpocket, dialog_pickpocket, dia_vlk_534_pickpocket_doit);
};

func void dia_vlk_534_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_534_pickpocket);
};

func void dia_vlk_534_pickpocket_back() {
    info_clearchoices(dia_vlk_534_pickpocket);
};

instance dia_kyle_pickpocket(c_info) {
    npc = vlk_536_kyle;
    nr = 900;
    condition = dia_kyle_pickpocket_condition;
    information = dia_kyle_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kyle_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_kyle_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kyle_pickpocket);
	info_addchoice(dia_kyle_pickpocket, dialog_back, dia_kyle_pickpocket_back);
	info_addchoice(dia_kyle_pickpocket, dialog_pickpocket, dia_kyle_pickpocket_doit);
};

func void dia_kyle_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kyle_pickpocket);
};

func void dia_kyle_pickpocket_back() {
    info_clearchoices(dia_kyle_pickpocket);
};

instance dia_huno_pickpocket(c_info) {
    npc = vlk_538_huno;
    nr = 900;
    condition = dia_huno_pickpocket_condition;
    information = dia_huno_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_huno_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_huno_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_huno_pickpocket);
	info_addchoice(dia_huno_pickpocket, dialog_back, dia_huno_pickpocket_back);
	info_addchoice(dia_huno_pickpocket, dialog_pickpocket, dia_huno_pickpocket_doit);
};

func void dia_huno_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_huno_pickpocket);
};

func void dia_huno_pickpocket_back() {
    info_clearchoices(dia_huno_pickpocket);
};

instance dia_gulris_pickpocket(c_info) {
    npc = vlk_560_buddler;
    nr = 900;
    condition = dia_gulris_pickpocket_condition;
    information = dia_gulris_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gulris_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_gulris_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gulris_pickpocket);
	info_addchoice(dia_gulris_pickpocket, dialog_back, dia_gulris_pickpocket_back);
	info_addchoice(dia_gulris_pickpocket, dialog_pickpocket, dia_gulris_pickpocket_doit);
};

func void dia_gulris_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gulris_pickpocket);
};

func void dia_gulris_pickpocket_back() {
    info_clearchoices(dia_gulris_pickpocket);
};

instance dia_jesse_pickpocket(c_info) {
    npc = vlk_564_jesse;
    nr = 900;
    condition = dia_jesse_pickpocket_condition;
    information = dia_jesse_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jesse_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_jesse_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jesse_pickpocket);
	info_addchoice(dia_jesse_pickpocket, dialog_back, dia_jesse_pickpocket_back);
	info_addchoice(dia_jesse_pickpocket, dialog_pickpocket, dia_jesse_pickpocket_doit);
};

func void dia_jesse_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jesse_pickpocket);
};

func void dia_jesse_pickpocket_back() {
    info_clearchoices(dia_jesse_pickpocket);
};

instance dia_gravo_pickpocket(c_info) {
    npc = vlk_572_gravo;
    nr = 900;
    condition = dia_gravo_pickpocket_condition;
    information = dia_gravo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gravo_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_gravo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gravo_pickpocket);
	info_addchoice(dia_gravo_pickpocket, dialog_back, dia_gravo_pickpocket_back);
	info_addchoice(dia_gravo_pickpocket, dialog_pickpocket, dia_gravo_pickpocket_doit);
};

func void dia_gravo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gravo_pickpocket);
};

func void dia_gravo_pickpocket_back() {
    info_clearchoices(dia_gravo_pickpocket);
};

instance dia_graham_pickpocket(c_info) {
    npc = vlk_573_graham;
    nr = 900;
    condition = dia_graham_pickpocket_condition;
    information = dia_graham_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_graham_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_graham_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_graham_pickpocket);
	info_addchoice(dia_graham_pickpocket, dialog_back, dia_graham_pickpocket_back);
	info_addchoice(dia_graham_pickpocket, dialog_pickpocket, dia_graham_pickpocket_doit);
};

func void dia_graham_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_graham_pickpocket);
};

func void dia_graham_pickpocket_back() {
    info_clearchoices(dia_graham_pickpocket);
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
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_mud_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mud_pickpocket);
	info_addchoice(dia_mud_pickpocket, dialog_back, dia_mud_pickpocket_back);
	info_addchoice(dia_mud_pickpocket, dialog_pickpocket, dia_mud_pickpocket_doit);
};

func void dia_mud_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mud_pickpocket);
};

func void dia_mud_pickpocket_back() {
    info_clearchoices(dia_mud_pickpocket);
};

instance dia_snaf_pickpocket(c_info) {
    npc = vlk_581_snaf;
    nr = 900;
    condition = dia_snaf_pickpocket_condition;
    information = dia_snaf_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_snaf_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_snaf_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_snaf_pickpocket);
	info_addchoice(dia_snaf_pickpocket, dialog_back, dia_snaf_pickpocket_back);
	info_addchoice(dia_snaf_pickpocket, dialog_pickpocket, dia_snaf_pickpocket_doit);
};

func void dia_snaf_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_snaf_pickpocket);
};

func void dia_snaf_pickpocket_back() {
    info_clearchoices(dia_snaf_pickpocket);
};

instance dia_melvin_pickpocket(c_info) {
    npc = vlk_582_melvin;
    nr = 900;
    condition = dia_melvin_pickpocket_condition;
    information = dia_melvin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_melvin_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_melvin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_melvin_pickpocket);
	info_addchoice(dia_melvin_pickpocket, dialog_back, dia_melvin_pickpocket_back);
	info_addchoice(dia_melvin_pickpocket, dialog_pickpocket, dia_melvin_pickpocket_doit);
};

func void dia_melvin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_melvin_pickpocket);
};

func void dia_melvin_pickpocket_back() {
    info_clearchoices(dia_melvin_pickpocket);
};

instance dia_glen_pickpocket(c_info) {
    npc = vlk_583_glen;
    nr = 900;
    condition = dia_glen_pickpocket_condition;
    information = dia_glen_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_glen_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_glen_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_glen_pickpocket);
	info_addchoice(dia_glen_pickpocket, dialog_back, dia_glen_pickpocket_back);
	info_addchoice(dia_glen_pickpocket, dialog_pickpocket, dia_glen_pickpocket_doit);
};

func void dia_glen_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_glen_pickpocket);
};

func void dia_glen_pickpocket_back() {
    info_clearchoices(dia_glen_pickpocket);
};

instance dia_snipes_pickpocket(c_info) {
    npc = vlk_584_snipes;
    nr = 900;
    condition = dia_snipes_pickpocket_condition;
    information = dia_snipes_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_snipes_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_snipes_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_snipes_pickpocket);
	info_addchoice(dia_snipes_pickpocket, dialog_back, dia_snipes_pickpocket_back);
	info_addchoice(dia_snipes_pickpocket, dialog_pickpocket, dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back() {
    info_clearchoices(dia_snipes_pickpocket);
};

instance dia_aleph_pickpocket(c_info) {
    npc = vlk_585_aleph;
    nr = 900;
    condition = dia_aleph_pickpocket_condition;
    information = dia_aleph_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_aleph_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_aleph_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_aleph_pickpocket);
	info_addchoice(dia_aleph_pickpocket, dialog_back, dia_aleph_pickpocket_back);
	info_addchoice(dia_aleph_pickpocket, dialog_pickpocket, dia_aleph_pickpocket_doit);
};

func void dia_aleph_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_aleph_pickpocket);
};

func void dia_aleph_pickpocket_back() {
    info_clearchoices(dia_aleph_pickpocket);
};

instance dia_grimes_pickpocket(c_info) {
    npc = vlk_586_grimes;
    nr = 900;
    condition = dia_grimes_pickpocket_condition;
    information = dia_grimes_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grimes_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_grimes_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grimes_pickpocket);
	info_addchoice(dia_grimes_pickpocket, dialog_back, dia_grimes_pickpocket_back);
	info_addchoice(dia_grimes_pickpocket, dialog_pickpocket, dia_grimes_pickpocket_doit);
};

func void dia_grimes_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grimes_pickpocket);
};

func void dia_grimes_pickpocket_back() {
    info_clearchoices(dia_grimes_pickpocket);
};

instance dia_garp_pickpocket(c_info) {
    npc = vlk_587_garp;
    nr = 900;
    condition = dia_garp_pickpocket_condition;
    information = dia_garp_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_garp_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_garp_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_garp_pickpocket);
	info_addchoice(dia_garp_pickpocket, dialog_back, dia_garp_pickpocket_back);
	info_addchoice(dia_garp_pickpocket, dialog_pickpocket, dia_garp_pickpocket_doit);
};

func void dia_garp_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_garp_pickpocket);
};

func void dia_garp_pickpocket_back() {
    info_clearchoices(dia_garp_pickpocket);
};

instance dia_miguel_pickpocket(c_info) {
    npc = ban_1600_miguel;
    nr = 900;
    condition = dia_miguel_pickpocket_condition;
    information = dia_miguel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_miguel_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_miguel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_miguel_pickpocket);
	info_addchoice(dia_miguel_pickpocket, dialog_back, dia_miguel_pickpocket_back);
	info_addchoice(dia_miguel_pickpocket, dialog_pickpocket, dia_miguel_pickpocket_doit);
};

func void dia_miguel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_miguel_pickpocket);
};

func void dia_miguel_pickpocket_back() {
    info_clearchoices(dia_miguel_pickpocket);
};

instance dia_briam_pickpocket(c_info) {
    npc = ban_1601_briam;
    nr = 900;
    condition = dia_briam_pickpocket_condition;
    information = dia_briam_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_briam_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_briam_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_briam_pickpocket);
	info_addchoice(dia_briam_pickpocket, dialog_back, dia_briam_pickpocket_back);
	info_addchoice(dia_briam_pickpocket, dialog_pickpocket, dia_briam_pickpocket_doit);
};

func void dia_briam_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_briam_pickpocket);
};

func void dia_briam_pickpocket_back() {
    info_clearchoices(dia_briam_pickpocket);
};

instance dia_jens_pickpocket(c_info) {
    npc = ban_1604_jens;
    nr = 900;
    condition = dia_jens_pickpocket_condition;
    information = dia_jens_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jens_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_jens_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jens_pickpocket);
	info_addchoice(dia_jens_pickpocket, dialog_back, dia_jens_pickpocket_back);
	info_addchoice(dia_jens_pickpocket, dialog_pickpocket, dia_jens_pickpocket_doit);
};

func void dia_jens_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jens_pickpocket);
};

func void dia_jens_pickpocket_back() {
    info_clearchoices(dia_jens_pickpocket);
};

instance dia_emanuel_pickpocket(c_info) {
    npc = ban_1602_emanuel;
    nr = 900;
    condition = dia_emanuel_pickpocket_condition;
    information = dia_emanuel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_emanuel_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_emanuel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_emanuel_pickpocket);
	info_addchoice(dia_emanuel_pickpocket, dialog_back, dia_emanuel_pickpocket_back);
	info_addchoice(dia_emanuel_pickpocket, dialog_pickpocket, dia_emanuel_pickpocket_doit);
};

func void dia_emanuel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_emanuel_pickpocket);
};

func void dia_emanuel_pickpocket_back() {
    info_clearchoices(dia_emanuel_pickpocket);
};

instance dia_martin_pickpocket(c_info) {
    npc = ban_1603_martin;
    nr = 900;
    condition = dia_martin_pickpocket_condition;
    information = dia_martin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_martin_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_martin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_martin_pickpocket);
	info_addchoice(dia_martin_pickpocket, dialog_back, dia_martin_pickpocket_back);
	info_addchoice(dia_martin_pickpocket, dialog_pickpocket, dia_martin_pickpocket_doit);
};

func void dia_martin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_martin_pickpocket);
};

func void dia_martin_pickpocket_back() {
    info_clearchoices(dia_martin_pickpocket);
};

instance dia_josh_pickpocket(c_info) {
    npc = ban_1606_josh;
    nr = 900;
    condition = dia_josh_pickpocket_condition;
    information = dia_josh_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_josh_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_josh_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_josh_pickpocket);
	info_addchoice(dia_josh_pickpocket, dialog_back, dia_josh_pickpocket_back);
	info_addchoice(dia_josh_pickpocket, dialog_pickpocket, dia_josh_pickpocket_doit);
};

func void dia_josh_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_josh_pickpocket);
};

func void dia_josh_pickpocket_back() {
    info_clearchoices(dia_josh_pickpocket);
};

instance dia_chris_pickpocket(c_info) {
    npc = ban_1607_chris;
    nr = 900;
    condition = dia_chris_pickpocket_condition;
    information = dia_chris_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_chris_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_chris_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_chris_pickpocket);
	info_addchoice(dia_chris_pickpocket, dialog_back, dia_chris_pickpocket_back);
	info_addchoice(dia_chris_pickpocket, dialog_pickpocket, dia_chris_pickpocket_doit);
};

func void dia_chris_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_chris_pickpocket);
};

func void dia_chris_pickpocket_back() {
    info_clearchoices(dia_chris_pickpocket);
};

instance dia_kereth_pickpocket(c_info) {
    npc = ban_1608_kereth;
    nr = 900;
    condition = dia_kereth_pickpocket_condition;
    information = dia_kereth_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kereth_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_kereth_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kereth_pickpocket);
	info_addchoice(dia_kereth_pickpocket, dialog_back, dia_kereth_pickpocket_back);
	info_addchoice(dia_kereth_pickpocket, dialog_pickpocket, dia_kereth_pickpocket_doit);
};

func void dia_kereth_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kereth_pickpocket);
};

func void dia_kereth_pickpocket_back() {
    info_clearchoices(dia_kereth_pickpocket);
};

instance dia_smith_pickpocket(c_info) {
    npc = ban_1609_smith;
    nr = 900;
    condition = dia_smith_pickpocket_condition;
    information = dia_smith_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_smith_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_smith_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_smith_pickpocket);
	info_addchoice(dia_smith_pickpocket, dialog_back, dia_smith_pickpocket_back);
	info_addchoice(dia_smith_pickpocket, dialog_pickpocket, dia_smith_pickpocket_doit);
};

func void dia_smith_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_smith_pickpocket);
};

func void dia_smith_pickpocket_back() {
    info_clearchoices(dia_smith_pickpocket);
};

instance dia_pun_pickpocket(c_info) {
    npc = ban_1611_pun;
    nr = 900;
    condition = dia_pun_pickpocket_condition;
    information = dia_pun_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pun_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_pun_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pun_pickpocket);
	info_addchoice(dia_pun_pickpocket, dialog_back, dia_pun_pickpocket_back);
	info_addchoice(dia_pun_pickpocket, dialog_pickpocket, dia_pun_pickpocket_doit);
};

func void dia_pun_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_pun_pickpocket);
};

func void dia_pun_pickpocket_back() {
    info_clearchoices(dia_pun_pickpocket);
};

instance dia_skaza_pickpocket(c_info) {
    npc = ban_1612_skaza;
    nr = 900;
    condition = dia_skaza_pickpocket_condition;
    information = dia_skaza_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_skaza_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_skaza_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_skaza_pickpocket);
	info_addchoice(dia_skaza_pickpocket, dialog_back, dia_skaza_pickpocket_back);
	info_addchoice(dia_skaza_pickpocket, dialog_pickpocket, dia_skaza_pickpocket_doit);
};

func void dia_skaza_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_skaza_pickpocket);
};

func void dia_skaza_pickpocket_back() {
    info_clearchoices(dia_skaza_pickpocket);
};

instance dia_doyle_pickpocket(c_info) {
    npc = ban_1613_doyle;
    nr = 900;
    condition = dia_doyle_pickpocket_condition;
    information = dia_doyle_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_doyle_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_doyle_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_doyle_pickpocket);
	info_addchoice(dia_doyle_pickpocket, dialog_back, dia_doyle_pickpocket_back);
	info_addchoice(dia_doyle_pickpocket, dialog_pickpocket, dia_doyle_pickpocket_doit);
};

func void dia_doyle_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_doyle_pickpocket);
};

func void dia_doyle_pickpocket_back() {
    info_clearchoices(dia_doyle_pickpocket);
};

instance dia_drax_pickpocket(c_info) {
    npc = ban_1614_drax;
    nr = 900;
    condition = dia_drax_pickpocket_condition;
    information = dia_drax_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_drax_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_drax_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_drax_pickpocket);
	info_addchoice(dia_drax_pickpocket, dialog_back, dia_drax_pickpocket_back);
	info_addchoice(dia_drax_pickpocket, dialog_pickpocket, dia_drax_pickpocket_doit);
};

func void dia_drax_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_drax_pickpocket);
};

func void dia_drax_pickpocket_back() {
    info_clearchoices(dia_drax_pickpocket);
};

instance dia_bau_917_pickpocket(c_info) {
    npc = bau_917_bauer;
    nr = 900;
    condition = dia_bau_917_pickpocket_condition;
    information = dia_bau_917_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bau_917_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 18);
};

func void dia_bau_917_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bau_917_pickpocket);
	info_addchoice(dia_bau_917_pickpocket, dialog_back, dia_bau_917_pickpocket_back);
	info_addchoice(dia_bau_917_pickpocket, dialog_pickpocket, dia_bau_917_pickpocket_doit);
};

func void dia_bau_917_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bau_917_pickpocket);
};

func void dia_bau_917_pickpocket_back() {
    info_clearchoices(dia_bau_917_pickpocket);
};

instance dia_grd_2001_pickpocket(c_info) {
    npc = grd_2001_stra¿nik;
    nr = 900;
    condition = dia_grd_2001_pickpocket_condition;
    information = dia_grd_2001_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2001_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2001_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2001_pickpocket);
	info_addchoice(dia_grd_2001_pickpocket, dialog_back, dia_grd_2001_pickpocket_back);
	info_addchoice(dia_grd_2001_pickpocket, dialog_pickpocket, dia_grd_2001_pickpocket_doit);
};

func void dia_grd_2001_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2001_pickpocket);
};

func void dia_grd_2001_pickpocket_back() {
    info_clearchoices(dia_grd_2001_pickpocket);
};

instance dia_grd_2002_pickpocket(c_info) {
    npc = grd_2002_stra¿nik;
    nr = 900;
    condition = dia_grd_2002_pickpocket_condition;
    information = dia_grd_2002_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2002_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2002_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2002_pickpocket);
	info_addchoice(dia_grd_2002_pickpocket, dialog_back, dia_grd_2002_pickpocket_back);
	info_addchoice(dia_grd_2002_pickpocket, dialog_pickpocket, dia_grd_2002_pickpocket_doit);
};

func void dia_grd_2002_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2002_pickpocket);
};

func void dia_grd_2002_pickpocket_back() {
    info_clearchoices(dia_grd_2002_pickpocket);
};

instance dia_grd_2003_pickpocket(c_info) {
    npc = grd_2003_stra¿nik;
    nr = 900;
    condition = dia_grd_2003_pickpocket_condition;
    information = dia_grd_2003_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2003_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2003_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2003_pickpocket);
	info_addchoice(dia_grd_2003_pickpocket, dialog_back, dia_grd_2003_pickpocket_back);
	info_addchoice(dia_grd_2003_pickpocket, dialog_pickpocket, dia_grd_2003_pickpocket_doit);
};

func void dia_grd_2003_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2003_pickpocket);
};

func void dia_grd_2003_pickpocket_back() {
    info_clearchoices(dia_grd_2003_pickpocket);
};

instance dia_grd_2005_pickpocket(c_info) {
    npc = grd_2005_stra¿nik;
    nr = 900;
    condition = dia_grd_2005_pickpocket_condition;
    information = dia_grd_2005_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2005_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2005_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2005_pickpocket);
	info_addchoice(dia_grd_2005_pickpocket, dialog_back, dia_grd_2005_pickpocket_back);
	info_addchoice(dia_grd_2005_pickpocket, dialog_pickpocket, dia_grd_2005_pickpocket_doit);
};

func void dia_grd_2005_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2005_pickpocket);
};

func void dia_grd_2005_pickpocket_back() {
    info_clearchoices(dia_grd_2005_pickpocket);
};

instance dia_grd_2013_pickpocket(c_info) {
    npc = grd_2013_siepacz;
    nr = 900;
    condition = dia_grd_2013_pickpocket_condition;
    information = dia_grd_2013_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2013_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2013_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2013_pickpocket);
	info_addchoice(dia_grd_2013_pickpocket, dialog_back, dia_grd_2013_pickpocket_back);
	info_addchoice(dia_grd_2013_pickpocket, dialog_pickpocket, dia_grd_2013_pickpocket_doit);
};

func void dia_grd_2013_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2013_pickpocket);
};

func void dia_grd_2013_pickpocket_back() {
    info_clearchoices(dia_grd_2013_pickpocket);
};

instance dia_grd_2014_pickpocket(c_info) {
    npc = grd_2014_siepacz;
    nr = 900;
    condition = dia_grd_2014_pickpocket_condition;
    information = dia_grd_2014_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_2014_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_2014_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_2014_pickpocket);
	info_addchoice(dia_grd_2014_pickpocket, dialog_back, dia_grd_2014_pickpocket_back);
	info_addchoice(dia_grd_2014_pickpocket, dialog_pickpocket, dia_grd_2014_pickpocket_doit);
};

func void dia_grd_2014_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_2014_pickpocket);
};

func void dia_grd_2014_pickpocket_back() {
    info_clearchoices(dia_grd_2014_pickpocket);
};

instance dia_artch_pickpocket(c_info) {
    npc = grd_2017_artch;
    nr = 900;
    condition = dia_artch_pickpocket_condition;
    information = dia_artch_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_artch_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_artch_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_artch_pickpocket);
	info_addchoice(dia_artch_pickpocket, dialog_back, dia_artch_pickpocket_back);
	info_addchoice(dia_artch_pickpocket, dialog_pickpocket, dia_artch_pickpocket_doit);
};

func void dia_artch_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_artch_pickpocket);
};

func void dia_artch_pickpocket_back() {
    info_clearchoices(dia_artch_pickpocket);
};

instance dia_magazynier_pickpocket(c_info) {
    npc = grd_2032_magazynier;
    nr = 900;
    condition = dia_magazynier_pickpocket_condition;
    information = dia_magazynier_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_magazynier_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_magazynier_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_magazynier_pickpocket);
	info_addchoice(dia_magazynier_pickpocket, dialog_back, dia_magazynier_pickpocket_back);
	info_addchoice(dia_magazynier_pickpocket, dialog_pickpocket, dia_magazynier_pickpocket_doit);
};

func void dia_magazynier_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_magazynier_pickpocket);
};

func void dia_magazynier_pickpocket_back() {
    info_clearchoices(dia_magazynier_pickpocket);
};

instance dia_dracon_pickpocket(c_info) {
    npc = grd_2035_dracon;
    nr = 900;
    condition = dia_dracon_pickpocket_condition;
    information = dia_dracon_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dracon_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_dracon_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dracon_pickpocket);
	info_addchoice(dia_dracon_pickpocket, dialog_back, dia_dracon_pickpocket_back);
	info_addchoice(dia_dracon_pickpocket, dialog_pickpocket, dia_dracon_pickpocket_doit);
};

func void dia_dracon_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_dracon_pickpocket);
};

func void dia_dracon_pickpocket_back() {
    info_clearchoices(dia_dracon_pickpocket);
};

instance dia_karczmarz_pickpocket(c_info) {
    npc = grd_2036_karczmarz;
    nr = 900;
    condition = dia_karczmarz_pickpocket_condition;
    information = dia_karczmarz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_karczmarz_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_karczmarz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_karczmarz_pickpocket);
	info_addchoice(dia_karczmarz_pickpocket, dialog_back, dia_karczmarz_pickpocket_back);
	info_addchoice(dia_karczmarz_pickpocket, dialog_pickpocket, dia_karczmarz_pickpocket_doit);
};

func void dia_karczmarz_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_karczmarz_pickpocket);
};

func void dia_karczmarz_pickpocket_back() {
    info_clearchoices(dia_karczmarz_pickpocket);
};

instance dia_nek_pickpocket(c_info) {
    npc = grd_3085_nek;
    nr = 900;
    condition = dia_nek_pickpocket_condition;
    information = dia_nek_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nek_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_nek_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nek_pickpocket);
	info_addchoice(dia_nek_pickpocket, dialog_back, dia_nek_pickpocket_back);
	info_addchoice(dia_nek_pickpocket, dialog_pickpocket, dia_nek_pickpocket_doit);
};

func void dia_nek_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nek_pickpocket);
};

func void dia_nek_pickpocket_back() {
    info_clearchoices(dia_nek_pickpocket);
};

instance dia_grd_3916_pickpocket(c_info) {
    npc = grd_3916_elitarny_straznik;
    nr = 900;
    condition = dia_grd_3916_pickpocket_condition;
    information = dia_grd_3916_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3916_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3916_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3916_pickpocket);
	info_addchoice(dia_grd_3916_pickpocket, dialog_back, dia_grd_3916_pickpocket_back);
	info_addchoice(dia_grd_3916_pickpocket, dialog_pickpocket, dia_grd_3916_pickpocket_doit);
};

func void dia_grd_3916_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_3916_pickpocket);
};

func void dia_grd_3916_pickpocket_back() {
    info_clearchoices(dia_grd_3916_pickpocket);
};

instance dia_grd_3917_pickpocket(c_info) {
    npc = grd_3917_elitarny_straznik;
    nr = 900;
    condition = dia_grd_3917_pickpocket_condition;
    information = dia_grd_3917_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3917_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3917_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3917_pickpocket);
	info_addchoice(dia_grd_3917_pickpocket, dialog_back, dia_grd_3917_pickpocket_back);
	info_addchoice(dia_grd_3917_pickpocket, dialog_pickpocket, dia_grd_3917_pickpocket_doit);
};

func void dia_grd_3917_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_3917_pickpocket);
};

func void dia_grd_3917_pickpocket_back() {
    info_clearchoices(dia_grd_3917_pickpocket);
};

instance dia_grd_3932_pickpocket(c_info) {
    npc = grd_3932_dungeonguard;
    nr = 900;
    condition = dia_grd_3932_pickpocket_condition;
    information = dia_grd_3932_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_3932_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD - 5, 30);
};

func void dia_grd_3932_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_3932_pickpocket);
	info_addchoice(dia_grd_3932_pickpocket, dialog_back, dia_grd_3932_pickpocket_back);
	info_addchoice(dia_grd_3932_pickpocket, dialog_pickpocket, dia_grd_3932_pickpocket_doit);
};

func void dia_grd_3932_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_grd_3932_pickpocket);
};

func void dia_grd_3932_pickpocket_back() {
    info_clearchoices(dia_grd_3932_pickpocket);
};

instance dia_berg_pickpocket(c_info) {
    npc = grd_3934_berg;
    nr = 900;
    condition = dia_berg_pickpocket_condition;
    information = dia_berg_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_berg_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_berg_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_berg_pickpocket);
	info_addchoice(dia_berg_pickpocket, dialog_back, dia_berg_pickpocket_back);
	info_addchoice(dia_berg_pickpocket, dialog_pickpocket, dia_berg_pickpocket_doit);
};

func void dia_berg_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_berg_pickpocket);
};

func void dia_berg_pickpocket_back() {
    info_clearchoices(dia_berg_pickpocket);
};

instance dia_hector_pickpocket(c_info) {
    npc = grd_3935_hector;
    nr = 900;
    condition = dia_hector_pickpocket_condition;
    information = dia_hector_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hector_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD - 3, 30);
};

func void dia_hector_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hector_pickpocket);
	info_addchoice(dia_hector_pickpocket, dialog_back, dia_hector_pickpocket_back);
	info_addchoice(dia_hector_pickpocket, dialog_pickpocket, dia_hector_pickpocket_doit);
};

func void dia_hector_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_hector_pickpocket);
};

func void dia_hector_pickpocket_back() {
    info_clearchoices(dia_hector_pickpocket);
};

instance dia_trip_pickpocket(c_info) {
    npc = grd_4060_trip;
    nr = 900;
    condition = dia_trip_pickpocket_condition;
    information = dia_trip_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_trip_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_trip_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_trip_pickpocket);
	info_addchoice(dia_trip_pickpocket, dialog_back, dia_trip_pickpocket_back);
	info_addchoice(dia_trip_pickpocket, dialog_pickpocket, dia_trip_pickpocket_doit);
};

func void dia_trip_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_trip_pickpocket);
};

func void dia_trip_pickpocket_back() {
    info_clearchoices(dia_trip_pickpocket);
};

instance dia_artegor_pickpocket(c_info) {
    npc = grd_7001_artegor;
    nr = 900;
    condition = dia_artegor_pickpocket_condition;
    information = dia_artegor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_artegor_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_artegor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_artegor_pickpocket);
	info_addchoice(dia_artegor_pickpocket, dialog_back, dia_artegor_pickpocket_back);
	info_addchoice(dia_artegor_pickpocket, dialog_pickpocket, dia_artegor_pickpocket_doit);
};

func void dia_artegor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_artegor_pickpocket);
};

func void dia_artegor_pickpocket_back() {
    info_clearchoices(dia_artegor_pickpocket);
};

instance dia_kucharz_pickpocket(c_info) {
    npc = grd_7002_kucharz;
    nr = 900;
    condition = dia_kucharz_pickpocket_condition;
    information = dia_kucharz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kucharz_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 30);
};

func void dia_kucharz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kucharz_pickpocket);
	info_addchoice(dia_kucharz_pickpocket, dialog_back, dia_kucharz_pickpocket_back);
	info_addchoice(dia_kucharz_pickpocket, dialog_pickpocket, dia_kucharz_pickpocket_doit);
};

func void dia_kucharz_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kucharz_pickpocket);
};

func void dia_kucharz_pickpocket_back() {
    info_clearchoices(dia_kucharz_pickpocket);
};

instance dia_gamal_pickpocket(c_info) {
    npc = grd_7004_gamal;
    nr = 900;
    condition = dia_gamal_pickpocket_condition;
    information = dia_gamal_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gamal_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_gamal_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gamal_pickpocket);
	info_addchoice(dia_gamal_pickpocket, dialog_back, dia_gamal_pickpocket_back);
	info_addchoice(dia_gamal_pickpocket, dialog_pickpocket, dia_gamal_pickpocket_doit);
};

func void dia_gamal_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gamal_pickpocket);
};

func void dia_gamal_pickpocket_back() {
    info_clearchoices(dia_gamal_pickpocket);
};

instance dia_spike_pickpocket(c_info) {
    npc = grd_7005_spike;
    nr = 900;
    condition = dia_spike_pickpocket_condition;
    information = dia_spike_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_spike_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_spike_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_spike_pickpocket);
	info_addchoice(dia_spike_pickpocket, dialog_back, dia_spike_pickpocket_back);
	info_addchoice(dia_spike_pickpocket, dialog_pickpocket, dia_spike_pickpocket_doit);
};

func void dia_spike_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_spike_pickpocket);
};

func void dia_spike_pickpocket_back() {
    info_clearchoices(dia_spike_pickpocket);
};

instance dia_joel_pickpocket(c_info) {
    npc = grd_7006_joel;
    nr = 900;
    condition = dia_joel_pickpocket_condition;
    information = dia_joel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_joel_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_joel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_joel_pickpocket);
	info_addchoice(dia_joel_pickpocket, dialog_back, dia_joel_pickpocket_back);
	info_addchoice(dia_joel_pickpocket, dialog_pickpocket, dia_joel_pickpocket_doit);
};

func void dia_joel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_joel_pickpocket);
};

func void dia_joel_pickpocket_back() {
    info_clearchoices(dia_joel_pickpocket);
};

instance dia_mirzo_pickpocket(c_info) {
    npc = grd_7007_mirzo;
    nr = 900;
    condition = dia_mirzo_pickpocket_condition;
    information = dia_mirzo_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mirzo_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_mirzo_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mirzo_pickpocket);
	info_addchoice(dia_mirzo_pickpocket, dialog_back, dia_mirzo_pickpocket_back);
	info_addchoice(dia_mirzo_pickpocket, dialog_pickpocket, dia_mirzo_pickpocket_doit);
};

func void dia_mirzo_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mirzo_pickpocket);
};

func void dia_mirzo_pickpocket_back() {
    info_clearchoices(dia_mirzo_pickpocket);
};

instance dia_andrew_pickpocket(c_info) {
    npc = grd_7008_tukash;
    nr = 900;
    condition = dia_andrew_pickpocket_condition;
    information = dia_andrew_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_andrew_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_andrew_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_andrew_pickpocket);
	info_addchoice(dia_andrew_pickpocket, dialog_back, dia_andrew_pickpocket_back);
	info_addchoice(dia_andrew_pickpocket, dialog_pickpocket, dia_andrew_pickpocket_doit);
};

func void dia_andrew_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_andrew_pickpocket);
};

func void dia_andrew_pickpocket_back() {
    info_clearchoices(dia_andrew_pickpocket);
};

instance dia_baallukor_world_pickpocket(c_info) {
    npc = gur_1213_baallukor_world;
    nr = 900;
    condition = dia_baallukor_world_pickpocket_condition;
    information = dia_baallukor_world_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baallukor_world_pickpocket_condition() {
	c_beklauen(baseThfChanceGUR, 40);
};

func void dia_baallukor_world_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baallukor_world_pickpocket);
	info_addchoice(dia_baallukor_world_pickpocket, dialog_back, dia_baallukor_world_pickpocket_back);
	info_addchoice(dia_baallukor_world_pickpocket, dialog_pickpocket, dia_baallukor_world_pickpocket_doit);
};

func void dia_baallukor_world_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_baallukor_world_pickpocket);
};

func void dia_baallukor_world_pickpocket_back() {
    info_clearchoices(dia_baallukor_world_pickpocket);
};

instance dia_vlk_7050_pickpocket(c_info) {
    npc = vlk_7050_robol;
    nr = 900;
    condition = dia_vlk_7050_pickpocket_condition;
    information = dia_vlk_7050_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_7050_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_7050_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_7050_pickpocket);
	info_addchoice(dia_vlk_7050_pickpocket, dialog_back, dia_vlk_7050_pickpocket_back);
	info_addchoice(dia_vlk_7050_pickpocket, dialog_pickpocket, dia_vlk_7050_pickpocket_doit);
};

func void dia_vlk_7050_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_7050_pickpocket);
};

func void dia_vlk_7050_pickpocket_back() {
    info_clearchoices(dia_vlk_7050_pickpocket);
};

instance dia_vlk_7011_pickpocket(c_info) {
    npc = vlk_7011_kopacz;
    nr = 900;
    condition = dia_vlk_7011_pickpocket_condition;
    information = dia_vlk_7011_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_7011_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_7011_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_7011_pickpocket);
	info_addchoice(dia_vlk_7011_pickpocket, dialog_back, dia_vlk_7011_pickpocket_back);
	info_addchoice(dia_vlk_7011_pickpocket, dialog_pickpocket, dia_vlk_7011_pickpocket_doit);
};

func void dia_vlk_7011_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_7011_pickpocket);
};

func void dia_vlk_7011_pickpocket_back() {
    info_clearchoices(dia_vlk_7011_pickpocket);
};

instance dia_abel_pickpocket(c_info) {
    npc = vlk_7003_abel;
    nr = 900;
    condition = dia_abel_pickpocket_condition;
    information = dia_abel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_abel_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_abel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_abel_pickpocket);
	info_addchoice(dia_abel_pickpocket, dialog_back, dia_abel_pickpocket_back);
	info_addchoice(dia_abel_pickpocket, dialog_pickpocket, dia_abel_pickpocket_doit);
};

func void dia_abel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_abel_pickpocket);
};

func void dia_abel_pickpocket_back() {
    info_clearchoices(dia_abel_pickpocket);
};

instance dia_clayde_pickpocket(c_info) {
    npc = vlk_595_clayde;
    nr = 900;
    condition = dia_clayde_pickpocket_condition;
    information = dia_clayde_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_clayde_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_clayde_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_clayde_pickpocket);
	info_addchoice(dia_clayde_pickpocket, dialog_back, dia_clayde_pickpocket_back);
	info_addchoice(dia_clayde_pickpocket, dialog_pickpocket, dia_clayde_pickpocket_doit);
};

func void dia_clayde_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_clayde_pickpocket);
};

func void dia_clayde_pickpocket_back() {
    info_clearchoices(dia_clayde_pickpocket);
};

instance dia_bonie_pickpocket(c_info) {
    npc = vlk_594_bonie;
    nr = 900;
    condition = dia_bonie_pickpocket_condition;
    information = dia_bonie_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_bonie_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 30);
};

func void dia_bonie_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_bonie_pickpocket);
	info_addchoice(dia_bonie_pickpocket, dialog_back, dia_bonie_pickpocket_back);
	info_addchoice(dia_bonie_pickpocket, dialog_pickpocket, dia_bonie_pickpocket_doit);
};

func void dia_bonie_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_bonie_pickpocket);
};

func void dia_bonie_pickpocket_back() {
    info_clearchoices(dia_bonie_pickpocket);
};

instance dia_vlk_577_pickpocket(c_info) {
    npc = vlk_577_buddler;
    nr = 900;
    condition = dia_vlk_577_pickpocket_condition;
    information = dia_vlk_577_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_577_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_577_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_577_pickpocket);
	info_addchoice(dia_vlk_577_pickpocket, dialog_back, dia_vlk_577_pickpocket_back);
	info_addchoice(dia_vlk_577_pickpocket, dialog_pickpocket, dia_vlk_577_pickpocket_doit);
};

func void dia_vlk_577_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_577_pickpocket);
};

func void dia_vlk_577_pickpocket_back() {
    info_clearchoices(dia_vlk_577_pickpocket);
};

instance dia_vlk_575_pickpocket(c_info) {
    npc = vlk_575_buddler;
    nr = 900;
    condition = dia_vlk_575_pickpocket_condition;
    information = dia_vlk_575_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_575_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_575_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_575_pickpocket);
	info_addchoice(dia_vlk_575_pickpocket, dialog_back, dia_vlk_575_pickpocket_back);
	info_addchoice(dia_vlk_575_pickpocket, dialog_pickpocket, dia_vlk_575_pickpocket_doit);
};

func void dia_vlk_575_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_575_pickpocket);
};

func void dia_vlk_575_pickpocket_back() {
    info_clearchoices(dia_vlk_575_pickpocket);
};

instance dia_vlk_565_pickpocket(c_info) {
    npc = vlk_565_buddler;
    nr = 900;
    condition = dia_vlk_565_pickpocket_condition;
    information = dia_vlk_565_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_565_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_565_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_565_pickpocket);
	info_addchoice(dia_vlk_565_pickpocket, dialog_back, dia_vlk_565_pickpocket_back);
	info_addchoice(dia_vlk_565_pickpocket, dialog_pickpocket, dia_vlk_565_pickpocket_doit);
};

func void dia_vlk_565_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_565_pickpocket);
};

func void dia_vlk_565_pickpocket_back() {
    info_clearchoices(dia_vlk_565_pickpocket);
};

instance dia_vlk_553_pickpocket(c_info) {
    npc = vlk_553_buddler;
    nr = 900;
    condition = dia_vlk_553_pickpocket_condition;
    information = dia_vlk_553_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_553_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_553_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_553_pickpocket);
	info_addchoice(dia_vlk_553_pickpocket, dialog_back, dia_vlk_553_pickpocket_back);
	info_addchoice(dia_vlk_553_pickpocket, dialog_pickpocket, dia_vlk_553_pickpocket_doit);
};

func void dia_vlk_553_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_553_pickpocket);
};

func void dia_vlk_553_pickpocket_back() {
    info_clearchoices(dia_vlk_553_pickpocket);
};

instance dia_vlk_529_pickpocket(c_info) {
    npc = vlk_529_buddler;
    nr = 900;
    condition = dia_vlk_529_pickpocket_condition;
    information = dia_vlk_529_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_529_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_529_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_529_pickpocket);
	info_addchoice(dia_vlk_529_pickpocket, dialog_back, dia_vlk_529_pickpocket_back);
	info_addchoice(dia_vlk_529_pickpocket, dialog_pickpocket, dia_vlk_529_pickpocket_doit);
};

func void dia_vlk_529_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_529_pickpocket);
};

func void dia_vlk_529_pickpocket_back() {
    info_clearchoices(dia_vlk_529_pickpocket);
};

instance dia_vlk_517_pickpocket(c_info) {
    npc = vlk_517_buddler;
    nr = 900;
    condition = dia_vlk_517_pickpocket_condition;
    information = dia_vlk_517_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_517_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_517_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_517_pickpocket);
	info_addchoice(dia_vlk_517_pickpocket, dialog_back, dia_vlk_517_pickpocket_back);
	info_addchoice(dia_vlk_517_pickpocket, dialog_pickpocket, dia_vlk_517_pickpocket_doit);
};

func void dia_vlk_517_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_517_pickpocket);
};

func void dia_vlk_517_pickpocket_back() {
    info_clearchoices(dia_vlk_517_pickpocket);
};

instance dia_vlk_514_pickpocket(c_info) {
    npc = vlk_514_buddler;
    nr = 900;
    condition = dia_vlk_514_pickpocket_condition;
    information = dia_vlk_514_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_514_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_514_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_514_pickpocket);
	info_addchoice(dia_vlk_514_pickpocket, dialog_back, dia_vlk_514_pickpocket_back);
	info_addchoice(dia_vlk_514_pickpocket, dialog_pickpocket, dia_vlk_514_pickpocket_doit);
};

func void dia_vlk_514_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_514_pickpocket);
};

func void dia_vlk_514_pickpocket_back() {
    info_clearchoices(dia_vlk_514_pickpocket);
};

instance dia_vlk_508_pickpocket(c_info) {
    npc = vlk_508_buddler;
    nr = 900;
    condition = dia_vlk_508_pickpocket_condition;
    information = dia_vlk_508_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_508_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_508_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_508_pickpocket);
	info_addchoice(dia_vlk_508_pickpocket, dialog_back, dia_vlk_508_pickpocket_back);
	info_addchoice(dia_vlk_508_pickpocket, dialog_pickpocket, dia_vlk_508_pickpocket_doit);
};

func void dia_vlk_508_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_508_pickpocket);
};

func void dia_vlk_508_pickpocket_back() {
    info_clearchoices(dia_vlk_508_pickpocket);
};

instance dia_danny_pickpocket(c_info) {
    npc = vlk_5070_danny;
    nr = 900;
    condition = dia_danny_pickpocket_condition;
    information = dia_danny_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_danny_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_danny_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_danny_pickpocket);
	info_addchoice(dia_danny_pickpocket, dialog_back, dia_danny_pickpocket_back);
	info_addchoice(dia_danny_pickpocket, dialog_pickpocket, dia_danny_pickpocket_doit);
};

func void dia_danny_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_danny_pickpocket);
};

func void dia_danny_pickpocket_back() {
    info_clearchoices(dia_danny_pickpocket);
};

instance dia_vlk_501_pickpocket(c_info) {
    npc = vlk_501_buddler;
    nr = 900;
    condition = dia_vlk_501_pickpocket_condition;
    information = dia_vlk_501_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_501_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 15);
};

func void dia_vlk_501_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_501_pickpocket);
	info_addchoice(dia_vlk_501_pickpocket, dialog_back, dia_vlk_501_pickpocket_back);
	info_addchoice(dia_vlk_501_pickpocket, dialog_pickpocket, dia_vlk_501_pickpocket_doit);
};

func void dia_vlk_501_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_501_pickpocket);
};

func void dia_vlk_501_pickpocket_back() {
    info_clearchoices(dia_vlk_501_pickpocket);
};

instance dia_tippler_pickpocket(c_info) {
    npc = vlk_3999_tippler;
    nr = 900;
    condition = dia_tippler_pickpocket_condition;
    information = dia_tippler_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tippler_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 25);
};

func void dia_tippler_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tippler_pickpocket);
	info_addchoice(dia_tippler_pickpocket, dialog_back, dia_tippler_pickpocket_back);
	info_addchoice(dia_tippler_pickpocket, dialog_pickpocket, dia_tippler_pickpocket_doit);
};

func void dia_tippler_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_tippler_pickpocket);
};

func void dia_tippler_pickpocket_back() {
    info_clearchoices(dia_tippler_pickpocket);
};

instance dia_vlk_2004_pickpocket(c_info) {
    npc = vlk_2004_robotnik;
    nr = 900;
    condition = dia_vlk_2004_pickpocket_condition;
    information = dia_vlk_2004_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vlk_2004_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_vlk_2004_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vlk_2004_pickpocket);
	info_addchoice(dia_vlk_2004_pickpocket, dialog_back, dia_vlk_2004_pickpocket_back);
	info_addchoice(dia_vlk_2004_pickpocket, dialog_pickpocket, dia_vlk_2004_pickpocket_doit);
};

func void dia_vlk_2004_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vlk_2004_pickpocket);
};

func void dia_vlk_2004_pickpocket_back() {
    info_clearchoices(dia_vlk_2004_pickpocket);
};
/*
instance dia_oldalchemyman_pickpocket(c_info) {
    npc = tpl_5083_oldalchemyman;
    nr = 900;
    condition = dia_oldalchemyman_pickpocket_condition;
    information = dia_oldalchemyman_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_oldalchemyman_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 30);
};

func void dia_oldalchemyman_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_oldalchemyman_pickpocket);
	info_addchoice(dia_oldalchemyman_pickpocket, dialog_back, dia_oldalchemyman_pickpocket_back);
	info_addchoice(dia_oldalchemyman_pickpocket, dialog_pickpocket, dia_oldalchemyman_pickpocket_doit);
};

func void dia_oldalchemyman_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_oldalchemyman_pickpocket);
};

func void dia_oldalchemyman_pickpocket_back() {
    info_clearchoices(dia_oldalchemyman_pickpocket);
};
*/
instance dia_shan_pickpocket(c_info) {
    npc = tpl_5004_shan;
    nr = 900;
    condition = dia_shan_pickpocket_condition;
    information = dia_shan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_shan_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 35);
};

func void dia_shan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_shan_pickpocket);
	info_addchoice(dia_shan_pickpocket, dialog_back, dia_shan_pickpocket_back);
	info_addchoice(dia_shan_pickpocket, dialog_pickpocket, dia_shan_pickpocket_doit);
};

func void dia_shan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_shan_pickpocket);
};

func void dia_shan_pickpocket_back() {
    info_clearchoices(dia_shan_pickpocket);
};

instance dia_gornalin_pickpocket(c_info) {
    npc = tpl_3928_gornalin;
    nr = 900;
    condition = dia_gornalin_pickpocket_condition;
    information = dia_gornalin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornalin_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 35);
};

func void dia_gornalin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornalin_pickpocket);
	info_addchoice(dia_gornalin_pickpocket, dialog_back, dia_gornalin_pickpocket_back);
	info_addchoice(dia_gornalin_pickpocket, dialog_pickpocket, dia_gornalin_pickpocket_doit);
};

func void dia_gornalin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornalin_pickpocket);
};

func void dia_gornalin_pickpocket_back() {
    info_clearchoices(dia_gornalin_pickpocket);
};

instance dia_ezehiel_pickpocket(c_info) {
    npc = tpl_3054_ezehiel;
    nr = 900;
    condition = dia_ezehiel_pickpocket_condition;
    information = dia_ezehiel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ezehiel_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 35);
};

func void dia_ezehiel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_ezehiel_pickpocket);
	info_addchoice(dia_ezehiel_pickpocket, dialog_back, dia_ezehiel_pickpocket_back);
	info_addchoice(dia_ezehiel_pickpocket, dialog_pickpocket, dia_ezehiel_pickpocket_doit);
};

func void dia_ezehiel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_ezehiel_pickpocket);
};

func void dia_ezehiel_pickpocket_back() {
    info_clearchoices(dia_ezehiel_pickpocket);
};

instance dia_gornatokas_pickpocket(c_info) {
    npc = tpl_1490_gornatokas;
    nr = 900;
    condition = dia_gornatokas_pickpocket_condition;
    information = dia_gornatokas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornatokas_pickpocket_condition() {
	c_beklauen(baseThfChanceTPL, 35);
};

func void dia_gornatokas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornatokas_pickpocket);
	info_addchoice(dia_gornatokas_pickpocket, dialog_back, dia_gornatokas_pickpocket_back);
	info_addchoice(dia_gornatokas_pickpocket, dialog_pickpocket, dia_gornatokas_pickpocket_doit);
};

func void dia_gornatokas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gornatokas_pickpocket);
};

func void dia_gornatokas_pickpocket_back() {
    info_clearchoices(dia_gornatokas_pickpocket);
};

instance dia_stt_319_pickpocket(c_info) {
    npc = stt_319_schatten;
    nr = 900;
    condition = dia_stt_319_pickpocket_condition;
    information = dia_stt_319_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stt_319_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 28);
};

func void dia_stt_319_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stt_319_pickpocket);
	info_addchoice(dia_stt_319_pickpocket, dialog_back, dia_stt_319_pickpocket_back);
	info_addchoice(dia_stt_319_pickpocket, dialog_pickpocket, dia_stt_319_pickpocket_doit);
};

func void dia_stt_319_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_stt_319_pickpocket);
};

func void dia_stt_319_pickpocket_back() {
    info_clearchoices(dia_stt_319_pickpocket);
};

instance dia_alvaro_pickpocket(c_info) {
    npc = sld_5575_alvaro;
    nr = 900;
    condition = dia_alvaro_pickpocket_condition;
    information = dia_alvaro_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_alvaro_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_alvaro_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_alvaro_pickpocket);
	info_addchoice(dia_alvaro_pickpocket, dialog_back, dia_alvaro_pickpocket_back);
	info_addchoice(dia_alvaro_pickpocket, dialog_pickpocket, dia_alvaro_pickpocket_doit);
};

func void dia_alvaro_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_alvaro_pickpocket);
};

func void dia_alvaro_pickpocket_back() {
    info_clearchoices(dia_alvaro_pickpocket);
};

instance dia_gestath_pickpocket(c_info) {
    npc = sld_3915_gestath;
    nr = 900;
    condition = dia_gestath_pickpocket_condition;
    information = dia_gestath_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gestath_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_gestath_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gestath_pickpocket);
	info_addchoice(dia_gestath_pickpocket, dialog_back, dia_gestath_pickpocket_back);
	info_addchoice(dia_gestath_pickpocket, dialog_pickpocket, dia_gestath_pickpocket_doit);
};

func void dia_gestath_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gestath_pickpocket);
};

func void dia_gestath_pickpocket_back() {
    info_clearchoices(dia_gestath_pickpocket);
};

instance dia_cyrus_pickpocket(c_info) {
    npc = sld_2806_cyrus;
    nr = 900;
    condition = dia_cyrus_pickpocket_condition;
    information = dia_cyrus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cyrus_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_cyrus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cyrus_pickpocket);
	info_addchoice(dia_cyrus_pickpocket, dialog_back, dia_cyrus_pickpocket_back);
	info_addchoice(dia_cyrus_pickpocket, dialog_pickpocket, dia_cyrus_pickpocket_doit);
};

func void dia_cyrus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_cyrus_pickpocket);
};

func void dia_cyrus_pickpocket_back() {
    info_clearchoices(dia_cyrus_pickpocket);
};

instance dia_outlam_pickpocket(c_info) {
    npc = sld_2803_outlam;
    nr = 900;
    condition = dia_outlam_pickpocket_condition;
    information = dia_outlam_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_outlam_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 35);
};

func void dia_outlam_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_outlam_pickpocket);
	info_addchoice(dia_outlam_pickpocket, dialog_back, dia_outlam_pickpocket_back);
	info_addchoice(dia_outlam_pickpocket, dialog_pickpocket, dia_outlam_pickpocket_doit);
};

func void dia_outlam_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_outlam_pickpocket);
};

func void dia_outlam_pickpocket_back() {
    info_clearchoices(dia_outlam_pickpocket);
};

instance dia_radex_pickpocket(c_info) {
    npc = radex;
    nr = 900;
    condition = dia_radex_pickpocket_condition;
    information = dia_radex_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_radex_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_radex_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_radex_pickpocket);
	info_addchoice(dia_radex_pickpocket, dialog_back, dia_radex_pickpocket_back);
	info_addchoice(dia_radex_pickpocket, dialog_pickpocket, dia_radex_pickpocket_doit);
};

func void dia_radex_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_radex_pickpocket);
};

func void dia_radex_pickpocket_back() {
    info_clearchoices(dia_radex_pickpocket);
};

instance dia_outlander_pickpocket(c_info) {
    npc = outlander;
    nr = 900;
    condition = dia_outlander_pickpocket_condition;
    information = dia_outlander_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_outlander_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_outlander_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_outlander_pickpocket);
	info_addchoice(dia_outlander_pickpocket, dialog_back, dia_outlander_pickpocket_back);
	info_addchoice(dia_outlander_pickpocket, dialog_pickpocket, dia_outlander_pickpocket_doit);
};

func void dia_outlander_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_outlander_pickpocket);
};

func void dia_outlander_pickpocket_back() {
    info_clearchoices(dia_outlander_pickpocket);
};

instance dia_vincent_pickpocket(c_info) {
    npc = org_956_vincent;
    nr = 900;
    condition = dia_vincent_pickpocket_condition;
    information = dia_vincent_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vincent_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_vincent_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vincent_pickpocket);
	info_addchoice(dia_vincent_pickpocket, dialog_back, dia_vincent_pickpocket_back);
	info_addchoice(dia_vincent_pickpocket, dialog_pickpocket, dia_vincent_pickpocket_doit);
};

func void dia_vincent_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vincent_pickpocket);
};

func void dia_vincent_pickpocket_back() {
    info_clearchoices(dia_vincent_pickpocket);
};

instance dia_huan_pickpocket(c_info) {
    npc = org_9550_huan;
    nr = 900;
    condition = dia_huan_pickpocket_condition;
    information = dia_huan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_huan_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_huan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_huan_pickpocket);
	info_addchoice(dia_huan_pickpocket, dialog_back, dia_huan_pickpocket_back);
	info_addchoice(dia_huan_pickpocket, dialog_pickpocket, dia_huan_pickpocket_doit);
};

func void dia_huan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_huan_pickpocket);
};

func void dia_huan_pickpocket_back() {
    info_clearchoices(dia_huan_pickpocket);
};

instance dia_fil_pickpocket(c_info) {
    npc = org_955_fil;
    nr = 900;
    condition = dia_fil_pickpocket_condition;
    information = dia_fil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_fil_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_fil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_fil_pickpocket);
	info_addchoice(dia_fil_pickpocket, dialog_back, dia_fil_pickpocket_back);
	info_addchoice(dia_fil_pickpocket, dialog_pickpocket, dia_fil_pickpocket_doit);
};

func void dia_fil_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_fil_pickpocket);
};

func void dia_fil_pickpocket_back() {
    info_clearchoices(dia_fil_pickpocket);
};

instance dia_kil_pickpocket(c_info) {
    npc = org_954_kil;
    nr = 900;
    condition = dia_kil_pickpocket_condition;
    information = dia_kil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_kil_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_kil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_kil_pickpocket);
	info_addchoice(dia_kil_pickpocket, dialog_back, dia_kil_pickpocket_back);
	info_addchoice(dia_kil_pickpocket, dialog_pickpocket, dia_kil_pickpocket_doit);
};

func void dia_kil_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_kil_pickpocket);
};

func void dia_kil_pickpocket_back() {
    info_clearchoices(dia_kil_pickpocket);
};

instance dia_riv_pickpocket2(c_info) {
    npc = org_952_riv;
    nr = 900;
    condition = dia_riv_pickpocket2_condition;
    information = dia_riv_pickpocket2_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_riv_pickpocket2_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_riv_pickpocket2_info() {
	b_steal_message();
	info_clearchoices(dia_riv_pickpocket2);
	info_addchoice(dia_riv_pickpocket2, dialog_back, dia_riv_pickpocket2_back);
	info_addchoice(dia_riv_pickpocket2, dialog_pickpocket, dia_riv_pickpocket2_doit);
};

func void dia_riv_pickpocket2_doit() {
    b_beklauen();
    info_clearchoices(dia_riv_pickpocket2);
};

func void dia_riv_pickpocket2_back() {
    info_clearchoices(dia_riv_pickpocket2);
};

instance dia_calash_pickpocket(c_info) {
    npc = org_857_calash;
    nr = 900;
    condition = dia_calash_pickpocket_condition;
    information = dia_calash_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_calash_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_calash_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_calash_pickpocket);
	info_addchoice(dia_calash_pickpocket, dialog_back, dia_calash_pickpocket_back);
	info_addchoice(dia_calash_pickpocket, dialog_pickpocket, dia_calash_pickpocket_doit);
};

func void dia_calash_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_calash_pickpocket);
};

func void dia_calash_pickpocket_back() {
    info_clearchoices(dia_calash_pickpocket);
};

instance dia_zick_pickpocket(c_info) {
    npc = org_823_zick;
    nr = 900;
    condition = dia_zick_pickpocket_condition;
    information = dia_zick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_zick_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_zick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_zick_pickpocket);
	info_addchoice(dia_zick_pickpocket, dialog_back, dia_zick_pickpocket_back);
	info_addchoice(dia_zick_pickpocket, dialog_pickpocket, dia_zick_pickpocket_doit);
};

func void dia_zick_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_zick_pickpocket);
};

func void dia_zick_pickpocket_back() {
    info_clearchoices(dia_zick_pickpocket);
};

instance dia_org_816_pickpocket(c_info) {
    npc = org_816_organisator;
    nr = 900;
    condition = dia_org_816_pickpocket_condition;
    information = dia_org_816_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_816_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_816_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_816_pickpocket);
	info_addchoice(dia_org_816_pickpocket, dialog_back, dia_org_816_pickpocket_back);
	info_addchoice(dia_org_816_pickpocket, dialog_pickpocket, dia_org_816_pickpocket_doit);
};

func void dia_org_816_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_816_pickpocket);
};

func void dia_org_816_pickpocket_back() {
    info_clearchoices(dia_org_816_pickpocket);
};

instance dia_org_807_pickpocket(c_info) {
    npc = org_807_organisator;
    nr = 900;
    condition = dia_org_807_pickpocket_condition;
    information = dia_org_807_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_807_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_org_807_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_807_pickpocket);
	info_addchoice(dia_org_807_pickpocket, dialog_back, dia_org_807_pickpocket_back);
	info_addchoice(dia_org_807_pickpocket, dialog_pickpocket, dia_org_807_pickpocket_doit);
};

func void dia_org_807_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_org_807_pickpocket);
};

func void dia_org_807_pickpocket_back() {
    info_clearchoices(dia_org_807_pickpocket);
};

instance dia_rene_pickpocket(c_info) {
    npc = org_806_rene;
    nr = 900;
    condition = dia_rene_pickpocket_condition;
    information = dia_rene_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rene_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_rene_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rene_pickpocket);
	info_addchoice(dia_rene_pickpocket, dialog_back, dia_rene_pickpocket_back);
	info_addchoice(dia_rene_pickpocket, dialog_pickpocket, dia_rene_pickpocket_doit);
};

func void dia_rene_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_rene_pickpocket);
};

func void dia_rene_pickpocket_back() {
    info_clearchoices(dia_rene_pickpocket);
};

instance dia_non_5050_pickpocket(c_info) {
    npc = non_5050_raeuber;
    nr = 900;
    condition = dia_non_5050_pickpocket_condition;
    information = dia_non_5050_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5050_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_5050_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5050_pickpocket);
	info_addchoice(dia_non_5050_pickpocket, dialog_back, dia_non_5050_pickpocket_back);
	info_addchoice(dia_non_5050_pickpocket, dialog_pickpocket, dia_non_5050_pickpocket_doit);
};

func void dia_non_5050_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5050_pickpocket);
};

func void dia_non_5050_pickpocket_back() {
    info_clearchoices(dia_non_5050_pickpocket);
};

instance dia_mazin_pickpocket(c_info) {
    npc = org_2704_mazin;
    nr = 900;
    condition = dia_mazin_pickpocket_condition;
    information = dia_mazin_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mazin_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_mazin_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mazin_pickpocket);
	info_addchoice(dia_mazin_pickpocket, dialog_back, dia_mazin_pickpocket_back);
	info_addchoice(dia_mazin_pickpocket, dialog_pickpocket, dia_mazin_pickpocket_doit);
};

func void dia_mazin_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mazin_pickpocket);
};

func void dia_mazin_pickpocket_back() {
    info_clearchoices(dia_mazin_pickpocket);
};

instance dia_nov_1380_pickpocket(c_info) {
    npc = nov_1380_artfiactsthief;
    nr = 900;
    condition = dia_nov_1380_pickpocket_condition;
    information = dia_nov_1380_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_nov_1380_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 25);
};

func void dia_nov_1380_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_nov_1380_pickpocket);
	info_addchoice(dia_nov_1380_pickpocket, dialog_back, dia_nov_1380_pickpocket_back);
	info_addchoice(dia_nov_1380_pickpocket, dialog_pickpocket, dia_nov_1380_pickpocket_doit);
};

func void dia_nov_1380_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_nov_1380_pickpocket);
};

func void dia_nov_1380_pickpocket_back() {
    info_clearchoices(dia_nov_1380_pickpocket);
};

instance dia_ghoran_pickpocket2(c_info) {
    npc = nov_1379_ghoran;
    nr = 900;
    condition = dia_ghoran_pickpocket2_condition;
    information = dia_ghoran_pickpocket2_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_ghoran_pickpocket2_condition() {
	c_beklauen(baseThfChanceNOV, 25);
};

func void dia_ghoran_pickpocket2_info() {
	b_steal_message();
	info_clearchoices(dia_ghoran_pickpocket2);
	info_addchoice(dia_ghoran_pickpocket2, dialog_back, dia_ghoran_pickpocket2_back);
	info_addchoice(dia_ghoran_pickpocket2, dialog_pickpocket, dia_ghoran_pickpocket2_doit);
};

func void dia_ghoran_pickpocket2_doit() {
    b_beklauen();
    info_clearchoices(dia_ghoran_pickpocket2);
};

func void dia_ghoran_pickpocket2_back() {
    info_clearchoices(dia_ghoran_pickpocket2);
};

instance dia_hanson_pickpocket(c_info) {
    npc = nov_1378_hanson;
    nr = 900;
    condition = dia_hanson_pickpocket_condition;
    information = dia_hanson_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanson_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_hanson_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanson_pickpocket);
	info_addchoice(dia_hanson_pickpocket, dialog_back, dia_hanson_pickpocket_back);
	info_addchoice(dia_hanson_pickpocket, dialog_pickpocket, dia_hanson_pickpocket_doit);
};

func void dia_hanson_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_hanson_pickpocket);
};

func void dia_hanson_pickpocket_back() {
    info_clearchoices(dia_hanson_pickpocket);
};

instance dia_starkad_pickpocket(c_info) {
    npc = nov_1377_starkad;
    nr = 900;
    condition = dia_starkad_pickpocket_condition;
    information = dia_starkad_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_starkad_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 30);
};

func void dia_starkad_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_starkad_pickpocket);
	info_addchoice(dia_starkad_pickpocket, dialog_back, dia_starkad_pickpocket_back);
	info_addchoice(dia_starkad_pickpocket, dialog_pickpocket, dia_starkad_pickpocket_doit);
};

func void dia_starkad_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_starkad_pickpocket);
};

func void dia_starkad_pickpocket_back() {
    info_clearchoices(dia_starkad_pickpocket);
};

instance dia_steh_pickpocket(c_info) {
    npc = nov_1376_steh;
    nr = 900;
    condition = dia_steh_pickpocket_condition;
    information = dia_steh_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_steh_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 25);
};

func void dia_steh_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_steh_pickpocket);
	info_addchoice(dia_steh_pickpocket, dialog_back, dia_steh_pickpocket_back);
	info_addchoice(dia_steh_pickpocket, dialog_pickpocket, dia_steh_pickpocket_doit);
};

func void dia_steh_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_steh_pickpocket);
};

func void dia_steh_pickpocket_back() {
    info_clearchoices(dia_steh_pickpocket);
};

instance dia_hakan_pickpocket(c_info) {
    npc = nov_1375_hakan;
    nr = 900;
    condition = dia_hakan_pickpocket_condition;
    information = dia_hakan_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hakan_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 15);
};

func void dia_hakan_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hakan_pickpocket);
	info_addchoice(dia_hakan_pickpocket, dialog_back, dia_hakan_pickpocket_back);
	info_addchoice(dia_hakan_pickpocket, dialog_pickpocket, dia_hakan_pickpocket_doit);
};

func void dia_hakan_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_hakan_pickpocket);
};

func void dia_hakan_pickpocket_back() {
    info_clearchoices(dia_hakan_pickpocket);
};

instance dia_snake_pickpocket(c_info) {
    npc = non_7852_snake;
    nr = 900;
    condition = dia_snake_pickpocket_condition;
    information = dia_snake_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_snake_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 20);
};

func void dia_snake_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_snake_pickpocket);
	info_addchoice(dia_snake_pickpocket, dialog_back, dia_snake_pickpocket_back);
	info_addchoice(dia_snake_pickpocket, dialog_pickpocket, dia_snake_pickpocket_doit);
};

func void dia_snake_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_snake_pickpocket);
};

func void dia_snake_pickpocket_back() {
    info_clearchoices(dia_snake_pickpocket);
};

instance dia_non_7851_pickpocket(c_info) {
    npc = non_7851_nordmarczyk;
    nr = 900;
    condition = dia_non_7851_pickpocket_condition;
    information = dia_non_7851_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7851_pickpocket_condition() {
	c_beklauen(baseThfChanceSLD, 20);
};

func void dia_non_7851_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7851_pickpocket);
	info_addchoice(dia_non_7851_pickpocket, dialog_back, dia_non_7851_pickpocket_back);
	info_addchoice(dia_non_7851_pickpocket, dialog_pickpocket, dia_non_7851_pickpocket_doit);
};

func void dia_non_7851_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_7851_pickpocket);
};

func void dia_non_7851_pickpocket_back() {
    info_clearchoices(dia_non_7851_pickpocket);
};

instance dia_angela_pickpocket(c_info) {
    npc = non_7508_angela;
    nr = 900;
    condition = dia_angela_pickpocket_condition;
    information = dia_angela_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_angela_pickpocket_condition() {
	c_beklauen(baseThfChanceBAB, 15);
};

func void dia_angela_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_angela_pickpocket);
	info_addchoice(dia_angela_pickpocket, dialog_back, dia_angela_pickpocket_back);
	info_addchoice(dia_angela_pickpocket, dialog_pickpocket, dia_angela_pickpocket_doit);
};

func void dia_angela_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_angela_pickpocket);
};

func void dia_angela_pickpocket_back() {
    info_clearchoices(dia_angela_pickpocket);
};

instance dia_non_7504_pickpocket(c_info) {
    npc = non_7504_opetany_kopacz;
    nr = 900;
    condition = dia_non_7504_pickpocket_condition;
    information = dia_non_7504_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7504_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 10);
};

func void dia_non_7504_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7504_pickpocket);
	info_addchoice(dia_non_7504_pickpocket, dialog_back, dia_non_7504_pickpocket_back);
	info_addchoice(dia_non_7504_pickpocket, dialog_pickpocket, dia_non_7504_pickpocket_doit);
};

func void dia_non_7504_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_7504_pickpocket);
};

func void dia_non_7504_pickpocket_back() {
    info_clearchoices(dia_non_7504_pickpocket);
};

instance dia_non_7503_pickpocket(c_info) {
    npc = non_7503_opetany_kopacz;
    nr = 900;
    condition = dia_non_7503_pickpocket_condition;
    information = dia_non_7503_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7503_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 10);
};

func void dia_non_7503_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7503_pickpocket);
	info_addchoice(dia_non_7503_pickpocket, dialog_back, dia_non_7503_pickpocket_back);
	info_addchoice(dia_non_7503_pickpocket, dialog_pickpocket, dia_non_7503_pickpocket_doit);
};

func void dia_non_7503_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_7503_pickpocket);
};

func void dia_non_7503_pickpocket_back() {
    info_clearchoices(dia_non_7503_pickpocket);
};

instance dia_non_7502_pickpocket(c_info) {
    npc = non_7502_opetany_kopacz;
    nr = 900;
    condition = dia_non_7502_pickpocket_condition;
    information = dia_non_7502_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7502_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 10);
};

func void dia_non_7502_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7502_pickpocket);
	info_addchoice(dia_non_7502_pickpocket, dialog_back, dia_non_7502_pickpocket_back);
	info_addchoice(dia_non_7502_pickpocket, dialog_pickpocket, dia_non_7502_pickpocket_doit);
};

func void dia_non_7502_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_7502_pickpocket);
};

func void dia_non_7502_pickpocket_back() {
    info_clearchoices(dia_non_7502_pickpocket);
};

instance dia_felgor_pickpocket(c_info) {
    npc = non_7055_felgor;
    nr = 900;
    condition = dia_felgor_pickpocket_condition;
    information = dia_felgor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_felgor_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 20);
};

func void dia_felgor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_felgor_pickpocket);
	info_addchoice(dia_felgor_pickpocket, dialog_back, dia_felgor_pickpocket_back);
	info_addchoice(dia_felgor_pickpocket, dialog_pickpocket, dia_felgor_pickpocket_doit);
};

func void dia_felgor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_felgor_pickpocket);
};

func void dia_felgor_pickpocket_back() {
    info_clearchoices(dia_felgor_pickpocket);
};

instance dia_non_7046_pickpocket(c_info) {
    npc = non_7046_skazaniec;
    nr = 900;
    condition = dia_non_7046_pickpocket_condition;
    information = dia_non_7046_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7046_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_7046_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7046_pickpocket);
	info_addchoice(dia_non_7046_pickpocket, dialog_back, dia_non_7046_pickpocket_back);
	info_addchoice(dia_non_7046_pickpocket, dialog_pickpocket, dia_non_7046_pickpocket_doit);
};

func void dia_non_7046_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_7046_pickpocket);
};

func void dia_non_7046_pickpocket_back() {
    info_clearchoices(dia_non_7046_pickpocket);
};

instance dia_non_5677_pickpocket(c_info) {
    npc = non_5677_stary;
    nr = 900;
    condition = dia_non_5677_pickpocket_condition;
    information = dia_non_5677_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5677_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 20);
};

func void dia_non_5677_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5677_pickpocket);
	info_addchoice(dia_non_5677_pickpocket, dialog_back, dia_non_5677_pickpocket_back);
	info_addchoice(dia_non_5677_pickpocket, dialog_pickpocket, dia_non_5677_pickpocket_doit);
};

func void dia_non_5677_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5677_pickpocket);
};

func void dia_non_5677_pickpocket_back() {
    info_clearchoices(dia_non_5677_pickpocket);
};

instance dia_magnus_pickpocket(c_info) {
    npc = non_5675_magnus;
    nr = 900;
    condition = dia_magnus_pickpocket_condition;
    information = dia_magnus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_magnus_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 20);
};

func void dia_magnus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_magnus_pickpocket);
	info_addchoice(dia_magnus_pickpocket, dialog_back, dia_magnus_pickpocket_back);
	info_addchoice(dia_magnus_pickpocket, dialog_pickpocket, dia_magnus_pickpocket_doit);
};

func void dia_magnus_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_magnus_pickpocket);
};

func void dia_magnus_pickpocket_back() {
    info_clearchoices(dia_magnus_pickpocket);
};

instance dia_thompson_pickpocket(c_info) {
    npc = non_5636_thompson;
    nr = 900;
    condition = dia_thompson_pickpocket_condition;
    information = dia_thompson_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_thompson_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_thompson_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_thompson_pickpocket);
	info_addchoice(dia_thompson_pickpocket, dialog_back, dia_thompson_pickpocket_back);
	info_addchoice(dia_thompson_pickpocket, dialog_pickpocket, dia_thompson_pickpocket_doit);
};

func void dia_thompson_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_thompson_pickpocket);
};

func void dia_thompson_pickpocket_back() {
    info_clearchoices(dia_thompson_pickpocket);
};

instance dia_will_pickpocket(c_info) {
    npc = non_5635_will;
    nr = 900;
    condition = dia_will_pickpocket_condition;
    information = dia_will_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_will_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_will_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_will_pickpocket);
	info_addchoice(dia_will_pickpocket, dialog_back, dia_will_pickpocket_back);
	info_addchoice(dia_will_pickpocket, dialog_pickpocket, dia_will_pickpocket_doit);
};

func void dia_will_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_will_pickpocket);
};

func void dia_will_pickpocket_back() {
    info_clearchoices(dia_will_pickpocket);
};

instance dia_josep_pickpocket(c_info) {
    npc = non_5614_josep;
    nr = 900;
    condition = dia_josep_pickpocket_condition;
    information = dia_josep_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_josep_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 25);
};

func void dia_josep_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_josep_pickpocket);
	info_addchoice(dia_josep_pickpocket, dialog_back, dia_josep_pickpocket_back);
	info_addchoice(dia_josep_pickpocket, dialog_pickpocket, dia_josep_pickpocket_doit);
};

func void dia_josep_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_josep_pickpocket);
};

func void dia_josep_pickpocket_back() {
    info_clearchoices(dia_josep_pickpocket);
};

instance dia_mil_pickpocket(c_info) {
    npc = non_5612_mil;
    nr = 900;
    condition = dia_mil_pickpocket_condition;
    information = dia_mil_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_mil_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_mil_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_mil_pickpocket);
	info_addchoice(dia_mil_pickpocket, dialog_back, dia_mil_pickpocket_back);
	info_addchoice(dia_mil_pickpocket, dialog_pickpocket, dia_mil_pickpocket_doit);
};

func void dia_mil_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_mil_pickpocket);
};

func void dia_mil_pickpocket_back() {
    info_clearchoices(dia_mil_pickpocket);
};

instance dia_jonas_pickpocket(c_info) {
    npc = non_5611_jonas;
    nr = 900;
    condition = dia_jonas_pickpocket_condition;
    information = dia_jonas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_jonas_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_jonas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_jonas_pickpocket);
	info_addchoice(dia_jonas_pickpocket, dialog_back, dia_jonas_pickpocket_back);
	info_addchoice(dia_jonas_pickpocket, dialog_pickpocket, dia_jonas_pickpocket_doit);
};

func void dia_jonas_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_jonas_pickpocket);
};

func void dia_jonas_pickpocket_back() {
    info_clearchoices(dia_jonas_pickpocket);
};

instance dia_non_5610_pickpocket(c_info) {
    npc = non_5610_hunter;
    nr = 900;
    condition = dia_non_5610_pickpocket_condition;
    information = dia_non_5610_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5610_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_non_5610_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5610_pickpocket);
	info_addchoice(dia_non_5610_pickpocket, dialog_back, dia_non_5610_pickpocket_back);
	info_addchoice(dia_non_5610_pickpocket, dialog_pickpocket, dia_non_5610_pickpocket_doit);
};

func void dia_non_5610_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5610_pickpocket);
};

func void dia_non_5610_pickpocket_back() {
    info_clearchoices(dia_non_5610_pickpocket);
};

instance dia_non_5606_pickpocket(c_info) {
    npc = non_5606_hunter;
    nr = 900;
    condition = dia_non_5606_pickpocket_condition;
    information = dia_non_5606_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5606_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 25);
};

func void dia_non_5606_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5606_pickpocket);
	info_addchoice(dia_non_5606_pickpocket, dialog_back, dia_non_5606_pickpocket_back);
	info_addchoice(dia_non_5606_pickpocket, dialog_pickpocket, dia_non_5606_pickpocket_doit);
};

func void dia_non_5606_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5606_pickpocket);
};

func void dia_non_5606_pickpocket_back() {
    info_clearchoices(dia_non_5606_pickpocket);
};

instance dia_non_5605_pickpocket(c_info) {
    npc = non_5605_hunter;
    nr = 900;
    condition = dia_non_5605_pickpocket_condition;
    information = dia_non_5605_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5605_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_non_5605_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5605_pickpocket);
	info_addchoice(dia_non_5605_pickpocket, dialog_back, dia_non_5605_pickpocket_back);
	info_addchoice(dia_non_5605_pickpocket, dialog_pickpocket, dia_non_5605_pickpocket_doit);
};

func void dia_non_5605_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5605_pickpocket);
};

func void dia_non_5605_pickpocket_back() {
    info_clearchoices(dia_non_5605_pickpocket);
};

instance dia_firn_pickpocket(c_info) {
    npc = non_5601_firn;
    nr = 900;
    condition = dia_firn_pickpocket_condition;
    information = dia_firn_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_firn_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_firn_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_firn_pickpocket);
	info_addchoice(dia_firn_pickpocket, dialog_back, dia_firn_pickpocket_back);
	info_addchoice(dia_firn_pickpocket, dialog_pickpocket, dia_firn_pickpocket_doit);
};

func void dia_firn_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_firn_pickpocket);
};

func void dia_firn_pickpocket_back() {
    info_clearchoices(dia_firn_pickpocket);
};

instance dia_non_5027_pickpocket(c_info) {
    npc = non_5027_pirat4;
    nr = 900;
    condition = dia_non_5027_pickpocket_condition;
    information = dia_non_5027_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5027_pickpocket_condition() {
	c_beklauen(baseThfChanceNON - 15, 20);
};

func void dia_non_5027_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5027_pickpocket);
	info_addchoice(dia_non_5027_pickpocket, dialog_back, dia_non_5027_pickpocket_back);
	info_addchoice(dia_non_5027_pickpocket, dialog_pickpocket, dia_non_5027_pickpocket_doit);
};

func void dia_non_5027_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5027_pickpocket);
};

func void dia_non_5027_pickpocket_back() {
    info_clearchoices(dia_non_5027_pickpocket);
};

instance dia_non_5026_pickpocket(c_info) {
    npc = non_5026_pirat3;
    nr = 900;
    condition = dia_non_5026_pickpocket_condition;
    information = dia_non_5026_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5026_pickpocket_condition() {
	c_beklauen(baseThfChanceNON - 15, 20);
};

func void dia_non_5026_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5026_pickpocket);
	info_addchoice(dia_non_5026_pickpocket, dialog_back, dia_non_5026_pickpocket_back);
	info_addchoice(dia_non_5026_pickpocket, dialog_pickpocket, dia_non_5026_pickpocket_doit);
};

func void dia_non_5026_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5026_pickpocket);
};

func void dia_non_5026_pickpocket_back() {
    info_clearchoices(dia_non_5026_pickpocket);
};

instance dia_non_5024_pickpocket(c_info) {
    npc = non_5024_pirat1;
    nr = 900;
    condition = dia_non_5024_pickpocket_condition;
    information = dia_non_5024_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_5024_pickpocket_condition() {
	c_beklauen(baseThfChanceNON - 15, 20);
};

func void dia_non_5024_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_5024_pickpocket);
	info_addchoice(dia_non_5024_pickpocket, dialog_back, dia_non_5024_pickpocket_back);
	info_addchoice(dia_non_5024_pickpocket, dialog_pickpocket, dia_non_5024_pickpocket_doit);
};

func void dia_non_5024_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_5024_pickpocket);
};

func void dia_non_5024_pickpocket_back() {
    info_clearchoices(dia_non_5024_pickpocket);
};

instance dia_non_4001_pickpocket(c_info) {
    npc = non_4001_madnovize;
    nr = 900;
    condition = dia_non_4001_pickpocket_condition;
    information = dia_non_4001_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_4001_pickpocket_condition() {
	c_beklauen(baseThfChanceNOV, 20);
};

func void dia_non_4001_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_4001_pickpocket);
	info_addchoice(dia_non_4001_pickpocket, dialog_back, dia_non_4001_pickpocket_back);
	info_addchoice(dia_non_4001_pickpocket, dialog_pickpocket, dia_non_4001_pickpocket_doit);
};

func void dia_non_4001_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_4001_pickpocket);
};

func void dia_non_4001_pickpocket_back() {
    info_clearchoices(dia_non_4001_pickpocket);
};

instance dia_uturiel_pickpocket(c_info) {
    npc = non_3933_uturiel;
    nr = 900;
    condition = dia_uturiel_pickpocket_condition;
    information = dia_uturiel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_uturiel_pickpocket_condition() {
	c_beklauen(baseThfChanceKDF, 30);
};

func void dia_uturiel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_uturiel_pickpocket);
	info_addchoice(dia_uturiel_pickpocket, dialog_back, dia_uturiel_pickpocket_back);
	info_addchoice(dia_uturiel_pickpocket, dialog_pickpocket, dia_uturiel_pickpocket_doit);
};

func void dia_uturiel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_uturiel_pickpocket);
};

func void dia_uturiel_pickpocket_back() {
    info_clearchoices(dia_uturiel_pickpocket);
};

instance dia_dorian_pickpocket(c_info) {
    npc = non_3931_dorian;
    nr = 900;
    condition = dia_dorian_pickpocket_condition;
    information = dia_dorian_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dorian_pickpocket_condition() {
	c_beklauen(baseThfChanceBAU, 25);
};

func void dia_dorian_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dorian_pickpocket);
	info_addchoice(dia_dorian_pickpocket, dialog_back, dia_dorian_pickpocket_back);
	info_addchoice(dia_dorian_pickpocket, dialog_pickpocket, dia_dorian_pickpocket_doit);
};

func void dia_dorian_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_dorian_pickpocket);
};

func void dia_dorian_pickpocket_back() {
    info_clearchoices(dia_dorian_pickpocket);
};

instance dia_davor_pickpocket(c_info) {
    npc = non_3929_davor;
    nr = 900;
    condition = dia_davor_pickpocket_condition;
    information = dia_davor_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_davor_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 25);
};

func void dia_davor_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_davor_pickpocket);
	info_addchoice(dia_davor_pickpocket, dialog_back, dia_davor_pickpocket_back);
	info_addchoice(dia_davor_pickpocket, dialog_pickpocket, dia_davor_pickpocket_doit);
};

func void dia_davor_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_davor_pickpocket);
};

func void dia_davor_pickpocket_back() {
    info_clearchoices(dia_davor_pickpocket);
};

instance dia_non_3923_pickpocket(c_info) {
    npc = non_3923_wiezien;
    nr = 900;
    condition = dia_non_3923_pickpocket_condition;
    information = dia_non_3923_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3923_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 5);
};

func void dia_non_3923_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3923_pickpocket);
	info_addchoice(dia_non_3923_pickpocket, dialog_back, dia_non_3923_pickpocket_back);
	info_addchoice(dia_non_3923_pickpocket, dialog_pickpocket, dia_non_3923_pickpocket_doit);
};

func void dia_non_3923_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_3923_pickpocket);
};

func void dia_non_3923_pickpocket_back() {
    info_clearchoices(dia_non_3923_pickpocket);
};

instance dia_non_3922_pickpocket(c_info) {
    npc = non_3922_wiezien;
    nr = 900;
    condition = dia_non_3922_pickpocket_condition;
    information = dia_non_3922_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3922_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 5);
};

func void dia_non_3922_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3922_pickpocket);
	info_addchoice(dia_non_3922_pickpocket, dialog_back, dia_non_3922_pickpocket_back);
	info_addchoice(dia_non_3922_pickpocket, dialog_pickpocket, dia_non_3922_pickpocket_doit);
};

func void dia_non_3922_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_3922_pickpocket);
};

func void dia_non_3922_pickpocket_back() {
    info_clearchoices(dia_non_3922_pickpocket);
};

instance dia_non_3921_pickpocket(c_info) {
    npc = non_3921_wiezien;
    nr = 900;
    condition = dia_non_3921_pickpocket_condition;
    information = dia_non_3921_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3921_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 5);
};

func void dia_non_3921_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3921_pickpocket);
	info_addchoice(dia_non_3921_pickpocket, dialog_back, dia_non_3921_pickpocket_back);
	info_addchoice(dia_non_3921_pickpocket, dialog_pickpocket, dia_non_3921_pickpocket_doit);
};

func void dia_non_3921_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_3921_pickpocket);
};

func void dia_non_3921_pickpocket_back() {
    info_clearchoices(dia_non_3921_pickpocket);
};

instance dia_gerard_pickpocket(c_info) {
    npc = non_3900_gerard;
    nr = 900;
    condition = dia_gerard_pickpocket_condition;
    information = dia_gerard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gerard_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 35);
};

func void dia_gerard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gerard_pickpocket);
	info_addchoice(dia_gerard_pickpocket, dialog_back, dia_gerard_pickpocket_back);
	info_addchoice(dia_gerard_pickpocket, dialog_pickpocket, dia_gerard_pickpocket_doit);
};

func void dia_gerard_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_gerard_pickpocket);
};

func void dia_gerard_pickpocket_back() {
    info_clearchoices(dia_gerard_pickpocket);
};

instance dia_peratur_pickpocket(c_info) {
    npc = non_3077_peratur;
    nr = 900;
    condition = dia_peratur_pickpocket_condition;
    information = dia_peratur_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_peratur_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 20);
};

func void dia_peratur_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_peratur_pickpocket);
	info_addchoice(dia_peratur_pickpocket, dialog_back, dia_peratur_pickpocket_back);
	info_addchoice(dia_peratur_pickpocket, dialog_pickpocket, dia_peratur_pickpocket_doit);
};

func void dia_peratur_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_peratur_pickpocket);
};

func void dia_peratur_pickpocket_back() {
    info_clearchoices(dia_peratur_pickpocket);
};

instance dia_non_3073_pickpocket(c_info) {
    npc = non_3073_czarny_mag;
    nr = 900;
    condition = dia_non_3073_pickpocket_condition;
    information = dia_non_3073_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3073_pickpocket_condition() {
	c_beklauen(baseThfChanceDMB, 20);
};

func void dia_non_3073_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3073_pickpocket);
	info_addchoice(dia_non_3073_pickpocket, dialog_back, dia_non_3073_pickpocket_back);
	info_addchoice(dia_non_3073_pickpocket, dialog_pickpocket, dia_non_3073_pickpocket_doit);
};

func void dia_non_3073_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_3073_pickpocket);
};

func void dia_non_3073_pickpocket_back() {
    info_clearchoices(dia_non_3073_pickpocket);
};

instance dia_vart_pickpocket(c_info) {
    npc = non_3071_vart;
    nr = 900;
    condition = dia_vart_pickpocket_condition;
    information = dia_vart_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_vart_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 25);
};

func void dia_vart_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_vart_pickpocket);
	info_addchoice(dia_vart_pickpocket, dialog_back, dia_vart_pickpocket_back);
	info_addchoice(dia_vart_pickpocket, dialog_pickpocket, dia_vart_pickpocket_doit);
};

func void dia_vart_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_vart_pickpocket);
};

func void dia_vart_pickpocket_back() {
    info_clearchoices(dia_vart_pickpocket);
};

instance dia_luis_pickpocket(c_info) {
    npc = ban_1615_luis;
    nr = 900;
    condition = dia_luis_pickpocket_condition;
    information = dia_luis_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_luis_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 30);
};

func void dia_luis_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_luis_pickpocket);
	info_addchoice(dia_luis_pickpocket, dialog_back, dia_luis_pickpocket_back);
	info_addchoice(dia_luis_pickpocket, dialog_pickpocket, dia_luis_pickpocket_doit);
};

func void dia_luis_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_luis_pickpocket);
};

func void dia_luis_pickpocket_back() {
    info_clearchoices(dia_luis_pickpocket);
};

instance dia_non_3032_pickpocket(c_info) {
    npc = non_3032_bandyta;
    nr = 900;
    condition = dia_non_3032_pickpocket_condition;
    information = dia_non_3032_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_3032_pickpocket_condition() {
	c_beklauen(baseThfChanceORG, 25);
};

func void dia_non_3032_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_3032_pickpocket);
	info_addchoice(dia_non_3032_pickpocket, dialog_back, dia_non_3032_pickpocket_back);
	info_addchoice(dia_non_3032_pickpocket, dialog_pickpocket, dia_non_3032_pickpocket_doit);
};

func void dia_non_3032_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_3032_pickpocket);
};

func void dia_non_3032_pickpocket_back() {
    info_clearchoices(dia_non_3032_pickpocket);
};

instance dia_non_2701_pickpocket(c_info) {
    npc = non_2701_straznik;
    nr = 900;
    condition = dia_non_2701_pickpocket_condition;
    information = dia_non_2701_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_2701_pickpocket_condition() {
	c_beklauen(baseThfChanceGRD, 30);
};

func void dia_non_2701_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_2701_pickpocket);
	info_addchoice(dia_non_2701_pickpocket, dialog_back, dia_non_2701_pickpocket_back);
	info_addchoice(dia_non_2701_pickpocket, dialog_pickpocket, dia_non_2701_pickpocket_doit);
};

func void dia_non_2701_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_2701_pickpocket);
};

func void dia_non_2701_pickpocket_back() {
    info_clearchoices(dia_non_2701_pickpocket);
};

instance dia_glest_pickpocket(c_info) {
    npc = non_40139_glest;
    nr = 900;
    condition = dia_glest_pickpocket_condition;
    information = dia_glest_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_glest_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 25);
};

func void dia_glest_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_glest_pickpocket);
	info_addchoice(dia_glest_pickpocket, dialog_back, dia_glest_pickpocket_back);
	info_addchoice(dia_glest_pickpocket, dialog_pickpocket, dia_glest_pickpocket_doit);
};

func void dia_glest_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_glest_pickpocket);
};

func void dia_glest_pickpocket_back() {
    info_clearchoices(dia_glest_pickpocket);
};

instance dia_non_2094_pickpocket(c_info) {
    npc = non_2094_glest;
    nr = 900;
    condition = dia_non_2094_pickpocket_condition;
    information = dia_non_2094_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_2094_pickpocket_condition() {
	c_beklauen(baseThfChanceSTT, 25);
};

func void dia_non_2094_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_2094_pickpocket);
	info_addchoice(dia_non_2094_pickpocket, dialog_back, dia_non_2094_pickpocket_back);
	info_addchoice(dia_non_2094_pickpocket, dialog_pickpocket, dia_non_2094_pickpocket_doit);
};

func void dia_non_2094_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_2094_pickpocket);
};

func void dia_non_2094_pickpocket_back() {
    info_clearchoices(dia_non_2094_pickpocket);
};

instance dia_samuel_pickpocket(c_info) {
    npc = non_2037_samuel;
    nr = 900;
    condition = dia_samuel_pickpocket_condition;
    information = dia_samuel_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_samuel_pickpocket_condition() {
	c_beklauen(baseThfChanceVLK, 20);
};

func void dia_samuel_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_samuel_pickpocket);
	info_addchoice(dia_samuel_pickpocket, dialog_back, dia_samuel_pickpocket_back);
	info_addchoice(dia_samuel_pickpocket, dialog_pickpocket, dia_samuel_pickpocket_doit);
};

func void dia_samuel_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_samuel_pickpocket);
};

func void dia_samuel_pickpocket_back() {
    info_clearchoices(dia_samuel_pickpocket);
};

instance dia_non_2022_pickpocket(c_info) {
    npc = non_2022_oczekujacy;
    nr = 900;
    condition = dia_non_2022_pickpocket_condition;
    information = dia_non_2022_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_2022_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_2022_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_2022_pickpocket);
	info_addchoice(dia_non_2022_pickpocket, dialog_back, dia_non_2022_pickpocket_back);
	info_addchoice(dia_non_2022_pickpocket, dialog_pickpocket, dia_non_2022_pickpocket_doit);
};

func void dia_non_2022_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_2022_pickpocket);
};

func void dia_non_2022_pickpocket_back() {
    info_clearchoices(dia_non_2022_pickpocket);
};

instance dia_non_2016_pickpocket(c_info) {
    npc = non_2016_oczekujacy;
    nr = 900;
    condition = dia_non_2016_pickpocket_condition;
    information = dia_non_2016_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_2016_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_2016_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_2016_pickpocket);
	info_addchoice(dia_non_2016_pickpocket, dialog_back, dia_non_2016_pickpocket_back);
	info_addchoice(dia_non_2016_pickpocket, dialog_pickpocket, dia_non_2016_pickpocket_doit);
};

func void dia_non_2016_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_2016_pickpocket);
};

func void dia_non_2016_pickpocket_back() {
    info_clearchoices(dia_non_2016_pickpocket);
};

instance dia_non_1502_pickpocket(c_info) {
    npc = non_1502_wegelagerer;
    nr = 900;
    condition = dia_non_1502_pickpocket_condition;
    information = dia_non_1502_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_1502_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_1502_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_1502_pickpocket);
	info_addchoice(dia_non_1502_pickpocket, dialog_back, dia_non_1502_pickpocket_back);
	info_addchoice(dia_non_1502_pickpocket, dialog_pickpocket, dia_non_1502_pickpocket_doit);
};

func void dia_non_1502_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_1502_pickpocket);
};

func void dia_non_1502_pickpocket_back() {
    info_clearchoices(dia_non_1502_pickpocket);
};

instance dia_non_1501_pickpocket(c_info) {
    npc = non_1501_wegelagerer;
    nr = 900;
    condition = dia_non_1501_pickpocket_condition;
    information = dia_non_1501_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_1501_pickpocket_condition() {
	c_beklauen(baseThfChanceNON, 20);
};

func void dia_non_1501_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_1501_pickpocket);
	info_addchoice(dia_non_1501_pickpocket, dialog_back, dia_non_1501_pickpocket_back);
	info_addchoice(dia_non_1501_pickpocket, dialog_pickpocket, dia_non_1501_pickpocket_doit);
};

func void dia_non_1501_pickpocket_doit() {
    b_beklauen();
    info_clearchoices(dia_non_1501_pickpocket);
};

func void dia_non_1501_pickpocket_back() {
    info_clearchoices(dia_non_1501_pickpocket);
};