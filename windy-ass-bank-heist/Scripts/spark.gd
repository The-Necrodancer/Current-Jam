extends Area2D
class_name Spark

@export var anim : AnimationPlayer

func _process(delta: float) -> void:
	anim.play("default")
