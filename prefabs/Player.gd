extends Area2D

@export var celerity = 500
var screen: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen = get_viewport_rect().size - Vector2(100, 100)

func _on_body_entered(body: Node2D):
	print_debug(body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var movement = Vector2.ZERO
	if get_meta("is_human_controlled", false):
		if Input.is_action_pressed("up"):
			movement.y -= 1
		if Input.is_action_pressed("down"):
			movement.y += 1
	else:
		pass
	position += movement * delta * celerity
	position = position.clamp(Vector2(100, 100), screen)
