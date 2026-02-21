extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Play_Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass

# Move to the credits page level
signal start(index: int)

func _on_credits_button_pressed():
	print("Credits Button has been pressed!")
	get_tree().change_scene_to_file('res://Scenes/credits.tscn')

# Move to the first level
func _on_play_button_pressed():
	emit_signal("start", 0)

func _on_quit_button_pressed():
	print("Quit Button has been pressed!")
	get_tree().quit()
