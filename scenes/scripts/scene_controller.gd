extends Node
	
func load_new_scene (packed_scene_to_load : PackedScene, capture_mouse_input : bool) -> void:

    #remove the currently loaded scene (if there is one)
	if $LoadedScene.get_children().size() > 1:
		$LoadedScene.get_child(0).queue_free()

	$LoadedScene.add_child(packed_scene_to_load.instantiate())

	if capture_mouse_input:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
