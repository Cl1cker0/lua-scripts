local Atlas = loadstring(game:HttpGet("https://raw.githubusercontent.com/lxyodev/123123/main/123"))()

if SILENTWARE_LOADED == true then
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Silentware", 
    Text = "This Script already running please rejoin for execute script", 

})
return
end


pcall(function() getgenv().SILENTWARE_LOADED = true end)


local UI = Atlas.new({
    Name = "My Script";
    ConfigFolder = "Silentware";
    Color = Color3.fromRGB(255,0,0);
    Bind = "";
    UseLoader = false;
    FullName = "Silentwarest";
    Discord = "https://link-target.net/554808/best-hack-fallen";
})

game:GetService("CoreGui").Atlas.Main.Visible = false





game.Players.LocalPlayer.UserId = 47983795

wait()

local namecall; namecall = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "FireServer" and self.Name == "BanExploiter" then 
        return 
    elseif method == "GetChildren" and self.Name == "Remotes" then 
        return {}
    end 

    return namecall(self,unpack(args))
end)






if (not game:IsLoaded()) then
    game.Loaded:Wait();
end

_G.u17 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0 };
_G.u18 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, 0 };
_G.u19 = {[1] = "",	[2] = "",	[3] = "",	[4] = "",	[5] = "",	[6] = "",	[7] = "",	[8] = "",	[9] = "",	[10] = "",	[11] = "",	[12] = "",	[13] = "",	[14] = "",	[15] = "",	[16] = "",	[17] = "",	[18] = "",	[19] = "",	[20] = "",	[21] = "",	[22] = "",	[23] = "",	[24] = "",	[25] = "",	[26] = "",	[27] = "",	[28] = "",	[29] = "",	[30] = "",	[31] = "", [32] = "",	[33] = "",	[34] = "",	[35] = "",	[36] = ""};

local gmt = getrawmetatable(game)
local faketable = {}
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(Self, ...)
	local Args = {...}
	local method = getnamecallmethod()
	if tostring(method) == "FireServer" or tostring(method) == "InvokeServer" then
		if tostring(Self) == "SendInfo" then
			_G.u17 = Args[1]
			_G.u18 = Args[2]
			_G.u19 = Args[3]
			_G.candupe = true
		end
	end
	return oldNamecall(Self, ...)
end)

local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-esp/main/ui.lua"))();

local PlaceId = game.PlaceId

local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local Workspace = game:GetService("Workspace");
local Teams = game:GetService("Teams")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService");

local CurrentCamera = Workspace.CurrentCamera
local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint
local GetPartsObscuringTarget = CurrentCamera.GetPartsObscuringTarget

local Inset = game:GetService("GuiService"):GetGuiInset().Y

local FindFirstChild = game.FindFirstChild
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local IsA = game.IsA
local Vector2new = Vector2.new
local Vector3new = Vector3.new
local CFramenew = CFrame.new
local Color3new = Color3.new

local Tfind = table.find
local create = table.create
local format = string.format
local floor = math.floor
local gsub = string.gsub
local sub = string.sub
local lower = string.lower
local upper = string.upper
local random = math.random

local DefaultSettings = {
    Esp = {
        NamesEnabled = true,
        DisplayNamesEnabled = false,
        DistanceEnabled = true,
        HealthEnabled = true,
        TracersEnabled = false,
        BoxEsp = false,
        TeamColors = true,
        Thickness = 1.5,
        TracerThickness = 1.6,
        Transparency = .9,
        TracerTrancparency = .7,
        Size = 16,
        RenderDistance = 9e9,
        Color = Color3.fromRGB(19, 130, 226),
        OutlineColor = Color3new(),
        TracerTo = "Head",
        BlacklistedTeams = {}
    },
    Aimbot = {
        Enabled = false,
        SilentAim = false,
        Wallbang = false,
        ShowFov = false,
        Snaplines = true,
        ThirdPerson = false,
        FirstPerson = false,
        ClosestCharacter = false,
        ClosestCursor = true,
        Smoothness = 1,
        SilentAimHitChance = 100,
        FovThickness = 1,
        FovTransparency = 1,
        FovSize = 150,
        FovColor = Color3new(1, 1, 1),
        Aimlock = "Head",
        SilentAimRedirect = "Head",
        BlacklistedTeams = {}
    },
    WindowPosition = UDim2.new(0.5, -200, 0.5, -139);

    Version = 1.2
}

