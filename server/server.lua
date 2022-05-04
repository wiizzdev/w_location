    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('coreshops:achatveh')
AddEventHandler('coreshops:achatveh', function(nameveh, priceveh, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= priceveh then
            xPlayer.removeMoney(priceveh)
            SetVehicleNumberPlateText(CreateVehicle(GetHashKey(nameveh), Config.Location.VehPos, true, false), Config.Location.PlaqueVeh)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..priceveh.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= priceveh then
            xPlayer.removeAccountMoney('bank', priceveh)
            SetVehicleNumberPlateText(CreateVehicle(GetHashKey(nameveh), Config.Location.VehPos, true, false), Config.Location.PlaqueVeh)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..priceveh.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)

ESX.RegisterServerCallback('coreshops:checkcarte', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(Config.NomItemCarte).count >= 1 then
		cb(true)
    else
		cb(false)
    end
end)