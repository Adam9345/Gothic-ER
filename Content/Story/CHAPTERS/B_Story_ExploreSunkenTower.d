// Der Spieler wird von Xardas zum versunkenen Turm geschickt.
// Dort findet er die eine Teleportationsrune in das Alte Lager hinein.
func void B_Story_ExploreSunkenTower ()
{
	//-------- Schlüssel für versunkenen Turm --------
	CreateInvItem		(hero,	ItKe_SunkenTower);

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,	"Xardas zaj¹³ siê przygotowaniem magicznej formu³y, która przywróci URIZIELOWI jego dawn¹ moc. W tym czasie zamierzam rozejrzeæ siê trochê po zatopionej wie¿y Nekromanty w poszukiwaniu jakichœ przydatnych artefaktów.");

	// ************************************************	
	// Neue TAs für NPCs des inneren Ringes
	// ************************************************		
	var C_NPC Bartholo	; Bartholo 	= Hlp_GetNpc (EBR_106_Bartholo	);
	var C_NPC Skip		; Skip 		= Hlp_GetNpc (GRD_211_Skip		);
	var C_NPC Bullit	; Bullit 	= Hlp_GetNpc (GRD_203_Bullit 	);
	var C_NPC Stone		; Stone 	= Hlp_GetNpc (GRD_219_Stone 	);
	var C_NPC Gomez		; Gomez 	= Hlp_GetNpc (EBR_100_Gomez 	);
	var C_NPC Scorpio	; Scorpio 	= Hlp_GetNpc (GRD_205_Scorpio	);
	var C_NPC Cutter	; Cutter 	= Hlp_GetNpc (GRD_208_Cutter 	);
	var C_NPC Grd_220	; Grd_220 	= Hlp_GetNpc (GRD_220_Gardist	);
	var C_NPC Grd_221	; Grd_221 	= Hlp_GetNpc (GRD_221_Gardist	);
	var C_NPC Grd_222	; Grd_222 	= Hlp_GetNpc (GRD_222_Gardist	);
	var C_NPC Grd_223	; Grd_223 	= Hlp_GetNpc (GRD_223_Gardist	);
	var C_NPC Grd_239	; Grd_239	= Hlp_GetNpc (GRD_239_Gardist	);
	var C_NPC Grd_245	; Grd_245 	= Hlp_GetNpc (GRD_245_Gardist	);
	var C_NPC Raven		; Raven	 	= Hlp_GetNpc (EBR_105_Raven 	);
	var C_NPC Scar		; Scar	 	= Hlp_GetNpc (EBR_101_Scar 		);
	var C_NPC Arto		; Arto 		= Hlp_GetNpc (EBR_102_Arto 		);
	var	C_NPC Thorus	; Thorus	= Hlp_GetNpc (GRD_200_Thorus	);
	var	C_NPC Velayla	; Velayla	= Hlp_GetNpc (EBR_108_Velaya	);
	var	C_NPC Serafia	; Serafia	= Hlp_GetNpc (EBR_110_Seraphia	);
	var	C_NPC Sira		; Sira		= Hlp_GetNpc (EBR_109_Syra	);
	var	C_NPC grd8800		; grd8800		= Hlp_GetNpc (GRD_8800_Gardist	);
	var	C_NPC grd8801		; grd8801		= Hlp_GetNpc (GRD_8801_Gardist	);
	var	C_NPC grd3916		; grd3916		= Hlp_GetNpc (GRD_3916_Elitarny_straznik	);
	var	C_NPC grd3917		; grd3917		= Hlp_GetNpc (GRD_3917_Elitarny_straznik	);
	
	Npc_ExchangeRoutine		(Gomez		,"OT"); 
	Npc_ExchangeRoutine		(Bartholo	,"OT"); 
	Npc_ExchangeRoutine		(Arto		,"OT"); 
	Npc_ExchangeRoutine		(Scar		,"OT"); 
	Npc_ExchangeRoutine		(Raven		,"OT"); 
	Npc_ExchangeRoutine		(Bullit		,"OT"); 
	Npc_ExchangeRoutine		(Scorpio	,"OT"); 
	Npc_ExchangeRoutine		(Cutter		,"OT"); 	
	Npc_ExchangeRoutine		(Skip		,"OT"); 	
	Npc_ExchangeRoutine		(Stone		,"OT"); 	
	Npc_ExchangeRoutine		(Grd_220	,"OT"); 	
	Npc_ExchangeRoutine		(Grd_221	,"OT"); 
	Npc_ExchangeRoutine		(Grd_222	,"OT"); 
	Npc_ExchangeRoutine		(Grd_223	,"OT"); 
	Npc_ExchangeRoutine		(Grd_239	,"OT"); 
	Npc_ExchangeRoutine		(Grd_245	,"OT"); 
	Npc_ExchangeRoutine		(Serafia	,"OT"); 
	Npc_ExchangeRoutine		(Sira		,"OT"); 
	Npc_ExchangeRoutine		(grd3916	,"OT"); 
	Npc_ExchangeRoutine		(grd3917	,"OT"); 

	// Gilden Änderung, damit SC nicht angegriffen wird
	Stone.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Stone, 	GIL_NONE);	
	Skip.guild 		= GIL_NONE;		Npc_SetTrueGuild	(Skip, 		GIL_NONE);	
	Bullit.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Bullit,	GIL_NONE);	
	Bartholo.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Bartholo,	GIL_NONE);	
	Gomez.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Gomez, 	GIL_NONE);	
	Serafia.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Serafia, 	GIL_NONE);	
	Velayla.guild 	= GIL_NONE;		Npc_SetTrueGuild	(Velayla, 	GIL_NONE);	
	Sira.guild 		= GIL_NONE;		Npc_SetTrueGuild	(Sira,	 	GIL_NONE);	
	grd3916.guild 	= GIL_NONE ;	Npc_SetTrueGuild	(grd3916,	 GIL_NONE);	
	grd3917.guild 	= GIL_NONE ;	Npc_SetTrueGuild	(grd3917,	 GIL_NONE);	
	grd8800.guild 	= GIL_NONE ;	Npc_SetTrueGuild	(grd8800,	 GIL_NONE);	
	grd8801.guild 	= GIL_NONE ;	Npc_SetTrueGuild	(grd8801,	 GIL_NONE);	
	
	// Attitüde Änderung
	Npc_SetPermAttitude	(Stone,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Stone,		ATT_NEUTRAL);
	Npc_SetPermAttitude	(Skip,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Skip,		ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Bullit,	ATT_NEUTRAL);	Npc_SetTempAttitude	(Bullit,	ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Bartholo,	ATT_NEUTRAL);	Npc_SetTempAttitude	(Bartholo,	ATT_NEUTRAL); 	         	
	Npc_SetPermAttitude	(Gomez,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Gomez,		ATT_NEUTRAL); 	
	Npc_SetPermAttitude	(Serafia,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Serafia,		ATT_NEUTRAL); 	     	
	Npc_SetPermAttitude	(Velayla,		ATT_NEUTRAL);	Npc_SetTempAttitude	(Velayla,		ATT_NEUTRAL); 	 
	Npc_SetPermAttitude	(grd3916,		ATT_NEUTRAL);	Npc_SetTempAttitude	(grd3916,		ATT_NEUTRAL); 	 
	Npc_SetPermAttitude	(grd3917,		ATT_NEUTRAL);	Npc_SetTempAttitude	(grd3917,		ATT_NEUTRAL); 
	Npc_SetPermAttitude	(grd8800,		ATT_NEUTRAL);	Npc_SetTempAttitude	(grd8800,		ATT_NEUTRAL); 	
	Npc_SetPermAttitude	(grd8801,		ATT_NEUTRAL);	Npc_SetTempAttitude	(grd8801,		ATT_NEUTRAL); 	  	
	
	//-------- Immortals löschen --------
	Thorus.flags	= 0;
	Gomez.flags 	= 0;
	Bartholo.flags = 0;
	
	// Schlüssel um die Tür zum Kerker zu öffnen
	CreateInvItem ( Gomez, DungeonKey );
    
	//-------- globale Variable --------
	ExploreSunkenTower = TRUE;
};

