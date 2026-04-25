extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fly_body_entered(body: Node2D) -> void:
	print("stamina+")


# when hit croc:
# fade to black,
# wait .5 sec
# restart (add checkpoints for longer rounds)

func _on_bounce_pad_body_entered(body: Node2D) -> void:
	GameState.bounce = true
