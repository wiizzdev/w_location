    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
-- Event de l'achat du véhicule 'blista'
RegisterNetEvent('wdev:achatBlista') -- enregistrement de l'event
AddEventHandler('wdev:achatBlista', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 800 -- prix réel du véhicule
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("blista"), -1033.53, -2728.8, 20.14, 240.0, true, false), "LOCATION")
      TriggerClientEvent('esx:showNotification', source, "Achat effectué ! \nBonne route !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat du véhicule 'panto'
RegisterNetEvent('wdev:achatPanto') -- enregistrement de l'event
AddEventHandler('wdev:achatPanto', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 600 -- prix réel du véhicule
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("panto"), -1033.53, -2728.8, 20.14, 240.0, true, false), "LOCATION")
      TriggerClientEvent('esx:showNotification', source, "Achat effectué ! \nBonne route !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat du véhicule 'faggio'
RegisterNetEvent('wdev:achatFaggio') -- enregistrement de l'event
AddEventHandler('wdev:achatFaggio', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 500 -- prix réel du véhicule
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("faggio"), -1033.53, -2728.8, 20.14, 240.0, true, false), "LOCATION")
      TriggerClientEvent('esx:showNotification', source, "Achat effectué ! \nBonne route !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat du véhicule 'cruiser'
RegisterNetEvent('wdev:achatCruiser') -- enregistrement de l'event
AddEventHandler('wdev:achatCruiser', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 250 -- prix réel du véhicule
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("cruiser"), -1033.53, -2728.8, 20.14, 240.0, true, false), "LOCATION")
      TriggerClientEvent('esx:showNotification', source, "Achat effectué ! \nBonne route !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)

-- Event de l'achat du véhicule 'bmx'
RegisterNetEvent('wdev:achatBMX') -- enregistrement de l'event
AddEventHandler('wdev:achatBMX', function() -- définition de l'event
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 150 -- prix réel du véhicule
  local argent = joueur.getMoney()
    if argent >= prix then -- si l'argent est supérieur ou égal a l'argent alors
      joueur.removeMoney(prix) -- supprimer l'argent au joueur
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("bmx"), -1033.53, -2728.8, 20.14, 240.0, true, false), "LOCATION")
      TriggerClientEvent('esx:showNotification', source, "Achat effectué ! \nBonne route !") -- contenue de la notif si achat validé
    else -- sinon
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argent") -- contenue de la notif si achat refusé
    end
end)