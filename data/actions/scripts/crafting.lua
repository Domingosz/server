local config = {
-- Window Config
	mainTitleMsg = "Sakiewka Mew", -- Main window title
	mainMsg = "Sakiewka Mew \nStworz magiczne przedmioty", -- Main window message

	craftTitle = "Sakiewka Mew: ", -- Title of the crafting screen after player picks of vocation
	craftMsg = "Lista przedmiotow", -- Message on the crafting screen after player picks of vocation
-- End Window Config

-- Player Notifications Config
	needItems = "Nie posiadasz wymaganych przedmiotow do stworzenia ", -- This is the message the player recieves if he does not have all required items

-- Crafting Config
	system = {
	[1] = {vocation = "Kategoria pierwsza", -- This is the category can be anything.
			items = {
				[1] = {item = "bitten apple", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 27681, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 2148, count = 10}, -- 10 gold coin
								[2] = {item = 2152, count = 1}, -- 1 platinum coin
							},
						},

				[2] = {item = "empty pokeball",
						itemID = 26662,
						reqItems = {
								[1] = {item = 2148, count = 2}, -- 2 gold coin
								[2] = {item = 2152, count = 1}, -- 1 platinum coin
							},
						},
					},
				},

	[2] = {vocation= "Inne chujostwa",
			items = {
				[1] = {item = "ultimate potion",
						itemID = 27646,
						reqItems = {
								[1] = {item = 2148, count = 2}, -- 2 gold coin
								[2] = {item = 2152, count = 1}, -- 1 platinum coin
						},
					},

				[2] = {item = "random box",
						itemID = 26763,
						reqItems = {
								[1] = {item = 2148, count = 20}, -- 20 gold coin
								[2] = {item = 2152, count = 15}, -- 15 platinum coin
						    },
					    },
					},
				},
			},
		}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendMainCraftWindow(config)
    return true
end