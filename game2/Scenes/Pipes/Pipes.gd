extends Node2D

@onready var laser: Area2D = $Laser

const SPEED: float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	print("position ready", position)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = position.x - SPEED * delta

	# 获取当前位置在屏幕上的x坐标
	var x = global_position.x
	# 如果x坐标小于屏幕的宽度，则die
	if x < -300.0:
		die()

#func _on_screen_exited() -> void:
	#print("_on_screen_exited")
	#die()
	
func die() -> void:
	set_process(false)
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
	if body is Tappy:
		body.die()
		
func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_on_point_scored()
