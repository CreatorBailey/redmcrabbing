VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("clout_crabs:hookcheck")
AddEventHandler("clout_crabs:hookcheck", function(trap)
	local _source = source
	local woodtrap = trap
	local pickaxe = VorpInv.getItemCount(_source, Config.Pickaxe)

	if pickaxe > 0 then
		TriggerClientEvent("clout_crabs:hookchecked", _source, woodtrap)
	else
		TriggerClientEvent("clout_crabs:nohook", _source)
		TriggerClientEvent("vorp:TipRight", _source, "You don't have a Hook", 2000)
	end
end)

function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end

RegisterServerEvent('clout_crabs:addItem')
AddEventHandler('clout_crabs:addItem', function()
	local _source = source
	local Character = VorpCore.getUser(_source).getUsedCharacter
	local chance =  math.random(1,5)
	local reward = {}
	for k,v in pairs(Config.Items) do 
		if v.chance >= chance then
			table.insert(reward,v)
		end
	end
	local chance2 = math.random(1,keysx(reward))
	TriggerEvent("vorpCore:canCarryItems", tonumber(_source), reward[chance2].amount, function(canCarry)
		TriggerEvent("vorpCore:canCarryItem", tonumber(_source), reward[chance2].name,reward[chance2].amount, function(canCarry2)
			if canCarry and canCarry2 then
				VorpInv.addItem(_source, reward[chance2].name, reward[chance2].amount)
				TriggerClientEvent("vorp:TipRight", _source, "You found "..reward[chance2].label, 3000)
			else
				TriggerClientEvent("vorp:TipRight", _source, "You can't carry any more "..reward[chance2].label, 3000)
			end
		end)
	end) 
end)