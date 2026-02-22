extends Node2D

@export var enabled: bool = true
@export var wind: Area2D
@export var fans: Array[fanblock]

func _ready() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		fan.deactivate()
		pass
	

func _on_area_entered(area: Area2D) -> void:
	wind.monitoring = true
	for fan in fans:
		#play on animation
		fan.activate()
		pass
	
	$Timer.start()

func _on_timer_timeout() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		fan.deactivate()
		pass
