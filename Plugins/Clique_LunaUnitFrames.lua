--[[---------------------------------------------------------------------------------
  This is a template for the plugin/module system for Clique.

  Plugins are typically used to tie Clique to a specific set of unit frames, but
  can also be used to add functionality to the system through a manner of hooks.

  Plugins are registered with Clique with a shortname that is used for all slash
  commands.  In addition they are required to have a fullname parameter that is
  used in all display messages
----------------------------------------------------------------------------------]]

-- Create a new plugin for Clique, with the shortname "test"
local Plugin = Clique:NewModule("luf")
Plugin.fullname = "LunaUnitFrames"
Plugin.url = "http://www.google.com"

-- Plugin:Test() is called anytime the mod tries to enable.  It is optional
-- but it will be checked if it exists.  Will typically be based off some global
-- or the state of the addon itself.
function Plugin:Test()
    -- return IsAddOnLoaded("LunaUnitFrames")
	return Luna_OnClick
end

-- Plugin:OnEnable() is called if Plugin:Test() is true, and the mod hasn't been explicitly
-- disabled.  This is where you should handle all your hooks, etc.
function Plugin:OnEnable()

	-- Standard hooks do not work ...
	-- Set new handlers directly on the frames ...

	-- Single frames ...

	LunaPlayerFrame:SetScript("OnClick", Plugin.LUFClick)
	LunaPetFrame:SetScript("OnClick", Plugin.LUFClick)
	LunaTargetFrame:SetScript("OnClick", Plugin.LUFClick)
	LunaTargetTargetFrame:SetScript("OnClick", Plugin.LUFClick)
	LunaTargetTargetTargetFrame:SetScript("OnClick", Plugin.LUFClick)

	-- Party frames ...
	local i = 0
	for i=1, 4 do
		LunaPartyFrames[i]:SetScript("OnClick", Plugin.LUFClick)
		LunaPartyPetFrames[i]:SetScript("OnClick", Plugin.LUFClick)
		LunaPartyTargetFrames[i]:SetScript("OnClick", Plugin.LUFClick)
	end

	-- Raid frames ...
	local z = 0
    for i=1, 8 do
		for z=1,5 do
			LunaUnitFrames.frames.RaidFrames[i].member[z]:SetScript("OnClick", Plugin.LUFClick_Raid)
		end
	end

end

function Plugin:LUFClick()

	local button = arg1
	local unit = this.unit

	if not Clique:OnClick(button, unit) then
		Luna_OnClick()
	end

end

function Plugin:LUFClick_Raid()

	local button = arg1
	local unit = this.unit

	if not Clique:OnClick(button, unit) then
		if Luna_Raid_OnClick then
			Luna_Raid_OnClick()
		else
			Luna_OnClick()
		end
	end

end


