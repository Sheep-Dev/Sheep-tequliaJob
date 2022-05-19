# qb-tequila - sheep

Cool and Simple bar Job

[Github] (https://github.com/Sheep-Dev)


# Dependencies

[qb-core](https://github.com/qbcore-framework/qb-core) 

[qb-target](https://github.com/BerkieBb/qb-target) 

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[qb-management](https://github.com/qbcore-framework/qb-management)
 

# Insert into qb-core/shared/items.lua

```
	-- QB-tequila
	--Drinks
	["beachfire-margarita"] 					 ={["name"] = "beachfire-margarita", 	    				["label"] = "alcohol", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "BeachfireMargarita.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Alcoholic Drink"},
	["peach-margarita"] 					 ={["name"] = "peach-margarita", 	    			["label"] = "Alcohol", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "Peachmargarita.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Alcholic Drink"},
	["watermelon-margarita"] 			 ={["name"] = "watermelon-margarita", 	    		["label"] = "alcohol", 				["weight"] = 1000, 		["type"] = "item", 			["image"] = "watermelonmargarita.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Alcoholic Drink"},
	--Foods
	["tacos"]              		 ={["name"] = "tacos", 	    				["label"] = "Beef Taco", 					["weight"] = 500, 		["type"] = "item", 			["image"] = "taco.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tacccoooosssssss"},
	["burrito"]              		 	 ={["name"] = "burrito", 	    					["label"] = "Burrito", 					["weight"] = 500, 		["type"] = "item", 			["image"] = "Burrito.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Nom Nom Nom"},
	["nachos"]              		 ={["name"] = "nachos", 	    				["label"] = "Nachos", 				["weight"] = 500, 		["type"] = "item", 			["image"] = "nachos.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Mmmm Cheesyyy"},			
	--Ingrediants
	["tequila"]              		 ={["name"] = "tequila", 	    				["label"] = "Bottle of Tequila", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "tequilabottle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Dont drink too much"},
	["mixed-veg"]              		 ={["name"] = "mixed-veg", 	    				["label"] = "Mixed Veg", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "mixed-veg.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Salad?"},
	["beef"]              		 ={["name"] = "beef", 	    				["label"] = "Beef", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "beef.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Moooo"},
	["cheese"]              	 ={["name"] = "cheese", 	    			["label"] = "Cheese", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "Cheese.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Why is this full of holes"},	
	["tortilla-chips"]              	 	 ={["name"] = "tortilla-chips", 	    				["label"] = "Tortilla Chips", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "tortilla-chips.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Used to make nachos"},		
	["peach"]              	 	 ={["name"] = "peach", 	    				["label"] = "Peach", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "peach.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fruityy"},		
	["watermelon"]              	 	 ={["name"] = "watermelon", 	    				["label"] = "Watermelon", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "watermelon.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Nice on a walm day"},		
	["lemon-lime"]              	 	 ={["name"] = "lemon-lime", 	    				["label"] = "Leamon and Lime", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "lal.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sour fest"},		

```
# Insert into qb-core/shared/jobs.lua 

```
    ["tequila"] = {
		label = "Tequila",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Bartender",
                payment = 75
            },
			['1'] = {
                name = "Cook",
                payment = 125
            },
			['2'] = {
                name = "Manager",
                payment = 150
            },
			['3'] = {
                name = "CEO",
				isboss = true,
                payment = 200
            },
        },
	},
```

# Don't Forget to add the images to inventory