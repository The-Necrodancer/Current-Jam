extends CharacterBody2D
class_name Player
# I did not tune any of the values relating to the player in the slightest. Im getting it working first and nothing else its 1:17 

@export var GroundCheck : ShapeCast2D

var move_speed = 2000
var move_speed_ceil = 400
var gravity = 1000
var ground_decel = 5
var air_decel = 0.8
var jump_vel = 600

var move_input : Vector2 = Vector2.ZERO
var grounded = false


# handles the hovering features
var is_hovering = false

func _init() -> void:
	pass

func _process(delta: float) -> void:
	move_input = Input.get_vector("left","right","up","down",0.2)

func _physics_process(delta: float) -> void:
	check_grounded()
	
	velocity += gravity * delta * Vector2.DOWN
	
	velocity += move_speed * delta * move_input.x * Vector2.RIGHT 
	
	if( abs(velocity.x) > move_speed_ceil):
		velocity.x = velocity.normalized().x * move_speed_ceil
	
	if(grounded):
		velocity -= ground_decel * delta * velocity
	else:
		velocity -= air_decel * delta * velocity
	
	if(Input.is_action_just_pressed("jump")):
		jump()
	
	move_and_slide()

func check_grounded():
	var g = GroundCheck.is_colliding()
	if not g and grounded:
		pass #coyote time trigger
	grounded = g

func jump():
	if grounded:
		velocity.y = -jump_vel #y inverted in godot
