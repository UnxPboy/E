Locales = {}

function _(str, ...)  -- Translate string

	if Locales['en'] ~= nil then

		if Locales['en'][str] ~= nil then
			return string.format(Locales['en'][str], ...)
		else
			return 'Translation [' .. 'en' .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [en] does not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end

Locales['en'] = {
	-- Inventory
	['inventory'] = 'inventory %s / %s',
	['use'] = 'use',
	['give'] = 'give',
	['remove'] = 'throw',
	['return'] = 'return',
	['give_to'] = 'give to',
	['amount'] = 'amount',
	['giveammo'] = 'give ammo',
	['amountammo'] = 'amount of ammo',
	['noammo'] = 'you do not have enough ammo!',
	['gave_item'] = 'you gave ~y~%sx~s~ ~b~%s~s~ to ~y~%s~s~',
	['received_item'] = 'you received ~y~%sx~s~ ~b~%s~s~ from ~b~%s~s~',
	['gave_weapon'] = 'you gave ~b~%s~s~ to ~y~%s~s~',
	['gave_weapon_ammo'] = 'you gave ~o~%sx %s~s~ for ~b~%s~s~ to ~y~%s~s~',
	['gave_weapon_withammo'] = 'you gave ~b~%s~s~ with ~o~%sx %s~s~ to ~y~%s~s~',
	['gave_weapon_hasalready'] = '~y~%s~s~ already has a ~y~%s~s~',
	['gave_weapon_noweapon'] = '~y~%s~s~ does not have that weapon',
	['received_weapon'] = 'you received ~b~%s~s~ from ~b~%s~s~',
	['received_weapon_ammo'] = 'you received ~o~%sx %s~s~ for your ~b~%s~s~ from ~b~%s~s~',
	['received_weapon_withammo'] = 'you received ~b~%s~s~ with ~o~%sx %s~s~ from ~b~%s~s~',
	['received_weapon_hasalready'] = '~b~%s~s~ attempted to give you a ~y~%s~s~, but you already have one',
	['received_weapon_noweapon'] = '~b~%s~s~ attempted to give you ammo for a ~y~%s~s~, but you dont have one',
	['gave_account_money'] = 'you gave ~g~$%s~s~ (%s) to ~y~%s~s~',
	['received_account_money'] = 'you received ~g~$%s~s~ (%s) from ~b~%s~s~',
	['amount_invalid'] = 'invalid amount',
	['players_nearby'] = 'no players nearby',
	['ex_inv_lim'] = 'action not possible, exceeding inventory limit for ~y~%s~s~',
	['imp_invalid_quantity'] = 'action impossible, invalid quantity',
	['imp_invalid_amount'] = 'action impossible, invalid amount',
	['threw_standard'] = 'you threw ~y~%sx~s~ ~b~%s~s~',
	['threw_account'] = 'you threw ~g~$%s~s~ ~b~%s~s~',
	['threw_weapon'] = 'you threw ~b~%s~s~',
	['threw_weapon_ammo'] = 'you threw ~b~%s~s~ with ~o~%sx %s~s~',
	['threw_weapon_already'] = 'you already carry the same weapon',
	['threw_cannot_pickup'] = 'you cannot pickup that because your inventory is full!',
	['threw_pickup_prompt'] = 'press ~y~E~s~ to pickup',
  
	-- Key mapping
	['keymap_showinventory'] = 'show Inventory',
  
	-- Salary related
	['received_salary'] = 'you received your salary: ~g~$%s~s~',
	['received_help'] = 'you received your welfare check: ~g~$%s~s~',
	['company_nomoney'] = 'the company you\'re employeed at is too poor to pay out your salary',
	['received_paycheck'] = 'received paycheck',
	['bank'] = 'maze Bank',
	['account_bank'] = 'bank',
	['account_black_money'] = 'dirty Money',
	['account_money'] = 'cash',
  
	['act_imp'] = 'action impossible',
	['in_vehicle'] = 'you cannot give anything to someone in a vehicle',
  
	-- Commands
	['command_car'] = 'spawn a vehicle',
	['command_car_car'] = 'vehicle spawn name or hash',
	['command_cardel'] = 'delete vehicle in proximity',
	['command_cardel_radius'] = 'optional, delete every vehicle within the specified radius',
	['command_clear'] = 'clear chat',
	['command_clearall'] = 'clear chat for all players',
	['command_clearinventory'] = 'clear player inventory',
	['command_clearloadout'] = 'clear a player loadout',
	['command_giveaccountmoney'] = 'give account money',
	['command_giveaccountmoney_account'] = 'valid account name',
	['command_giveaccountmoney_amount'] = 'amount to add',
	['command_giveaccountmoney_invalid'] = 'invalid account name',
	['command_giveitem'] = 'give an item to a player',
	['command_giveitem_item'] = 'item name',
	['command_giveitem_count'] = 'item count',
	['command_giveweapon'] = 'give a weapon to a player',
	['command_giveweapon_weapon'] = 'weapon name',
	['command_giveweapon_ammo'] = 'ammo count',
	['command_giveweapon_hasalready'] = 'player already has that weapon',
	['command_giveweaponcomponent'] = 'give weapon component',
	['command_giveweaponcomponent_component'] = 'component name',
	['command_giveweaponcomponent_invalid'] = 'invalid weapon component',
	['command_giveweaponcomponent_hasalready'] = 'player already has that weapon component',
	['command_giveweaponcomponent_missingweapon'] = 'player does not have that weapon',
	['command_save'] = 'save a player to database',
	['command_saveall'] = 'save all players to database',
	['command_setaccountmoney'] = 'set account money for a player',
	['command_setaccountmoney_amount'] = 'amount of money to set',
	['command_setcoords'] = 'teleport to coordinates',
	['command_setcoords_x'] = 'x axis',
	['command_setcoords_y'] = 'y axis',
	['command_setcoords_z'] = 'z axis',
	['command_setjob'] = 'set job for a player',
	['command_setjob_job'] = 'job name',
	['command_setjob_grade'] = 'job grade',
	['command_setjob_invalid'] = 'the job, grade or both are invalid',
	['command_setgroup'] = 'set player group',
	['command_setgroup_group'] = 'group name',
	['commanderror_argumentmismatch'] = 'argument count mismatch (passed %s, wanted %s)',
	['commanderror_argumentmismatch_number'] = 'argument #%s type mismatch (passed string, wanted number)',
	['commanderror_invaliditem'] = 'invalid item name',
	['commanderror_invalidweapon'] = 'invalid weapon',
	['commanderror_console'] = 'that command cannot be run from console',
	['commanderror_invalidcommand'] = '^3%s^0 is not a valid command!',
	['commanderror_invalidplayerid'] = 'there is no player online matching that server id',
	['commandgeneric_playerid'] = 'player id',
  
	-- Locale settings
	['locale_digit_grouping_symbol'] = ',',
	['locale_currency'] = '$%s',
  
	-- Weapons
  
	-- Melee
	['weapon_dagger'] = 'Dagger',
	['weapon_bat'] = 'Bat',
	['weapon_battleaxe'] = 'Battle Axe',
	['weapon_bottle'] = 'Bottle',
	['weapon_crowbar'] = 'Crowbar',
	['weapon_flashlight'] = 'Flashlight',
	['weapon_golfclub'] = 'Golf Club',
	['weapon_hammer'] = 'Hammer',
	['weapon_hatchet'] = 'Hatchet',
	['weapon_knife'] = 'Knife',
	['weapon_knuckle'] = 'Knuckledusters',
	['weapon_machete'] = 'Machete',
	['weapon_nightstick'] = 'Nightstick',
	['weapon_wrench'] = 'Pipe Wrench',
	['weapon_poolcue'] = 'Pool Cue',
	['weapon_stone_hatchet'] = 'Stone Hatchet',
	['weapon_switchblade'] = 'Switchblade',
  
	-- Handguns
	['weapon_appistol'] = 'AP Pistol',
	['weapon_ceramicpistol'] = 'Ceramic Pistol',
	['weapon_combatpistol'] = 'Combat Pistol',
	['weapon_doubleaction'] = 'Double-Action Revolver',
	['weapon_navyrevolver'] = 'Navy Revolver',
	['weapon_flaregun'] = 'Flaregun',
	['weapon_gadgetpistol'] = 'Gadget Pistol',
	['weapon_heavypistol'] = 'Heavy Pistol',
	['weapon_revolver'] = 'Heavy Revolver',
	['weapon_revolver_mk2'] = 'Heavy Revolver MK2',
	['weapon_marksmanpistol'] = 'Marksman Pistol',
	['weapon_pistol'] = 'Pistol',
	['weapon_pistol_mk2'] = 'Pistol MK2',
	['weapon_pistol50'] = 'Pistol .50',
	['weapon_snspistol'] = 'SNS Pistol',
	['weapon_snspistol_mk2'] = 'SNS Pistol MK2',
	['weapon_stungun'] = 'Taser',
	['weapon_raypistol'] = 'Up-N-Atomizer',
	['weapon_vintagepistol'] = 'Vintage Pistol',
  
	-- Shotguns
	['weapon_assaultshotgun'] = 'Assault Shotgun',
	['weapon_autoshotgun'] = 'Auto Shotgun',
	['weapon_bullpupshotgun'] = 'Bullpup Shotgun',
	['weapon_combatshotgun'] = 'Combat Shotgun',
	['weapon_dbshotgun'] = 'Double Barrel Shotgun',
	['weapon_heavyshotgun'] = 'Heavy Shotgun',
	['weapon_musket'] = 'Musket',
	['weapon_pumpshotgun'] = 'Pump Shotgun',
	['weapon_pumpshotgun_mk2'] = 'Pump Shotgun MK2',
	['weapon_sawnoffshotgun'] = 'Sawed Off Shotgun',
  
	-- SMG & LMG
	['weapon_assaultsmg'] = 'Assault SMG',
	['weapon_combatmg'] = 'Combat MG',
	['weapon_combatmg'] = 'Combat MG MK2',
	['weapon_combatpdw'] = 'Combat PDW',
	['weapon_gusenberg'] = 'Gusenberg Sweeper',
	['weapon_machinepistol'] = 'Machine Pistol',
	['weapon_mg'] = 'MG',
	['weapon_microsmg'] = 'Micro SMG',
	['weapon_minismg'] = 'Mini SMG',
	['weapon_smg'] = 'SMG',
	['weapon_smg_mk2'] = 'SMG MK2',
	['weapon_raycarbine'] = 'Unholy Hellbringer',
  
	-- Rifles
	['weapon_advancedrifle'] = 'Advanced Rifle',
	['weapon_assaultrifle'] = 'Assault Rifle',
	['weapon_assaultrifle_mk2'] = 'Assault Rifle MK2',
	['weapon_bullpuprifle'] = 'Bullpup Rifle',
	['weapon_bullpuprifle_mk2'] = 'Bullpup Rifle MK2',
	['weapon_carbinerifle'] = 'Carbine Rifle',
	['weapon_carbinerifle_mk2'] = 'Carbine Rifle MK2',
	['weapon_compactrifle'] = 'Compact Rifle',
	['weapon_militaryrifle'] = 'Military Rifle',
	['weapon_specialcarbine'] = 'Special Carbine',
	['weapon_specialcarbine_mk2'] = 'Special Carbine MK2',
  
	-- Sniper
	['weapon_heavysniper'] = 'Heavy Sniper',
	['weapon_heavysniper_mk2'] = 'Heavy Sniper MK2',
	['weapon_marksmanrifle'] = 'Marksman Rifle',
	['weapon_marksmanrifle_mk2'] = 'Marksman Rifle MK2',
	['weapon_sniperrifle'] = 'Sniper Rifle',
  
	-- Heavy / Launchers
	['weapon_compactlauncher'] = 'Compact Launcher',
	['weapon_firework'] = 'Firework Launcher',
	['weapon_grenadelauncher'] = 'Grenade Launcher',
	['weapon_hominglauncher'] = 'Homing Launcher',
	['weapon_minigun'] = 'Minigun',
	['weapon_railgun'] = 'Railgun',
	['weapon_rpg'] = 'Rocket Launcher',
	['weapon_rayminigun'] = 'Widowmaker',
  
	-- Thrown
	['weapon_ball'] = 'Baseball',
	['weapon_bzgas'] = 'BZ Gas',
	['weapon_flare'] = 'Flare',
	['weapon_grenade'] = 'Grenade',
	['weapon_petrolcan'] = 'Jerrycan',
	['weapon_hazardcan'] = 'Hazardous Jerrycan',
	['weapon_molotov'] = 'Molotov Cocktail',
	['weapon_proxmine'] = 'Proximity Mine',
	['weapon_pipebomb'] = 'Pipe Bomb',
	['weapon_snowball'] = 'Snowball',
	['weapon_stickybomb'] = 'Sticky Bomb',
	['weapon_smokegrenade'] = 'Tear Gas',
  
	-- Special
	['weapon_fireextinguisher'] = 'Fire Extinguisher',
	['weapon_digiscanner'] = 'Digital Scanner',
	['weapon_garbagebag'] = 'Garbage Bag',
	['weapon_handcuffs'] = 'Handcuffs',
	['gadget_nightvision'] = 'Night Vision',
	['gadget_parachute'] = 'parachute',
  
	-- Weapon Components
	['component_knuckle_base'] = 'base Model',
	['component_knuckle_pimp'] = 'the Pimp',
	['component_knuckle_ballas'] = 'the Ballas',
	['component_knuckle_dollar'] = 'the Hustler',
	['component_knuckle_diamond'] = 'the Rock',
	['component_knuckle_hate'] = 'the Hater',
	['component_knuckle_love'] = 'the Lover',
	['component_knuckle_player'] = 'the Player',
	['component_knuckle_king'] = 'the King',
	['component_knuckle_vagos'] = 'the Vagos',
  
	['component_luxary_finish'] = 'luxary Weapon Finish',
  
	['component_handle_default'] = 'default Handle',
	['component_handle_vip'] = 'vIP Handle',
	['component_handle_bodyguard'] = 'bodyguard Handle',
  
	['component_vip_finish'] = 'vIP Finish',
	['component_bodyguard_finish'] = 'bodyguard Finish',
  
	['component_camo_finish'] = 'digital Camo',
	['component_camo_finish2'] = 'brushstroke Camo',
	['component_camo_finish3'] = 'woodland Camo',
	['component_camo_finish4'] = 'skull Camo',
	['component_camo_finish5'] = 'sessanta Nove Camo',
	['component_camo_finish6'] = 'perseus Camo',
	['component_camo_finish7'] = 'leopard Camo',
	['component_camo_finish8'] = 'zebra Camo',
	['component_camo_finish9'] = 'geometric Camo',
	['component_camo_finish10'] = 'boom Camo',
	['component_camo_finish11'] = 'patriotic Camo',
  
	['component_camo_slide_finish'] = 'digital Slide Camo',
	['component_camo_slide_finish2'] = 'brushstroke Slide Camo',
	['component_camo_slide_finish3'] = 'woodland Slide Camo',
	['component_camo_slide_finish4'] = 'skull Slide Camo',
	['component_camo_slide_finish5'] = 'sessanta Nove Slide Camo',
	['component_camo_slide_finish6'] = 'perseus Slide Camo',
	['component_camo_slide_finish7'] = 'leopard Slide Camo',
	['component_camo_slide_finish8'] = 'zebra Slide Camo',
	['component_camo_slide_finish9'] = 'geometric Slide Camo',
	['component_camo_slide_finish10'] = 'boom Slide Camo',
	['component_camo_slide_finish11'] = 'patriotic Slide Camo',
  
	['component_clip_default'] = 'default Magazine',
	['component_clip_extended'] = 'extended Magazine',
	['component_clip_drum'] = 'drum Magazine',
	['component_clip_box'] = 'box Magazine',
  
	['component_scope_holo'] = 'holographic Scope',
	['component_scope_small'] = 'small Scope',
	['component_scope_medium'] = 'medium Scope',
	['component_scope_large'] = 'large Scope',
	['component_scope'] = 'mounted Scope',
	['component_scope_advanced'] = 'advanced Scope',
	['component_ironsights'] = 'ironsights',
  
	['component_suppressor'] = 'suppressor',
	['component_compensator'] = 'compensator',
  
	['component_muzzle_flat'] = 'flat Muzzle Brake',
	['component_muzzle_tactical'] = 'tactical Muzzle Brake',
	['component_muzzle_fat'] = 'fat-End Muzzle Brake',
	['component_muzzle_precision'] = 'precision Muzzle Brake',
	['component_muzzle_heavy'] = 'heavy Duty Muzzle Brake',
	['component_muzzle_slanted'] = 'slanted Muzzle Brake',
	['component_muzzle_split'] = 'split-End Muzzle Brake',
	['component_muzzle_squared'] = 'squared Muzzle Brake',
  
	['component_flashlight'] = 'flashlight',
	['component_grip'] = 'grip',
  
	['component_barrel_default'] = 'default Barrel',
	['component_barrel_heavy'] = 'heavy Barrel',
  
	['component_ammo_tracer'] = 'tracer Ammo',
	['component_ammo_incendiary'] = 'incendiary Ammo',
	['component_ammo_hollowpoint'] = 'hollowpoint Ammo',
	['component_ammo_fmj'] = 'fMJ Ammo',
	['component_ammo_armor'] = 'armor Piercing Ammo',
	['component_ammo_explosive'] = 'armor Piercing Incendiary Ammo',
  
	['component_shells_default'] = 'default Shells',
	['component_shells_incendiary'] = 'dragons Breath Shells',
	['component_shells_armor'] = 'steel Buckshot Shells',
	['component_shells_hollowpoint'] = 'flechette Shells',
	['component_shells_explosive'] = 'explosive Slug Shells',
  
	-- Weapon Ammo
	['ammo_rounds'] = 'round(s)',
	['ammo_shells'] = 'shell(s)',
	['ammo_charge'] = 'charge',
	['ammo_petrol'] = 'gallons of fuel',
	['ammo_firework'] = 'firework(s)',
	['ammo_rockets'] = 'rocket(s)',
	['ammo_grenadelauncher'] = 'grenade(s)',
	['ammo_grenade'] = 'grenade(s)',
	['ammo_stickybomb'] = 'bomb(s)',
	['ammo_pipebomb'] = 'bomb(s)',
	['ammo_smokebomb'] = 'bomb(s)',
	['ammo_molotov'] = 'cocktail(s)',
	['ammo_proxmine'] = 'mine(s)',
	['ammo_bzgas'] = 'can(s)',
	['ammo_ball'] = 'ball(s)',
	['ammo_snowball'] = 'snowball(s)',
	['ammo_flare'] = 'flare(s)',
	['ammo_flaregun'] = 'flare(s)',
  
	-- Weapon Tints
	['tint_default'] = 'default skin',
	['tint_green'] = 'green skin',
	['tint_gold'] = 'gold skin',
	['tint_pink'] = 'pink skin',
	['tint_army'] = 'army skin',
	['tint_lspd'] = 'blue skin',
	['tint_orange'] = 'orange skin',
	['tint_platinum'] = 'platinum skin',
  }
  