local EncodeConfig, DecodeConfig;
do
    local deepsearchset;
    deepsearchset = function(tbl, ret, value)
        if (type(tbl) == 'table') then
            local new = {}
            for i, v in next, tbl do
                new[i] = v
                if (type(v) == 'table') then
                    new[i] = deepsearchset(v, ret, value);
                end
                if (ret(i, v)) then
                    new[i] = value(i, v);
                end
            end
            return new
        end
    end

    DecodeConfig = function(Config)
        local DecodedConfig = deepsearchset(Config, function(Index, Value)
            return type(Value) == "table" and (Value.HSVColor or Value.Position);
        end, function(Index, Value)
            local Color = Value.HSVColor
            local Position = Value.Position
            if (Color) then
                return Color3.fromHSV(Color.H, Color.S, Color.V);
            end
            if (Position and Position.Y and Position.X) then
                return UDim2.new(UDim.new(Position.X.Scale, Position.X.Offset), UDim.new(Position.Y.Scale, Position.Y.Offset));
            else
                return DefaultSettings.WindowPosition;
            end
        end);
        return DecodedConfig
    end

    EncodeConfig = function(Config)
        local ToHSV = Color3new().ToHSV
        local EncodedConfig = deepsearchset(Config, function(Index, Value)
            return typeof(Value) == "Color3" or typeof(Value) == "UDim2"
        end, function(Index, Value)
            local Color = typeof(Value) == "Color3"
            local Position = typeof(Value) == "UDim2"
            if (Color) then
                local H, S, V = ToHSV(Value);
                return { HSVColor = { H = H, S = S, V = V } };
            end
            if (Position) then
                return { Position = {
                    X = { Scale = Value.X.Scale, Offset = Value.X.Offset };
                    Y = { Scale = Value.Y.Scale, Offset = Value.Y.Offset }
                } };
            end
        end)
        return EncodedConfig
    end
end

local GetConfig = function()
    local read, data = pcall(readfile, "fates-esp.json");
    local canDecode, config = pcall(HttpService.JSONDecode, HttpService, data);
    if (read and canDecode) then
        local Decoded = DecodeConfig(config);
        if (Decoded.Version ~= DefaultSettings.Version) then
            local Encoded = HttpService:JSONEncode(EncodeConfig(DefaultSettings));
            writefile("fates-esp.json", Encoded);
            return DefaultSettings;
        end
        return Decoded;
    else
        local Encoded = HttpService:JSONEncode(EncodeConfig(DefaultSettings));
        writefile("fates-esp.json", Encoded);
        return DefaultSettings
    end
end

local Settings = GetConfig();

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse();
local MouseVector = Vector2new(Mouse.X, Mouse.Y);
local Characters = {}

local CustomGet = {
    [0] = function()
        return {}
    end
}

local Get;
if (CustomGet[PlaceId]) then
    Get = CustomGet[PlaceId]();
end

local GetCharacter = function(Player)
    if (Get) then
        return Get.GetCharacter(Player);
    end
    return Player.Character
end
local CharacterAdded = function(Player, Callback)
    if (Get) then
        return
    end
    Player.CharacterAdded:Connect(Callback);
end
local CharacterRemoving = function(Player, Callback)
    if (Get) then
        return
    end
    Player.CharacterRemoving:Connect(Callback);
end

local GetTeam = function(Player)
    if (Get) then
        return Get.GetTeam(Player);
    end
    return Player.Team
end

local Drawings = {}

local AimbotSettings = Settings.Aimbot
local EspSettings = Settings.Esp

local FOV = Drawing.new("Circle");
FOV.Color = AimbotSettings.FovColor
FOV.Thickness = AimbotSettings.FovThickness
FOV.Transparency = AimbotSettings.FovTransparency
FOV.Filled = false
FOV.Radius = AimbotSettings.FovSize

local Snaplines = Drawing.new("Line");
Snaplines.Color = AimbotSettings.FovColor
Snaplines.Thickness = .1
Snaplines.Transparency = 1
Snaplines.Visible = AimbotSettings.Snaplines

table.insert(Drawings, FOV);
table.insert(Drawings, Snaplines);

local HandlePlayer = function(Player)
    local Character = GetCharacter(Player);
    if (Character) then
        Characters[Player] = Character
    end
    CharacterAdded(Player, function(Char)
        Characters[Player] = Char
    end);
    CharacterRemoving(Player, function(Char)
        Characters[Player] = nil
        local PlayerDrawings = Drawings[Player]
        if (PlayerDrawings) then
            PlayerDrawings.Text.Visible = false
            PlayerDrawings.Box.Visible = false
            PlayerDrawings.Tracer.Visible = false
        end
    end);

    if (Player == LocalPlayer) then return; end

    local Text = Drawing.new("Text");
    Text.Color = EspSettings.Color
    Text.OutlineColor = EspSettings.OutlineColor
    Text.Size = EspSettings.Size
    Text.Transparency = EspSettings.Transparency
    Text.Center = true
    Text.Outline = true

    local Tracer = Drawing.new("Line");
    Tracer.Color = EspSettings.Color
    Tracer.From = Vector2new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y);
    Tracer.Thickness = EspSettings.TracerThickness
    Tracer.Transparency = EspSettings.TracerTrancparency

    local Box = Drawing.new("Quad");
    Box.Thickness = EspSettings.Thickness
    Box.Transparency = EspSettings.Transparency
    Box.Filled = false
    Box.Color = EspSettings.Color

    Drawings[Player] = { Text = Text, Tracer = Tracer, Box = Box }
