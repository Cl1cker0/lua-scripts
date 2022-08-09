plr:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == SendKey:lower() then
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("😴", "All")
	end
end)
