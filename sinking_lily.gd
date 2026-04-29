extends Node2D

var original_position: Vector2
var has_sunk = false

# so different lilypads have different default animations
# look like they're sinking @ different times
var randAni = randi() % 5

func _ready() -> void:
		original_position = position
		await get_tree().create_timer(randAni).timeout
		$AnimatedSprite2D.play("default")

func _process(delta):
	if GameState.died == true:
		print("restarts")
		_respawn()
		GameState.died = false
	
func _respawn():
	$AnimatedSprite2D.play("default")
	GameState.sink = false
	has_sunk = false
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.modulate.a = 1.0
	$AnimatedSprite2D.position = Vector2.ZERO
	
	$StaticLily/StaticLilyCollision.visible = true
	$StaticLily/StaticLilyCollision.set_deferred("disabled", false)
	
	$AreaLily/LilyCollision.visible = true
	$AreaLily/LilyCollision.set_deferred("disabled", false)

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("collides")
	if has_sunk == false:
		GameState.sink = true
		$AnimatedSprite2D.play("sink")
		
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property($AnimatedSprite2D, "position:y", 20, 0.5)
		tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, 0.5)
		
		await get_tree().create_timer(.75).timeout
		$AnimatedSprite2D.stop()
		
		GameState.sink = false
		has_sunk = true
		
		# hide
		$StaticLily/StaticLilyCollision.visible = false
		$StaticLily/StaticLilyCollision.set_deferred("disabled", true)
		
		$AreaLily/LilyCollision.visible = false
		$AreaLily/LilyCollision.set_deferred("disabled", true)
		
		#queue_free()
