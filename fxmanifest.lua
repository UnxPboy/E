fx_version 'cerulean'

game 'gta5'

ui_page 'nui/index.html'

client_scripts {
	'config.lua',
	'config.weapons.lua',

	'client/client.lua',
	'client/keys.lua',
	'client/lock_vehicle.lua',
	'client/otherPlayer.lua',
	'client/vehicle.lua',
	'client/vault.lua',
	"@xzero_trunk/export/trunk.lua",
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	
	'config.lua',
	'config.weapons.lua',

	'server/server.lua'
}

files {
	'nui/index.html',
	'nui/style.css',
	'config/config.js',
	'nui/*.js',
	'nui/image/items/*.png'
}