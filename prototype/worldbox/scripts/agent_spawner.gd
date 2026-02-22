extends Node

@export var agent_scene: PackedScene
@export var agent_count := 25
@export var spawn_area := Rect2(Vector2(-256, -256), Vector2(512, 512))

var _agents: Array = []
var _rng := RandomNumberGenerator.new()

func _ready() -> void:
    _rng.randomize()
    if agent_scene == null:
        push_warning("AgentSpawner requires an agent scene.")
        return
    for i in range(agent_count):
        _spawn_agent()

func _spawn_agent() -> void:
    if agent_scene == null:
        return
    var agent := agent_scene.instantiate()
    if not agent:
        return
    agent.position = _random_point()
    if agent.has_variable("bounds"):
        agent.bounds = spawn_area
    get_parent().add_child(agent)
    _agents.append(agent)

func _random_point() -> Vector2:
    return Vector2(
        _rng.randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
        _rng.randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
    )
