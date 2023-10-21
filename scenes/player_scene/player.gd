extends CharacterBody3D

var SPEED : int = 6
var FAST_SPEED : int = 12

var mouse_sense : int = 600
var mouse_relative_x : float = 0
var mouse_relative_y : float = 0


func _physics_process(_delta: float) -> void:

    # Get the input direction and handle the movement/deceleration.
	var input_dir : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event : InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / mouse_sense
		$PlayerCamera.rotation.x -= event.relative.y / mouse_sense
		$PlayerCamera.rotation.x = clamp($PlayerCamera.rotation.x, deg_to_rad(-90), deg_to_rad(90) )
		mouse_relative_x = clamp(event.relative.x, -50, 50)
		mouse_relative_y = clamp(event.relative.y, -50, 10)