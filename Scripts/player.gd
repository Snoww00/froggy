extends CharacterBody2D

@export var speed: float = 100.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	player_movement()

	
func player_movement() -> void:
	# 1. Get input direction for both axes at once (-1, 0, or 1)
	var input_direction = Input.get_vector( "move_left", "move_right","move_up", "move_down")
	
	# 2. Apply speed to the normalized direction vector
	velocity = input_direction * speed
	
	# 3. Move the character using Godot's built-in physics
	animation(input_direction)
	move_and_slide()
	
	#Handles animations
func animation(direction):
	if direction:
		sprite.flip_h = direction.x > 0
		if direction.x != 0:
			sprite.animation = 'left'
		else:
			sprite.animation ='up' if direction.y < 0 else 'down'
	else:
		sprite.frame = 0
		
