local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function()

 
    exports['qb-target']:AddBoxZone("TequilaDuty", vector3(-563.48, 278.26, 83.14), 1, 1, {
        name="TequilaDuty",
        heading=0,
        debugPoly=true,
    }, {
        options = {
            {
            event = "qb-tequila:DutyA",
            icon = "far fa-clipboard",
            label = "Clock On/Off",
            job = "tequila",
            },
        },
        distance = 1.5    
    })

    exports['qb-target']:AddBoxZone("Fridge1", vector3(-552.14, 278.17, 82.18), 2, 2, {
		name="Fridge1",
		heading=340,
		debugPoly=true,
	}, {
		options = {
		    {
			event = "qb-tequila:Fridge",
			icon = "fa fa-archive",
			label = "Fridge",
            job = "tequila",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("Tray1", vector3(-634.36, 235.99, 81.88), 0.5, 0.5, {
		name="Tray1",
		heading=5,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:Tray1",
			icon = "far fa-clipboard",
			label = "Tray 1",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Tray2", vector3(-630.02, 236.65, 81.88), 0.5, 0.5, {
		name="Tray2",
		heading=0,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:Tray2",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Tray4", vector3(-632.62, 224.48, 86.33), 1, 1, {
		name="Tray4",
		heading=50,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("DrinksMaker", vector3(-635.71, 236.46, 81.88), 1, 1, {
		name="DrinksMaker",
		heading=50,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:DrinksMenu",
			icon = "fa fa-coffee",
			label = "Make Drinks",
            job = "tequila",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Foods", vector3(-562.63, 289.37, 83.98), 0.5, 0.5, {
		name="Foods",
		heading=0,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:FoodMenu",
			icon = "fa fa-cutlery",
			label = "Make Foods",
            job = "tequila",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Cashier", vector3(-634.38, 235.19, 81.88), 0.5, 0.5, {
		name="Cashier",
		heading=5,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-tequila:bill",
			icon = "fas fa-credit-card",
			label = "Cashier",
            job = "tequila",
		    },
		},
		distance = 1.5
	})

end)
      
RegisterNetEvent('qb-tequila:DrinksMenu', function(data)

    exports['qb-menu']:openMenu({
        {
           header = "Drinks Menu",
           isMenuHeader = true,
        },

        {
            header = "☕ Coffee",
            txt = "2 Tequilla Bottles and {SHEEP} Milk Bottle Required",
            params = {
                event = "qb-tequila:CreateCafe", 
                args = {
                    number = 0,
               }
           }
        },
        {
            header = "☕ Latte",
            txt = "3 Cocabeans and 1 Milk Bottle Required",
            params = {
                event = "qb-tequila:CreateLatte",
                args = {
                    number = 1,
               }
           }
        },
        {
            header = "☕ Cappuccino",
            txt = "3 Cocabeans and 2 Milk Bottles Required",
            params = {
                event = "qb-tequila:CreateCappuccino",
                args = {
                    number = 2,
                }
            }
        },
        {
            header = "☕ Mocha",
            txt = "1 Milk Bottle , 3 Cocabeans and 1 Whipcream Required",
            params = {
                event = "qb-tequila:CreateMocha",
                args = {
                    number = 3,
                }
            }
        },
        {
            header = "🥤 Choclate Milkshake",
            txt = "2 Milk Bottles , 5 Chocolates and 1 Whipcream Required",
            params = {
                event = "qb-tequila:CreateCMilkshake",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "🥤 Ice Tea",
            txt = "1 Teabag Required",
            params = {
                event = "qb-tequila:CreateIcetea",
                args = {
                    number = 5,
                }
            }
        },                 

       {
           header = "❌ Close",
           txt = "",
           params = {
               event = "qb-menu:closeMenu",
               args = {
                   number = 6,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-tequila:Fridge', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Storage Container",
           isMenuHeader = true,
       },

       {
           header = "📦 Fridge",
           txt = "Open the Fridge",
           params = {
               event = "qb-tequila:Storage", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "🛍️ Shop",
           txt = "Shop For Ingredients",
           params = {
               event = "qb-tequila:shop",
               args = {
                   number = 1,
               }
           }
       },   

       {
           header = "❌ Close",
           txt = "",
           params = {
               event = "qb-menu:closeMenu",
               args = {
                   number = 2,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-tequila:FoodMenu', function(data)

    exports['qb-menu']:openMenu({
        {
           header = "Food Menu",
           isMenuHeader = true,
        },

        {
            header = "Taco",
            txt = "2 Tortilla Chips , 2 Beef , 1 Mixed Veg and 1 Cheese",
            params = {
                event = "qb-tequila:CreateDonut", 
                args = {
                    number = 0,
               }
           }
        },
        {
            header = "Nachos",
            txt = " 2 Tortilla Chips , 2 Beef , 1 Mixed Veg and 1 Cheese",
            params = {
                event = "qb-tequila:CreateCroissant",
                args = {
                    number = 1,
               }
           }
        },
        {
            header = "Burrito",
            txt = "1 Beef , 3 Mixed Veg and 1 Cheese",
            params = {
                event = "qb-tequila:CreateBurrito",
                args = {
                    number = 2,
                }
            }
        },

        {
            header = "❌ Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
                args = {
                    number = 4,
                }
            }
        },
    })
    end)        

----------------Billing-----------------------

RegisterNetEvent("qb-tequila:bill", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'Paypal ID'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount!'
            }
        }
    })
    if dialog then
        if not dialog.id or not dialog.amount then return end
        TriggerServerEvent("qb-tequila:bill:player", dialog.id, dialog.amount)
    end
end)
