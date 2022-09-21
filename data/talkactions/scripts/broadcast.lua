function onSay(player, words, param)
--	if not getPlayerFlagValue(player, PlayerFlag_CanBroadcast) then
	if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
		return true
	end

	print("> " .. player:getName() .. " broadcasted: \"" .. param .. "\".")
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendPrivateMessage(player, param, TALKTYPE_BROADCAST)
	end
	return false
end
