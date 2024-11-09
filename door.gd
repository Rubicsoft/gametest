extends Node3D

@onready var label = $Label3D
@onready var door_way = $Geometry/CSGBox3D2

@export var is_door_open: bool = false

func _input(event) -> void:
	# Get input for door toggle
	if event.is_action_pressed("open_door"):
		if is_door_open == false:
			is_door_open = true
		elif is_door_open == true:
			is_door_open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	open_door(is_door_open)

# Open and close door
func open_door(condition: bool) -> void:
	match condition:
		true:
			label.text = "Open"
			door_way.visible = true
		false:
			label.text = "Close"
			door_way.visible = false
