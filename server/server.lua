ESX = nil
UnxPboy                 = GetCurrentResourceName()

TriggerEvent(Config['esx_routers']['server_shared_obj'], function(obj)
	ESX = obj
end)

RegisterServerEvent('takzobye-inventory:getOwnerAccessories')
AddEventHandler('takzobye-inventory:getOwnerAccessories', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local AccessoriesItems = {}

	-- Accessories Helmet meeta_accessory_inventory
	local Result_Helmet = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_helmet'
	})

	if Result_Helmet[1] then
		for k,v in pairs(Result_Helmet) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "helmet",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["helmet_1"],
				itemskin = skin["helmet_2"]
			})
		end
	end

	-- Accessories Mask
	local Result_Mask = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_mask'
	})

	if Result_Mask[1] then
		for k,v in pairs(Result_Mask) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "mask",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["mask_1"],
				itemskin = skin["mask_2"]
			})
		end
	end

	-- Accessories Glasses
	local Result_Glasses = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_glasses'
	})

	if Result_Glasses[1] then
		for k,v in pairs(Result_Glasses) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "glasses",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["glasses_1"],
				itemskin = skin["glasses_2"]
			})
		end
	end

	-- Accessories Earring
	local Result_Earring = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = 'player_ears'
	})

	if Result_Earring[1] then
		for k,v in pairs(Result_Earring) do
			local skin = json.decode(v.skin)
			table.insert(AccessoriesItems, {
				label = v.label,
				count = 1,
				limit = -1,
				type = "item_accessories",
				name = "earring",
				usable = true,
				rare = false,
				canRemove = false,
				itemnum = skin["ears_1"],
				itemskin = skin["ears_2"]
			})
		end
	end

	TriggerClientEvent("takzobye-inventory:setOwnerAccessories", _source, AccessoriesItems)

end)

RegisterServerEvent("takzobye-inventory:tradePlayerItem")
AddEventHandler("takzobye-inventory:tradePlayerItem",function(from, target, type, itemName, itemCount)
	local _source = from
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == "item_standard" then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
			else
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem(itemName, itemCount)

				local sendToDiscord = '' .. targetXPlayer.name .. ' ยึด ' .. sourceItem.label .. ' จาก ' .. sourceXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeItem', sendToDiscord, targetXPlayer.source, '^2')

				Citizen.Wait(100)
														
				local sendToDiscord2 = '' .. sourceXPlayer.name .. ' ถูกยึด ' .. sourceItem.label .. ' โดย ' .. targetXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeItem', sendToDiscord2, sourceXPlayer.source, '^3')
			end
		end
	elseif type == "item_money" then
		if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
			sourceXPlayer.removeMoney(itemCount)
			targetXPlayer.addMoney(itemCount)

			local sendToDiscord = '' .. targetXPlayer.name .. ' ยึด เงินสด จาก ' .. sourceXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
			TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeMoney', sendToDiscord, targetXPlayer.source, '^3')

			Citizen.Wait(100)
								
			local sendToDiscord2 = '' .. sourceXPlayer.name .. ' ถูกยึด เงินสด โดย ' .. targetXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
			TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeMoney', sendToDiscord2, sourceXPlayer.source, '^2')
		end
	elseif type == "item_account" then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney(itemName, itemCount)

			local sendToDiscord = '' .. targetXPlayer.name .. ' ยึด ' .. itemName .. ' จาก ' .. sourceXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
			TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeDirtyMoney', sendToDiscord, targetXPlayer.source, '^3')

			Citizen.Wait(100)
								
			local sendToDiscord2 = '' .. sourceXPlayer.name .. ' ถูกยึด ' .. itemName .. ' โดย ' .. targetXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
			TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeDirtyMoney', sendToDiscord2, sourceXPlayer.source, '^2')
		end
	elseif type == "item_weapon" then
		if not targetXPlayer.hasWeapon(itemName) then
			sourceXPlayer.removeWeapon(itemName)
			targetXPlayer.addWeapon(itemName, itemCount)

			local weaponLabel = ESX.GetWeaponLabel(itemName)
			
			if itemCount > 0 then
				local sendToDiscord = '' .. targetXPlayer.name .. ' ยึด ' .. weaponLabel .. ' จาก ' .. sourceXPlayer.name .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeWeapon', sendToDiscord, targetXPlayer.source, '^3')
			
				Citizen.Wait(100)
							
				local sendToDiscord2 = '' .. sourceXPlayer.name .. ' ถูกยึด ' .. weaponLabel .. ' โดย ' .. targetXPlayer.name .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeWeapon', sendToDiscord2, sourceXPlayer.source, '^2')
			else
				local sendToDiscord = '' .. targetXPlayer.name .. ' ยึด ' .. weaponLabel .. ' จาก ' .. sourceXPlayer.name .. '  จำนวน 1'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeWeapon', sendToDiscord, targetXPlayer.source, '^3')
			
				Citizen.Wait(100)
							
				local sendToDiscord2 = '' .. sourceXPlayer.name .. ' ถูกยึด ' .. weaponLabel .. ' โดย ' .. targetXPlayer.name .. ' จำนวน 1'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'SeizeWeapon', sendToDiscord2, sourceXPlayer.source, '^2')
			end
		end
	end
