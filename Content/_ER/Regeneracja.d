
//-----------------------------------------------------------------------------------------------------------------------\\\\\\\

Func void REGHP ()

{	
if !(hero.attribute[ATR_HITPOINTS] == ATR_HITPOINTS_MAX)
&& !(hero.attribute[ATR_HITPOINTS] == 0)
{   
 Npc_ChangeAttribute ( hero , ATR_HITPOINTS , +15 ) ; 
// Npc_ChangeAttribute ( hero , ATR_MANA , +3 ) ; 
};	 	
};

Func void REGHP_SMALL ()

{	
if !(hero.attribute[ATR_HITPOINTS] == ATR_HITPOINTS_MAX)
&& !(hero.attribute[ATR_HITPOINTS] == 0)
{   
 Npc_ChangeAttribute ( hero , ATR_HITPOINTS , +5 ) ; 

};	 	
};


Func void POISON ()

{	
if !(hero.attribute[ATR_HITPOINTS] == 0)
{  
 Npc_ChangeAttribute ( hero , ATR_HITPOINTS , -15 ) ; 
};	 	
};


Func void WSTRE ()

{
 	
 Npc_ChangeAttribute ( hero , ATR_STRENGTH , +20 ) ; 

};
	 
	

Func void REGMAN_S ()

{	
if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX] && hero.attribute[ATR_MANA] >= 0)
{   
	Npc_ChangeAttribute ( hero , ATR_MANA , 4 ) ; 
// Npc_ChangeAttribute ( hero , ATR_MANA , +3 ) ; 
};	 	
};


//---------------------------------------Blackscreen
///const int BlackscreenDuration = 5000;
/*
Func void Blackscreen ()

{	

    MEM_Camera.screenFadeEnabled	    =	                    1;
	MEM_Camera.screenFadeTexture	    =	       "Inv_Back.tga";
	MEM_Camera.screenFadeTextureAniFPS	=	             mkf(100);
	PF_FadeInTime  = 300;

};
*/




