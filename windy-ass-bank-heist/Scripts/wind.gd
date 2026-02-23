extends Area2D

@export var wind_direction: Vector2 = Vector2.RIGHT
@export var wind_strength: float = 500.0 
@export var max_speed_added: float = 200.0 
@export var collision_shape: CollisionShape2D

var target: CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if wind_direction.length() == 0:
		wind_direction = Vector2.RIGHT

	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	if not body_exited.is_connected(_on_body_exited):
		body_exited.connect(_on_body_exited)

# Handles the physics of the wind
func _physics_process(delta: float) -> void:
	if target == null or not is_instance_valid(target):
		return

	var dir := wind_direction.normalized()

	# Apply wind
	if(wind_direction.y != -1):
		target.velocity += dir * wind_strength * delta
		
		# Cap wind contribution
		var along = target.velocity.length() * (dir)
		if along.length() > max_speed_added:
			target.velocity -= dir * (along.length() - max_speed_added)
		

func _on_body_entered(body: Node2D) -> void:
	print(body, " is in the wind")
	if body is CharacterBody2D:
		target = body
		if(wind_direction.y == -1):
			target.up_draft = true

func _on_body_exited(body: Node2D) -> void:
	if body == target:
		print(target, " exited wind")
		if(wind_direction.y == -1):
			target.up_draft = false
		target = null
