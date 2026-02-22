extends StaticBody2D
class_name fanblock

@export var animation : AnimationPlayer

func _ready() -> void:
	animation.call_deferred_thread_group("play","fan_on")

func activate():
	animation.call_deferred_thread_group("play","fan_on")

func deactivate():
	animation.call_deferred_thread_group("stop")
