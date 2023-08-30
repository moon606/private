local TerrainSaveLoad = {}

local function SaveTerrainProperty(terrainProperty: string, class: string, parent: Instance)
	local valHold = Instance.new(class) :: ValueBase
	valHold.Name = terrainProperty
	valHold.Value = workspace.Terrain[terrainProperty]
	valHold.Parent = parent
end

local function LoadTerrainProperty(terrainRegion: TerrainRegion, terrainProperty: string)
	local propVal = terrainRegion:FindFirstChild(terrainProperty)
	if propVal then
		workspace.Terrain[terrainProperty] = propVal.Value
	end
end

local function AttemptGetMaterialColor(material: Enum.Material): (boolean, Color3)
	return pcall(function()
		return workspace.Terrain:GetMaterialColor(material)
	end)
end

local function AttemptSetMaterialColor(material: Enum.Material, color: Color3): boolean
	return pcall(function()
		workspace.Terrain:SetMaterialColor(material, color)
	end)
end

function TerrainSaveLoad.Save(): TerrainRegion
	local terrainRegion = workspace.Terrain:CopyRegion(workspace.Terrain.MaxExtents)
	terrainRegion.Name = "SavedTerrain"
	terrainRegion.Parent = game.ReplicatedStorage

	-- Save water properties:
	local waterProps = Instance.new("Folder")
	waterProps.Name = "WaterProperties"
	SaveTerrainProperty("WaterColor", "Color3Value", waterProps)
	SaveTerrainProperty("WaterReflectance", "NumberValue", waterProps)
	SaveTerrainProperty("WaterTransparency", "NumberValue", waterProps)
	SaveTerrainProperty("WaterWaveSize", "NumberValue", waterProps)
	SaveTerrainProperty("WaterWaveSpeed", "NumberValue", waterProps)
	waterProps.Parent = terrainRegion

	-- Save material colors:
	local materialColors = Instance.new("Folder")
	materialColors.Name = "MaterialColors"
	for _,material in Enum.Material:GetEnumItems() do
		local success, color = AttemptGetMaterialColor(material)
		if not success then continue end
		local colorValue = Instance.new("Color3Value")
		colorValue.Name = material.Name
		colorValue.Value = color
		colorValue.Parent = materialColors
	end
	materialColors.Parent = terrainRegion

	return terrainRegion
end

function TerrainSaveLoad.Load(terrainRegion: TerrainRegion)
	if typeof(terrainRegion) ~= "Instance" or not terrainRegion:IsA("TerrainRegion") then
		error("Expected TerrainRegion object as argument to Load", 2)
	end

	local position = Vector3int16.new(
		-math.floor(terrainRegion.SizeInCells.X / 2),
		-math.floor(terrainRegion.SizeInCells.Y / 2),
		-math.floor(terrainRegion.SizeInCells.Z / 2)
	)

	workspace.Terrain:PasteRegion(terrainRegion, position, true)

	-- Load water properties:
	local waterProps = terrainRegion:FindFirstChild("WaterProperties")
	if waterProps then
		LoadTerrainProperty(terrainRegion, "WaterColor")
		LoadTerrainProperty(terrainRegion, "WaterReflectance")
		LoadTerrainProperty(terrainRegion, "WaterTransparency")
		LoadTerrainProperty(terrainRegion, "WaterWaveSize")
		LoadTerrainProperty(terrainRegion, "WaterWaveSpeed")
	end

	-- Load material colors:
	local materialColors = terrainRegion:FindFirstChild("MaterialColors")
	if materialColors then
		for _,material in Enum.Material:GetEnumItems() do
			local colorVal = materialColors:FindFirstChild(material.Name)
			if colorVal then
				AttemptSetMaterialColor(material, colorVal.Value)
			end
		end
	end
end

return TerrainSaveLoad
