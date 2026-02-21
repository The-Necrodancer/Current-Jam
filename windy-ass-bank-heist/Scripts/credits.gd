extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Return_Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass

signal menu(index: int)

func _on_return_button_pressed():
	print("Return -> Menu ->")
	emit_signal("menu")
