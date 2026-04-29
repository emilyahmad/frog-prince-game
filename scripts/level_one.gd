extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.action_scene = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# dies/reload scene
func _on_water_body_entered(body: CharacterBody2D) -> void:
	SceneTransition.change_scene("res://scenes/level_one.tscn")

# big jump in player script
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	GameState.bigMushroom = true

# go to sky scene
func _on_sky_level_border_body_entered(body: CharacterBody2D) -> void:
	SceneTransition.change_scene("res://sky.tscn")
