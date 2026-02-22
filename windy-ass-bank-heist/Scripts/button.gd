extends Node2D

@export var wire : Wire

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("Off")
	if(wire.cur_spark):
		wire.end()
	wire.start()



func _on_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.play("default")
