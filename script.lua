-- ==========================================
-- HEHE Panel — Delta (Public version)
-- Fly + Present Players (local only)
-- ==========================================

local PASSWORD = "25+25=50"
local REFRESH_INTERVAL = 5

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer

-- ==== UI ====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "H" .. math.random(10000, 99999)
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (gethui and gethui()) or LP:WaitForChild("PlayerGui")

local HeheBtn = Instance.new("TextButton")
HeheBtn.Size = UDim2.new(0, 60, 0, 40)
HeheBtn.Position = UDim2.new(0, 20, 0.5, -20)
HeheBtn.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
HeheBtn.Text = "HEHE"
HeheBtn.TextColor3 = Color3.fromRGB(200, 100, 255)
HeheBtn.Font = Enum.Font.Code
HeheBtn.TextSize = 13
HeheBtn.Parent = ScreenGui
Instance.new("UICorner", HeheBtn).CornerRadius = UDim.new(0, 8)

local HStroke = Instance.new("UIStroke", HeheBtn)
HStroke.Color = Color3.fromRGB(200, 100, 255)
HStroke.Thickness = 1

local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, 660, 0, 480)
Panel.Position = UDim2.new(0.5, -330, 0.5, -240)
Panel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Panel.BorderSizePixel = 0
Panel.Active = true
Panel.Draggable = true
Panel.Visible = false
Panel.Parent = ScreenGui
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 10)

local PStroke = Instance.new("UIStroke", Panel)
PStroke.Color = Color3.fromRGB(200, 100, 255)
PStroke.Thickness = 1.5

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 34)
Title.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
Title.Text = "  HEHE // PANEL"
Title.TextColor3 = Color3.fromRGB(200, 100, 255)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Panel
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

local LoginRow = Instance.new("Frame")
LoginRow.Size = UDim2.new(1, -20, 0, 32)
LoginRow.Position = UDim2.new(0, 10, 0, 44)
LoginRow.BackgroundTransparency = 1
LoginRow.Parent = Panel
local LR = Instance.new("UIListLayout", LoginRow)
LR.FillDirection = Enum.FillDirection.Horizontal
LR.Padding = UDim.new(0, 6)

local PwInput = Instance.new("TextBox")
PwInput.Size = UDim2.new(0, 400, 1, 0)
PwInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
PwInput.TextColor3 = Color3.fromRGB(200, 100, 255)
PwInput.PlaceholderText = "password..."
PwInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
PwInput.Font = Enum.Font.Code
PwInput.TextSize = 13
PwInput.ClearTextOnFocus = false
PwInput.Parent = LoginRow
Instance.new("UICorner", PwInput).CornerRadius = UDim.new(0, 6)

local LoginBtn = Instance.new("TextButton")
LoginBtn.Size = UDim2.new(0, 80, 1, 0)
LoginBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 100)
LoginBtn.Text = "LOGIN"
LoginBtn.TextColor3 = Color3.fromRGB(200, 100, 255)
LoginBtn.Font = Enum.Font.Code
LoginBtn.TextSize = 13
LoginBtn.Parent = LoginRow
Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 60, 1, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 30)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 13
CloseBtn.Parent = LoginRow
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 28)
TabBar.Position = UDim2.new(0, 10, 0, 84)
TabBar.BackgroundTransparency = 1
TabBar.Parent = Panel
local TBL = Instance.new("UIListLayout", TabBar)
TBL.FillDirection = Enum.FillDirection.Horizontal
TBL.Padding = UDim.new(0, 4)

local tabs = {}
local tabViews = {}

local function makeTab(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 110, 1, 0)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    b.TextColor3 = Color3.fromRGB(150, 150, 180)
    b.Font = Enum.Font.Code
    b.TextSize = 12
    b.Text = name
    b.Parent = TabBar
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    tabs[name] = b
end

makeTab("FLY")
makeTab("PLAYERS")

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -170)
Content.Position = UDim2.new(0, 10, 0, 120)
Content.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Content.BorderSizePixel = 0
Content.Parent = Panel
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

-- ==== FLY ====
local FlyFrame = Instance.new("Frame")
FlyFrame.Size = UDim2.new(1, 0, 1, 0)
FlyFrame.BackgroundTransparency = 1
FlyFrame.Parent = Content
tabViews["FLY"] = FlyFrame

local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0, 200, 0, 40)
FlyBtn.Position = UDim2.new(0.5, -100, 0, 20)
FlyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
FlyBtn.Text = "FLY: OFF"
FlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
FlyBtn.Font = Enum.Font.Code
FlyBtn.TextSize = 14
FlyBtn.Parent = FlyFrame
Instance.new("UICorner", FlyBtn).CornerRadius = UDim.new(0, 8)

local FlyInfo = Instance.new("TextLabel")
FlyInfo.Size = UDim2.new(1, -40, 0, 120)
FlyInfo.Position = UDim2.new(0, 20, 0, 80)
FlyInfo.BackgroundTransparency = 1
FlyInfo.Text = "Controls:\nWASD = move\nSpace = up\nLeftCtrl = down\nQ / E = speed -/+"
FlyInfo.TextColor3 = Color3.fromRGB(120, 120, 150)
FlyInfo.Font = Enum.Font.Code
FlyInfo.TextSize = 12
FlyInfo.TextXAlignment = Enum.TextXAlignment.Left
FlyInfo.TextYAlignment = Enum.TextYAlignment.Top
FlyInfo.Parent = FlyFrame

local flying = false
local bodyVel, bodyGyro
local flySpeed = 60

