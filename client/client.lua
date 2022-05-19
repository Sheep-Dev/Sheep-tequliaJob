local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = true

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "tequila" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    tequila = AddBlipForCoord(-560.02, 282.08, 82.18)
    SetBlipSprite (tequila, 89)
    SetBlipDisplay(tequila, 4)
    SetBlipScale  (tequila, 0.5)
    SetBlipAsShortRange(tequila, true)
    SetBlipColour(tequila, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BAR")
    EndTextCommandSetBlipName(tequila)
end) 

RegisterNetEvent("qb-tequila:DutyA")
AddEventHandler("qb-tequila:DutyA", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-tequila:Tray1")
AddEventHandler("qb-tequila:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bartray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bartray1", {
        maxweight = 45000,
        slots = 10,
    })
end)

RegisterNetEvent("qb-tequila:Tray2")
AddEventHandler("qb-tequila:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bartray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bartray2", {
        maxweight = 45000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-tequila:Tray4")
AddEventHandler("qb-tequila:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bartray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bartray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-tequila:Tray3")
AddEventHandler("qb-tequila:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bartray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bartray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-tequila:Storage2")
AddEventHandler("qb-tequila:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "barstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "barstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-tequila:Storage")
AddEventHandler("qb-tequila:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "barstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "barstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Foods
RegisterNetEvent("qb-tequila:CreateBurrito")
AddEventHandler("qb-tequila:CreateBurrito", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientburrito', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A burrito..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "beef", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cheese", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mixed-veg", 3)
					TriggerServerEvent('QBCore:Server:AddItem', "burrito", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burrito"], "add")
                    QBCore.Functions.Notify("You made a A Burrito", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateTaco")
AddEventHandler("qb-tequila:CreateCookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientCookie', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Cookies..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "cookie", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookie"], "add")
                    QBCore.Functions.Notify("You made a A Cookie", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateCroissant")
AddEventHandler("qb-tequila:CreateCroissant", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientCroissant', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Croissant..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 2)
					TriggerServerEvent('QBCore:Server:AddItem', "croissant", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["croissant"], "add")
                    QBCore.Functions.Notify("You made a A Croissant", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateChocolateCupcake")
AddEventHandler("qb-tequila:CreateChocolateCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientChocolateCupcake', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Cupcake..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 7)
					TriggerServerEvent('QBCore:Server:AddItem', "cupchocolate", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cupchocolate"], "add")
                    QBCore.Functions.Notify("You made a A Chocolate Cupcake", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

--Drinks
RegisterNetEvent("qb-tequila:CreateCafe")
AddEventHandler("qb-tequila:CreateCafe", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientCafe', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Coffee..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 5)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cafe", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cafe"], "add")
                    QBCore.Functions.Notify("You made a A Coffee", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateLatte")
AddEventHandler("qb-tequila:CreateLatte", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientLatte', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Latte..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 5)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-latte", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-latte"], "add")
                    QBCore.Functions.Notify("You made a A Latte", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateCappuccino")
AddEventHandler("qb-tequila:CreateCappuccino", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientCappuccino', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Cappuccino..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 3)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cappuccino", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cappuccino"], "add")
                    QBCore.Functions.Notify("You made a A Cappuccino", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateMocha")
AddEventHandler("qb-tequila:CreateMocha", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientMocha', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Mocha..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 3)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whipcream", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-mocha", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-mocha"], "add")
                    QBCore.Functions.Notify("You made a A Mocha", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateCMilksahke")
AddEventHandler("qb-tequila:CreateCMilkshake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientCMilkshake', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Milkshake..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 2)
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 5)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whipcream", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cmilkshake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cmilkshake"], "add")
                    QBCore.Functions.Notify("You made a A Chocolate Milksahke", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:CreateIcetea")
AddEventHandler("qb-tequila:CreateIcetea", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-tequila:server:get:ingredientIcetea', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Ice Tea..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "teabag", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-icetea", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-icetea"], "add")
                    QBCore.Functions.Notify("You made a A Ice Tea", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-tequila:shop")
AddEventHandler("qb-tequila:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "tequila", Config.Items)
end)

------------------- Usable Items --------------------------

RegisterNetEvent('qb-tequila:client:Drinkables', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar('beber_cafe', 'Drinking...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30,80))
		TriggerServerEvent('hud:server:RelieveStress', math.random(10, 30))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('qb-tequila:client:Eatables', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"Burrito"})
    QBCore.Functions.Progressbar('beber_cafe', 'Eating...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(30, 80))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)