local Okap = Instance.new("ScreenGui",game:GetService("CoreGui"))
local frameOkap = Instance.new("Frame",Okap)
frameOkap.Size = UDim2.new(0.2, 0,0.848, 0)
frameOkap.Position = UDim2.new(0.773, 0,0.047, 0)
frameOkap.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Instance.new("UICorner",frameOkap).CornerRadius = UDim.new(0,8)
local bababoyee = Instance.new("Frame",frameOkap)
bababoyee.Position = UDim2.new(0.044, 0,0.095, 0)
bababoyee.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
bababoyee.Size = UDim2.new(0.911,0,0.735,0)
Instance.new("UIGridLayout",bababoyee).CellSize = UDim2.new(1,0,0.1,0)
local FireINTE = Instance.new("TextButton",bababoyee)
FireINTE.Name = "FireCLICK"
FireINTE.Text = "FireClickDetector"
FireINTE.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
FireINTE.TextScaled = true
local FireINTE = Instance.new("TextButton",bababoyee)
FireINTE.Name = "FireINT"
FireINTE.Text = "FireTouchInterest"
FireINTE.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
FireINTE.TextScaled = true
local FireINTE = Instance.new("TextButton",bababoyee)
FireINTE.Name = "Delete"
FireINTE.Text = "Delete"
FireINTE.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
FireINTE.TextScaled = true
local FireINTE = Instance.new("TextButton",bababoyee)
FireINTE.Name = "Freeze"
FireINTE.Text = "Freeze"
FireINTE.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
FireINTE.TextScaled = true
local FireINTE = Instance.new("TextButton",frameOkap)
FireINTE.Name = "Button"
FireINTE.Text = "Select Part"
FireINTE.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
FireINTE.TextScaled = true
FireINTE.TextColor3 = Color3.fromRGB(255, 255, 255)
FireINTE.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
FireINTE.Size = UDim2.new(0.898, 0,0.043, 0)
FireINTE.Position = UDim2.new(0.057, 0,0.935, 0)
local FireINTE = Instance.new("TextLabel",frameOkap)
FireINTE.Text = "Instance Editor"
FireINTE.BackgroundTransparency = 1
FireINTE.TextScaled = true
FireINTE.TextColor3 = Color3.fromRGB(255, 255, 255)
FireINTE.Size = UDim2.new(0.911, 0,0.051, 0)
FireINTE.Position = UDim2.new(0.044, 0,0.016, 0)
local FireINTE = Instance.new("TextLabel",frameOkap)
FireINTE.Name = "Output"
FireINTE.Text = "No Output"
FireINTE.BackgroundTransparency = 1
FireINTE.TextScaled = true
FireINTE.TextColor3 = Color3.fromRGB(124, 124, 124)
FireINTE.Size = UDim2.new(0.911, 0,0.063, 0)
FireINTE.Position = UDim2.new(0.044, 0,0.847, 0)
On = false
Part = nil
Gui = Okap
Gui.Frame.Button.MouseButton1Down:Connect(function()
	if On == false then
		On = true
	else
		On = false
	end
end)
local function Startclick()
	cooldown = true
	local ok
	local oldo
	local stop = false
	ok = game:GetService("RunService").Heartbeat:Connect(function()
		if On == true then
			pcall(function()
				pcall(function()
					oldo:Destroy()
				end)
				oldo = Instance.new("SelectionBox",game:GetService("Players").LocalPlayer:GetMouse().Target)
				oldo.Adornee = game:GetService("Players").LocalPlayer:GetMouse().Target
			end)
		else
			pcall(function()
				oldo:Destroy()
			end)
			stop = true
			ok:Disconnect()
			Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
			Gui.Frame.Output.Text = "No Output"
			cooldown = false
			On = false
		end
	end)
	Gui.Frame.Output.Text = "Awaiting Part"
	Gui.Frame.Output.TextColor3 = Color3.new(1,1,1)
	local oldwow
	oldwow = game:GetService("Players").LocalPlayer:GetMouse().Button1Up:Connect(function()
		if cooldown == true then
			if game:GetService("Players").LocalPlayer:GetMouse().Target ~= nil then
				cooldown = false
				On = false
				ok:Disconnect()
				oldwow:Disconnect()
				pcall(function()
					oldo:Destroy()
				end)
				Part = game:GetService("Players").LocalPlayer:GetMouse().Target
				Gui.Frame.Output.Text = "No Output"
				Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
			end
		end
	end)
end
task.spawn(function()
	while task.wait() do
		if On == true and cooldown ~= true then
			Startclick()
		end
	end
end)
local freezed = {}
local function findclick(part)
	for _, v in ipairs(part:GetDescendants()) do
		if v:IsA("ClickDetector") then
			fireclickdetector(v)
		end
	end
end
local function find(part)
	for i, v in ipairs(freezed) do
		if v.ok == part or v.ok2==part then
			return {true,v.ok,v.ok2,v.oldparent,i}
		end
	end
	return {false}
end
local function fireint(part)
	pcall(function()
		firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),part,0)
		firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),part,1)
	end)
end
local function deletepart(part)
	pcall(function()
		if part.Anchored == false then
			part.CFrame = CFrame.new(0,workspace.FallenPartsDestroyHeight+50,0)
			part.CanCollide = false
			part.Anchored = false
		else
			part:Destroy()
		end
	end)
end
local function freezepart(part)
	if find(part)[1] == true then
		local ok = find(part)
		pcall(function()
			ok[3]:Destroy()
		end)
		ok[2].Parent = ok[4]
		table.remove(freezed,ok[5])
	else
		local oldarch;oldarch = part.Archivable
		part.Archivable = true
		local clone = part:Clone()
		clone.Parent = workspace
		table.insert(freezed,{ok=part;ok2=clone,oldparent=part.Parent})
		part.Archivable = oldarch
		clone.Archivable = oldarch
		clone.Anchored = true
		Part.Parent = game:GetService("ReplicatedStorage")

	end
end
Gui.Frame.Frame.FireCLICK.MouseButton1Up:Connect(function()
	if Part then
		findclick(Part)
	else
		Gui.Frame.Output.Text = "A part must be selected!"
		Gui.Frame.Output.TextColor3 = Color3.new(1,0,0)
		task.delay(2,function()
			Gui.Frame.Output.Text = "No Output"
			Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
		end)
	end
end)
Gui.Frame.Frame.FireINT.MouseButton1Up:Connect(function()
	if Part then
		fireint(Part)
	else
		Gui.Frame.Output.Text = "A part must be selected!"
		Gui.Frame.Output.TextColor3 = Color3.new(1,0,0)
		task.delay(2,function()
			Gui.Frame.Output.Text = "No Output"
			Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
		end)
	end
end)
Gui.Frame.Frame.Delete.MouseButton1Up:Connect(function()
	if Part then
		deletepart(Part)
	else
		Gui.Frame.Output.Text = "A part must be selected!"
		Gui.Frame.Output.TextColor3 = Color3.new(1,0,0)
		task.delay(2,function()
			Gui.Frame.Output.Text = "No Output"
			Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
		end)
	end
end)

Gui.Frame.Frame.Freeze.MouseButton1Up:Connect(function()
	if Part then
		freezepart(Part)
	else
		Gui.Frame.Output.Text = "A part must be selected!"
		Gui.Frame.Output.TextColor3 = Color3.new(1,0,0)
		task.delay(2,function()
			Gui.Frame.Output.Text = "No Output"
			Gui.Frame.Output.TextColor3 = Color3.fromRGB(124, 124, 124)
		end)
	end
end)
