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
Plugin.url = "https://github.com/Aviana/LunaUnitFrames"

-- Plugin:Test() is called anytime the mod tries to enable.  It is optional
-- but it will be checked if it exists.  Will typically be based off some global
-- or the state of the addon itself.
function Plugin:Test()
    -- if IsAddOnLoaded("LUF") then return false end
    if IsAddOnLoaded("LunaUnitFrames") then
        -- DEFAULT_CHAT_FRAME:AddMessage("Clique: LUF is loaded")
        return true
    end
    return false
end


--- Plugin:OnEnable() is called if Plugin:Test() is true, and the mod hasn't been explicitly
-- disabled.  This is where you should handle all your hooks, etc.
function Plugin:OnEnable()
    Luna_Custom_ClickFunction = self.OnClick
    -- DEFAULT_CHAT_FRAME:AddMessage("Clique: LUF Support Enabled")
end

-- Plugin:OnDisable() is called if the mod is enabled and its being explicitly disabled.
-- This function is optional.  If it doesn't exist, Plugin:UnregisterAllEvents() and
-- Plugin:UnregisterAllHooks().
function Plugin:OnDisable()
    Luna_Custom_ClickFunction = nil
    -- DEFAULT_CHAT_FRAME:AddMessage("Clique: LUF Support Disabled")
end

-- Below this line begins any custom code to make the plugin work
function Plugin.OnClick(button, unit)
    -- DEFAULT_CHAT_FRAME:AddMessage("Clique: LUF OnClick triggered")
    return Clique:OnClick(button, unit)
end
