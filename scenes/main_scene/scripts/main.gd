extends Node

func _ready() -> void:
	var inital_scene : PackedScene = preload("res://scenes/location_scenes/test_level_scene/test_level.tscn")
	$SceneController.load_new_scene(inital_scene, true)
