extends Control

@onready var high_score_label: Label = $MarginContainer/HighScoreLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and event.is_echo() == false:
		GameManager.load_game_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	get_tree().paused = false
	high_score_label.text = "%04d" % ScoreManager.high_score
