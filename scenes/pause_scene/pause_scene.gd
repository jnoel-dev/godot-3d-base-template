extends Control

func _ready() -> void:
    visible = false

func _input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("pause_game"):
        get_tree().paused =! get_tree().paused
        visible =! visible
        match Input.mouse_mode:
            Input.MOUSE_MODE_VISIBLE:
                Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
            Input.MOUSE_MODE_CAPTURED:
                Input.mouse_mode = Input.MOUSE_MODE_VISIBLE