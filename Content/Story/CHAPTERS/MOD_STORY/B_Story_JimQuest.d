func void B_Story_JimQuest ()
{
	CreateInvItems (STT_2077_Jim, It_wodaswiecona, 1);
    B_GiveInvItems (STT_2077_Jim, hero, It_wodaswiecona, 1);
    MIS_Fire_Novize = LOG_RUNNING;
	Wld_InsertNpc		(NON_7501_Opetany_Kopacz,"JOSEP2");
	//Npc_SetPermAttitude (NON_7501_Opetany_Kopacz, ATT_HOSTILE);	
	Wld_InsertNpc		(NON_7502_Opetany_Kopacz,"OC1");
	//Npc_SetPermAttitude (NON_7502_Opetany_Kopacz, ATT_HOSTILE);	
	Wld_InsertNpc		(NON_7503_Opetany_Kopacz,"OC1");
	//Npc_SetPermAttitude (NON_7503_Opetany_Kopacz, ATT_HOSTILE);	
	Wld_InsertNpc		(NON_7504_Opetany_Kopacz,"OC1");
	//Npc_SetPermAttitude (NON_7504_Opetany_Kopacz, ATT_HOSTILE);
  /*  Log_CreateTopic            (CH1_Fire_Novize, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Fire_Novize, LOG_RUNNING);
    B_LogEntry                     (CH1_Fire_Novize,"Otrzyma³em od Jima butelkê wody œwiêconej. Mam pokropiæ kapliczkê Beliara w jaskini za obozem oraz rozejrzeæ siê na cmentarzu Kopaczy. Cmentarza powinienem szukaæ w okolicy Opuszczonej Kopalni. "); */
	MIS_ZlecenieJima = LOG_RUNNING;
	Log_CreateTopic            (CH1_ZlecenieJima, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ZlecenieJima, LOG_RUNNING);
    B_LogEntry                     (CH1_ZlecenieJima,"Otrzyma³em od Jima butelkê wody œwiêconej. Mam pokropiæ kapliczkê Beliara w jaskini za obozem oraz rozejrzeæ siê na cmentarzu Kopaczy. Cmentarza powinienem szukaæ w okolicy Opuszczonej Kopalni. ");
};

func void B_Story_JimQuest_Success ()
{
	B_GiveXP (175);
	CreateInvItems (STT_2077_Jim, ItMiNugget, 100);
    B_GiveInvItems (STT_2077_Jim, hero, ItMiNugget, 100);
	MIS_ZlecenieJima = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_ZlecenieJima, LOG_SUCCESS);
    B_LogEntry                     (CH1_ZlecenieJima,"Wykona³em zadanie od Jima. To by³o dosyæ trudne, ale nagroda w postaci stu bry³ek rudy bardzo mi siê spodoba³a.");
};