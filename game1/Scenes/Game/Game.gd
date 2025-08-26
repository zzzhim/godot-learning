extends Node2D

const EXPLODE = preload("res://assets/explode.wav")
const GEM = preload("res://Scenes/Gem/Gem.tscn")
const MARGIN: float = 70
@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var sound: AudioStreamPlayer = $Sound


func _ready() -> void:
	spawn_gem()

func spawn_gem() -> void:
	var new_gem = GEM.instantiate()
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN,
	)
	new_gem.position = Vector2(x_pos, -50)
	new_gem.connect("gem_off_screen", _on_gem_off_screen)

	# 添加调试：检查信号是否存在
	if new_gem.has_signal("gem_off_screen"):
		print("信号连接成功！")
	else:
		print("警告：Gem 没有 gem_off_screen 信号！检查 gem.gd")

	add_child(new_gem)
	
func stop_all() -> void:
	sound.stop()
	sound.stream = EXPLODE
	sound.play()
	spawn_timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is OurGem:
			child.set_process(false)
			


func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision ", area)
	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()



func _on_gem_off_screen() -> void:
	print("geame:: game_over ")
	stop_all()

func _on_timer_timeout() -> void:
	spawn_gem()
