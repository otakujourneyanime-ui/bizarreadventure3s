-- Roblox Menu Script

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Parent = ScreenGui
ScreenGui.Parent = playerGui

-- Collector Feature
local function collectItems()
    for _, item in pairs(Workspace:GetChildren()) do
        if item:IsA("Part") and item.Name:match("Item") then
            item.Position = player.Character.HumanoidRootPart.Position
        end
    end
end

-- Teleport Feature
local function teleport(location)
    player.Character:SetPrimaryPartCFrame(location.CFrame)
end

-- NPC ESP
local function createESP(npc)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = npc
    highlight.Parent = npc
end

-- Item ESP
local function createItemESP(item)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = item
    highlight.Parent = item
end

-- Auto Collect Feature
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        collectItems()
    end
end)

-- Example Teleport Locations
local teleportLocations = {
    {Name = "Spawn", CFrame = CFrame.new(0, 10, 0)},
    -- Add more locations as needed
}

for _, location in pairs(teleportLocations) do
    createESP(location)
end

-- Setting Up Events
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0.2, 0, 0.1, 0)
teleportButton.Position = UDim2.new(0.4, 0, 0.1, 0)
teleportButton.Text = "Teleport"
teleportButton.Parent = MainFrame
teleportButton.MouseButton1Click:Connect(function()
    teleport(teleportLocations[1]) -- Example: teleport to the first location
end) 

-- NPC Listing and ESP Creation
for _, npc in pairs(Workspace:GetChildren()) do
    if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
        createESP(npc)
    end
end
