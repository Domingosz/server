local setOutfitExh = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
setOutfitExh:setParameter(CONDITION_PARAM_SUBID, 123456)
setOutfitExh:setParameter(CONDITION_PARAM_TICKS, 86400000)
setOutfitExh:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
setOutfitExh:setParameter(CONDITION_PARAM_HEALTHTICKS, 86400000)
local outfitList = {3378, 3375, 3373, 3372}


function onCastSpell(cid, var)
    local c = Creature(cid)
    local outfiter = math.random(1, #outfitList)
    local outfit = c:getOutfit()
    outfit.lookType = outfitList[outfiter]


    if not c:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 123456) then
        c:setOutfit(outfit)
        c:addCondition(setOutfitExh)
    end
end