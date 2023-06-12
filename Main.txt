(getgenv()).Config = {
 ["FastAttack"] = true
} 

coroutine.wrap(function()
local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    for v,v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
             for v,v in pairs(debug.getupvalues(v)) do
                if typeof(v) == "table" then
                    spawn(function()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            if getgenv().Config['FastAttack'] then
                                 pcall(function()
                                     v.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                                     v.activeController.attacking = false
                                     v.activeController.increment = 4
                                     v.activeController.blocking = false   
                                     v.activeController.hitboxMagnitude = 150
                                     v.activeController.humanoid.AutoRotate = true
                                     v.activeController.focusStart = 0
                                     v.activeController.currentAttackTrack = 0
                                     sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                                 end)
                             end
                         end)
                    end)
                end
            end
        end
    end
end)();

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Config['ClickAttack'] then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "TNG Hub Race V4", HidePremium = false, SaveConfig = true, ConfigFolder = "TNG Hub"})
local Tab1 = Window:MakeTab({
    Name = "Infor",
    Icon = "rbxassetid://13699229966",
    PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "TNG Hub",
	Content = "TNG Hub Auto Race V4 Run!",
	Image = "rbxassetid://13699229966",
	Time = 5
})
local FM = Tab1:AddLabel("Full Moon")
local Mirragecheck = Tab1:AddLabel("Mirage Island")
task.spawn(function()
            while task.wait() do
                pcall(function()
                    if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                        FM:Set("ðŸŒ•: Full Moon 100%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                        FM:Set("ðŸŒ–â€™ : Full Moon 75%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                        FM:Set("ðŸŒ—â€œ : Full Moon 50%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                        FM:Set("ðŸŒ˜ : Full Moon 25%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                        FM:Set("ðŸŒ˜: Full Moon 15%")
                    else
                        FM:Set("ðŸŒ‘: Full Moon 0%")
                    end
                end)
            end
end)
      
spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
    Mirragecheck:Set('ðŸï¸: Mirage Island is Spawning')
    else
      Mirragecheck:Set('âŒ: Mirage Island Not Found ' )end
            end
        end)
end)
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://13699229966",
    PremiumOnly = false
})
 function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    
    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end


function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end
Tab1:AddLabel("Script Make By TN Gaming")
Tab1:AddLabel("YTB: TN Gaming")
Tab1:AddButton({
	Name = "Copy Youtube Link",
	Callback = function()
      		setclipboard("https://www.youtube.com/@tngaminghack")
  	end    
})
Tab1:AddButton({
	Name = "Copy Discord Link",
	Callback = function()
      		setclipboard("https://web1s.co/Discord")
  	end    
})
local Section = Tab:AddSection({
    Name = "Teleport"
})
Tab:AddButton({
    Name = "Teleport To Top Of GreatTree",
    Callback = function()
            topos(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
    end    
})
Tab:AddButton({
    Name = "Teleport To Timple Of Time",
    Callback = function()
            Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end    
})
Tab:AddButton({
    Name = "Teleport To Lever Pull",
    Callback = function()
            topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end    
})
Tab:AddButton({
    Name = "Teleport To Acient One (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end    
})
Tab:AddButton({
    Name = "Clock Acces",
    Callback = function()
            game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
    game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
    end    
})
Tab:AddButton({
    Name = "Disabled Inf Stairs",
    Callback = function()
            game.Players.LocalPlayer.Character.InfiniteStairs.Disabled = value
    end    
})
local Section = Tab:AddSection({
    Name = "Teleport Door"
})
Tab:AddButton({
    Name = "Teleport Cyborg Door (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
    end    
})
Tab:AddButton({
    Name = "Teleport Fish Door (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
    end    
})
Tab:AddButton({
    Name = "Teleport Human Door (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
    end    
})
Tab:AddButton({
    Name = "Teleport Mink Door (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
    end    
})
Tab:AddButton({
    Name = "Teleport Sky Door (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
    end    
})
Tab:AddButton({
    Name = "Teleport To Safe Zone When Pvp (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28273.0859375, 14896.5078125, 157.42063903808594))
    end    
})
Tab:AddButton({
    Name = "Teleport Pvp Zone (Must Be in Temple Of Time!)",
    Callback = function()
            topos(CFrame.new(28766.681640625, 14967.1455078125, -164.13290405273438))
    end    
})
local Section = Tab:AddSection({
    Name = "Auto Trials"
})
Tab:AddButton({
    Name = "Auto Complete Angel Trial",
    Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame
    end    
})
Tab:AddButton({
    Name = "Auto Complete Rabbit Trial",
    Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-5,0)
    end    
})
Tab:AddButton({
    Name = "Auto Complete Cyborg Trial",
    Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,300,0)
    end    
})
Tab:AddToggle({
    Name = "Auto Complete Ghoul Trial",
    Default = false,
    Callback = function(Value)
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait(.1)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not _G.Kill_Aura  or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
    end    
})
Tab:AddToggle({
    Name = "Auto Complete Human Trial",
    Default = false,
    Callback = function(Value)
    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait(.1)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not _G.Kill_Aura  or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
    end    
})