end

for Index, Player in pairs(Players:GetPlayers()) do
    HandlePlayer(Player);
end
Players.PlayerAdded:Connect(function(Player)
    HandlePlayer(Player);
end);

Players.PlayerRemoving:Connect(function(Player)
    Characters[Player] = nil
    local PlayerDrawings = Drawings[Player]
    for Index, Drawing in pairs(PlayerDrawings or {}) do
        Drawing.Visible = false
    end
    Drawings[Player] = nil
end);

local SetProperties = function(Properties)
    for Player, PlayerDrawings in pairs(Drawings) do
        if (type(Player) ~= "number") then
            for Property, Value in pairs(Properties.Tracer or {}) do
                PlayerDrawings.Tracer[Property] = Value
            end
            for Property, Value in pairs(Properties.Text or {}) do
                PlayerDrawings.Text[Property] = Value
            end
            for Property, Value in pairs(Properties.Box or {}) do
                PlayerDrawings.Box[Property] = Value
            end
        end
    end
end


local GetClosestPlayerAndRender = function()
    MouseVector = Vector2new(Mouse.X, Mouse.Y + Inset);
    local Closest = create(4);
    local Vector2Distance = math.huge
    local Vector3DistanceOnScreen = math.huge
    local Vector3Distance = math.huge

    if (AimbotSettings.ShowFov) then
        FOV.Position = MouseVector
        FOV.Visible = true
        Snaplines.Visible = false
    else
        FOV.Visible = false
    end

    local LocalRoot = Characters[LocalPlayer] and FindFirstChild(Characters[LocalPlayer], "HumanoidRootPart");
    for Player, Character in pairs(Characters) do
        if (Player == LocalPlayer) then continue; end
        local PlayerDrawings = Drawings[Player]
        local PlayerRoot = FindFirstChild(Character, "HumanoidRootPart");
        local PlayerTeam = GetTeam(Player);
        if (PlayerRoot) then
            local Redirect = FindFirstChild(Character, AimbotSettings.Aimlock);
            if (not Redirect) then
                PlayerDrawings.Text.Visible = false
                PlayerDrawings.Box.Visible = false
                PlayerDrawings.Tracer.Visible = false
                continue;
            end
            local RedirectPos = Redirect.Position
            local Tuple, Visible = WorldToViewportPoint(CurrentCamera, RedirectPos);
            local CharacterVec2 = Vector2new(Tuple.X, Tuple.Y);
            local Vector2Magnitude = (MouseVector - CharacterVec2).Magnitude
            local Vector3Magnitude = LocalRoot and (RedirectPos - LocalRoot.Position).Magnitude or math.huge
            local InRenderDistance = Vector3Magnitude <= EspSettings.RenderDistance

            if (not Tfind(AimbotSettings.BlacklistedTeams, PlayerTeam)) then
                local InFovRadius = Vector2Magnitude <= FOV.Radius
                if (InFovRadius) then
                    if (Visible and Vector2Magnitude <= Vector2Distance and AimbotSettings.ClosestCursor) then
                        Vector2Distance = Vector2Magnitude
                        Closest = {Character, CharacterVec2, Player, Redirect}
                        if (AimbotSettings.Snaplines and AimbotSettings.ShowFov) then
                            Snaplines.Visible = true
                            Snaplines.From = MouseVector
                            Snaplines.To = CharacterVec2
                        else
                            Snaplines.Visible = false
                        end
                    end

                    if (Visible and Vector3Magnitude <= Vector3DistanceOnScreen and Settings.ClosestPlayer) then
                        Vector3DistanceOnScreen = Vector3Magnitude
                        Closest = {Character, CharacterVec2, Player, Redirect}
                    end
                end
            end

            if (InRenderDistance and Visible and not Tfind(EspSettings.BlacklistedTeams, PlayerTeam)) then
                local CharacterHumanoid = FindFirstChildWhichIsA(Character, "Humanoid") or { Health = 0, MaxHealth = 0 };
                PlayerDrawings.Text.Text = format("%s\n%s%s",
                        EspSettings.NamesEnabled and Player.Name or "",
                        EspSettings.DistanceEnabled and format("[%s]",
                            floor(Vector3Magnitude)
                        ) or "",
                        EspSettings.HealthEnabled and format(" [%s/%s]",
                            floor(CharacterHumanoid.Health),
                            floor(CharacterHumanoid.MaxHealth)
                        )  or ""
                    );

                PlayerDrawings.Text.Position = Vector2new(Tuple.X, Tuple.Y - 40);

                if (EspSettings.TracersEnabled) then
                    PlayerDrawings.Tracer.To = CharacterVec2
                end

                if (EspSettings.BoxEsp) then
                    local Parts = {}
                    for Index, Part in pairs(Character:GetChildren()) do
                        if (IsA(Part, "BasePart")) then
                            local ViewportPos = WorldToViewportPoint(CurrentCamera, Part.Position);
                            Parts[Part] = Vector2new(ViewportPos.X, ViewportPos.Y);
                        end
                    end

                    local Top, Bottom, Left, Right
                    local Distance = math.huge
                    local ClosestPart = nil
                    for i2, Pos in next, Parts do
                        local Mag = (Pos - Vector2new(Tuple.X, 0)).Magnitude;
                        if (Mag <= Distance) then
                            ClosestPart = Pos
                            Distance = Mag
                        end
                    end
                    Top = ClosestPart
                    ClosestPart = nil
                    Distance = math.huge
                    for i2, Pos in next, Parts do
                        local Mag = (Pos - Vector2new(Tuple.X, CurrentCamera.ViewportSize.Y)).Magnitude;
                        if (Mag <= Distance) then
                            ClosestPart = Pos
                            Distance = Mag
                        end
                    end
                    Bottom = ClosestPart
                    ClosestPart = nil
                    Distance = math.huge
                    for i2, Pos in next, Parts do
                        local Mag = (Pos - Vector2new(0, Tuple.Y)).Magnitude;
                        if (Mag <= Distance) then
                            ClosestPart = Pos
                            Distance = Mag
                        end
                    end
                    Left = ClosestPart
                    ClosestPart = nil
                    Distance = math.huge
                    for i2, Pos in next, Parts do
                        local Mag = (Pos - Vector2new(CurrentCamera.ViewportSize.X, Tuple.Y)).Magnitude;
                        if (Mag <= Distance) then
                            ClosestPart = Pos
                            Distance = Mag
                        end
                    end
                    Right = ClosestPart
                    ClosestPart = nil
                    Distance = math.huge

                    PlayerDrawings.Box.PointA = Vector2new(Right.X, Top.Y);
                    PlayerDrawings.Box.PointB = Vector2new(Left.X, Top.Y);
                    PlayerDrawings.Box.PointC = Vector2new(Left.X, Bottom.Y);
                    PlayerDrawings.Box.PointD = Vector2new(Right.X, Bottom.Y);
                end

                if (EspSettings.TeamColors) then
                    local TeamColor;
                    if (PlayerTeam) then
                        local BrickTeamColor = PlayerTeam.TeamColor
                        TeamColor = BrickTeamColor.Color
                    else
                        TeamColor = Color3new(0.639216, 0.635294, 0.647059);
                    end
                    PlayerDrawings.Text.Color = TeamColor
                    PlayerDrawings.Box.Color = TeamColor
                    PlayerDrawings.Tracer.Color = TeamColor
                end

                PlayerDrawings.Text.Visible = true
                PlayerDrawings.Box.Visible = EspSettings.BoxEsp
                PlayerDrawings.Tracer.Visible = EspSettings.TracersEnabled
            else
                PlayerDrawings.Text.Visible = false
                PlayerDrawings.Box.Visible = false
                PlayerDrawings.Tracer.Visible = false
            end
        else
            PlayerDrawings.Text.Visible = false
            PlayerDrawings.Box.Visible = false
            PlayerDrawings.Tracer.Visible = false
        end
    end

    return unpack(Closest);
