extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Play_Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass


signal start(index: int)
signal credits(index: int)
signal quit(index: int)

# Move to the credits page level
func _on_credits_button_pressed():
	print("Credits ->")
	emit_signal("credits")

# Move to the first level
func _on_play_button_pressed():
	print("Play ->")
	emit_signal("start", 0)

func _on_quit_button_pressed():
	print("Quiting ->")
	get_tree().quit()
