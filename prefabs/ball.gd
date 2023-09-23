extends Area2D

@export var speed = 500
var movement: Vector2
var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	movement.x = randf_range(-1, 1)
	movement.y = randf_range(-1, 1)
	screen_size = get_viewport_rect().size - Vector2(64, 64)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += movement.normalized() * speed * delta
	position = position.clamp(Vector2(64, 64), screen_size)
