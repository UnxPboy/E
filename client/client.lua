ESX = nil
isInInventory       = false
local useWeapon = false
carKeys = {}
accessoryItems = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterKeyMapping('openInventory', 'Open inventory', 'keyboard', Config.OpenKey)

RegisterCommand('openInventory', function()
    openInventory()
end, false)

RegisterCommand('b', function() closeInventory() end, false)

RegisterKeyMapping('QS1', 'Quick Slot 1', 'keyboard', '1')
RegisterKeyMapping('QS2', 'Quick Slot 2', 'keyboard', '2')
RegisterKeyMapping('QS3', 'Quick Slot 3', 'keyboard', '3')
RegisterKeyMapping('QS4', 'Quick Slot 4', 'keyboard', '4')
RegisterKeyMapping('QS5', 'Quick Slot 5', 'keyboard', '5')

RegisterCommand('QS1', function() useQuickSlot(1) end, false)
RegisterCommand('QS2', function() useQuickSlot(2) end, false)
RegisterCommand('QS3', function() useQuickSlot(3) end, false)
RegisterCommand('QS4', function() useQuickSlot(4) end, false)
RegisterCommand('QS5', function() useQuickSlot(5) end, false)

function useQuickSlot(key)
    SendNUIMessage({
        action = "useQuickSlot",
        key = key
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        DisableControlAction(0, 157, true)
        DisableControlAction(0, 158, true)
        DisableControlAction(0, 160, true)
        DisableControlAction(0, 164, true)
        DisableControlAction(0, 165, true)
    end
end)

function openInventory()
    loadPlayerInventory()
    openDisplay('player')
    isInInventory = true
end

function loadPlayerInventory()

    if Config.Extended.Version == 'limit' then 
        loadPlayerInventoryLimit()
        return
    end

    local playerData = ESX.GetPlayerData()
    local playerPed = PlayerPedId()

    local items = {}
    local weight = 0
    local slot = 0
    local maxWeight = 0

    maxWeight = playerData.maxWeight

    if (Config.Extended.Version == 'limit') then
        if playerData.money > 0 then
            table.insert(items, {
                label     = 'เงิน',
                count     = playerData.money,
                type      = 'item_money',
                name      = "cash",
                usable    = false,
                rare      = false,
                canRemove = true,
            })
        end
    end

    for k,v in ipairs(playerData.accounts) do 
        if (v.name ~= 'bank' and v.money > 0) then
            table.insert(items, {
                label     = v.label,
                count     = v.money,
                type      = 'item_account',
                name      = v.name,
                usable    = false,
                rare      = false,
                canRemove = true,
            })
        end
    end

    weight = getInventory(items, weight)
    getCarKeys(items)
    -- getAccessories(items)
    getWeapons(items)

    SendNUIMessage({
        action = "setInfoText",
        type = 'player',
        weight = weight,
        max = maxWeight
    })

    SendNUIMessage({
        action = 'loadInventory',
        type = 'player',
        items = items
    })
end

function loadPlayerInventoryLimit()

    local playerData = ESX.GetPlayerData()
    local playerPed = PlayerPedId()
    local PlayerData = ESX.PlayerData
    local money = playerData["money"]
    local accounts = PlayerData["accounts"]
    local items = {}
    local weight = 0

    if Config["IncludeCash"] and money ~= nil and money > 0 then
        moneyData = {
            label = "Cash",
            name = "cash",
            type = "item_money",
            count = money,
            usable = false,
            rare = false,
            limit = -1,
            canRemove = true
        }

        table.insert(items, moneyData)
    end

    if Config["IncludeAccounts"] and ESX.PlayerData.accounts ~= nil then
        for key, value in pairs(ESX.PlayerData.accounts) do
            -- if not INVENTORY_ACCOUNT_SKIP(ESX.PlayerData.accounts[key].name) then
                if ESX.PlayerData.accounts[key].money > 0 then
                    accountData = {
                        label = ESX.PlayerData.accounts[key].label,
                        count = ESX.PlayerData.accounts[key].money,
                        type = "item_account",
                        name = ESX.PlayerData.accounts[key].name,
                        usable = false,
                        rare = false,
                        limit = -1,
                        canRemove = true
                    }
                    table.insert(items, accountData)
                end
            -- end
        end
    end

    getInventory(items)
    getCarKeys(items)
    getAccessories(items)
    getWeapons(items)

    SendNUIMessage({
        action = "setInfoText",
        type = 'player',
        text = 'limit'
    })

    SendNUIMessage({
        action = 'loadInventory',
        type = 'player',
        items = items
    })

end

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    for k,v in ipairs(ESX.PlayerData.accounts) do
        if 'black_money' == account.name then
            ESX.PlayerData.accounts[k] = account
            break
        end
    end

    if isInInventory then
		loadPlayerInventoryLimit()
	end
end)

