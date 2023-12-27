//#####################################################################
//##
//##							ROZDZIA£ 3
//##							=========
//##	Blizna umiera w wyniku zamachu zleconego przez Kosê.
//##	Zabójc¹ jest Snake - nowa postaæ. Zadanie tylko na ten rozdzia³.
//##
//#####################################################################

func void B_Story_ScarDie()
{
	//-------- Zmienne ----------------
	Scar_die = true;
	//-------- Konsekwencje --------
	var C_NPC snake	; snake 	= Hlp_GetNpc (NON_7852_Snake	);
	Npc_ExchangeRoutine (snake,"murder");
	CreateInvItems (snake, GRD_ARMOR_M, 1);
	Mdl_SetVisualBody (snake,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 120, 1, GRD_ARMOR_M);

	
	var C_NPC grd279	; grd279 	= Hlp_GetNpc (GRD_279_Gardist	);
	B_ExchangeRoutine (grd279,"die");
	B_KillNpc (grd279);
	var C_NPC grd231	; grd231 	= Hlp_GetNpc (GRD_231_Gardist	);
	B_ExchangeRoutine (grd231,"die");
	B_KillNpc (grd231);
	
	var C_NPC scar	; scar 	= Hlp_GetNpc (EBR_101_Scar	);
	npc_removeinvitems (scar,Scars_Schwert,1);
	npc_removeinvitems (scar,ItRw_Crossbow_04,1);
	B_ExchangeRoutine (scar,"kill");
	B_KillNpc (scar);
};