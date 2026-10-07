local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function setupTimeLabel(gui)
    local timeLabel = gui:FindFirstChild("Time")
    if timeLabel and timeLabel:IsA("TextLabel") then
        if gui.Name == "Server Time" then
            timeLabel.Position = UDim2.new(-0.001, 0, 0.479, 0)
            timeLabel.Size = UDim2.new(0.15, 0, 0.1, 0)
        elseif gui.Name == "Day Time" then
            timeLabel.Position = UDim2.new(-0.001, 0, 0.575, 0)
            timeLabel.Size = UDim2.new(0.1, 0, 0.08, 0)
        end
    end
end

-- Wait for the PlayerGui to be ready
local playerGui = player:WaitForChild("PlayerGui")

-- List of GUI names to handle
local guiNames = {"Server Time", "Day Time"}

-- Handle existing GUIs
for _, guiName in ipairs(guiNames) do
    local gui = playerGui:FindFirstChild(guiName)
    if gui then
        setupTimeLabel(gui)
    end
end

-- Handle if a GUI is added later
playerGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") then
        for _, guiName in ipairs(guiNames) do
            if child.Name == guiName then
                setupTimeLabel(child)
            end
        end
    end
end)
