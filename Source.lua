local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | Fling things and peoples", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Attack",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

anti = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
   if not checkcaller() and self == game.Players.LocalPlayer and table.find({"destroy", "kick", "remove"}, getnamecallmethod():lower()) then
  warn("Budgie Hub: an attempt to destroy a player has been eliminated")
return nil
  elseif not checkcaller() and self == game.Players and table.find({"banasync", "destroy", "remove"}, getnamecallmethod():lower()) then
   warn("Budgify: TEST1")
  return nil
    end
   return anti(self, ...)
end))

getgenv().isnetworkownerp = newcclosure(function(plr)
  return (plr.Character.HumanoidRootPart.ReceiveAge == 0 and gethiddenproperty(plr.Character.HumanoidRootPart, "NetworkIsSleeping") == false) and plr.Character.Head:FindFirstChild("PartOwner") and plr.Character.Head.PartOwner.Value == game.Players.LocalPlayer.Name
end)

getgenv().isnetworkownerm = newcclosure(function(model)
  return (model.HumanoidRootPart.ReceiveAge == 0 and gethiddenproperty(model.HumanoidRootPart, "NetworkIsSleeping") == false) and model.Head:FindFirstChild("PartOwner") and model.Head.PartOwner.Value == game.Players.LocalPlayer.Name
end)

local function sno(player, cf)
local args = {
    [1] = player,
    [2] = cf
}

game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("CreateGrabLine"):FireServer(unpack(args))

local args = {
    [1] = player,
    [2] = cf
}

game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"):FireServer(unpack(args))
end

local function ungrab(player)
local args = {
    [1] = player
}

game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine"):FireServer(unpack(args))
end

Tab:AddToggle({
 Name = "Fling nearest",
 Default = false,
 Callback = function(Value)
tyf = Value
while tyf and task.wait(0.05) do
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 40)
  for _, part in ipairs(parts) do
     if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
sno(humanoid.RootPart, humanoid.RootPart.CFrame)

local bv = Instance.new("BodyVelocity", humanoid.RootPart)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - humanoid.RootPart.Position).Unit * -2000

 task.wait()
ungrab(humanoid.RootPart)
     end
  end
end
   end    
})

Tab:AddToggle({
 Name = "Spin nearest",
 Default = false,
 Callback = function(Value)
 hig = Value
  while hig and task.wait(0.05) do
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 40)
  for _, part in ipairs(parts) do
     if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
sno(humanoid.RootPart, humanoid.RootPart.CFrame)
 local bav = Instance.new("BodyAngularVelocity", humanoid.RootPart)
 bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
 bav.AngularVelocity = Vector3.new(1000, 1000, 1000)
ungrab(humanoid.RootPart)
     end
  end
end 
   end    
})

Tab:AddToggle({
 Name = "Backrooms nearest",
 Default = false,
 Callback = function(Value)
nuin = Value
while nuin and task.wait(0.05) do
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 25)
  for _, part in ipairs(parts) do
     if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
sno(humanoid.RootPart, humanoid.RootPart.CFrame)
 for _, part in next, humanoid.Parent:GetDescendants() do
   if part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
   end
 end
task.wait()
ungrab(humanoid.RootPart)
     end
  end
end
   end    
})

Tab:AddButton({
 Name = "Throw all nearest parts (tool)",
 Callback = function()
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
tool.Name = "Throw all nearest parts"
tool.RequiresHandle = false

tool.Activated:Connect(function()
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 30)
  for _, part in ipairs(parts) do
     if part.Anchored == false and part.Parent ~= game.Players.LocalPlayer.Character and not game.Players:GetPlayerFromCharacter(part.Parent) then
sno(part, part.CFrame)
local bv = Instance.new("BodyVelocity", part)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 500
game.Debris:AddItem(bv, 7)
 task.wait()
ungrab(part)
     end
  end
end)
   end    
})

Tab:AddToggle({
 Name = "Confuse nearest",
 Default = false,
 Callback = function(Value)
nuin = Value
while nuin and task.wait(0.05) do
local parts = workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 30)
  for _, part in ipairs(parts) do
     if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
sno(humanoid.RootPart, humanoid.RootPart.CFrame)
 local force2 = Instance.new("BodyAngularVelocity", humanoid.RootPart)
force2.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
force2.AngularVelocity = Vector3.new(0, -1e5, 0)
task.wait()
ungrab(humanoid.RootPart)
     end
  end
end
   end    
})

