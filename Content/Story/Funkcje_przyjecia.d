
var int JoinOC;
var int JoinNC;
var int JoinPC;
var int JoinBA;


func void HeroJoinToNC ()
{
if (MIS_OreInOM == LOG_RUNNING)
{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda�o mi si� uko�czy� tego zadania. Jestem teraz cz�owiekiem Laresa i sprawy Bandyt�w mnie nie interesuj�.");
};


};

func void HeroJoinToBAN ()
{
	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie b�d� m�g� teraz udowodni� swojej lojalno�ci wobec Starego Obozu. Wybra�em inn� �cie�k�.");
	};
};

func void HeroJoinToPSI ()
{

	if (MIS_OreInOM == LOG_RUNNING)
	{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda�o mi si� uko�czy� tego zadania. Nale�� do Bractwa, wiec nie mog� pracowa� dla Bandyt�w.");
	};

	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie b�d� m�g� teraz udowodni� swojej lojalno�ci wobec Starego Obozu. Wybra�em inn� �cie�k�.");
	};
};

func void HeroJoinToOC ()
{
	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,	"Nie mog� zosta� przyj�ty do gangu Laresa, gdy� jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,	"Stary Ob�z b�dzie od dzi� moim domem. Bractwo �ni�cego b�dzie musia�o obej�� si� jako� beze mnie.");
	
	//Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
	//Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
	//B_LogEntry			(CH1_BANDITOS_CAMP,	"Banda Quentina b�dzie musia�a si� beze mnie obej��. Postanowi�em przy��czy� si� do Gomeza.");
};