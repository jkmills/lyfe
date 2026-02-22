# Lyfe Sandbox Prototype

This directory contains a Godot 4 starter project that validates the tile-based world and agent simulation loop described in `docs/worldbox_concept.md`.

## Requirements
- Godot 4.2+ (MIT-licensed, no runtime fees)

## Getting Started
1. Open Godot and import the project by selecting `prototype/worldbox/project.godot`.
2. Run the project (`F5`). The `Main` scene spawns a TileMap placeholder plus a handful of wandering agents to stress the tick/update loop.
3. Tweak values on `AgentSpawner` (agent counts, spawn area) or the `Agent` script (speed, bounds) to validate performance envelopes.

## Next Steps
- Replace the placeholder `TileMap` with procedural terrain generation linked to world seeds.
- Expand `Agent` into ECS-friendly components (needs, inventory) and connect them to the simulation tick.
- Add editor scripts to bake biomes, resources, and debugging overlays.
