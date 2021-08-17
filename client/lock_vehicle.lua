function lockVehicle(plate, type)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle
    local vehiclePlate

    -- Check Player in vehicle
    if (IsPedInAnyVehicle(playerPed, false)) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle = GetClosestVehicle(coords, 4.0, 0, 71)
    end
    
    vehiclePlate = GetVehicleNumberPlateText(vehicle)

    if (not vehiclePlate) then return end
    if (string.gsub(vehiclePlate, ' ', '') ~= string.gsub(plate, ' ', '')) and (type == 'key') then return end
    if (not carPlateList[string.gsub(vehiclePlate, ' ', '')]) and (type == 'keyboard') then return end

    print(vehiclePlate)

    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    if (lockStatus == 1) then
        SetVehicleDoorsLocked(vehicle, 2)
        TriggerEvent('chat:addMessage', { args = { 'Lock Car Status', '^2' .. vehiclePlate .. 'Locked' } })
    elseif (lockStatus == 2) then
        SetVehicleDoorsLocked(vehicle, 1)
        TriggerEvent('chat:addMessage', { args = { 'Lock Car Status', '^1' .. vehiclePlate .. 'Unlocked' } })
    end

    playLockAnim()
end

function playLockAnim()
    local prop = nil

    local playerPed = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local boneIndex = GetPedBoneIndex(playerPed, 64017)
    prop = CreateObject(GetHashKey("p_car_keys_01"), x, y, z , true, true, true)
    AttachEntityToEntity(prop, playerPed, boneIndex, 0, 0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    RequestAnimDict("anim@mp_player_intmenu@key_fob@")

    while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, "anim@mp_player_intmenu@key_fob@", "fob_click", 8.0, -8, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(900)
    DeleteObject(prop)
    ClearPedSecondaryTask(playerPed)
end


RegisterKeyMapping('pressk', 'pressk', 'keyboard', 'K')
RegisterCommand('pressk', function() 
    if (Config.LockCarWithKeyboard) then
        lockVehicle('', 'keyboard')
    end
end, false)