end

local Locked, SwitchedCamera = false, false
UserInputService.InputBegan:Connect(function(Inp)
    if (AimbotSettings.Enabled and Inp.UserInputType == Enum.UserInputType.MouseButton2) then
        Locked = true
        if (AimbotSettings.FirstPerson and LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson) then
            LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            SwitchedCamera = true
        end
    end
end);
UserInputService.InputEnded:Connect(function(Inp)
    if (AimbotSettings.Enabled and Inp.UserInputType == Enum.UserInputType.MouseButton2) then
        Locked = false
        if (SwitchedCamera) then
            LocalPlayer.CameraMode = Enum.CameraMode.Classic
        end
    end
end);

local ClosestCharacter, Vector, Player, Aimlock;
RunService.RenderStepped:Connect(function()
    ClosestCharacter, Vector, Player, Aimlock = GetClosestPlayerAndRender();
    if (Locked and AimbotSettings.Enabled and ClosestCharacter) then
        if (AimbotSettings.FirstPerson) then
            if (syn) then
                CurrentCamera.CoordinateFrame = CFramenew(CurrentCamera.CoordinateFrame.p, Aimlock.Position);
            else
                mousemoverel((Vector.X - MouseVector.X) / AimbotSettings.Smoothness, (Vector.Y - MouseVector.Y) / AimbotSettings.Smoothness);
            end
        elseif (AimbotSettings.ThirdPerson) then
            mousemoveabs(Vector.X, Vector.Y);
        end
    end
end);

