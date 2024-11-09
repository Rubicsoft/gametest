extends MeshInstance3D

@onready var sfx = $SFX

var is_collected: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print(is_collected)

func _on_area_3d_body_entered(body):
	sfx.play()
	if !is_collected:
		sfx.play()
		on_collected()
		is_collected = true

func on_collected() -> void:
	match is_collected:
		true:
			visible = false
		false:
			visible = true
