extends Control

var currentIndex := 0
var length = len(exposition)

var exposition: Array[String] = [
	"In a quiet little home, Frogyu sleeps peacefully through the night.",
	"But tonight, a curious dream begins to take shape In the distance, a mysterious princess appears.",
	"Though they share no words, his heart feels drawn to her.",
	"Suddenly, Frogyu awakens from his dream. But the memory of the princess lingers in his mind. He must find her!"
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
	
	stylebox.content_margin_right = 100
	stylebox.content_margin_left = 100
	
	stylebox.content_margin_top = 50
	stylebox.content_margin_bottom = 50
	
	stylebox.texture = preload("res://assets/wooden.png")
	
	$SlideLabel.add_theme_color_override("default_color", Color("#61453A"))
	$SlideLabel.add_theme_font_size_override("normal_font_size", 46)
	
	$SlideLabel.add_theme_stylebox_override("normal", stylebox)
	
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
		SceneTransition.change_scene("res://intro.tscn")
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
