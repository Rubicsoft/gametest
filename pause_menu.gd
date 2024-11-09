extends Control

@onready var menu_animation = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event) -> void:
	if event.is_action_pressed("esc") and !get_tree().paused:
		pause_game()

func _process(_delta) -> void:
	match get_tree().paused:
		true:
			visible = true
		false:
			visible = false

func pause_game() -> void:
	get_tree().paused = true

func resume_game() -> void:
	get_tree().paused = false

func _on_resume_button_pressed():
	resume_game()

func _on_quit_button_pressed():
	get_tree().quit()
