--originally By NathanReturns additions by mo_on

print("new")
if LOADED then
	return
end

pcall(function() getgenv().LOADED = true end)



local botgoing = "starting"




local Settings
local DefaultSettings = {DisableAnimate="nil",AnimationPack="nil",rejoined="nil",botgoingto="nil"}			
local function Save()writefile(game.Players.LocalPlayer.Name.."Returnerbot.hi",game:service'HttpService':JSONEncode(Settings))
end




if not pcall(function() readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi") end) then writefile(game.Players.LocalPlayer.Name.."Returnerbot.hi", game:service'HttpService':JSONEncode(DefaultSettings)) end
Settings = game:service'HttpService':JSONDecode(readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi"))
if Settings.rejoined == "t"  then
	print("rejoined")
	botgoing = Settings.botgoingto
	Settings.rejoined = "f"
	end



print(botgoing)



if game.PlaceId == 1990228024 then
else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Error!";
		Text = "ReturnerBOT does not Support this game.";
		Duration = 5;
	})
	error("a")
	return
end

local rejoin = false

local Dir = game:GetService("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay")
game.Players.PlayerRemoving:Connect(function(plr)
	if plr.Name == game.Players.LocalPlayer.Name then
		if Dir:FindFirstChild("ErrorTitle") then
			if Dir:FindFirstChild("ErrorTitle").Text:sub(0, 12) == "Disconnected" then
	
				if not pcall(function() readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi") end) then writefile(game.Players.LocalPlayer.Name.."Returnerbot.hi", game:service'HttpService':JSONEncode(DefaultSettings)) end
				Settings.DisableAnimate = getgenv().DisableAnimate
				Settings.AnimationPack=getgenv().AnimationPack
				Settings.rejoined = "t"
				Settings.botgoingto = botgoing
				Save()


				queue_on_teleport([[
				
				 local Settings
                 Settings = game:service'HttpService':JSONDecode(readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi"))
                 getgenv().DisableAnimate = Settings.DisableAnimate
                 getgenv().AnimationPack = Settings.AnimationPack
                print(Settings.botgoingto.." rejoin")
                 
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/hi.lua"))()
                 
                 ]])

				wait(2)
				rejoin = true
			end
		end
	end
end)


local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()




Dir.DescendantAdded:Connect(function(Err)
	if Err.Name == "ErrorTitle" then
		Err:GetPropertyChangedSignal("Text"):Connect(function()
			if Err.Text:sub(0, 12) == "Disconnected" then
				name = game.Players.LocalPlayer.Name
				if not beforeKicked then
					beforeKicked = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame
				end
		

				if not pcall(function() readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi") end) then writefile(game.Players.LocalPlayer.Name.."Returnerbot.hi", game:service'HttpService':JSONEncode(DefaultSettings)) end
				Settings.DisableAnimate = getgenv().DisableAnimate
				Settings.AnimationPack=getgenv().AnimationPack
				Settings.rejoined = "t"
				Settings.botgoingto = botgoing
				Save()


				queue_on_teleport([[
				
				 local Settings
                 Settings = game:service'HttpService':JSONDecode(readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi"))
                 getgenv().DisableAnimate = Settings.DisableAnimate
                 getgenv().AnimationPack = Settings.AnimationPack
                print(Settings.botgoingto.." rejoin")
                 
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/hi.lua"))()
                 
                 ]])

				wait(2)
				rejoin = true

			end
		end)
	end
end)

spawn(function()
	game["Run Service"].RenderStepped:Connect(function()
		if rejoin == true then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
		end
	end)
end)










local plr = game:GetService("Players").LocalPlayer
if getgenv().DisableAnimate == true then
	Character.Animate.Disabled = true
end
game.Players.PlayerAdded:Connect(function(plr)

	if plr:GetRankInGroup(2788849) == 12 then
		local loc = plr
		local args = {
			[1] = "A Senior Management has been detected, Leaving to evade a Server ban...",
			[2] = "All"
		}
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
		wait (1.5) 
		--game.Players.LocalPlayer:Kick("Senior Joined")

		game:GetService("RunService").RenderStepped:Connect(function()
			local Teleport = game:GetService("TeleportService")


			Teleport:Teleport(4483381587, game.Players.LocalPlayer)
		end)

	end
end)
--

for i,v in pairs(game:GetService("Players"):GetPlayers())  do
	if plr:GetRankInGroup(2788849) == 12 then
		--plr:Kick("Senior Still in Server..")
		game:GetService("RunService").RenderStepped:Connect(function()
			local Teleport = game:GetService("TeleportService")


			Teleport:Teleport(4483381587, game.Players.LocalPlayer)
		end)

	end end

spawn(function()
	if botgoing == "starting" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(50, 43, 89)----tp outside
		
	elseif botgoing == "reg 2" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(125, 44, 90)----tp

	elseif botgoing == "reg 1" then
		-- 119, 44, 90
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(119, 44, 90)----tp
		
	elseif botgoing == "reg 2 ag" then
		-- 118, 44, 74
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(118, 44, 74)-- tp
	elseif botgoing == "housekeeping" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(29, 43, 88)-- tp

		
	elseif botgoing == "bar" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(115, 44, 156)-- tp

	elseif botgoing == "reg2ag" then
		
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(113, 44, 60)-- tp

		
	elseif botgoing == "reg1ag" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(119, 44, 90)-- tp

	elseif botgoing == "reg2agag" then
		Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(118, 44, 74)-- tp

		end
end)


botversion = "V5"
local name = "Returner BOT"
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("["..name.."]: "..botversion.." has loaded.","All")
game.StarterGui:SetCore("SendNotification", {
	Title = "Returner BOT";
	Text = "Returner BOT Loaded! originally By NathanReturns additions by mo_on";
	Duration = 5;
})

local Player = plr
--local Character = Player.Character
Player.CharacterAdded:Connect(function()
	repeat task.wait() until Player.Character
	Character = Player.Character
end)
Character.ChildAdded:Connect(function(child)
	if child.Name == "Arrested" then
		pcall(function()
			local args = {
				[1] = "Cuffs detected Bypassing... ",
				[2] = "All"
			} 

			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
			if not pcall(function() readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi") end) then writefile(game.Players.LocalPlayer.Name.."Returnerbot.hi", game:service'HttpService':JSONEncode(DefaultSettings)) end
			Settings.DisableAnimate = getgenv().DisableAnimate
			Settings.AnimationPack=getgenv().AnimationPack
			Settings.rejoined = "t"
			Settings.botgoingto = botgoing
			Save()


			queue_on_teleport([[
				
				 local Settings
                 Settings = game:service'HttpService':JSONDecode(readfile(game.Players.LocalPlayer.Name.."Returnerbot.hi"))
                 getgenv().DisableAnimate = Settings.DisableAnimate
                 getgenv().AnimationPack = Settings.AnimationPack
                 print(Settings.botgoingto.." rejoin")
                
                 
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/hi.lua"))()
                 
                 ]])


			wait (2)

			rejoin = true


		end)
	end
end)















local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")


for i,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
	v:Stop()
end

local Animate = game.Players.LocalPlayer.Character.Animate
if  getgenv().AnimationPack == "Knight" then

	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"

elseif  getgenv().AnimationPack == "Astronaut" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"

elseif getgenv().AnimationPack == "Werewolf" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
end


local TeleportService = game:GetService("TeleportService")


local speed = getgenv().Speed
if botgoing == "starting" then
spawn(function()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(76, 44, 89)--walks on carpet thing
end)
	plr.Character.Humanoid.MoveToFinished:Wait()
	botgoing = "reg 2"
end



function reg2()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 43, 90)---walks to reg 2 2
	plr.Character.Humanoid.MoveToFinished:Wait()
	wait()

	pcall(function()
		local args = {
			[1] = "Room please. ",----asks for room from reg2
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)
end


function reg1() -- aaa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(119, 44, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(118, 44, 74)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 44, 76)
	plr.Character.Humanoid.MoveToFinished:Wait()
	wait ()

	pcall(function()
		local args = {
			[1] = "May I have a room? ",----asks for room from reg1 1
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)

end


function reg2again() --aa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(118, 44, 74)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(119, 44, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 43, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	wait ()

	pcall(function()
		local args = {
			[1] = "Can I have one of your rooms? ",----asks for room from reg2 again 2
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end)
end


function housekeeping() -- aa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(29, 43, 88)---------walk to housekeeping
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(76, 43, 89)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(95, 43, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(117, 44, 110)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(118, 44, 155)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(139, 44, 156)
	plr.Character.Humanoid.MoveToFinished:Wait()
	wait()
	pcall(function()
		local args = {
			[1] = "Can someone clean my room?",----asks for someone to clean room
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end)
	
	wait(.2)

	pcall(function()
		local args = {
			[1] = "Can one of the housekeepers clean my room?",----asks for someone to clean room
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end)
end



function bar() -- aa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(115, 44, 156)---------walk to bar
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(116, 44, 91)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(29, 43, 88)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(76, 43, 89)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(95, 43, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(113, 43, 58)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(106, 43, 45)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(68, 43, 28)---------walk to seat
	plr.Character.Humanoid.MoveToFinished:Wait()

	pcall(function()
		local args = {
			[1] = "Could I have a Churro, Nachos and Chips please? ",----asks for food
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)

	wait (speed)

	plr.Character.Humanoid.WalkToPoint = Vector3.new(68, 43, 19)
	plr.Character.Humanoid.MoveToFinished:Wait()
	pcall(function()
		local args = {
			[1] = "Can I get a Chocolate Milkshake, a Cookie and a bag of Nachos please? ",----asks for food
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)
	wait (speed)
	plr.Character.Humanoid.WalkToPoint = Vector3.new(68, 43, 10)
	plr.Character.Humanoid.MoveToFinished:Wait()
	pcall(function()
		local args = {
			[1] = "Could I have a Churro, Nachos and Chips please? ",----asks for food
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)
end


function reg2ag() -- aa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(113, 44, 60)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(115, 44, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 43, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	wait()
	pcall(function()
		local args = {
			[1] = "Room please. ",----asks for room from reg2
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)
end


function reg1ag() -- aa
	plr.Character.Humanoid.WalkToPoint = Vector3.new(119, 44, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(118, 44, 74)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 44, 76)
	plr.Character.Humanoid.MoveToFinished:Wait()
wait()
	pcall(function()
		local args = {
			[1] = "May I have a room? ",----asks for room from reg1
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
	)
end


function reg2agag() 
	print("hi")
	plr.Character.Humanoid.WalkToPoint = Vector3.new(118, 44, 74)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(119, 44, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
	plr.Character.Humanoid.WalkToPoint = Vector3.new(145, 43, 90)
	plr.Character.Humanoid.MoveToFinished:Wait()
wait()
	pcall(function()
		local args = {
			[1] = "Can I have one of your rooms? ",----asks for room from reg2 again
			[2] = "All"
		}          
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end)
end


spawn(function()
	repeat task.wait(1)
		pcall(function()
			if botgoing == "reg 2" then
				reg2()
				wait(speed)
				botgoing = "reg 1"
				
			elseif botgoing == "reg 1" then
				reg1()
				wait(speed)
				botgoing = "reg 2 ag"
				
			elseif botgoing == "reg 2 ag" then
				reg2again()
				wait(speed)
				botgoing = "housekeeping"
				
			elseif botgoing == "housekeeping" then
				housekeeping()
				wait(speed)
				botgoing = "bar"
				
			elseif botgoing == "bar" then
				bar()
				wait(speed)
				botgoing = "reg2ag"
				
			elseif botgoing == "reg2ag" then
				reg2ag()
				wait(speed)
				botgoing = "reg1ag"
				
			elseif botgoing == "reg1ag" then
				reg1ag()
				wait(speed)
				botgoing = "reg2agag"
				
			elseif botgoing == "reg2agag" then
				
				reg2again()
				wait(speed)
				botgoing = "reg 2"
			
			end
			wait(speed)
		end)
	until false
end)
