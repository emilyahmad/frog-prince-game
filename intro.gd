extends Node2D

func _process(delta: float) -> void:
	pass

var finishedInstruction = false
var currentIndex := 0
var exposition: Array[String] = [
	"Alright Frogyu, ready to navigate the forest? (Finish instructions before progressing!)",
	"Hop through the swamp and use mushrooms to bounce extra high. Make sure you don't fall in the water!",
	"Waiting on lilypads for too long will cause you and them to sink..",
	"Good luck little Frogyu! BTW you should probably head this way -->"
]
var last = exposition.size()
var almost = last-1

func _ready() -> void:
	#GameState.died = false
	$SlideLabel.text = exposition[0]
	var stylebox = StyleBoxTexture.new()
	stylebox.texture = preload("res://assets/wooden-settings.png")
	
	stylebox.content_margin_right = 75
	stylebox.content_margin_left = 75
	
	stylebox.content_margin_top = 50
	stylebox.content_margin_bottom = 50
	
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
	if (currentIndex == almost-1):
		print("end of instructions")
		$SkipTextButton.visible = false
		finishedInstruction = true
		$SlideLabel.text = exposition[almost]
	else:
		print(currentIndex)
		currentIndex += 1
		$SlideLabel.text = exposition[currentIndex]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (finishedInstruction):
		SceneTransition.change_scene("res://scenes/level_one.tscn")
#
func _on_water_body_entered(body: CharacterBody2D) -> void:
	SceneTransition.change_scene("res://scenes/intro.tscn")
	GameState.died = true
	$Player.position = Vector2(287,827)