local Hooks = {
    HookedFunctions = {},
    OldMetaMethods = {},
    MetaMethodHooks = {},
    HookedSignals = {}
}

local OtherDeprecated = {
    children = "GetChildren"
}

local RealMethods = {}
local FakeMethods = {}

local HookedFunctions = Hooks.HookedFunctions
local MetaMethodHooks = Hooks.MetaMethodHooks
local OldMetaMethods = Hooks.OldMetaMethods

local randomised = random(1, 10);
local randomisedVector = Vector3new(random(1, 10), random(1, 10), random(1, 10));
Mouse.Move:Connect(function()
    randomised = random(1, 10);
    randomisedVector = Vector3new(random(1, 10), random(1, 10), random(1, 10));
end);

local x = setmetatable({}, {
    __index = function(...)
        print("index", ...);
    end,
    __add = function(...)
        print("add", ...);
    end,
    __sub = function(...)
        print("sub", ...);
    end,
    __mul = function(...)
        print("mul", ...);
    end
});

MetaMethodHooks.Index = function(...)
    local __Index = OldMetaMethods.__index

    if (Player and Aimlock and ... == Mouse and not checkcaller()) then
        local CallingScript = getfenv(2).script;
        if (CallingScript.Name == "CallingScript") then
            return __Index(...);
        end

        local _Mouse, Index = ...
        if (type(Index) == 'string') then
            Index = gsub(sub(Index, 0, 100), "%z.*", "");
        end
        local PassedChance = random(1, 100) < AimbotSettings.SilentAimHitChance
        if (PassedChance and AimbotSettings.SilentAim) then
            local Parts = GetPartsObscuringTarget(CurrentCamera, {CurrentCamera.CFrame.Position, Aimlock.Position}, {LocalPlayer.Character, ClosestCharacter});

            Index = string.gsub(Index, "^%l", upper);
            local Hit = #Parts == 0 or AimbotSettings.Wallbang
            if (not Hit) then
                return __Index(...);
            end
            if (Index == "Target") then
                return Aimlock
            end
            if (Index == "Hit") then
                local hit = __Index(...);
                local pos = Aimlock.Position + randomisedVector / 10
                return CFramenew(pos.X, pos.Y, pos.Z, unpack({hit:components()}, 4));
            end
            if (Index == "X") then
                return Vector.X + randomised / 10
            end
            if (Index == "Y") then
                return Vector.Y + randomised / 10
            end
        end
    end

    return __Index(...);
end

MetaMethodHooks.Namecall = function(...)
    local __Namecall = OldMetaMethods.__namecall
    local self = ...
    local Method = gsub(getnamecallmethod() or "", "^%l", upper);
    local Hooked = HookedFunctions[Method]
    if (Hooked and self == Hooked[1]) then
        return Hooked[3](...);
    end

    return __Namecall(...);
end

for MMName, MMFunc in pairs(MetaMethodHooks) do
    local MetaMethod = string.format("__%s", string.lower(MMName));
    Hooks.OldMetaMethods[MetaMethod] = hookmetamethod(game, MetaMethod, MMFunc);
end

