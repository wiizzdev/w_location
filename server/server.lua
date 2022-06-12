ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('location:achat_veh')
AddEventHandler('location:achat_veh', function(name, price, liquide)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoneyL = xPlayer.getMoney()
    local xMoneyB = xPlayer.getAccount('bank').money
    if liquide then
        if xMoneyL >= price then
            xPlayer.removeMoney(price)
            SetVehicleNumberPlateText(CreateVehicle(GetHashKey(name), Config.Vehicule.Position, true, false), Config.Vehicule.Plaque)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~g~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    else
        if xMoneyB >= price then
            xPlayer.removeAccountMoney('bank', price)
            SetVehicleNumberPlateText(CreateVehicle(GetHashKey(name), Config.Vehicule.Position, true, false), Config.Vehicule.Plaque)
            TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~b~"..price.."$")
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
        end
    end
end)