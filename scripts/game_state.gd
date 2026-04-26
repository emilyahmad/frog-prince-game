extends Node2D

var bounce = false

#var sink = false
@onready var muted = false
@onready var sfx_muted = false

func _input(event):
	if event.is_action_pressed("quit"):
		# change to go to settings screen
		get_tree().quit()
