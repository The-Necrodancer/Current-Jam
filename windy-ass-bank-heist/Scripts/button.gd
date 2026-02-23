extends Node2D

@export var wire : Wire
var sprite : Sprite2D

func _ready():
	sprite = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	sprite.frame = 1
	if(wire.cur_spark):
		wire.end()
	wire.start()



func _on_body_exited(body: Node2D) -> void:
	sprite.frame = 0
