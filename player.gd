extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 15.0

var speed_multiplier = 60.0
var jump_multiplier = -70.0
var direction = 0

var is_hopping = false

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#sync project settings gravity with rigid body nodes
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.play("idle")

func _input(event):
	#if event.is_action_pressed("quit") and is_on_floor():
		#get_tree().quit()
	
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		$AnimatedSprite2D.play("jump")
		await get_tree().create_timer(.75).timeout
		$AnimatedSprite2D.play("idle")

	#handle jump down
	if event.is_action_pressed("move_down"):
		set_collision_mask_value(10, false)
	else:
		set_collision_mask_value(10, true)

func _physics_process(delta: float) -> void:
	if (GameState.bounce == true):
		velocity.y = jump_power * jump_multiplier
		is_hopping = true
		$AnimatedSprite2D.play("jump")
		GameState.bounce = false

	if not is_on_floor():
		velocity += get_gravity() * delta

	direction = Input.get_axis("move_left", "move_right")

	# Flip sprite to face direction
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0

	if not is_on_floor():
		velocity += get_gravity() * delta

	direction = Input.get_axis("move_left", "move_right")

	# Flip sprite to face direction
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0

	if is_on_floor():
		is_hopping = false  # reset when landed

		if direction != 0:
			# Hop left/right
			velocity.x = direction * speed * speed_multiplier
			velocity.y = jump_power * jump_multiplier
			if not is_hopping:
				is_hopping = true
				$AnimatedSprite2D.play("jump")
		elif Input.is_action_just_pressed("jump"):
			# Straight jump
			velocity.y = jump_power * jump_multiplier
			is_hopping = true
			$AnimatedSprite2D.play("jump")
		else:
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
			$AnimatedSprite2D.play("idle")
	else:
		if direction != 0:
			velocity.x = direction * speed * speed_multiplier
		else:
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier * delta)

	move_and_slide()
