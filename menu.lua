-- Menu Script for Roblox

-- Item Collector
local itemCollector = {}  
function itemCollector.collectItems()  
    for _, item in pairs(workspace:GetChildren()) do  
        if item:IsA("Part") and item.Name == "Item" then  
            item:Destroy()  -- Simulate collecting the item  
        end  
    end  
end

-- Teleports
local teleports = {  
    {name = "Spawn Point", position = Vector3.new(0, 0, 0)},  
    {name = "Hidden Cave", position = Vector3.new(50, 0, 50)}  
}
function teleports:goTo(name)  
    for _, teleport in pairs(self) do  
        if teleport.name == name then  
            game.Players.LocalPlayer.Character:MoveTo(teleport.position)  
        end  
    end  
end

-- NPC ESP
local function createESP(object)  
    local esp = Instance.new("BillboardGui")  
    esp.Adornee = object  
    esp.Size = UDim2.new(1, 0, 1, 0)  
    esp.AlwaysOnTop = true  
    local label = Instance.new("TextLabel", esp)  
    label.Text = object.Name  
    label.Size = UDim2.new(1, 0, 1, 0)  
    label.BackgroundTransparency = 1  
end
function addNpcEsp()  
    for _, npc in pairs(workspace:GetChildren()) do  
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then  
            createESP(npc)  
        end  
    end  
end

-- Item ESP
function addItemEsp()  
    for _, item in pairs(workspace:GetChildren()) do  
        if item:IsA("Part") and item.Name == "Item" then  
            createESP(item)  
        end  
    end  
end

-- Auto Collect Feature
function autoCollect()  
    while wait(1) do  
        itemCollector.collectItems()  
    end  
end

-- Activate Auto Collect
autoCollect()

-- Usage of Teleports
-- teleports:goTo("Spawn Point")
-- addNpcEsp()
-- addItemEsp()