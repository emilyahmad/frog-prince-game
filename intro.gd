extends Node2D

func _process(delta: float) -> void:
	pass

var finishedInstruction = false
var currentIndex := 0
var exposition: Array[String] = [
	"Welcome to the forest",
	"You'll have to traverse it to reach the castle",
	"Try jumping on some mushrooms, you'll bounce super high",
	"Avoid standing on lilypads for too long, they'll sink!"
]
var last = exposition.size()
var almost = last-1

func _ready() -> void:
	$SlideLabel.text = exposition[0]
	var stylebox = StyleBoxTexture.new()
	stylebox.texture = preload("res://assets/wooden-settings.png")
	$SlideLabel.add_theme_stylebox_override("normal", stylebox)
	$SlideLabel.add_theme_color_override("default_color", Color("#61453A"))
	$SlideLabel.add_theme_font_size_override("normal_font_size", 46)
	$SkipTextButton.pressed.connect(_skip_text)

func _skip_text():
	if ($SlideLabel.visible_ratio == 1):
		play_next()
		$AnimationPlayer.play("typing")
	else:
		$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
		
func play_next():
	if (currentIndex == almost):
		print("end of instructions")
		$SkipTextButton.visible = false
		finishedInstruction = true
	else:
		currentIndex += 1
		print(currentIndex)
		$SlideLabel.text = exposition[currentIndex]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (finishedInstruction):
		SceneTransition.change_scene("res://scenes/level_one.tscn")
