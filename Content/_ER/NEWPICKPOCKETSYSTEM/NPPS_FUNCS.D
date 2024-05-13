

var int victimcount;
var int victimlevel;
var int thieflevel;
const int THIEFXP = 20;
const int THEFTDIFF = 10;
var int theftdexglob;
var int theftgoldglob;

const string PICKPOCKET_20 = "(Kradzie¿ tego mieszka bêdzie dziecinnie ³atwa.)";
const string PICKPOCKET_40 = "(Kradzie¿ tego mieszka bêdzie doœæ prosta.)";
const string PICKPOCKET_60 = "(Kradzie¿ tego mieszka bêdzie doœæ ryzykowna.)";
const string PICKPOCKET_80 = "(Kradzie¿ tego mieszka bêdzie trudna.)";
const string PICKPOCKET_100 = "(Kradzie¿ tego mieszka bêdzie diabelsko trudna.)";
const string PICKPOCKET_120 = "(Kradzie¿ tego mieszka bêdzie graniczy³a z cudem.)";

func string b_steal_message() {

        var int finalTheftDexGlob; finalTheftDexGlob = theftdexglob - THEFTDIFF;

        if (finalTheftDexGlob < 0) {
            finalTheftDexGlob = 0;
        };

        if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 2) {
            prints_ext (cs2("Wymagana zrêcznosæ: ", i2s(finalTheftDexGlob)), COL_White);
        };

        if (finalTheftDexGlob <= 20) {
            print (PICKPOCKET_20);
        } else if (finalTheftDexGlob <= 40) {
            print (PICKPOCKET_40);
        } else if (finalTheftDexGlob <= 60) {
            print (PICKPOCKET_60);
        } else if (finalTheftDexGlob <= 80) {
            print (PICKPOCKET_80);
        } else if (finalTheftDexGlob <= 100) {
            print (PICKPOCKET_100);
        } else if (finalTheftDexGlob <= 120) {
            print (PICKPOCKET_120);
        };
};

func void b_givethiefxp()
{
	VICTIMCOUNT = VICTIMCOUNT + 1;
	if(VICTIMLEVEL == 0)
	{
		VICTIMLEVEL = 2;
	};
	if(VICTIMCOUNT >= VICTIMLEVEL)
	{
		THIEFLEVEL = THIEFLEVEL + 1;
		VICTIMLEVEL = VICTIMCOUNT + THIEFLEVEL;
	};
	b_givexp(THIEFXP + (THIEFLEVEL * 10));
};

func void b_resetthieflevel()
{
	if(VICTIMCOUNT > THIEFLEVEL)
	{
		VICTIMCOUNT = VICTIMCOUNT - 1;
	};
};

func int e_beklauen(var int theftdex,var int theftgold)
{
    if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 2) {
        THEFTDEXGLOB = 20;
    };

	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE))
	{
        if(Npc_IsInState(self,zs_talk))
        {
            // if(theftdex <= 20)
            // {
            //     THEFTDEXGLOB = 10;
            // }
            // else
            // {
            //     THEFTDEXGLOB = theftdex;
            // };
            THEFTDEXGLOB = theftdex;
            THEFTGOLDGLOB = theftgold;
        };

        return TRUE;
	};
};

func void d_beklauen()
{

	if(other.attribute[ATR_DEXTERITY] >= THEFTDEXGLOB - THEFTDIFF)
	{
		b_giveinvitems(self,other,itminugget,THEFTGOLDGLOB);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Snd_Play("Geldbeutel");
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);

        prints_ext("Kradzie¿ siê nie powiod³a", col_red);

		
        ai_stopprocessinfos(self);
		B_Say(self,other,"$DIRTYTHIEF");

        Npc_SetTarget(self,other);

        AI_StartState(self,ZS_Attack,0,"");
	};
};