Config.DefaultWeaponTints = {
	[0] = _U('tint_default'),
	[1] = _U('tint_green'),
	[2] = _U('tint_gold'),
	[3] = _U('tint_pink'),
	[4] = _U('tint_army'),
	[5] = _U('tint_lspd'),
	[6] = _U('tint_orange'),
	[7] = _U('tint_platinum')
}

Config.Weapons = {
	-- Melee
	{name = `WEAPON_DAGGER`, label = _U('weapon_dagger'), components = {}},
	{name = 'WEAPON_BAT', label = _U('weapon_bat'), components = {}},
	{name = `WEAPON_BATTLEAXE`, label = _U('weapon_battleaxe'), components = {}},
	{
		name = 'WEAPON_KNUCKLE',
		label = _U('weapon_knuckle'),
		components = {
			{name = 'knuckle_base', label = _U('component_knuckle_base'), hash = `COMPONENT_KNUCKLE_VARMOD_BASE`},
			{name = 'knuckle_pimp', label = _U('component_knuckle_pimp'), hash = `COMPONENT_KNUCKLE_VARMOD_PIMP`},
			{name = 'knuckle_ballas', label = _U('component_knuckle_ballas'), hash = `COMPONENT_KNUCKLE_VARMOD_BALLAS`},
			{name = 'knuckle_dollar', label = _U('component_knuckle_dollar'), hash = `COMPONENT_KNUCKLE_VARMOD_DOLLAR`},
			{name = 'knuckle_diamond', label = _U('component_knuckle_diamond'), hash = `COMPONENT_KNUCKLE_VARMOD_DIAMOND`},
			{name = 'knuckle_hate', label = _U('component_knuckle_hate'), hash = `COMPONENT_KNUCKLE_VARMOD_HATE`},
			{name = 'knuckle_love', label = _U('component_knuckle_love'), hash = `COMPONENT_KNUCKLE_VARMOD_LOVE`},
			{name = 'knuckle_player', label = _U('component_knuckle_player'), hash = `COMPONENT_KNUCKLE_VARMOD_PLAYER`},
			{name = 'knuckle_king', label = _U('component_knuckle_king'), hash = `COMPONENT_KNUCKLE_VARMOD_KING`},
			{name = 'knuckle_vagos', label = _U('component_knuckle_vagos'), hash = `COMPONENT_KNUCKLE_VARMOD_VAGOS`}
		}
	},
	{name = 'WEAPON_BOTTLE', label = _U('weapon_bottle'), components = {}},
	{name = 'WEAPON_CROWBAR', label = _U('weapon_crowbar'), components = {}},
	{name = 'WEAPON_FLASHLIGHT', label = _U('weapon_flashlight'), components = {}},
	{name = 'WEAPON_GOLFCLUB', label = _U('weapon_golfclub'), components = {}},
	{name = 'WEAPON_HAMMER', label = _U('weapon_hammer'), components = {}},
	{name = 'WEAPON_HATCHET', label = _U('weapon_hatchet'), components = {}},
	{name = 'WEAPON_KNIFE', label = _U('weapon_knife'), components = {}},
	{name = 'WEAPON_MACHETE', label = _U('weapon_machete'), components = {}},
	{name = 'WEAPON_NIGHTSTICK', label = _U('weapon_nightstick'), components = {}},
	{name = 'WEAPON_WRENCH', label = _U('weapon_wrench'), components = {}},
	{name = 'WEAPON_POOLCUE', label = _U('weapon_poolcue'), components = {}},
	{name = 'WEAPON_STONE_HATCHET', label = _U('weapon_stone_hatchet'), components = {}},
	{
		name = 'WEAPON_SWITCHBLADE',
		label = _U('weapon_switchblade'),
		components = {
			{name = 'handle_default', label = _U('component_handle_default'), hash = `COMPONENT_SWITCHBLADE_VARMOD_BASE`},
			{name = 'handle_vip', label = _U('component_handle_vip'), hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR1`},
			{name = 'handle_bodyguard', label = _U('component_handle_bodyguard'), hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR2`}
		}
	},
	-- Handguns
	{
		name = 'WEAPON_APPISTOL',
		label = _U('weapon_appistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_APPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_APPISTOL_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_APPISTOL_VARMOD_LUXE`}
		}
	},
	{name = 'WEAPON_CERAMICPISTOL', label = _U('weapon_ceramicpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`}},
	{
		name = 'WEAPON_COMBATPISTOL',
		label = _U('weapon_combatpistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMBATPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_COMBATPISTOL_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER`}
		}
	},
	{name = 'WEAPON_DOUBLEACTION', label = _U('weapon_doubleaction'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`}},
	{name = 'WEAPON_NAVYREVOLVER', label = _U('weapon_navyrevolver'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`}},
	{name = 'WEAPON_FLAREGUN', label = _U('weapon_flaregun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_flaregun'), hash = `AMMO_FLAREGUN`}},
	{name = 'WEAPON_GADGETPISTOL', label = _U('weapon_gadgetpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`}},
	{
		name = 'WEAPON_HEAVYPISTOL',
		label = _U('weapon_heavypistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_HEAVYPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_HEAVYPISTOL_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_HEAVYPISTOL_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_REVOLVER',
		label = _U('weapon_revolver'),
		ammo = {label = _U('ammo_rounds'),hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_REVOLVER_CLIP_01`},
			{name = 'vip_finish', label = _U('component_vip_finish'), hash = `COMPONENT_REVOLVER_VARMOD_BOSS`},
			{name = 'bodyguard_finish', label = _U('component_bodyguard_finish'), hash = `COMPONENT_REVOLVER_VARMOD_GOON`}
		}
	},
	{
		name = 'WEAPON_REVOLVER_MK2',
		label = _U('weapon_revolver_mk2'),
		ammo = {label = _U('ammo_rounds'),hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_REVOLVER_MK2_CLIP_01`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_REVOLVER_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = `COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_REVOLVER_MK2_CLIP_FMJ`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_small', label = _U('component_ammo_fmj'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'compensator', label = _U('component_compensator'), hash = `COMPONENT_AT_PI_COMP_03`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_REVOLVER_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_REVOLVER_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_REVOLVER_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_REVOLVER_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_REVOLVER_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_REVOLVER_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_REVOLVER_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_REVOLVER_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_REVOLVER_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_REVOLVER_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_REVOLVER_MK2_CAMO_IND_01`}
		}
	},
	{name = 'WEAPON_MARKSMANPISTOL', label = _U('weapon_marksmanpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`}},
	{
		name = 'WEAPON_PISTOL',
		label = _U('weapon_pistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_PISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_PISTOL_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_PISTOL_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_PISTOL_MK2',
		label = _U('weapon_pistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_PISTOL_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_PISTOL_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_PISTOL_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_PISTOL_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = `COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_PISTOL_MK2_CLIP_FMJ`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_PI_RAIL`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH_02`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP_02`},
			{name = 'compensator', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_COMP`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_PISTOL_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_PISTOL_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_PISTOL_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_PISTOL_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_PISTOL_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_PISTOL_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_PISTOL_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_PISTOL_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_PISTOL_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_PISTOL_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01`},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = `COMPONENT_PISTOL_MK2_CAMO_SLIDE`},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = `COMPONENT_PISTOL_MK2_CAMO_02_SLIDE`},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = `COMPONENT_PISTOL_MK2_CAMO_03_SLIDE`},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = `COMPONENT_PISTOL_MK2_CAMO_04_SLIDE`},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = `COMPONENT_PISTOL_MK2_CAMO_05_SLIDE`},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = `COMPONENT_PISTOL_MK2_CAMO_06_SLIDE`},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = `COMPONENT_PISTOL_MK2_CAMO_07_SLIDE`},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = `COMPONENT_PISTOL_MK2_CAMO_08_SLIDE`},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = `COMPONENT_PISTOL_MK2_CAMO_09_SLIDE`},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = `COMPONENT_PISTOL_MK2_CAMO_10_SLIDE`},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE`}
		}
	},
	{
		name = 'WEAPON_PISTOL50',
		label = _U('weapon_pistol50'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_PISTOL50_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_PISTOL50_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_PISTOL50_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL',
		label = _U('weapon_snspistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SNSPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SNSPISTOL_CLIP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL_MK2',
		label = _U('weapon_snspistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_FMJ`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_PI_RAIL_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH_03`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP_02`},
			{name = 'compensator', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_COMP_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01`},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE`},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE`},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE`},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE`},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE`},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE`},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE`},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE`},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE`},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE`},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE`}
		}
	},
	{name = 'WEAPON_STUNGUN', label = _U('weapon_stungun'), tints = Config.DefaultWeaponTints, components = {}},
	{name = 'WEAPON_RAYPISTOL', label = _U('weapon_raypistol'), tints = Config.DefaultWeaponTints, components = {}},
	{
		name = 'WEAPON_VINTAGEPISTOL',
		label = _U('weapon_vintagepistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_VINTAGEPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_VINTAGEPISTOL_CLIP_02`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`}
		}
	},
	-- Shotguns
	{
		name = 'WEAPON_ASSAULTSHOTGUN',
		label = _U('weapon_assaultshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},
	{name = 'WEAPON_AUTOSHOTGUN', label = _U('weapon_autoshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`}},
	{
		name = 'WEAPON_BULLPUPSHOTGUN',
		label = _U('weapon_bullpupshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},
	{
		name = 'WEAPON_COMBATSHOTGUN',
		label = _U('weapon_combatshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`}
		}
	},
	{name = 'WEAPON_DBSHOTGUN', label = _U('weapon_dbshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`}},
	{
		name = 'WEAPON_HEAVYSHOTGUN',
		label = _U('weapon_heavyshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_HEAVYSHOTGUN_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_HEAVYSHOTGUN_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_HEAVYSHOTGUN_CLIP_03`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},
	{name = 'WEAPON_MUSKET', label = _U('weapon_musket'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_SHOTGUN`}},
	{
		name = 'WEAPON_PUMPSHOTGUN',
		label = _U('weapon_pumpshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_SR_SUPP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_PUMPSHOTGUN_MK2',
		label = _U('weapon_pumpshotgun_mk2'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'shells_default', label = _U('component_shells_default'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_01`},
			{name = 'shells_incendiary', label = _U('component_shells_incendiary'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY`},
			{name = 'shells_armor', label = _U('component_shells_armor'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING`},
			{name = 'shells_hollowpoint', label = _U('component_shells_hollowpoint'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT`},
			{name = 'shells_explosive', label = _U('component_shells_explosive'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2`},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_SR_SUPP_03`},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = `COMPONENT_AT_MUZZLE_08`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
		label = _U('weapon_sawnoffshotgun'),
		ammo = {label = _U('ammo_shells'), hash = `AMMO_SHOTGUN`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE`}
		}
	},
	-- SMG & LMG
	{
		name = 'WEAPON_ASSAULTSMG',
		label = _U('weapon_assaultsmg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ASSAULTSMG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ASSAULTSMG_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_COMBATMG',
		label = _U('weapon_combatmg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMBATMG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_COMBATMG_CLIP_02`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_COMBATMG_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_COMBATMG_MK2',
		label = _U('weapon_combatmg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMBATMG_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_COMBATMG_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_COMBATMG_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = `COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_COMBATMG_MK2_CLIP_FMJ`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2`},
			{name = 'scope_large', label = _U('component_scope_large'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_MG_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_MG_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_COMBATMG_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_COMBATMG_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_COMBATMG_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_COMBATMG_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_COMBATMG_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_COMBATMG_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_COMBATMG_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_COMBATMG_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_COMBATMG_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_COMBATMG_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_COMBATMG_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_COMBATPDW',
		label = _U('weapon_combatpdw'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMBATPDW_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_COMBATPDW_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_COMBATPDW_CLIP_03`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_SMALL`}
		}
	},
	{
		name = 'WEAPON_GUSENBERG',
		label = _U('weapon_gusenberg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_GUSENBERG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_GUSENBERG_CLIP_02`}
		}
	},
	{
		name = 'WEAPON_MACHINEPISTOL',
		label = _U('weapon_machinepistol'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_PISTOL`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MACHINEPISTOL_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MACHINEPISTOL_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_MACHINEPISTOL_CLIP_03`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`}
		}
	},
	{
		name = 'WEAPON_MG',
		label = _U('weapon_mg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_MG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MG_CLIP_02`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_SMALL_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_MG_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_MICROSMG',
		label = _U('weapon_microsmg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MICROSMG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MICROSMG_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_MICROSMG_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_MINISMG',
		label = _U('weapon_minismg'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MINISMG_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MINISMG_CLIP_02`}
		}
	},
	{
		name = 'WEAPON_SMG_MK2',
		label = _U('weapon_smg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SMG_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SMG_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_SMG_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_SMG_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = `COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_SMG_MK2_CLIP_FMJ`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS_SMG`},
			{name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2`},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_SMALL_SMG_MK2`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_SB_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SB_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_SMG_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_SMG_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_SMG_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_SMG_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_SMG_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_SMG_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_SMG_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_SMG_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_SMG_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_SMG_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_SMG_MK2_CAMO_IND_01`}
		}
	},
	{name = 'WEAPON_RAYCARBINE', label = _U('weapon_raycarbine'), ammo = {label = _U('ammo_rounds'), hash = `AMMO_SMG`}, tints = Config.DefaultWeaponTints, components = {}},
	-- Rifles
	{
		name = 'WEAPON_ADVANCEDRIFLE',
		label = _U('weapon_advancedrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ADVANCEDRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ADVANCEDRIFLE_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_SMALL`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE',
		label = _U('weapon_assaultrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ASSAULTRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ASSAULTRIFLE_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_ASSAULTRIFLE_CLIP_03`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MACRO`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE_MK2',
		label = _U('weapon_assaultrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2`},
			{name = 'scope_large', label = _U('component_scope_large'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_AR_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_AR_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE',
		label = _U('weapon_bullpuprifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_BULLPUPRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_BULLPUPRIFLE_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_SMALL`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW`}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
		label = _U('weapon_bullpuprifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_MACRO_02_MK2`},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_BP_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_BP_BARREL_02`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE',
		label = _U('weapon_carbinerifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_CARBINERIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_CARBINERIFLE_CLIP_02`},
			{name = 'clip_box', label = _U('component_clip_box'), hash = `COMPONENT_CARBINERIFLE_CLIP_03`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_CARBINERIFLE_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE_MK2',
		label = _U('weapon_carbinerifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2`},
			{name = 'scope_large', label = _U('component_scope_large'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_CR_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_CR_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_COMPACTRIFLE',
		label = _U('weapon_compactrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMPACTRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_COMPACTRIFLE_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_COMPACTRIFLE_CLIP_03`}
		}
	},
	{
		name = 'WEAPON_MILITARYRIFLE',
		label = _U('weapon_militaryrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MILITARYRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MILITARYRIFLE_CLIP_02`},
			{name = 'ironsights', label = _U('component_ironsights'), hash = `COMPONENT_MILITARYRIFLE_SIGHT_01`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_SMALL`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE',
		label = _U('weapon_specialcarbine'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SPECIALCARBINE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SPECIALCARBINE_CLIP_02`},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = `COMPONENT_SPECIALCARBINE_CLIP_03`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_MEDIUM`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER`}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE_MK2',
		label = _U('weapon_specialcarbine_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2`},
			{name = 'scope_large', label = _U('component_scope_large'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_SC_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SC_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01`}
		}
	},
	-- Sniper
	{
		name = 'WEAPON_HEAVYSNIPER',
		label = _U('weapon_heavysniper'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_LARGE`},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = `COMPONENT_AT_SCOPE_MAX`}
		}
	},
	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
		label = _U('weapon_heavysniper_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ`},
			{name = 'ammo_explosive', label = _U('component_ammo_explosive'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE`},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = `COMPONENT_AT_SCOPE_LARGE_MK2`},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = `COMPONENT_AT_SCOPE_MAX`},
			{name = 'scope_nightvision', label = _U('component_scope_nightvision'), hash = `COMPONENT_AT_SCOPE_NV`},
			{name = 'scope_thermal', label = _U('component_scope_thermal'), hash = `COMPONENT_AT_SCOPE_THERMAL`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_SR_SUPP_03`},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = `COMPONENT_AT_MUZZLE_08`},
			{name = 'muzzle_bell', label = _U('component_muzzle_bell'), hash = `COMPONENT_AT_MUZZLE_09`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_SR_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SR_BARREL_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE',
		label = _U('weapon_marksmanrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MARKSMANRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MARKSMANRIFLE_CLIP_02`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE`}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
		label = _U('weapon_marksmanrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_01`},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02`},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER`},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY`},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING`},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ`},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = `COMPONENT_AT_SIGHTS`},
			{name = 'scope_large', label = _U('component_scope_large'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2`},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2`},
			{name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01`},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = `COMPONENT_AT_MUZZLE_02`},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03`},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04`},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05`},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06`},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07`},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = `COMPONENT_AT_MRFL_BARREL_01`},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_MRFL_BARREL_02`},
			{name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02`},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO`},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02`},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03`},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04`},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05`},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06`},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07`},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08`},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09`},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10`},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01`}
		}
	},
	{
		name = 'WEAPON_SNIPERRIFLE',
		label = _U('weapon_sniperrifle'),
		ammo = {label = _U('ammo_rounds'), hash = `AMMO_SNIPER`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SCOPE_LARGE`},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = `COMPONENT_AT_SCOPE_MAX`},
			{name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02`},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = `COMPONENT_SNIPERRIFLE_VARMOD_LUXE`}
		}
	},
	-- Heavy / Launchers
	{name = 'WEAPON_COMPACTLAUNCHER', label = _U('weapon_compactlauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = `AMMO_GRENADELAUNCHER`}},
	{name = 'WEAPON_FIREWORK', label = _U('weapon_firework'), components = {}, ammo = {label = _U('ammo_firework'), hash = `AMMO_FIREWORK`}},
	{name = 'WEAPON_GRENADELAUNCHER', label = _U('weapon_grenadelauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = `AMMO_GRENADELAUNCHER`}},
	{name = 'WEAPON_HOMINGLAUNCHER', label = _U('weapon_hominglauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = `AMMO_HOMINGLAUNCHER`}},
	{name = 'WEAPON_MINIGUN', label = _U('weapon_minigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_MINIGUN`}},
	{name = 'WEAPON_RAILGUN', label = _U('weapon_railgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_RAILGUN`}},
	{name = 'WEAPON_RPG', label = _U('weapon_rpg'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = `AMMO_RPG`}},
	{name = 'WEAPON_RAYMINIGUN', label = _U('weapon_rayminigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = `AMMO_MINIGUN`}},
	-- Thrown
	{name = 'WEAPON_BALL', label = _U('weapon_ball'), components = {}, ammo = {label = _U('ammo_ball'), hash = `AMMO_BALL`}},
	{name = 'WEAPON_BZGAS', label = _U('weapon_bzgas'), components = {}, ammo = {label = _U('ammo_bzgas'), hash = `AMMO_BZGAS`}},
	{name = 'WEAPON_FLARE', label = _U('weapon_flare'), components = {}, ammo = {label = _U('ammo_flare'), hash = `AMMO_FLARE`}},
	{name = 'WEAPON_GRENADE', label = _U('weapon_grenade'), components = {}, ammo = {label = _U('ammo_grenade'), hash = `AMMO_GRENADE`}},
	{name = 'WEAPON_PETROLCAN', label = _U('weapon_petrolcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = `AMMO_PETROLCAN`}},
	{name = 'WEAPON_HAZARDCAN', label = _U('weapon_hazardcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = `AMMO_PETROLCAN`}},
	{name = 'WEAPON_MOLOTOV', label = _U('weapon_molotov'), components = {}, ammo = {label = _U('ammo_molotov'), hash = `AMMO_MOLOTOV`}},
	{name = 'WEAPON_PROXMINE', label = _U('weapon_proxmine'), components = {}, ammo = {label = _U('ammo_proxmine'), hash = `AMMO_PROXMINE`}},
	{name = 'WEAPON_PIPEBOMB', label = _U('weapon_pipebomb'), components = {}, ammo = {label = _U('ammo_pipebomb'), hash = `AMMO_PIPEBOMB`}},
	{name = 'WEAPON_SNOWBALL', label = _U('weapon_snowball'), components = {}, ammo = {label = _U('ammo_snowball'), hash = `AMMO_SNOWBALL`}},
	{name = 'WEAPON_STICKYBOMB', label = _U('weapon_stickybomb'), components = {}, ammo = {label = _U('ammo_stickybomb'), hash = `AMMO_STICKYBOMB`}},
	{name = 'WEAPON_SMOKEGRENADE', label = _U('weapon_smokegrenade'), components = {}, ammo = {label = _U('ammo_smokebomb'), hash = `AMMO_SMOKEGRENADE`}},
	-- Tools
	{name = 'WEAPON_FIREEXTINGUISHER', label = _U('weapon_fireextinguisher'), components = {}, ammo = {label = _U('ammo_charge'), hash = `AMMO_FIREEXTINGUISHER`}},
	{name = 'WEAPON_DIGISCANNER', label = _U('weapon_digiscanner'), components = {}},
	{name = 'GADGET_PARACHUTE', label = _U('gadget_parachute'), components = {}}
}
