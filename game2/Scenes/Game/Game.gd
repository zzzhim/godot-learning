extends Node2D

const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")

@onready var pipes_holder: Node2D = $PipesHolder
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint
@onready var game_ui: Control = $CanvasLayer/GameUI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_pipes()
	
func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)
	
func spawn_pipes() -> void:
	var np = PIPES.instantiate()
	var y_pos: float = randf_range(
		upper_point.position.y,
		lower_point.position.y
	)
	np.position = Vector2(
		lower_point.position.x,
		y_pos
	)
	pipes_holder.add_child(np)
	
	
func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
	
func _on_plane_died() -> void:
	get_tree().paused = true
