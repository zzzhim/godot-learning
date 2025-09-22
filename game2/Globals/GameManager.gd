extends Node

const GAME = preload("res://Scenes/Game/Game.tscn")
const MAIN = preload("res://UI/Main/Main.tscn")
const SIMPLE_TRANSITION = preload("res://UI/SimpleTransition/SimpleTransition.tscn")
const COMPLEX_TRANSITION = preload("uid://blrb03cuqkk5y")

var next_scene: PackedScene

func add_complex() -> void:
	var ct = COMPLEX_TRANSITION.instantiate()
	add_child(ct)

func load_game_scene() -> void:
	next_scene = GAME
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
func load_main_scene() -> void:
	next_scene = MAIN
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
