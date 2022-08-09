plr:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == SleepKey:lower() then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("😴", "All")
