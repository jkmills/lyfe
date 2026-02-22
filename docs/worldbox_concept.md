# WorldBox-Inspired Experience Requirements

## Vision & Pillars
- **Living sandbox:** Players paint terrain, spawn races, and observe emergent stories without strict win states.
- **Playful godhood:** Powers should feel tactile—drag-to-raise mountains, drop a meteor, infect a species.
- **Toy-box readability:** Iconic pixel/low-poly art, chunky UI, and legible particles help players parse chaos.
- **Shareable simulations:** Allow exporting seeds, GIFs, or save files for the community.

## Core Gameplay Loops
1. **Creation:** Sculpt worlds (islands, biomes, weather), establish water/land heights, place resources.
2. **Population:** Spawn races (humans, elves, dwarves, orcs) with baseline traits, alignments, and tech biases.
3. **Observation:** Civilizations grow, explore, wage wars, trade, revolt; players monitor stats dashboards.
4. **Intervention:** Trigger disasters (meteor, plague, tornado), gift artifacts, or toggle diplomacy modifiers.
5. **Iteration:** Fast-forward time, snapshot worlds, run alternate timelines, compare outcomes.

## Simulation Systems Needed
- **Terrain & Biomes:** Tilemap/grid storing elevation, temp, humidity, fertility, resource density; procedural generators seeded per save.
- **Civilization AI:** State machines or utility-based planners for settlement placement, tech progression, diplomacy, warfare, religion, and cultural traits; needs save/load friendly data.
- **Unit Modeling:** Agents with needs (food, shelter), stats (health, morale, loyalty), traits (strong, pacifist). Pathfinding over navmesh/grid with water-crossing rules.
- **Ecosystem:** Flora/fauna lifecycle, resource depletion/regrowth, weather that influences crops and fires.
- **Disaster & Power Framework:** Modular effect system that can apply forces, status effects, or world edits (e.g., `Power::Apply(area, payload)`), with cooldowns and VFX hooks.
- **Time Controls:** Pausable + multi-speed simulation, deterministic tick order for reproducibility.

## Content & Progression
- **Races & Traits:** Define via JSON or ScriptableObjects (base stats, preferred biomes, tech trees). Support custom user-defined races.
- **Artifacts & Quests:** Rare drops that grant buffs or spawn narrative events; optional objective chains keep long sessions fresh.
- **Achievements & Meta:** Track sandbox milestones (longest war, biggest meteor) to motivate experimentation.

## Technology & Architecture
- **Engine Choice:** Godot 4 (MIT-licensed, free, and lightweight) becomes the default. TileMap/TileSet workflows plus GDScript/C# scripting fit small teams, and the open-source stack avoids licensing or runtime fees while keeping maintenance approachable.
- **Data Layer:** ECS-inspired component slices via Godot's SceneTree or Entitas-like add-ons; serialization-friendly structures for large worlds. Chunk the world to stream/unload memory.
- **Performance Goals:** 10k concurrent agents at 60 FPS on mid-tier hardware. Requires job system, pooling, and deterministic fixed-step loops.
- **Mod Support:** Lua/JS bindings or data-driven configs; plug-in directory scanned at launch.

## Tools & Pipelines
- **World Editor:** Internal tool to author default seeds, scripted scenarios, and tutorial islands.
- **Telemetry:** Log emergent metrics (wars, disasters used) to tune balance, safeguard privacy (opt-in).
- **Automated Testing:** Headless simulation runs verifying stability, memory leaks, and regression of AI behaviors; fuzz tests for powers.
- **Build/Release Flow:** CI generating nightly sandbox builds, diffed saves, and QA dashboards capturing perf counters.

## Monetization & Live Ops (If Desired)
- Premium base game on Steam/Epic; optional cosmetic DLC packs (new races, powers). Avoid gacha; keep god powers accessible. Seasonal events can reuse disaster templates with reskinned VFX.

## Key Risks & Unknowns
- **AI Complexity:** Civilizations can deadlock; need debugging UI (heatmaps, diplomacy logs).
- **Simulation Scale:** Large saves risk memory spikes; plan for chunk eviction and data compression.
- **UX Overload:** Hundreds of events overwhelm players—requires filters, priority notifications, and macro reports.
- **Platform Controls:** Touch vs. mouse interactions need separate UX passes; haptics for tactile god powers on mobile.
