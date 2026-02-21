extends Node2D

signal level_reset

func signal_reset():
	emit_signal("level_reset")


func _on_area_2d_area_entered(area: Area2D) -> void:
	$AnimationPlayer.play("Close_Door")
