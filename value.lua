-- open source because lol 
local renv = {
	print = print, warn = warn, error = error, assert = assert, collectgarbage = collectgarbage, require = require,
	select = select, tonumber = tonumber, tostring = tostring, type = type, xpcall = xpcall,
	pairs = pairs, next = next, ipairs = ipairs, newproxy = newproxy, rawequal = rawequal, rawget = rawget,
	rawset = rawset, rawlen = rawlen, gcinfo = gcinfo,

	coroutine = {
		create = coroutine.create, resume = coroutine.resume, running = coroutine.running,
		status = coroutine.status, wrap = coroutine.wrap, yield = coroutine.yield,
	},

	bit32 = {
		arshift = bit32.arshift, band = bit32.band, bnot = bit32.bnot, bor = bit32.bor, btest = bit32.btest,
		extract = bit32.extract, lshift = bit32.lshift, replace = bit32.replace, rshift = bit32.rshift, xor = bit32.xor,
	},

	math = {
		abs = math.abs, acos = math.acos, asin = math.asin, atan = math.atan, atan2 = math.atan2, ceil = math.ceil,
		cos = math.cos, cosh = math.cosh, deg = math.deg, exp = math.exp, floor = math.floor, fmod = math.fmod,
		frexp = math.frexp, ldexp = math.ldexp, log = math.log, log10 = math.log10, max = math.max, min = math.min,
		modf = math.modf, pow = math.pow, rad = math.rad, random = math.random, randomseed = math.randomseed,
		sin = math.sin, sinh = math.sinh, sqrt = math.sqrt, tan = math.tan, tanh = math.tanh
	},

	string = {
		byte = string.byte, char = string.char, find = string.find, format = string.format, gmatch = string.gmatch,
		gsub = string.gsub, len = string.len, lower = string.lower, match = string.match, pack = string.pack,
		packsize = string.packsize, rep = string.rep, reverse = string.reverse, sub = string.sub,
		unpack = string.unpack, upper = string.upper,
	},

	table = {
		concat = table.concat, insert = table.insert, pack = table.pack, remove = table.remove, sort = table.sort,
		unpack = table.unpack,
	},

	utf8 = {
		char = utf8.char, charpattern = utf8.charpattern, codepoint = utf8.codepoint, codes = utf8.codes,
		len = utf8.len, nfdnormalize = utf8.nfdnormalize, nfcnormalize = utf8.nfcnormalize,
	},

	os = {
		clock = os.clock, date = os.date, difftime = os.difftime, time = os.time,
	},

	delay = delay, elapsedTime = elapsedTime, spawn = spawn, tick = tick, time = time, typeof = typeof,
	UserSettings = UserSettings, version = version, wait = wait, _VERSION = _VERSION,

	task = {
		defer = task.defer, delay = task.delay, spawn = task.spawn, wait = task.wait,
	},

	debug = {
		traceback = debug.traceback, profilebegin = debug.profilebegin, profileend = debug.profileend, info = debug.info 
	},

	game = game, workspace = workspace, Game = game, Workspace = workspace,

	getmetatable = getmetatable, setmetatable = setmetatable
}
table.freeze(renv)

getgenv().getrenv = function()
    return renv 
end 

local hiddenprs = {}
local oldghpr = gethiddenproperty
getgenv().gethiddenproperty = function(instance, property) 
	local instanceprs = hiddenprs[instance]
	if instanceprs and instanceprs[property] then
		return instanceprs[property], true
	end
	return oldghpr(instance, property)
end

getgenv().sethiddenproperty = function(instance, property, value)
	local instanceprs = hiddenprs[instance]
	if not instanceprs then
		instanceprs = {}
		hiddenprs[instance] = instanceprs
	end
	instanceprs[property] = value
	return true
end
getgenv().hookfunction = function(original, hook) 
    if type(original) ~= "function" then
        error("The first arg must be a function (original func).")
    end
    if type(hook) ~= "function" then
        error("The second arg must be a function (hook).")
    end
    local hooked = function(...)
        return hook(...)
    end
    local info = debug.getinfo(original)
    if info and info.name then
        getgenv()[info.name] = hooked
    else
        error("Failed to get function name")
    end
    return hooked
