extends Node2D

@export var enabled: bool = true
@export var wind: Area2D
@export var fans: Array[fanblock]
@export var fan_particles : Array[CPUParticles2D]

func _ready() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		fan.deactivate()
		pass
	for p in fan_particles:
		p.emitting = false
	

func _on_area_entered(area: Area2D) -> void:
	wind.monitoring = true
	for fan in fans:
		#play on animation
		fan.activate()
		pass
	for p in fan_particles:
		p.emitting = true
	
	$Timer.start()

func _on_timer_timeout() -> void:
	wind.monitoring = false
	for fan in fans:
		#turn off animation
		fan.deactivate()
		pass
	for p in fan_particles:
		p.emitting = false
