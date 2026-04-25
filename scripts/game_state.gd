extends Node2D

func _input(event):
	if event.is_action_pressed("quit"):
		# change to go to settings screen
		get_tree().quit()
