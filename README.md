# MyRobloxGame (Rojo v7)

## Install
brew install rojo
rojo plugin install   # then restart Roblox Studio

## Live sync
rojo serve
# In Studio: Plugins → Rojo → Connect (use the port from Terminal)

## Build a place
rojo build --output build.rbxl

## Layout
- Client: src/StarterPlayer/StarterPlayerScripts/*.client.lua
- Shared: src/ReplicatedStorage

## Notes
Prefer UI in code; don’t rename modules without explaining in PRs.
