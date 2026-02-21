extends CharacterBody2D
class_name Player
# I did not tune any of the values relating to the player in the slightest. Im getting it working first and nothing else its 1:17 

@export var GroundCheck : ShapeCast2D

var move_speed = 12500
var move_speed_ceil = 500
var gravity = 2000
var ground_decel = 0.6
var air_decel = 0.95
var jump_vel = 1000
var coyote_time = 0.2
var jump_buf_time = 0.2
var short_hop_multiplier = 1.0


var move_input : Vector2 = Vector2.ZERO
var grounded = false
var timer_coyote = 0
var timer_jump_buf = 0

# handles the hovering features
var is_hovering = false
var hover_decel = 0.8

signal on_death

func _init() -> void:
	pass

func _process(delta: float) -> void:
	move_input = Input.get_vector("left","right","up","down",0.2)

func _physics_process(delta: float) -> void:
	check_grounded()
	
	#timers
	if(timer_coyote > 0):
		timer_coyote -= delta
	if(timer_jump_buf):
		timer_jump_buf -= delta
	
	velocity += gravity * delta * Vector2.DOWN
	
	if(grounded):
		velocity += move_speed * delta * move_input.x * Vector2.RIGHT 
	else:
		velocity += move_speed * 0.5 * delta * move_input.x * Vector2.RIGHT 
	
	if( abs(velocity.x) > move_speed_ceil):
		velocity.x += -velocity.normalized().x * (abs(velocity.x) - move_speed_ceil)
	
	if(grounded):
		velocity *= ground_decel
	else:
		if(not is_hovering):
			velocity *= air_decel
		else:
			velocity *= Vector2(air_decel, hover_decel) 
	
	if(Input.is_action_just_pressed("jump") or timer_jump_buf > 0):
		jump()
	if(Input.is_action_just_pressed("jump")):
		if(velocity.y > 0): # no sense to parachute "upward" so I'm restricting it to descent of the jump
			is_hovering = true
	if(Input.is_action_just_released("jump")):
		if velocity.y < 0:
			velocity *= short_hop_multiplier
		is_hovering = false
	
	move_and_slide()

func check_grounded():
	var g = GroundCheck.is_colliding()
	if not g and grounded:
		timer_coyote = coyote_time
	grounded = g

func jump():
	if grounded:
		velocity.y = -jump_vel #y inverted in godot
	else:
		timer_jump_buf = 0

func kill():
	on_death.emit()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	print("is kill :(")
	on_death.emit()
