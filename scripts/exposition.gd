extends Control

var currentIndex := 0
var length = len(exposition)

var exposition: Array[String] = [
	"This is the story of the froggy prince..",
	"Once upon a time in a land far far away..",
	"More story line",
	"Yea"
]

var expo_photos: Array[String] = [
	"res://addons/expo-photos/expo1.png",
	"res://addons/expo-photos/expo2.png",
	"res://addons/expo-photos/expo3.png",
	"res://addons/expo-photos/expo4.png"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SlideLabel.text = exposition[0]
	$TextureRect.texture = load(expo_photos[0])
	
	$SlideLabel.position = Vector2(308, 56)
	$SkipTextButton.position = Vector2(1492, 42)

	var stylebox = StyleBoxTexture.new()
	stylebox.texture = preload("res://assets/wooden.png")
	# Apply the override to the "normal" style
	$SlideLabel.add_theme_stylebox_override("normal", stylebox)
	$SlideLabel.add_theme_color_override("default_color", Color("#61453A"))
	$SlideLabel.add_theme_font_size_override("normal_font_size", 46)
	$SkipTextButton.pressed.connect(_skip_text)

func _skip_text():
	# if text complete, play next
	if ($SlideLabel.visible_ratio == 1):
		play_next()
		$AnimationPlayer.play("typing")
	else:
		# if text still playing, skip to end
		$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)
		
func play_next():
	
	if (currentIndex == 3):
#		# go to next scene
		SceneTransition.change_scene("res://scenes/level_one.tscn")
	else:
		currentIndex += 1
		
		print(currentIndex)
		$SlideLabel.text = exposition[currentIndex]
		$TextureRect.texture = load(expo_photos[currentIndex])

	if (currentIndex > 0 && currentIndex < 2):
		print(currentIndex)
		$SlideLabel.position = Vector2(308, 793)
		$SkipTextButton.position = Vector2(1492, 779)
	
	if (currentIndex == 3):
		$SlideLabel.position = Vector2(308, 56)
		$SkipTextButton.position = Vector2(1492, 42)
	# hardcoded to 4, may change to array size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
