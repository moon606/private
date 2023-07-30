

local API = {}


local pfservice = game:GetService("PathfindingService")
local debris = game:GetService("Debris")

local processes = {}

local std = loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/Standard.lua"))()


API.Stuck = function(humanoid: Humanoid)
	if not (humanoid:GetState() == Enum.HumanoidStateType.Jumping)  then
		humanoid:Move(Vector3.new(math.random(-1,1),0,math.random(-1,1)))
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
		wait(1)
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(1)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
	end
end

local g_id = 0

local function reset(NPC)

	NPC.Humanoid:MoveTo(NPC.PrimaryPart.Position)
end

API.SmartPathfind = function(NPC: any, Target: any, Yields: boolean, Settings: "Table; StandardPathfindSettings, Visualize, Tracking")

	--TODO: add positional / tracking options.

	if NPC == nil or Target == nil then return false end

	local pfSettings = {
		StandardPathfindSettings = {
			AgentRadius = 3,
			AgentHeight = 6,
			AgentCanJump = true,
			AgentCanClimb = true,
			Cost = {}
		},
		Visualize = false,
		Tracking = false, -- continues till AI:Stop(NPC) or different pathfind is started.
	}

	if Settings then
		for setting, v in pairs(Settings) do
			pfSettings[setting] = v
		end
	end

	local i = 0

	local enemyRoot = nil
	local enemyHuman = nil
	local targetRoot = nil

	local function updateBasedOnType(obj,type) -- if you're trying to understand this script collapse this function and IGNORE it.

		i+=1

		local function updateVars(char)

			if i == 1 then -- for tracker


				enemyRoot = char:FindFirstChild("HumanoidRootPart")
				if enemyRoot == nil then error("Could not find HRT. change to waitforchild to bypass") return end
				enemyHuman = char:FindFirstChild("Humanoid")
				if enemyHuman == nil then error("Could not find Humanoid. change to waitforchild to bypass") return end

			end

			if i == 2 then -- for target

				targetRoot = char:FindFirstChild("HumanoidRootPart")
				if targetRoot == nil then error("Could not find HRT. change to waitforchild to bypass") return end
			end
		end

		if (typeof(obj)) == "userdata" then -- checks for Humanoid

			if obj:IsA("Humanoid") then

				updateVars(obj.Parent)
			end
		end

		if type == "Model" then -- checks to see if it is a char

			if i == 1 then

				if obj:FindFirstChild("Humanoid") then

					updateVars(obj)
				end
			end

			if i == 2 then

				targetRoot = obj:GetChildren()[1]
			end
		end

		if type == "Player" then -- checks to see if it is a player

			if obj.Character ~= nil then updateVars(obj.Character) end
			if obj.Character == nil then return "char not found" end -- protects against Players:GetChildren() loop errors
		end

		if type == "Part" then -- finds humanoid from part, if humanoid then send.

			if obj.Parent:FindFirstChild("Humanoid") then

				updateVars(obj.Parent)
			end

			if obj.Parent.Parent:FindFirstChild("Humanoid") then

				updateVars(obj.Parent.Parent)
			end

			if i == 1 then error("Are you sure you passed in the right part for the character, could not find a Humanoid") return end

			if i == 2 then -- for normality

				targetRoot = obj
			end
		end
	end

	if NPC ~= nil then updateBasedOnType(NPC,std.basic.GetType(NPC)) else error("Enemy/Tracker does not exist.") end
	if Target ~= nil then updateBasedOnType(Target,std.basic.GetType(Target)) else return "target not found" end


	-- Pathfinding
	local pathCount = 1

	local path = pfservice:CreatePath(Settings.StandardPathfindSettings)

	--print(waypoints)
	local function losCheck()

		local result = std.math.LineOfSight(NPC, Target, {Range = 50, SeeThroughTransparentParts = false, filterTable = {}})
		if result then
			return true
		end

		return false
	end

	local function destroyWP()

		for i, v in pairs(NPC:GetChildren()) do

			if v.Name == "Waypoints" then

				debris:AddItem(v,0)
			end
		end
	end

	local function moveTo()
		enemyHuman:MoveTo(targetRoot.Position)

		if not pfSettings.Tracking then

			enemyHuman.MoveToFinished:Wait()
		end
	end

	local function pathfind()

		local result = losCheck()
		if result then moveTo() return end

		path:ComputeAsync(enemyRoot.Position,targetRoot.Position)
		local waypoints = path:GetWaypoints()


		if path.Status == Enum.PathStatus.NoPath then error("No path could be found. This is an issue with Roblox, not Forbidden.") return false end -- if no possible path.

		if path.Status == Enum.PathStatus.Success then
			local currentPathCount = pathCount

			g_id+=1
			local id = g_id

			processes[NPC] = id -- KEEP THIS IN MIND WHEN TRYING TO PAUSE, you have to pass the char in when pausing

			if Settings.Visualize then
				local folder = Instance.new("Folder")
				folder.Parent = NPC
				folder.Name = "Waypoints"

				for i, waypoint in pairs(waypoints) do

					local part = Instance.new("Part")
					part.Shape = Enum.PartType.Ball
					part.Color = Color3.new(0.384314, 0.341176, 1)
					part.Material = Enum.Material.Neon
					part.CFrame = CFrame.new(waypoint.Position)
					part.Parent = folder
					part.Name = i
					part.Anchored = true
					part.Size = Vector3.new(1,1,1)
					part.CanCollide = false
				end
			end


			for i, waypoint in ipairs(waypoints) do -- LOOPING THROUGH WAYPOINTS

				if i > 1 then

					if losCheck() then moveTo() return end

					if currentPathCount > #waypoints or processes[NPC] ~= id then

						--print(#waypoints)
						--print("stopping")
						reset(NPC)

						return
					end
					--print(waypoint.Action)
					if waypoint.Action == Enum.PathWaypointAction.Jump and  not (enemyHuman:GetState() == Enum.HumanoidStateType.Jumping) then
						enemyHuman:SetStateEnabled(Enum.HumanoidStateType.Running, false)
						wait(1)
						enemyHuman:ChangeState(Enum.HumanoidStateType.Jumping)
						wait(1)
						enemyHuman:SetStateEnabled(Enum.HumanoidStateType.Running, true)
					end
					enemyHuman:MoveTo(waypoint.Position)
					delay(0.5, function()
						if enemyHuman.WalkToPoint.Y > (targetRoot.Position.Y + 0.5) and (enemyRoot.Position - targetRoot.Position).Magnitude < 5 and not (enemyHuman:GetState() == Enum.HumanoidStateType.Jumping) then
							enemyHuman:SetStateEnabled(Enum.HumanoidStateType.Running, false)
							wait(1)
							enemyHuman:ChangeState(Enum.HumanoidStateType.Jumping)
							wait(1)
							enemyHuman:SetStateEnabled(Enum.HumanoidStateType.Running, true)
						end
					end)

					local moveSuccess = enemyHuman.MoveToFinished:Wait()
					if not moveSuccess then
						break
					end
				end

				currentPathCount+=1
			end
		else
			API:Stuck(enemyHuman)
		end
	end

	if Yields or Yields == nil then

		local lastPos = nil
		processes[NPC] = "starting"

		if pfSettings.Tracking == true then
			while processes[NPC] ~= false do

				if std.math.Round(targetRoot.Position) ~= lastPos then 
					lastPos = std.math.Round(targetRoot.Position)
					if pfSettings.Visualize then destroyWP() end
					spawn(pathfind)
				end
				wait()

			end
		end

		if pfSettings.Tracking == nil or pfSettings.Tracking == false then
			if pfSettings.Visualize then destroyWP() end
			pathfind()
		end
	end

	if not Yields then
		spawn(function()
			local lastPos = nil
			processes[NPC] = "starting"

			if pfSettings.Tracking == true then
				while processes[NPC] ~= false do

					if std.math.Round(targetRoot.Position) ~= lastPos then 
						if pfSettings.Visualize then destroyWP() end
						lastPos = std.math.Round(targetRoot.Position)
						spawn(pathfind)
					end
					wait()
				end
			end

			if pfSettings.Tracking == nil or pfSettings.Tracking == false then
				if pfSettings.Visualize then destroyWP() end
				spawn(pathfind)
			end
		end)
	end

	if pfSettings.Visualize then -- ensures all those wps are gone
		destroyWP()
	end
end

local function updateAll()


end

local function onStoppage(AI)

	if AI == nil then error("AI passed to AI:Stop() is nil.") return end

	if processes[AI] ~= nil then


		if AI:FindFirstChild("Waypoints") then AI:FindFirstChild("Waypoints"):Destroy() end
		reset(AI)

		processes[AI] = false
		return
	end

	error("AI is not in active table, please make sure you passed it in correctly.")
end

API.Stop = function(AI: Model)

	onStoppage(AI)
	return "stopping"
end



--function API:SmartActivate(humanoid, continuous): boolean TODO


--	return false
--end

return API
