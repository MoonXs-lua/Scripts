local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Seven hub | Natural Disaster Survival",
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

Tabs.Teleports:AddButton({
    Title = "Free ballon (CLIENT-SIDE)",
    Description = "take a free balloon",
    Callback = function()
        local function createNotif(title,text,icon,duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = title; 
		Text = text;
		Icon = icon; 
		Duration = duration; 
	})
end
 
if game.Workspace:FindFirstChild("GreenBalloon", true) then -- Check for stealable GreenBalloon 
	balloonClone = game.Workspace:FindFirstChild("GreenBalloon", true):Clone() -- clone it 
	balloonClone.Parent = game:GetService("Players").LocalPlayer.Backpack
	createNotif("garfield","🎈 balloon succesfully stolen!",nil,"5")
else 
	createNotif("garfield","🎈 there is no balloons.",nil,"5")
end 
            
    end
})

-- Settings

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Tabs.Settings:AddButton({
    Title = "Destroy hub",
    Description = "🤯",
    Callback = function()
        Fluent:Destroy()
    end
})


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 50, 0,50)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "UI"
Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
Toggle.TextSize = 28.000
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl" , false , game)
end)

local Corner = Instance.new("UICorner")
Corner.Name = "Corner"
Corner.Parent = Toggle
