extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fly_body_entered(body: Node2D) -> void:
	print("stamina+")

func _on_bounce_pad_body_entered(body: Node2D) -> void:
	GameState.bounce = true

func _on_croc_head_body_entered(body: Node2D) -> void:
	# fade to black,
	await get_tree().create_timer(.5).timeout
	# wait .5 sec
	# restart (add checkpoints for longer rounds)
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")