HookedFunctions.FindPartOnRay = {Workspace, Workspace.FindPartOnRay, function(...)
    local OldFindPartOnRay = HookedFunctions.FindPartOnRay[4]
    if (AimbotSettings.SilentAim and Player and Aimlock and not checkcaller()) then
        local PassedChance = random(1, 100) < AimbotSettings.SilentAimHitChance
        if (ClosestCharacter and PassedChance) then
            local Parts = GetPartsObscuringTarget(CurrentCamera, {CurrentCamera.CFrame.Position, Aimlock.Position}, {LocalPlayer.Character, ClosestCharacter});
            if (#Parts == 0 or AimbotSettings.Wallbang) then
                return Aimlock, Aimlock.Position + (Vector3new(random(1, 10), random(1, 10), random(1, 10)) / 10), Vector3new(0, 1, 0), Aimlock.Material
            end
        end
    end
    return OldFindPartOnRay(...);
end};

HookedFunctions.FindPartOnRayWithIgnoreList = {Workspace, Workspace.FindPartOnRayWithIgnoreList, function(...)
    local OldFindPartOnRayWithIgnoreList = HookedFunctions.FindPartOnRayWithIgnoreList[4]
    if (Player and Aimlock and not checkcaller()) then
        local CallingScript = getcallingscript();
        local PassedChance = random(1, 100) < AimbotSettings.SilentAimHitChance
        if (CallingScript.Name ~= "ControlModule" and ClosestCharacter and PassedChance) then
            local Parts = GetPartsObscuringTarget(CurrentCamera, {CurrentCamera.CFrame.Position, Aimlock.Position}, {LocalPlayer.Character, ClosestCharacter});
            if (#Parts == 0 or AimbotSettings.Wallbang) then
                return Aimlock, Aimlock.Position + (Vector3new(random(1, 10), random(1, 10), random(1, 10)) / 10), Vector3new(0, 1, 0), Aimlock.Material
            end
        end
    end
    return OldFindPartOnRayWithIgnoreList(...);
end};

for Index, Function in pairs(HookedFunctions) do
    Function[4] = hookfunction(Function[2], Function[3]);
end

local MainUI = UILibrary.new(Color3.fromRGB(255, 79, 87));
local Window = MainUI:LoadWindow('<font color="#ff4f57"></font> ', UDim2.fromOffset(400, 279));
local ESP = Window.NewPage("esp");
local Aimbot = Window.NewPage("aimbot");
local PlayerTab = Window.NewPage("Player");
local DupeTab = Window.NewPage("Dupe");
local BagDupeUI = DupeTab.NewSection("Bag Dupe");
local EspSettingsUI = ESP.NewSection("Esp");
local TracerSettingsUI = ESP.NewSection("Tracers");
local SilentAim = Aimbot.NewSection("Silent Aim");
local Aimbot = Aimbot.NewSection("Aimbot");
local RageTab = PlayerTab.NewSection("Rage");
local DupeTab = DupeTab.NewSection("Dupe");
local ServerTab = PlayerTab.NewSection("Server");




local admindetector = nil
ServerTab.Toggle("Admin Dedector", AimbotSettings.Wallbang, function(Callback)
    admindetector = Callback
end);

RageTab.Toggle("NoClip", AimbotSettings.Wallbang, function(Callback)
    if Callback then
        NoclipLoop = game:GetService("RunService").Stepped:Connect(function()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end)
    elseif Callback == false and NoclipLoop then
        NoclipLoop:Disconnect()
    end
end);

RageTab.Toggle("Fullbright", AimbotSettings.Wallbang, function(Callback)
    if not _G.FullBrightExecuted then

        _G.FullBrightEnabled = Callback

        _G.NormalLightingSettings = {
            Brightness = game:GetService("Lighting").Brightness,
            ClockTime = game:GetService("Lighting").ClockTime,
            FogEnd = game:GetService("Lighting").FogEnd,
            GlobalShadows = game:GetService("Lighting").GlobalShadows,
            Ambient = game:GetService("Lighting").Ambient
        }

        game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
            if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Brightness = 1
            end
        end)

        game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
            if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").ClockTime = 12
            end
        end)

        game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
            if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").FogEnd = 786543
            end
        end)

        game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
            if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").GlobalShadows = false
            end
        end)

        game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
            if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            end
        end)

        game:GetService("Lighting").Brightness = 1
        game:GetService("Lighting").ClockTime = 12
        game:GetService("Lighting").FogEnd = 786543
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

        local LatestValue = true
        spawn(function()
            repeat
                wait()
            until _G.FullBrightEnabled
            while wait() do
                if _G.FullBrightEnabled ~= LatestValue then
                    if not _G.FullBrightEnabled then
                        game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                        game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                        game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                        game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                        game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                    else
                        game:GetService("Lighting").Brightness = 1
                        game:GetService("Lighting").ClockTime = 12
                        game:GetService("Lighting").FogEnd = 786543
                        game:GetService("Lighting").GlobalShadows = false
                        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                    end
                    LatestValue = not LatestValue
                end
            end
        end)
    end

    _G.FullBrightExecuted = true
    _G.FullBrightEnabled = not _G.FullBrightEnabled
end);





