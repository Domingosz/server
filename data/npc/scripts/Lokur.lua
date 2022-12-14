local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Hey, send a letter to your friend now and then. Keep in touch, you know.' },
	{ text = 'Also selling weekly tickets for the ore wagon service!' },
	{ text = 'Welcome to the post and bank office!' },
	{ text = 'If you need help with letters or parcels, just ask me. I can explain everything.' }
}

npcHandler:addModule(VoiceModule:new(voices))

local function greetCallback(cid)
	count[cid], transfer[cid] = nil, nil
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
---------------------------- help ------------------------
	if msgcontains(msg, 'bank account') then
		npcHandler:say({
			'Every Tibian has one. The big advantage is that you can access your money in every branch of the Tibian Bank! ...',
			'Would you like to know more about the {basic} functions of your bank account, the {advanced} functions, or are you already bored, perhaps?'
		}, cid)
		npcHandler.topic[cid] = 0
		return true
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		npcHandler.topic[cid] = 0
		if player:getBankBalance() >= 100000000 then
			npcHandler:say('I think you must be one of the richest inhabitants in the world! Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		elseif player:getBankBalance() >= 10000000 then
			npcHandler:say('You have made ten millions and it still grows! Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		elseif player:getBankBalance() >= 1000000 then
			npcHandler:say('Wow, you have reached the magic number of a million gp!!! Your account balance is ' .. player:getBankBalance() .. ' gold!', cid)
			return true
		elseif player:getBankBalance() >= 100000 then
			npcHandler:say('You certainly have made a pretty penny. Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		else
			npcHandler:say('Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		end
---------------------------- deposit ---------------------
	elseif msgcontains(msg, 'deposit') then
		count[cid] = player:getMoney()
		if count[cid] < 1 then
			npcHandler:say('You do not have enough gold.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
		if msgcontains(msg, 'all') then
			count[cid] = player:getMoney()
			npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			if string.match(msg,'%d+') then
				count[cid] = getMoneyCount(msg)
				if count[cid] < 1 then
					npcHandler:say('You do not have enough gold.', cid)
					npcHandler.topic[cid] = 0
					return false
				end
				npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
				npcHandler.topic[cid] = 2
				return true
			else
				npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
				npcHandler.topic[cid] = 1
				return true
			end
		end
		if not isValidMoney(count[cid]) then
			npcHandler:say('Sorry, but you can\'t deposit that much.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
	elseif npcHandler.topic[cid] == 1 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			npcHandler:say('You do not have enough gold.', cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if player:getMoney() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				npcHandler:say('Alright, we have added the amount of ' .. count[cid] .. ' gold to your {balance}. You can {withdraw} your money anytime you want to.', cid)
			else
				npcHandler:say('You do not have enough gold.', cid)
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:say('As you wish. Is there something else I can do for you?', cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if string.match(msg,'%d+') then
			count[cid] = getMoneyCount(msg)
			if isValidMoney(count[cid]) then
				npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
				npcHandler.topic[cid] = 7
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say('There is not enough gold on your account.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			if player:getFreeCapacity() >= getMoneyWeight(count[cid]) then
				if not player:withdrawMoney(count[cid]) then
					npcHandler:say('There is not enough gold on your account.', cid)
				else
					npcHandler:say('Here you are, ' .. count[cid] .. ' gold. Please let me know if there is something else I can do for you.', cid)
				end
			else
				npcHandler:say('Whoah, hold on, you have no room in your inventory to carry all those coins. I don\'t want you to drop it on the floor, maybe come back with a cart!', cid)
			end
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'no') then
			npcHandler:say('The customer is king! Come back anytime you want to if you wish to {withdraw} your money.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- transfer --------------------
	elseif msgcontains(msg, 'transfer') then
		npcHandler:say('Please tell me the amount of gold you would like to transfer.', cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then
		count[cid] = getMoneyCount(msg)
		if player:getBankBalance() < count[cid] then
			npcHandler:say('There is not enough gold on your account.', cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if isValidMoney(count[cid]) then
			npcHandler:say('Who would you like transfer ' .. count[cid] .. ' gold to?', cid)
			npcHandler.topic[cid] = 12
		else
			npcHandler:say('There is not enough gold on your account.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 12 then
		transfer[cid] = msg
		if player:getName() == transfer[cid] then
			npcHandler:say('Fill in this field with person who receives your gold!', cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if playerExists(transfer[cid]) then
			npcHandler:say('So you would like to transfer ' .. count[cid] .. ' gold to ' .. transfer[cid] .. '?', cid)
			npcHandler.topic[cid] = 13
		else
			npcHandler:say('This player does not exist.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 13 then
		if msgcontains(msg, 'yes') then
			if not player:transferMoneyTo(transfer[cid], count[cid]) then
				npcHandler:say('You cannot transfer money to this account.', cid)
			else
				npcHandler:say('Very well. You have transferred ' .. count[cid] .. ' gold to ' .. transfer[cid] ..'.', cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:say('Alright, is there something else I can do for you?', cid)
		end
		npcHandler.topic[cid] = 0
---------------------------- money exchange --------------
	elseif msgcontains(msg, 'change gold') then
		npcHandler:say('How many platinum coins would you like to get?', cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough gold coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your gold coins into ' .. count[cid] .. ' platinum coins?', cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough gold coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		npcHandler:say('Would you like to change your platinum coins into gold or crystal?', cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			npcHandler:say('How many platinum coins would you like to change into gold?', cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say('How many crystal coins would you like to get?', cid)
			npcHandler.topic[cid] = 19
		else
			npcHandler:say('Well, can I help you with something else?', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your platinum coins into ' .. count[cid] * 100 .. ' gold coins for you?', cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2152, count[cid]) then
				player:addItem(2148, count[cid] * 100)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your platinum coins into ' .. count[cid] .. ' crystal coins for you?', cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2152, count[cid] * 100) then
				player:addItem(2160, count[cid])
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say('How many crystal coins would you like to change into platinum?', cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your crystal coins into ' .. count[cid] * 100 .. ' platinum coins for you?', cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2160, count[cid])  then
				player:addItem(2152, count[cid] * 100)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	end
	-- WAGON TICKET
	if msgcontains(msg, 'ticket') then
		if player:getStorageValue(Storage.wagonTicket) < os.time() then
			npcHandler:say("Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?", cid)
			npcHandler.topic[cid] = 23
		else
			npcHandler:say("Your weekly ticket is still valid. Would be a waste of money to purchase a second one", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 23 then
			if player:removeMoney(250) then
				player:setStorageValue(Storage.wagonTicket, os.time() + 7 * 24 * 60 * 60)
				npcHandler:say("Here is your stamp. It can't be transferred to another person and will last one week from now. You'll get notified upon using an ore wagon when it isn't valid anymore.", cid)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 23 then
		if msgcontains(msg, 'no') then
			npcHandler:say("No then.", cid)
			npcHandler.topic[cid] = 0
		end
	-- WAGON TICKET
	elseif msgcontains(msg, 'measurements') then
		if player:getStorageValue(Storage.postman.Mission07) >= 1 then
			npcHandler:say("Come on, I have no clue what they are. Better ask my armorer Kroox for such nonsense.Go and ask him for good ol' Lokurs measurements, he'll know.", cid)
		end
	end
	return true
end

keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'change'}, StdModule.say, {npcHandler = npcHandler, text = 'There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you\'d like to change 100 gold into 1 platinum, simply say \'{change gold}\' and then \'1 platinum\'.'})
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'advanced'}, StdModule.say, {npcHandler = npcHandler, text = 'Your bank account will be used automatically when you want to {rent} a house or place an offer on an item on the {market}. Let me know if you want to know about how either one works.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'functions'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'basic'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I work in this bank. I can change money for you and help you with your bank account.'})

npcHandler:setMessage(MESSAGE_GREET, 'How may I help you |PLAYERNAME|? Ask me for a {trade} if you want to buy something. I can also explain the {mail} system, sell {tickets} for the ore wagon service or give you access to your {bank} account.')
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back if you need my services, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back if you need my services, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here. Don't forget that you need to buy a label too if you want to send a parcel. Always write the name of the {receiver} in the first line.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
