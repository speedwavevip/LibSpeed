local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- إعدادات الهوب
local Configs_HUB = {
    Cor_Hub = Color3.fromRGB(25, 25, 25),
    Cor_DarkText = Color3.fromRGB(255, 255, 255),
    Text_Font = Enum.Font.Code
}

-- دالة إنشاء عناصر واجهة المستخدم
local function Create(type, parent, properties)
    local element = Instance.new(type)
    for prop, value in pairs(properties) do
        element[prop] = value
    end
    element.Parent = parent
    return element
end

-- دالة إنشاء زوايا مستديرة
local function Corner(element)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = element
    return corner
end

-- دالة AddSection كما طلبت
function AddSection(parent, Configs)
    local SectionName = Configs[1] or Configs.Name or "Section!!"
    
    local Frame = Create("Frame", parent, {
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundColor3 = Configs_HUB.Cor_Hub,
        Name = "Frame",
        Transparency = 1
    })
    Corner(Frame)
    
    local TextButton = Create("TextButton", Frame, {
        TextSize = 12,
        TextColor3 = Configs_HUB.Cor_DarkText,
        Text = SectionName,
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        TextXAlignment = "Left",
        Font = Configs_HUB.Text_Font
    })
    return TextButton
end

function SetSection(Section, NewName)
    Section.Text = NewName
end

-- متغيرات ESP
local ESPEnabled = false
local ESPPlayers = {}

-- دالة إنشاء ESP للاعب
local function createESP(player)
    if player == LocalPlayer then return end
    
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- إنشاء BillboardGui فوق رأس اللاعب
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.