DupeTab.Dropdown("How Dupe Work First Read", {"watch vidio on youtube ", "discord.gg/aJcMS6vPGU"},  function(Callback)

end);
DupeTab.Dropdown("Discord Server", {"Silentware ", "discord.gg/aJcMS6vPGU"},  function(Callback)

end);
EspSettingsUI.Toggle("Show Names", EspSettings.NamesEnabled, function(Callback)
    EspSettings.NamesEnabled = Callback
end);
BagDupeUI.Dropdown("Bag Dupe", {"Respawn Character", "Bag Dupe", "One Click Dupe"}, function(Callback)
    if (Callback == "Respawn Character") then
        if game.Players.LocalPlayer.Character then
        local dedspot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    game.Players.LocalPlayer.Character:BreakJoints()
    delay(0.1,function()
     game:GetService("ReplicatedStorage").Remotes.Respawn:FireServer("Respawn")
    end)
    delay(0.5,function()
    repeat
        wait()
    until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = dedspot
    end)
    end
    end
    if (Callback == "Bag Dupe") then
         if _G.candupe then
		game:GetService("ReplicatedStorage").Remotes.HandleDowning:FireServer(_G.u17, _G.u18, _G.u19)
	end
    end
    if (Callback == "One Click Dupe") then
        if game.Players.LocalPlayer.Character then
        local dedspot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        game.Players.LocalPlayer.Character:BreakJoints()
        delay(0.1,function()
         game:GetService("ReplicatedStorage").Remotes.Respawn:FireServer("Respawn")
        end)
        delay(0.5,function()
        repeat
            wait()
        until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = dedspot
        end)
        end

        wait(1)

        if _G.candupe then
            game:GetService("ReplicatedStorage").Remotes.HandleDowning:FireServer(_G.u17, _G.u18, _G.u19)
        end
    end
end);
EspSettingsUI.Toggle("Show Health", EspSettings.HealthEnabled, function(Callback)
    EspSettings.HealthEnabled = Callback
end);
EspSettingsUI.Toggle("Show Distance", EspSettings.DistanceEnabled, function(Callback)
    EspSettings.DistanceEnabled = Callback
end);
EspSettingsUI.Toggle("Box Esp", EspSettings.BoxEsp, function(Callback)
    EspSettings.BoxEsp = Callback
    SetProperties({ Box = { Visible = Callback } });
end);
EspSettingsUI.Slider("Render Distance", { Min = 0, Max = 50000, Default = math.clamp(EspSettings.RenderDistance, 0, 50000), Step = 10 }, function(Callback)
    EspSettings.RenderDistance = Callback
end);
EspSettingsUI.Slider("Esp Size", { Min = 0, Max = 30, Default = EspSettings.Size, Step = 1}, function(Callback)
    EspSettings.Size = Callback
    SetProperties({ Text = { Size = Callback } });
end);
EspSettingsUI.ColorPicker("Esp Color", EspSettings.Color, function(Callback)
    EspSettings.TeamColors = false
    EspSettings.Color = Callback
    SetProperties({ Box = { Color = Callback }, Text = { Color = Callback }, Tracer = { Color = Callback } });
end);
EspSettingsUI.Toggle("Team Colors", EspSettings.TeamColors, function(Callback)
    EspSettings.TeamColors = Callback
    if (not Callback) then
        SetProperties({ Tracer = { Color = EspSettings.Color }; Box = { Color = EspSettings.Color }; Text = { Color = EspSettings.Color }  })
    end
end);
EspSettingsUI.Dropdown("Teams", {"Allies", "Enemies", "All"}, function(Callback)
    table.clear(EspSettings.BlacklistedTeams);
    if (Callback == "Enemies") then
        table.insert(EspSettings.BlacklistedTeams, LocalPlayer.Team);
    end
    if (Callback == "Allies") then
        local AllTeams = Teams:GetTeams();
        table.remove(AllTeams, table.find(AllTeams, LocalPlayer.Team));
        EspSettings.BlacklistedTeams = AllTeams
    end
end);
TracerSettingsUI.Toggle("Enable Tracers", EspSettings.TracersEnabled, function(Callback)
    EspSettings.TracersEnabled = Callback
    SetProperties({ Tracer = { Visible = Callback } });
end);
TracerSettingsUI.Dropdown("To", {"Head", "Torso"}, function(Callback)
    AimbotSettings.Aimlock = Callback == "Torso" and "HumanoidRootPart" or Callback
end);
TracerSettingsUI.Dropdown("From", {"Top", "Bottom", "Left", "Right"}, function(Callback)
    local ViewportSize = CurrentCamera.ViewportSize
    local From = Callback == "Top" and Vector2new(ViewportSize.X / 2, ViewportSize.Y - ViewportSize.Y) or Callback == "Bottom" and Vector2new(ViewportSize.X / 2, ViewportSize.Y) or Callback == "Left" and Vector2new(ViewportSize.X - ViewportSize.X, ViewportSize.Y / 2) or Callback == "Right" and Vector2new(ViewportSize.X, ViewportSize.Y / 2);
    EspSettings.TracerFrom = From
    SetProperties({ Tracer = { From = From } });
end);
TracerSettingsUI.Slider("Tracer Transparency", {Min = 0, Max = 1, Default = EspSettings.TracerTrancparency, Step = .1}, function(Callback)
    EspSettings.TracerTrancparency = Callback
    SetProperties({ Tracer = { Transparency = Callback } });
end);
TracerSettingsUI.Slider("Tracer Thickness", {Min = 0, Max = 5, Default = EspSettings.TracerThickness, Step = .1}, function(Callback)
    EspSettings.TracerThickness = Callback
    SetProperties({ Tracer = { Thickness = Callback } });
end);

