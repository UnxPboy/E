Config = {}

Config.DevFunction = false

Config.OpenKey = 'F2'

Config.LockCarWithKeyboard = true

Config.Extended = {
    Version = 'limit' -- limit / weight
}

Config.ShowCarKeys = false
Config.ShowAccessories = true
Config.IncludeCash = true
Config.IncludeAccounts = true

Config['esx_routers'] = {
    ['client_shared_obj'] = 'esx:getSharedObject',
    ['server_shared_obj'] = 'esx:getSharedObject',
    ['playerLoaded'] = 'esx:playerLoaded',
    ['useitem'] = 'esx:useItem',
    ['removeInventoryItem'] = 'esx:removeInventoryItem',
    ['giveInventoryItem'] = 'esx:giveInventoryItem'
}