extends Node2D
class_name Door

@export var area : Area2D 

signal level_reset

func _ready() -> void:
	area.area_entered.connect(_on_area_2d_area_entered)

func signal_reset():
	emit_signal("level_reset")


func _on_area_2d_area_entered(area: Area2D) -> void:
	$AnimationPlayer.play("Close_Door")
