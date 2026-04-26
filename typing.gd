extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("typing")
	#$Exposition/SkipTextButton.pressed.connect(_skip_text)

#func _skip_text():
	#print("meow") (edited)
