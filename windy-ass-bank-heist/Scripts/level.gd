extends Node2D
class_name Level

var gameManager : GameManager = null
@export var end_door : Door

func _ready() -> void:
	end_door.level_reset.connect(reset_level)

func reset_level():
	gameManager.reload_current_scene()

func complete_level():
	gameManager.load_next_scene()
