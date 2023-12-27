
Func void HP_GWM_SHA()
{ 
if (Shaman_GWM_01.attribute[ATR_HITPOINTS] <= (Shaman_GWM_01.attribute[ATR_HITPOINTS_MAX] <= 400)) && !(SHA_GWM_LHP == TRUE)
{
Wld_PlayEffect  ("spellFX_MassDeath",Shaman_GWM_01,Shaman_GWM_01, 0, 0, 0, TRUE);
hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] -150;    
SHA_GWM_LHP = TRUE;
};
};
