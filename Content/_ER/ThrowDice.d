func void throw_dice(var int gold_value) {
	var int player_dice1;
	var int player_dice2;
	
	var int npc_dice1;
	var int npc_dice2;
	
	var string draw_info_player;
	var string draw_info_npc;
	
	var string player_dice_str;
	var string npc_dice_str;

	var int player_dice_sum;
	var int npc_dice_sum;
	
	player_dice1 = hlp_random(7);
	player_dice2 = hlp_random(7);
	npc_dice1 = hlp_random(7);
	npc_dice2 = hlp_random(7);
	
	if (player_dice1 <= 0) {
		player_dice1 = 1;
	};
	if (player_dice2 <= 0) {
		player_dice2 = 1;
	};
	if (npc_dice1 <= 0) {
		npc_dice1 = 1;
	};
	if (npc_dice2 <= 0) {
		npc_dice2 = 1;
	};
	
	player_dice_sum = player_dice1 + player_dice2;
	npc_dice_sum = npc_dice1 + npc_dice2;
	
	player_dice_str = inttostring(player_dice_sum);
	npc_dice_str = inttostring(npc_dice_sum);
	
	draw_info_player = "Wylosowa³eœ liczbê: ";
	draw_info_player = concatstrings(draw_info_player, player_dice_str);
	draw_info_npc = "Przeciwnik wylosowa³ liczbê: ";
	draw_info_npc = concatstrings(draw_info_npc, npc_dice_str);
	
	prints_ext(draw_info_player, col_lime);
	prints_ext(draw_info_npc, col_aqua);
	
    if(player_dice_sum < npc_dice_sum) {
        ai_output(self, other, "DIA_Organisator_HELLO3_LOSE");
		printscreen("PRZEGRANA", -1, -1, "FONT_OLD_10_WHITE.TGA", 1);
        b_giveinvitems(other, self, itminugget, gold_value);
        npc_removeinvitems(self, itminugget, gold_value);
    }
    else if(player_dice_sum > npc_dice_sum) {
        ai_output(self, other, "DIA_Organisator_HELLO3_WIN");
		printscreen("WYGRANA", -1, -1, "FONT_OLD_10_WHITE.TGA", 1);
        createinvitems(self, itminugget, gold_value);
        b_giveinvitems(self, other, itminugget, gold_value);
    }
	else {
		printscreen("REMIS", -1, -1, "FONT_OLD_10_WHITE.TGA", 1);
	};
};