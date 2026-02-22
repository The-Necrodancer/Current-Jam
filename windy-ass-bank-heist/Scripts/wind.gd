extends Area2D

@export var wind_direction: Vector2 = Vector2.RIGHT
@export var wind_strength: float = 500.0 
@export var max_speed_added: float = 200.0 

var target: CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if wind_direction.length() == 0:
		wind_direction = Vector2.RIGHT

	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# Handles the physics of the wind
func _physics_process(delta: float) -> void:
	if target == null or not is_instance_valid(target):
		return

	var dir := wind_direction.normalized()

	# Apply wind
	target.velocity += dir * wind_strength * delta

	# Cap wind contribution
	var along := target.velocity.dot(dir)
	if along > max_speed_added:
		target.velocity -= dir * (along - max_speed_added)
	

func _on_body_entered(body: Node2D) -> void:
	print(body, " is in the wind")
	if body is CharacterBody2D:
		target = body

func _on_body_exited(body: Node2D) -> void:
	if body == target:
		print(target, " exited wind")
		target = null
