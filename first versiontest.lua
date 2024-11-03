
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Rivalskid.shit", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "WARNING not very imporant",
	Content = "This script contain shit codes and skids. plz no hate..",
	Image = "rbxassetid://4483345998",
	Time = 5
})
Tab:AddButton({
	Name = "esp!!",
	Callback = function()
local function createESP(player)
    if player == game.Players.LocalPlayer then return end -- Skip the local player

    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")

    local playerGui = game.Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        warn("No PlayerGui found for the local player. ESP cannot be created.")
        return
    end

    -- Create BillboardGui for ESP
    local highlight = Instance.new("BillboardGui")
    highlight.Name = "ESP"
    highlight.Adornee = rootPart
    highlight.Size = UDim2.new(4, 0, 5, 0)
    highlight.AlwaysOnTop = true

    -- Create a frame for the box
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(0, 255, 0)

    -- Create the health label
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Size = UDim2.new(1, 0, 0.2, 0)
    healthLabel.Position = UDim2.new(0, 0, -0.2, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.TextScaled = true
    healthLabel.Font = Enum.Font.SourceSansBold
    healthLabel.Text = "Health: " .. math.floor(humanoid.Health)

    -- Create the name label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.2, 0)
    nameLabel.Position = UDim2.new(0, 0, -0.4, 0) -- Positioned above the health label
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Text = player.Name

    -- Update health in real-time
    local function updateHealth()
        if humanoid and humanoid.Parent then
            healthLabel.Text = "Health: " .. math.floor(humanoid.Health)
        end
    end
    humanoid.HealthChanged:Connect(updateHealth)

    -- Parent UI elements
    frame.Parent = highlight
    healthLabel.Parent = highlight
    nameLabel.Parent = highlight
    highlight.Parent = playerGui -- Show for local player

    print("ESP created for player: " .. player.Name)
end

-- Create ESP for each player in the game
for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        createESP(player)
    end
end

-- Update ESP when new players join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)
  	end    
})

Tab:AddButton({
	Name = "aimbot(not the best)",
	Callback = function()
      		local aimbotEnabled = true
local aimLockDistance = 100 -- adjust this as needed

-- Helper function to get the closest target
local function getClosestTarget()
    local players = game.Players:GetPlayers()
    local closestPlayer = nil
    local shortestDistance = aimLockDistance

    for _, player in pairs(players) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local screenPosition, onScreen = workspace.CurrentCamera:WorldToScreenPoint(head.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Main aiming logic
game:GetService("RunService").RenderStepped:Connect(function()
    if not aimbotEnabled then return end

    local targetPlayer = getClosestTarget()
    if targetPlayer and targetPlayer.Character then
        local head = targetPlayer.Character:FindFirstChild("Head")
        if head then
            local headScreenPos = workspace.CurrentCamera:WorldToScreenPoint(head.Position)
            local distance = (Vector2.new(headScreenPos.X, headScreenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

            if distance < aimLockDistance then
                -- Move mouse to head position to lock aim
                mousemoverel(headScreenPos.X - mouse.X, headScreenPos.Y - mouse.Y)
            end
        end
    end
end)
  	end    
})


Tab:AddButton({
	Name = "legit aimbot testing",
	Callback = function()
      		local aimbotEnabled = true
local aimLockDistance = 100 -- Adjust this as needed
local smoothingFactor = 0.1 -- Lower values = slower, more natural aim

-- Helper function to get the closest target
local function getClosestTarget()
    local players = game.Players:GetPlayers()
    local closestPlayer = nil
    local shortestDistance = aimLockDistance

    for _, player in pairs(players) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local screenPosition, onScreen = workspace.CurrentCamera:WorldToScreenPoint(head.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Main aiming logic
game:GetService("RunService").RenderStepped:Connect(function()
    if not aimbotEnabled then return end

    local targetPlayer = getClosestTarget()
    if targetPlayer and targetPlayer.Character then
        local head = targetPlayer.Character:FindFirstChild("Head")
        if head then
            local headScreenPos = workspace.CurrentCamera:WorldToScreenPoint(head.Position)
            local distance = (Vector2.new(headScreenPos.X, headScreenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

            if distance < aimLockDistance then
                -- Calculate smooth aim movement
                local deltaX = (headScreenPos.X - mouse.X) * smoothingFactor
                local deltaY = (headScreenPos.Y - mouse.Y) * smoothingFactor
                mousemoverel(deltaX, deltaY) -- Move the mouse gradually towards the target
            end
        end
    end
end)
  	end    
})

Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})
-- ColorPicker:Set(Color3.fromRGB(255,255,255))
Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
		print(Value)
	end    
})

 --Slider:Set(2)
 Tab:AddLabel("Label")
--CoolLabel:Set("Label New!")
Tab:AddParagraph("Paragraph","Paragraph Content")
-- CoolParagraph:Set("Paragraph New!")

Tab:AddTextbox({
	Name = "Textbox",
	Default = "default box input",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})


Tab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		print("press")
	end    
})
-- Bind:Set(Enum.KeyCode.E)
Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		print(Value)
	end    
})
-- Dropdown:Refresh(List<table>,true)
--Dropdown:Set("dropdown option")
OrionLib:Init()
-- destroying the interface: OrionLib:Destroy()
