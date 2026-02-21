extends Node2D
class_name GameManager
# this is the overall "level" manager for the game. making it easy to reset/load levels
# lets make this the parent node for the entire game

@export var MainMenuScene : PackedScene # just set this to the main packedScene. loads on startup
@export var levels : Array[PackedScene] 

var cur_level_index : int = 0 # this keeps track of the current level in the list

func _init() -> void:
	call_deferred("load_main_menu")

func remove_current_scene():
	for c in self.get_children():
		c.queue_free()

func load_main_menu():
	remove_current_scene()
	
	var node = MainMenuScene.instantiate()
	self.add_child(node)
	cur_level_index = -1;

func load_scene(index:int = 0, packedScene:PackedScene = null):
	remove_current_scene()
	
	var cur_level : Node2D
	if packedScene == null:
		cur_level = await levels[index].instantiate()
		cur_level_index = index
	else:
		cur_level = await packedScene.instantiate()
	
	self.add_child(cur_level)

#defaults to title screen if index is out of bounds
func load_next_scene():
	remove_current_scene()
	
	if cur_level_index + 1 > levels.size() or cur_level_index < 0:
		call_deferred("load_main_menu")
		return
	
	call_deferred("load_scene",cur_level_index + 1)

func reload_current_scene():
	if cur_level_index == -1:
		load_scene(0,MainMenuScene)
	else:
		load_scene(cur_level_index)
