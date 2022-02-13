ESX = nil

local zoneBlanchisseur = Config.Position

TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)

RegisterServerEvent("tBlanchisseur:openMenuBlanchisseurServer")
AddEventHandler("tBlanchisseur:openMenuBlanchisseurServer", function()
    TriggerClientEvent('tBlanchisseur:openMenuBlanchisseur', source)
end)

RegisterServerEvent("tBlanchisseur:checkBlackMoney")
AddEventHandler("tBlanchisseur:checkBlackMoney", function(price, temps)
    local _source = source
    local playerPed = GetPlayerPed(_source)
    
    local xPlayer = ESX.GetPlayerFromId(_source)
    local blackMoney = xPlayer.getAccount(Config.ArgentSale)

    local playerPosition = GetEntityCoords(playerPed)
    local dst = #(zoneBlanchisseur-playerPosition)

    if dst <= 3 then 

        if blackMoney.money >= price then

            xPlayer.removeAccountMoney(Config.ArgentSale, price)
            TriggerClientEvent("tBlanchisseur:playerHasMoney", _source, price, temps)
        else
            TriggerClientEvent(Config.Events["esx:showNotification"], _source, "Vous n'avez assez ~r~d\'argent sale")
        end
    else 
        TriggerClientEvent(Config.Events["esx:showNotification"], _source, "~r~Action impossible")
    end

end)

RegisterServerEvent("tBlanchisseur:finishedWashing")
AddEventHandler("tBlanchisseur:finishedWashing", function(price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local newPrice = price * Config.Percentage / 100
    print(newPrice)

    xPlayer.addMoney(newPrice)

end)

print("")
print("[^5tBlanchisseur^7] - Made by TrapZed#1725^7")
print("")