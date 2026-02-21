extends Node2D
class_name Level

var gameManager : GameManager = null
@export var end_door : Door
@export var end_gem : Gem

func _ready() -> void:
	end_door.level_reset.connect(reset_level)
	end_gem.next_level.connect(complete_level)

func reset_level():
	gameManager.reload_current_scene()

func complete_level():
	gameManager.load_next_scene()