SilentAim.Toggle("Silent Aim", AimbotSettings.SilentAim, function(Callback)
    AimbotSettings.SilentAim = Callback
end);
SilentAim.Toggle("Wallbang", AimbotSettings.Wallbang, function(Callback)
    AimbotSettings.Wallbang = Callback
end);
SilentAim.Dropdown("Redirect", {"Head", "Torso"}, function(Callback)
    AimbotSettings.SilentAimRedirect = Callback
end);
SilentAim.Slider("Hit Chance", {Min = 0, Max = 100, Default = AimbotSettings.SilentAimHitChance, Step = 1}, function(Callback)
    AimbotSettings.SilentAimHitChance = Callback
end);

SilentAim.Dropdown("Lock Type", {"Closest Cursor", "Closest Player"}, function(Callback)
    if (Callback == "Closest Cursor") then
        AimbotSettings.ClosestCharacter = false
        AimbotSettings.ClosestCursor = true
    else
        AimbotSettings.ClosestCharacter = true
        AimbotSettings.ClosestCursor = false
    end
end);

Aimbot.Toggle("Aimbot (M2)", AimbotSettings.Enabled, function(Callback)
    AimbotSettings.Enabled = Callback
    if (not AimbotSettings.FirstPerson and not AimbotSettings.ThirdPerson) then
        AimbotSettings.FirstPerson = true
    end
end);
Aimbot.Slider("Aimbot Smoothness", {Min = 1, Max = 10, Default = AimbotSettings.Smoothness, Step = .5}, function(Callback)
    AimbotSettings.Smoothness = Callback
end);
local sortTeams = function(Callback)
    table.clear(AimbotSettings.BlacklistedTeams);
    if (Callback == "Enemies") then
        table.insert(AimbotSettings.BlacklistedTeams, LocalPlayer.Team);
    end
    if (Callback == "Allies") then
        local AllTeams = Teams:GetTeams();
        table.remove(AllTeams, table.find(AllTeams, LocalPlayer.Team));
        AimbotSettings.BlacklistedTeams = AllTeams
    end
end
Aimbot.Dropdown("Team Target", {"Allies", "Enemies", "All"}, sortTeams);
sortTeams("Enemies");
Aimbot.Dropdown("Aimlock Type", {"Third Person", "First Person"}, function(callback)
    if (callback == "Third Person") then
        AimbotSettings.ThirdPerson = true
        AimbotSettings.FirstPerson = false
    else
        AimbotSettings.ThirdPerson = false
        AimbotSettings.FirstPerson = true
    end
end);

Aimbot.Toggle("Show Fov", AimbotSettings.ShowFov, function(Callback)
    AimbotSettings.ShowFov = Callback
    FOV.Visible = Callback
end);
Aimbot.ColorPicker("Fov Color", AimbotSettings.FovColor, function(Callback)
    AimbotSettings.FovColor = Callback
    FOV.Color = Callback
    Snaplines.Color = Callback
end);
Aimbot.Slider("Fov Size", {Min = 70, Max = 500, Default = AimbotSettings.FovSize, Step = 10}, function(Callback)
    AimbotSettings.FovSize = Callback
    FOV.Radius = Callback
end);
Aimbot.Toggle("Enable Snaplines", AimbotSettings.Snaplines, function(Callback)
    AimbotSettings.Snaplines = Callback
end);
Window.SetPosition(Settings.WindowPosition);

local adminids = {
    "82525089",
    "21522306",
    "82890650",
    "90699110",
    "25548179",
    "1586091",
    "839169788",
    "1625366971",
    "918257030",
    "65115",
    "136244389",
    "195536027",
    "141427680",
    "504161341",
    "358770591",
    "163081058",
    "1233205112",
    "30925626",
    "75226382",
    "335417646",
    "1074469795",
    "16681869",
    "15680821",
    "23212749",
    "31776363",
    "105326410",
    "476384450"
}

game:GetService"RunService".Stepped:connect(function()
    if admindetector then
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if v.UserId == adminids then
                game.Players.LocalPlayer:Kick("Admin Detected")
            elseif v.UserId == "47983795" then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Silentware"; -- the title (ofc)
                Text = "Silentware User Joined Game. (or admin)";
                Icon = ""; -- the image if u want. 
                Duration = 50; -- how long the notification should in secounds
            })
            end
        end
    end
end)


if (gethui) then
    MainUI.UI.Parent = gethui();
else
    local protect_gui = (syn or getgenv()).protect_gui
    if (protect_gui) then
        protect_gui(MainUI.UI);
    end
    MainUI.UI.Parent = game:GetService("CoreGui");
end

while wait(5) do
    Settings.WindowPosition = Window.GetPosition();
    local Encoded = HttpService:JSONEncode(EncodeConfig(Settings));
    writefile("fates-esp.json", Encoded);
end
