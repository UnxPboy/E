RegisterNetEvent("monster_inventoryhud:openVaultInventory")
AddEventHandler(
    "monster_inventoryhud:openVaultInventory",
    function(data)
        setVaultInventoryData(data)
        openVaultInventory()
    end
)

function refreshVaultInventory()
    data = exports['monster_vault']:getMonsterVaultLicense()
    ESX.TriggerServerCallback(
        "monster_vault:getVaultInventory",
        function(inventory)
            setVaultInventoryData(inventory)
        end,
        data, true
    )
end

local vaultType

function setVaultInventoryData(inventory)
    items = {}

    SendNUIMessage(
        {
            action = "setInfoText",
            type = 'vault',
            text = inventory.job
        }
    )

    local blackMoney = inventory.blackMoney
    local vaultItems = inventory.items
    local vaultWeapons = inventory.weapons
    vaultType = inventory.job

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
        table.insert(items, accountData)
    end

    for i = 1, #vaultItems, 1 do
        local item = vaultItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #vaultWeapons, 1 do
        local weapon = vaultWeapons[i]

        if vaultWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(items, {
                label = ESX.GetWeaponLabel(weapon.name),
                count = weapon.ammo or weapon.count,
                limit = -1,
                weight = 0,
                type = "item_weapon",
                name = weapon.name,
                usable = false,
                rare = false,
                canRemove = false
            })
        end
    end

    SendNUIMessage({
        action = 'setSecondInventoryItems',
        type = 'vault',
        info = vaultType, 
        itemList = items
        -- blackMoney = blackMoney, 
        -- items = vaultItems, 
        -- weapons = vaultWeapons
    })

    -- SendNUIMessage(
    --     {
    --         action = "setSecondInventoryItems",
    --         itemList = items
    --     }
    -- )
end

function openVaultInventory()
    loadPlayerInventory()
    isInInventory = true

    openDisplay('vault')
    SetNuiFocus(true, true)
end

RegisterNUICallback("PutIntoVault", function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then return end

    if type(data.number) == "number" and math.floor(data.number) == data.number then
        local count = tonumber(data.number)

        if data.item.type == "item_weapon" then
            count =
                GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            TriggerServerEvent("monster_vault:putItem", --[[ESX.GetPlayerData().identifier,--]]
                               vaultType, data.item.type, data.item.name, count)
        --[[ elseif data.item.name == "phone" then
            exports.pNotify:SendNotification(
                {
                    text = "ห้ามเก็บโทรศัพท์ในตู้เซฟนะ",
                    type = "error",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "inventoryhud"
                }) ]]
        else
            TriggerServerEvent("monster_vault:putItem", --[[ESX.GetPlayerData().identifier,--]]
                               vaultType, data.item.type, data.item.name, count)
        end

    end

    Wait(150)
    refreshVaultInventory()
    Wait(150)
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback("TakeFromVault", function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then return end

    if type(data.number) == "number" and math.floor(data.number) == data.number then
        TriggerServerEvent("monster_vault:getItem", --[[ESX.GetPlayerData().identifier,--]]
                           vaultType, data.item.type, data.item.name,
                           tonumber(data.number))
    end

    Wait(150)
    refreshVaultInventory()
    Wait(150)
    loadPlayerInventory()

    cb("ok")
end)
