# MyRobloxGame (Rojo v7)

## Setup
1. `brew install rojo`
2. `rojo plugin install` (then restart Roblox Studio)
3. `rojo serve`
   - In Studio: Plugins → Rojo → Connect (use the port from terminal)
4. `rojo build --output build.rbxl`

## Layout
- Client: src/StarterPlayer/StarterPlayerScripts/*.client.lua
- Shared: src/ReplicatedStorage

## Notes
Prefer UI in code; don’t rename modules without explaining in PRs.
