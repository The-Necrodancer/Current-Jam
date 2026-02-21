extends Area2D

signal next_level

func _on_body_entered(body: Node2D) -> void:
	emit_signal("next_level")
