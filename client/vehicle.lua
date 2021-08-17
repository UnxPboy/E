trunkData = nil

RegisterNetEvent("esx_inventoryhud:openTrunkInventory")
AddEventHandler("esx_inventoryhud:openTrunkInventory", function(info, blackMoney, items, weapons)
    trunkData = info
    loadPlayerInventory()
    loadTrunkInventory(info, blackMoney, items, weapons) 
    openDisplay('trunk')
end)

RegisterNUICallback("PutIntoTrunk", function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end
    if not Refresh then
        Refresh = true
        -- if Config.disablePutTrunk[data.item.name] then
        --     exports.pNotify:SendNotification(
        --         {
        --             text = "ไม่สามารถใส่ของชิ้นนี้ได้",
        --             type = "error",
        --             timeout = 3000,
        --             layout = "bottomCenter",
        --             queue = "inventoryhud"
        --         }
        --     )
        --     return
        -- end
            
        local player = GetPlayerPed(-1)
        local dict = "mp_am_hold_up"
        
        RequestAnimDict(dict)
        while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
            
        TaskPlayAnim(player, dict, "purchase_beerbox_shopkeeper", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
            
        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            TriggerServerEvent("esx_trunk:putItem", trunkData.plate, data.item.type, data.item.name, count, trunkData.max, trunkData.myVeh, data.item.label)
        end

        Wait(250)
            -- loadPlayerInventory()
        RefreshTrunk(trunkData.plate,trunkData.max)
        Citizen.SetTimeout(1000, function()
            Refresh = false
        end)
    else
    end

    cb("ok")
end)

RegisterNUICallback(
    "TakeFromTrunk",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        if not Refresh then
            Refresh = true
            local player = GetPlayerPed(-1)
            local dict = "mp_am_hold_up"
        
            RequestAnimDict(dict)
            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
            
            TaskPlayAnim(player, dict, "purchase_beerbox_shopkeeper", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )

            if type(data.number) == "number" and math.floor(data.number) == data.number then
                TriggerServerEvent("esx_trunk:getItem", trunkData.plate, data.item.type, data.item.name, tonumber(data.number), trunkData.max, trunkData.myVeh)
            end

            Wait(250)
            -- loadPlayerInventory()
            RefreshTrunk(trunkData.plate,trunkData.max)
            Citizen.SetTimeout(1000, function()
                Refresh = false
            end)
        else
        end

        cb("ok")
    end
)

function loadTrunkInventory(info, blackMoney, items, weapons) 
    itemList = {}

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(itemList, accountData)
    end

    for i = 1, #items, 1 do

        local item = items[i]

        

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(itemList, item)
        end
    end

    for i = 1, #weapons, 1 do
        local weapon = weapons[i]

        if weapons[i].name ~= "WEAPON_UNARMED" then
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
        type = 'trunk',
        info = info, 
        itemList = itemList
        -- blackMoney = blackMoney, 
        -- items = items, 
        -- weapons = weapons
    })
end

function RefreshTrunk(plate,max)
    ESX.TriggerServerCallback("esx_trunk:getInventoryV", function(inventory)
		text = 'Test'--_U("trunk_info", plate, (inventory.weight / 1000), (max / 1000))
		data = {
            plate = plate,
            weight = inventory.weight,
            max = max,
            myVeh = myVeh,
            text = text
        }
        loadPlayerInventory()
        loadTrunkInventory(data, inventory.blackMoney, inventory.items, inventory.weapons)
    end, plate)
end