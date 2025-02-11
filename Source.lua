local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | Fling things and peoples", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Attack",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

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
task.wait(0.1)
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
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
 task.spawn(function()
  if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored then return end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
 task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
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
 local uselessly = {"BodyVelocity", "BodyThrust", "BodyAngularVelocity", "BodyGyro", "BodyForce", "RocketPropulsion", "LineForce", "VectorForce", "AngularVelocity", "RopeConstraint"}
  for _, inst in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if table.find(uselessly, inst.ClassName) then
     inst:Destroy()
   end
 end
       end
   end    
})