end)

ESX.RegisterServerCallback("takzobye-inventory:PoliceSearch", function(source, cb, target, data)
	local xPlayer = ESX.GetPlayerFromId(target)
	local Inventory = xPlayer.inventory

	if data == nil then
		if xPlayer ~= nil then
			cb({inventory = Inventory, money = xPlayer.getMoney(), accounts = xPlayer.accounts, weapons = xPlayer.loadout})
		else
			cb(nil)
		end
	else

		if data.vehicle == true then

			local Vehicle_Key = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier', {
				['@identifier'] = xPlayer.identifier
			})

			for i=1, #Vehicle_Key, 1 do
				table.insert(Inventory, {
					label = Vehicle_Key[i].plate,
					count = 1,
					limit = -1,
					type = "item_key",
					name = "key",
					usable = true,
					rare = false,
					canRemove = false
				})
			end
			
		end

		-- Accessories Helmet
		local Result_Helmet = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
			['@owner'] = xPlayer.identifier,
			['@type'] = 'player_helmet'
		})

		if Result_Helmet[1] then
			for k,v in pairs(Result_Helmet) do
				local skin = json.decode(v.skin)
				table.insert(Inventory, {
					label = v.label,
					count = 1,
					limit = -1,
					type = "item_accessories",
					name = "helmet",
					usable = true,
					rare = false,
					canRemove = false,
					itemnum = skin["helmet_1"],
					itemskin = skin["helmet_2"]
				})
			end
		end

		-- Accessories Mask
		local Result_Mask = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
			['@owner'] = xPlayer.identifier,
			['@type'] = 'player_mask'
		})

		if Result_Mask[1] then
			for k,v in pairs(Result_Mask) do
				local skin = json.decode(v.skin)
				table.insert(Inventory, {
					label = v.label,
					count = 1,
					limit = -1,
					type = "item_accessories",
					name = "mask",
					usable = true,
					rare = false,
					canRemove = false,
					itemnum = skin["mask_1"],
					itemskin = skin["mask_2"]
				})
			end
		end

		-- Accessories Glasses
		local Result_Glasses = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
			['@owner'] = xPlayer.identifier,
			['@type'] = 'player_glasses'
		})

		if Result_Glasses[1] then
			for k,v in pairs(Result_Glasses) do
				local skin = json.decode(v.skin)
				table.insert(Inventory, {
					label = v.label,
					count = 1,
					limit = -1,
					type = "item_accessories",
					name = "glasses",
					usable = true,
					rare = false,
					canRemove = false,
					itemnum = skin["glasses_1"],
					itemskin = skin["glasses_2"]
				})
			end
		end

		-- Accessories Earring
		local Result_Earring = MySQL.Sync.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
			['@owner'] = xPlayer.identifier,
			['@type'] = 'player_ears'
		})

		if Result_Earring[1] then
			for k,v in pairs(Result_Earring) do
				local skin = json.decode(v.skin)
				table.insert(Inventory, {
					label = v.label,
					count = 1,
					limit = -1,
					type = "item_accessories",
					name = "earring",
					usable = true,
					rare = false,
					canRemove = false,
					itemnum = skin["ears_1"],
					itemskin = skin["ears_2"]
				})
			end
		end

		if xPlayer ~= nil then
			cb({inventory = Inventory, money = xPlayer.getMoney(), accounts = xPlayer.accounts, weapons = xPlayer.loadout})
		else
			cb(nil)
		end
	end

end)

RegisterServerEvent('takzobye-inventory:black_money')
AddEventHandler('takzobye-inventory:black_money', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney('black_money', 0)
end)