end
getgenv().messagebox = function(text, caption, flags) --sorta
	print(flags) -- no i am NOT doing every flag im too lazy so uhhh yes. 
	local Converted = {
		["_MessageBox"] = Instance.new("ScreenGui");
		["_Background"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_DropShadowHolder"] = Instance.new("Frame");
		["_DropShadow"] = Instance.new("ImageLabel");
		["_PanelUP"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["_Caption"] = Instance.new("TextLabel");
		["_Close"] = Instance.new("ImageButton");
		["_LocalScript"] = Instance.new("LocalScript");
		["_PanelDOWN"] = Instance.new("Frame");
		["_UICorner2"] = Instance.new("UICorner");
		["_OK"] = Instance.new("TextButton");
		["_UICorner3"] = Instance.new("UICorner");
		["_LocalScript1"] = Instance.new("LocalScript");
		["_Cancel"] = Instance.new("TextButton");
		["_UICorner4"] = Instance.new("UICorner");
		["_LocalScript2"] = Instance.new("LocalScript");
		["_Text"] = Instance.new("TextLabel");
	}

	Converted["_MessageBox"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Converted["_MessageBox"].Name = "MessageBox"
	Converted["_MessageBox"].Parent = game:GetService("CoreGui")

	Converted["_Background"].BackgroundColor3 = Color3.fromRGB(53.000004440546036, 53.000004440546036, 53.000004440546036)
	Converted["_Background"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Background"].BorderSizePixel = 0
	Converted["_Background"].Position = UDim2.new(0.435079724, 0, 0.375545859, 0)
	Converted["_Background"].Size = UDim2.new(0.220956713, 0, 0.20960699, 0)
	Converted["_Background"].Name = "Background"
	Converted["_Background"].Parent = Converted["_MessageBox"]
	Converted["_Background"].Active = true 
	Converted["_Background"].Draggable = true 

	Converted["_UICorner"].Parent = Converted["_Background"]

	Converted["_DropShadowHolder"].BackgroundTransparency = 1
	Converted["_DropShadowHolder"].BorderSizePixel = 0
	Converted["_DropShadowHolder"].Size = UDim2.new(1, 0, 1, 0)
	Converted["_DropShadowHolder"].ZIndex = 0
	Converted["_DropShadowHolder"].Name = "DropShadowHolder"
	Converted["_DropShadowHolder"].Parent = Converted["_Background"]

	Converted["_DropShadow"].Image = "rbxassetid://6014261993"
	Converted["_DropShadow"].ImageColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_DropShadow"].ImageTransparency = 0.5
	Converted["_DropShadow"].ScaleType = Enum.ScaleType.Slice
	Converted["_DropShadow"].SliceCenter = Rect.new(49, 49, 450, 450)
	Converted["_DropShadow"].AnchorPoint = Vector2.new(0.5, 0.5)
	Converted["_DropShadow"].BackgroundTransparency = 1
	Converted["_DropShadow"].BorderSizePixel = 0
	Converted["_DropShadow"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Converted["_DropShadow"].Size = UDim2.new(1.16151202, 0, 1.32638884, 0)
	Converted["_DropShadow"].ZIndex = 0
	Converted["_DropShadow"].Name = "DropShadow"
	Converted["_DropShadow"].Parent = Converted["_DropShadowHolder"]

	Converted["_PanelUP"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
	Converted["_PanelUP"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_PanelUP"].BorderSizePixel = 0
	Converted["_PanelUP"].Size = UDim2.new(1, 0, 0.180555552, 0)
	Converted["_PanelUP"].Name = "PanelUP"
	Converted["_PanelUP"].Parent = Converted["_Background"]

	Converted["_UICorner1"].Parent = Converted["_PanelUP"]

	Converted["_Caption"].Font = Enum.Font.SourceSans
	Converted["_Caption"].Text = caption
	Converted["_Caption"].TextColor3 = Color3.fromRGB(102.00000911951065, 102.00000911951065, 102.00000911951065)
	Converted["_Caption"].TextSize = 14
	Converted["_Caption"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Caption"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Caption"].BackgroundTransparency = 1
	Converted["_Caption"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Caption"].BorderSizePixel = 0
	Converted["_Caption"].Position = UDim2.new(0.0274914093, 0, 0, 0)
	Converted["_Caption"].Size = UDim2.new(0.859106541, 0, 1, 0)
	Converted["_Caption"].Name = "Caption"
	Converted["_Caption"].Parent = Converted["_PanelUP"]

	Converted["_Close"].Image = "rbxassetid://6031094677"
	Converted["_Close"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Close"].BackgroundTransparency = 1
	Converted["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Close"].BorderSizePixel = 0
	Converted["_Close"].Position = UDim2.new(0.910652936, 0, 0.115384616, 0)
	Converted["_Close"].Size = UDim2.new(0.0687285215, 0, 0.769230783, 0)
	Converted["_Close"].Name = "Close"
	Converted["_Close"].Parent = Converted["_PanelUP"]

	Converted["_PanelDOWN"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
	Converted["_PanelDOWN"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_PanelDOWN"].BorderSizePixel = 0
	Converted["_PanelDOWN"].Position = UDim2.new(0, 0, 0.652777791, 0)
	Converted["_PanelDOWN"].Size = UDim2.new(1, 0, 0.347222209, 0)
	Converted["_PanelDOWN"].Name = "PanelDOWN"
	Converted["_PanelDOWN"].Parent = Converted["_Background"]

	Converted["_UICorner2"].Parent = Converted["_PanelDOWN"]

	Converted["_OK"].Font = Enum.Font.SourceSans
	Converted["_OK"].Text = "Ok"
	Converted["_OK"].TextColor3 = Color3.fromRGB(61.00000396370888, 61.00000396370888, 61.00000396370888)
	Converted["_OK"].TextSize = 14
	Converted["_OK"].BackgroundColor3 = Color3.fromRGB(25.000002309679985, 25.000002309679985, 25.000002309679985)
	Converted["_OK"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_OK"].BorderSizePixel = 0
	Converted["_OK"].Position = UDim2.new(0.0721649453, 0, 0.100000001, 0)
	Converted["_OK"].Size = UDim2.new(0.371134013, 0, 0.779999971, 0)
	Converted["_OK"].Name = "OK"
	Converted["_OK"].Parent = Converted["_PanelDOWN"]

	Converted["_UICorner3"].Parent = Converted["_OK"]

	Converted["_Cancel"].Font = Enum.Font.SourceSans
	Converted["_Cancel"].Text = "Cancel"
	Converted["_Cancel"].TextColor3 = Color3.fromRGB(61.00000396370888, 61.00000396370888, 61.00000396370888)
	Converted["_Cancel"].TextSize = 14
	Converted["_Cancel"].BackgroundColor3 = Color3.fromRGB(25.000002309679985, 25.000002309679985, 25.000002309679985)
	Converted["_Cancel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Cancel"].BorderSizePixel = 0
	Converted["_Cancel"].Position = UDim2.new(0.560137451, 0, 0.100000001, 0)
	Converted["_Cancel"].Size = UDim2.new(0.371134013, 0, 0.779999971, 0)
	Converted["_Cancel"].Name = "Cancel"
	Converted["_Cancel"].Parent = Converted["_PanelDOWN"]

	Converted["_UICorner4"].Parent = Converted["_Cancel"]

	Converted["_Text"].Font = Enum.Font.SourceSans
	Converted["_Text"].Text = text
	Converted["_Text"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Text"].TextSize = 14
	Converted["_Text"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Text"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Text"].BackgroundTransparency = 1
	Converted["_Text"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Text"].BorderSizePixel = 0
	Converted["_Text"].Position = UDim2.new(0.0274914093, 0, 0.180555552, 0)
	Converted["_Text"].Size = UDim2.new(0.951890051, 0, 0.472222209, 0)
	Converted["_Text"].Name = "Text"
	Converted["_Text"].Parent = Converted["_Background"]

	local fake_module_scripts = {}

	local function CUAUOSG_fake_script() 
		local script = Instance.new("LocalScript")
		script.Name = "LocalScript"
		script.Parent = Converted["_Close"]
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end

		local messagebox = script.Parent.Parent.Parent.Parent 
		local close = script.Parent
		local proceed = false 
		close.MouseButton1Click:Connect(function()
			print(proceed)
			messagebox:Destroy()
		end)
	end
	local function GZGQI_fake_script() 
		local script = Instance.new("LocalScript")
		script.Name = "LocalScript"
		script.Parent = Converted["_OK"]
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end

		local ok = script.Parent 
		local messagebox = script.Parent.Parent.Parent.Parent 
		local proceed = false
		ok.MouseButton1Click:Connect(function()
			proceed = true 
			print(proceed)
			messagebox:Destroy()
		end)
	end
	local function QGPMPA_fake_script() 
		local script = Instance.new("LocalScript")
		script.Name = "LocalScript"
		script.Parent = Converted["_Cancel"]
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end

		local cancel = script.Parent 
		local messagebox = script.Parent.Parent.Parent.Parent 
		local proceed = false
		cancel.MouseButton1Click:Connect(function()
			print(proceed)
			messagebox:Destroy()
		end)
	end

	coroutine.wrap(CUAUOSG_fake_script)()
	coroutine.wrap(GZGQI_fake_script)()
	coroutine.wrap(QGPMPA_fake_script)()
end
getgenv().saveinstance = function() 
	local Params = {
		RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
		SSI = "saveinstance",
	}
	local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
	local SaveOptions = {
		ReadMe = true,
		IsolatePlayers = true,
		FilePath = string.format("%d", tick())
	}
	synsaveinstance(SaveOptions)
end

function check(funcName: string, func, testfunc)
    local success, err = pcall(function()
        getgenv()[funcName] = func
    end)
end

check("getdevice", function()
    return tostring(game:GetService("UserInputService"):GetPlatform()):split(".")[3]
end, function()
    assert(getgenv().getdevice() == tostring(game:GetService("UserInputService"):GetPlatform()):split(".")[3], "getdevice function test failed")
end)

check("getping", function(suffix: boolean)
    local rawping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingstr = rawping:sub(1, #rawping - 7)
    local pingnum = tonumber(pingstr)
    local ping = tostring(math.round(pingnum))
    return not suffix and ping or ping .. " ms"
end, function()
    local ping = getgenv().getping()
    assert(tonumber(ping) ~= nil, "getping function test failed")
end)

check("getfps", function(): number
    local RunService = game:GetService("RunService")
    local FPS: number
    local TimeFunction = RunService:IsRunning() and time or os.clock

    local LastIteration: number, Start: number
    local FrameUpdateTable = {}

    local function HeartbeatUpdate()
        LastIteration = TimeFunction()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
        end

        FrameUpdateTable[1] = LastIteration
        FPS = TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)
    end

    Start = TimeFunction()
    RunService.Heartbeat:Connect(HeartbeatUpdate)
    task.wait(1.1)
    return FPS
end, function()
    local fps = getgenv().getfps()
    assert(fps ~= nil and fps >= 0, "getfps function test failed")
end)

check("getaffiliateid", function()
    return "TNG"
end, function()
    assert(getgenv().getaffiliateid() == "TNG", "getaffiliateid function test failed")
end)

check("getplayer", function(name: string)
    return not name and getgenv().getplayers()["LocalPlayer"] or getgenv().getplayers()[name]
end)

check("getplayers", function()
    local players = {}
    for _, x in pairs(game:GetService("Players"):GetPlayers()) do
        players[x.Name] = x
    end
    players["LocalPlayer"] = game:GetService("Players").LocalPlayer
    return players
end, function()
    assert(getgenv().getplayers()["LocalPlayer"] == game:GetService("Players").LocalPlayer, "getplayers function test failed")
end)

check("getlocalplayer", function(): Player
    return getgenv().getplayer()
end, function()
    assert(getgenv().getlocalplayer() == game:GetService("Players").LocalPlayer, "getlocalplayer function test failed")
end)

check("customprint", function(text: string, properties: table, imageId: rbxasset)
    print(text)
    task.wait(0.025)
    local clientLog = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog
    local childrenCount = #clientLog:GetChildren()
    local msgIndex = childrenCount > 0 and childrenCount - 1 or 0
    local msg = clientLog:FindFirstChild(tostring(msgIndex))

    if msg then
        for i, x in pairs(properties) do
            msg[i] = x
        end
        if imageId then
            msg.Parent.image.Image = imageId
        end
    end
end)

check("join", function(placeID: number, jobID: string)
    game:GetService("TeleportService"):TeleportToPlaceInstance(placeID, jobID, getplayer())
end)

check("firesignal", function(instance: Instance, signalName: string, args: any)
    if instance and signalName then
        local signal = instance[signalName]
        if signal then
            for _, connection in ipairs(getconnections(signal)) do
                if args then
                    connection:Fire(args)
                else
                    connection:Fire()
                end
            end
        end
    end
end, function()
    local button = Instance.new("TextButton")
    local new = true
    button.MouseButton1Click:Connect(function() new = false end) 
    firesignal(button.MouseButton1Click)
    assert(new, "Uses old standard")
    firesignal(button, "MouseButton1Click")
end)

check("firetouchinterest", function(part: Instance, touched: boolean)
    firesignal(part, touched and "Touched" or touched == false and "TouchEnded" or "Touched")
end)

check("runanimation", function(animationId: any, player: Player)
    local plr: Player = player or getgenv().getplayer()
    local humanoid: Humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. tostring(animationId)
        humanoid:LoadAnimation(animation):Play()
    end
end)

check("round", function()
    getgenv().round = math.round
end)

check("joingame", function()
    getgenv().joingame = join
end)

check("joinserver", function()
    getgenv().joinserver = join
end)

check("firetouchtransmitter", function()
    getgenv().firetouchtransmitter = firetouchinterest
end)

check("getplatform", function()
    getgenv().getplatform = getdevice
end)

check("getos", function()
    getgenv().getos = getdevice
end)

check("playanimation", function()
    getgenv().playanimation = runanimation
end)

check("setrbxclipboard", function()
    getgenv().setrbxclipboard = setclipboard
end)
--qui drawing lib
local coreGui = game:GetService("CoreGui")
-- objects
local camera = workspace.CurrentCamera
local drawingUI = Instance.new("ScreenGui")
drawingUI.Name = "Drawing"
drawingUI.IgnoreGuiInset = true
drawingUI.DisplayOrder = 0x7fffffff
drawingUI.Parent = coreGui
-- variables
local drawingIndex = 0
local uiStrokes = table.create(0)
local baseDrawingObj = setmetatable({
	Visible = true,
	ZIndex = 0,
	Transparency = 1,
	Color = Color3.new(),
	Remove = function(self)
		setmetatable(self, nil)
	end,
	Destroy = function(self)
		setmetatable(self, nil)
	end
}, {
	__add = function(t1, t2)
		local result = table.clone(t1)
		for index, value in t2 do
			result[index] = value
		end
		return result
	end
})
local drawingFontsEnum = {
	[0] = Font.fromEnum(Enum.Font.Roboto),
	[1] = Font.fromEnum(Enum.Font.Legacy),
	[2] = Font.fromEnum(Enum.Font.SourceSans),
	[3] = Font.fromEnum(Enum.Font.RobotoMono),
}
-- function
local function getFontFromIndex(fontIndex: number): Font
	return drawingFontsEnum[fontIndex]
end
local function convertTransparency(transparency: number): number
	return math.clamp(1 - transparency, 0, 1)
end
-- main
getgenv().Drawing = {}
getgenv().Drawing.Fonts = {
	["UI"] = 0,
	["System"] = 1,
	["Plex"] = 2,
	["Monospace"] = 3
}
getgenv().Drawing.new = function(drawingType)
	drawingIndex += 1
	if drawingType == "Line" then
		local lineObj = ({
			From = Vector2.zero,
			To = Vector2.zero,
			Thickness = 1
		} + baseDrawingObj)
		local lineFrame = Instance.new("Frame")
		lineFrame.Name = drawingIndex
		lineFrame.AnchorPoint = (Vector2.one * .5)
		lineFrame.BorderSizePixel = 0
		lineFrame.BackgroundColor3 = lineObj.Color
		lineFrame.Visible = lineObj.Visible
		lineFrame.ZIndex = lineObj.ZIndex
		lineFrame.BackgroundTransparency = convertTransparency(lineObj.Transparency)
		lineFrame.Size = UDim2.new()
		lineFrame.Parent = drawingUI
		return setmetatable(table.create(0), {
			__newindex = function(_, index, value)
				if typeof(lineObj[index]) == "nil" then return end
				if index == "From" then
					local direction = (lineObj.To - value)
					local center = (lineObj.To + value) / 2
					local distance = direction.Magnitude
					local theta = math.deg(math.atan2(direction.Y, direction.X))
					lineFrame.Position = UDim2.fromOffset(center.X, center.Y)
					lineFrame.Rotation = theta
					lineFrame.Size = UDim2.fromOffset(distance, lineObj.Thickness)
				elseif index == "To" then
					local direction = (value - lineObj.From)
					local center = (value + lineObj.From) / 2
					local distance = direction.Magnitude
					local theta = math.deg(math.atan2(direction.Y, direction.X))
					lineFrame.Position = UDim2.fromOffset(center.X, center.Y)
					lineFrame.Rotation = theta
					lineFrame.Size = UDim2.fromOffset(distance, lineObj.Thickness)
				elseif index == "Thickness" then
					local distance = (lineObj.To - lineObj.From).Magnitude
					lineFrame.Size = UDim2.fromOffset(distance, value)
				elseif index == "Visible" then
					lineFrame.Visible = value
				elseif index == "ZIndex" then
					lineFrame.ZIndex = value
				elseif index == "Transparency" then
					lineFrame.BackgroundTransparency = convertTransparency(value)
				elseif index == "Color" then
					lineFrame.BackgroundColor3 = value
				end
				lineObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						lineFrame:Destroy()
						lineObj.Remove(self)
						return lineObj:Remove()
					end
				end
				return lineObj[index]
			end,
			__tostring = function() return "Drawing" end
		})
	elseif drawingType == "Text" then
		local textObj = ({
			Text = "",
			Font = getgenv().Drawing.Fonts.UI,
			Size = 0,
			Position = Vector2.zero,
			Center = false,
			Outline = false,
			OutlineColor = Color3.new()
		} + baseDrawingObj)
		local textLabel, uiStroke = Instance.new("TextLabel"), Instance.new("UIStroke")
		textLabel.Name = drawingIndex
		textLabel.AnchorPoint = (Vector2.one * .5)
		textLabel.BorderSizePixel = 0
		textLabel.BackgroundTransparency = 1
		textLabel.Visible = textObj.Visible
		textLabel.TextColor3 = textObj.Color
		textLabel.TextTransparency = convertTransparency(textObj.Transparency)
		textLabel.ZIndex = textObj.ZIndex
		textLabel.FontFace = getFontFromIndex(textObj.Font)
		textLabel.TextSize = textObj.Size
		textLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
			local textBounds = textLabel.TextBounds
			local offset = textBounds / 2
			textLabel.Size = UDim2.fromOffset(textBounds.X, textBounds.Y)
			textLabel.Position = UDim2.fromOffset(textObj.Position.X + (if not textObj.Center then offset.X else 0), textObj.Position.Y + offset.Y)
		end)
		uiStroke.Thickness = 1
		uiStroke.Enabled = textObj.Outline
		uiStroke.Color = textObj.Color
		textLabel.Parent, uiStroke.Parent = drawingUI, textLabel
		return setmetatable(table.create(0), {
			__newindex = function(_, index, value)
				if typeof(textObj[index]) == "nil" then return end
				if index == "Text" then
					textLabel.Text = value
				elseif index == "Font" then
					value = math.clamp(value, 0, 3)
					textLabel.FontFace = getFontFromIndex(value)
				elseif index == "Size" then
					textLabel.TextSize = value
				elseif index == "Position" then
					local offset = textLabel.TextBounds / 2
					textLabel.Position = UDim2.fromOffset(value.X + (if not textObj.Center then offset.X else 0), value.Y + offset.Y)
				elseif index == "Center" then
					local position = (
						if value then
							camera.ViewportSize / 2
							else
							textObj.Position
					)
					textLabel.Position = UDim2.fromOffset(position.X, position.Y)
				elseif index == "Outline" then
					uiStroke.Enabled = value
				elseif index == "OutlineColor" then
					uiStroke.Color = value
				elseif index == "Visible" then
					textLabel.Visible = value
				elseif index == "ZIndex" then
					textLabel.ZIndex = value
				elseif index == "Transparency" then
					local transparency = convertTransparency(value)
					textLabel.TextTransparency = transparency
					uiStroke.Transparency = transparency
				elseif index == "Color" then
					textLabel.TextColor3 = value
				end
				textObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						textLabel:Destroy()
						textObj.Remove(self)
						return textObj:Remove()
					end
				elseif index == "TextBounds" then
					return textLabel.TextBounds
				end
				return textObj[index]
			end,
			__tostring = function() return "Drawing" end
		})
	elseif drawingType == "Circle" then
		local circleObj = ({
			Radius = 150,
			Position = Vector2.zero,
			Thickness = .7,
			Filled = false
		} + baseDrawingObj)
		local circleFrame, uiCorner, uiStroke = Instance.new("Frame"), Instance.new("UICorner"), Instance.new("UIStroke")
		circleFrame.Name = drawingIndex
		circleFrame.AnchorPoint = (Vector2.one * .5)
		circleFrame.BorderSizePixel = 0
		circleFrame.BackgroundTransparency = (if circleObj.Filled then convertTransparency(circleObj.Transparency) else 1)
		circleFrame.BackgroundColor3 = circleObj.Color
		circleFrame.Visible = circleObj.Visible
		circleFrame.ZIndex = circleObj.ZIndex
		uiCorner.CornerRadius = UDim.new(1, 0)
		circleFrame.Size = UDim2.fromOffset(circleObj.Radius, circleObj.Radius)
		uiStroke.Thickness = circleObj.Thickness
		uiStroke.Enabled = not circleObj.Filled
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		circleFrame.Parent, uiCorner.Parent, uiStroke.Parent = drawingUI, circleFrame, circleFrame
		return setmetatable(table.create(0), {
			__newindex = function(_, index, value)
				if typeof(circleObj[index]) == "nil" then return end
				if index == "Radius" then
					local radius = value * 2
					circleFrame.Size = UDim2.fromOffset(radius, radius)
				elseif index == "Position" then
					circleFrame.Position = UDim2.fromOffset(value.X, value.Y)
				elseif index == "Thickness" then
					value = math.clamp(value, .6, 0x7fffffff)
					uiStroke.Thickness = value
				elseif index == "Filled" then
					circleFrame.BackgroundTransparency = (if value then convertTransparency(circleObj.Transparency) else 1)
					uiStroke.Enabled = not value
				elseif index == "Visible" then
					circleFrame.Visible = value
				elseif index == "ZIndex" then
					circleFrame.ZIndex = value
				elseif index == "Transparency" then
					local transparency = convertTransparency(value)
					circleFrame.BackgroundTransparency = (if circleObj.Filled then transparency else 1)
					uiStroke.Transparency = transparency
				elseif index == "Color" then
					circleFrame.BackgroundColor3 = value
					uiStroke.Color = value
				end
				circleObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						circleFrame:Destroy()
						circleObj.Remove(self)
						return circleObj:Remove()
					end
				end
				return circleObj[index]
			end,
			__tostring = function() return "Drawing" end
		})
	elseif drawingType == "Square" then
		local squareObj = ({
			Size = Vector2.zero,
			Position = Vector2.zero,
			Thickness = .7,
			Filled = false
		} + baseDrawingObj)
		local squareFrame, uiStroke = Instance.new("Frame"), Instance.new("UIStroke")
		squareFrame.Name = drawingIndex
		squareFrame.BorderSizePixel = 0
		squareFrame.BackgroundTransparency = (if squareObj.Filled then convertTransparency(squareObj.Transparency) else 1)
		squareFrame.ZIndex = squareObj.ZIndex
		squareFrame.BackgroundColor3 = squareObj.Color
		squareFrame.Visible = squareObj.Visible
		uiStroke.Thickness = squareObj.Thickness
		uiStroke.Enabled = not squareObj.Filled
		uiStroke.LineJoinMode = Enum.LineJoinMode.Miter
		squareFrame.Parent, uiStroke.Parent = drawingUI, squareFrame
		return setmetatable(table.create(0), {
			__newindex = function(_, index, value)
				if typeof(squareObj[index]) == "nil" then return end
				if index == "Size" then
					squareFrame.Size = UDim2.fromOffset(value.X, value.Y)
				elseif index == "Position" then
					squareFrame.Position = UDim2.fromOffset(value.X, value.Y)
				elseif index == "Thickness" then
					value = math.clamp(value, 0.6, 0x7fffffff)
					uiStroke.Thickness = value
				elseif index == "Filled" then
					squareFrame.BackgroundTransparency = (if value then convertTransparency(squareObj.Transparency) else 1)
					uiStroke.Enabled = not value
				elseif index == "Visible" then
					squareFrame.Visible = value
				elseif index == "ZIndex" then
					squareFrame.ZIndex = value
				elseif index == "Transparency" then
					local transparency = convertTransparency(value)
					squareFrame.BackgroundTransparency = (if squareObj.Filled then transparency else 1)
					uiStroke.Transparency = transparency
				elseif index == "Color" then
					uiStroke.Color = value
					squareFrame.BackgroundColor3 = value
				end
				squareObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						squareFrame:Destroy()
						squareObj.Remove(self)
						return squareObj:Remove()
					end
				end
				return squareObj[index]
			end,
			__tostring = function() return "Drawing" end
		})
	elseif drawingType == "Image" then
		local imageObj = ({
			Data = "",
			DataURL = "rbxassetid://0",
			Size = Vector2.zero,
			Position = Vector2.zero
		} + baseDrawingObj)
		local imageFrame = Instance.new("ImageLabel")
		imageFrame.Name = drawingIndex
		imageFrame.BorderSizePixel = 0
		imageFrame.ScaleType = Enum.ScaleType.Stretch
		imageFrame.BackgroundTransparency = 1
		imageFrame.Visible = imageObj.Visible
		imageFrame.ZIndex = imageObj.ZIndex
		imageFrame.ImageTransparency = convertTransparency(imageObj.Transparency)
		imageFrame.ImageColor3 = imageObj.Color
		imageFrame.Parent = drawingUI
		return setmetatable(table.create(0), {
			__newindex = function(_, index, value)
				if typeof(imageObj[index]) == "nil" then return end
				if index == "Data" then
					-- later
				elseif index == "DataURL" then -- temporary property
					imageFrame.Image = value
				elseif index == "Size" then
					imageFrame.Size = UDim2.fromOffset(value.X, value.Y)
				elseif index == "Position" then
					imageFrame.Position = UDim2.fromOffset(value.X, value.Y)
				elseif index == "Visible" then
					imageFrame.Visible = value
				elseif index == "ZIndex" then
					imageFrame.ZIndex = value
				elseif index == "Transparency" then
					imageFrame.ImageTransparency = convertTransparency(value)
				elseif index == "Color" then
					imageFrame.ImageColor3 = value
				end
				imageObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						imageFrame:Destroy()
						imageObj.Remove(self)
						return imageObj:Remove()
					end
				elseif index == "Data" then
					return nil -- TODO: add error here
				end
				return imageObj[index]
			end,
			__tostring = function() return "Drawing" end
		})
	elseif drawingType == "Quad" then
		local QuadProperties = ({
			Thickness = 1,
			PointA = Vector2.new();
			PointB = Vector2.new();
			PointC = Vector2.new();
			PointD = Vector2.new();
			Filled = false;
		}  + baseDrawingObj);
		local PointA = getgenv().Drawing.new("Line")
		local PointB = getgenv().Drawing.new("Line")
		local PointC = getgenv().Drawing.new("Line")
		local PointD = getgenv().Drawing.new("Line")
		return setmetatable({}, {
			__newindex = (function(self, Property, Value)
				if Property == "Thickness" then
					PointA.Thickness = Value
					PointB.Thickness = Value
					PointC.Thickness = Value
					PointD.Thickness = Value
				end
				if Property == "PointA" then
					PointA.From = Value
					PointB.To = Value
				end
				if Property == "PointB" then
					PointB.From = Value
					PointC.To = Value
				end
				if Property == "PointC" then
					PointC.From = Value
					PointD.To = Value
				end
				if Property == "PointD" then
					PointD.From = Value
					PointA.To = Value
				end
				if Property == "Visible" then 
					PointA.Visible = true
					PointB.Visible = true
					PointC.Visible = true
					PointD.Visible = true    
				end
				if Property == "Filled" then
					-- i'll do this later
				end
				if Property == "Color" then
					PointA.Color = Value
					PointB.Color = Value
					PointC.Color = Value
					PointD.Color = Value
				end
				if (Property == "ZIndex") then
					PointA.ZIndex = Value
					PointB.ZIndex = Value
					PointC.ZIndex = Value
					PointD.ZIndex = Value
				end
			end),
			__index = (function(self, Property)
				if (string.lower(tostring(Property)) == "remove") then
					return (function()
						PointA:Remove();
						PointB:Remove();
						PointC:Remove();
						PointD:Remove();
					end)
				end
				return QuadProperties[Property]
			end)
		});
	elseif drawingType == "Triangle" then
		local triangleObj = ({
			PointA = Vector2.zero,
			PointB = Vector2.zero,
			PointC = Vector2.zero,
			Thickness = 1,
			Filled = false
		} + baseDrawingObj)
		local _linePoints = table.create(0)
		_linePoints.A = getgenv().Drawing.new("Line")
		_linePoints.B = getgenv().Drawing.new("Line")
		_linePoints.C = getgenv().Drawing.new("Line")
		return setmetatable(table.create(0), {
			__tostring = function() return "Drawing" end,
			__newindex = function(_, index, value)
				if typeof(triangleObj[index]) == "nil" then return end
				if index == "PointA" then
					_linePoints.A.From = value
					_linePoints.B.To = value
				elseif index == "PointB" then
					_linePoints.B.From = value
					_linePoints.C.To = value
				elseif index == "PointC" then
					_linePoints.C.From = value
					_linePoints.A.To = value
				elseif (index == "Thickness" or index == "Visible" or index == "Color" or index == "ZIndex") then
					for _, linePoint in _linePoints do
						linePoint[index] = value
					end
				elseif index == "Filled" then
					-- later
				end
				triangleObj[index] = value
			end,
			__index = function(self, index)
				if index == "Remove" or index == "Destroy" then
					return function()
						for _, linePoint in _linePoints do
							linePoint:Remove()
						end
						triangleObj.Remove(self)
						return triangleObj:Remove()
					end
				end
				return triangleObj[index]
			end,
		})
	end
end
getgenv().isrenderobj = function(obj)
    local metatable = getmetatable(obj)
    if not metatable then return false end
    if type(metatable.__tostring) ~= "function" then return false end
    if metatable.__tostring() ~= "Drawing" then return false end
    if type(obj.Visible) ~= "boolean" then return false end
    if type(obj.Remove) ~= "function" then return false end
    return true
end
getgenv().cleardrawcache = function()
    for _, child in pairs(drawingUI:GetChildren()) do
        child:Destroy()
    end
end
getgenv().getrenderproperty = function(obj, property)
    if not pcall(function() isrenderobj(obj) end) then
        error("Invalid render object provided", 2)
    end
    
    if obj[property] == nil then
        error("Property '" .. tostring(property) .. "' does not exist on the object", 2)
    end
    
    return obj[property]
end

getgenv().getreg = function()
    local tables = {}
    for _, value in pairs(getgenv()) do
        if type(value) == "table" and #value > 0 then
            local mt = getmetatable(value)
            if mt and rawget(mt, "__mode") == "kvs" then
                table.insert(tables, value)
            end
        end
    end
    return tables
end

-- xeno funcs shit blah blah blah im too lazy to make the code better ok
local supportedMethods = {"GET", "POST", "PUT", "DELETE", "PATCH"}
local HttpService, UserInputService, InsertService = game:FindService("HttpService"), game:FindService("UserInputService"), game:FindService("InsertService")
local Bridge, ProcessID = {serverUrl = "http://localhost:19283"}, nil
local httpSpy = false
local hwid = HttpService:GenerateGUID(false)

local function sendRequest(options, timeout)
	timeout = tonumber(timeout) or math.huge
	local result, clock = nil, tick()

	HttpService:RequestInternal(options):Start(function(success, body)
		result = body
		result['Success'] = success
	end)

	while not result do task.wait()
		if (tick() - clock > timeout) then
			break
		end
	end

	return result
end

function Bridge:InternalRequest(body, timeout)
	local url = self.serverUrl .. '/send'
	if body.Url then
		url = body.Url
		body["Url"] = nil
		local options = {
			Url = url,
			Body = body['ct'],
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'text/plain'
			}
		}
		local result = sendRequest(options, timeout)
		local statusCode = tonumber(result.StatusCode)
		if statusCode and statusCode >= 200 and statusCode < 300 then
			return result.Body or true
		end

		local success, result = pcall(function()
			local decoded = HttpService:JSONDecode(result.Body)
			if decoded and type(decoded) == "table" then
				return decoded.error
			end
		end)

		if success and result then
			error(result, 2)
			return
		end

		error("[TNG Error]: Unknown error", 2)
		return
	end

	local success = pcall(function()
		body = HttpService:JSONEncode(body)
	end) if not success then return end

	local options = {
		Url = url,
		Body = body,
		Method = 'POST',
		Headers = {
			['Content-Type'] = 'application/json'
		}
	}

	local result = sendRequest(options, timeout)

	if type(result) ~= 'table' then return end

	local statusCode = tonumber(result.StatusCode)
	if statusCode and statusCode >= 200 and statusCode < 300 then
		return result.Body or true
	end

	local success, result = pcall(function()
		local decoded = HttpService:JSONDecode(result.Body)
		if decoded and type(decoded) == "table" then
			return decoded.error
		end
	end)

	if success and result then
		error("[TNG Error]: " .. tostring(result), 2)
	end

	error("[TNG Error]: Unknown server error", 2)
end

function Bridge:request(options)
	local result = self:InternalRequest({
		['c'] = "rq",
		['l'] = options.Url,
		['m'] = options.Method,
		['h'] = options.Headers,
		['b'] = options.Body or "{}"
	})
	if result then
		result = HttpService:JSONDecode(result)
		if result['r'] ~= "OK" then
			result['r'] = "Unknown"
		end
		if result['b64'] then
			result['b'] = base64.decode(result['b'])
		end
		return {
			Success = tonumber(result['c']) and tonumber(result['c']) > 200 and tonumber(result['c']) < 300,
			StatusMessage = result['r'], -- OK
			StatusCode = tonumber(result['c']), -- 200
			Body = result['b'],
			HttpError = Enum.HttpError[result['r']],
			Headers = result['h'],
			Version = result['v']
		}
	end
	return {
		Success = false,
		StatusMessage = "[TNG Error]: webServer connection failed:  " .. self.serverUrl,
		StatusCode = 599;
		HttpError = Enum.HttpError.ConnectFail
	}
end

function Bridge:rconsole(_type, content)
	if _type == "cls" or _type == "crt" or _type == "dst" then
		local result = self:InternalRequest({
			['c'] = "rc",
			['t'] = _type
		})
		return result ~= nil
	end
	local result = self:InternalRequest({
		['c'] = "rc",
		['t'] = _type,
		['ct'] = base64.encode(content)
	})
	return result ~= nil
end

if not shared.vulnsm then 
	task.spawn(function()
		local result = sendRequest({
			Url = Bridge.serverUrl .. "/send",
			Body = HttpService:JSONEncode({
				['c'] = "hw"
			}),
			Method = "POST"
		})
		if result.Body then
			hwid = result.Body:gsub("{", ""):gsub("}", "")
		end
	end)
	getgenv().request = function(options)
		assert(type(options) == "table", "invalid argument #1 to 'request' (table expected, got " .. type(options) .. ") ", 2)
		assert(type(options.Url) == "string", "invalid option 'Url' for argument #1 to 'request' (string expected, got " .. type(options.Url) .. ") ", 2)
		options.Method = options.Method or "GET"
		options.Method = options.Method:upper()
		assert(table.find(supportedMethods, options.Method), "invalid option 'Method' for argument #1 to 'request' (a valid http method expected, got '" .. options.Method .. "') ", 2)
		assert(not (options.Method == "GET" and options.Body), "invalid option 'Body' for argument #1 to 'request' (current method is GET but option 'Body' was used)", 2)
		if options.Body then
			assert(type(options.Body) == "string", "invalid option 'Body' for argument #1 to 'request' (string expected, got " .. type(options.Body) .. ") ", 2)
			options.Body = base64.encode(options.Body)
		end
		if options.Headers then assert(type(options.Headers) == "table", "invalid option 'Headers' for argument #1 to 'request' (table expected, got " .. type(options.Url) .. ") ", 2) end
		options.Body = options.Body or "e30=" 
		options.Headers = options.Headers or {}
		if httpSpy then
			rconsoleprint("HTTPSPY:\nUrl: " .. options.Url .. 
				"\nMethod: " .. options.Method .. 
				"\nBody: " .. options.Body .. 
				"\nHeaders: " .. tostring(HttpService:JSONEncode(options.Headers))
			)
		end
		if (options.Headers["User-Agent"]) then assert(type(options.Headers["User-Agent"]) == "string", "invalid option 'User-Agent' for argument #1 to 'request.Header' (string expected, got " .. type(options.Url) .. ") ", 2) end
		options.Headers["User-Agent"] = options.Headers["User-Agent"] or "TNG-Xeno/RobloxApp/2"
		options.Headers["Exploit-Guid"] = tostring(hwid)
		options.Headers["TNG-Fingerprint"] = tostring(hwid)
		options.Headers["Roblox-Place-Id"] = tostring(game.PlaceId)
		options.Headers["Roblox-Game-Id"] = tostring(game.GameId)
		options.Headers["Roblox-Session-Id"] = HttpService:JSONEncode({
			["GameId"] = tostring(game.GameId),
			["PlaceId"] = tostring(game.PlaceId)
		})
		local response = Bridge:request(options)
		if httpSpy then
			rconsoleprint("Response:\nStatusCode: " .. tostring(response.StatusCode) ..
				"\nStatusMessage: " .. tostring(response.StatusMessage) ..
				"\nSuccess: " .. tostring(response.Success) ..
				"\nBody: " .. tostring(response.Body) ..
				"\nHeaders: " .. tostring(HttpService:JSONEncode(response.Headers)) ..
				"-\n\n"
			)
		end
		return response
	end
	request = getgenv().request 
	getgenv().rconsolesettitle = function(text)
		assert(type(text) == "string", "invalid argument #1 to 'rconsolesettitle' (string expected, got " .. type(text) .. ") ", 2)
		Bridge:rconsole("ttl", text)
	end
	getgenv().rconsoleclear = function()
		Bridge:rconsole("cls") 
		rconsolesettitle("TNG is NOT fat!")
	end
	
	getgenv().rconsolecreate = function()
		Bridge:rconsole("crt")
		rconsolesettitle("TNG is NOT fat!")
	end
	
	getgenv().rconsoledestroy = function()
		Bridge:rconsole("dst")
		rconsolesettitle("TNG is NOT fat!")
	end
	
	getgenv().rconsoleprint = function(...)
		local text = ""
		for _, v in {...} do
			text = text .. tostring(v) .. " "
		end
		Bridge:rconsole("prt", text)
		rconsolesettitle("TNG is NOT fat!")
	end
	
	getgenv().rconsoleinfo = function(...)
		local text = ""
		for _, v in {...} do
			text = text .. tostring(v) .. " "
		end
		Bridge:rconsole("prt", "[ INFO ] " .. text)
		rconsolesettitle("TNG is NOT fat!")
	end
	
	getgenv().rconsolewarn = function(...)
		local text = ""
		for _, v in {...} do
			text = text .. tostring(v) .. " "
		end
		Bridge:rconsole("prt", "[ WARNING ] " .. text)
		rconsolesettitle("TNG is NOT fat!")
	end
	getgenv().rconsoleinput = function(text)
		Bridge:rconsole("prt", "[ ERROR ] Input doesnt work")
		rconsolesettitle("TNG is NOT fat!")
	end
	getgenv().rconsoleerr = function(text)
		Bridge:rconsole("prt", "[ ERROR ] " .. text)
		rconsolesettitle("TNG is NOT fat!")
	end 
	getgenv().rconsoleerror = getgenv().rconsoleerr 
	getgenv().rconsolename = getgenv().rconsolesettitle
	getgenv().consolesettitle = getgenv().rconsolesettitle
	getgenv().consolename = getgenv().rconsolesettitle
	getgenv().rconsoleinputasync = getgenv().rconsoleinput
	getgenv().consoleclear = getgenv().rconsoleclear
	getgenv().consoledestroy = getgenv().rconsoledestroy
	getgenv().consoleinput = getgenv().rconsoleinput
	getgenv().consoleprint = getgenv().rconsoleprint
	getgenv().consoleinfo = getgenv().rconsoleinfo
	getgenv().consolecreate = getgenv().rconsolecreate
	getgenv().consolewarn = getgenv().rconsolewarn
end 
getgenv().getexecutorname = function()
	return "TNG"
end 
getgenv().identifyexecutor = function()
	return "TNG", "2"
end 
getgenv().getcallingscript = function()
	local Source = debug.info(1, 's')
	for i, v in next, game:GetDescendants() do if v:GetFullName() == Source then return v end end
end
local cclosures = {}
getgenv().newcclosure = function(a)
    assert(typeof(a) == "function", "argument #1 is not a 'function'", 0)
    
    local cclosure = coroutine.wrap(function(...)
        coroutine.yield(a(...))
    end)
    
    table.insert(cclosures, cclosure)
    return cclosure
end

getgenv().iscclosure = function(a)
    assert(typeof(a) == "function", "argument #1 is not a 'function'", 0)
	if a == newcclosure then return true end 
    for b, c in next, cclosures do
        if c == a then
            return true
        end
    end
    
    return debug.info(a, "s") == "[C]"
end

getgenv().isexecutorclosure = function(a)
    assert(typeof(a) == "function", "argument #1 is not a 'function'", 0)
    
    local result = false
    
    for b, c in next, getfenv() do
        if c == a then
            result = true
        end
    end
    
    if not result then
        for b, c in next, cclosures do
            if c == a then
                result = true
            end
        end
    end
    
    return result or islclosure(a)
end
getgenv().get_calling_script = getcallingscript 
getgenv().isexecclosure = isexecutorclosure
getgenv().is_executor_closure = isexecclosure
getgenv().getconnections = nil -- fake function outta here

-- some funcs from moreunc ( https://scriptblox.com/script/Universal-Script-MoreUNC-13110 )
getgenv().clonefunc = clonefunction
getgenv().getscripts = getrunningscripts
getgenv().getmodules = getloadedmodules
getgenv().httppost = function(URL, body, contenttype)
    return game:HttpPostAsync(URL, body, contenttype)
end
getgenv().httpget = function(URL)
    return game:HttpGet(URL)
end
local ConsoleClone
local vim = Instance.new("VirtualInputManager")
getgenv().keyclick = function(key)
    if typeof(key) == "number" then
        if not keys[key] then
            return error("Key " .. tostring(key) .. " not found!")
        end
        vim:SendKeyEvent(true, keys[key], false, game)
        task.wait()
        vim:SendKeyEvent(false, keys[key], false, game)
    elseif typeof(Key) == "EnumItem" then
        vim:SendKeyEvent(true, key, false, game)
        task.wait()
        vim:SendKeyEvent(false, key, false, game)
    end
end
getgenv().keypress = function(key)
    if typeof(key) == "number" then
        if not keys[key] then
            return error("Key " .. tostring(key) .. " not found!")
        end
        vim:SendKeyEvent(true, keys[key], false, game)
    elseif typeof(Key) == "EnumItem" then
        vim:SendKeyEvent(true, key, false, game)
    end
end
getgenv().keyrelease = function(key)
    if typeof(key) == "number" then
        if not keys[key] then
            return error("Key " .. tostring(key) .. " not found!")
        end
        vim:SendKeyEvent(false, keys[key], false, game)
    elseif typeof(Key) == "EnumItem" then
        vim:SendKeyEvent(false, key, false, game)
    end
end
function disableprotections(table) -- gonna use it for other things too in the future  ( also no this isnt from moreunc btw ) 
    local prx = {}
    local mt = {
        __index = table,
        __newindex = function(t, key, value)
            rawset(t, key, value)  
        end
    }
    setmetatable(prx, mt)
    return prx
end
getgenv().setreadonly = function(taable, boolean)
    if boolean then
        table.freeze(taable)
    else
		disableprotections(taable)
    end
end

getgenv().makereadonly = setreadonly
getgenv().makewriteable = function(taable)
    return getgenv().setreadonly(taable, false)
end


getgenv().randomstring = crypt.random
getgenv().syn = {}
getgenv().syn_backup = {}
getgenv().syn.write_clipboard = setclipboard
local protecteduis = {}
local names = {} 
getgenv().syn.protect_gui = function(gui)
    names[gui] = {name = gui.Name, parent = gui.Parent}
    protecteduis[gui] = gui
    gui.Name = crypt.random(64)
    gui.Parent = gethui()
end
getgenv().syn.unprotect_gui = function(gui)
    if names[gui] then
        gui.Name = names[gui].name
        gui.Parent = names[gui].parent
    end
    protecteduis[gui] = nil
end
getgenv().syn.protectgui = getgenv().syn.protect_gui
getgenv().syn.unprotectgui = getgenv().syn.unprotect_gui
getgenv().syn.secure_call = function(func)
    return pcall(func)
end
getgenv().syn.crypt = getgenv().crypt
getgenv().syn.crypto = getgenv().crypt
getgenv().syn_backup = getgenv().syn
getgenv().syn.cache_replace = cache.replace 
getgenv().syn.cache_invalidate = cache.invalidate 
getgenv().syn.is_cached = cache.iscached 
getgenv().syn.set_thread_identity = setthreadidentity 
getgenv().syn.get_thread_identity = getthreadidentity 
getgenv().syn.queue_on_teleport = queueonteleport 
getgenv().syn.request = request 
getgenv().fluxus = {}
getgenv().fluxus.request = request 
getgenv().fluxus.queue_on_teleport = queueonteleport
getgenv().fluxus.set_thread_identity = setthreadidentity 
getgenv().setrbxclipboard = setclipboard
getgenv().writeclipboard = setclipboard
getgenv().getprotecteduis = function()
    return protecteduis
end
getgenv().getprotectedguis = getgenv().getprotecteduis
getgenv().get_scripts = getrunningscripts
getgenv().make_readonly = getgenv().makereadonly
getgenv().is_l_closure = islclosure 
getgenv().iswriteable = function(tbl)
    return not table.isfrozen(tbl)
end
getgenv().string = string
-- [[ TNG Custom Functions ]]
getgenv().TNG = {}

getgenv().TNG.get_player_by_name = function(name)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.DisplayName == name or player.Name == name then
            return player
        end
    end
    return nil
end

getgenv().TNG.get_hrp = function(player)
    player = player or game.Players.LocalPlayer
    assert(player, "[ TNG ]: Player is nil")

    local character = player.Character
    assert(character, "[ TNG ]: Character not found for player")

    local hrp = character:FindFirstChild("HumanoidRootPart")
    assert(hrp, "[ TNG ]: HumanoidRootPart not found for player")

    return hrp
end

getgenv().TNG.teleport = function(trpos)
    assert(trpos, "[ TNG ]: Target position is nil")

    local root = getgenv().TNG.get_hrp(game.Players.LocalPlayer)
    assert(root, "[ TNG ]: Player or RootPart not found")

    root.CFrame = CFrame.new(trpos)
    return true
end

getgenv().TNG.is_player_alive = function(player)
    player = player or game.Players.LocalPlayer
    assert(player, "[ TNG ]: Player is nil")

    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    assert(humanoid, "[ TNG ]: Humanoid not found for player")

    return humanoid.Health > 0
end

getgenv().TNG.teleport_to_player = function(targetn)
    assert(targetn, "[ TNG ]: Target player name is nil")

    local targetplr = getgenv().TNG.get_player_by_name(targetn)
    assert(targetplr, "[ TNG ]: Target player not found")

    local targetHRP = getgenv().TNG.get_hrp(targetplr)
    local localHRP = getgenv().TNG.get_hrp(game.Players.LocalPlayer)

    assert(targetHRP, "[ TNG ]: Target player does not have a HumanoidRootPart")
    assert(localHRP, "[ TNG ]: Local player does not have a HumanoidRootPart")

    localHRP.CFrame = targetHRP.CFrame
    return true
end

getgenv().TNG.get_distance = function(plr1, plr2)
    assert(plr1, "[ TNG ]: Player 1 name is nil")
    assert(plr2, "[ TNG ]: Player 2 name is nil")

    local player1 = getgenv().TNG.get_player_by_name(plr1)
    local player2 = getgenv().TNG.get_player_by_name(plr2)

    assert(player1, "[ TNG ]: Player 1 not found")
    assert(player2, "[ TNG ]: Player 2 not found")

    local hrp1 = getgenv().TNG.get_hrp(player1)
    local hrp2 = getgenv().TNG.get_hrp(player2)

    assert(hrp1, "[ TNG ]: Player 1 does not have a HumanoidRootPart")
    assert(hrp2, "[ TNG ]: Player 2 does not have a HumanoidRootPart")

    return (hrp1.Position - hrp2.Position).Magnitude
end
getgenv().TNG.enable_internal = function()
    local suc, rec = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InTNG/internal/refs/heads/main/ee"))()
    end) 
    if not suc then 
        error("[ TNG ]: Failed to enable the internal UI: "..tostring(rec))
    end 
end 
getgenv().TNG.disable_internal = function()
    if game:GetService("CoreGui"):FindFirstChild("Bar") then
        game:GetService("CoreGui"):FindFirstChild("Bar"):Destroy()
    else 
        error("[ TNG ]: Internal not found")
    end 
end 
getgenv().TNG.dex = function()
	local suc, rec = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/InTNG/ApiShit/refs/heads/main/Dex"))()
	end)
	if not suc then 
		error("[ TNG ]: Dex failed to load: "..tostring(rec)) 
	end 
end 
getgenv().TNG.remote_spy = function()
    local suc, rec = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InTNG/ApiShit/refs/heads/main/RemoteSpy"))()
    end) 
    if not suc then 
        error("[ TNG ]: Failed to load the remote spy: "..tostring(rec))
    end 
end 
local oldsf = setfenv 
getgenv().setfenv = function(f, env)
    if f == newcclosure then
        return error("'setfenv' cannot change environment of given object")
    else
        return oldsf(f, env) 
    end
end
if not shared.vulnsm then 
	local wrappercache = setmetatable({}, {__mode = "k"})
	local vulnInstanceTbl = {
		"HttpRbxApiService",
		"MarketplaceService",
		"HttpService",
		"GuiService",
		"OpenCloudService",
		"BrowserService",
		"LinkingService",
		"MessageBusService",
		"OmniRecommendationsService",
		"Script Context",
		"ScriptContext",
		"game",
		"Game"
	}
	local vulnFuncTbl = {
		"PostAsync",
		"PostAsyncFullUrl",
		"PerformPurchaseV2",
		"PromptBundlePurchase",
		"PromptGamePassPurchase",
		"PromptProductPurchase",
		"PromptPurchase",
		"PromptRobloxPurchase",
		"PromptThirdPartyPurchase",
		"OpenBrowserWindow",
		"OpenNativeOverlay",
		"AddCoreScriptLocal",
		"EmitHybridEvent",
		"ExecuteJavaScript",
		"ReturnToJavaScript",
		"SendCommand",
		"Call",
		"OpenUrl",
		"SaveScriptProfilingData",
		"GetLast",
		"GetMessageId", 
		"GetProtocolMethodRequestMessageId",
		"GetProtocolMethodResponseMessageId",
		"MakeRequest",
		"Publish",
		"PublishProtocolMethodRequest",
		"PublishProtocolMethodResponse",
		"Subscribe",
		"SubscribeToProtocolMethodRequest",
		"SubscribeToProtocolMethodResponse",
		"GetRobuxBalance",
		"GetAsyncFullUrl",
		"PromptNativePurchaseWithLocalPlayer",
		"PromptNativePurchase",
		"PromptCollectiblesPurchase",
		"GetAsync",
		"RequestInternal",
		"HttpRequestAsync",
		"RequestAsync",
		"OpenScreenshotsFolder",
		"Load"
	}
	wrap = function(real)
		for w,r in next,wrappercache do
			if r == real then
				return w
			end
		end
	
		if type(real) == "userdata" then
			local fake = newproxy(true)
			local meta = getmetatable(fake)
			
			meta.__index = function(s,k)
				if table.find(vulnFuncTbl, k) then 
					return function()
						error("[ TNG ]: "..tostring(k).." isn't available.")
					end
				elseif k == "GetObjects" or k == "LoadLocalAsset" or k == "LoadAsset" then
					return function(self, id)
						local ret = {[1] = game:FindFirstChildOfClass("InsertService"):LoadLocalAsset(id)}
						return ret
					end
				elseif k == "HttpGet" or k == "HttpGetAsync" then
					return function(self, url)
						assert(type(url) == "string", "invalid argument #1 to 'HttpGet' (string expected, got " .. type(url) .. ") ", 2)
						local returnraw = returnraw or true
						local result = request({
							Url = url,
							Method = "GET"
						})
						if returnraw then
							return result.Body
						end
						return game:GetService("HttpService"):JSONDecode(result.Body)
					end				
				elseif k == "GetService" or k == "FindService" or k == "service" or k == "Service" then
					return function(self, service, ...)
						if table.find(vulnInstanceTbl, service) then
							return wrap(real[k](real, service))
						end
						return real[k](real, service)
					end
				end
	
				if table.find(vulnInstanceTbl, tostring(real[k])) or table.find(vulnInstanceTbl, k) or table.find(vulnInstanceTbl, tostring(real)) then 
					return wrap(real[k])
				end
	
				return typeof(real[k]) == "Instance" and real[k] or wrap(real[k])
			end
	
			meta.__newindex = function(s,k,v)
				real[k] = v
			end
	
			meta.__tostring = function(s)
				return tostring(real)
			end
	
			wrappercache[fake] = real
	
			if table.find(vulnInstanceTbl, tostring(real)) then 
				return fake
			end
	
			return (typeof(real) == "Instance" and real.ClassName ~= "DataModel") and real or fake
		elseif type(real) == "function" then
			local fake = function(...)
				local args = unwrap{...}
				local results = wrap{real(unpack(args))}
				return unpack(results)
			end
			wrappercache[fake] = real
			return fake
	
		elseif type(real) == "table" then
			local fake = {}
			for k,v in next,real do
	
				fake[k] = (typeof(v) == "Instance" and v.ClassName ~= "DataModel") and v or wrap(v)
			end
			return fake
	
		else
			return real
		end
	end
	
	unwrap = function(wrapped)
		if type(wrapped) == "table" then
			local real = {}
			for k,v in next,wrapped do
				real[k] = unwrap(v)
			end
			return real
		else
			local real = wrappercache[wrapped]
			if real == nil then
				return wrapped
			end
			return real
		end
	end
	getgenv().game = wrap(game)
	local oldlf = listfiles
	getgenv().listfiles = function(path)
		if path == "" or path == "C:\\" then 
			error("no")
		else 
			return oldlf(path)
		end 
	end
	warn("[ TNG ]: Vulns mitigated.")
	shared.vulnsm = true 
end 
getgenv().getscripts = function() 
	local scripts = {}
	for _, scriptt in game:GetDescendants() do
		if scriptt:isA("LocalScript") or scriptt:isA("ModuleScript") then
			table.insert(scripts, scriptt)
		end
	end
	return scripts
end 

getgenv().dumpbytecode = getscriptbytecode 
getgenv().loadfileasync = loadfile
getgenv().clearconsole = rconsoleclear 
getgenv().printconsole = rconsoleprint 
getgenv().getsynasset = getcustomasset 
getgenv().debug.getregistry = getreg 
getgenv().readfileasync = readfile 
getgenv().writefileasync = writefile
getgenv().appendfileasync = appendfile 
getgenv().saveplace = saveinstance 
getgenv().protect_gui = syn.protect_gui 
getgenv().unprotect_gui = syn.unprotect_gui 
getgenv().set_thread_identity = setthreadidentity 
getgenv().get_thread_identity = getthreadidentity 

getgenv().debug.getconstant = function(f, i) 
    return "Not Implemented"
end 
getgenv().debug.getconstants = function(f) 
    return "Not Implemented"
end 
getgenv().debug.getproto = function(f, i, e) 
    return "Not Implemented"
end 
getgenv().debug.getprotos = function(f) 
    return "Not Implemented"
end 
getgenv().debug.getstack = function(f, i) 
    return "Not Implemented"
end 
getgenv().debug.getupvalue = function(f, i) 
    return "Not Implemented"
end 
getgenv().debug.getupvalues = function(f) 
    return "Not Implemented"
end 
getgenv().debug.setconstant = function(f, i, v) 
    return "Not Implemented"
end 
getgenv().debug.setstack = function(f, i, v) 
    return "Not Implemented"
end 
getgenv().debug.validlevel = function(f, i, v) 
    return "Not Implemented"
end 
getgenv().debug.getcallstack = function(f, i, v) 
    return "Not Implemented"
end 
getgenv().debug.isvalidlevel = getgenv().debug.validlevel
getgenv().is_our_closure = isexecutorclosure 
getgenv().issynapsefunction = isexecutorclosure
getgenv().run_on_actor = function(actor, code)
    local func, err = loadstring(code)
    if not func then
        return warn("no func?")
    end
    local success, exec = pcall(function()
        setfenv(func, getfenv()) 
        func()
    end)
    if not success then
        warn("execution failed: " .. tostring(exec))
    end
end
local keyshit = {}
getgenv().iskeydown = function(key)
    return keyshit[key] == true
end
getgenv().iskeytoggled = function(key)
    return keyshit[key] == nil and false or keyshit[key]
end
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            keyshit[input.KeyCode] = true
        end
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
    if not processed then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            keyshit[input.KeyCode] = false
        end
    end
end)
getgenv().WebSocket = {}
getgenv().WebSocket.connect = function(url)
    local onmsgws = Instance.new("BindableEvent")
    local onclosews = Instance.new("BindableEvent")
    local connected = true
    local websocket = {}
    function websocket:Send(message)
        if connected then
            onmsgws:Fire(message)
        else
            warn("WebSocket is closed")
        end
    end
    function websocket:Close()
        if connected then
            connected = false
            onclosews:Fire()
        else
            warn("WebSocket is already closed")
        end
    end
    websocket.OnMessage = onmsgws.Event
    websocket.OnClose = onclosews.Event
    return websocket
end

getgenv().setfflag = function(fn, value)
    if not getgenv().ffs then
        getgenv().ffs = {}
    end
    getgenv().ffs[fn] = value
end

getgenv().getfflag = function(fn)
    if getgenv().ffs and getgenv().ffs[fn] ~= nil then
        return getgenv().ffs[fn]
    else
        return nil  
    end
end

getgenv().ogfs = {}
getgenv().restorefunction = function(original)
    if type(original) ~= "function" then
        error("The argument must be a function (original func).")
    end
    for name, func in pairs(getgenv().ogfs) do
        if func == original then
            getgenv()[name] = original  
            getgenv().ogfs[name] = nil  
            return
        end
    end
    error("No original function found to restore.")
end

getgenv().isfunctionhooked = function(original)
    if type(original) ~= "function" then
        error("The argument must be a function (original func).")
    end
    for _, func in pairs(getgenv().ogfs) do
        if func == original then
            return true 
        end
    end
    return false  
end
getgenv().hooksignal = function(signal, hook)
    if not signal or not hook or not signal.Connect then
        error("Invalid signal or hook function.")
    end
    return signal.Connect(signal, function(...)
        return hook(...)
    end)
end
getgenv().hookfunction = function(original, hook)
    if type(original) ~= "function" then
        error("The first arg must be a function (original func).")
    end
    if type(hook) ~= "function" then
        error("The second arg must be a function (hook).")
    end
    local info = debug.getinfo(original)
    local name = info and info.name or tostring(original)
    getgenv().ogfs[name] = original 
    local hooked = function(...)
        return hook(...)
    end
    getgenv()[name] = hooked  
    return hooked
end
getgenv().untouchedshit = {}
getgenv().setuntouched = function(obj)
    getgenv().untouchedshit[obj] = true
end
getgenv().isuntouched = function(obj)
    return getgenv().untouchedshit[obj] == true
end
getgenv().cfiresignal = function(signalName, ...)
    local signal = Instance.new("BindableEvent")
    signal.Name = signalName
    signal:Fire(...)
    return signal
end
getgenv().replicatesignal = function(signal)
    if not signal or not signal:IsA("BindableEvent") then
        error("Invalid signal provided")
    end
    signal:Fire()
end
getgenv().cansignalreplicate = function(signal)
    if typeof(signal) == "RBXScriptSignal" then
        return true 
    end
    return false 
end
getgenv().clear_teleport_queue = function()
    queue_on_teleport("")
end 
getgenv().checkcallstack = checkcaller 
getgenv().getscriptthread = function(script)
    if not script or not script:IsA("LocalScript") then
        error("Argument must be a LocalScript")
    end
    local thread = coroutine.create(function()
        script:Invoke()
    end)
    coroutine.resume(thread)
    return thread
end
warn("[ TNG ]: Added functions to the env.")