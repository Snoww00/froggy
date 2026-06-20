extends Area2D

var direction = Vector2.LEFT
var speed = 150
var colors = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/yellow.png"),
	preload("res://graphics/cars/red.png"),]

# 1. Track where the car spawned
var start_position : Vector2
# 2. Max distance the car can drive before disappearing (in pixels)
var max_travel_distance = 450.0 

func _ready() -> void:
	if position.x <0:
		direction.x = 1
		$Sprite2D.flip_h = true
	$Sprite2D.texture = colors.pick_random()
		
	# Save the exact spot where this car was created
	start_position = position

func _process(_delta: float) -> void:
	position += direction * speed * _delta
	
	# 3. Measure how far the car has traveled from its spawn point
	var distance_traveled = position.distance_to(start_position)
	
	# 4. If it drove past our max limit, delete it safely
	if distance_traveled > max_travel_distance:
		queue_free()
