extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer2.play('dissolve')
	await $AnimationPlayer2.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer2.play_backwards('dissolve')
