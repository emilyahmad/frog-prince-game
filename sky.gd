extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.sky_scene = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	SceneTransition.change_scene("res://end_scene.tscn")

# falls (dies)
func _on_area_2d_2_body_entered(body: CharacterBody2D) -> void:
	SceneTransition.change_scene("res://sky.tscn")
	$Player.position = Vector2(0,0)
