local keybinds = {}
local inMenu = false

--==== NUI ====--
function openUI()
	SetNuiFocus(true, true)
	inMenu = true
	SendNUIMessage({
		type = 'setUIVisible',
		bool = true,
		keybinds = keybinds,
	})
end

function closeUI(fromCommand)
	SetNuiFocus(false, false)
	inMenu = false
	if fromCommand then
		SendNUIMessage({
			type = 'setUIVisible',
			bool = false,
		})
	end
end

RegisterNUICallback('closeUI', function(data)
    closeUI(false)
end)

--==== Commands ====--
RegisterCommand('keybinds', function(source, args, rawCommand)
	if not inMenu then
		openUI()
	else
		closeUI(true)
	end
end, false)
TriggerEvent('chat:addSuggestion', '/keybinds', 'Open keybinds menu', {})

--==== Exports ====--
function addKeybind(name, key)
	if keybinds[name] then
		print('Warning: keybind name "' + name + '" is assigned multiple times')
	end
	keybinds[name] = key
end

exports('AddKeybind', addKeybind)

--==== Resource Start/Stop ====--
AddEventHandler('onResourceStop', function (resourceName)
	if (GetCurrentResourceName() == resourceName) then
        closeUI()
	end
end)

AddEventHandler('onResourceStart', function (resourceName)
	if (GetCurrentResourceName() == resourceName) then
		closeUI()
	end
end)