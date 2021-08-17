carPlateList = {}
inCarList = {}

RegisterKeyMapping('pressf', 'pressf', 'keyboard', 'F')
RegisterCommand('pressf', function() 
    if GetVehiclePedIsIn(PlayerPedId(), false) > 0 then
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
        
        if not carPlateList[string.gsub(plate, ' ', '')] then
            TriggerServerEvent('takzobye-inventory:getCarKeys')
        end
    end
end, false)

RegisterNetEvent('takzobye-inventory:updateCarKeys')
AddEventHandler('takzobye-inventory:updateCarKeys', function(data)
    carKeys = data

    for k, v in ipairs(carKeys) do 
        carPlateList[string.gsub(v.plate, ' ', '')] = true
    end

    closeDisplay()
end)