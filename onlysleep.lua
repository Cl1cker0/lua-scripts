local plr = game:GetService("Players").LocalPlayer
Sleeping = false

if not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(plr.UserId, 6207330) then
	game.StarterGui:SetCore("SendNotification",{Title ="Sleep script",Text ="You need to own the Boombox gamepass!",Duration =10}) 

end

local function Sleep()
	if plr.Backpack:FindFirstChild("[Boombox]") then plr.Backpack:FindFirstChild("[Boombox]").Parent = plr.Character wait(.01) end
	game:GetService("ReplicatedStorage").MainEvent:FireServer("Boombox","8633288492")
	wait(.01)
	plr.Character:FindFirstChild("[Boombox]").Parent = plr.Backpack
end

local function Wakeup()
	game:GetService("ReplicatedStorage").MainEvent:FireServer("BoomboxStop")
end

local LayAni = Instance.new('Animation',workspace)
LayAni.Name = "Laying"
LayAni.AnimationId = "rbxassetid://3152378852"
local Lay = plr.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(LayAni)

plr:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == SleepKey:lower() then 
		Sleeping = not Sleeping
		
		if Sleeping == true then
			Lay = plr.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(workspace:FindFirstChild("Laying"))
			Sleep()
			Lay:Play()
			
		else if Sleeping == false then
				Wakeup()
				Lay:Stop()
				
			end
		end
	end
end)
