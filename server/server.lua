local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-tequila:bill:player")
AddEventHandler("qb-tequila:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'tequila' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

--------------------------- Getting Ingredients -------------------------------------

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientTaco', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local beef = Ply.Functions.GetItemByName("beef")
    local mixed-veg = Ply.Functions.GetItemByName("Mixed Veg")
    local cheese = Ply.Functions.GetItemByName("Cheese")
    if beef ~= nil and mixed-veg ~= nil and cheese ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientBurrito', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local beef = Ply.Functions.GetItemByName("Beef")
    local mixed-veg = Ply.Functions.GetItemByName("Mixed Veg")
    local cheese = Ply.Functions.GetItemByName("Cheese")
    if beef ~= nil and mixed-veg ~= nil and cheese ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientNachos', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local beef = Ply.Functions.GetItemByName("Beef")
    local mixed-veg = Ply.Functions.GetItemByName("Mixed Veg")
    local cheese = Ply.Functions.GetItemByName("Cheese")
    local tortilla-chips = Ply.Functions.GetItemByName("Tortilla Chips")
    if beef ~= nil and mixed-veg ~= nil and cheese ~= nil and tortilla-chips ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--Drinks
QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientCafe', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientLatte', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientCappuccino', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientMocha', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local whipcream = Ply.Functions.GetItemByName("whipcream")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and whipcream ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientCMilkshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    local whipcream = Ply.Functions.GetItemByName("whipcream")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if chocolate ~= nil and whipcream ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-tequila:server:get:ingredientIcetea', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local teabag = Ply.Functions.GetItemByName("teabag")
    if teabag ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-------------------------- Usable Items ------------------------
--Drinks
QBCore.Functions.CreateUseableItem("bean-cafe", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cafe', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-latte", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-latte', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-cappuccino", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cappuccino', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-mocha", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-mocha', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-cmilkshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cmilksake', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-icetea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-icetea', 1)
    end
end)

--Foods
QBCore.Functions.CreateUseableItem("burrito", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Eatables', source)
        Player.Functions.RemoveItem('burrito', 1)
    end
end)

QBCore.Functions.CreateUseableItem("donut", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Eatables', source)
        Player.Functions.RemoveItem('donut', 1)
    end
end)

QBCore.Functions.CreateUseableItem("croissant", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Eatables', source)
        Player.Functions.RemoveItem('croissant', 1)
    end
end)

QBCore.Functions.CreateUseableItem("cupchocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-tequila:client:Eatables', source)
        Player.Functions.RemoveItem('cupchocolate', 1)
    end
end)