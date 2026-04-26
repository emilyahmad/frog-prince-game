extends Node2D

var original_position: Vector2
var has_sunk = false

func _ready() -> void:
	original_position = position
	$AnimatedSprite2D.modulate.a = 1.0
	$AnimatedSprite2D.play("default")
#
func _process(delta: float) -> void:
	pass
#
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if has_sunk == false:
		has_sunk = true
		GameState.sink = true
		$AnimatedSprite2D.play("default")
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property($AnimatedSprite2D, "position:y", 20, 0.5)
		tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, 0.5)
		await get_tree().create_timer(.5).timeout
		$AnimatedSprite2D.stop()
		GameState.sink = false
		queue_free()
