extends Control

func _ready() -> void:
	if Global.score == 999:
		$Label2.text = 'Failed,Try again'
	else:
		$Label2.text = 'High Score : ' + str(Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Confirm"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
