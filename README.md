# s1lent_keybinds

## How to add a keybind to a resource
1. Add the following the the resource's `Config.lua` 

```
Config = {} --If does not already exist
Config.useS1lentKeybinds = true
Config.Keybinds = {
  ['Hands Up'] = 'X',
  ['TODO keybind description'] = 'TODO key',
}
```
2. Add the following to the resource's client lua file

```
-- Keybinds
if Config.useS1lentKeybinds then
    for k,v in pairs(Config.Keybinds) do
        exports["s1lent_keybinds"]:AddKeybind(k, v)
    end
end```
