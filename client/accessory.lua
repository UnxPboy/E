ACCESSOTY_INVENTORY = function(data)
    local player = GetPlayerPed(-1)
    if string.find(data.name, "helmet") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["helmet_1"] == -1 then

                local dict = "veh@bicycle@roadfront@base"
                local anim = "put_on_helmet"
    
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                
                TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
    
                Wait(1000)

                local accessorySkin = {}
                accessorySkin['helmet_1'] = data.itemnum
                accessorySkin['helmet_2'] = data.itemskin

                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "veh@bike@common@front@base"
                    local anim = "take_off_helmet_walk"

                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['helmet_1'] = -1
                accessorySkin['helmet_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)
    elseif string.find(data.name, "mask") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["mask_1"] == -1 then

                local dict = "veh@bicycle@roadfront@base"
                local anim = "put_on_helmet"
    
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                
                TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
    
                Wait(1000)

                local accessorySkin = {}
                accessorySkin['mask_1'] = data.itemnum
                accessorySkin['mask_2'] = data.itemskin
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "veh@bike@common@front@base"
                    local anim = "take_off_helmet_walk"

                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['mask_1'] = -1
                accessorySkin['mask_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)
    elseif string.find(data.name, "bags") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["bags_1"] == -1 then

                local dict = "veh@bicycle@roadfront@base"
                local anim = "put_on_helmet"
    
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                
                TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
    
                Wait(1000)

                local accessorySkin = {}
                accessorySkin['bags_1'] = data.itemnum
                accessorySkin['bags_2'] = data.itemskin
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "veh@bike@common@front@base"
                    local anim = "take_off_helmet_walk"

                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['bags_1'] = -1
                accessorySkin['bags_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)
    elseif string.find(data.name, "watch") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["watches_1"] == -1 then

                local dict = "veh@bicycle@roadfront@base"
                local anim = "put_on_helmet"
    
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                
                TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
    
                Wait(1000)

                local accessorySkin = {}
                accessorySkin['watches_1'] = data.itemnum
                accessorySkin['watches_2'] = data.itemskin
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "veh@bike@common@front@base"
                    local anim = "take_off_helmet_walk"

                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['watches_1'] = -1
                accessorySkin['watches_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)
    elseif string.find(data.name, "glasses") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["glasses_1"] == -1 then

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "clothingspecs"
                    local anim = "try_glasses_positive_a"
        
                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['glasses_1'] = data.itemnum
                accessorySkin['glasses_2'] = data.itemskin
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

                ClearPedTasks(player)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "clothingspecs"
                    local anim = "take_off"
        
                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(1000)
                end

                local accessorySkin = {}
                accessorySkin['glasses_1'] = -1
                accessorySkin['glasses_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)
    elseif string.find(data.name, "earring") then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin["ears_1"] == -1 then

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "mini@ears_defenders"
                    local anim = "takeoff_earsdefenders_idle"
        
                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['ears_1'] = data.itemnum
                accessorySkin['ears_2'] = data.itemskin
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            else

                if IsPedInAnyVehicle(PlayerPedId(), true) == false then
                    local dict = "mini@ears_defenders"
                    local anim = "takeoff_earsdefenders_idle"
        
                    RequestAnimDict(dict)
                    while (not HasAnimDictLoaded(dict)) do Citizen.Wait(0) end
                    
                    TaskPlayAnim(player, dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
        
                    Wait(800)
                end

                local accessorySkin = {}
                accessorySkin['ears_1'] = -1
                accessorySkin['ears_2'] = 0
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end
            
        end)

    end
end