Tab:AddToggle({
 Name = "Players Kill grab",
 Default = false,
 Callback = function(Value)
 uhgy = Value
   for _, button in next, game.Players.LocalPlayer.PlayerGui.ContextActionGui.ContextButtonFrame:GetChildren() do
  if button:IsA("ImageButton") and button.Name == "ContextActionButton" then
    button.MouseButton1Click:Connect(function()
for _, player in next, game.Players:GetPlayers() do
pcall(function()
   if player ~= game.Players.LocalPlayer and player.Character and player.Character.HumanoidRootPart and isnetworkownerp(player) and ughy == true then
game.Players.LocalPlayer.SimulationRadius = math.huge
player.Character.Humanoid.Health = 0
  end
   end)
end
    end)
  end
   end
 end    
})

Tab:AddToggle({
 Name = "Players deadly grab",
 Default = false,
 Callback = function(Value)
 bvg = Value
   for _, button in next, game.Players.LocalPlayer.PlayerGui.ContextActionGui.ContextButtonFrame:GetChildren() do
  if button:IsA("ImageButton") and button.Name == "ContextActionButton" then
    button.MouseButton1Click:Connect(function()
for _, player in next, game.Players:GetPlayers() do
 pcall(function()
   if player ~= game.Players.LocalPlayer and player.Character and player.Character.HumanoidRootPart and isnetworkownerp(player) and bvg == true then
game.Players.LocalPlayer.SimulationRadius = math.huge

for _, part in next, workspace.Map:GetDescendants() do
  if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
firetouchinterest(player.Character.HumanoidRootPart, part, 0)
  end
end

  end
 end)
end
    end)
  end
   end
 end    
})

Tab:AddButton({
 Name = "Bring all by using Blobman",
 Callback = function()
for _, humanoid in ipairs(workspace:GetDescendants()) do
  if humanoid:IsA("Humanoid") and humanoid.Parent ~= game.Players.LocalPlayer.Character and humanoid.RootPart then
local args = {
    [1] = humanoid.RootPart,
    [2] = humanoid.RootPart.CFrame
}

game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"):FireServer(unpack(args))
  task.wait()
local args = {
    [1] = workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("LeftDetector"),
    [2] = humanoid.RootPart,
    [3] = workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("LeftDetector"):WaitForChild("LeftWeld")
}

workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(args))
humanoid.RootPart.Velocity = Vector3.zero
task.wait(0.1)
  end
end
   end    
})

Tab:AddButton({
 Name = "Kill all by using Blobman",
 Callback = function()
for _, humanoid in ipairs(workspace:GetDescendants()) do
  if humanoid:IsA("Humanoid") and humanoid.Parent ~= game.Players.LocalPlayer.Character and humanoid.RootPart then
local args = {
    [1] = humanoid.RootPart,
    [2] = humanoid.RootPart.CFrame
}

game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"):FireServer(unpack(args))
  task.wait()
local args = {
    [1] = workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("LeftDetector"),
    [2] = humanoid.RootPart,
    [3] = workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("LeftDetector"):WaitForChild("LeftWeld")
}

workspace:WaitForChild(game.Players.LocalPlayer.Name .. "SpawnedInToys"):WaitForChild("CreatureBlobman"):WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(args))
humanoid.RootPart.Velocity = Vector3.zero

task.spawn(function()
for i = 1, 3 do 
  task.wait(0.25)
 if isnetworkownerp(game.Players:GetPlayerFromCharacter(humanoid.Parent)) then
 for _, part in next, workspace.Map:GetDescendants() do
   if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
 firetouchinterest(humanoid.RootPart, part, 0)
 firetouchinterest(humanoid.RootPart, part, 1)
   end
 end
end
 end
end)

task.wait(0.1)
  end
end
   end    
})

Tab:AddButton({
 Name = "Buff blob man",
 Callback = function()
      workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "SpawnedInToys").CreatureBlobman:FindFirstChildOfClass("Humanoid").WalkSpeed = 75
      for _, part in next, workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "SpawnedInToys").CreatureBlobman:GetDescendants() do
        if part:IsA("BasePart") then
part.CustomPhysicalProperties = PhysicalProperties.new(100, 100, 100)
        end
      end
   end    
})

local Tab = Window:MakeTab({
	Name = "Defense",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
 Name = "Anti grab",
 Default = false,
 Callback = function(Value)
fgt = Value
  while fgt and task.wait() do
   game:GetService("ReplicatedStorage"):WaitForChild("CharacterEvents"):WaitForChild("Struggle"):FireServer()
    if game.Players.LocalPlayer.Character.Humanoid.Sit and game.Players.LocalPlayer.Character.Head:FindFirstChild("PartOwner") then
 task.spawn(function()
  if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored then return end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
  if game.Players.LocalPlayer.Character.Head:FindFirstChild("PartOwner") then
game.Players.LocalPlayer.Character.Head.PartOwner:Destroy()
  end
 task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
end)
   end
  end
 end    
})

