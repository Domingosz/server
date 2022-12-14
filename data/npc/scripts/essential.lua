local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'empty pokeball'}, 26662, 1, 1, 'empty pokeball')
shopModule:addBuyableItem({'empty greatball'}, 26660, 2, 1, 'empty greatball')
shopModule:addBuyableItem({'empty superball'}, 26659, 4, 1, 'empty superball')
shopModule:addBuyableItem({'empty ultraball'}, 26688, 12, 1, 'empty ultraball')

--shopModule:addBuyableItem({'antidote potion'}, 8474, 5, 1, 'antidote potion')

shopModule:addBuyableItem({'ultimate potion'}, 27646, 6, 1, 'ultimate potion')
shopModule:addBuyableItem({'revive'}, 27645, 10, 1, 'revive')


shopModule:addSellableItem({'bag of pollem'}, 27658, 40, 1, 'bag of pollem')
shopModule:addSellableItem({'magikarp fin'}, 27658, 3, 1, 'magikarp fin')
shopModule:addSellableItem({'band aid'}, 27658, 1, 1, 'band aid')
shopModule:addSellableItem({'bird beak'}, 27680, 30, 1, 'bird beak')
shopModule:addSellableItem({'bitten apple'}, 27681, 5, 1, 'bitten apple')
shopModule:addSellableItem({'bottle of poison'}, 27672, 1, 1, 'bottle of poison')
shopModule:addSellableItem({'bug gosme'}, 27672, 1, 1, 'bug gosme')
shopModule:addSellableItem({'comb'}, 27687, 100, 1, 'comb')
shopModule:addSellableItem({'dark gem'}, 27687, 1, 1, 'dark gem')
shopModule:addSellableItem({'dragon scale'}, 27687, 1, 1, 'dragon scale')
shopModule:addSellableItem({'dragon tooth'}, 27667, 610, 1, 'dragon tooth')
shopModule:addSellableItem({'earth ball'}, 27667, 1, 1, 'earth ball')
shopModule:addSellableItem({'electric box'}, 27684, 20, 1, 'electric box')
shopModule:addSellableItem({'enchanted gem'}, 27684, 1, 1, 'enchanted gem')
shopModule:addSellableItem({'essence of fire'}, 27669, 1, 1, 'essence of fire')
shopModule:addSellableItem({'feather'}, 27706, 40, 1, 'feather')
shopModule:addSellableItem({'fur'}, 27689, 13, 1, 'fur')
shopModule:addSellableItem({'future orb'}, 27700, 400, 1, 'future orb')
shopModule:addSellableItem({'ghost essence'}, 27700, 1, 1, 'ghost essence')
shopModule:addSellableItem({'horn'}, 27685, 25, 1, 'horn')
shopModule:addSellableItem({'ice orb'}, 27707, 33, 1, 'ice orb')
shopModule:addSellableItem({'leaves'}, 27660, 10, 1, 'leaves')
shopModule:addSellableItem({'nail'}, 27665, 10, 1, 'nail')
shopModule:addSellableItem({'piece of steel'}, 27651, 1, 1, 'piece of steel')
shopModule:addSellableItem({'pot of lava'}, 27656, 18, 1, 'pot of lava')
shopModule:addSellableItem({'pot of moss bug'}, 27679, 40, 1, 'pot of moss bug')
shopModule:addSellableItem({'rubber ball'}, 27679, 1, 1, 'rubber ball')
shopModule:addSellableItem({'ruby'}, 27695, 100, 1, 'ruby')
shopModule:addSellableItem({'sandbag'}, 27695, 15, 1, 'sandbag')
shopModule:addSellableItem({'screw'}, 27671, 1, 1, 'screw')
shopModule:addSellableItem({'seed'}, 27670, 1, 1, 'seed')
shopModule:addSellableItem({'small stone'}, 27670, 1, 1, 'small stone')
shopModule:addSellableItem({'snowball'}, 27670, 1, 1, 'snowball')
shopModule:addSellableItem({'stone orb'}, 27702, 400, 1, 'stone orb')
shopModule:addSellableItem({'straw'}, 27719, 1, 1, 'straw')
shopModule:addSellableItem({'tooth'}, 27683, 8, 1, 'tooth')
shopModule:addSellableItem({'water gem'}, 27668, 1, 1, 'water gem')
shopModule:addSellableItem({'water pendant'}, 27678, 10, 1, 'water pendant')
shopModule:addSellableItem({'armadillo claw'}, 27775, 147, 1, 'armadillo claw')
shopModule:addSellableItem({'bat wing'}, 27690, 78, 1, 'bat wing')
shopModule:addSellableItem({'bear paw'}, 27776, 204, 1, 'bear paw')
shopModule:addSellableItem({'bee sting'}, 27777, 54, 1, 'bee sting')
shopModule:addSellableItem({'belt of champion'}, 27701, 1000, 1, 'belt of champion')
shopModule:addSellableItem({'blue ball'}, 27721, 147, 1, 'blue ball')
shopModule:addSellableItem({'blue vines'}, 27673, 123, 1, 'blue vines')
shopModule:addSellableItem({'bone'}, 27714, 123, 1, 'bone')
shopModule:addSellableItem({'branch of stone'}, 27724, 180, 1, 'branch of stone')
shopModule:addSellableItem({'brush'}, 27724, 90, 1, 'brush')
shopModule:addSellableItem({'bug antenna'}, 27691, 96, 1, 'bug antenna')
shopModule:addSellableItem({'bug venom'}, 27692, 371, 1, 'bug venom')
shopModule:addSellableItem({'bulb'}, 27659, 132, 1, 'bulb')
shopModule:addSellableItem({'bull tail'}, 27820, 102, 1, 'bull tail')
shopModule:addSellableItem({'cat ear'}, 27779, 123, 1, 'cat ear')
shopModule:addSellableItem({'colored feather'}, 27779, 168, 1, 'colored feather')
shopModule:addSellableItem({'cow tail'}, 27782, 180, 1, 'cow tail')
shopModule:addSellableItem({'crab claw'}, 27713, 90, 1, 'crab claw')
shopModule:addSellableItem({'dark beak'}, 27783, 123, 1, 'dark beak')
shopModule:addSellableItem({'butterfly wing'}, 27760, 66, 1, 'butterfly wing')
shopModule:addSellableItem({'dodrio feather'}, 27785, 102, 1, 'dodrio feather')
shopModule:addSellableItem({'dog ears'}, 27801, 147, 1, 'dog ears')
shopModule:addSellableItem({'dome fossil'}, 27657, 8000, 1, 'dome fossil')
shopModule:addSellableItem({'dragon tail'}, 27747, 450, 1, 'dragon tail')
shopModule:addSellableItem({'egg shell'}, 27786, 1000, 1, 'egg shell')
shopModule:addSellableItem({'electric rat tail'}, 27734, 132, 1, 'electric rat tail')
shopModule:addSellableItem({'electric tail'}, 27677, 1000, 1, 'electric tail')
shopModule:addSellableItem({'elephant foot'}, 27787, 180, 1, 'elephant foot')
shopModule:addSellableItem({"farfetch'd stick"}, 27705, 300, 1, "farfetch'd stick")
shopModule:addSellableItem({'female ear'}, 27802, 147, 1, 'female ear')
shopModule:addSellableItem({'fire ear'}, 27788, 135, 1, 'fire ear')
shopModule:addSellableItem({'fire horse foot'}, 27789, 114, 1, 'fire horse foot')
shopModule:addSellableItem({'fire tail'}, 27780, 132, 1, 'fire tail')
shopModule:addSellableItem({'fish fin'}, 27780, 78, 1, 'fish fin')
shopModule:addSellableItem({'fox tail'}, 27780, 1000, 1, 'fox tail')
shopModule:addSellableItem({'gem star'}, 27790, 78, 1, 'gem star')
shopModule:addSellableItem({'giant bat wing'}, 27761, 180, 1, 'giant bat wing')
shopModule:addSellableItem({'giant fin'}, 27761, 180, 1, 'giant fin')
shopModule:addSellableItem({'giant piece of fur'}, 27791, 180, 1, 'giant piece of fur')
shopModule:addSellableItem({'giant ruby'}, 27778, 200, 1, 'giant ruby')
shopModule:addSellableItem({'gift bag'}, 27778, 90, 1, 'gift bag')
shopModule:addSellableItem({'gligar claw'}, 27792, 90, 1, 'gligar claw')
shopModule:addSellableItem({'gosme'}, 27708, 78, 1, 'gosme')
shopModule:addSellableItem({'great petals'}, 27793, 132, 1, 'great petals')
shopModule:addSellableItem({'gyarados tail'}, 27652, 800, 1, 'gyarados tail')
shopModule:addSellableItem({'helicopter leaves'}, 27652, 69, 1, 'helicopter leaves')
shopModule:addSellableItem({'helix fossil'}, 27661, 8000, 1, 'helix fossil')
shopModule:addSellableItem({'horn drill'}, 27794, 168, 1, 'horn drill')
shopModule:addSellableItem({'hot fur'}, 27795, 132, 1, 'hot fur')
shopModule:addSellableItem({'ice bra'}, 27795, 1000, 1, 'ice bra')
shopModule:addSellableItem({'insect claw'}, 27796, 180, 1, 'insect claw')
shopModule:addSellableItem({'insect tail'}, 27796, 114, 1, 'insect tail')
shopModule:addSellableItem({'iron bracelet'}, 27796, 114, 1, 'iron bracelet')
shopModule:addSellableItem({'kanga ear'}, 27797, 180, 1, 'kanga ear')
shopModule:addSellableItem({'karate duck'}, 27697, 123, 1, 'karate duck')
shopModule:addSellableItem({'kick machine'}, 27715, 135, 1, 'kick machine')
shopModule:addSellableItem({'ladybug wing'}, 27798, 78, 1, 'ladybug wing')
shopModule:addSellableItem({'linearly guided hypnose'}, 27712, 410, 1, 'linearly guided hypnose')
shopModule:addSellableItem({'lizard tail'}, 27712, 450, 1, 'lizard tail')
shopModule:addSellableItem({'locksmith of shell'}, 27709, 24, 1, 'locksmith of shell')
shopModule:addSellableItem({'luck medallion'}, 27693, 1000, 1, 'luck medallion')
shopModule:addSellableItem({'magma foot'}, 27806, 1000, 1, 'magma foot')
shopModule:addSellableItem({'magnet'}, 27704, 90, 1, 'magnet')
shopModule:addSellableItem({'male ear'}, 27803, 147, 1, 'male ear')
shopModule:addSellableItem({'microphone'}, 27723, 147, 1, 'microphone')
shopModule:addSellableItem({'mimic clothes'}, 27674, 450, 1, 'mimic clothes')
shopModule:addSellableItem({'miss traces'}, 27799, 310, 1, 'miss traces')
shopModule:addSellableItem({'monkey paw'}, 27755, 90, 1, 'monkey paw')
shopModule:addSellableItem({'mushroom'}, 27755, 114, 1, 'mushroom')
shopModule:addSellableItem({'old amber'}, 27663, 10000, 1, 'old amber')
shopModule:addSellableItem({'onix tail'}, 27711, 371, 1, 'onix tail')
shopModule:addSellableItem({'owl feather'}, 27804, 147, 1, 'owl feather')
shopModule:addSellableItem({'piece of coral'}, 27807, 114, 1, 'piece of coral')
shopModule:addSellableItem({'piece of diglett'}, 27800, 78, 1, 'piece of diglett')
shopModule:addSellableItem({'piece of shell'}, 27808, 147, 1, 'piece of shell')
shopModule:addSellableItem({'pinsir horn'}, 27650, 102, 1, 'pinsir horn')
shopModule:addSellableItem({'plant foot'}, 27805, 123, 1, 'plant foot')
shopModule:addSellableItem({'plant tail'}, 27809, 114, 1, 'plant tail')
shopModule:addSellableItem({'point of light'}, 27809, 114, 1, 'point of light')
shopModule:addSellableItem({'psychic spoon'}, 27699, 180, 1, 'psychic spoon')
shopModule:addSellableItem({'psyduck mug'}, 27696, 129, 1, 'psyduck mug')
shopModule:addSellableItem({'punch machine'}, 27698, 135, 1, 'punch machine')
shopModule:addSellableItem({'rat tail'}, 27682, 54, 1, 'rat tail')
shopModule:addSellableItem({'red scale'}, 27769, 132, 1, 'red scale')
shopModule:addSellableItem({'red wing'}, 27811, 114, 1, 'red wing')
shopModule:addSellableItem({'reindeer horn'}, 27726, 123, 1, 'reindeer horn')
shopModule:addSellableItem({'scizor claw'}, 27812, 2000, 1, 'scizor claw')
shopModule:addSellableItem({'scythe'}, 27675, 1000, 1, 'scythe')
shopModule:addSellableItem({'seahorse tail'}, 27813, 204, 1, 'seahorse tail')
shopModule:addSellableItem({'seal tail'}, 27781, 147, 1, 'seal tail')
shopModule:addSellableItem({'sheep wool'}, 27814, 132, 1, 'sheep wool')
shopModule:addSellableItem({'slow tail'}, 27703, 225, 1, 'slow tail')
shopModule:addSellableItem({'small shell'}, 27731, 69, 1, 'small shell')
shopModule:addSellableItem({'small tail'}, 27815, 123, 1, 'small tail')
shopModule:addSellableItem({'small wings'}, 27815, 69, 1, 'small wings')
shopModule:addSellableItem({'snake tail'}, 27810, 78, 1, 'snake tail')
shopModule:addSellableItem({'spider legs'}, 27816, 78, 1, 'spider legs')
shopModule:addSellableItem({'spin machine'}, 27816, 135, 1, 'spin machine')
shopModule:addSellableItem({'squirrel tail'}, 27772, 78, 1, 'squirrel tail')
shopModule:addSellableItem({'squirtle hull'}, 27666, 132, 1, 'squirtle hull')
shopModule:addSellableItem({'steel wings'}, 27730, 192, 1, 'steel wings')
shopModule:addSellableItem({'steelix tail'}, 27725, 2000, 1, 'steelix tail')
shopModule:addSellableItem({'sticky hand'}, 27817, 120, 1, 'sticky hand')
shopModule:addSellableItem({'strange antenna'}, 27817, 180, 1, 'strange antenna')
shopModule:addSellableItem({'strange bone'}, 27664, 180, 1, 'strange bone')
shopModule:addSellableItem({'strange feather'}, 27774, 168, 1, 'strange feather')
shopModule:addSellableItem({'strange flower'}, 27752, 114, 1, 'strange flower')
shopModule:addSellableItem({'strange rock'}, 27818, 159, 1, 'strange rock')
shopModule:addSellableItem({'strange spike'}, 27819, 135, 1, 'strange spike')
shopModule:addSellableItem({'strange tail'}, 27756, 180, 1, 'strange tail')
shopModule:addSellableItem({'strange thing'}, 27756, 147, 1, 'strange thing')
shopModule:addSellableItem({'streak tail'}, 27756, 180, 1, 'streak tail')
shopModule:addSellableItem({'tentacle'}, 27735, 159, 1, 'tentacle')
shopModule:addSellableItem({'tongue'}, 27716, 410, 1, 'tongue')
shopModule:addSellableItem({'topknot'}, 27716, 147, 1, 'topknot')
shopModule:addSellableItem({'traces of ghost'}, 27710, 180, 1, 'traces of ghost')
shopModule:addSellableItem({'tusk'}, 27710, 180, 1, 'tusk')
shopModule:addSellableItem({'venom flute'}, 27717, 78, 1, 'venom flute')
shopModule:addSellableItem({'wool ball'}, 27694, 69, 1, 'wool ball')
shopModule:addSellableItem({'wooper horn'}, 27821, 147, 1, 'wooper horn')
shopModule:addSellableItem({'yellow flower'}, 27727, 114, 1, 'yellow flower')

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		local vocationId = player:getVocation():getId()
		if vocationId == 0 then
			selfSay('So you ask me for a {' .. ItemType(items[vocationId]):getName() .. '} to begin your advanture?', cid)
			npcHandler.topic[cid] = 1
		else
			selfSay('Sorry, you don\'t need this.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(8922, 1)
			selfSay('Here you are young adept, take care yourself.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		selfSay('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
