extends Node2D
class_name Level

var gameManager : GameManager = null
@export var player : Player
@export var end_door : Door
@export var end_gem : Gem

func _ready() -> void:
	player.on_death.connect(reset_level)
	end_door.level_reset.connect(reset_level)
	end_gem.next_level.connect(complete_level)

func reset_on_door_shut():
	#play sad anim
	#play "too slow" message
	#await anim finish
	reset_level()

func reset_on_death():
	#play death anim
	#play death message
	#await anim finish
	reset_level()

func reset_level():
 	gameManager.reload_current_scene()

func complete_level():
	gameManager.load_next_scene()
