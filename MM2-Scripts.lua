{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- // Services\
local Players = game:GetService("Players")\
local UIS = game:GetService("UserInputService")\
local RunService = game:GetService("RunService")\
local LocalPlayer = Players.LocalPlayer\
\
-- // UI Setup\
local ScreenGui = Instance.new("ScreenGui")\
local MainFrame = Instance.new("Frame")\
local MinimizeButton = Instance.new("TextButton")\
local ESPButton = Instance.new("TextButton")\
local FlyButton = Instance.new("TextButton")\
local SpeedButton = Instance.new("TextButton")\
local AimbotButton = Instance.new("TextButton")\
local RoleButton = Instance.new("TextButton")\
local CloseButton = Instance.new("TextButton")\
\
ScreenGui.Parent = game.CoreGui\
ScreenGui.Name = "ScriptUI"\
\
MainFrame.Parent = ScreenGui\
MainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)\
MainFrame.Size = UDim2.new(0, 200, 0, 300)\
MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)\
MainFrame.Visible = true\
\
MinimizeButton.Parent = MainFrame\
MinimizeButton.Text = "Minimize"\
MinimizeButton.Size = UDim2.new(1, 0, 0, 25)\
MinimizeButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
ESPButton.Parent = MainFrame\
ESPButton.Text = "Toggle ESP"\
ESPButton.Size = UDim2.new(1, 0, 0, 25)\
ESPButton.Position = UDim2.new(0, 0, 0, 30)\
ESPButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
FlyButton.Parent = MainFrame\
FlyButton.Text = "Toggle Fly"\
FlyButton.Size = UDim2.new(1, 0, 0, 25)\
FlyButton.Position = UDim2.new(0, 0, 0, 60)\
FlyButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
SpeedButton.Parent = MainFrame\
SpeedButton.Text = "Toggle Speed"\
SpeedButton.Size = UDim2.new(1, 0, 0, 25)\
SpeedButton.Position = UDim2.new(0, 0, 0, 90)\
SpeedButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
AimbotButton.Parent = MainFrame\
AimbotButton.Text = "Toggle Aimbot"\
AimbotButton.Size = UDim2.new(1, 0, 0, 25)\
AimbotButton.Position = UDim2.new(0, 0, 0, 120)\
AimbotButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
RoleButton.Parent = MainFrame\
RoleButton.Text = "Show Roles"\
RoleButton.Size = UDim2.new(1, 0, 0, 25)\
RoleButton.Position = UDim2.new(0, 0, 0, 150)\
RoleButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
CloseButton.Parent = MainFrame\
CloseButton.Text = "Close"\
CloseButton.Size = UDim2.new(1, 0, 0, 25)\
CloseButton.Position = UDim2.new(0, 0, 0, 180)\
CloseButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)\
\
-- // Variables\
local espEnabled = false\
local flyEnabled = false\
local speedEnabled = false\
local aimbotEnabled = false\
local rolesVisible = false\
local normalWalkSpeed = 16\
local boostedWalkSpeed = 200\
\
-- // Functions\
function toggleESP()\
    espEnabled = not espEnabled\
    for _, player in pairs(Players:GetPlayers()) do\
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then\
            if espEnabled then\
                local box = Instance.new("BoxHandleAdornment")\
                box.Size = player.Character.HumanoidRootPart.Size + Vector3.new(1, 1, 1)\
                box.Color3 = Color3.new(1, 0, 0)\
                box.Transparency = 0.5\
                box.Adornee = player.Character.HumanoidRootPart\
                box.AlwaysOnTop = true\
                box.Parent = player.Character.HumanoidRootPart\
                box.Name = "ESPBox"\
            else\
                local espBox = player.Character.HumanoidRootPart:FindFirstChild("ESPBox")\
                if espBox then espBox:Destroy() end\
            end\
        end\
    end\
end\
\
function toggleFly()\
    flyEnabled = not flyEnabled\
    if flyEnabled then\
        local bodyVelocity = Instance.new("BodyVelocity")\
        bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)\
        bodyVelocity.Velocity = Vector3.zero\
        bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart\
    end\
end\
\
function toggleSpeed()\
    speedEnabled = not speedEnabled\
    LocalPlayer.Character.Humanoid.WalkSpeed = speedEnabled and boostedWalkSpeed or normalWalkSpeed\
end\
\
function toggleAimbot()\
    aimbotEnabled = not aimbotEnabled\
    if aimbotEnabled then\
        -- Aimbot logic here (specific to MM2)\
    end\
end\
\
function showRoles()\
    rolesVisible = not rolesVisible\
    if rolesVisible then\
        for _, player in pairs(Players:GetPlayers()) do\
            -- Detect Murderer/Sheriff\
        end\
    end\
end\
\
-- // Button Events\
ESPButton.MouseButton1Click:Connect(toggleESP)\
FlyButton.MouseButton1Click:Connect(toggleFly)\
SpeedButton.MouseButton1Click:Connect(toggleSpeed)\
AimbotButton.MouseButton1Click:Connect(toggleAimbot)\
RoleButton.MouseButton1Click:Connect(showRoles)\
CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)\
\
MinimizeButton.MouseButton1Click:Connect(function()\
    MainFrame.Visible = not MainFrame.Visible\
end)\
\
print("Script Loaded: Use the UI to toggle features.")\
}