local function startFly()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if bodyVel then bodyVel:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end

    bodyVel = Instance.new("BodyVelocity")
    bodyVel.Name = "DeltaFlyVel"
    bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bodyVel.Velocity = Vector3.zero
    bodyVel.Parent = hrp

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Name = "DeltaFlyGyro"
    bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    bodyGyro.P = 1000
    bodyGyro.Parent = hrp

    task.spawn(function()
        while flying and bodyVel and bodyVel.Parent do
            local move = Vector3.zero
            local cam = workspace.CurrentCamera
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move -= Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then flySpeed = math.min(flySpeed + 2, 300) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) then flySpeed = math.max(flySpeed - 2, 10) end

            if move.Magnitude > 0 then
                bodyVel.Velocity = move.Unit * flySpeed
            else
                bodyVel.Velocity = Vector3.zero
            end
            bodyGyro.CFrame = cam.CFrame
            RunService.RenderStepped:Wait()
        end
    end)
end

local function stopFly()
    if bodyVel then bodyVel:Destroy(); bodyVel = nil end
    if bodyGyro then bodyGyro:Destroy(); bodyGyro = nil end
end

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        startFly()
        FlyBtn.Text = "FLY: ON"
        FlyBtn.TextColor3 = Color3.fromRGB(0, 255, 136)
    else
        stopFly()
        FlyBtn.Text = "FLY: OFF"
        FlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

LP.CharacterAdded:Connect(function()
    if flying then
        task.wait(1)
        startFly()
    end
end)

-- ==== PLAYERS (present only) ====
local PlayersFrame = Instance.new("ScrollingFrame")
PlayersFrame.Size = UDim2.new(1, 0, 1, 0)
PlayersFrame.BackgroundTransparency = 1
PlayersFrame.BorderSizePixel = 0
PlayersFrame.ScrollBarThickness = 4
PlayersFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 100, 255)
PlayersFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayersFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
PlayersFrame.Visible = false
PlayersFrame.Parent = Content
Instance.new("UIListLayout", PlayersFrame).Padding = UDim.new(0, 2)
tabViews["PLAYERS"] = PlayersFrame

local function selectTab(name)
    for _, view in pairs(tabViews) do view.Visible = false end
    tabViews[name].Visible = true
    for tn, btn in pairs(tabs) do
        btn.TextColor3 = (tn == name) and Color3.fromRGB(200, 100, 255) or Color3.fromRGB(150, 150, 180)
    end
end

for name, btn in pairs(tabs) do
    btn.MouseButton1Click:Connect(function() selectTab(name) end)
end
selectTab("FLY")

local function logLine(parent, text, color)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 0, 18)
    l.BackgroundTransparency = 1
    l.Text = "  " .. text
    l.TextColor3 = color or Color3.fromRGB(200, 200, 220)
    l.Font = Enum.Font.Code
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = parent
end

local function renderPlayers()
    for _, c in ipairs(PlayersFrame:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end

    local count = 0
    for _, p in ipairs(Players:GetPlayers()) do
        count = count + 1
        local isSelf = (p == LP)
        local color = isSelf and Color3.fromRGB(0, 255, 136) or Color3.fromRGB(200, 200, 220)

        local char = p.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        logLine(PlayersFrame, (isSelf and "★ " or "● ") .. p.Name .. "  (" .. tostring(p.UserId) .. ")", color)
        logLine(PlayersFrame, "   Display: " .. p.DisplayName .. "  |  " .. tostring(p.MembershipType))
        logLine(PlayersFrame, "   Age: " .. tostring(p.AccountAge) .. "d")
        if hum then
            logLine(PlayersFrame, "   Health: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "  |  Speed: " .. tostring(hum.WalkSpeed))
        end
        if hrp then
            local pos = hrp.Position
            logLine(PlayersFrame, "   Pos: " .. math.floor(pos.X) .. ", " .. math.floor(pos.Y) .. ", " .. math.floor(pos.Z))
        end
        if p.Team then
            logLine(PlayersFrame, "   Team: " .. p.Team.Name)
        end
        logLine(PlayersFrame, "")
    end

    logLine(PlayersFrame, "── PRESENT: " .. count .. "  |  " .. os.date("%H:%M:%S"), Color3.fromRGB(200, 100, 255))
end

-- ==== AUTH ====
local authed = false
local refreshToken = 0

local function doRefresh()
    if not authed then return end
    renderPlayers()
end

HeheBtn.MouseButton1Click:Connect(function()
    Panel.Visible = not Panel.Visible
    if Panel.Visible and not authed then
        PwInput:CaptureFocus()
    end
end)

LoginBtn.MouseButton1Click:Connect(function()
    if PwInput.Text == PASSWORD then
        authed = true
        doRefresh()
        refreshToken = refreshToken + 1
        local myToken = refreshToken
        task.spawn(function()
            while authed and refreshToken == myToken do
                task.wait(REFRESH_INTERVAL)
                if not authed or refreshToken ~= myToken then break end
                doRefresh()
            end
        end)
    else
        authed = false
        for _, c in ipairs(PlayersFrame:GetChildren()) do
            if c:IsA("TextLabel") then c:Destroy() end
        end
        logLine(PlayersFrame, "[-] Wrong password.", Color3.fromRGB(255, 80, 80))
    end
end)

PwInput.FocusLost:Connect(function(enter)
    if enter then LoginBtn:Fire("MouseButton1Click") end
end)

CloseBtn.MouseButton1Click:Connect(function()
    Panel.Visible = false
    PwInput.Text = ""
    authed = false
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Escape and Panel.Visible then
        Panel.Visible = false
        PwInput.Text = ""
        authed = false
    end
end)
