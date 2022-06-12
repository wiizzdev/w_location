Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local mainMenu = RageUI.CreateMenu("", "Location")
local voiture = RageUI.CreateSubMenu(mainMenu, "", "Voitures")
local moto = RageUI.CreateSubMenu(mainMenu, "", "Motos")
local velo = RageUI.CreateSubMenu(mainMenu, "", "Vélos")
local open,Index = false,1

mainMenu.Closed = function() open = false KillCam() FreezeEntityPosition(GetPlayerPed(-1), false) end
voiture.Closed = function() StopPrevue() KillCam() end
moto.Closed = function() StopPrevue() KillCam() end
velo.Closed = function() StopPrevue() KillCam() end

function Location()
    if not open then open = true RageUI.Visible(mainMenu, true) 
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    if Config.Menu.Activer.Voiture then
                        RageUI.Button("Voitures", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                CameraLocation()
                            end
                        }, voiture)
                    end
                    if Config.Menu.Activer.Moto then
                        RageUI.Button("Motos", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                CameraLocation()
                            end
                        }, moto)
                    end
                    if Config.Menu.Activer.Velo then
                        RageUI.Button("Vélos", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                CameraLocation()
                            end
                        }, velo)
                    end
                end)
                RageUI.IsVisible(voiture, function()
                    for k,v in pairs(Config.Menu.Voiture) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onSelected = function()
                                    TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, false)
                                    end
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(moto, function()
                    for k,v in pairs(Config.Menu.Moto) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onSelected = function()
                                    TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, false)
                                    end
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        end
                    end
                end)
                RageUI.IsVisible(velo, function()
                    for k,v in pairs(Config.Menu.Velo) do
                        if not Config.Menu.Activer.PaiementBanque then
                            RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onSelected = function()
                                    TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        else
                            RageUI.List(v.label.." - "..v.price.."$", {"~g~Liquide~s~", "~b~Banque~s~"}, Index, nil, {}, true, {
                                onActive = function()
                                    UpdateCam(v.name, Config.Vehicule.Position)
                                end,
                                onListChange = function(list) Index = list end,
                                onSelected = function(list)
                                    if list == 1 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, true)
                                    elseif list == 2 then
                                        TriggerServerEvent('location:achat_veh', v.name, v.price, false)
                                    end
                                    KillCam()
                                    StopPrevue()
                                    RageUI.CloseAll()
                                    open = false
                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                end
                            })
                        end
                    end
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.Position) do
        if Config.Blips.Activer then
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blip, Config.Blips.Sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Blips.Scale)
            SetBlipColour(blip, Config.Blips.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Blips.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(Config.Position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 1.5 then
                wait = 1
                ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour ouvrir la ~b~Location")
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    Location()
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey(Config.Peds.Name)
    while not HasModelLoaded(hash) do RequestModel(hash) Wait(20) end
    for k,v in pairs(Config.Peds.Position) do
        local ped = CreatePed("PED_TYPE_CIVFEMALE", Config.Peds.Name, v.x, v.y, v.z, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)

local tempVeh = nil
local tempModel = nil

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

function StopPrevue()
    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
end

function KillCam()
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(camlocation, false)
    DestroyAllCams(true)
end

function CameraLocation()
    CreateThread(function()
        local camlocation = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Config.Vehicule.Camera.Pos.x, Config.Vehicule.Camera.Pos.y, Config.Vehicule.Camera.Pos.z, Config.Vehicule.Camera.Angle.x, Config.Vehicule.Camera.Angle.y, Config.Vehicule.Camera.Angle.z, Config.Vehicule.Camera.Fov)
        SetCamActive(camlocation, true)
        RenderScriptCams(1, 1, 1500, 0, 0)
    end)
end