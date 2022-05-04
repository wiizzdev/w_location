    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local mainMenu = RageUI.CreateMenu("", "Location")
local voiture = RageUI.CreateSubMenu(mainMenu, "", "Voitures")
local moto = RageUI.CreateSubMenu(mainMenu, "", "Motos")
local velo = RageUI.CreateSubMenu(mainMenu, "", "Vélos")
local paiement = RageUI.CreateSubMenu(mainMenu, "", "Méthode de Paiement")
local open = false

mainMenu.Closed = function() open = false Retourcam() FreezeEntityPosition(GetPlayerPed(-1), false) end
voiture.Closed = function() StopPrevue() Retourcam() end
moto.Closed = function() StopPrevue() Retourcam() end
velo.Closed = function() StopPrevue() Retourcam() end
paiement.Closed = function() StopPrevue() Retourcam() end

function Location()
    if not open then open = true RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(mainMenu, function()
                    if Config.Location.ActiverVoitures then RageUI.Button("Voitures", nil, {RightLabel = "→"}, true, {}, voiture) end
                    if Config.Location.ActiverMotos then RageUI.Button("Motos", nil, {RightLabel = "→"}, true, {}, moto) end
                    if Config.Location.ActiverVelos then RageUI.Button("Vélos", nil, {RightLabel = "→"}, true, {}, velo) end
                    RageUI.Separator("discord.gg/VpYP58ZjmD")
                end)
                RageUI.IsVisible(voiture, function()
                    for _,v in pairs(Config.Location.List.Voitures) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onActive = function()
                                UpdateCam(v.name, Config.Location.VehPos)
                                Pointerlacam()
                            end,
                            onSelected = function()
                                nameveh = v.name
                                priceveh = v.price
                                ESX.TriggerServerCallback('coreshops:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(moto, function()
                    for _,v in pairs(Config.Location.List.Motos) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onActive = function()
                                UpdateCam(v.name, Config.Location.VehPos)
                                Pointerlacam()
                            end,
                            onSelected = function()
                                nameveh = v.name
                                priceveh = v.price
                                ESX.TriggerServerCallback('coreshops:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(velo, function()
                    for _,v in pairs(Config.Location.List.Velos) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                            onActive = function()
                                UpdateCam(v.name, Config.Location.VehPos)
                                Pointerlacam()
                            end,
                            onSelected = function()
                                nameveh = v.name
                                priceveh = v.price
                                ESX.TriggerServerCallback('coreshops:checkcarte', function(confirmation)
                                    if not confirmation then joueuraunecarte = false else joueuraunecarte = true end
                                end)
                            end
                        }, paiement)
                    end
                end)
                RageUI.IsVisible(paiement, function()
                    RageUI.Button("Payer en ~g~Liquide", nil, {RightLabel = "→"}, true, {
                        onSelected = function() 
                            liquide = true
                            TriggerServerEvent('coreshops:achatveh', nameveh, priceveh, liquide)
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                            Retourcam()
                            StopPrevue()
                            RageUI.CloseAll()
                            open = false
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                         end
                    })
                    if Config.UtiliserCarteBancaire then
                        if joueuraunecarte then
                            RageUI.Button("Payer en ~b~Banque", nil, {RightLabel = "→"}, true, {
                                onSelected = function() 
                                    liquide = false
                                    TriggerServerEvent('coreshops:achatveh', nameveh, priceveh, liquide)
                                    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                                    Retourcam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        else
                            RageUI.Button("Payer en ~b~Banque", "~r~Vous devez avoir une carte bancaire", {}, false, {})
                        end
                    else
                        RageUI.Button("Payer en ~g~Banque", nil, {RightLabel = "→"}, true, {
                            onSelected = function() 
                                liquide = false
                                TriggerServerEvent('coreshops:achatveh', nameveh, priceveh, liquide)
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                                Retourcam()
                                StopPrevue()
                                RageUI.CloseAll()
                                open = false
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                            end
                        })
                    end
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Location.Pos) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2.5 then
                wait = 1
                ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour ouvrir la ~b~Location")
                if IsControlJustPressed(1,51) then
                    Location()
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

-- BLIPS

Citizen.CreateThread(function() 
    for k,v in pairs(Config.Location.Pos) do
        if Config.Location.ActiverBlips then
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blip, Config.Location.BlipsId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Location.BlipsScale)
            SetBlipColour(blip, Config.Location.BlipsColor)
            SetBlipAsShortRange(blip, true) 
            BeginTextCommandSetBlipName('STRING') 
            AddTextComponentSubstringPlayerName(Config.Location.BlipsName)
            EndTextCommandSetBlipName(blip)
        end
    end 
end)

Citizen.CreateThread(function()
    local hash = GetHashKey(Config.Location.PedsName)
    while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
    for _,v in pairs(Config.Location.PedsList) do
        ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Location.PedsName, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        if Config.Location.PedsAnim then TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) end
    end
end)

local tempVeh = nil
local tempModel = nil

function StopPrevue()
    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
end

function UpdateCam(model, coords, heading)
    if model == tempModel then
        return
    else
        if tempVeh ~= nil then
            DeleteEntity(tempVeh)
            tempVeh = nil
        end
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
        tempModel = model
        tempVeh = CreateVehicle(GetHashKey(model), coords, heading, 0, 0)
        FreezeEntityPosition(tempVeh, true)
        SetEntityAlpha(tempVeh, 180, 180)
        local camCoords = GetOffsetFromEntityInWorldCoords(tempVeh, 3.0, 2.0, 2.0)
    end
end

function Pointerlacam()
    cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
    SetCamCoord(cam, -726.65, -1487.3, 5.5, 320.233, true, 0)
    RenderScriptCams(500, 100, 1000, 1000, 100)
end

function Retourcam()
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyAllCams(true)
end