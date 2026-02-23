extends Camera2D
class_name CameraFollow

@export var target : Node2D

@export var x_bounds : Vector2 = Vector2(0,0)

func _ready() -> void:
	if x_bounds.x - x_bounds.y < 1:
		x_bounds = self.global_position.x * Vector2.RIGHT

func _process(delta: float) -> void:
	if target != null:
		self.global_position.x = target.global_position.x
	self.global_position.x = clampf(self.global_position.x, x_bounds.x,x_bounds.y)