Tab:AddToggle({
 Name = "Anti velocity",
 Default = false,
 Callback = function(Value)
 popa = Value
     while popa and task.wait() do
        if game.Players.LocalPlayer.Character.Humanoid.Sit or game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Magnitude >= 60 then
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
        end
     end
   end    
})

Tab:AddToggle({
 Name = "Anti velocity v2",
 Default = false,
 Callback = function(Value)
 loo = Value
    while loo and task.wait() do
     pcall(function()
 local uselessly = {"BodyVelocity", "BodyThrust", "BodyAngularVelocity", "BodyGyro", "BodyForce", "RocketPropulsion", "LineForce", "VectorForce", "AngularVelocity", "RopeConstraint"}
  for _, inst in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if table.find(uselessly, inst.ClassName) then
     inst:Destroy()
   end
 end
 
 for _, child in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if child:IsA("BasePart") then
      child.Massless = false
      child.CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5) 
    end
  end
   end)
       end
   end    
})

Tab:AddToggle({
 Name = "Anti hack grab",
 Default = false,
 Callback = function(Value)
aahhgg = Value
     while aahhgg and task.wait() do
       pcall(function()
 game:GetService("ReplicatedStorage"):WaitForChild("CharacterEvents"):WaitForChild("Struggle"):FireServer()
 game.Players.LocalPlayer.Character.Humanoid.Ragdolled.Value = false
 game.Players.LocalPlayer.HeldTimer.Value = 0
 game.Players.LocalPlayer.MaxHeldTimer.Value = 0
 game.Players.LocalPlayer.IsHeld.Value = false
 
    if game.Players.LocalPlayer.Character.Humanoid.Sit and game.Players.LocalPlayer.Character.Head:FindFirstChild("PartOwner") then
 task.spawn(function()
  if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored then return end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
task.spawn(function()
 repeat task.wait()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedpos
  game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
  game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
  game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
  if game.Players.LocalPlayer.Character.Head:FindFirstChild("PartOwner") then
game.Players.LocalPlayer.Character.Head.PartOwner:Destroy()
  end
 until game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored == false
end)
 task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
end)
   end
   
 local uselessly = {"BodyVelocity", "BodyThrust", "BodyAngularVelocity", "BodyGyro", "BodyForce", "RocketPropulsion", "LineForce", "VectorForce", "AngularVelocity", "RopeConstraint", "BallSocketConstraint"}
  for _, inst in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if table.find(uselessly, inst.ClassName) then
     inst:Destroy()
    elseif inst:IsA("BasePart") then
     inst.Massless = false
     inst.CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5)
    elseif inst:IsA("Weld") or isnt:IsA("WeldConstraint") then
       task.delay(1, function()
          inst:Destroy()
       end)
   end
 end
 
 if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("WeldHRP") then
game.Players.LocalPlayer.Character.HumanoidRootPart.WeldHRP:Destroy()
 end

 if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("RootJoint") then
game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint:Destroy()
 end
 
       end)
     end
   end    
})

Tab:AddToggle({
 Name = "Anti void",
 Default = false,
 Callback = function(Value)
ihh = Value
      while ihh and task.wait() do
        pcall(function()
   if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= -20 or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y >= 800 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, -7, -20)
game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
   end
        end)
      end
   end    
})

Tab:AddToggle({
 Name = "Counter",
 Default = false,
 Callback = function(Value)
gyvb = Value
     while gyvb and task.wait() do
       pcall(function()
         if game.Players.LocalPlayer.Character.Head:FindFirstChild("PartOwner") then
 sno(game.Players[game.Players.LocalPlayer.Character.Head.PartOwner.Value].Character.HumanoidRootPart, game.Players[game.Players.LocalPlayer.Character.Head.PartOwner.Value].Character.HumanoidRootPart.CFrame)
   for _, part in next, workspace.Map:GetDescendants() do
     if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
firetouchinterest(game.Players[game.Players.LocalPlayer.Character.Head.PartOwner.Value].Character.HumanoidRootPart, part, 0)
     end
   end
 task.delay(0.05, function()
ungrab(game.Players[game.Players.LocalPlayer.Character.Head.PartOwner.Value].Character.HumanoidRootPart)
 end)
 game.Players.LocalPlayer.Character.Head.PartOwner:Destroy()
 game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
 game:GetService("ReplicatedStorage"):WaitForChild("CharacterEvents"):WaitForChild("Struggle"):FireServer()
         end
       end)
     end
   end    
})
