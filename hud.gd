extends Control
# add controls

var stylebox = StyleBoxTexture.new()

func _ready() -> void:
	$Settings.visible = false
	
	$Settings/VolumeLbl.add_theme_stylebox_override("normal", stylebox)
	$Settings/VolumeLbl.add_theme_color_override("default_color", Color("#61453A"))
	$Settings/VolumeLbl.add_theme_font_size_override("normal_font_size", 52)
	$Settings/VolumeLbl.text = "Music On/Off"
	
	$Settings/SFXLbl.add_theme_stylebox_override("normal", stylebox)
	$Settings/SFXLbl.add_theme_color_override("default_color", Color("#61453A"))
	$Settings/SFXLbl.add_theme_font_size_override("normal_font_size", 52)
	$Settings/SFXLbl.text = "SFX On/Off"

	$Settings/MenuLbl.add_theme_stylebox_override("normal", stylebox)
	$Settings/MenuLbl.add_theme_color_override("default_color", Color("#61453A"))
	$Settings/MenuLbl.add_theme_font_size_override("normal_font_size", 52)
	$Settings/MenuLbl.text = "Main Menu"

#func _process(delta: float) -> void:
	#pass

func _on_settings_button_pressed() -> void:
	if ($Settings.visible):
		$Settings.visible = false
	else:
		$Settings.visible = true

func _on_volume_btn_pressed() -> void:
	# mute all
	if ($GameState.muted == true):
		$GameState.muted = false;
		$Settings/VolumeLbl.text = "Music On"
	else:
		$GameState.muted = true;
		$Settings/VolumeLbl.text = "Music Off"

func _on_sfx_btn_pressed() -> void:
	# mute sfx
	if ($GameState.sfx_muted == true):
		$GameState.sfx_muted = false;
		$Settings/VolumeLbl.text = "SFX On"
	else:
		$GameState.sfx_muted = true;
		$Settings/VolumeLbl.text = "SFX Off"

func _on_menu_btn_pressed() -> void:
	SceneTransition.change_scene("res://scenes/title.tscn")
