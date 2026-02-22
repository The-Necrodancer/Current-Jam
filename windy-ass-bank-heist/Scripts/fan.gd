extends Node2D

@export var enabled: bool = true
@export var wind: Area2D
@export var fans: Array[StaticBody2D]

func _ready() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		pass
	


func _on_area_entered(area: Area2D) -> void:
	wind.monitoring = true
	for fan in fans:
		#play on animation
		pass
	
	$Timer.start()

func _on_timer_timeout() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		pass
