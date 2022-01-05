    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

-- MENU

local mainMenu = RageUI.CreateMenu("Location", "MENU") -- menu principal
local voiture = RageUI.CreateSubMenu(mainMenu, "Voitures", "MENU") -- sous-menu voiture
local moto = RageUI.CreateSubMenu(mainMenu, "Motos", "MENU") -- sous-menu moto
local velo = RageUI.CreateSubMenu(mainMenu, "Vélos", "MENU") -- sous-menu velo
local open = false

mainMenu.Display.Glare = true -- afficher la planète sur la bannière principale ?
voiture.Display.Glare = true -- afficher la planète sur la bannière voiture ?
moto.Display.Glare = true -- afficher la planète sur la bannière moto ?
velo.Display.Glare = true -- afficher la planète sur la bannière velo ?

mainMenu.Closed = function() open = false end

function location() -- function qui fait le menu
    if open then 
        open = false 
            RageUI.Visible(mainMenu, false)
        return 
    else 
        open = true 
            RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Voitures", nil, {RightLabel = "→"}, true, {onActive = function() stopprevue() end}, voiture) -- bouton du menu principal
                    RageUI.Button("Motos", nil, {RightLabel = "→"}, true, {onActive = function() stopprevue() end}, moto) -- bouton du menu principal
                    RageUI.Button("Vélos", nil, {RightLabel = "→"}, true, {onActive = function() stopprevue() end}, velo) -- bouton du menu principal
                    RageUI.Separator("discord.gg/VpYP58ZjmD") -- lien discord affiché en bas du menu
                end)
                RageUI.IsVisible(voiture, function()
                    RageUI.Button("Blista", nil, {RightLabel = config.prixvoiture1}, true, { -- bouton du menu voiture
                        onActive = function() -- activer la camera
                            UpdateCam('blista', vector3(-1033.53, -2728.8, 20.14), 240.0)
                            pointerlacam()
                        end,
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatBlista') -- éxécuter l'event achatBlista => personnalisable dans le server.lua
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            retourcam() -- retourner sur la caméra du joueur
                            stopprevue() -- arrêter l'hologramme du véhicule
                            RageUI.CloseAll() -- fermer le menu en entier
                            open = false
                        end
                    })
                    RageUI.Button("Panto", nil, {RightLabel = config.prixvoiture2}, true, { -- bouton du menu voiture
                        onActive = function() -- activer la camera
                            UpdateCam('panto', vector3(-1033.53, -2728.8, 20.14), 240.0)
                            pointerlacam()
                        end,
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatPanto') -- éxécuter l'event achatPanto => personnalisable dans le server.lua
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            retourcam() -- retourner sur la caméra du joueur
                            stopprevue() -- arrêter l'hologramme du véhicule
                            RageUI.CloseAll() -- fermer le menu en entier
                            open = false
                        end
                    })
                end)
                RageUI.IsVisible(moto, function()
                    RageUI.Button("Faggio", nil, {RightLabel = config.prixmoto1}, true, { -- bouton du menu moto
                        onActive = function() -- activer la camera
                            UpdateCam('faggio', vector3(-1033.53, -2728.8, 20.14), 240.0)
                            pointerlacam()
                        end,
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatFaggio') -- éxécuter l'event achatFaggio => personnalisable dans le server.lua
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            retourcam() -- retourner sur la caméra du joueur
                            stopprevue() -- arrêter l'hologramme du véhicule
                            RageUI.CloseAll() -- fermer le menu en entier
                            open = false
                        end
                    })
                end)
                RageUI.IsVisible(velo, function()
                    RageUI.Button("Cruiser", nil, {RightLabel = config.prixvelo1}, true, { -- bouton du menu velo
                        onActive = function() -- activer la camera
                            UpdateCam('cruiser', vector3(-1033.53, -2728.8, 20.14), 240.0)
                            pointerlacam()
                        end,
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatCruiser') -- éxécuter l'event achatCruiser => personnalisable dans le server.lua
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            retourcam() -- retourner sur la caméra du joueur
                            stopprevue() -- arrêter l'hologramme du véhicule
                            RageUI.CloseAll() -- fermer le menu en entier
                            open = false
                        end
                    })
                    RageUI.Button("BMX", nil, {RightLabel = config.prixvelo2}, true, { -- bouton du menu velo
                        onActive = function() -- activer la camera
                            UpdateCam('bmx', vector3(-1033.53, -2728.8, 20.14), 240.0)
                            pointerlacam()
                        end,
                        onSelected = function() -- si le joueur sélectionne ce bouton
                            TriggerServerEvent('wdev:achatBMX') -- éxécuter l'event achatBMX => personnalisable dans le server.lua
                            PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            retourcam() -- retourner sur la caméra du joueur
                            stopprevue() -- arrêter l'hologramme du véhicule
                            RageUI.CloseAll() -- fermer le menu en entier
                            open = false
                        end
                    })  
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function() -- function pour pouvoir ouvrir le menu
    while true do
      local wait = 900
        for k,v in pairs(Config.position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2.5 then -- a partir de quelle distance le joueur peut-il intéragir ?
                wait = 1
                --Visual.Subtitle("Appuyez sur ~g~[E]~w~ pour intéragir", 1) -- a activer si vous souhaitez un texte en bas de l'écran
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir") -- a commenter si vous avez activé la ligne au dessus
                Draw3DText(v.x, v.y, v.z+2.0, config.texteped) -- afficher le texte 3d au dessus de la tête du ped
                if IsControlJustPressed(1,51) then -- si la touche E est pressé alors
                    location() -- ouvrir le menu principal
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

-- 3D TEXT

function Draw3DText(x, y, z, text) -- function qui définit le texte 3d
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(2) -- police du texte 3d (par défaut => 0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

-- BLIPS
 
Citizen.CreateThread(function() 
    for k, v in pairs(Config.position) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z) -- coordonées a changer dans le config.lua
                    SetBlipSprite  (blip, config.blipsprite) -- logo a changer dans le config.lua
                    SetBlipDisplay (blip, config.blipdisplay) -- affichage a changer dans le config.lua
                    SetBlipScale   (blip, config.blipscale) -- taille a changer dans le config.lua
                    SetBlipColour  (blip, config.blipcolour) -- couleur a changer dans le config.lua
                    SetBlipAsShortRange(blip, true) 
                    BeginTextCommandSetBlipName('STRING') 
                    AddTextComponentSubstringPlayerName(config.blipname) -- nom a changer dans le config.lua
                    EndTextCommandSetBlipName(blip) 
    end 
end)

-- PED

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_floyd")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_floyd", -1037.45, -2737.25, 19.17, 145.47, false, true) -- coordonnées du ped
    SetBlockingOfNonTemporaryEvents(ped, config.freezeped) -- le ped ne peux plus bouger
    FreezeEntityPosition(ped, config.peurped) -- le ped n'est plus affrayé par les armes
    SetEntityInvincible(ped, config.invincibleped) -- le ped est invincible
end)

-- CAMERA

tempVeh = nil
local tempModel = nil

function stopprevue() -- function qui permet d'arrêter l'hologramme du véhicule
    TriggerEvent("InitCamModulePause", false)
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

function pointerlacam() -- function pour pointer la caméra sur le véhicule
    cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
    SetCamCoord(cam, -1034.77, -2732.38, 20.17, 333.85, true, 0)
    RenderScriptCams(500, 100, 1000, 1000, 100)
    PointCamAtCoord(cam, 343.1698913, 343.1698913, 343.1698913)
    DisplayRadar(false)
end

function retourcam() -- function pour faire revenir la caméra sur le joueur
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    DisplayRadar(false) -- mettre true si votre radar est activé par défaut sur votre serveur
end

voiture.Closed = function() retourcam() end -- lorsque le menu voiture est fermé, revenir a la caméra du joueur
moto.Closed = function() retourcam() end -- lorsque le menu moto est fermé, revenir a la caméra du joueur
velo.Closed = function() retourcam()  end -- lorsque le menu velo est fermé, revenir a la caméra du joueur