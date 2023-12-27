func void B_GuildGreetings ()
// 24.05. Läuft
{
	PrintDebugNpc( PD_ZS_FRAME, "B_GuilGreetings" );
	if (  C_NpcIsHuman(other) && ( self.guild == GIL_GUR  ||  self.guild == GIL_NOV  ||  self.guild == GIL_TPL ) && (Npc_GetTempAttitude (self,other) == ATT_FRIENDLY))
	{
	
		
		if hero.guild == GIL_NOV
		{
		if  (!C_BodyStateContains(self, BS_SIT) )
		{
		AI_PlayAni		(self,	"T_GREETNOV");
		AI_PlayAni		(hero,	"T_GREETNOV"); 
		};
		}
		else if hero.guild == GIL_GUR
		{
		if  (!C_BodyStateContains(self, BS_SIT) ) {
		AI_PlayAni		(self,	"T_GREETNOV"); };
		};
		
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings Guru ");
		B_Say (self, other, "$SECTGREETINGS");
		

	}
	else if ( ( other.guild == GIL_EBR  || other.guild == GIL_GRD  || other.guild ==  GIL_STT  || other.guild ==  GIL_VLK ) &&  (self.guild ==  GIL_GRD  || self.guild ==  GIL_STT  || self.guild == GIL_VLK ) && (Npc_GetTempAttitude (self, other) == ATT_FRIENDLY  || Npc_GetTempAttitude (self, other) == ATT_NEUTRAL ))
	{
	
		if hero.guild == GIL_GRD 
		{
		if  (!C_BodyStateContains(self, BS_SIT) ) {
		AI_PlayAni		(self,	"T_GREETGRD");
		AI_PlayAni		(hero,	"T_GREETGRD"); };
		}
		else if hero.guild == GIL_STT || hero.guild == GIL_VLK 
		{
		if  (!C_BodyStateContains(self, BS_SIT) ) {
		AI_PlayAni		(self,	"T_GREETGRD"); };
		};
		
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings OC both" );
		B_Say (self, other, "$ALGREETINGS");
		


	}
	else if (( other.guild == GIL_KDF  || other.guild == GIL_KDW ) && ( self.guild ==  GIL_KDF || self.guild == GIL_KDW) && ( Npc_GetTempAttitude (self,other) ==  ATT_FRIENDLY ||  Npc_GetTempAttitude (self,other) == ATT_NEUTRAL))
	{
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings NC both");
		if  (!C_BodyStateContains(self, BS_SIT) ) {
		AI_PlayAni		(self,	"T_GREETNOV");
		AI_PlayAni		(other,	"T_GREETNOV"); };
		
		B_Say (self, other, "$MAGEGREETINGS");
	}
	else 
	{
		if (Npc_GetTempAttitude (self,other) == ATT_FRIENDLY)
		{
			PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings friend");
			
			if self.guild == GIL_KDW || other.guild == GIL_KDF || other.guild == GIL_GUR
			{
			//print ("test");
			}
			else
			{
			if  (!C_BodyStateContains(self, BS_SIT) ) {
			AI_PlayAni		(self,	"T_GREETCOOL"); };
			};
			B_Say (self, other, "$FRIENDLYGREETINGS");
		};
	};
};


// Sicherheitskopie für Abfragen auf Nsc´s

/*func void B_GuildGreetings ()
{
	if ((Wld_DetectNpc (self,-1,NOFUNC,GIL_SEPERATOR_HUM)||  other.guild <= GIL_SEPERATOR_HUM) && ( self.guild == GIL_GUR  ||  self.guild == GIL_NOV  ||  self.guild == GIL_TPL ) && (Npc_GetAttitude (self,other) == ATT_FRIENDLY  || Npc_GetAttitude (self,other) ==  ATT_NEUTRAL))
	{
		B_Say (self,"$SECTGREETINGS");
	}
	else if ((Wld_DetectNpc (self,-1,NOFUNC,GIL_EBR)  || Wld_DetectNpc (self,-1,NOFUNC,GIL_GRD ) || Wld_DetectNpc (self,-1,NOFUNC, GIL_STT )|| Wld_DetectNpc (self,-1,NOFUNC, GIL_VLK)) || ( other.guild == GIL_EBR  || other.guild == GIL_GRD  || other.guild ==  GIL_STT  || other.guild ==  GIL_VLK ) &&  (self.guild ==  GIL_GRD  || self.guild ==  GIL_STT  || self.guild == GIL_VLK ) && (Npc_GetAttitude (self, other) == ATT_FRIENDLY  || Npc_GetAttitude (self, other) == ATT_NEUTRAL ))
	{
		B_Say (self,"$ALGREETINGS");
	}
	else if ((Wld_DetectNpc (self,-1, NOFUNC,GIL_KDF ) || Wld_DetectNpc (self,-1, NOFUNC,GIL_KDW) ) || ( other.guild == GIL_KDF  || other.guild == GIL_KDW ) && ( self.guild ==  GIL_KDF || self.guild == GIL_KDW) && ( Npc_GetAttitude (self,other) ==  ATT_FRIENDLY ||  Npc_GetAttitude (self,other) == ATT_NEUTRAL))
	{
		B_Say (self,"$MAGEGREETINGS");
	}
	else 
	{
		if (Npc_GetAttitude (self,other) == ATT_FRIENDLY)
		{
			B_Say (self,"$FRIENDLYGREETINGS");
		}
		else 
		{
			Print ("Keine Grüße vorhanden");
		};
	};
};*/