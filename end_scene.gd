extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bg.texture = preload("res://assets/endscene/c1.png")
	await get_tree().create_timer(.25).timeout
	$Bg.texture = preload("res://assets/endscene/c2.png")
	await get_tree().create_timer(.25).timeout
	$Bg.texture = preload("res://assets/endscene/c3.png")
	await get_tree().create_timer(.5).timeout
	$Bg.texture = preload("res://assets/endscene/c4.png")
	await get_tree().create_timer(1.0).timeout
	$Bg.texture = preload("res://assets/endscene/c5.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
