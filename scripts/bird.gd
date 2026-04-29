extends Node2D

var cycle = false
var randAni

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randAni = randi() % 1 + .25
	_hover()

#func _physics_process(delta):
	#while (cycle == false):
		#_hover()
		#cycle = true

func _hover():
	await get_tree().create_timer(randAni).timeout
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "global_position", global_position + Vector2(0, -100), 1)
	tween.tween_property(self, "global_position", global_position + Vector2(0, 100), 1)
	cycle = false

#signal to fly away
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	cycle = true
	await get_tree().create_timer(.75).timeout
	var tween = create_tween()
	tween.tween_property(self, "global_position", global_position + Vector2(8208, -475), 10)
