QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("Gh-moneywash:server:checkInv")
AddEventHandler("Gh-moneywash:server:checkInv", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        if Player.Functions.GetItemByName('markedbills') ~= nil then
            
            local Item = Player.Functions.GetItemByName('markedbills')
            local amt = Player.Functions.GetItemByName('markedbills').amount
            TriggerClientEvent('Gh-moneywash:client:startTimer', src, Item.info.worth)
            TriggerClientEvent('QBCore:Notify', src, 'You put the marked bills in the washing machine.', 'success')
            Player.Functions.RemoveItem('markedbills', 1)
        else
            TriggerClientEvent('QBCore:Notify', src, 'no money.', 'error') 
        end

end)

RegisterNetEvent("Gh-moneywash:server:giveMoney")
AddEventHandler("Gh-moneywash:server:giveMoney", function(amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
   
   Player.Functions.AddMoney('cash', amt, 'sold-traphouse')
   
end)