extends CharacterBody3D

@onready var sprite = $AnimatedSprite3D

@export var SPEED: float = 2.5
@export var MOVEMENT_SMOOTHNESS: float = 10.0
const ROTATION_SPEED = 10.0

func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * SPEED * 100.0 * delta, MOVEMENT_SMOOTHNESS * delta)
		velocity.z = lerp(velocity.z, direction.z * SPEED * 100.0 * delta, MOVEMENT_SMOOTHNESS * delta)
		sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		sprite.play("idle")
	
	move_and_slide()
	sprite_orientation(input_dir.x)

func sprite_orientation(direction: float) -> void:
	if direction != 0:
		if direction >= 0:
			sprite.flip_h = false
		elif direction <= 0:
			sprite.flip_h = true