INVENTORY_ACCOUNT_SKIP = function(accountName)
    for index, value in ipairs({"bank","cash"}) do
        if value == accountName then
            return true
        end
    end
    return false
end

function getInventory(items)
    local totalWeight = 0

    for k,v in ipairs(ESX.GetPlayerData().inventory) do
        if (v.count > 0) then
            local itemWeight = v.weight or 0
            table.insert(items, {
                name = v.name,
                label = v.label,
                type = 'item_standard',
                count = v.count,
                weight = itemWeight,
                limit = v.limit or 0,
                usable = v.usable
            })

            totalWeight = totalWeight + (itemWeight * v.count)
        end
    end

    return totalWeight
end

function getCarKeys(items)
    if carKeys ~= nil and Config.ShowCarKeys then
        for i = 1, #carKeys, 1 do
            table.insert(items, {
                label = carKeys[i].plate,
                count = 1,
                weight = 0,
                limit = -1,
                type = "item_key",
                name = "key",
                usable = false,
                rare = false,
                canRemove = false
            })
        end
    end
end

function getAccessories(items)
    if Accessory_Items ~= nil and Config.ShowAccessories then
        for i=1, #Accessory_Items, 1 do
            table.insert(items, {
                label = Accessory_Items[i].label,
                count = 1,
                weight = 0,
                limit = -1,
                type = "item_accessories",
                name = Accessory_Items[i].name,
                usable = true,
                rare = false,
                canRemove = false,
                itemNum = Accessory_Items[i].itemNum,
                itemSkin = Accessory_Items[i].itemSkin
            })
        end
    end
end

function getWeapons(items)
    local playerPed = PlayerPedId()
    local weaponsList = ESX.GetWeaponList()
    for i=1, #weaponsList, 1 do
        local weaponHash = GetHashKey(weaponsList[i].name)
        if HasPedGotWeapon(playerPed, weaponHash, false) and weaponsList[i].name ~= 'WEAPON_UNARMED' then
            local ammo, label = GetAmmoInPedWeapon(playerPed, weaponHash)
            table.insert(items, {
                name = weaponsList[i].name,
                label = weaponsList[i].label,
                count = ammo,
                type = 'item_weapon',
                value = weaponsList[i].name,
                usable = true,
                rare = false,
                ammo = ammo,
                canGiveAmmo = (weaponsList[i].ammo ~= nil),
                canRemove = true
            })
        end
    end
end

function openDisplay(type)
    TriggerScreenblurFadeIn()
    SendNUIMessage({
        action = 'openDisplay',
        type = type
    })
    SetNuiFocus(true, true)
end

function closeInventory()
    closeDisplay()
    isInInventory = false
end

function closeDisplay()
    SendNUIMessage({
        action = 'closeDisplay',
        type = 'notype'
    })

    TriggerScreenblurFadeOut()
    SetNuiFocus(false, false)
end

