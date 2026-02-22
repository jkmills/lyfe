extends Node2D

@export var speed: float = 30.0
@export var bounds := Rect2(Vector2(-256, -256), Vector2(512, 512))

var _direction := Vector2.ZERO
var _rng := RandomNumberGenerator.new()

func _ready() -> void:
    _rng.randomize()
    _pick_direction()

func _process(delta: float) -> void:
    position += _direction * speed * delta
    _ensure_bounds()
    if _rng.randf() < 0.01:
        _pick_direction()

func _ensure_bounds() -> void:
    var next := position
    var min := bounds.position
    var max := bounds.position + bounds.size
    next.x = clamp(next.x, min.x, max.x)
    next.y = clamp(next.y, min.y, max.y)
    position = next

func _pick_direction() -> void:
    _direction = Vector2(_rng.randf_range(-1.0, 1.0), _rng.randf_range(-1.0, 1.0)).normalized()
