Sphere = {
	Properties = {
		fileModel 					= "objects/default/primitive_sphere.cgf",
	},
	
	Editor={
		Icon="Tornado.bmp",
	},
}


function Sphere:OnInit()
	self:OnReset();
end

function Sphere:OnPropertyChange()
	self:OnReset();
end

function Sphere:OnReset()
	self:LoadObject(0, self.Properties.fileModel);
	local Physics = {
		bPhysicalize = 1, -- True if object should be physicalized at all.
		bRigidBody = 0, -- True if rigid body, False if static.
		bPushableByPlayers = 0,
		
		Density = -1,
		Mass = 0,
	}
	ViewDistRatio = 255
	if (CryAction.IsImmersivenessEnabled() == 0) then
		Physics = Physics_DX9MP_Simple;
	end
	EntityCommon.PhysicalizeRigid( self,0,Physics,0 );
end

function Sphere:OnSave(tbl)
	tbl.Who = self.Who
end

function Sphere:OnLoad(tbl)
	self.Who = tbl.Who
end

