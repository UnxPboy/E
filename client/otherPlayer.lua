RegisterNetEvent("takzobye_mini-inventory:getOtherPlayerInventory")
AddEventHandler("takzobye_mini-inventory:getOtherPlayerInventory", function(player)
    OpenBodySearchMenu(player, true)
end)

RegisterNetEvent("esx_inventoryhud:openPlayerInventory")
AddEventHandler("esx_inventoryhud:openPlayerInventory", function(player)
    OpenBodySearchMenu(player, true)
end)

RegisterNUICallback("otherPlayerEvent", function(data, cb)
    TriggerServerEvent('takzobye_mini-inventory:confiscatePlayerItem', tonumber(data.player), data.item.type, data.item.name, tonumber(data.number), data.type)

    Wait(250)
    OpenBodySearchMenu(tonumber(data.player), false)

    cb("ok")
end)

function OpenBodySearchMenu(player, alreadyOpen)
    ESX.TriggerServerCallback('takzobye_mini-inventory:getOtherPlayerData', function(data)
        loadPlayerInventory()
        loadOtherInventory(data, player)
        if alreadyOpen then
            openDisplay('otherPlayer')
        end
    end, player)
end

function loadOtherInventory(data, player)

    if Config.Extended.Version == 'weight' then
        SendNUIMessage(
            {
                action = "setInfoText",
                type = 'otherPlayer',
                text = tostring(data.weight) .. '/' .. tostring(data.maxWeight) .. ' (' .. data.weight * 100 / data.maxWeight .. '%)',
                weight = data.weight,
                max = data.maxWeight
            }
        )
    end

    local itemList = {}

    for i = 1, #data.accounts, 1 do
        local item = data.accounts[i]

        if item.money > 0 then
            table.insert(itemList, {
                name = item.name,
                label = item.label,
                count = item.money,
                type = "item_account"
            })
        end
    end

    for i = 1, #data.inventory, 1 do
        local item = data.inventory[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(itemList, item)
        end
    end

    for i = 1, #data.weapons, 1 do
        local weapon = data.weapons[i]

        if data.weapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                itemList,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo or weapon.count,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage({
        action = 'setSecondInventoryItems',
        type = 'otherPlayer',
        info = player, 
        itemList = itemList
    })
end