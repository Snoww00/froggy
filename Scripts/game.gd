extends Node2D

var car_scene: PackedScene = preload("res://Scenes/yellow_car.tscn")

func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	print('Has entered!')


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $"Car start positions".get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered" , go_to_title)

func go_to_title(body):
	print(body)
	print('Player Car Collision')
