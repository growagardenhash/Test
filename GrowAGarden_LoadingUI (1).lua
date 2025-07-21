
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Create screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Script by J"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
bg.Parent = gui

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
}
gradient.Parent = bg

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 100)
title.Position = UDim2.new(0, 0, 0.20, 0)
title.Text = "Grow a Garden by J"
title.Font = Enum.Font.GothamBlack
title.TextSize = 50
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextStrokeTransparency = 0.8
title.TextWrapped = true
title.Parent = bg

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0.38, 0)
subtitle.Text = "Script is loading, please wait..."
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.TextColor3 = Color3.fromRGB(230, 230, 230)
subtitle.BackgroundTransparency = 1
subtitle.TextStrokeTransparency = 0.8
subtitle.TextWrapped = true
subtitle.Parent = bg

-- Warning
local warning = Instance.new("TextLabel")
warning.Size = UDim2.new(1, 0, 0, 30)
warning.Position = UDim2.new(0, 0, 0.45, 0)
warning.Text = "⚠️ DO NOT LEAVE, THIS SCRIPT IS CURRENTLY BYPASSING ANTI-CHEAT ⚠️"
warning.Font = Enum.Font.GothamBold
warning.TextSize = 18
warning.TextColor3 = Color3.fromRGB(255, 80, 80)
warning.BackgroundTransparency = 1
warning.TextStrokeTransparency = 0.6
warning.TextWrapped = true
warning.Parent = bg

-- Loading bar background
local loadBg = Instance.new("Frame")
loadBg.Size = UDim2.new(0.6, 0, 0, 20)
loadBg.Position = UDim2.new(0.2, 0, 0.55, 0)
loadBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadBg.BorderSizePixel = 0
loadBg.BackgroundTransparency = 0.2
loadBg.ClipsDescendants = true
loadBg.AnchorPoint = Vector2.new(0, 0.5)
loadBg.Parent = bg

-- Loading bar fill
local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.Position = UDim2.new(0, 0, 0, 0)
loadBar.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
loadBar.BorderSizePixel = 0
loadBar.Parent = loadBg

-- Choose random load duration (1 to 5 minutes)
local loadTime = math.random(60, 300)

-- Animate bar
local tweenInfo = TweenInfo.new(loadTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = TweenService:Create(loadBar, tweenInfo, {
    Size = UDim2.new(1, 0, 1, 0)
})
tween:Play()

-- % progress update
task.spawn(function()
    for i = 1, loadTime do
        local percent = math.floor((i / loadTime) * 100)
        subtitle.Text = "Loading... " .. percent .. "%"
        wait(1)
    end
end)

-- On complete
tween.Completed:Connect(function()
    subtitle.Text = "Script loaded successfully!"
    wait(1.5)
    gui:Destroy()
end)
