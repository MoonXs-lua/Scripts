local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Seven hub",
    SubTitle = "by SevenXs",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Variables
_G.autofarm = true

-- Functions 
function autofarm()
    while _G.autofarm == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-250.0177001953125, 179.5, 290.1176452636719)
    wait(0.00001)
    end
end

local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

-- Toggles

local autofarm = Tabs.Misc:AddToggle("Auto-Farm", 
{
    Title = "auto farm", 
    Description = "Farm wins automatically",
    Default = false,
    Callback = function(state)
            _G.autofarm = state
            autofarm()
    end 
})

-- Buttons

Tabs.Teleports:AddButton({
    Title = "Tower",
    Description = "Teleport to the tower",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279.40301513671875, 179.49998474121094, 340.9585876464844)
    end
})

Tabs.Teleports:AddButton({
    Title = "Island",
    Description = "Teleport to the island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-138.55470275878906, 47.400001525878906, 3.2469112873077393)
    end
})
