local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 7.3) + 42
	local max = (level / 5) + (maglevel * 12.4) + 90
	return min, max
--	return 1000, 1000
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end



--function onCastSpell(creature, variant)
--
--	local monsterType = MonsterType(creature:getName())
--	local damage = creature:getTotalMagicAttack() 

--	spellCallback(creature:getId(), creature:getPosition(), damage, countStart, countStart)
--
--	doTargetCombatHealth(creature, target, COMBAT_DEATHDAMAGE, -damage, -damage, CONST_ME_MORTAREA)
--	return true
--end