RegisterNUICallback("useItem", function(data, cb)

    if data.item.type == 'item_weapon' then
        if useWeapon == data.item.name then
            useWeapon = false
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
        else
            useWeapon = data.item.name
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey(data.item.name), true)
        end
    elseif data.item.type == 'item_key' then
        lockVehicle(data.item.label, 'key')
    elseif data.item.type == 'item_accessories' then
        useAccessory(data)
    else
        TriggerServerEvent("esx:useItem", data.item.name)
    end

    Wait(250)

    if data.close then
        closeInventory()
    else
        loadPlayerInventory()
    end

    cb("ok")
end)

RegisterNUICallback("cancleWeapon", function(data, cb)
    useWeapon = false
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)

    cb("ok")
end)

function useAccessory(data)
    TriggerEvent('skinchanger:getSkin', function(skin)

        local accessorySkin = {}
        local playerPed = PlayerPedId()
        local skin1 = data.item.name .. '_1'
        local skin2 = data.item.name .. '_2'
        local dict, anim

        if data.item.name == "helmet" or data.item.name == "mask" then
            if skin[skin1] == -1 then
                dict = "veh@bicycle@roadfront@base"
                anim = "put_on_helmet"
            else
                dict = "veh@bike@common@front@base"
                anim = "take_off_helmet_walk"
            end
        elseif data.item.name == "glasses" then
            dict = "clothingspecs"
            if skin[skin1] == -1 then
                anim = "try_glasses_positive_a"
            else
                anim = "take_off"
            end
        elseif data.item.name == "ears" then
            anim = "takeoff_earsdefenders_idle"
            dict = "mini@ears_defenders"
        end

        if not IsPedInAnyVehicle(playerPed, true) then
            RequestAnimDict(dict)
            while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
            
            TaskPlayAnim(playerPed, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )

            Wait(1000)
        end

        if skin[skin1] == -1 then
            accessorySkin[skin1] = data.item.itemNum
            accessorySkin[skin2] = data.item.itemSkin
            TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

        else
            accessorySkin[skin1] = -1
            accessorySkin[skin2] = 0
            TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

        end

    end)
end

RegisterNUICallback("giveItem", function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 2.0)
    local foundPlayer = false
    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            if GetPlayerServerId(players[i]) == data.player then
                foundPlayer = true
            end
        end
    end

    if foundPlayer then
        if (data.item.type == 'item_key') then
            TriggerServerEvent("takzobye-inventory:giveCarKeys", data.player, data.item.label)
            return
        else
            TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, data.number)
        end

        Wait(250)
        loadPlayerInventory()
    end

    cb("ok")
end)

RegisterNUICallback("dropItem", function(data, cb)

    TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
    Wait(250)
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback("refreshInventory", function(data, cb)
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback('closeDisplay', function(data, cb)

    closeDisplay()

    cb("ok")
end)

RegisterNUICallback("closeInventory", function(data, cb)
    closeDisplay()

    cb("ok")
end)

RegisterNUICallback("Notify", function(data, cb)
    TriggerEvent("pNotify:SendNotification", {text = "<span style='font-weight: 900'>" .. data.text .. "</span>",
        layout = "centerLeft",
        timeout = 2000,
        progressBar = false,
        type = "error"
    })
    cb("ok")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    -- TriggerServerEvent('takzobye-inventory:getCarKeys')
    -- TriggerServerEvent('takzobye-inventory:getAccessories')
    if Config.ShowAccessories then
        TriggerServerEvent("takzobye-inventory:getOwnerAccessories")  
    end
    if Config["IncludeAccounts"] then
        TriggerServerEvent("takzobye-inventory:black_money")
    end
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent("takzobye-inventory:setOwnerAccessories")
AddEventHandler("takzobye-inventory:setOwnerAccessories", function(result)
    Accessory_Items = result
end)

RegisterNetEvent("takzobye-inventory:getOwnerAccessories")
AddEventHandler("takzobye-inventory:getOwnerAccessories",function()
    TriggerServerEvent("takzobye-inventory:getOwnerAccessories")
end)